package com.enovell.yunwei.circuitWO.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.circuitWO.dto.CircuitWOSearchDto;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.ManualPagingUtil;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.Map.Entry;

@Transactional
@Service("circuitWOService")
public class CircuitWOServiceImpl implements CircuitWOService {

	@Autowired
	private SessionFactory sessionFactory;
	@Resource(name="circuitWOHistoryService")
	private CircuitWOHistoryService historyService;
	@Resource(name="circuitRootTreeService")
	private CircuitWORootTreeService treeService;
	
	@Override
	public GridDto<CircuitWO> getAddListByGridDto(CircuitWOSearchDto dto, int start, int limit) {
		List<CircuitWO> rows = getAddListByDto(dto, start, limit);
		long result = getAddListCountByDto(dto);
		GridDto<CircuitWO> gridDto = new GridDto<CircuitWO>();
		gridDto.setRows(rows);
		gridDto.setResults(result);
		return gridDto;
	}

	/**
	 * getAddListCountByDto 查询新增电路工单任务总数
	 * @param dto 查询条件封装的对象
	 * @return Long 总数
	 */
	private Long getAddListCountByDto(CircuitWOSearchDto dto) {
		String hql = " SELECT COUNT(t.id) FROM CircuitWO t "
				+ " WHERE 1 = 1 ";
		Map<String,Object> map = new HashMap<String,Object>();
		hql = createAddListSql(hql,map,dto);//设置查询条件
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (Long)query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	private List<CircuitWO> getAddListByDto(CircuitWOSearchDto dto, int start, int limit) {
		String hql = " FROM CircuitWO t "
				+ " LEFT JOIN FETCH t.linkman "
				+ " WHERE 1 = 1";
		Map<String,Object> map = new HashMap<String,Object>();
		dto.setIsRoot(CircuitWO.IS_ROOT);//根任务
		hql = createAddListSql(hql,map,dto)  + " ORDER BY t.createTime DESC ";//设置查询条件
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<CircuitWO> list = query.list();
		addColorByStatus(list);// 添加颜色
		return list;
	}

	/**
	 * addColorByStatus 根据不同的状态设置不同的颜色
	 * @param list 任务的集合
	 * @return
	 */
	private List<CircuitWO> addColorByStatus(List<CircuitWO> list){
		for (CircuitWO taskRoot : list) {
			treeService.addColorByStatus(taskRoot);
		}
		return list;
	}

	@Override
	public GridDto<CircuitWO> getByGridDto(CircuitWOSearchDto dto, int start, int limit) {
		List<CircuitWO> rows = getByDto(dto, start, limit);
		long result = getCountByDto(dto);
		GridDto<CircuitWO> gridDto = new GridDto<CircuitWO>();
		gridDto.setRows(rows);
		gridDto.setResults(result);
		return gridDto;
	}
	/**
	 * getCountByDto 通过查询条件获取工单总数
	 * @param dto 查询条件封装的对象
	 * @return Long 总数
	 */
	private Long getCountByDto(CircuitWOSearchDto dto) {
		String hql = " SELECT COUNT(t.id) FROM CircuitWO t "
				+ " WHERE 1 = 1 ";
		Map<String,Object> map = new HashMap<String,Object>();
		hql = createSql(hql,map,dto);//设置查询条件
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (Long)query.uniqueResult();
	}
	
	/**
	 * getByDto 通过查询条件分页获取工单数据
	 * @param dto 查询条件封装的对象
	 * @param start 开始行
	 * @param limit 每页行数
	 */
	private List<CircuitWO> getByDto(CircuitWOSearchDto dto, int start, int limit) {
		String hql = " FROM CircuitWO t "
				+ " LEFT JOIN FETCH t.linkman "
				+ " WHERE 1 = 1";
		Map<String,Object> map = new HashMap<String,Object>();
		dto.setIsRoot(CircuitWO.IS_ROOT);//根任务
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
			hql = createSql(hql,map,dto);
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
		overtimeList = getAllListQuery(createSql(hql,map,dto),map,start,limit);
		setOverTimeRecordsColorAttr(overtimeList);
		
		long overtimeCount = getCountByDto(dto);
		dto.setOvertimeStatus(CircuitWO.IS_NOT_OVERTIME);
		
		list.addAll(overtimeList);//只有超期数据
		//查出超期数据不够，需要再查询不超期数据
		if(ManualPagingUtil.isExecuteSecondFun(overtimeCount, start, limit)){
			notOvertimeList = getAllListQuery(createSql(hql,map,dto),map,ManualPagingUtil.getSecondFirst(overtimeCount, start, limit) , ManualPagingUtil.getSecondMax(overtimeCount, start, limit));
			list.addAll(notOvertimeList);
		}
		dto.setOvertimeStatus(""); //条件恢复
		addColorByStatus(list);
		return list;
	}

	private List<CircuitWO> setOverTimeRecordsColorAttr(List<CircuitWO> overtimeList) {
		for(CircuitWO circuit : overtimeList){
			circuit.setYiChaoQi(true);
		}
		return overtimeList;
	}

	@SuppressWarnings("unchecked")
	private List<CircuitWO> getAllListQuery(String hql, Map<String, Object> map, int start, int limit) {
		Query query =sessionFactory.getCurrentSession().createQuery(hql);
		if(map!=null){
			for (Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<CircuitWO> overtimeList = query.list();
		return overtimeList;
	}

	@Override
	public CircuitWO getById(String id) {
		String hql = "FROM CircuitWO t "
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
		
		CircuitWO taskRoot = (CircuitWO) query.uniqueResult();
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
	 * @param taskRoot
	 */
	private String setAssignRemark(CircuitWO taskRoot) {
		String remark = "";
		if (taskRoot.getPanrentTask() != null) {
			CircuitWO root = (CircuitWO) sessionFactory.getCurrentSession().load(CircuitWO.class, taskRoot
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
	public void deleteCircuitWOByIds(String ids) {
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
			CircuitWO taskRoot = (CircuitWO) sessionFactory.getCurrentSession().load(
					CircuitWO.class, id);
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
	private void deleteChildren(CircuitWO deleteObj) {
		if (deleteObj.getChildren() != null) {
			Iterator<CircuitWO> it = deleteObj.getChildren().iterator();
			while (it.hasNext()) {
				CircuitWO temp = it.next();
				temp.setExist(DataExistStatus.NOT_EXIST);
				deleteChildren(temp);
				sessionFactory.getCurrentSession().saveOrUpdate(temp);
			}
		}
	}

	@Override
	public GridDto<CircuitWO> getCheckByGridDto(CircuitWOSearchDto dto, int start, int limit) {
		List<CircuitWO> rows = getCheckByDTO(dto, start, limit);
		long result = getCheckCountByDTO(dto);
		GridDto<CircuitWO> gridDto = new GridDto<CircuitWO>();
		gridDto.setRows(rows);
		gridDto.setResults(result);
		return gridDto;
	}

	private Long getCheckCountByDTO(CircuitWOSearchDto dto) {
		String hql = " SELECT COUNT(t.id) FROM CircuitWO t "
				+ " WHERE t.status in(:statusArr) ";
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createSql(hql, map,dto);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		String[] statusArr={CircuitWO.DAI_SHEN_HE,CircuitWO.SHEN_HE_TONG_GUO,CircuitWO.SHEN_HE_BU_TONG_GUO};
		query.setParameterList("statusArr", statusArr);
		
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (Long) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	private List<CircuitWO> getCheckByDTO(CircuitWOSearchDto dto, int start, int limit) {
		String hql = " FROM CircuitWO t "
				+ " LEFT JOIN FETCH t.root r "
				+ " LEFT JOIN FETCH r.linkman "
				+ " WHERE t.root is not null "
				+ " AND t.status in(:statusArr) ";
		Map<String,Object> map = new HashMap<String,Object>();
		dto.setIsRoot(CircuitWO.IS_NOT_ROOT);//隐藏条件-不是根任务
		hql = createCheckSql(hql,map,dto);//设置查询条件
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		String[] statusArr={CircuitWO.DAI_SHEN_HE,CircuitWO.SHEN_HE_TONG_GUO,CircuitWO.SHEN_HE_BU_TONG_GUO};
		query.setParameterList("statusArr", statusArr);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<CircuitWO> list = query.list();
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
	private String createSql(String hql, Map<String, Object> map,CircuitWOSearchDto dto) {
		if(dto==null){
			return hql;
		}
		//拥有超期形式的状态
		String overStatus = CircuitWO.DAI_JIE_SHOU+","+CircuitWO.CHU_LI_ZHONG;
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
			if(dto.getOvertimeStatus().equals(CircuitWO.IS_OVERTIME)){
				str.append(" AND t.limitTime <= :nowDate and t.status in ("+overStatus+")  ORDER by t.limitTime ");
			}
			if(dto.getOvertimeStatus().equals(CircuitWO.IS_NOT_OVERTIME)){
				str.append("  and t.id not in ( select tr.id from CircuitWO tr where tr.limitTime <= :nowDate "
						+ "and tr.status in ("+overStatus+") ) ORDER BY t.createTime DESC ");
			}
			map.put("nowDate", nowDate);
		}
		
		return str.toString();
	}
	
	/**
	 * createAddListSql 封装查询参数并创建对应sql语句
	 * @param hql 待拼装查询语句的sql
	 * @param map 查询传参map集合
	 * @param dto 查询条件封装的对象
	 * @return hql String：返回拼装好的sql语句（map中传参的值也设置 好了）
	 */
	private String createAddListSql(String hql, Map<String, Object> map,CircuitWOSearchDto dto) {
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

	@Override
	public CircuitWO addCircuitWO(CircuitWO taskRoot) {
		taskRoot.setCreateTime(new Date());// 创建时间
		taskRoot.setIsRoot(CircuitWO.IS_ROOT);//是根
		taskRoot.setStatus(CircuitWO.CAO_GAO);// 草稿状态
		sessionFactory.getCurrentSession().save(taskRoot);
		return taskRoot;
	}

	@Override
	public CircuitWO updateCircuitWO(CircuitWO taskRoot) {
		taskRoot.setStatus(CircuitWO.CAO_GAO);// 草稿状态
		sessionFactory.getCurrentSession().saveOrUpdate(taskRoot);
		return taskRoot;
	}

	@Override
	public void deleteCircuitWOById(String id, User user) {
		CircuitWO deleteTask = getById(id);
		if(deleteTask != null){
			// 删除执行人
			deleteReceiveUsers(deleteTask.getRoot().getId(), deleteTask.getOwner().getId());
			//删除子任务
			deleteChildren(deleteTask);
			//删除审核数据
			delCheckCircuitWO(deleteTask);
			//删除自己
			deleteTask.setExist(DataExistStatus.NOT_EXIST);// 状态改为不存在,即删除
			sessionFactory.getCurrentSession().saveOrUpdate(deleteTask);
			// 记录流水
			historyService.addCircuitWOHistory(
					deleteTask.getRoot().getStatus(), CircuitWO.YI_GUI_DANG, deleteTask, user, "删除退回任务");
		}
	}

	/**
	 * delCheckTask 删除审核数据
	 * @param deleteTask 待删除审核数据的任务信息对象
	 */
	@SuppressWarnings("unchecked")
	private void delCheckCircuitWO(CircuitWO deleteTask){
		String hql = " FROM CircuitWO t "
						+ " WHERE t.root=:root AND  t.status in ( :statusArr) ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		String[] statusArr={CircuitWO.DAI_SHEN_HE, CircuitWO.SHEN_HE_TONG_GUO, CircuitWO.SHEN_HE_BU_TONG_GUO};
		query.setParameter("root", deleteTask);
		query.setParameterList("statusArr", statusArr);
		// 这就是一个判空动作
		Iterator<CircuitWO> it = query.list().iterator();
		while(it.hasNext()){
			CircuitWO temp = it.next();
			temp.setExist(DataExistStatus.NOT_EXIST);// 状态改为不存在,即删除
			sessionFactory.getCurrentSession().saveOrUpdate(temp);
		}
	}
	/**
	 * deleteReceiveUsers 删除原有的执行人
	 * @param taskId 任务ID
	 */
	private void deleteReceiveUsers(String taskId, String userId){
		String hql = "DELETE FROM CIRCUIT_WORK_ORDER_USER t WHERE t.taskroot_id_ =:id AND t.USER_ID_ =:userId";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);
		query.setParameter("id", taskId);
		query.setParameter("userId", userId);
		query.executeUpdate();
	}

	/**
	 * 设置查询条件
	 * @param hql
	 * @param map
	 * @param dto
	 * @return
	 */
	private String createCheckSql(String hql, Map<String, Object> map,CircuitWOSearchDto dto) {
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
		String overStatus = CircuitWO.DAI_JIE_SHOU+","+CircuitWO.CHU_LI_ZHONG;
		Date nowDate = new Date();
		
		if(StringUtils.isNotBlank(dto.getOvertimeStatus())){
			if(dto.getOvertimeStatus().equals(CircuitWO.IS_OVERTIME)){
				str.append(" AND t.limitTime <= :nowDate and t.status in ("+overStatus+")  ORDER by t.limitTime ");
			}
			if(dto.getOvertimeStatus().equals(CircuitWO.IS_NOT_OVERTIME)){
				str.append("  and t.id not in ( select tr.id from CircuitWO tr where tr.limitTime <= :nowDate "
						+ "and tr.status in ("+overStatus+") ) ORDER BY t.createTime DESC ");
			}
			map.put("nowDate", nowDate);
		}
		return str.toString();
	}
}
