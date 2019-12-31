package com.enovell.yunwei.dispathRoot.service.impl;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.dispathRoot.service.DispathBusinessService;
import com.enovell.yunwei.dispathRoot.service.DispathRootHistoryService;
import com.enovell.yunwei.dispathRoot.service.DispathRootService;
import com.enovell.yunwei.meetingDispatch.domain.MeetingDispatch;
import com.enovell.yunwei.system.dto.NameAndIdDTO;
import com.enovell.yunwei.system.service.UserService;
import com.enovell.yunwei.util.DataExistStatus;

import javafx.collections.ListChangeListener.Change;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathBusinessServiceImpl   
 * 类描述:  调度流程实现
 * 创建人：lidt 
 * 创建时间：2016-12-16 上午10:30:33
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:30:33   
 *
 */
@SuppressWarnings("unchecked")
@Transactional
@Service("DispathBusinessService")
public class DispathBusinessServiceImpl implements DispathBusinessService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "DispathRootHistoryService")
	private DispathRootHistoryService historyService;
	
	@Resource(name = "DispathRootService")
	private DispathRootService rootService;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Resource(name = "userService")
	private UserService userService;

	@Override
	public DispathRoot addAndSend(DispathRoot dispathRoot,UploadFileDto[] dtos) {
		dispathRoot = rootService.add(dispathRoot, dtos);
		dispathRoot = (DispathRoot) sessionFactory.getCurrentSession().load(DispathRoot.class, dispathRoot.getId());
		// 保存流水
		historyService.createHistory(DispathRoot.CAO_GAO, DispathRoot.DAI_JIE_SHOU,dispathRoot, dispathRoot.getUser(),"新增并派发",0);
		// 派发
		send(dispathRoot);
		return dispathRoot;
	}
	
	@Override
	public DispathRoot updateAndSend(DispathRoot dispathRoot,UploadFileDto[] dtos,User user) {
		dispathRoot = rootService.update(dispathRoot, dtos, user);
		// 保存流水
		historyService.createHistory(dispathRoot.getStatus(), DispathRoot.DAI_JIE_SHOU,dispathRoot, dispathRoot.getUser(),"修改并派发",0);
		// 派发
		send(dispathRoot);
		return dispathRoot;
	}

	@Override
	public void updateYiPaiAndSave(DispathRoot dispathRoot,UploadFileDto[] dtos,User user) {
		// 获取信息发布(显示在页面上的数据)
		rootService.update(dispathRoot, dtos, user);
		// 保存流水
		historyService.createHistory(dispathRoot.getStatus(), DispathRoot.CAO_GAO,dispathRoot, dispathRoot.getUser(),"修改待接收调令并保存为草稿",0);
	}
	
	/**
	 * 
	 * saveSendChildDispath 派发时,保存子调令
	 *
	 * @author lidt
	 * @date 2017-7-13 下午4:24:38 
	 * @param saveDispathRoot 父调令
	 */
	private void saveSendChildDispath(DispathRoot saveDispathRoot){
		if (saveDispathRoot != null && saveDispathRoot.getAcceptUser() != null) {
			Iterator<User> it = saveDispathRoot.getAcceptUser().iterator();
			while (it.hasNext()) {
				DispathRoot tempChild = new DispathRoot();
				tempChild.setDispatchNum(saveDispathRoot.getDispatchNum());
				tempChild.setStatus(DispathRoot.DAI_JIE_SHOU);
				tempChild.setRoot(saveDispathRoot);
				tempChild.setUser(it.next());
				tempChild.setCreateDate(new Date());
				tempChild.setIsRoot(DispathRoot.IS_NOT_ROOT);
				tempChild.setParentDispath(saveDispathRoot);
				tempChild.setDeadLine(saveDispathRoot.getDeadLine());
				sessionFactory.getCurrentSession().save(tempChild);
			}
		}
	}

	@Override
	public DispathRoot send(DispathRoot dispathRoot) {
		dispathRoot = rootService.getById(dispathRoot.getId());
		// 根据接收人创建子调令,双向关联，设置一的那边就可以了,也就是setParentDispath
		DispathRoot saveDispathRoot = (DispathRoot) sessionFactory.getCurrentSession().load(DispathRoot.class, dispathRoot.getId());
		saveSendChildDispath(saveDispathRoot);// 派发时,保存子调令
		// 根调令状态修改为待接收
		saveDispathRoot.setStatus(DispathRoot.DAI_JIE_SHOU);
		saveDispathRoot.setSendDate(new Date());
		saveDispathRoot.setSendUser(dispathRoot.getUser());
		sessionFactory.getCurrentSession().saveOrUpdate(saveDispathRoot);
		//记录流水
		historyService.createHistory(dispathRoot.getStatus(), DispathRoot.DAI_JIE_SHOU,dispathRoot, dispathRoot.getUser(),"派发调令",0);
		return saveDispathRoot;
	}

	@Override
	public void receive(DispathRoot dispathRoot) {
		if(dispathRoot.getAcceptDate()!=null){
			return;
		}
		// 递归设置状态
		setPanrentStatusForReceive(dispathRoot);
		dispathRoot = (DispathRoot) sessionFactory.getCurrentSession().load(DispathRoot.class, dispathRoot.getId());
		// 保存流水
		historyService.createHistory(dispathRoot.getStatus(), DispathRoot.YI_JIE_SHOU,dispathRoot, dispathRoot.getUser(),"已接收调令",0);
	}

	/**
	 * 
	 * setPanrentStatusForReceive 递归设置父状态,如果是根调令，则设置“处理中”，如果是子调令，则设置为“待回复”
	 *
	 * @param child
	 */
	private void setPanrentStatusForReceive(DispathRoot child) {
		Session session = sessionFactory.getCurrentSession();
		child = (DispathRoot) session.load(DispathRoot.class, child.getId());
		DispathRoot parentRoot = child.getParentDispath();
		if (parentRoot == null) {// 只有根调令没有父，直接返回
			return;
		} else {
			// 如果是处理中的话，就不改变其状态
			if (!child.getStatus().equals(DispathRoot.CHU_LI_ZHONG)) {
				child.setAcceptDate(new Date()); // 受理时间
				child.setStatus(DispathRoot.DAI_HUI_FU);
				session.saveOrUpdate(child);
			}
			// 修改父调令的状态为处理中
			parentRoot.setStatus(DispathRoot.CHU_LI_ZHONG);
			session.saveOrUpdate(parentRoot);
			setPanrentStatusForReceive(parentRoot);
		}
	}

	@Override
	public void turnToSend(DispathRoot dispathRoot, User user) {
		Session session = sessionFactory.getCurrentSession();
		// 更换User 调令所属人
		dispathRoot = (DispathRoot) session.load(DispathRoot.class, dispathRoot.getId());
		dispathRoot.setUser(user);
		// 保存流水
		historyService.createHistory(dispathRoot.getStatus(), DispathRoot.DAI_JIE_SHOU,dispathRoot, dispathRoot.getUser(),"调令转派",0);
		session.saveOrUpdate(dispathRoot);
	}

	/**
	 * 
	 * saveAssignChildDispath 分派中,保存子调令
	 *
	 * @author lidt
	 * @date 2017-7-13 下午4:30:39 
	 * @param saveParent 父调令
	 * @param users 派发人员
	 */
	private void saveAssignChildDispath(DispathRoot saveParent, List<User> users){
		for (User user : users) {
			DispathRoot child = new DispathRoot();
			child.setDispatchNum(saveParent.getDispatchNum());
			child.setParentDispath(saveParent);
			child.setRoot(saveParent.getRoot());
			child.setUser(user);
			child.setDeadLine(saveParent.getRoot().getDeadLine());
			child.setCreateDate(new Date());
			child.setDeadLine(saveParent.getDeadLine());
			child.setIsRoot(DispathRoot.IS_NOT_ROOT);
			child.setStatus(DispathRoot.DAI_JIE_SHOU);
			sessionFactory.getCurrentSession().save(child);
			saveParent.getChildren().add(child);
		}
	}
	
	@Override
	public Boolean assign(DispathRoot dispathRoot, List<User> users) {
		// 将当前子调令分派给其他的人，
		// 包含修改功能，清除当前子调令的子调令，在根据传入的人生成新的子调令
		// 父调令设置已分派，子调令设置成待接收
		Session session = sessionFactory.getCurrentSession();
		DispathRoot saveParent = (DispathRoot) session.load(DispathRoot.class, dispathRoot.getId());
		if(DispathRoot.CHU_LI_ZHONG.equals(saveParent.getStatus())
				||DispathRoot.YI_HUI_FU.equals(saveParent.getStatus())
				||DispathRoot.YI_GUI_DANG.equals(saveParent.getStatus())){
			return false;
		}
		//接收
		receive(saveParent);
		if (saveParent != null) {
			delChildByPanrent(saveParent); // 清除原有子调度
			saveAssignChildDispath(saveParent, users); // 分派中,保存子调令
			saveParent.setAssignRemark(dispathRoot.getAssignRemark());//分派备注
			saveParent.setSendUser(saveParent.getUser());//发送人
			saveParent.setSendDate(new Date());//发送时间
			saveParent.setStatus(DispathRoot.YI_FEN_PAI);// 设置父状态为已分派
			session.saveOrUpdate(saveParent);
			// 保存流水
			historyService.createHistory(dispathRoot.getStatus(), DispathRoot.YI_FEN_PAI,dispathRoot, dispathRoot.getUser(),"调令分派",0);
		}
		return true;
	}

	/**
	 * 清除当前调令的子调令
	 * 
	 * @param panrent
	 */
	private void delChildByPanrent(DispathRoot panrent) {
		Query query = sessionFactory.getCurrentSession().createQuery("DELETE FROM DispathRoot WHERE parentDispath = :parentDispath");
		query.setParameter("parentDispath", panrent);
		query.executeUpdate();
	}

	@Override
	public Boolean ChangeReveive(DispathRoot dispathRoot,User user) {
		DispathRoot saveRoot = (DispathRoot) sessionFactory.getCurrentSession().load(DispathRoot.class, dispathRoot.getId());
		//如果此条数据已经被删除，则后面的代码不执行
		try{
			saveRoot.getCreateDate();
		}catch(Exception e){
			return false;
		}
		//接收调令单独提取出来作为一步，不与回复合在一起
		//接收
		receive(saveRoot);
		return true;
	}
	
	
	
	@Override
	public Boolean reply(DispathRoot dispathRoot,UploadFileDto[] dtos,User user) {
		if (dtos != null && dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			dispathRoot.setReplyAttachFile(attachFile);
		}
		//判断所有子调令都为已回复或已分派状态
		//如果都为已回复或已分派状态则把所有子调令设为归档状态
		//如果不是，则只修改当前调令
		DispathRoot saveRoot = (DispathRoot) sessionFactory.getCurrentSession().load(DispathRoot.class, dispathRoot.getId());
		//如果此条数据已经被删除，则后面的代码不执行
		try{
			saveRoot.getCreateDate();
		}catch(Exception e){
			return false;
		}
		//接收调令单独提取出来作为一步，不与回复合在一起
		//接收
		receive(saveRoot);
		
		saveRoot.setReplyContent(dispathRoot.getReplyContent());
		saveRoot.setReplyAttachFile(dispathRoot.getReplyAttachFile());
		saveRoot.setReplyDate(new Date());
		saveRoot.setStatus(DispathRoot.YI_HUI_FU);
		sessionFactory.getCurrentSession().saveOrUpdate(saveRoot);
		
		// 递归设置父调令的状态
		setPanrentStatus(saveRoot);
		//自动归档移至前端
		if(saveRoot.getRoot() != null && saveRoot.getRoot().getStatus().equals(DispathRoot.YI_GUI_DANG)){
			file(saveRoot);
		}
		// 保存流水
		historyService.createHistory(dispathRoot.getStatus(), DispathRoot.YI_HUI_FU,dispathRoot, dispathRoot.getUser(),"调令回复",0);
	    return true;
	}

	/**
	 * 递归设置父的状态 如果父是根调令且当前回复的调令是最后一条调令，则设置父状态为“待归档”，否则父状态不变，还是“处理中”
	 * 如果父是子调令且当前回复的调令是最后一条调令，这设置父状态为“已回复”，否则父状态不变，还是“已分派”
	 * 
	 * @param root
	 */
	private void setPanrentStatus(DispathRoot root) {
		if (root.getParentDispath() != null) {
			if (checkAllComplete(root)) {
				DispathRoot panrentDispath = (DispathRoot) sessionFactory.getCurrentSession().load(DispathRoot.class, root.getParentDispath().getId());
				// 如果父是根调令，则设置所有子调令状态为已归档
				if (panrentDispath.getParentDispath() == null) {
					panrentDispath.setStatus(DispathRoot.YI_GUI_DANG);
				} else {
					panrentDispath.setStatus(DispathRoot.YI_HUI_FU);
				}
				sessionFactory.getCurrentSession().saveOrUpdate(panrentDispath);
				// 继续设置父调令
				setPanrentStatus(root.getParentDispath());
			}
		}
	}

	/**
	 * 通过根调令获取所有子调令并设置为归档
	 * 
	 * @param childDispath
	 */
	@Override
	public void file(DispathRoot childDispath) {
		if(childDispath != null && childDispath.getRoot() != null){
			Session session = sessionFactory.getCurrentSession();
			DispathRoot root = (DispathRoot) session.load(DispathRoot.class, childDispath.getRoot().getId());
			//自动归档
			if(root != null && root.getStatus().equals(DispathRoot.YI_GUI_DANG)){
				String sql = " update DISPATHROOT set status_ =:status where id_ in ( " + " select t.id_ from DISPATHROOT t "
						+ " start with t.id_ = :rootId " + "  and t.PARENT_DISPATH_ID_ is null "
						+ " connect by prior t.id_ = t.PARENT_DISPATH_ID_ )";
				Query query = session.createSQLQuery(sql);
				query.setParameter("rootId", root.getId());
				query.setParameter("status", DispathRoot.YI_GUI_DANG);
				query.executeUpdate();
			}
		}
	}

	/**
	 * 验证当前调令的同级调令是否都处于完成状态
	 * 
	 * @param root
	 * @return 是-true 否-false
	 */
	private boolean checkAllComplete(DispathRoot root) {
		Boolean isAllComplete = true;
		if (root != null) {
			String hql = "FROM DispathRoot tr WHERE tr.parentDispath =:parentDispath AND tr.exist =:exist";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter("parentDispath", root.getParentDispath());
			query.setParameter("exist", DataExistStatus.EXIST);
			List<DispathRoot> list = query.list();
			for (DispathRoot tempRoot : list) {
				if (!tempRoot.getStatus().equals(DispathRoot.YI_HUI_FU)
						&& !MeetingDispatch.YI_GUI_DANG.equals(tempRoot.getStatus())// 用于变更执行人
						) {
					isAllComplete = false;
					break;
				}
			}
		}
		return isAllComplete;
	}

	/***************************************** 变更执行人开始 *****************************************/
	/**
	 * 
	 * getHistoryAndAddUser 得到不变的派发人员
	 * @param historyUserIds 历史派发人员
	 * @param receiveUserIds 新选的派发人员
	 * @return 
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
	 * 
	 * deleteReceiveUsers 删除原有的执行人
	 * @param dispathId 调令ID
	 */
	private void deleteReceiveUsers(String dispathId){
		String hql = "DELETE FROM DISPATH_ACCEPT_USER t WHERE t.DISPATH_ID_ =:dispathId ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);
		query.setParameter("dispathId", dispathId);
		query.executeUpdate();
	}
	
	/**
	 * 
	 * insertReceiveUsers 新增最新的执行人
	 * @param dispathId 调令ID
	 * @param receiveUserIds 执行人
	 */
	private void insertReceiveUsers(String dispathId, List<String> receiveUserIds){
		String sql = "INSERT INTO DISPATH_ACCEPT_USER VALUES(:dispathId,:userId) ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		for (String userId : receiveUserIds) {
			query.setParameter("dispathId", dispathId);
			query.setParameter("userId", userId);
			query.executeUpdate();
		}
	}
	
	/**
	 * 
	 * getReceiveUsersByDispathId 根据调令ID查询执行人
	 * @param dispathId 调令ID
	 * @return
	 */
	private List<Object> getReceiveUsersByDispathId(String dispathId){
		String sql = "select t.USER_ID from DISPATH_ACCEPT_USER t where t.DISPATH_ID_ =:dispathId ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("dispathId", dispathId);
		return query.list();
	}
	
	/**
	 * 
	 * newUserIdsAndDeleteUserIds 有新增的派发人员，也有删除的派发人员
	 *
	 * @author lidt
	 * @date 2017-7-13 下午3:49:34 
	 * @param statusToggle 定义状态的开关(true-子调令的状态全部是待接收,则主调令的状态也为待接收；否则主调令的状态为处理中)
	 * @param deleteUserIds 被删掉的派发人员
	 * @param newUserIds 新增的派发人员
	 * @param dispathRoot 该调令信息
	 * @param user 登录用户
	 * @param organizations 受令单位
	 */
	private void newUserIdsAndDeleteUserIds(boolean statusToggle, List<String> deleteUserIds, List<String> newUserIds,
			DispathRoot dispathRoot, User user, String organizations) {
		statusToggle = deleteUsers(dispathRoot, deleteUserIds);
		saveNewUsers(dispathRoot, newUserIds, user, statusToggle, organizations);
	}
	
	/**
	 * 
	 * onlyNewUserIds 只有新增的派发人员
	 *
	 * @author lidt
	 * @date 2017-7-13 下午3:52:15 
	 * @param statusToggle 定义状态的开关(true-子调令的状态全部是待接收,则主调令的状态也为待接收；否则主调令的状态为处理中)
	 * @param dispathRoot 该调令信息
	 * @param newUserIds 新增的派发人员
	 * @param user 登录用户
	 * @param organizations 受令单位
	 */
	private void onlyNewUserIds(boolean statusToggle, DispathRoot dispathRoot, List<String> newUserIds,
			User user, String organizations){
		String status = dispathRoot.getStatus();
		// 如果主调令状态为不是处理中或已归档
		if (!DispathRoot.CHU_LI_ZHONG.equals(status) && !DispathRoot.YI_GUI_DANG.equals(status)) {
			statusToggle = true;
		}
		saveNewUsers(dispathRoot, newUserIds, user, statusToggle, organizations);
	}
	
	/**
	 * 
	 * onlyDelUser 只有删除的派发人员
	 *
	 * @author lidt
	 * @date 2017-7-5 下午3:09:17 
	 * @param deleteUserIds 被删掉的派发人员
	 * @param dispathRoot 所属调令
	 * @param organizations 受令单位
	 */
	private void onlyDeleteUserIds(List<String> deleteUserIds, DispathRoot dispathRoot, String organizations){
		boolean statusToggle = deleteUsers(dispathRoot, deleteUserIds);
		if (statusToggle) {
			dispathRoot.setStatus(DispathRoot.DAI_JIE_SHOU);
		}
		dispathRoot.setOrganization(organizations);
		sessionFactory.getCurrentSession().saveOrUpdate(dispathRoot);
	}
	
	/**
	 * 
	 * isAutoFile 判断是否可以归档
	 *
	 * @author lidt
	 * @date 2017-7-13 下午4:03:37 
	 * @param dispathRoot 该调令信息
	 * @return true-可以归档,否则不可以归档
	 */
	private boolean isAutoFile(DispathRoot dispathRoot){
		boolean isAutoFileBoolean = false;// 是否归档状态的开关
		// 取出所有的子调令
		Set<DispathRoot> children = dispathRoot.getChildren();
		for (DispathRoot child : children) {
			if (child.getExist()) {
				if (DispathRoot.YI_HUI_FU.equals(child.getStatus())
						|| DispathRoot.YI_GUI_DANG.equals(child.getStatus())) {
					isAutoFileBoolean = true; // 子调令中只有存在已回复或已归档的数据才能进行归档
				}else {
					isAutoFileBoolean = false;
					break; // 一旦出现其他状态就不归档
				}
			}
		}
		return isAutoFileBoolean;
	}
	
	@Override
	public String updateSelectUsers(String dispathId, List<String> receiveUserIds,
			User user, String organizations) {
		List<Object> historyUsers = getReceiveUsersByDispathId(dispathId);// 获取该调令历史派发人
		List<String> historyUserIds = new ArrayList<String>();
		for (Object object : historyUsers) {
			historyUserIds.add(object.toString());
		}
		// 如果新增派发人员和历史派发人员相同,则直接跳出
		if(receiveUserIds.containsAll(historyUserIds)&&historyUserIds.containsAll(receiveUserIds)){
			return "1";
		}
		deleteReceiveUsers(dispathId);// 删除原有所有的执行人
		insertReceiveUsers(dispathId, receiveUserIds);// 新增最新的执行人
		
		DispathRoot dispathRoot = rootService.getById(dispathId);// 获取该调令信息
		List<String> deleteUserIds = new ArrayList<String>();
		List<String> newUserIds = new ArrayList<String>();
		if(!DispathRoot.CAO_GAO.equals(dispathRoot.getStatus())){
			List<String> notChangeUserIds = getNotChangeUser(historyUserIds, receiveUserIds);
			historyUserIds.removeAll(notChangeUserIds);// 历史人员除去不变人员,得到被删除的人员
			deleteUserIds = historyUserIds;//被删掉的派发人员
			receiveUserIds.removeAll(notChangeUserIds);// 最新的人员除去不变的人员,得到新增的人员
			newUserIds = receiveUserIds;//新增的派发人员
		}else {// 草稿状态下,取出所有的执行人进行子调令的保存
			newUserIds = receiveUserIds;
		}
		// 根据新增的派发人员或者删除的派发人员,进行新增或删除操作
		editSelectUserByDelOrNew(deleteUserIds, newUserIds, dispathRoot, user, organizations);
		return null;
	}
	
	/**
	 * 
	 * editSelectUserByDelOrNew 根据新增的派发人员或者删除的派发人员,进行新增或删除操作
	 *
	 * @author lidt
	 * @date 2017-7-13 下午4:08:50 
	 * @param deleteUserIds 被删掉的派发人员
	 * @param newUserIds 新增的派发人员
	 * @param dispathRoot 该调令信息
	 * @param user 登录用户
	 * @param organizations 受令单位
	 */
	private void editSelectUserByDelOrNew(List<String> deleteUserIds, List<String> newUserIds, DispathRoot dispathRoot,
			User user, String organizations){
		// 定义状态的开关(true-子调令的状态全部是待接收,则主调令的状态也为待接收；否则主调令的状态为处理中)
		boolean statusToggle = false;
		// 有新增的派发人员，也有删除的派发人员
		if (deleteUserIds.size() != 0 && newUserIds.size() != 0) {
			newUserIdsAndDeleteUserIds(statusToggle, deleteUserIds, newUserIds, dispathRoot, user, organizations);
		}
		// 只有新增的派发人员
		else if (newUserIds.size() != 0) {
			onlyNewUserIds(statusToggle, dispathRoot, newUserIds, user, organizations);
		}
		// 只有删除的派发人员
		else if (deleteUserIds.size() != 0) {
			// 首先删除子调令
			onlyDeleteUserIds(deleteUserIds, dispathRoot, organizations);
			// 再判断是否归档
			boolean isAutoFile = isAutoFile(dispathRoot);
			if (isAutoFile) {
				AutoFile(dispathRoot);
				//保存流水
				historyService.createHistory(dispathRoot.getStatus(), DispathRoot.YI_GUI_DANG,
						dispathRoot, dispathRoot.getUser(), "变更执行人中，调令归档", 0);
			}
		}
	}
	
	/**
	 * 
	 * saveChilderDispaths 根据新增的派发人员，保存子调令数据
	 *
	 * @author lidt
	 * @date 2017-7-13 下午4:10:58 
	 * @param dispathRoot 父调令信息
	 * @param newUserIds 新增的派发人员
	 */
	private void saveChilderDispaths(DispathRoot dispathRoot, List<String> newUserIds){
		// 根据接收人创建子调令
		for (String newUserId : newUserIds) {
			DispathRoot tempChild = new DispathRoot();
			tempChild.setDispatchNum(dispathRoot.getDispatchNum());
			tempChild.setStatus(DispathRoot.DAI_JIE_SHOU);
			tempChild.setRoot(dispathRoot);
			User receiveUser = new User();
			receiveUser.setId(newUserId);
			tempChild.setUser(receiveUser);
			tempChild.setCreateDate(new Date());
			tempChild.setIsRoot(DispathRoot.IS_NOT_ROOT);
			tempChild.setParentDispath(dispathRoot);
			sessionFactory.getCurrentSession().save(tempChild);
		}
	}
	
	/**
	 * 
	 * saveNewUsers 保存操作,保存新的派发人员的调令并记录流水
	 * @param dispathRoot 
	 * @param newUserIds 新的派发人员
	 * @param user 当前登陆人
	 * @param organizations 受令单位
	 * @param statusToggle 定义状态的开关(true-子调令的状态全部是待接收,则主调令的状态也为待接收；否则主调令的状态为处理中)
	 */
	private void saveNewUsers(DispathRoot dispathRoot, List<String> newUserIds,
			User user, boolean statusToggle, String organizations) {
		saveChilderDispaths(dispathRoot, newUserIds);
		String status = dispathRoot.getStatus();
		String historyEndStatus = "";// 定义流水的结束状态
		// 如果操作调令的状态为草稿
		if (DispathRoot.CAO_GAO.equals(status)){
			dispathRoot.setSendUser(user);// 派发人
			dispathRoot.setSendDate(new Date());// 派发时间
			dispathRoot.setStatus(DispathRoot.DAI_JIE_SHOU);// 状态改为待接收
			historyEndStatus = DispathRoot.DAI_JIE_SHOU;
		} else if (statusToggle) {// 子调令全部是待接收
			// 根调令状态修改为待接收
			dispathRoot.setStatus(DispathRoot.DAI_JIE_SHOU);
			historyEndStatus = DispathRoot.DAI_JIE_SHOU;
		} else {// 其他状态进行新增执行人,根状态必定是处理中
			// 根调令状态修改为处理中
			dispathRoot.setStatus(DispathRoot.CHU_LI_ZHONG);
			historyEndStatus = DispathRoot.CHU_LI_ZHONG;
		}
		dispathRoot.setOrganization(organizations);
		sessionFactory.getCurrentSession().saveOrUpdate(dispathRoot);
		//保存流水
		historyService.createHistory(status, historyEndStatus,
				dispathRoot, dispathRoot.getUser(), "变更执行人中，新增人员", 0);
	}
	
	/**
	 * 
	 * deleteUsers 删除操作,被删除的派发人员的调令并记录流水
	 * @param dispathRoot
	 * @param deleteUserIds 被删除的派发人员
	 * @return true-子调令的状态全部是待接收,则主调令的状态也为待接收；否则主调令的状态为处理中
	 */
	private boolean deleteUsers(DispathRoot dispathRoot, List<String> deleteUserIds) {
		// 取出所有的子调令
		Set<DispathRoot> children = dispathRoot.getChildren();
		String delUserNames = deleteChilderDispath(children, deleteUserIds);
		String historyEndStatus = "";// 定义流水的结束状态
		// 定义状态的开关(true-子调令的状态全部是待接收,则主调令的状态也为待接收；否则主调令的状态为处理中)
		boolean statusToggle = false;
		for (DispathRoot child : children) {
			if (child.getExist()) {// 数据存在
				if(DispathRoot.DAI_JIE_SHOU.equals(child.getStatus())){
					statusToggle = true;
					historyEndStatus = DispathRoot.DAI_JIE_SHOU;
				} else {
					statusToggle = false;// 一旦出现其他状态,则终止
					historyEndStatus = DispathRoot.CHU_LI_ZHONG;
					break;
				}
			} else {// 如果全部删除,再新增,则根调令状态肯定是待接收
				statusToggle = true;
				historyEndStatus = DispathRoot.DAI_JIE_SHOU;
			}
		}
		// 保存流水
		historyService.createHistory(dispathRoot.getStatus(), historyEndStatus,
				dispathRoot, dispathRoot.getUser(), "变更执行人中，删除的人员有：：" + delUserNames.substring(1), 0);
		return statusToggle;
	}
	
	/**
	 * 
	 * deleteChilderDispath 根据删除派发人员,删除子调令
	 *
	 * @author lidt
	 * @date 2017-7-13 下午4:17:02 
	 * @param children 该调令下的所有的子调令
	 * @param deleteUserIds 被删除的派发人员
	 * @return 删除派发人员名的字符串集合,用于记录流水
	 */
	private String deleteChilderDispath(Set<DispathRoot> children, List<String> deleteUserIds){
		String delUserNames = "";// 删除派发人员名的集合,用于记录流水
		for (DispathRoot child : children) {
			if (child.getExist()) {// 数据存在
				// 取出子调令的调度人
				User childrenUser = child.getUser();
				for (String deleteUserId : deleteUserIds) {
					// 如果删除的派发人员存在于子调令里,则删除该子调令
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
	 * 
	 * deleteChildren 递归循环逻辑删除子
	 * @param deleteObj
	 */
	private void deleteChildren(DispathRoot deleteObj) {
		if (deleteObj.getChildren() != null) {
			Iterator<DispathRoot> it = deleteObj.getChildren().iterator();
			while (it.hasNext()) {
				DispathRoot temp = it.next();
				temp.setExist(DataExistStatus.NOT_EXIST);// 改为不存在,及逻辑删除
				deleteChildren(temp);
				sessionFactory.getCurrentSession().saveOrUpdate(temp);
			}
		}
	}
	
	/**
	 * 
	 * AutoFile 自动归档
	 * @param dispathRoot
	 */
	private void AutoFile(DispathRoot dispathRoot){
		// 自动归档子调令
		String sql = " update DISPATHROOT set status_ =:status where id_ in ( " + " select t.id_ from DISPATHROOT t "
				+ " start with t.id_ = :rootId " + "  and t.PARENT_DISPATH_ID_ is null "
				+ " connect by prior t.id_ = t.PARENT_DISPATH_ID_ )";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("rootId", dispathRoot.getId());
		query.setParameter("status", DispathRoot.YI_GUI_DANG);
		query.executeUpdate();
		// 自动归档根调令
		dispathRoot.setStatus(DispathRoot.YI_GUI_DANG);
		sessionFactory.getCurrentSession().saveOrUpdate(dispathRoot);
	}
	/***************************************** 变更执行人结束 *****************************************/
	
	/**
	 * 获取转派下拉选中的数据（过滤掉该命令已存在的用户）
	 * id 为待转派的命令id（通过该id获取父命令id，
                        		通过父命令id获取所有该父命令的子命令，
                        		子命令中有个属性表示的命令所属用户，
                        		通过这个属性过滤掉下拉选中已经拥有子命令的用户）
	 * orgId为登录用户所属的机构id
	 */
	@Override
	public List<NameAndIdDTO> getSelectUsersByOrgId(String id ,String orgId) {
		
		List<User> users = getUsers(id ,orgId);
		//封装为BUI.Select.Select（下拉选）需要的数据格式
		List<NameAndIdDTO> data = new ArrayList<NameAndIdDTO>();
		for(User u : users){
			NameAndIdDTO element = new NameAndIdDTO();
			element.setValue(u.getId());
			element.setText(u.getName());
			data.add(element);
		}
		return data;
	}
	
	/**
	 * 
	 * getUsers 获取下拉选需显示的人员
	 *
	 * @param id 调令ID
	 * @param orgId 组织机构ID
	 * @return
	 */
	private List<User> getUsers(String id,String orgId) {
		
		DispathRoot dr = rootService.getById(id);//待转派的命令
		String parentId = dr.getParentDispath().getId();//待转派命令的父命令id
		List<DispathRoot> haveDispathUsers = getHaveDispathUsers(parentId);
		List<User> allUsers = userService.getAllUsers(orgId);// 获取orgId下的所有用户
		//过滤掉拥有子命令的用户
		List<User> repeatUsers = new ArrayList<User>();
		for(int i = 0 ; i < haveDispathUsers.size() ; i++){
			DispathRoot d = haveDispathUsers.get(i);
			for(int j = 0 ; j < allUsers.size() ; j++){
				User u = allUsers.get(j);
				if(u.getId().equals(d.getUser().getId())){
					repeatUsers.add(u);
				}
			}
		}
		for(User u : repeatUsers){
			allUsers.remove(u);
		}
		return allUsers;
	}
	
	/**
	 * 
	 * getHaveDispathUsers 获取父命令id下的所有子命令
	 *
	 * @param parentId
	 * @return
	 */
	private List<DispathRoot> getHaveDispathUsers(String parentId){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM DispathRoot dr WHERE dr.parentDispath.id = :parentId AND dr.exist =:exist" ;
		Query query = session.createQuery(hql);
		query.setParameter("parentId", parentId);
		query.setParameter("exist", DataExistStatus.EXIST);
		return query.list();
	}
	
	/**
	 * 转派-yangsy
	 */
	@Override
	public void turnToSendMultiUser(String id, String receiveUserId) {
		//获取转派人员
		List<User> users = userService.getTurnToUsers(receiveUserId);
		DispathRoot dispathRoot=rootService.getById(id);//待转派的命令
		
		DispathRoot parent = dispathRoot.getParentDispath();//获取待转派命令的父命令
		DispathRoot root = dispathRoot.getRoot();//获取待转派命令的根命令
		//新增子命令
		for(User u : users){
			DispathRoot dr = new DispathRoot();
			dr.setDispatchNum(dispathRoot.getDispatchNum());
			dr.setStatus(DispathRoot.DAI_JIE_SHOU);
			dr.setDeadLine(root.getDeadLine());
			dr.setRoot(root);
			dr.setUser(u);
			dr.setCreateDate(new Date());
			dr.setIsRoot(DispathRoot.IS_NOT_ROOT);
			dr.setParentDispath(parent);
			sessionFactory.getCurrentSession().save(dr);
			if(parent.getId().equals(root.getId())){
				addDispathRootUserRelation(parent,u);
			}
		}
		User oprUser = dispathRoot.getUser();//命令转派前的所属人，用于记录流水
		
		//保存流水
		historyService.createHistory(dispathRoot.getStatus(), DispathRoot.DAI_JIE_SHOU,dispathRoot, oprUser,"调度命令转派",0);
		
//		delDispathRootUserRelation(parent,oprUser);
//		//删除转派前的命令
//		delChildById(dispathRoot);
		// 修改根调令状态
		modifyRootStatus(root);
	}
	
	/**
	 * 
	 * modifyRootStatus 修改根调令状态
	 *
	 * @author lidt
	 * @date 2017-7-6 上午11:45:10 
	 * @param root
	 */
	private void modifyRootStatus(DispathRoot root){
		//获取主命令的第一级子命令集合
		List<DispathRoot> data = getDispathRootList(root);
		//根据主命令的第一级子子命令的状态（待接收）的数量来判断是否改变主命令的状态（从处理中改为待接收）
		//一级子命令的状态全为待接收则改变主命令
		boolean flag = true;
		for (int i = 0; i < data.size(); i++) {
			if (!data.get(i).getStatus().equals(DispathRoot.DAI_JIE_SHOU)) {
				flag = false;
				break;
			}
		}
		if (flag) {
			root.setStatus(DispathRoot.DAI_JIE_SHOU);
			sessionFactory.getCurrentSession().saveOrUpdate(root);
		}
	}
	
	/**
	 * 
	 * getDispathRootList 获取一级调令
	 *
	 * @param root
	 * @return
	 */
	private List<DispathRoot> getDispathRootList(DispathRoot root){
		String hql = "FROM DispathRoot t WHERE t.exist = :exist AND t.parentDispath.id=:root";
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setParameter("root", root.getId());
		return query.list();
	}
	
	/**
	 * 清除子命令通过该子命令（转派的时候使用）
	 * @param dr
	 */
	private void delChildById(DispathRoot dr) {
		dr.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(dr);
	}
	
	/**
	 * 删除主任务与执行人关系表中的数据
	 */
	private void delDispathRootUserRelation(DispathRoot dr, User u){
		String sql = "DELETE FROM DISPATH_ACCEPT_USER dau WHERE dau.DISPATH_ID_=:drId AND dau.USER_ID =:uId";
		Query query =sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("drId", dr.getId());
		query.setParameter("uId", u.getId());
		query.executeUpdate();
	}
	
	/**
	 * 
	 * addDispathRootUserRelation 新增主命令与执行人关系表中的数据
	 * @param dr 父命令对象
	 * @param u 用户对象
	 */
	private void addDispathRootUserRelation(DispathRoot dr, User u){
		String sql = "INSERT INTO DISPATH_ACCEPT_USER (DISPATH_ID_,USER_ID) VALUES (?,?)";
		Query query =sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter(0, dr.getId());
		query.setParameter(1, u.getId());
		query.executeUpdate();
	}
	
}
