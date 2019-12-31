package com.enovell.yunwei.circuitWO.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.circuitWO.dto.CircuitWOSearchDto;
import com.enovell.yunwei.circuitWO.dto.NameAndIdDTO;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.system.service.UserService;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.ManualPagingUtil;
import com.enovell.yunwei.util.OderStatusUtil;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.Map.Entry;

@Transactional
@Service("toDoCircuitWOService")
public class ToDoCircuitWOServiceImpl implements ToDoCircuitWOService {
	

	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name="circuitRootTreeService")
	private CircuitWORootTreeService treeService;
	@Resource(name="circuitWOService")
	private CircuitWOService circuitWOService;
	@Resource(name="circuitWOHistoryService")
	private CircuitWOHistoryService historyService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Override
	public GridDto<CircuitWO> getCircuitWOShowDtoOfToDoGridDto(CircuitWOSearchDto dto, int start, int limit) {
		List<CircuitWO> rows = getToDoByDTO(dto, start, limit);//获取待办信息
		long result = getToDoCountByDTO(dto);
		GridDto<CircuitWO> gridDto = new GridDto<CircuitWO>();
		gridDto.setRows(rows);
		gridDto.setResults(result);
		return gridDto;
	}

	private Long getToDoCountByDTO(CircuitWOSearchDto dto) {
		String hql = " SELECT count(t.id) FROM CircuitWO t "
				+ " WHERE t.status != :shtg "
				+ " AND t.status != :shbtg"
				+ " AND t.status != :dsh";
		Map<String,Object> map = new HashMap<String,Object>();
		hql = createToDoSql(hql,map,dto);
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("shtg", CircuitWO.SHEN_HE_TONG_GUO);
		query.setParameter("shbtg", CircuitWO.SHEN_HE_BU_TONG_GUO);
		query.setParameter("dsh", CircuitWO.DAI_SHEN_HE);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (Long)query.uniqueResult();
	}

	private List<CircuitWO> getToDoByDTO(CircuitWOSearchDto dto, int start, int limit) {
		String hql = " FROM CircuitWO t "
				+ " LEFT JOIN FETCH t.root r "
				+ " LEFT JOIN FETCH r.sendUser rsu "
				+ " LEFT JOIN FETCH rsu.organization "
				+ " LEFT JOIN FETCH r.linkman "
				+ " WHERE t.status != :shtg "
				+ " AND t.status != :shbtg"
				+ " AND t.status != :dsh";
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shtg", CircuitWO.SHEN_HE_TONG_GUO);
		map.put("shbtg", CircuitWO.SHEN_HE_BU_TONG_GUO);
		map.put("dsh", CircuitWO.DAI_SHEN_HE);
		
		/**
		 * 修改人：luoyan 2017-7-31 增加超期问题查询
		 */
		List<CircuitWO> list = new ArrayList<CircuitWO>();
		
		// 查询超期数据
		List<CircuitWO> overtimeList;
		// 查询未超期数据
		List<CircuitWO> notOvertimeList;
		
		//1.超期条件查询不为空
		if(StringUtils.isNotBlank(dto.getOvertimeStatus())){//查询超期条件不为空
			hql =  createToDoSql(hql,map,dto);
			overtimeList = getAllListQuery(hql,map,start,limit);
			if(dto.getOvertimeStatus().equals(CircuitWO.IS_OVERTIME)){
				setOverTimeRecordsColorAttr(overtimeList);
			}
			addColorByStatus(overtimeList);
			return overtimeList;
		}
		
		//2.超期条件查询为空
		// 查询超期数据
		dto.setOvertimeStatus(CircuitWO.IS_OVERTIME);
		overtimeList = getAllListQuery(createToDoSql(hql,map,dto),map,start,limit);
		long overtimeCount = getToDoCountByDTO(dto);
		setOverTimeRecordsColorAttr(overtimeList);
		
		
		dto.setOvertimeStatus(CircuitWO.IS_NOT_OVERTIME);
		
		list.addAll(overtimeList);//只有超期数据
		
		//查出超期数据不够，需要再查询不超期数据
		if(ManualPagingUtil.isExecuteSecondFun(overtimeCount,start,limit)){
			notOvertimeList = getAllListQuery(createToDoSql(hql,map,dto),map,ManualPagingUtil.getSecondFirst(overtimeCount, start,limit) , ManualPagingUtil.getSecondMax(overtimeCount, start,limit));
			list.addAll(notOvertimeList);
		}
		dto.setOvertimeStatus(""); //条件恢复
		addColorByStatus(list);
		return list;
	}

	/**
	 * 
	 * addColorByStatus 添根据状态不同，设置不同的颜色
	 * @param taskRoots
	 * @return
	 */
	private void addColorByStatus(List<CircuitWO> circuitWOs){
		for (CircuitWO taskRoot : circuitWOs) {
			treeService.addColorByStatus(taskRoot);
		}
	}

	private List<CircuitWO> setOverTimeRecordsColorAttr(List<CircuitWO> list) {
		for(CircuitWO one : list){
			one.setYiChaoQi(true);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	private List<CircuitWO> getAllListQuery(String hql, Map<String, Object> map,int first,int max) {
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<CircuitWO> overtimeList = query.list();
		return overtimeList;
	}

	/**
	 * createToDoSql 封装查询超期的查询SQL
	 * @param hql
	 * @param map
	 * @param dto
	 * @return
	 */
	private String createToDoSql(String hql, Map<String, Object> map, CircuitWOSearchDto dto) {
		if(dto==null){
			return hql;
		}
		//进行排序的状态，按数组中顺序对查询结果进行排序
		String[] status = new String[]{CircuitWO.DAI_JIE_SHOU,CircuitWO.DAI_HUI_FU,CircuitWO.YI_FEN_PAI,CircuitWO.YI_HUI_FU,CircuitWO.YI_TUI_HUI,CircuitWO.YI_GUI_DANG};
		StringBuffer str = new StringBuffer();
		str = str.append(hql);
		// 删除字段为1的条件(即未删除)
		str.append(" AND t.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		if(StringUtils.isNotBlank(dto.getIsRoot())){//隐含条件-不是根
			str.append(" AND t.isRoot = :isRoot ");
			map.put("isRoot",dto.getIsRoot());
		}
		if(dto.getOwner() != null){//隐含条件-用户
			str.append(" AND t.owner = :owner");
			map.put("owner", dto.getOwner());
		}
		if(StringUtils.isNotBlank(dto.getTitle())){
			str.append(" AND upper(t.root.title) like upper(:title) ");
			map.put("title","%"+ dto.getTitle() + "%");
		}
		if(StringUtils.isNotBlank(dto.getStatus())){
			str.append(" AND t.status = :status ");
			map.put("status",dto.getStatus());
		}
		if(dto.getTaskLevel() != null){
			str.append(" AND t.root.taskLevel = :taskLevel ");
			map.put("taskLevel",dto.getTaskLevel());
		}
		if(dto.getTaskType() != null){
			str.append(" AND t.root.taskType = :taskType ");
			map.put("taskType", dto.getTaskType());
		}
		if(dto.getSendStartDate() != null){
			str.append(" AND t.root.sendDate >= :sendStartDate ");
			map.put("sendStartDate", dto.getSendStartDate());
		}
		if(dto.getSendEndDate()!= null){
			str.append(" AND t.root.sendDate <= :sendEndDate ");
			map.put("sendEndDate", dto.getSendEndDate());
		}
		if(StringUtils.isNotBlank(dto.getOrgId())){
			str.append(" AND t.root.sendUser.organization.id = :orgId ");
			map.put("orgId",dto.getOrgId());
		}
		//拥有超期形式的状态
		String overStatus = CircuitWO.DAI_JIE_SHOU+","+CircuitWO.DAI_HUI_FU;
		Date nowDate = new Date();
		if(StringUtils.isNotBlank(dto.getOvertimeStatus())){
			if(dto.getOvertimeStatus().equals(CircuitWO.IS_OVERTIME)){
				str.append(" AND t.root.limitTime <= :nowDate and t.status in ("+overStatus+")  ORDER by t.root.limitTime ");
			}
			if(dto.getOvertimeStatus().equals(CircuitWO.IS_NOT_OVERTIME)){
				str.append("  and t.id not in ( select tr.id from CircuitWO tr where tr.root.limitTime <= :nowDate "
						+ "and tr.status in ("+overStatus+") )  ORDER BY decode(t.status,"+OderStatusUtil.getOderStatus(status)+"),t.root.createTime DESC ");
			}
			map.put("nowDate", nowDate);
		}
		return str.toString();
	}

	@Override
	public void receive(String id) {
		// 递归设置状态
		CircuitWO taskRoot= circuitWOService.getById(id);
		if(taskRoot.getAcceptDate()!=null){
			return;
		}
		setPanrentStatusForReceive(taskRoot);
		//保存流水
		historyService.addCircuitWOHistory(
				CircuitWO.DAI_JIE_SHOU, CircuitWO.DAI_HUI_FU,taskRoot.getRoot(), taskRoot.getPanrentTask().getOwner(),"任务接收");
	}

	/**    
	 * setPanrentStatusForReceive 递归设置状态
	 * @param task
	 */
	private void setPanrentStatusForReceive(CircuitWO task) {
		task = circuitWOService.getById(task.getId());
		CircuitWO taskRoot = task.getPanrentTask();
		if (taskRoot == null) {
			task.setStatus(CircuitWO.CHU_LI_ZHONG);
			task.setAcceptDate(new Date());// 受理时间
			sessionFactory.getCurrentSession().saveOrUpdate(task);
		} else {
			//如果是已分派的话，就不改变其状态
			if(!task.getStatus().equals(CircuitWO.YI_FEN_PAI)){
				task.setStatus(CircuitWO.YI_FEN_PAI);
				task.setAcceptDate(new Date());// 受理时间
				sessionFactory.getCurrentSession().saveOrUpdate(task);
			}
			setPanrentStatusForReceive(taskRoot);
		}
	}

	@Override
	public void sendBack(String id, String sendBackRemark) {
		CircuitWO taskRoot = circuitWOService.getById(id);
		
		taskRoot.setSendBackRemark(sendBackRemark);//退回备注
		taskRoot.setStatus(CircuitWO.YI_TUI_HUI);// 改状态
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		//保存流水
		historyService.addCircuitWOHistory(CircuitWO.DAI_JIE_SHOU, CircuitWO.YI_TUI_HUI,taskRoot.getRoot(), taskRoot.getOwner(),"任务退回");
	}

	@Override
	public Boolean assign(CircuitWO taskParam) {
		//执行接收
		receive(taskParam.getId());
		CircuitWO currTask = circuitWOService.getById(taskParam.getId());
		if(DispathRoot.CHU_LI_ZHONG.equals(currTask.getStatus())
				||DispathRoot.YI_HUI_FU.equals(currTask.getStatus())
				||DispathRoot.YI_GUI_DANG.equals(currTask.getStatus())){
			return false;
		}
		currTask.setAssignRemark(taskParam.getAssignRemark());//分派说明
		currTask.setReceiveUsers(taskParam.getReceiveUsers());
		
		delTaskChildByPanrent(currTask); // 清除原有子任务
		Set<User> users=currTask.getReceiveUsers();
		for (User user : users) {
			CircuitWO child = new CircuitWO();
			child.setPanrentTask(currTask);
			child.setRoot(currTask.getRoot());
			child.setOwner(user);
			child.setCreateTime(new Date());
			child.setIsRoot(CircuitWO.IS_NOT_ROOT);
			child.setStatus(CircuitWO.DAI_JIE_SHOU);
			sessionFactory.getCurrentSession().save(child);
			currTask.getChildren().add(child);
		}
		currTask.setStatus(CircuitWO.YI_FEN_PAI);// 设置当前任务状态为已分派
		sessionFactory.getCurrentSession().saveOrUpdate(currTask);
		//保存流水
		historyService.addCircuitWOHistory(
				CircuitWO.DAI_JIE_SHOU, CircuitWO.YI_FEN_PAI,currTask.getRoot(), currTask.getOwner(),"任务分派");
		return true;
	}
	
	/**
	 * 清除当前任务的子任务
	 * @param panrentTask
	 */
	private void delTaskChildByPanrent(CircuitWO currTask) {
		String hql=" DELETE FROM CircuitWO WHERE panrentTask = :panrentTask ";
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", currTask);
		query.executeUpdate();
	}

	@Override
	public void turnToSendMultiUser(String id, String receiveUserId) {
		//获取转派人员
		List<User> users = userService.getTurnToUsers(receiveUserId);
		CircuitWO taskRoot = circuitWOService.getById(id);//待转派的任务
		CircuitWO panernt = taskRoot.getPanrentTask();//获取待转派任务的父任务
		CircuitWO root = taskRoot.getRoot();//获取待转派任务的根任务
		//新增子任务
		for(User u : users){
			CircuitWO taskChild = new CircuitWO();
			taskChild.setStatus(CircuitWO.DAI_JIE_SHOU);
			taskChild.setRoot(root);
			taskChild.setOwner(u);
			taskChild.setCreateTime(new Date());
			taskChild.setIsRoot(CircuitWO.IS_NOT_ROOT);
			taskChild.setPanrentTask(panernt);
			sessionFactory.getCurrentSession().save(taskChild);
			if(panernt.getId().equals(root.getId())){
				addCircuitWOUserRelation(panernt,u);
			}
		}
		User oprUser = taskRoot.getOwner();//任务转派前的所属人，用于记录流水

//		delTaskRootUserRelation(panernt,oprUser);
		//删除转派前的任务
//		delTaskChildById(taskRoot);
		// 修改根任务状态
		modifyRootStatus(root);
		//保存流水
		historyService.addCircuitWOHistory(CircuitWO.DAI_JIE_SHOU, CircuitWO.DAI_JIE_SHOU,taskRoot.getRoot(), oprUser,"任务转派");
	}

	/**
	 * modifyRootStatus 修改根任务状态
	 * @author lidt
	 * @date 2017-7-13 上午10:42:21 
	 * @param root
	 */
	private void modifyRootStatus(CircuitWO root){
		//获取主数据的第一级数据集合
		List<CircuitWO> data = getCircuitWOList(root);
		//根据主数据的第一级子数据的状态（待接收、待回复）的数量来判断是否改变主数据的状态（待接收、处理中）
		boolean flag = true;
		for(int i=0 ; i<data.size() ; i++){
			if(!data.get(i).getStatus().equals(CircuitWO.DAI_JIE_SHOU)){
				flag = false;
				break;
			}
		}
		if(flag){
			root.setStatus(CircuitWO.DAI_JIE_SHOU);
			sessionFactory.getCurrentSession().saveOrUpdate(root);
		}
	}
	

	@SuppressWarnings("unchecked")
	private List<CircuitWO> getCircuitWOList(CircuitWO root) {
		String hql = "FROM CircuitWO t WHERE t.exist = :exist AND t.panrentTask.id=:root";
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setParameter("root", root.getId());
		return query.list();
	}

	private void addCircuitWOUserRelation(CircuitWO panernt, User u) {
		String sql = "INSERT INTO CIRCUIT_WORK_ORDER_USER (TASKROOT_ID_,USER_ID_) VALUES (?,?)";
		Query query =sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter(0, panernt.getId());
		query.setParameter(1, u.getId());
		query.executeUpdate();
	}
	
	@Override
	public CircuitWO reply(CircuitWO taskParam, UploadFileDto[] dtos) {
		CircuitWO taskRoot = circuitWOService.getById(taskParam.getId());
		//如果已经不存在，不进行回复
		try{
			taskRoot.getCreateTime();//不存在则会在调用get方法时抛出异常
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		//执行接收
		receive(taskParam.getId());
		taskRoot.setResponseDate(taskParam.getResponseDate());
		taskRoot.setResponseContent(taskParam.getResponseContent());
		taskRoot.setSubmitUser(taskParam.getSubmitUser());
		taskRoot.setChargeUser(taskParam.getChargeUser());//回复负责人同提交人
		if (dtos != null && dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, taskParam.getSubmitUser());
			taskRoot.setResponseAttachFile(attachFile);
		}
		taskRoot.setStatus(CircuitWO.YI_HUI_FU);
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		// 递归设置父任务的状态
		setParentStatus(taskRoot);
		//保存流水
		historyService.addCircuitWOHistory(CircuitWO.DAI_HUI_FU, CircuitWO.YI_HUI_FU,taskRoot.getRoot(), taskRoot.getOwner(),"任务回复");
		return taskRoot;
	}

	/**    
	 * setParentStatus 递归设置父的状态 
	 * 如果父是根任务且当前回复的任务是最后一条任务，则设置父状态为“待归档”，否则父状态不变，还是“处理中”
	 * 如果父是子任务且当前回复的任务是最后一条任务，这设置父状态为“已回复”，否则父状态不变，还是“已分派”
	 * @param taskRoot
	 */
	private void setParentStatus(CircuitWO taskRoot) {
		if (CircuitWO.IS_NOT_ROOT.equals(taskRoot.getIsRoot())){//不是跟任务
			if (checkAllComplete(taskRoot)) {//是最后一条
				// 设置父状态待回复-已回复
				CircuitWO panrentTask = circuitWOService.getById(taskRoot.getPanrentTask().getId());
				//如果父是根任务，则设置状态为待归档
				if(CircuitWO.IS_ROOT.equals(panrentTask.getIsRoot())){
					panrentTask.setStatus(CircuitWO.DAI_GUI_DANG);
				}else{
					panrentTask.setStatus(CircuitWO.YI_HUI_FU);
				}
				sessionFactory.getCurrentSession().saveOrUpdate(panrentTask);
				// 继续设置父任务
				setParentStatus(panrentTask);
			}
		}
	}

	/**
	 * 验证当前任务的同级任务是否都处于完成状态
	 * @param taskRoot
	 * @return 是-true 否-false
	 */
	@SuppressWarnings("unchecked")
	private boolean checkAllComplete(CircuitWO taskRoot) {
		Boolean isAllComplete = true;
		if (taskRoot != null) {
			String hql = " FROM CircuitWO tr WHERE tr.panrentTask =:panrentTask AND tr.exist =:exist";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter("panrentTask", taskRoot.getPanrentTask());
			query.setParameter("exist", DataExistStatus.EXIST);
			List<CircuitWO> list = query.list();
			for (CircuitWO tempRoot : list) {
				if (!CircuitWO.YI_HUI_FU.equals(tempRoot.getStatus())
						&& !CircuitWO.YI_GUI_DANG.equals(tempRoot.getStatus())// 用于变更执行人
						&& !CircuitWO.SHEN_HE_TONG_GUO.equals(tempRoot.getStatus())
						&& !CircuitWO.SHEN_HE_BU_TONG_GUO.equals(tempRoot.getStatus())
						&& !CircuitWO.YI_TUI_HUI.equals(tempRoot.getStatus())//审核通过、审核不通过、已退回的任务不纳入该流程
						) {
					isAllComplete = false;
					break;
				}
			}
		}
		return isAllComplete;
	}

	@Override
	public List<NameAndIdDTO> getSelectUsersByOrgId(String id, String orgId) {
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
	 * 获取下拉选需显示的人员
	 */
	private List<User> getUsers(String id,String orgId) {
		
		CircuitWO taskRoot = circuitWOService.getById(id);//待转派的任务
		String taskParentId = taskRoot.getPanrentTask().getId();//带转派任务的父任务id
		List<CircuitWO> haveTaskUsers = getHaveTaskUsers(taskParentId);
		List<User> allUsers = getAllUsers(orgId);
		//过滤掉拥有子任务的用户
		List<User> repeatUsers = new ArrayList<User>();
		for(int i = 0 ; i < haveTaskUsers.size() ; i++){
			CircuitWO tr = haveTaskUsers.get(i);
			for(int j = 0 ; j < allUsers.size() ; j++){
				User u = allUsers.get(j);
				if(u.getId().equals(tr.getOwner().getId())){
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
	 * 获取orgId下的所有用户
	 */
	private List<User> getAllUsers(String orgId){
		 return userService.getAllUsers(orgId);
	}

	/**
	 * 获取父任务id下的所有子任务
	 */
	@SuppressWarnings("unchecked")
	private List<CircuitWO>  getHaveTaskUsers(String taskParentId){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM CircuitWO tr WHERE tr.panrentTask.id = :panrentTask AND tr.exist =:exist" ;
		Query query = session.createQuery(hql);
		query.setParameter("panrentTask", taskParentId);
		query.setParameter("exist", DataExistStatus.EXIST);
		return query.list();
	}

	@Override
	public GridDto<CircuitWO> getToDoByWorkShopDirectorGridDto(CircuitWOSearchDto dto, int start, int limit) {
		List<CircuitWO> rows = getToDoByWorkShopDirector(dto, start, limit);
		long result = getToDoCountByByWorkShopDirector(dto);
		GridDto<CircuitWO> gridDto = new GridDto<CircuitWO>();
		gridDto.setRows(rows);
		gridDto.setResults(result);
		return gridDto;
	}

	private List<CircuitWO> getToDoByWorkShopDirector(CircuitWOSearchDto dto, int start, int limit) {
		String hql = " FROM CircuitWO t "
				+ " LEFT JOIN FETCH t.creatUser u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH t.panrentTask tp "
				+ " LEFT JOIN FETCH tp.sendUser tps "
				+ " LEFT JOIN FETCH tps.organization "
				+ " LEFT JOIN FETCH t.root r "
				+ " LEFT JOIN FETCH r.sendUser rsu "
				+ " LEFT JOIN FETCH rsu.organization "
				+ " LEFT JOIN FETCH t.owner tu "
				+ " LEFT JOIN FETCH tu.organization tuo "
				+ " WHERE tuo.id =:userOrgId "
				+ " AND t.status NOT IN (:dsh,:shtg,:shbtg)";
		Map<String, Object> map = new HashMap<String, Object>();
		dto.setIsRoot(CircuitWO.IS_NOT_ROOT);//不是根
		map.put("userOrgId", dto.getUserOrgId());
		map.put("dsh", CircuitWO.DAI_SHEN_HE);
		map.put("shtg", CircuitWO.SHEN_HE_TONG_GUO);
		map.put("shbtg", CircuitWO.SHEN_HE_BU_TONG_GUO);
		
		/**
		 * 修改人：luoyan 2017-8-14 增加超期问题查询
		 */
		List<CircuitWO> list = new ArrayList<CircuitWO>();
		
		// 查询超期数据
		List<CircuitWO> overtimeList;
		// 查询未超期数据
		List<CircuitWO> notOvertimeList;
		
		//1.超期条件查询不为空
		if(StringUtils.isNotBlank(dto.getOvertimeStatus())){//查询超期条件不为空
			hql =  createToDoSql(hql,map,dto);
			overtimeList = getAllListQuery(hql,map,start,limit);
			if(dto.getOvertimeStatus().equals(CircuitWO.IS_OVERTIME)){
				setOverTimeRecordsColorAttr(overtimeList);
			}
			addColorByStatus(overtimeList);
			return overtimeList;
		}
		
		//2.超期条件查询为空
		// 查询超期数据
		dto.setOvertimeStatus(CircuitWO.IS_OVERTIME);
		overtimeList = getAllListQuery(createToDoSql(hql,map,dto),map,start,limit);
		long overtimeCount = getToDoCountByByWorkShopDirector(dto);
		setOverTimeRecordsColorAttr(overtimeList);
		
		dto.setOvertimeStatus(CircuitWO.IS_NOT_OVERTIME);
		
		list.addAll(overtimeList);//只有超期数据
		
		//查出超期数据不够，需要再查询不超期数据
		if(ManualPagingUtil.isExecuteSecondFun(overtimeCount,start,limit)){
			notOvertimeList = getAllListQuery(createToDoSql(hql,map,dto),map,ManualPagingUtil.getSecondFirst(overtimeCount, start,limit) , ManualPagingUtil.getSecondMax(overtimeCount, start,limit));
			list.addAll(notOvertimeList);
		}
		dto.setOvertimeStatus(""); //条件恢复
		addColorByStatus(list);
		return list;
		
	}

	private long getToDoCountByByWorkShopDirector(CircuitWOSearchDto dto) {
		String hql = " SELECT COUNT(t.id) FROM CircuitWO t "
				+ " WHERE t.owner.organization.id =:userOrgId "
				+ " AND t.status NOT IN (:dsh,:shtg,:shbtg)";
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createToDoSql(hql, map, dto);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userOrgId", dto.getUserOrgId());
		query.setParameter("dsh", CircuitWO.DAI_SHEN_HE);
		query.setParameter("shtg", CircuitWO.SHEN_HE_TONG_GUO);
		query.setParameter("shbtg", CircuitWO.SHEN_HE_BU_TONG_GUO);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> checkSelectedWorkAreaUser(String workShopId, String rootId, String userId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM CircuitWO tr WHERE tr.panrentTask.id = :panrentTask AND tr.exist =:exist AND tr.owner.organization.id=:workShopId AND tr.owner.id!=:owerId" ;
		Query query = session.createQuery(hql);
		query.setParameter("panrentTask", rootId);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setParameter("workShopId",workShopId);
		query.setParameter("owerId",userId);
		List<CircuitWO> haveTaskUsers = query.list();
		List<User> repeatUsers = new ArrayList<User>();
		List<User> allUsers = userService.getUsersByParentOrgId(workShopId);
		for (CircuitWO taskRoot : haveTaskUsers) {
			repeatUsers.addAll(taskRoot.getReceiveUsers());
		}
		for(User u : repeatUsers){
			allUsers.remove(u);
		}
		return allUsers;
	}

	@Override
	public GridDto<CircuitWO> getCircuitWORecentOfToDoGridDto(CircuitWOSearchDto dto, int start, int limit) {
		List<CircuitWO> tasks = getToDoByDTO(dto, start, limit);
		long result = getToDoCountByDTO(dto);
		GridDto<CircuitWO> gridDto = new GridDto<CircuitWO>();
		gridDto.setRows(tasks);
		gridDto.setResults(result);
		return gridDto;
	}

}
