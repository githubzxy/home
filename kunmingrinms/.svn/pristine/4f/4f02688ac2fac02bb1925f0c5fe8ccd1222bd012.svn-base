
/**   
 * 文件名：TaskRootServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-13 下午3:20:30   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.taskManage.domain.TaskRoot;
import com.enovell.yunwei.taskManage.dto.TaskSearchDto;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.ManualPagingUtil;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootServiceImpl   
 * 类描述:  任务管理 非业务接口实现类
 * 创建人：ltf 
 * 创建时间：2016-12-13 下午3:20:30
 * 修改人：ltf
 * 修改时间：2016-12-13 下午3:20:30   
 *    
 */
@Transactional
@SuppressWarnings("unchecked")
@Service("taskRootService")
public class TaskRootServiceImpl implements TaskRootService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name="taskRootHistoryService")
	private TaskRootHistoryService taskRootHistoryService;
	
	@Resource(name="taskRootTreeService")
	private TaskRootTreeService taskRootTreeService;
	
	@Override
	public TaskRoot addTaskRoot(TaskRoot taskRoot) {
		taskRoot.setCreateTime(new Date());// 创建时间
		taskRoot.setIsRoot(TaskRoot.IS_ROOT);//是根
		taskRoot.setStatus(TaskRoot.CAO_GAO);// 草稿状态
		sessionFactory.getCurrentSession().save(taskRoot);
		return taskRoot;
	}
	
	@Override
	public TaskRoot updateTaskRoot(TaskRoot taskRoot){
		taskRoot.setStatus(TaskRoot.CAO_GAO);// 草稿状态
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		return taskRoot;
	}
	
	/**
	 * 
	 * deleteReceiveUsers 删除原有的执行人
	 * @param taskId 任务ID
	 */
	private void deleteReceiveUsers(String taskId, String userId){
		String hql = "DELETE FROM TASKROOT_USER t WHERE t.taskroot_id_ =:id AND t.USER_ID_ =:userId";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);
		query.setParameter("id", taskId);
		query.setParameter("userId", userId);
		query.executeUpdate();
	}
	
	@Override
	public void deleteTaskRootById(String id, User user){
		TaskRoot deleteTask = getById(id);
		if(deleteTask != null){
			// 删除执行人
			deleteReceiveUsers(deleteTask.getRoot().getId(), deleteTask.getOwner().getId());
			//删除子任务
			deleteChildren(deleteTask);
			//删除审核数据
			delCheckTask(deleteTask);
			//删除自己
			deleteTask.setExist(DataExistStatus.NOT_EXIST);// 状态改为不存在,即删除
			sessionFactory.getCurrentSession().saveOrUpdate(deleteTask);
			// 记录流水
			taskRootHistoryService.addTaskHistory(
					deleteTask.getRoot().getStatus(), TaskRoot.YI_GUI_DANG, deleteTask, user, "删除退回任务");
		}
	}
	
	/**
	 * 
	 * delCheckTask 删除审核数据
	 *
	 * @param deleteTask
	 */
	private void delCheckTask(TaskRoot deleteTask){
		String hql = " FROM TaskRoot t " 
						+ " WHERE t.root=:root AND  t.status in ( :statusArr) ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		String[] statusArr={TaskRoot.DAI_SHEN_HE, TaskRoot.SHEN_HE_TONG_GUO, TaskRoot.SHEN_HE_BU_TONG_GUO};
		query.setParameter("root", deleteTask);
		query.setParameterList("statusArr", statusArr);
		// 这就是一个判空动作
		Iterator<TaskRoot> it = query.list().iterator();
		while(it.hasNext()){
			TaskRoot temp = it.next();
			temp.setExist(DataExistStatus.NOT_EXIST);// 状态改为不存在,即删除
			sessionFactory.getCurrentSession().saveOrUpdate(temp);
		}
	}
	
	@Override
	public void deleteTaskRootByIds(String ids){
		String[] idArr=ids.split(",");
		for(String id : idArr){
			deleteById(id);
		}
	}
	
	/**
	 * 
	 * deleteById 进行逻辑删除
	 * @param id
	 */
	private void deleteById(String id){
		if (StringUtils.isNotBlank(id)) {
			TaskRoot taskRoot = (TaskRoot) sessionFactory.getCurrentSession().load(
					TaskRoot.class, id);
			deleteChildren(taskRoot);
			taskRoot.setExist(DataExistStatus.NOT_EXIST);
			sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		}
	}
	
	/**
	 * 
	 * deleteChildren 递归循环逻辑删除子
	 * @param deleteObj
	 */
	private void deleteChildren(TaskRoot deleteObj) {
		if (deleteObj.getChildren() != null) {
			Iterator<TaskRoot> it = deleteObj.getChildren().iterator();
			while (it.hasNext()) {
				TaskRoot temp = it.next();
				temp.setExist(DataExistStatus.NOT_EXIST);
				deleteChildren(temp);
				sessionFactory.getCurrentSession().saveOrUpdate(temp);
			}
		}
	}
	
	
	@Override
	public TaskRoot getById(String id){
		String hql = "FROM TaskRoot t " 
				+ " LEFT JOIN FETCH t.children "
				+ " LEFT JOIN FETCH t.owner tou "
				+ " LEFT JOIN FETCH tou.organization "
				+ " LEFT JOIN FETCH t.fileUser "
				+ " LEFT JOIN FETCH t.receiveUsers tru "
				+ " LEFT JOIN FETCH tru.organization "
				
				+ " LEFT JOIN FETCH t.taskAttachFile taf "
				+ " LEFT JOIN FETCH taf.files "

				+ " LEFT JOIN FETCH t.checkAttachFile caf "
				+ " LEFT JOIN FETCH caf.files "
				
				+ " LEFT JOIN FETCH t.responseAttachFile reaf "
				+ " LEFT JOIN FETCH reaf.files "
				
				+ " LEFT JOIN FETCH t.carbonCopyUser cu "
				+ " LEFT JOIN FETCH cu.organization "
				
				+ " LEFT JOIN FETCH t.root tr "
				+ " LEFT JOIN FETCH tr.linkman "
				+ " LEFT JOIN FETCH tr.sendUser "
				+ " LEFT JOIN FETCH tr.taskAttachFile traf "
				+ " LEFT JOIN FETCH traf.files "
				+ " LEFT JOIN FETCH tr.carbonCopyUser tcu "
				+ " LEFT JOIN FETCH tcu.organization "
				+ " WHERE t.id = :id ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		
		TaskRoot taskRoot = (TaskRoot) query.uniqueResult();
		// 显示所有父的分派备注
		if (taskRoot != null) {
			String remark = setAssignRemark(taskRoot);
			taskRoot.setTempAssignRemark(remark);
		}
		return taskRoot;
	}
	
	/**
	 * 设置分派信息
	 * 
	 * @param tempRoot
	 */
	private String setAssignRemark(TaskRoot taskRoot) {
		String remark = "";
		if (taskRoot.getPanrentTask() != null) {
			TaskRoot root = (TaskRoot) sessionFactory.getCurrentSession().load(TaskRoot.class, taskRoot
					.getPanrentTask().getId());
			remark = setAssignRemark(root);
			if (root.getOwner() != null
					&& root.getOwner().getOrganization() != null
					&& root.getIsRoot().equals(DispathRoot.IS_NOT_ROOT)) {
				remark += root.getOwner().getOrganization().getName()
						+ ":"
						+ (root.getAssignRemark() != null ? root
								.getAssignRemark() : "") + "\n";
			}
		}
		return remark;
	}
	
	@Override
	public GridDto<TaskRoot> getByGridDto(TaskSearchDto dto, int start, int limit){
		List<TaskRoot> rows = getByDto(dto, start, limit);
		long result = getCountByDto(dto);
		GridDto<TaskRoot> gridDto = new GridDto<TaskRoot>();
		gridDto.setRows(rows);
		gridDto.setResults(result);
		return gridDto;
	}
	
	/**
	 * 
	 * addColorByStatus 根据不同的状态设置不同的颜色
	 *
	 * @param list 任务的集合
	 * @return
	 */
	private List<TaskRoot> addColorByStatus(List<TaskRoot> list){
		for (TaskRoot taskRoot : list) {
			taskRootTreeService.addColorByStatus(taskRoot);
		}
		return list;
	}
	
	
	@Override
	public List<TaskRoot> getByDto(TaskSearchDto dto, int first, int max) {
		String hql = " FROM TaskRoot t " 
						+ " LEFT JOIN FETCH t.linkman "
						+ " WHERE 1 = 1";
		Map<String,Object> map = new HashMap<String,Object>();
		dto.setIsRoot(TaskRoot.IS_ROOT);//根任务
		/**
		 * 修改人：luoyan 2017-7-31 增加超期问题查询
		 */
		List<TaskRoot> list = new ArrayList<TaskRoot>();
		
		// 查询超期数据
		List<TaskRoot> overtimeList;
		// 查询未超期数据
		List<TaskRoot> notOvertimeList;
		
		//1.超期条件查询不为空
		if(StringUtils.isNotBlank(dto.getOvertimeStatus())){//查询超期条件不为空
			hql = createSql(hql,map,dto);
			overtimeList = getAllListQuery(hql,map,first,max);
			if(dto.getOvertimeStatus().equals(TaskRoot.IS_OVERTIME)){
				setOverTimeRecordsColorAttr(overtimeList);
			}
			addColorByStatus(overtimeList);
			return overtimeList;
		}
		
		//2.超期条件查询为空
		// 查询超期数据
		dto.setOvertimeStatus(TaskRoot.IS_OVERTIME);
		overtimeList = getAllListQuery(createSql(hql,map,dto),map,first,max);
		setOverTimeRecordsColorAttr(overtimeList);
		
		long overtimeCount = getCountByDto(dto);
		dto.setOvertimeStatus(TaskRoot.IS_NOT_OVERTIME);
	
		list.addAll(overtimeList);//只有超期数据
		//查出超期数据不够，需要再查询不超期数据
		if(ManualPagingUtil.isExecuteSecondFun(overtimeCount, first, max)){
			notOvertimeList = getAllListQuery(createSql(hql,map,dto),map,ManualPagingUtil.getSecondFirst(overtimeCount, first, max) , ManualPagingUtil.getSecondMax(overtimeCount, first, max));
			list.addAll(notOvertimeList);
		}
		dto.setOvertimeStatus(""); //条件恢复
		addColorByStatus(list);
		return list;
		
	}
	
	
	private List<TaskRoot> getAllListQuery(String hql, Map<String, Object> map,int first,int max) {
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		if(map!=null){
			for (Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<TaskRoot> overtimeList = query.list();
		return overtimeList;
	}

	/**
	 * 设置查询条件
	 * @param hql
	 * @param map
	 * @param dto
	 * @return
	 */
	private String createSql(String hql, Map<String, Object> map,TaskSearchDto dto) {
		if(dto==null){
			return hql;
		}
		//拥有超期形式的状态
		String overStatus = TaskRoot.DAI_JIE_SHOU+","+TaskRoot.CHU_LI_ZHONG;
		Date nowDate = new Date();
		
		StringBuffer str = new StringBuffer();
		str = str.append(hql);
		// 删除字段为1的条件(即未删除)
		str.append(" AND t.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		if(StringUtils.isNotBlank(dto.getTitle())){
			str.append(" AND t.title like :title ");
			map.put("title","%"+ dto.getTitle() + "%");
		}
		if(dto.getTaskLevel() != null){
			str.append(" AND t.taskLevel = :taskLevel ");
			map.put("taskLevel",dto.getTaskLevel());
		}
		if(dto.getTaskType() != null){
			str.append(" AND t.taskType = :taskType ");
			map.put("taskType", dto.getTaskType());
		}
		if(dto.getOwner()!=null){
			str.append(" AND t.owner = :owner ");
			map.put("owner",dto.getOwner());
		}
		if(dto.getCopyUser()!=null){
			str.append(" AND EXISTS ( FROM t.carbonCopyUser user WHERE user = :carbonCopyUser ) ");
			map.put("carbonCopyUser", dto.getCopyUser());
		}
		if(dto.getCreatUser()!=null){
			str.append(" AND t.creatUser = :creatUser ");
			map.put("creatUser",dto.getCreatUser());
		}
		if(StringUtils.isNotBlank(dto.getStatus())){
			str.append(" AND t.status = :status ");
			map.put("status",dto.getStatus());
		}
		if(StringUtils.isNotBlank(dto.getIsRoot())){
			str.append(" AND t.isRoot = :isRoot ");
			map.put("isRoot",dto.getIsRoot());
		}
		if (dto.getSendStartDate() != null) {
			str.append(" AND t.sendDate >= :sendDateStart ");
			map.put("sendDateStart",dto.getSendStartDate());
		}
		if (dto.getSendEndDate() != null) {
			str.append(" AND t.sendDate <= :sendDateEnd ");
			map.put("sendDateEnd", dto.getSendEndDate());
		}
		if(StringUtils.isNotBlank(dto.getOvertimeStatus())){
			if(dto.getOvertimeStatus().equals(TaskRoot.IS_OVERTIME)){
				str.append(" AND t.limitTime <= :nowDate and t.status in ("+overStatus+")  ORDER by t.limitTime ");
			}
			if(dto.getOvertimeStatus().equals(TaskRoot.IS_NOT_OVERTIME)){
				str.append("  and t.id not in ( select tr.id from TaskRoot tr where tr.limitTime <= :nowDate "
						+ "and tr.status in ("+overStatus+") ) ORDER BY t.createTime DESC ");
			}
			map.put("nowDate", nowDate);
		}
		
		return str.toString();
	}

	@Override
	public Long getCountByDto(TaskSearchDto dto) {
		String hql = " SELECT COUNT(t.id) FROM TaskRoot t "
						+ " WHERE 1 = 1 ";
		Map<String,Object> map = new HashMap<String,Object>();
		hql = createSql(hql,map,dto);//设置查询条件
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (Long)query.uniqueResult();
	}

	@Override
	public GridDto<TaskRoot> getCheckByGridDto(TaskSearchDto dto, int start, int limit){
		List<TaskRoot> rows = getCheckByDTO(dto, start, limit);
		long result = getCheckCountByDTO(dto);
		GridDto<TaskRoot> gridDto = new GridDto<TaskRoot>();
		gridDto.setRows(rows);
		gridDto.setResults(result);
		return gridDto;
	}
	
	@Override
	public List<TaskRoot> getCheckByDTO(TaskSearchDto dto, int first, int max) {
		String hql = " FROM TaskRoot t " 
			+ " LEFT JOIN FETCH t.root r "
			+ " LEFT JOIN FETCH r.linkman "
			+ " WHERE t.root is not null "
			+ " AND t.status in(:statusArr) ";
		Map<String,Object> map = new HashMap<String,Object>();
		dto.setIsRoot(TaskRoot.IS_NOT_ROOT);//隐藏条件-不是根任务
		hql = createCheckSql(hql,map,dto);//设置查询条件
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		String[] statusArr={TaskRoot.DAI_SHEN_HE,TaskRoot.SHEN_HE_TONG_GUO,TaskRoot.SHEN_HE_BU_TONG_GUO};
		query.setParameterList("statusArr", statusArr);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<TaskRoot> list = query.list();
		addColorByStatus(list);// 设置颜色
		return list;
				
	}

	/**
	 * 设置查询条件
	 * @param hql
	 * @param map
	 * @param dto
	 * @return
	 */
	private String createCheckSql(String hql, Map<String, Object> map,TaskSearchDto dto) {
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
			str.append(" AND r.title like :title ");
			map.put("title","%"+ dto.getTitle() + "%");
		}
		if(StringUtils.isNotBlank(dto.getStatus())){
			str.append(" AND t.status = :status ");
			map.put("status",dto.getStatus());
		}
		if(dto.getTaskLevel() != null){
			str.append(" AND r.taskLevel = :taskLevel ");
			map.put("taskLevel",dto.getTaskLevel());
		}
		if(dto.getTaskType() != null){
			str.append(" AND r.taskType = :taskType ");
			map.put("taskType", dto.getTaskType());
		}
		if (dto.getSendStartDate() != null) {
			str.append(" AND r.sendDate >= :sendDateStart ");
			map.put("sendDateStart",dto.getSendStartDate());
		}
		if (dto.getSendEndDate() != null) {
			str.append(" AND r.sendDate <= :sendDateEnd ");
			map.put("sendDateEnd", dto.getSendEndDate());
		}
		
		//拥有超期形式的状态
		String overStatus = TaskRoot.DAI_JIE_SHOU+","+TaskRoot.CHU_LI_ZHONG;
		Date nowDate = new Date();
		
		if(StringUtils.isNotBlank(dto.getOvertimeStatus())){
			if(dto.getOvertimeStatus().equals(TaskRoot.IS_OVERTIME)){
				str.append(" AND t.limitTime <= :nowDate and t.status in ("+overStatus+")  ORDER by t.limitTime ");
			}
			if(dto.getOvertimeStatus().equals(TaskRoot.IS_NOT_OVERTIME)){
				str.append("  and t.id not in ( select tr.id from TaskRoot tr where tr.limitTime <= :nowDate "
						+ "and tr.status in ("+overStatus+") ) ORDER BY t.createTime DESC ");
			}
			map.put("nowDate", nowDate);
		}
		return str.toString();
	}
	
	@Override
	public Long getCheckCountByDTO(TaskSearchDto dto) {
		String hql = " SELECT COUNT(t.id) FROM TaskRoot t "
			+ " WHERE t.status in(:statusArr) ";
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createSql(hql, map,dto);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		String[] statusArr={TaskRoot.DAI_SHEN_HE,TaskRoot.SHEN_HE_TONG_GUO,TaskRoot.SHEN_HE_BU_TONG_GUO};
		query.setParameterList("statusArr", statusArr);
		
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (Long) query.uniqueResult();
	}
	
	private List<TaskRoot> setOverTimeRecordsColorAttr(List<TaskRoot> list){
		for(TaskRoot l : list){
			l.setYiChaoQi(true);
		}
		return list;

	}

	@Override
	public GridDto<TaskRoot> getAddListByGridDto(TaskSearchDto dto, int start, int limit) {
		List<TaskRoot> rows = getAddListByDto(dto, start, limit);
		long result = getAddListCountByDto(dto);
		GridDto<TaskRoot> gridDto = new GridDto<TaskRoot>();
		gridDto.setRows(rows);
		gridDto.setResults(result);
		return gridDto;
	}

	private long getAddListCountByDto(TaskSearchDto dto) {
		String hql = " SELECT COUNT(t.id) FROM TaskRoot t "
				+ " WHERE 1 = 1 ";
		Map<String,Object> map = new HashMap<String,Object>();
		hql = createAddListSql(hql,map,dto);//设置查询条件
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (Long)query.uniqueResult();
	}

	private List<TaskRoot> getAddListByDto(TaskSearchDto dto, int start, int limit) {
		String hql = " FROM TaskRoot t " 
				+ " LEFT JOIN FETCH t.linkman "
				+ " WHERE 1 = 1";
		Map<String,Object> map = new HashMap<String,Object>();
		dto.setIsRoot(TaskRoot.IS_ROOT);//根任务
		hql = createAddListSql(hql,map,dto)  + " ORDER BY t.createTime DESC ";//设置查询条件
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<TaskRoot> list = query.list();
		addColorByStatus(list);// 添加颜色
		return list;
	}
	private String createAddListSql(String hql, Map<String, Object> map,TaskSearchDto dto) {
		if(dto==null){
			return hql;
		}
		
		StringBuffer str = new StringBuffer();
		str = str.append(hql);
		// 删除字段为1的条件(即未删除)
		str.append(" AND t.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		if(StringUtils.isNotBlank(dto.getTitle())){
			str.append(" AND t.title like :title ");
			map.put("title","%"+ dto.getTitle() + "%");
		}
		if(dto.getTaskLevel() != null){
			str.append(" AND t.taskLevel = :taskLevel ");
			map.put("taskLevel",dto.getTaskLevel());
		}
		if(dto.getTaskType() != null){
			str.append(" AND t.taskType = :taskType ");
			map.put("taskType", dto.getTaskType());
		}
		if(dto.getOwner()!=null){
			str.append(" AND t.owner = :owner ");
			map.put("owner",dto.getOwner());
		}
		if(dto.getCopyUser()!=null){
			str.append(" AND EXISTS ( FROM t.carbonCopyUser user WHERE user = :carbonCopyUser ) ");
			map.put("carbonCopyUser", dto.getCopyUser());
		}
		if(dto.getCreatUser()!=null){
			str.append(" AND t.creatUser = :creatUser ");
			map.put("creatUser",dto.getCreatUser());
		}
		if(StringUtils.isNotBlank(dto.getStatus())){
			str.append(" AND t.status = :status ");
			map.put("status",dto.getStatus());
		}
		if(StringUtils.isNotBlank(dto.getIsRoot())){
			str.append(" AND t.isRoot = :isRoot ");
			map.put("isRoot",dto.getIsRoot());
		}
		if (dto.getSendStartDate() != null) {
			str.append(" AND t.sendDate >= :sendDateStart ");
			map.put("sendDateStart",dto.getSendStartDate());
		}
		if (dto.getSendEndDate() != null) {
			str.append(" AND t.sendDate <= :sendDateEnd ");
			map.put("sendDateEnd", dto.getSendEndDate());
		}
		return str.toString();
	}
}
