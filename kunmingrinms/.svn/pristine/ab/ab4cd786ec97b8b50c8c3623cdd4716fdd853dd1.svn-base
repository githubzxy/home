package com.enovell.yunwei.emergencyOrg.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.Position;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.emergencyOrg.domain.EmergencyOrg;
import com.enovell.yunwei.emergencyOrg.domain.EmergencyUser;
import com.enovell.yunwei.emergencyOrg.dto.EmergencyUserDTO;
import com.enovell.yunwei.emergencyOrg.service.EmergencyUserService;
import com.enovell.yunwei.util.DataExistStatus;
/**
 * 项目名称：kunmingrinms 
 * 类名称：EmergencyUserServiceImpl
 * 描述: 应急人员管理实现类
 * 创建人：yangsy 
 * 创建时间：2016-12-07 
 */
@SuppressWarnings("unchecked")
@Service("emergencyUserService")
@Transactional
public class EmergencyUserServiceImpl implements EmergencyUserService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
//	/**
//	 * createSql 拼装查询条件
//	 * 
//	 * @param EmergencyPlanDTO dto
//	 *            应急预案查询条件
//	 * @param eql
//	 *            基本eql
//	 * @param conditionMap
//	 *            存放查询条件的键值
//	 * @return 拼装好的eql
//	 */
//	private String createSql(EmergencyUserDTO dto, String hql,
//			Map<String, Object> conditionMap) {
//		if (dto == null) {
//			return hql;
//		}
//		StringBuffer newHql = new StringBuffer();
//		newHql.append(hql);
//		if (StringUtils.isNotEmpty(dto.getName())) {
//			newHql.append("AND e.name like :name ");
//			conditionMap.put("name", "%" + dto.getName() + "%");
//		}
//
////		newHql.append("ORDER BY e.createDate DESC ");
//
//		return newHql.toString();
//		
//	}
//	/**
//	 * 动态查询
//	 */
//	@Override
//	public List<EmergencyUserDTO> getOrgPeople(EmergencyUserDTO emergencyUserDTO, int first, int max) {
//		// 得到技术信息集合
//		// 存放查询条件map
//		Map<String, Object> conditionMap = new HashMap<String, Object>();
//		// 已经拼装好的hql
//		String newHql = null;
//		String hql = "FROM EmergencyUser e " 
//					+ " LEFT JOIN FETCH e.user "
//					+ " LEFT JOIN FETCH e.emergencyOrg "
//					+ " WHERE e.emergencyOrg.id = :orgId ";
//		// 拼装查询条件
//		newHql = createSql(emergencyUserDTO, hql, conditionMap);
//		Session session = sessionFactory.getCurrentSession();
//		Query query = session.createQuery(newHql);
//		query.setParameter("orgId", emergencyUserDTO.getOrgId());
//		query.setFirstResult(first);
//		query.setMaxResults(max);
//		for (String key : conditionMap.keySet()) {
//			query.setParameter(key, conditionMap.get(key));
//		}
//		List<EmergencyUserDTO> lists = getShow(query.list());
//		return lists;
//	}
//	@Override
//	public long getPeopleCount(EmergencyUserDTO emergencyUserDTO) {
//		// 得到技术信息记录数
//		// 存放查询条件map
//		Map<String, Object> conditionMap = new HashMap<String, Object>();
//		String hql = "SELECT COUNT(e.id) FROM EmergencyUser e WHERE e.emergencyOrg.id = :orgId ";
//		// 已经拼装好的eql
//		String newHql = null;
//		newHql = createSql(emergencyUserDTO, hql, conditionMap);
//		Session session = sessionFactory.getCurrentSession();
//		Query query = session.createQuery(newHql);
//		query.setParameter("orgId", emergencyUserDTO.getOrgId());
//		for (String key : conditionMap.keySet()) {
//			query.setParameter(key, conditionMap.get(key));
//		}
//		return ((Long) query.uniqueResult()).intValue();
//	}
	
	
	/**
	 * 原有方法
	 */
	
	
	@Override
	public EmergencyUser addEmergencyUser(EmergencyUser emergencyUser) {
		sessionFactory.getCurrentSession().persist(emergencyUser);
		return emergencyUser;
	}
	@Override
	public List<Position> getPositionData() {
		String hql = "FROM Position";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Position> list = query.list();
		return list;
	}
	@Override
	public EmergencyUser updateEmergencyUser(EmergencyUser emergencyUser) {
		sessionFactory.getCurrentSession().merge(emergencyUser);
		return emergencyUser;
	}
	@Override
	public EmergencyUser getEmergencyUserById(String id) {
		String eql = "FROM EmergencyUser e " 
				+ "LEFT JOIN FETCH e.position "
				+ "LEFT JOIN FETCH e.emergencyOrg "
				+ "LEFT JOIN FETCH e.user "
				+ "LEFT JOIN FETCH e.user.organization "
				+ "WHERE e.id =:id";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("id", id);
		return (EmergencyUser) query.uniqueResult();
	}
	@Override
	public List<EmergencyUserDTO> getEmergencyPeopleById(String id) {
		String eql = "FROM EmergencyUser e " 
				+ "LEFT JOIN FETCH e.position "
				+ "LEFT JOIN FETCH e.emergencyOrg "
				+ "LEFT JOIN FETCH e.user "
				+ "LEFT JOIN FETCH e.user.organization "
				+ "WHERE e.id =:id";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("id", id);
		List<EmergencyUserDTO> list = getShow(query.list());
		return list;
	}
	@Override
	public EmergencyUser getEmergencyUserByName(String name) {
		String eql = "FROM EmergencyUser e " 
				+ "LEFT JOIN FETCH e.position "
				+ "LEFT JOIN FETCH e.emergencyOrg "
				+ "LEFT JOIN FETCH e.user "
				+ "LEFT JOIN FETCH e.user.organization "
				+ "WHERE e.name like :name";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("name", "%" + name + "%");
		return (EmergencyUser) query.uniqueResult();
	}
	@Override
	public void deleteEmergencyUser(List<String> ids) {
		
		for (int i = 0; i < ids.size(); i++) {
			try {
				EmergencyUser emergencyUser = getEmergencyUserById(ids.get(i));
				emergencyUser.setExist(DataExistStatus.NOT_EXIST);
				sessionFactory.getCurrentSession().saveOrUpdate(emergencyUser);
//				String hql = "DELETE EmergencyUser e WHERE e.id =:id";
//				Session session= sessionFactory.getCurrentSession();
//				session.createQuery(hql).setParameter("id", ids.get(i)).executeUpdate();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	@Override
	public void deleteEmergencyUser(String id) {
		EmergencyUser psEmergency = getEmergencyUserById(id);
		if (psEmergency != null) {
			sessionFactory.getCurrentSession().delete(psEmergency);
		}
	}
	@Override
	public void deleteEmergencyUser(EmergencyUser emergencyUser) {
		deleteEmergencyUser(emergencyUser.getId());
	}
	@Override
	public void deleteEmergencyUsers(String[] ids) {
		for (String id : ids) {
			deleteEmergencyUser(id);
		}
	}
	@Override
	public void deleteEmergencyUsers(List<EmergencyUser> emergencyUsers) {
		for (EmergencyUser emergency : emergencyUsers) {
			deleteEmergencyUser(emergency);
		}
	}
	@Override
	public List<EmergencyUserDTO> getAllEmergencyUsers(int first,int max) {
		String eql = "FROM EmergencyUser e " 
				+ "LEFT JOIN FETCH e.position "
				+ "LEFT JOIN FETCH e.emergencyOrg "
				+ "LEFT JOIN FETCH e.user "
				+ "LEFT JOIN FETCH e.user.organization "
				+ "ORDER BY e.emergencyOrg ASC ";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<EmergencyUserDTO> list = getShow(query.list());
		return list;
	}
	@Override
	public long getEmergencyUsersCount() {
		String eql = "SELECT COUNT(e.id) FROM EmergencyUser e WHERE 1=1 ";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		return ((Long) query.uniqueResult()).intValue();
	}
	/**
	 * 动态查询
	 */
	@Override
	public List<EmergencyUserDTO> getAllEmergencyUsers(EmergencyUserDTO emergencyUserDTO, int first, int max) {
		List<EmergencyUserDTO> result = new ArrayList<>();
		//1.获取根据岗位desc排序的数据
		result.addAll(getDataByPosition(emergencyUserDTO));
		//2.获取根据用户组织机构orgIndex排序的数据
		result.addAll(getDataByUserOrg(emergencyUserDTO));
		//3.获取没有岗位数据和用户数据的数据
		result.addAll(getDataWithoutPositionAndUser(emergencyUserDTO));
		//4.分页
		int end = first + max;
		if(end>result.size()) return result.subList(first, result.size());
		return result.subList(first, end);
	}
	//1.获取根据岗位desc排序的数据
	private List<EmergencyUserDTO> getDataByPosition(EmergencyUserDTO emergencyUserDTO){
		String eql = getEqlFront();
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(emergencyUserDTO, eql, map)+" ORDER BY e.position.desc ";
		List<EmergencyUserDTO> list = getDataBySql(sql, map);
		return list;
	}
	//2.获取根据用户组织机构orgIndex排序的数据
	private List<EmergencyUserDTO> getDataByUserOrg(EmergencyUserDTO emergencyUserDTO){
		String eql = getEqlFront() + " AND e.position IS NULL ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(emergencyUserDTO, eql, map)+" ORDER BY e.user.organization.orgIndex ";
		List<EmergencyUserDTO> list = getDataBySql(sql, map);
		return list;
	}
	//3.获取没有岗位数据和用户数据的数据
	private List<EmergencyUserDTO> getDataWithoutPositionAndUser(EmergencyUserDTO emergencyUserDTO){
		String eql = getEqlFront() + " AND e.position IS NULL AND e.user IS NULL ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(emergencyUserDTO, eql, map);
		List<EmergencyUserDTO> list = getDataBySql(sql, map);
		return list;
	}
	private String  getEqlFront(){
		String eql = "FROM EmergencyUser e " 
				+ "LEFT JOIN FETCH e.position "
				+ "LEFT JOIN FETCH e.emergencyOrg "
				+ "LEFT JOIN FETCH e.user "
				+ "LEFT JOIN FETCH e.user.organization "
				+ "WHERE e.exist=:exist ";
		return eql;
	}
	private List<EmergencyUserDTO> getDataBySql(String sql,Map<String, Object> map){
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist", DataExistStatus.EXIST);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<EmergencyUserDTO> list = getShow(query.list());
		return list;
	}
	@Override
	public long getEmergencyUsersCount(EmergencyUserDTO emergencyUserDTO) {
		String eql = "SELECT COUNT(e.id) FROM EmergencyUser e WHERE e.exist=:exist ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(emergencyUserDTO, eql, map);
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist", DataExistStatus.EXIST);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	private String createSql(EmergencyUserDTO dto, String sql,
			Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
		if (dto != null) {
			if (dto.getOrgId() != null) {
				buffer.append(" AND e.emergencyOrg.id =:orgId ");
				map.put("orgId", dto.getOrgId());
			}
			if (dto.getName() != null && dto.getName().length() != 0) {
				buffer.append(" AND e.name like :name ");
				map.put("name", "%" + dto.getName() + "%");
			}
		}
		return buffer.toString();
	}
//	private List<EmergencyUserDTO> getShow(List<EmergencyUser> lists) {
//		List<EmergencyUserDTO> list = new ArrayList<EmergencyUserDTO>();
//		for (EmergencyUser emergencyUser : lists) {
//			EmergencyUserDTO dto = new EmergencyUserDTO();
//			String id = emergencyUser.getId();
//			String orgId = emergencyUser.getEmergencyOrg().getId();
//			String name = emergencyUser.getName();
//			String emergencyOrg = emergencyUser.getEmergencyOrg().getName();
//			String officeTelephone = "";
//			String mobileNumber = "";
//			if(emergencyUser.getUser()!=null){
//				officeTelephone = emergencyUser.getUser().getTelephoneNumber();
//			}else{
//				officeTelephone = emergencyUser.getOfficeTelephone();
//			}
//			if(emergencyUser.getUser()!=null){
//				mobileNumber = emergencyUser.getUser().getPhone();
//			}else{
//				mobileNumber = emergencyUser.getMobileNumber();
//			}
//			
//			String duty = "";
//			String positionId = "";
//			String position = "";
//			if(emergencyUser.getUser()!=null){
//				if(emergencyUser.getUser().getPosition()!=null){
//					positionId = emergencyUser.getUser().getPosition().getId();
//					position = emergencyUser.getUser().getPosition().getName();
//				}
//			}else if(emergencyUser.getPosition()!=null){
//				positionId = emergencyUser.getPosition().getId();
//				position = emergencyUser.getPosition().getName();
//			}
//			if(emergencyUser.getPost()!=null){
//				duty = emergencyUser.getPost();
//			}
//			dto.setId(id);
//			dto.setOrgId(orgId);
//			dto.setName(name);
//			dto.setEmergencyOrg(emergencyOrg);
//			dto.setOfficeTelephone(officeTelephone);
//			dto.setMobileNumber(mobileNumber);
//			dto.setDuty(duty);
//			dto.setPositionId(positionId);
//			dto.setPosition(position);
//			list.add(dto);
//		}
//		return list;
//	}
	private List<EmergencyUserDTO> getShow(List<EmergencyUser> lists) {
		List<EmergencyUserDTO> list = new ArrayList<EmergencyUserDTO>();
		for (EmergencyUser emergencyUser : lists) {
			EmergencyUserDTO dto = new EmergencyUserDTO();
			String id = emergencyUser.getId();
			String name = emergencyUser.getName();
			String orgId = "";
			String emergencyOrg = "";
			if(emergencyUser.getEmergencyOrg()!=null) {
				orgId = emergencyUser.getEmergencyOrg().getId();
				emergencyOrg = emergencyUser.getEmergencyOrg().getName();
			}
			User user = emergencyUser.getUser();
			String officeTelephone = "";
			String mobileNumber = "";
			if(emergencyUser.getUser()!=null){
				officeTelephone = emergencyUser.getUser().getTelephoneNumber();
			}else{
				officeTelephone = emergencyUser.getOfficeTelephone();
			}
			if(emergencyUser.getUser()!=null){
				mobileNumber = emergencyUser.getUser().getPhone();					
			}else{
				mobileNumber = emergencyUser.getMobileNumber();
			}
			
			String duty = "";
			String positionId = "";
			String position = "";
			if(emergencyUser.getUser()!=null){
				if(emergencyUser.getUser().getPosition()!=null){
					positionId = emergencyUser.getUser().getPosition().getId();
					position = emergencyUser.getUser().getPosition().getName();
				}
			}else{
				if(emergencyUser.getPosition()!=null){
					positionId = emergencyUser.getPosition().getId();
					position = emergencyUser.getPosition().getName();
				}
			}
			if(emergencyUser.getPost()!=null){
				duty = emergencyUser.getPost();
			}
			dto.setId(id);
			dto.setOrgId(orgId);
			dto.setName(name);
			dto.setEmergencyOrg(emergencyOrg);
			dto.setOfficeTelephone(officeTelephone);
			dto.setMobileNumber(mobileNumber);
			dto.setDuty(duty);
			dto.setPositionId(positionId);
			dto.setPosition(position);
			dto.setUser(user);
			list.add(dto);
		}
		return list;
	}
	
	/**
	 * 从机构人员导入应急人员
	 */
	@Override
	public void importEmergencyUser(List<User> users,EmergencyOrg emergencyOrg/*, Post post*/) {
		for (User user : users) {
			EmergencyUser emergencyUser = new EmergencyUser();
			emergencyUser.setName(user.getName());
			emergencyUser.setPosition(user.getPosition());
			emergencyUser.setEmergencyOrg(emergencyOrg);
			emergencyUser.setUser(user);
			addEmergencyUser(emergencyUser);
		}
	}

	@Override
	public List<EmergencyUser> getEmergencyUsersByEmergencyOrgs(
			List<EmergencyOrg> orgs, int first, int max) {
		String eql = "FROM EmergencyUser e " 
				+" LEFT JOIN FETCH e.position " 
				+" LEFT JOIN FETCH e.emergencyOrg "
				+" LEFT JOIN FETCH e.user "
				+ "LEFT JOIN FETCH e.user.organization "
				+" WHERE 1 > 2 ";
		StringBuffer buffer = new StringBuffer();
		buffer.append(eql);
		if(orgs.size() != 0){
			for(int i = 0 ; i<orgs.size() ; i++){
				buffer.append(" OR   e.emergencyOrg =:emergencyOrg").append(i);
			}
		}
		Query query = sessionFactory.getCurrentSession().createQuery(buffer.toString());
		query.setFirstResult(first);
		query.setMaxResults(max);
		for(int i = 0 ; i<orgs.size() ; i++){
			EmergencyOrg emergencyOrg = orgs.get(i);
			query.setParameter("emergencyOrg" + i, emergencyOrg);
		}
		return query.list();
	}

	@Override
	public int getEmergencyUsersByEmergencyOrgsCount(List<EmergencyOrg> orgs) {
		String eql = "SELECT COUNT(e.id) FROM EmergencyUser e WHERE 1 > 2 ";
		StringBuffer buffer = new StringBuffer();
		buffer.append(eql);
		if(orgs.size() != 0){
			for(int i = 0 ; i<orgs.size() ; i++){
				buffer.append(" OR   e.emergencyOrg =:emergencyOrg").append(i);
			}
		}
		Query query = sessionFactory.getCurrentSession().createQuery(buffer.toString());
		for(int i = 0 ; i<orgs.size() ; i++){
			EmergencyOrg emergencyOrg = orgs.get(i);
			query.setParameter("emergencyOrg" + i, emergencyOrg);
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	
}
