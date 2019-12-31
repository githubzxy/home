package com.enovell.yunwei.communicate.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.Organization;
import com.enovell.yunwei.accident.domain.Accident;
import com.enovell.yunwei.accident.domain.AccidentShop;
import com.enovell.yunwei.accident.dto.AccidentShopDTO;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.communicate.domain.Communicate;
import com.enovell.yunwei.communicate.domain.CommunicateShop;
import com.enovell.yunwei.communicate.dto.CommunicateDTO;
import com.enovell.yunwei.communicate.service.CommunicateService;
import com.enovell.yunwei.communicate.service.CommunicateShopService;
import com.enovell.yunwei.util.DataExistStatus;

@SuppressWarnings("unchecked")
@Service("communicateService")
@Transactional
public class CommunicateServiceImpl implements CommunicateService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Resource(name = "communicateShopService")
	private CommunicateShopService communicateShopService;
	
	/**
	 * 动态查询 获取显示到通信演练计划主页面的数据
	 */
	@Override
	public List<CommunicateDTO> getAllCommunicateData(CommunicateDTO communicateDTO, int first, int max) {
		String eql = "FROM Communicate c " 
				+ "LEFT JOIN FETCH c.attachFile "
				+ "LEFT JOIN FETCH c.user "
				+ "LEFT JOIN FETCH c.user.position "
				+ "WHERE c.exist=:exist ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(communicateDTO, eql, map)+ " ORDER BY c.time DESC  ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist",DataExistStatus.EXIST );
		query.setFirstResult(first);
		query.setMaxResults(max);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<CommunicateDTO> list = getShow(query.list());
		return list;
	}
	@Override
	public long getCommunicateCount(CommunicateDTO communicateDTO) {
		String eql = "SELECT COUNT(c.id) FROM Communicate c WHERE c.exist=:exist ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(communicateDTO, eql, map);
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist",DataExistStatus.EXIST );
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	private String createSql(CommunicateDTO dto, String sql,
			Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
		if (dto != null) {
			if (dto.getName() != null && dto.getName().length() != 0) {
				buffer.append("AND c.name like :name ");
				map.put("name", "%" + dto.getName() + "%");
			}
		}
		return buffer.toString();
	}
	private List<CommunicateDTO> getShow(List<Communicate> lists) {
		List<CommunicateDTO> list = new ArrayList<CommunicateDTO>();
		for (Communicate communicate : lists) {
			CommunicateDTO dto = new CommunicateDTO();
			String id = communicate.getId();
			String name = communicate.getName();
			Date time = communicate.getTime();
			String user = "";
			if(communicate.getUser()!=null){
				user = communicate.getUser().getName();
			}
			dto.setId(id);
			dto.setName(name);
			dto.setTime(time);
			dto.setUser(user);
			list.add(dto);
		}
		return list;
	}
	/**
	 * 添加演练计划并且下发
	 */
	@Override
	public void addCommunicate(Communicate c,String orgIds) {
		sessionFactory.getCurrentSession().save(c);
		issueOrgShop(c,orgIds);
	}
	/**
	 * 下发
	 * @param a
	 */
	private void issueOrgShop(Communicate c,String orgIds){
		String[] ids = orgIds.split(",");
		for (String id : ids) {
			Organization o = getOrganization(id);
			CommunicateShop cs = getCommunicateShop(o);
			cs.setCommunicate(c);
			communicateShopService.addCommunicateShop(cs);
		}
	}
	/**
	 * 获得下发实体
	 * @param o
	 * @return
	 */
	private CommunicateShop getCommunicateShop(Organization o){
		CommunicateShop cs = new CommunicateShop();
		cs.setOrg(o);
		return cs;
	}
	/**
	 * 通过id获取单条数据
	 */
	@Override
	public Communicate getCommunicateById(String id) {
		String hql = "FROM Communicate c "
				+ " LEFT JOIN FETCH c.user "
				+ " LEFT JOIN FETCH c.attachFile "
				+ " LEFT JOIN FETCH c.attachFile.files"
				+ " WHERE c.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (Communicate) query.uniqueResult();
	}
	/**
	 * 修改通信演练计划
	 */
	@Override
	public void updateCommunicate(Communicate c) {
		sessionFactory.getCurrentSession().merge(c);
	}
	/**
	 * 删除
	 */
	@Override
	public void deleteCommunicates(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
			deleteCommunicate(id);
		}
	}
	/**
	 * deleteAccident 删除操作
	 * @param id
	 */
	public void deleteCommunicate(String id) {
		Communicate communicate = getCommunicateById(id);
		communicate.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(communicate);
		//同时删除所有该计划的汇报
//		communicateShopService.deleteShops(communicate);
//		try {
//			AttachFile attachFile = communicate.getAttachFile();
//			Session session = sessionFactory.getCurrentSession();
//			String hql = "delete Communicate c where c.id =:id";
//			session.createQuery(hql).setParameter("id", id).executeUpdate();
//			if (attachFile != null) {
//				String attachFileId = attachFile.getId();
//				// 删除附件
//				attachFileService.deleteAttachFile(attachFileId);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	/**
	 * 获取汇报信息显示到通信演练计划详细信息的表里
	 */
	@Override
	public List<CommunicateShop> getAllCommunicateShopDataById(String id,
			int first, int max) {
		String sql = "FROM CommunicateShop cs " 
				+ "LEFT JOIN FETCH cs.org "
				+ "LEFT JOIN FETCH cs.attachFile "
				+ "LEFT JOIN FETCH cs.communicate "
				+ "WHERE cs.communicate.id = :id "
				+ " ORDER BY cs.communicate DESC  ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("id", id);
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<CommunicateShop> list = query.list();
		return list;
	}
	@Override
	public long getCommunicateShopCountById(String id) {
		String sql = "SELECT COUNT(cs.id) FROM CommunicateShop cs WHERE cs.communicate.id=:id ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("id", id);
		return ((Long) query.uniqueResult()).intValue();
	}
	@Override
	public CommunicateShop getCommunicateShopById(String id) {
		String hql = "FROM CommunicateShop cs "
				+ " LEFT JOIN FETCH cs.org "
				+ " LEFT JOIN FETCH cs.communicate "
				+ " LEFT JOIN FETCH cs.attachFile "
				+ " LEFT JOIN FETCH cs.attachFile.files"
				+ " WHERE cs.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (CommunicateShop) query.uniqueResult();
	}
	
	
	/**
	 * 添加演练计划并且下发
	 */
	@Override
	public void addAccident(Accident a) {
		sessionFactory.getCurrentSession().save(a);
		issueOrgShop(a);
	}
//	@Override
//	public void addAccidentWithOrgs(Accident a, List<Organization> orgs){
//		AttachFile af = a.getAttachFile();
//		if(af != null){
//			af = addFile(af);
//			a.setAttachFile(af);
//		}
//		em.persist(a);
//		issueWithOrgs(a, orgs);
//	}
	
	
	
	
//	@Override
//	public void updateAccident(Accident a) {
//		AttachFile af = a.getAttachFile();
//		AttachFile attachFile = em.find(Accident.class, a.getId()).getAttachFile();
//		deleteFile(attachFile);
//		if(af != null){
//			af = addFile(af);
//			a.setAttachFile(af);
//		}
//		em.merge(a);
//	}
//	@Override
//	public void deleteAccident(List<String> ids) {
//		for(String id : ids){
//			Accident a = em.find(Accident.class, id);
//			AttachFile attachFile = em.find(Accident.class, a.getId()).getAttachFile();
//			ass.deleteShops(a);
//			em.remove(a);
//			deleteFile(attachFile);
//		}
//	}
//	
//	/**
//	 * 添加附件
//	 * @param af
//	 * @return
//	 */
//	private AttachFile addFile(AttachFile af){
//		af = afs.saveAttachFile(af);
//		return af;
//	}
//	
//	/**
//	 * 删除附件
//	 * @param a
//	 */
//	private void deleteFile(AttachFile attachFile){
//		if(attachFile != null){
//			afs.deleteAttachFileAndFile(attachFile);
//		}
//	}

//	@Override
//	public List<Accident> serachAccident(AccidentDTO aDTO, int first, int max) {
//		String eql = " FROM Accident a LEFT JOIN FETCH a.attachFile WHERE 1=1";
//		Query query = getQuery(aDTO, eql);
//		query.setFirstResult(first);
//		query.setMaxResults(max);
//		return query.getResultList();
//	}
//
//	@Override
//	public int serachCount(AccidentDTO aDTO) {
//		String eql = "SELECT COUNT(a.id) FROM Accident a WHERE 1=1 ";
//		Query query = getQuery(aDTO, eql);
//		return ((Long) query.getSingleResult()).intValue();
//	}

	/**
	 * 获得Query
	 * @param aDTO
	 * @param eql
	 * @return
	 */
//	private Query getQuery(AccidentDTO aDTO, String eql){
//		Map<String, Object> args = new HashMap<String, Object>();
//		if(StringUtils.isNotEmpty(aDTO.getName())){
//			eql += " AND a.name like :name ";
//			args.put("name", "%"+aDTO.getName()+"%");
//		}
//		eql += " ORDER BY a.time DESC ";
//		Query query = em.createQuery(eql);
//		Iterator<Map.Entry<String, Object>> iterator = args.entrySet()
//				.iterator();
//		while (iterator.hasNext()) {
//			Map.Entry<String, Object> entry = iterator.next();
//			query.setParameter(entry.getKey(), entry.getValue());
//		}
//		return query;
//	}
	/**
	 * 查询计划的所有汇报
	 * @param a
	 * @return
	 */
	@Override
	public List<AccidentShop> getAccidentShop(Accident a) {
		String eql = "FROM AccidentShop accShop LEFT JOIN FETCH accShop.org LEFT JOIN FETCH accShop.attachFile WHERE accShop.accident = :accident ";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("accident", a);
		return query.list();
	}

	@Override
	public void addAccidentWithOrgs(Accident a, List<Organization> orgs) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAccident(List<String> ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Accident> serachAccident(AccidentShopDTO aDTO, int first,
			int max) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int serachCount(AccidentShopDTO aDTO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 下发车间数据
	 * @param a
	 */
	private void issueOrgShop(Accident a){
		List<Organization> orgs = getAllShop();
		for(Organization o : orgs){
//			AccidentShop as = getAccidentShop(o);
//			as.setAccident(a);
//			accidentShopService.addAccidentShop(as);
		}
	}
	
//	
//	/**
//	 * issueWithOrgs 下发指定的组织机构
//	 * @param a 下发的计划实体
//	 * @param orgs 组织机构集合
//	 */
//	private void issueWithOrgs(Accident a, List<Organization> orgs){
//		for(Organization o : orgs){
//			AccidentShop as = getAccidentShop(o);
//			as.setAccident(a);
//			ass.addAccidentShop(as);
//		}
//	}
//	
	
	
	/**
	 * 获得车间数据
	 * @return
	 */
	private List<Organization> getAllShop(){
		String eql = " FROM Organization o WHERE o.type = 4";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		return query.list();
	}
	/**
	 * 获得车间数据
	 * @return Organization
	 */
	private Organization getOrganization(String id){
		String eql = " FROM Organization o WHERE o.id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("id", id);
		return (Organization)query.uniqueResult();
	}
	
}
