package com.enovell.yunwei.accident.service.impl;

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
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.accident.domain.Accident;
import com.enovell.yunwei.accident.domain.AccidentShop;
import com.enovell.yunwei.accident.dto.AccidentDTO;
import com.enovell.yunwei.accident.dto.AccidentShopDTO;
import com.enovell.yunwei.accident.service.AccidentService;
import com.enovell.yunwei.accident.service.AccidentShopService;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.util.DataExistStatus;

@SuppressWarnings("unchecked")
@Service("accidentService")
@Transactional
public class AccidentServiceImpl implements AccidentService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Resource(name = "accidentShopService")
	private AccidentShopService accidentShopService;
	
	/**
	 * 动态查询
	 */
	@Override
	public List<AccidentDTO> getAllAccidentData(AccidentDTO accidentDTO, int first, int max) {
		String eql = "FROM Accident a " 
				+ "LEFT JOIN FETCH a.attachFile "
				+ "LEFT JOIN FETCH a.user "
				+ "LEFT JOIN FETCH a.user.position "
				+ "WHERE a.exist=:exist  ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(accidentDTO, eql, map)+ " ORDER BY a.time DESC  ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setFirstResult(first);
		query.setMaxResults(max);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<AccidentDTO> list = getShow(query.list());
		return list;
	}
	@Override
	public long getAccidentCount(AccidentDTO accidentDTO) {
		String eql = "SELECT COUNT(a.id) FROM Accident a WHERE a.exist=:exist  ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(accidentDTO, eql, map);
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist", DataExistStatus.EXIST);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	private String createSql(AccidentDTO dto, String sql,
			Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
		if (dto != null) {
			if (dto.getName() != null && dto.getName().length() != 0) {
				buffer.append("AND a.name like :name ");
				map.put("name", "%" + dto.getName() + "%");
			}
		}
		return buffer.toString();
	}
	private List<AccidentDTO> getShow(List<Accident> lists) {
		List<AccidentDTO> list = new ArrayList<AccidentDTO>();
		for (Accident accident : lists) {
			AccidentDTO dto = new AccidentDTO();
			String id = accident.getId();
			String name = accident.getName();
			Date time = accident.getTime();
			String user = "";
			if(accident.getUser()!=null){
				user = accident.getUser().getName();
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
	public void addAccident(Accident a) {
		sessionFactory.getCurrentSession().save(a);
		issueOrgShop(a);
	}
	/**
	 * 添加演练计划
	 */
	@Override
	public void addAccident(Accident a,String orgIds,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, a.getUser());
			a.setAttachFile(attachFile);
		}
		sessionFactory.getCurrentSession().save(a);
		issueOrgShop(a,orgIds);
	}
//	@Override
//	public void addAccident(Accident a) {
//		AttachFile af = a.getAttachFile();
//		if(af != null){
//			af = addFile(af);
//			a.setAttachFile(af);
//		}
//		em.persist(a);
//		issueOrgShop(a);
//	}
//
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
	
	/**
	 * 通过id获取单条数据
	 */
	@Override
	public Accident getAccidentById(String id) {
		String hql = "FROM Accident a "
				+ " LEFT JOIN FETCH a.user "
				+ " LEFT JOIN FETCH a.attachFile "
				+ " LEFT JOIN FETCH a.attachFile.files"
				+ " WHERE a.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (Accident) query.uniqueResult();
	}
	/**
	 * 修改演练计划
	 */
	@Override
	public void updateAccident(Accident a,UploadFileDto[] dtos,User user) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			a.setAttachFile(attachFile);
		}else {
			//上传文件为空
			a.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().merge(a);
	}
	
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
	/**
	 * 删除
	 */
	@Override
	public void deleteAccidents(String jsonIds) {
		String[] ids = jsonIds.split(",");
		//TODO 性能问题待优化
		for (String id : ids) {
			deleteAccident(id);
		}
	}
	/**
	 * deleteAccident 删除操作
	 * @param id
	 */
	public void deleteAccident(String id) {
		Accident accident = getAccidentById(id);
		accident.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(accident);
		//同时删除所有该计划的汇报
//		accidentShopService.deleteShops(accident);
//		try {
//			AttachFile attachFile = accident.getAttachFile();
//			Session session = sessionFactory.getCurrentSession();
//			String hql = "delete Accident a where a.id =:id";
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
			AccidentShop acc = getAccidentShop(o);
			acc.setAccident(a);
			accidentShopService.addAccidentShop(acc);
		}
	}
	/**
	 * 下发车间数据
	 * @param a
	 */
	private void issueOrgShop(Accident a,String orgIds){
		String[] ids = orgIds.split(",");
		for (String id : ids) {
			Organization o = getOrganization(id);
			AccidentShop acc = getAccidentShop(o);
			acc.setAccident(a);
			accidentShopService.addAccidentShop(acc);
		}
	}
	/**
	 * 获得下发实体
	 * @param o
	 * @return
	 */
	private AccidentShop getAccidentShop(Organization o){
		AccidentShop acc = new AccidentShop();
		acc.setOrg(o);
		return acc;
	}
	
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
	
	/**
	 * 获取汇报信息显示到事故演练计划详细信息的表里
	 */
	@Override
	public List<AccidentShop> getAllAccidentShopDataById(String id,
			int first, int max) {
		String sql = "FROM AccidentShop a " 
				+ "LEFT JOIN FETCH a.org "
				+ "LEFT JOIN FETCH a.attachFile "
				+ "LEFT JOIN FETCH a.accident "
				+ "WHERE a.accident.id = :id "
				+ " ORDER BY a.accident DESC  ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("id", id);
		query.setFirstResult(first);
		query.setMaxResults(max);
//		List<AccidentShopDTO> list = getShopShow(query.list());
		List<AccidentShop> list = query.list();
		return list;
	}
	@Override
	public long getAccidentShopCountById(String id) {
		String sql = "SELECT COUNT(a.id) FROM AccidentShop a WHERE a.accident.id=:id ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("id", id);
		return ((Long) query.uniqueResult()).intValue();
	}
	private List<AccidentShopDTO> getShopShow(List<AccidentShop> lists) {
		List<AccidentShopDTO> list = new ArrayList<AccidentShopDTO>();
		for (AccidentShop acc : lists) {
			AccidentShopDTO dto = new AccidentShopDTO();
			String id = acc.getId();
			String content = acc.getContent();
			String org = acc.getOrg().getName();
			dto.setId(id);
			dto.setContent(content);
			dto.setOrg(org);
			list.add(dto);
		}
		return list;
	}
	@Override
	public AccidentShop getAccidentShopById(String id) {
		String hql = "FROM AccidentShop a "
				+ " LEFT JOIN FETCH a.org "
				+ " LEFT JOIN FETCH a.accident "
				+ " LEFT JOIN FETCH a.attachFile "
				+ " LEFT JOIN FETCH a.attachFile.files"
				+ " WHERE a.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (AccidentShop) query.uniqueResult();
	}
	
}
