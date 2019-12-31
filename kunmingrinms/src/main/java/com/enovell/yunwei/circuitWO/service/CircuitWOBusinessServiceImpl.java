package com.enovell.yunwei.circuitWO.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.system.service.UserService;
import com.enovell.yunwei.util.DataExistStatus;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

@Transactional
@Service("circuitBusinessService")
public class CircuitWOBusinessServiceImpl implements CircuitWOBusinessService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name="circuitWOService")
	private CircuitWOService circuitWOService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	@Resource(name="circuitWOHistoryService")
	private CircuitWOHistoryService historyService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Override
	public void autoFile(CircuitWO root, String string) {
		root = circuitWOService.getById(root.getId());
		if(!root.getStatus().equals(CircuitWO.DAI_GUI_DANG)){
			return;
		}
		file(root);
		//保存流水
		historyService.addCircuitWOHistory(
				CircuitWO.DAI_GUI_DANG, CircuitWO.YI_GUI_DANG,root, root.getOwner(),"任务归档");
	}

	/**    
	 * file 归档
	 * @param taskRoot
	 */
	private void file(CircuitWO taskRoot) {
		taskRoot.setStatus(CircuitWO.YI_GUI_DANG);
		taskRoot.setFileDate(new Date());
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		// 将子任务的状态也全部设置成已归档
		setChildStatusForFile(taskRoot);
	}

	/**    
	 * setChildStatusForFile 修改所有子任务（及跟任务下的所有子任务）的状态为已归档-5
	 * @param taskRoot 跟任务
	 */
	private void setChildStatusForFile(CircuitWO taskRoot) {
		String sql = " UPDATE CIRCUIT_WORK_ORDER SET status_ =:status "
						 + " WHERE root_id_ = :rootId " 
						 + " AND status_ NOT IN( :statusList) " ;
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		String[] statusList={CircuitWO.SHEN_HE_TONG_GUO, CircuitWO.SHEN_HE_BU_TONG_GUO, CircuitWO.YI_TUI_HUI};
		//审核通过、审核不通过、已退回的子任务不进行归档处理
		query.setParameter("status", CircuitWO.YI_GUI_DANG);//已归档
		query.setParameter("rootId", taskRoot.getId());
		query.setParameterList("statusList", statusList);
		query.executeUpdate();
	}

	@Override
	public CircuitWO addAndSendCircuitWO(CircuitWO taskRoot, UploadFileDto[] dtos) {
		// 附件变更
		changeAttachFile(taskRoot, dtos, taskRoot.getCreatUser());
		//保存任务
		taskRoot = circuitWOService.addCircuitWO(taskRoot);
		//派送任务
		send(taskRoot);
		//保存流水
		historyService.addCircuitWOHistory(
				CircuitWO.CAO_GAO, CircuitWO.DAI_JIE_SHOU, taskRoot, taskRoot.getSendUser(), "新增并派发");
		return taskRoot;
	}


	/**
	 * send 派发
	 * @param taskRoot
	 * @return
	 */
	private CircuitWO send(CircuitWO taskRoot){
		// 根据接收人创建子任务
		Set<User> receiveUserSet = taskRoot.getReceiveUsers();
		for(User receiveUser:receiveUserSet){
			CircuitWO taskChild = new CircuitWO();
			taskChild.setStatus(CircuitWO.DAI_JIE_SHOU);
			taskChild.setRoot(taskRoot);
			taskChild.setOwner(receiveUser);
			taskChild.setCreateTime(new Date());
			taskChild.setIsRoot(CircuitWO.IS_NOT_ROOT);
			taskChild.setPanrentTask(taskRoot);
			sessionFactory.getCurrentSession().save(taskChild);
		}
		// 根任务状态修改为待接收
		taskRoot.setStatus(CircuitWO.DAI_JIE_SHOU);
		taskRoot.setSendDate(new Date());
		taskRoot.setSendUser(taskRoot.getOwner());
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		return taskRoot;
	}

	/**
	 * changeAttachFile 改变附件，用于新增、新增并派发、修改、修改并派发
	 * @param taskRoot 所属任务
	 * @param dtos 上传文件
	 * @param user 登录用户
	 */
	private void changeAttachFile(CircuitWO taskRoot, UploadFileDto[] dtos, User creatUser) {
		// 存在附件,则必然是修改操作
		if (taskRoot.getTaskAttachFile() != null) {
			String attachFileId = taskRoot.getTaskAttachFile().getId();
			attachFileService.updateAttachFile(dtos, attachFileId);
		} else {// 不存在附件,则有可能是新增也有可能是修改(修改的时候原附件为空相当于也是新增)
				// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, creatUser);
			taskRoot.setTaskAttachFile(attachFile);
		}
	}

	@Override
	public CircuitWO add(CircuitWO taskRoot, UploadFileDto[] dtos) {
		// 附件变更
		changeAttachFile(taskRoot, dtos, taskRoot.getCreatUser());
		circuitWOService.addCircuitWO(taskRoot);
		return taskRoot;
	}

	@Override
	public CircuitWO updateAndSendCircuitWO(CircuitWO paramTask, UploadFileDto[] dtos, User user) throws Exception {
		//查询被修改的任务设置改变的字段
		CircuitWO taskRoot = circuitWOService.getById(paramTask.getId());
		changeAttachFile(taskRoot, dtos, user);// 附件变更
		//判断子任务是否已经分派，若已经分派，则不能进行修改操作
		if(validateIsNotAssign(taskRoot)){
			String statusOld=taskRoot.getStatus();//派发前的状态，用于记录流水
			//修改并保存
			taskRoot = setChangeDatasOfTask(paramTask, taskRoot);
			//派发任务、更新父任务
			send(taskRoot);
			//记录流水
			historyService.addCircuitWOHistory(
					statusOld, CircuitWO.DAI_JIE_SHOU, taskRoot, taskRoot.getSendUser(), "修改并派发");
		}
		return taskRoot;
	}

	/**    
	 * setChangeDatasOfTask 设置修改的字段并更新
	 * @param paramTask 保存修改字段的记录
	 * @param taskRoot 被修改的记录
	 * @return
	 */
	private CircuitWO setChangeDatasOfTask(CircuitWO paramTask, CircuitWO taskRoot){
		taskRoot.setTitle(paramTask.getTitle());
		taskRoot.setLimitTime(paramTask.getLimitTime());
		taskRoot.setTaskType(paramTask.getTaskType());
		taskRoot.setTaskLevel(paramTask.getTaskLevel());
		taskRoot.setRemark(paramTask.getRemark());
		taskRoot.setSendDate(null);
		
		taskRoot.setReceiveUsers(paramTask.getReceiveUsers());
		taskRoot.setCarbonCopyUser(paramTask.getCarbonCopyUser());
		//删除原有的子任务
		deleteChildren(taskRoot);
		//更新任务
		circuitWOService.updateCircuitWO(taskRoot);
		return taskRoot;
	}

	/**
	 * 
	 * deleteChildren 递归循环逻辑删除子
	 * @param deleteObj
	 */
	private void deleteChildren(CircuitWO deleteObj) {
		if (deleteObj.getChildren() != null) {
			Iterator<CircuitWO> it = deleteObj.getChildren().iterator();
			while (it.hasNext()) {
				CircuitWO temp = it.next();
				temp.setExist(DataExistStatus.NOT_EXIST);// 改为不存在,及逻辑删除
				deleteChildren(temp);
				sessionFactory.getCurrentSession().saveOrUpdate(temp);
			}
		}
	}
	/**    
	 * validateIsNotAssign 根据根任务，判断一级子任务是否有分派处理
	 * 有分派，不能进行修改 
	 * @param root 根任务
	 * @return true-代表未分派过，false代表已分派过
	 * @throws Exception 
	 */
	private boolean validateIsNotAssign(CircuitWO root) throws Exception{
		boolean isNotAssign=true;
		Set<CircuitWO> children=root.getChildren();
		for(CircuitWO child : children){
			if(CircuitWO.YI_FEN_PAI.equals(child.getStatus())){
				isNotAssign=false;
				throw new Exception("修改失败，受理人已分派！");
			}
		}
		return isNotAssign;
	}

	@Override
	public void updateAndSave(CircuitWO paramTask, UploadFileDto[] dtos, User user) throws Exception {
		//查询被修改的任务设置改变的字段
		CircuitWO taskRoot = circuitWOService.getById(paramTask.getId());
		changeAttachFile(taskRoot, dtos, user);
		if(validateIsNotAssign(taskRoot)){
			String statusOld=taskRoot.getStatus();//修改前的状态，用于记录流水
			taskRoot = setChangeDatasOfTask(paramTask, taskRoot);
			//保存流水
			historyService.addCircuitWOHistory(
					statusOld, CircuitWO.CAO_GAO, taskRoot, taskRoot.getOwner(), "修改并保存");
		}
	}

	@Override
	public CircuitWO sendToCheck(String id, String receiveUserId) {
		// 根据接收人创建子任务,单向关联
		CircuitWO taskRoot = circuitWOService.getById(id);
		String statusOld = taskRoot.getStatus();//保存原状态，记录流水
		saveCheckCircuitWO(receiveUserId, taskRoot);// 保存审核数据
		// 根任务状态修改为待审核
		taskRoot.setStatus(CircuitWO.DAI_SHEN_HE);
		taskRoot.setSendDate(new Date());
		taskRoot.setSendUser(taskRoot.getOwner());
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		//记录流水
		historyService.addCircuitWOHistory(
				statusOld, CircuitWO.DAI_SHEN_HE, taskRoot, taskRoot.getOwner(), "发送审核");
		return taskRoot;
	}
	
	/**
	 * saveCheckTask 保存审核任务的数据
	 * @param receiveUserId 审核人
	 * @param taskRoot 审核任务
	 */
	private void saveCheckCircuitWO(String receiveUserId, CircuitWO taskRoot){
		User receiveUser = userService.getUserById(receiveUserId);
		CircuitWO tempTaskChild = new CircuitWO();
		tempTaskChild.setStatus(CircuitWO.DAI_SHEN_HE);
		tempTaskChild.setRoot(taskRoot);
		tempTaskChild.setPanrentTask(taskRoot);
		tempTaskChild.setOwner(receiveUser);
		tempTaskChild.setCreateTime(new Date());
		tempTaskChild.setIsRoot(CircuitWO.IS_NOT_ROOT);
		tempTaskChild.setSendDate(new Date());
		sessionFactory.getCurrentSession().save(tempTaskChild);
	}

	@Override
	public CircuitWO sendCircuitWO(String id) {
		CircuitWO taskRoot = circuitWOService.getById(id);
		String statusOld=taskRoot.getStatus();//保存原状态，记录流水
		taskRoot=send(taskRoot);
		//保存流水
		historyService.addCircuitWOHistory(
				statusOld, CircuitWO.DAI_JIE_SHOU, taskRoot, taskRoot.getOwner(), "派发");
		return taskRoot;
	}

	@Override
	public String updateSelectUsers(String taskId, List<String> receiveUserIds, User user) {
		List<Object> historyUsers = getReceiveUsersByTaskId(taskId);// 获取该任务历史派发人
		List<String> historyUserIds = new ArrayList<String>();
		for (Object object : historyUsers) {
			historyUserIds.add(object.toString());
		}
		// 如果新增派发人员和历史派发人员相同,则直接跳出
		if(receiveUserIds.containsAll(historyUserIds)&&historyUserIds.containsAll(receiveUserIds)){
			return "1";
		}
		deleteReceiveUsers(taskId);// 删除原有所有的执行人
		insertReceiveUsers(taskId, receiveUserIds);// 新增最新的执行人
		
		List<String> deleteUserIds = new ArrayList<String>();
		List<String> newUserIds = new ArrayList<String>();
		CircuitWO taskRoot = circuitWOService.getById(taskId);// 获取该任务信息
		if (!CircuitWO.CAO_GAO.equals(taskRoot.getStatus())) {
			List<String> notChangeUserIds = getNotChangeUser(historyUserIds, receiveUserIds);
			historyUserIds.removeAll(notChangeUserIds);// 历史人员除去不变人员,得到被删除的人员
			deleteUserIds = historyUserIds;//被删掉的派发人员
			receiveUserIds.removeAll(notChangeUserIds);// 最新的人员除去不变的人员,得到新增的人员
			newUserIds = receiveUserIds;//新增的派发人员
		}else {// 草稿状态下,取出所有的执行人进行子任务的保存
			newUserIds = receiveUserIds;
		}
		// 根据新增的派发人员或者删除的派发人员,进行新增或删除操作
		editSelectUserByDelOrNew(deleteUserIds, newUserIds, taskRoot, user);
		
		return null;
	}

	/**
	 * editSelectUserByDelOrNew 根据新增的派发人员或者删除的派发人员,进行新增或删除操作
	 * @param deleteUserIds 被删掉的派发人员
	 * @param newUserIds 新增的派发人员
	 * @param taskRoot 该任务信息
	 * @param user 登录用户
	 */
	private void editSelectUserByDelOrNew(List<String> deleteUserIds, List<String> newUserIds, CircuitWO taskRoot, User user){
		// 定义状态的开关(true-子任务的状态全部是待接收,则主任务的状态也为待接收；否则主任务的状态为处理中)
		boolean statusToggle = false;
		// 有新增的派发人员，也有删除的派发人员
		if (deleteUserIds.size() != 0 && newUserIds.size() != 0) {
			newUserIdsAndDeleteUserIds(statusToggle, deleteUserIds, newUserIds, taskRoot, user);
		}
		// 只有新增的派发人员
		else if (newUserIds.size() != 0) {
			onlyNewUserIds(statusToggle, taskRoot, newUserIds, user);
		}
		// 只有删除的派发人员
		else if (deleteUserIds.size() != 0) {
			// 首先删除子任务
			onlyDeleteUserIds(statusToggle, taskRoot, deleteUserIds);
			// 再判断是否归档
			boolean isAutoFileBoolean = isAutoFile(taskRoot);
			if (isAutoFileBoolean) {
				file(taskRoot);
				//保存流水
				historyService.addCircuitWOHistory(taskRoot.getStatus(),
						CircuitWO.YI_GUI_DANG, taskRoot, taskRoot.getOwner(), "变更执行人中，任务归档");
			}
		}
	}

	/**
	 * isAutoFile 判断是否可以归档
	 * @param taskRoot 该任务信息
	 * @return true-可以归档，否则不可以
	 */
	private boolean isAutoFile(CircuitWO taskRoot){
		boolean isAutoFileBoolean = false;// 是否归档状态的开关
		// 取出所有的子任务
		Set<CircuitWO> children = taskRoot.getChildren();
		for (CircuitWO child : children) {
			if (child.getExist()) {
				if (CircuitWO.YI_HUI_FU.equals(child.getStatus())
						|| CircuitWO.YI_GUI_DANG.equals(child.getStatus())
						|| CircuitWO.SHEN_HE_TONG_GUO.equals(child.getStatus())) {
					isAutoFileBoolean = true; // // 子任务中只有存在已回复、已归档、审核通过的数据才能进行归档
				}else {
					isAutoFileBoolean = false;
					break; // 一旦出现其他状态就不归档
				}
			}
		}
		return isAutoFileBoolean;
	}
	
	/**
	 * onlyDeleteUserIds 只有删除的派发人员
	 * @param statusToggle 定义状态的开关(true-子任务的状态全部是待接收,则主任务的状态也为待接收；否则主任务的状态为处理中)
	 * @param taskRoot 该任务信息
	 * @param deleteUserIds 被删掉的派发人员
	 */
	private void onlyDeleteUserIds(boolean statusToggle, CircuitWO taskRoot, List<String> deleteUserIds){
		statusToggle = deleteUsers(taskRoot, deleteUserIds);
		if (statusToggle) {
			taskRoot.setStatus(CircuitWO.DAI_JIE_SHOU);
			sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		}
	}

	/**
	 * onlyNewUserIds 只有新增的派发人员
	 * @param statusToggle 定义状态的开关(true-子任务的状态全部是待接收,则主任务的状态也为待接收；否则主任务的状态为处理中)
	 * @param taskRoot 该任务信息
	 * @param newUserIds 新增的派发人员
	 * @param user 登录用户
	 */
	private void onlyNewUserIds(boolean statusToggle, CircuitWO taskRoot, List<String> newUserIds, User user){
		String status = taskRoot.getStatus();
		// 如果主任务状态为处理中或已归档,
		if (!CircuitWO.CHU_LI_ZHONG.equals(status) && !CircuitWO.YI_GUI_DANG.equals(status)) {
			statusToggle = true;
		}
		saveNewUsers(taskRoot, newUserIds, user, statusToggle);
	}

	/**
	 * newUserIdsAndDeleteUserIds 有新增的派发人员，也有删除的派发人员
	 * @param statusToggle 定义状态的开关(true-子任务的状态全部是待接收,则主任务的状态也为待接收；否则主任务的状态为处理中)
	 * @param deleteUserIds 被删掉的派发人员
	 * @param newUserIds 新增的派发人员
	 * @param taskRoot 该任务信息
	 * @param user 登录用户
	 */
	private void newUserIdsAndDeleteUserIds(boolean statusToggle, List<String> deleteUserIds, List<String> newUserIds,
			CircuitWO taskRoot, User user) {
		if (deleteUserIds.size() != 0 && newUserIds.size() != 0) {
			statusToggle = deleteUsers(taskRoot, deleteUserIds);
			saveNewUsers(taskRoot, newUserIds, user, statusToggle);
		}
	}

	/**
	 * saveNewUsers 保存操作,保存新的派发人员的任务并记录流水
	 * @param taskRoot 任务信息对象
	 * @param newUserIds 新的派发人员
	 * @param user 当前登陆人
	 * @param statusToggle 定义状态的开关(true-子任务的状态全部是待接收,则主任务的状态也为待接收；否则主任务的状态为处理中)
	 */
	private void saveNewUsers(CircuitWO taskRoot, List<String> newUserIds, User user, boolean statusToggle){
		saveChilderTasks(taskRoot, newUserIds);
		String status = taskRoot.getStatus();
		String historyEndStatus = "";// 定义流水的结束状态
		// 如果操作任务的状态为草稿
		if (CircuitWO.CAO_GAO.equals(status)){
			taskRoot.setSendUser(user);// 派发人
			taskRoot.setSendDate(new Date());// 派发时间
			taskRoot.setStatus(CircuitWO.DAI_JIE_SHOU);// 状态改为待接收
			historyEndStatus = status;
		} else if (statusToggle) {// 子任务全部是待接收
			// 根任务状态修改为待接收
			taskRoot.setStatus(CircuitWO.DAI_JIE_SHOU);
			historyEndStatus = CircuitWO.DAI_JIE_SHOU;
		} else {// 其他状态进行新增执行人,根状态必定是处理中
			// 根任务状态修改为处理中
			taskRoot.setStatus(CircuitWO.CHU_LI_ZHONG);
			historyEndStatus = CircuitWO.CHU_LI_ZHONG;
		}
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		//保存流水
		historyService.addCircuitWOHistory(status, historyEndStatus,
				taskRoot, taskRoot.getOwner(), "变更执行人中，新增人员");
	}

	/**
	 * saveChilderTasks 根据新增的派发人员，保存子任务数据
	 * @param taskRoot 父任务的信息
	 * @param newUserIds 新的派发人员
	 */
	private void saveChilderTasks(CircuitWO taskRoot, List<String> newUserIds){
		// 根据接收人创建子任务
		for (String newUserId : newUserIds) {
			CircuitWO taskChild = new CircuitWO();
			taskChild.setStatus(CircuitWO.DAI_JIE_SHOU);
			taskChild.setRoot(taskRoot);
			User receiveUser = new User();
			receiveUser.setId(newUserId);
			taskChild.setOwner(receiveUser);
			taskChild.setCreateTime(new Date());
			taskChild.setIsRoot(CircuitWO.IS_NOT_ROOT);
			taskChild.setPanrentTask(taskRoot);
			sessionFactory.getCurrentSession().save(taskChild);
		}
	}

	/**
	 * 
	 * deleteUsers 删除操作,被删除的派发人员的任务并记录流水
	 * @param taskRoot
	 * @param deleteUserIds 被删除的派发人员
	 * @return true-子任务的状态全部是待接收,则主任务的状态也为待接收；否则主任务的状态为处理中
	 */
	private boolean deleteUsers(CircuitWO taskRoot, List<String> deleteUserIds) {
		// 取出所有的子任务
		Set<CircuitWO> children = taskRoot.getChildren();
		String delUserNames = deleteChilderTasks(children, deleteUserIds);
		String historyEndStatus = "";// 定义流水的结束状态
		// 定义状态的开关(true-子任务的状态全部是待接收,则主任务的状态也为待接收；否则主任务的状态为处理中)
		boolean statusToggle = false;
		for (CircuitWO child : children) {
			if (child.getExist()) {// 数据存在
				if(CircuitWO.DAI_JIE_SHOU.equals(child.getStatus())// 待接收
						|| CircuitWO.SHEN_HE_TONG_GUO.equals(child.getStatus())){// 审核通过
					statusToggle = true;
					historyEndStatus = CircuitWO.DAI_JIE_SHOU;
				} else {
					statusToggle = false;// 一旦出现其他状态,则终止
					historyEndStatus = CircuitWO.CHU_LI_ZHONG;
					break;
				}
			} else {// 如果全部删除,再新增,则根任务状态肯定是待接收
				statusToggle = true;
				historyEndStatus = CircuitWO.DAI_JIE_SHOU;
			}
		}
		// 保存流水
		historyService.addCircuitWOHistory(taskRoot.getStatus(), historyEndStatus,
				taskRoot, taskRoot.getOwner(), "变更执行人中，删除的人员有：" + delUserNames.substring(1));
		return statusToggle;
	}

	/**
	 * deleteChilderTasks 根据删除派发人员，删除子任务
	 * @param children 该任务下的所有的子任务
	 * @param deleteUserIds 被删除的派发人员
	 * @return 删除派发人员名的字符串集合,用于记录流水
	 */
	private String deleteChilderTasks(Set<CircuitWO> children, List<String> deleteUserIds){
		String delUserNames = "";// 删除派发人员名的集合,用于记录流水
		for (CircuitWO child : children) {
			if (child.getExist()) {// 数据存在
				// 取出子任务的调度人
				User childrenUser = child.getOwner();
				for (String deleteUserId : deleteUserIds) {
					// 如果删除的派发人员存在于子任务里,则删除该子任务
					if (deleteUserId.equals(childrenUser.getId())) {
						deleteChildren(child);
						child.setExist(DataExistStatus.NOT_EXIST);// 改为不存在,及逻辑删除
						sessionFactory.getCurrentSession().saveOrUpdate(child);
						delUserNames = delUserNames + "," + childrenUser.getName();
					}
				}
			}
		}
		return delUserNames;
	}

	/**
	 * getHistoryAndAddUser 得到不变的派发人员
	 * @param historyUserIds 历史派发人员
	 * @param receiveUserIds 新选的派发人员
	 * @return 
	 * @author quyy
	 */
	private List<String> getNotChangeUser(List<String> historyUserIds,List<String> receiveUserIds){
		List<String> result = new ArrayList<String>();
		for (String receiveUserId : receiveUserIds) {
			for (String historyUserId : historyUserIds) {
				if(receiveUserId.equals(historyUserId)){
					result.add(receiveUserId);
				}
			}
		}
		return result;
	}
	
	/**
	 * insertReceiveUsers 新增最新的执行人
	 * @param taskId 任务ID
	 * @param users 执行人
	 */
	private void insertReceiveUsers(String taskId, List<String> receiveUserIds){
		String sql = "INSERT INTO CIRCUIT_WORK_ORDER_USER(TASKROOT_ID_,USER_ID_) VALUES(:taskId,:userId) ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		for (String userId : receiveUserIds) {
			query.setParameter("taskId", taskId);
			query.setParameter("userId", userId);
			query.executeUpdate();
		}
	}

	/**
	 * deleteReceiveUsers 删除原有的执行人
	 * @param taskId 任务ID
	 */
	private void deleteReceiveUsers(String taskId){
		String hql = "DELETE FROM CIRCUIT_WORK_ORDER_USER t WHERE t.taskroot_id_ =:id ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);
		query.setParameter("id", taskId);
		query.executeUpdate();
	}
	/**
	 * getReceiveUsersByTaskId 根据任务ID查询执行人
	 * @param taskId 任务ID
	 * @return List<Object> 用户对象集合
	 */
	@SuppressWarnings("unchecked")
	private List<Object> getReceiveUsersByTaskId(String taskId){
		String sql = "select t.USER_ID_ from CIRCUIT_WORK_ORDER_USER t where t.taskroot_id_ =:taskId ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("taskId", taskId);
		return query.list();
	}

	@Override
	public void resend(String id, String receiveUserId) {
		//接收人
		User user = userService.getUserById(receiveUserId);
		//删除传入的数据
		CircuitWO delTask = circuitWOService.getById(id);
		// 如果主任务分派给了车间,车间分派给了工区,工区退回任务,在退回处重派,则第一执行人不发生改变(多级分派)
		// 如果主任务分派给了车间,车间退回任务,在退回处重派,则第一执行人发生改变(一次派发)
		if (!CircuitWO.YI_FEN_PAI.equals(delTask.getPanrentTask().getStatus())) {
			// 取出原有的执行人ID
			String historyUserId = delTask.getOwner().getId();
			// 取出根任务ID
			String taskRootId = delTask.getRoot().getId();
			// 删除中间表中原有的执行人
			deleteOriginalReceiveUser(taskRootId, historyUserId);
			List<String> receiveUserIds = new ArrayList<String>();
			receiveUserIds.add(user.getId());
			// 新增中间表执行人
			insertReceiveUsers(taskRootId, receiveUserIds);
		}
		if (delTask != null) {
			CircuitWO tempTaskChild = new CircuitWO();
			tempTaskChild.setStatus(CircuitWO.DAI_JIE_SHOU);
			tempTaskChild.setIsRoot(CircuitWO.IS_NOT_ROOT);
			tempTaskChild.setOwner(user);
			tempTaskChild.setRoot(delTask.getRoot());
			tempTaskChild.setPanrentTask(delTask.getPanrentTask());
			sessionFactory.getCurrentSession().save(tempTaskChild);
			//保存流水
			historyService.addCircuitWOHistory(CircuitWO.YI_TUI_HUI, CircuitWO.DAI_JIE_SHOU,delTask.getRoot(), delTask.getPanrentTask().getOwner(),"任务退回后，重派任务");
			// 删除当前任务
			delTask.setExist(DataExistStatus.NOT_EXIST);
			sessionFactory.getCurrentSession().saveOrUpdate(delTask);
		}
	}

	/**
	 * deleteOriginalReceiveUser 删除原有的执行人
	 * @param taskId 任务ID
	 * @param userId 执行人ID
	 */
	private void deleteOriginalReceiveUser(String taskId, String userId){
		String hql = "DELETE FROM CIRCUIT_WORK_ORDER_USER t WHERE t.taskroot_id_ =:id AND t.user_id_ =:userId";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);
		query.setParameter("id", taskId);
		query.setParameter("userId", userId);
		query.executeUpdate();
	}

	@Override
	public CircuitWO delBackCircuitWO(String id, User user) {
		CircuitWO delTask = circuitWOService.getById(id);
		setPanrentStatusForDel(delTask);
		
		//保存流水放在
		historyService.addCircuitWOHistory(CircuitWO.YI_TUI_HUI, CircuitWO.YI_GUI_DANG,delTask.getRoot(), user,"删除已退回任务");
		// 删除
		circuitWOService.deleteCircuitWOById(delTask.getId(), user);
		// 自动归档
		autoFile(delTask.getRoot(), "删除退回任务后自动归档");
		
		return delTask;
	}

	/**
	 * 退回删除后设置父任务状态 如果父为根任务且删除的任务是最后一条，则设置父状态为“草稿”，否则状态不变
	 * 如果父为子任务且删除的任务是最后一条，则设置父状态为“待接收”,否则状态不变
	 * 如果删除的任务不是最后一条，同级的其他任务都处于已回复状态，则设置父的状态为“待归档”
	 * @param taskChild
	 */
	private void setPanrentStatusForDel(CircuitWO taskRoot) {
		CircuitWO parent = taskRoot.getPanrentTask();
		
		if(parent == null){
			return;
		}
		if (checkLastOne(parent)) {//若待删除的任务 是 最后一个任务
			if (CircuitWO.IS_ROOT.equals(parent.getIsRoot())) {//若父任务是根
				parent.setStatus(CircuitWO.CAO_GAO);
			} else {
				parent.setStatus(CircuitWO.DAI_JIE_SHOU);
				parent.setAssignRemark(null);//分派备注为空
			}
		} else {//若待删除的任务 不是 最后一个任务
			if (checkOtherAllReply(taskRoot)) {// 判断其他同级是否都是已回复
				if(CircuitWO.IS_ROOT.equals(parent.getIsRoot())){//是根
					parent.setStatus(CircuitWO.DAI_GUI_DANG);
				}else {
					parent.setStatus(CircuitWO.YI_HUI_FU);
				}
				setPanrentStatusForDel(parent);// 递归
			}
		}
		sessionFactory.getCurrentSession().saveOrUpdate(parent);
	}
	
	/**
	 * 验证其他统计任务是否都是“已回复”、“审批通过”、“审批不通过”（当前任务不在比较范围）
	 * @param panrent
	 * @return boolean 验证结果
	 */
	@SuppressWarnings("unchecked")
	private boolean checkOtherAllReply(CircuitWO taskRoot) {
		Boolean isFinish = true;
		String hql = " FROM CircuitWO WHERE panrentTask = :panrentTask AND exist =:exist";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", taskRoot.getPanrentTask());
		query.setParameter("exist", DataExistStatus.EXIST);
		List<CircuitWO> list = query.list();
		for (CircuitWO child : list) {
			if (!child.getStatus().equals(CircuitWO.YI_HUI_FU)
					&&!CircuitWO.YI_GUI_DANG.equals(child.getStatus())// 用于变更执行人
					&&!CircuitWO.SHEN_HE_TONG_GUO.equals(child.getStatus())
					&&!CircuitWO.SHEN_HE_BU_TONG_GUO.equals(child.getStatus())
					&&!child.getId().equals(taskRoot.getId())) {
				isFinish = false;
				break;
			}
		}
		return isFinish;
	}

	/**
	 * 验证该父任务下
	 * 1.非退回状态的数据为0条
	 * 2.退回状态的数据只有1条
	 * @param parent
	 * @return 是-true 否-false
	 */
	private boolean checkLastOne(CircuitWO parent) {
		Boolean isReceive = false;
		
		//非退回状态的数据数量
		String hql = " SELECT count(t.id) FROM CircuitWO t WHERE t.panrentTask = :panrentTask "
				 + " AND t.status != :status AND t.exist =:exist ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", parent);
		query.setParameter("status", CircuitWO.YI_TUI_HUI);
		query.setParameter("exist", DataExistStatus.EXIST);
		Long Count=(Long)query.uniqueResult();
		
		//退回状态的数据数量
		String backEql = " SELECT count(t.id) FROM CircuitWO t WHERE t.panrentTask = :panrentTask "
				 + " AND t.status = :status AND t.exist =:exist ";
		Query backQuery = sessionFactory.getCurrentSession().createQuery(backEql);
		backQuery.setParameter("panrentTask", parent);
		backQuery.setParameter("status", CircuitWO.YI_TUI_HUI);
		backQuery.setParameter("exist", DataExistStatus.EXIST);
		Long backCount=(Long)backQuery.uniqueResult();
		
		if(Count == 0 && backCount == 1){
			isReceive = true;
		}
		return isReceive;
	}

	@Override
	public CircuitWO checkCircuitWO(CircuitWO paramTask, UploadFileDto[] dtos) {
		// 查询审核任务
		CircuitWO taskRoot = circuitWOService.getById(paramTask.getId());
		saveCheckAttachFile(taskRoot, dtos);// 保存审核通过附件
		if(StringUtils.isNotBlank(paramTask.getCheckMsg())){
			taskRoot.setCheckMsg(paramTask.getCheckMsg());
		}
		taskRoot.setStatus(paramTask.getStatus());
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);//更新当前审核任务
		// 查询根任务
		CircuitWO root = circuitWOService.getById(taskRoot.getRoot().getId());
		saveOrUpdateRoot(root, taskRoot);//更新根任务
		// 保存流水
		historyService.addCircuitWOHistory(
				CircuitWO.DAI_SHEN_HE, taskRoot.getStatus(), root, taskRoot.getOwner(), "任务审核");
		return taskRoot;
	}

	private void saveOrUpdateRoot(CircuitWO root, CircuitWO taskRoot){
		root.setCheckAttachFile(taskRoot.getCheckAttachFile());
		root.setCheckMsg(taskRoot.getCheckMsg());
		root.setStatus(taskRoot.getStatus());
		sessionFactory.getCurrentSession().saveOrUpdate(root);//更新根任务
	}

	/**
	 * saveCheckAttachFile 保存审核通过附件
	 * @param taskRoot 任务信息对象
	 * @param dtos 任务附带的文件对象集合
	 * @author lilt
	 * @since 2018-11-02 11:09:16 AM
	 */
	private CircuitWO saveCheckAttachFile(CircuitWO taskRoot, UploadFileDto[] dtos){
		if (dtos != null && dtos.length != 0) {
			// 保存附件和审核文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, taskRoot.getOwner());
			taskRoot.setCheckAttachFile(attachFile);//保存审核通过附件
		}
		return taskRoot;
	}

}
