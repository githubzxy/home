package com.enovell.yunwei.dispathRoot.service.impl;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.dispathRoot.dto.DispathManageDTO;
import com.enovell.yunwei.dispathRoot.service.DispathRootHistoryService;
import com.enovell.yunwei.dispathRoot.service.DispathRootService;
import com.enovell.yunwei.dispathRoot.service.DispathRootTreeService;
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

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathRootServiceImpl   
 * 类描述:  调度管理非业务接口实现
 * 创建人：lidt 
 * 创建时间：2016-12-16 上午10:32:34
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:32:34   
 *
 */
@SuppressWarnings("unchecked")
@Transactional
@Service("DispathRootService")
public class DispathRootServiceImpl implements DispathRootService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "DispathRootService")
	private DispathRootService dispathRootService;

	@Resource(name = "DispathRootHistoryService")
	private DispathRootHistoryService historyService;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Resource(name = "DispathRootTreeService")
	private DispathRootTreeService treeService;
	
	@Resource(name = "userService")
	private UserService userService;

	@Override
	public DispathRoot getById(String id) {
		String sql = "FROM DispathRoot dr " 
				+ " LEFT JOIN FETCH dr.createUser "
				+ " LEFT JOIN FETCH dr.sendUser su "
				+ " LEFT JOIN FETCH su.organization "
				+ " LEFT JOIN FETCH dr.acceptUser dra "
				+ " LEFT JOIN FETCH dra.organization "
				+ " LEFT JOIN FETCH dr.copyUser drc "
				+ " LEFT JOIN FETCH drc.organization "
				+ " LEFT JOIN FETCH dr.attachFile da "
				+ " LEFT JOIN FETCH dr.replyAttachFile dre "
				+ " LEFT JOIN FETCH dr.parentDispath "
				+ " LEFT JOIN FETCH dr.user dru "
				+ " LEFT JOIN FETCH dru.organization "
				+ " LEFT JOIN FETCH dr.children "

				+ " LEFT JOIN FETCH dr.root drr "
				+ " LEFT JOIN FETCH drr.attachFile draf "
				+ " LEFT JOIN FETCH draf.files "
				+ " LEFT JOIN FETCH drr.sendUser drru "
				+ " LEFT JOIN FETCH drru.organization "

				+ " WHERE dr.id = :id ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("id", id);

		DispathRoot tempRoot = (DispathRoot) query.uniqueResult();
		if (tempRoot != null) {
			String remark = setAssignRemark(tempRoot);
			tempRoot.setTempAssignRemark(remark);
		}
		return tempRoot;
	}

	/**
	 * 设置分派信息
	 * 
	 * @param tempRoot
	 */
	private String setAssignRemark(DispathRoot tempRoot) {
		String remark = "";
		if (tempRoot.getParentDispath() != null) {
			DispathRoot root = (DispathRoot) sessionFactory.getCurrentSession().load(DispathRoot.class, tempRoot
					.getParentDispath().getId());
			remark = setAssignRemark(root);
			if (root.getUser() != null
					&& root.getUser().getOrganization() != null
					&& root.getIsRoot().equals(DispathRoot.IS_NOT_ROOT)) {
				remark += root.getUser().getOrganization().getName()
						+ ":"
						+ (root.getAssignRemark() != null ? root
								.getAssignRemark() : "") + "\n";
			}
		}
		return remark;
	}

	/**
	 * 
	 * changeAttachFile 改变附件，用于新增、新增并派发、修改、修改并派发
	 *
	 * @author lidt
	 * @date 2017-7-5 下午3:56:15 
	 * @param dispathById 根据ID查询的调令 
	 * @param dispathRoot 修改的调令
	 * @param dtos
	 * @param user
	 */
	private void changeAttachFile(DispathRoot dispathById, DispathRoot dispathRoot, UploadFileDto[] dtos, User user){
		// 存在附件,则必然是修改操作
		if (dispathById != null && dispathById.getAttachFile() != null) {
			String attachFileId = dispathById.getAttachFile().getId();
			attachFileService.updateAttachFile(dtos, attachFileId);
		} else {// 不存在附件,则有可能是新增也有可能是修改(修改的时候原附件为空相当于也是新增)
				// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			dispathRoot.setAttachFile(attachFile);
		}
	}

	@Override
	public DispathRoot add(DispathRoot dispathRoot, UploadFileDto[] dtos) {
		// 保存附件
		changeAttachFile(null, dispathRoot, dtos, dispathRoot.getCreateUser());
		dispathRoot.setIsRoot(DispathRoot.IS_ROOT);
		dispathRoot.setStatus(DispathRoot.CAO_GAO);// 保存为草稿
		sessionFactory.getCurrentSession().save(dispathRoot);
		return dispathRoot;
	}

	/**
	 * 
	 * setDispathRoot 设置修改的内容
	 *
	 * @param dispathRoot 修改的调令
	 * @param dispathById 根据ID查询的调令
	 * @return
	 */
	private DispathRoot setDispathRoot(DispathRoot dispathRoot, DispathRoot dispathById){
		dispathById.setId(dispathRoot.getId());// ID
		dispathById.setDispatchNum(dispathRoot.getDispatchNum());// 命令号
		dispathById.setCreateDate(dispathRoot.getCreateDate());// 创建时间
		dispathById.setOrganization(dispathRoot.getOrganization());// 受令单位
		dispathById.setDispatchUser(dispathRoot.getDispatchUser());// 值班调度
		dispathById.setAcceptUser(dispathRoot.getAcceptUser());
		dispathById.setCopyUser(dispathRoot.getCopyUser());
		dispathById.setSuggestion(dispathRoot.getSuggestion());// 命令内容
		dispathById.setIssueUser(dispathRoot.getIssueUser());// 命令签发者
		dispathById.setDeadLine(dispathRoot.getDeadLine());//完成期限
		return dispathById;
	}
	
	@Override
	public DispathRoot update(DispathRoot dispathRoot, UploadFileDto[] dtos, User user) {
		DispathRoot dispathById = dispathRootService.getById(dispathRoot.getId());
		dispathRoot = setDispathRoot(dispathRoot, dispathById);
		// 保存附件
		changeAttachFile(dispathById, dispathRoot, dtos, user);
		Session session = sessionFactory.getCurrentSession();
		// 清除原有的子调令
		DispathRoot moveChild = (DispathRoot) session.load(DispathRoot.class, dispathRoot.getId());
		if (moveChild.getChildren() != null) {
			Iterator<DispathRoot> it = moveChild.getChildren().iterator();
			while (it.hasNext()) {
				// 由于新功能（接收后还能转派）所以清除子调令改为逻辑删除
				it.next().setExist(DataExistStatus.NOT_EXIST);
			}
		}
		dispathRoot.setSendDate(null);
		dispathRoot.setStatus(DispathRoot.CAO_GAO);
		// 清除缓存
		session.evict(moveChild); 
		sessionFactory.getCurrentSession().saveOrUpdate(dispathRoot);
		return dispathRoot;
	}

	@Override
	public void delById(String id) {
		Session session = sessionFactory.getCurrentSession();
		DispathRoot deleteObj = (DispathRoot) session.load(DispathRoot.class, id);
		if (deleteObj != null) {
			delChildren(deleteObj);
			// 如果状态为已派发，需要删除操作流水，删除待办
			// 删除操作流水
			historyService.deleteHistoryByObj(deleteObj);
			session.delete(deleteObj);
		}
	}

	/**
	 * 递归循环删除子
	 * 
	 * @param deleteObj
	 */
	private void delChildren(DispathRoot deleteObj) {
		if (deleteObj.getChildren() != null) {
			Iterator<DispathRoot> it = deleteObj.getChildren().iterator();
			while (it.hasNext()) {
				DispathRoot temp = it.next();
				delChildren(temp);
				// 删除流水
				historyService.deleteHistoryByObj(temp);
				sessionFactory.getCurrentSession().delete(temp);
			}
		}
	}

	@Override
	public void delByIds(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
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
			DispathRoot dispathRoot = (DispathRoot) sessionFactory.getCurrentSession().load(
					DispathRoot.class, id);
			deleteChildren(dispathRoot);
			dispathRoot.setExist(DataExistStatus.NOT_EXIST);
			sessionFactory.getCurrentSession().saveOrUpdate(dispathRoot);
		}
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
				temp.setExist(DataExistStatus.NOT_EXIST);
				deleteChildren(temp);
				sessionFactory.getCurrentSession().saveOrUpdate(temp);
			}
		}
	}
	
	@Override
	public GridDto<DispathRoot> getByGridDto(DispathManageDTO dto, int start, int limit){
		List<DispathRoot> list = new ArrayList<DispathRoot>();
		long results = 0;
		if(dto.getOverTimeStatus().equals("")){
			//查询超期数据
			dto.setOverTimeStatus(DispathRoot.IS_OVERTIME);
			list.addAll(getByDTO(dto, start, limit));
			results  = getCountByDTO(dto);
			
			//查询不超期的数据
			dto.setOverTimeStatus(DispathRoot.IS_NOT_OVERTIME);
			if(ManualPagingUtil.isExecuteSecondFun(results, start, limit)){
				list.addAll(getByDTO(dto,ManualPagingUtil.getSecondFirst(results, start, limit) , ManualPagingUtil.getSecondMax(results, start, limit)));
			}
			results  += getCountByDTO(dto);
		}else{
			list = getByDTO(dto, start, limit);
			results = getCountByDTO(dto);
		}
		GridDto<DispathRoot> gridDto = new GridDto<DispathRoot>();
		gridDto.setRows(list);
		gridDto.setResults(results);
		return gridDto;
	}

	@Override
	public List<DispathRoot> getByDTO(DispathManageDTO dto, int start, int limit) {
		String hql = " FROM DispathRoot d "
				+ " LEFT JOIN FETCH d.createUser u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH d.root r "
				+ " LEFT JOIN FETCH r.sendUser rsu "
				+ " LEFT JOIN FETCH rsu.organization "
				+ " WHERE 1 = 1" ;
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createSql(hql, map, dto) ;// 设置查询条件
		//当数据的查询结构不是超期数据时，按照创建事件倒序排序
		if(dto.getOverTimeStatus().equals(DispathRoot.IS_NOT_OVERTIME)){
			hql += " ORDER BY d.createDate DESC ";
		}
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<DispathRoot> list = query.list();
		if(dto.getOverTimeStatus().equals(DispathRoot.IS_OVERTIME)){
			return setOverTimeRecordsColorAttr(list);
		}
		addColor(list);// 添加颜色
		return list;

	}
	/**
	 * 
	 * setOverTimeRecordsColorAttr 给超期的数据设置颜色
	 * @author quyy
	 * @param wotList
	 * @return
	 */
	private List<DispathRoot> setOverTimeRecordsColorAttr(List<DispathRoot> wotList){
		for(DispathRoot wot : wotList){
			wot.setYiChaoQi(true);
		}
		return wotList;
	}
	

	/**
	 * 
	 * addColor 设置调度命令不同状态下显示不同颜色
	 * @param lists
	 * @return
	 */
	private void addColor(List<DispathRoot> lists) {
		for (DispathRoot dr : lists) {
			treeService.addStatusTreeColor(dr);
		}
	}
	
	/**
	 * 设置查询条件
	 * 
	 * @param hql
	 * @param map
	 * @param dto
	 * @return
	 */
	private String createSql(String hql, Map<String, Object> map, DispathManageDTO dto) {
		StringBuffer str = new StringBuffer();
		str = str.append(hql);
		// 删除字段为1的条件(即未删除)
		str.append(" AND d.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		if (dto.getDispatchNum() != null) {
			str.append(" AND d.dispatchNum like :dispatchNum ");
			map.put("dispatchNum", "%" + dto.getDispatchNum() + "%");
		}
		if (dto.getStatus() != null) {
			str.append(" AND d.status = :status ");
			map.put("status", dto.getStatus());
		}
		if (dto.getUser() != null) {
			str.append(" AND d.user = :user");
			map.put("user", dto.getUser());
		}
		if (dto.getSendDateStartByRoot() != null) {
			str.append(" AND d.sendDate >= :sendDateStart ");
			map.put("sendDateStart",dto.getSendDateStartByRoot());
		}
		if (dto.getSendDateEndByRoot() != null) {
			str.append(" AND d.sendDate <= :sendDateEnd ");
			map.put("sendDateEnd", dto.getSendDateEndByRoot());
		}
		if (dto.getSendDateStart() != null) {
			str.append(" AND d.parentDispath.sendDate >= :sendDateStart ");
			map.put("sendDateStart",dto.getSendDateStart());
		}
		if (dto.getSendDateEnd() != null) {
			str.append(" AND d.parentDispath.sendDate <= :sendDateEnd ");
			map.put("sendDateEnd", dto.getSendDateEnd());
		}
		if (dto.getIsRoot() != null) {
			str.append(" AND d.isRoot = :isRoot ");
			map.put("isRoot", dto.getIsRoot());
		}
		if (dto.getCopyUser() != null) {
			str.append(" AND EXISTS ( FROM d.copyUser user WHERE user = :copyUser ) ");
			map.put("copyUser", dto.getCopyUser());
		}if(dto.getOverTimeStatus().equals(DispathRoot.IS_OVERTIME)){
			str.append(" AND d.deadLine <:nowDate AND d.status in(:chuliStatus,:daiJieShouStatus,:daiHuiFuStatus) order by d.deadLine ");
			map.put("chuliStatus", DispathRoot.CHU_LI_ZHONG);
			map.put("daiJieShouStatus", DispathRoot.DAI_JIE_SHOU);
			map.put("daiHuiFuStatus", DispathRoot.DAI_HUI_FU);
			map.put("nowDate", new Date());
			
		}else if(dto.getOverTimeStatus().equals(DispathRoot.IS_NOT_OVERTIME)){
			str.append(" And d.id not in(select t.id from DispathRoot t where t.status in(:chuliStatus,:daiJieShouStatus,:daiHuiFuStatus) and t.deadLine <:nowDate) ");
			map.put("chuliStatus", DispathRoot.CHU_LI_ZHONG);
			map.put("daiJieShouStatus", DispathRoot.DAI_JIE_SHOU);
			map.put("daiHuiFuStatus", DispathRoot.DAI_HUI_FU);
			map.put("nowDate", new Date());
		}
		return str.toString();
	}

	@Override
	public int getCountByDTO(DispathManageDTO dto) {
		String hql = " SELECT COUNT(d.id) FROM DispathRoot d "
				+ " WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createSql(hql, map, dto);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	
	@Override
	public GridDto<DispathRoot> getToDoByGridDto(DispathManageDTO dto,int start,int limit){
		List<DispathRoot> list = new ArrayList<DispathRoot>();
		long results = 0;
		if(dto.getOverTimeStatus().equals("")){
			//查询超期数据
			dto.setOverTimeStatus(DispathRoot.IS_OVERTIME);
			list.addAll(getToDoByDTO(dto, start, limit));
			results  = getToDoCountByDTO(dto);
			
			//查询不超期的数据
			dto.setOverTimeStatus(DispathRoot.IS_NOT_OVERTIME);
			if(ManualPagingUtil.isExecuteSecondFun(results, start, limit)){
				list.addAll(getToDoByDTO(dto,ManualPagingUtil.getSecondFirst(results, start, limit) , ManualPagingUtil.getSecondMax(results, start, limit)));
			}
			results  += getToDoCountByDTO(dto);
		}else{
			list = getToDoByDTO(dto, start, limit);
			results = getToDoCountByDTO(dto);
		}
		GridDto<DispathRoot> gridDto = new GridDto<DispathRoot>();
		gridDto.setRows(list);
		gridDto.setResults(results);
		return gridDto;
	}
	
	@Override
	public List<DispathRoot> getToDoByDTO(DispathManageDTO dto, int start, int limit) {
		String hql = " FROM DispathRoot d "
				+ " LEFT JOIN FETCH d.createUser u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH d.parentDispath dp "
				+ " LEFT JOIN FETCH dp.sendUser dps "
				+ " LEFT JOIN FETCH dps.organization "
				+ " LEFT JOIN FETCH d.root r "
				+ " LEFT JOIN FETCH r.sendUser rsu "
				+ " LEFT JOIN FETCH rsu.organization "
				+ " WHERE 1 = 1 " ;
		Map<String, Object> map = new HashMap<String, Object>();
		//进行排序的状态，按数组中顺序对查询结果进行排序
		String[] status = new String[]{DispathRoot.DAI_JIE_SHOU,DispathRoot.DAI_HUI_FU,DispathRoot.CHU_LI_ZHONG,DispathRoot.YI_FEN_PAI,DispathRoot.YI_HUI_FU,DispathRoot.YI_GUI_DANG};
		hql = createSql(hql, map, dto);// 设置查询条件
		if(dto.getOverTimeStatus().equals(DispathRoot.IS_NOT_OVERTIME)){
			hql += " ORDER BY decode(d.status,"+OderStatusUtil.getOderStatus(status)+"),d.createDate DESC ";
		}
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<DispathRoot> list = query.list();
		if(dto.getOverTimeStatus().equals(DispathRoot.IS_OVERTIME)){
			return setOverTimeRecordsColorAttr(list);
		}
		addColor(list);// 添加颜色
		return list;
	}

	@Override
	public int getToDoCountByDTO(DispathManageDTO dto) {
		String hql = " SELECT COUNT(d.id) FROM DispathRoot d "
				+ " WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createSql(hql, map, dto);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}

	@Override
	public DispathRoot getDispatchByParent(DispathRoot parent) {
		String hql = "FROM DispathRoot dr "
				+ " LEFT JOIN FETCH dr.user dru "
				+ " LEFT JOIN FETCH dru.organization "
				+ " WHERE dr.parentDispath = :parentDispath ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("parentDispath", parent);
		List<DispathRoot> list = query.list();
		Set<User> userSet = new HashSet<User>();
		for (DispathRoot dr : list) {
			userSet.add(dr.getUser());
		}
		DispathRoot dispathRoot = new DispathRoot();
		dispathRoot.setAcceptUser(userSet);
		for (DispathRoot dr : list) {
			if (dr.getStatus().equals(DispathRoot.YI_FEN_PAI)) {
				dispathRoot.setStatus(dr.getStatus());
				break;
			}
		}
		return dispathRoot;
	}

	@Override
	public GridDto<DispathRoot> getToDoGridDtoByWorkShopDirector(DispathManageDTO dto,int start,int limit){
		List<DispathRoot> list = new ArrayList<DispathRoot>();
		long results = 0;
		if(dto.getOverTimeStatus().equals("")){
			//查询超期数据
			dto.setOverTimeStatus(DispathRoot.IS_OVERTIME);
			list.addAll(getToDoByWorkShopDirector(dto, start, limit));
			results  = getToDoCountByByWorkShopDirector(dto);
			
			//查询不超期的数据
			dto.setOverTimeStatus(DispathRoot.IS_NOT_OVERTIME);
			if(ManualPagingUtil.isExecuteSecondFun(results, start, limit)){
				list.addAll(getToDoByWorkShopDirector(dto,ManualPagingUtil.getSecondFirst(results, start, limit) , ManualPagingUtil.getSecondMax(results, start, limit)));
			}
			results  += getToDoCountByByWorkShopDirector(dto);
		}else{
			list = getToDoByWorkShopDirector(dto, start, limit);
			results = getToDoCountByByWorkShopDirector(dto);
		}
		GridDto<DispathRoot> gridDto = new GridDto<DispathRoot>();
		gridDto.setRows(list);
		gridDto.setResults(results);
		return gridDto;
	}
	
	@Override
	public List<DispathRoot> getToDoByWorkShopDirector(DispathManageDTO dto, int start, int limit) {
		String hql = " FROM DispathRoot d "
				+ " LEFT JOIN FETCH d.createUser u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH d.parentDispath dp "
				+ " LEFT JOIN FETCH dp.sendUser dps "
				+ " LEFT JOIN FETCH dps.organization "
				+ " LEFT JOIN FETCH d.root r "
				+ " LEFT JOIN FETCH r.sendUser rsu "
				+ " LEFT JOIN FETCH rsu.organization "
				+ " LEFT JOIN FETCH d.user du "
				+ " LEFT JOIN FETCH du.organization duo "
				+ " WHERE duo.id =:userOrgId ";
		Map<String, Object> map = new HashMap<String, Object>();
		
		//进行排序的状态，按数组中顺序对查询结果进行排序
		String[] status = new String[]{DispathRoot.DAI_JIE_SHOU,DispathRoot.DAI_HUI_FU,DispathRoot.CHU_LI_ZHONG,DispathRoot.YI_FEN_PAI,DispathRoot.YI_HUI_FU,DispathRoot.YI_GUI_DANG};
		hql = createSql(hql, map, dto) ;// 设置查询条件
		if(dto.getOverTimeStatus().equals(DispathRoot.IS_NOT_OVERTIME)){
			hql += " ORDER BY decode(d.status,"+OderStatusUtil.getOderStatus(status)+"), d.createDate DESC ";
		}
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userOrgId", dto.getUserOrgId());
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<DispathRoot> list = query.list();
		if(dto.getOverTimeStatus().equals(DispathRoot.IS_OVERTIME)){
			return setOverTimeRecordsColorAttr(list);
		}
		addColor(list);// 添加颜色
		return list;
	}
	
	@Override
	public long getToDoCountByByWorkShopDirector(DispathManageDTO dto) {
		String hql = " SELECT COUNT(d.id) FROM DispathRoot d "
				+ " WHERE d.user.organization.id =:userOrgId ";
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createSql(hql, map, dto);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userOrgId", dto.getUserOrgId());
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}

	@Override
	public List<User> checkSelectedWorkAreaUser(String workShopId, String rootId, String userId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM DispathRoot tr WHERE tr.parentDispath.id = :panrentTask AND tr.exist =:exist AND tr.user.organization.id=:workShopId AND tr.user.id!=:owerId" ;
		Query query = session.createQuery(hql);
		query.setParameter("panrentTask", rootId);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setParameter("workShopId",workShopId);
		query.setParameter("owerId",userId);
		List<DispathRoot> haveTaskUsers = query.list();
		List<DispathRoot> children = new ArrayList<DispathRoot>();
		for (DispathRoot meetingDispatch : haveTaskUsers) {
			children.addAll(meetingDispatch.getChildren());
		}
		List<User> repeatUsers = new ArrayList<User>();
		List<User> allUsers = userService.getUsersByParentOrgId(workShopId);
		for (DispathRoot taskRoot : children) {
			repeatUsers.add(taskRoot.getUser());
		}
		for(User u : repeatUsers){
			allUsers.remove(u);
		}
		return allUsers;
	}

	@Override
	public GridDto<DispathRoot> getAddListByGridDto(DispathManageDTO dto, int start, int limit) {
		List<DispathRoot> list = getAddListByDTO(dto, start, limit);
		long results = getAddListCountByDTO(dto);
		GridDto<DispathRoot> gridDto = new GridDto<DispathRoot>();
		gridDto.setRows(list);
		gridDto.setResults(results);
		return gridDto;
	}

	private long getAddListCountByDTO(DispathManageDTO dto) {
		String hql = " SELECT COUNT(d.id) FROM DispathRoot d "
				+ " WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createAddListSql(hql, map, dto);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}

	private List<DispathRoot> getAddListByDTO(DispathManageDTO dto, int start, int limit) {
		String hql = " FROM DispathRoot d "
				+ " LEFT JOIN FETCH d.createUser u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH d.root r "
				+ " LEFT JOIN FETCH r.sendUser rsu "
				+ " LEFT JOIN FETCH rsu.organization "
				+ " WHERE 1 = 1" ;
		Map<String, Object> map = new HashMap<String, Object>();
		hql = createAddListSql(hql, map, dto) + " ORDER BY d.status,d.createDate DESC ";// 设置查询条件
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<DispathRoot> list = query.list();
		addColor(list);// 添加颜色
		return list;
	}
	private String createAddListSql(String hql, Map<String, Object> map, DispathManageDTO dto) {
		StringBuffer str = new StringBuffer();
		str = str.append(hql);
		// 删除字段为1的条件(即未删除)
		str.append(" AND d.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		if (dto.getDispatchNum() != null) {
			str.append(" AND d.dispatchNum like :dispatchNum ");
			map.put("dispatchNum", "%" + dto.getDispatchNum() + "%");
		}
		if (dto.getStatus() != null) {
			str.append(" AND d.status = :status ");
			map.put("status", dto.getStatus());
		}
		if (dto.getUser() != null) {
			str.append(" AND d.user = :user");
			map.put("user", dto.getUser());
		}
		if (dto.getSendDateStartByRoot() != null) {
			str.append(" AND d.sendDate >= :sendDateStart ");
			map.put("sendDateStart",dto.getSendDateStartByRoot());
		}
		if (dto.getSendDateEndByRoot() != null) {
			str.append(" AND d.sendDate <= :sendDateEnd ");
			map.put("sendDateEnd", dto.getSendDateEndByRoot());
		}
		if (dto.getSendDateStart() != null) {
			str.append(" AND d.parentDispath.sendDate >= :sendDateStart ");
			map.put("sendDateStart",dto.getSendDateStart());
		}
		if (dto.getSendDateEnd() != null) {
			str.append(" AND d.parentDispath.sendDate <= :sendDateEnd ");
			map.put("sendDateEnd", dto.getSendDateEnd());
		}
		if (dto.getIsRoot() != null) {
			str.append(" AND d.isRoot = :isRoot ");
			map.put("isRoot", dto.getIsRoot());
		}
		if (dto.getCopyUser() != null) {
			str.append(" AND EXISTS ( FROM d.copyUser user WHERE user = :copyUser ) ");
			map.put("copyUser", dto.getCopyUser());
		}
		return str.toString();
	}

}
