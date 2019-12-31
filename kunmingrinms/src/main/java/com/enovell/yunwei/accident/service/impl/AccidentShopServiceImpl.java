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

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.accident.domain.Accident;
import com.enovell.yunwei.accident.domain.AccidentShop;
import com.enovell.yunwei.accident.dto.AccidentDTO;
import com.enovell.yunwei.accident.service.AccidentShopService;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.util.DataExistStatus;

@SuppressWarnings("unchecked")
@Service("accidentShopService")
@Transactional
public class AccidentShopServiceImpl implements AccidentShopService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Override
	public List<AccidentDTO> getAllAccidentDataByUser(Accident accident , User user,int first, int max) {
		String eql = "FROM AccidentShop accShop LEFT JOIN FETCH accShop.attachFile  LEFT JOIN FETCH accShop.accident LEFT JOIN FETCH accShop.accident.user LEFT JOIN FETCH accShop.accident.attachFile WHERE accShop.accident.exist=:exist  ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(accident, user , eql, map)+ " ORDER BY accShop.accident.time DESC  ";
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
	public long getAccidentCountByUser(Accident accident ,User user) {
		String eql = "SELECT COUNT(accShop.id) FROM AccidentShop accShop WHERE accShop.accident.exist=:exist    ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(accident, user, eql, map);
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist", DataExistStatus.EXIST);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	private String createSql(Accident accident, User user , String sql,
			Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
		if (accident != null) {
			if (accident.getName() != null && accident.getName().length() != 0) {
				buffer.append(" AND accShop.accident.name like :name ");
				map.put("name", "%" + accident.getName() + "%");
			}
			buffer.append(" AND accShop.org.id=:id ");
			map.put("id",user.getOrganization().getId());
		}
		return buffer.toString();
	}
	private List<AccidentDTO> getShow(List<AccidentShop> lists) {
		List<AccidentDTO> list = new ArrayList<AccidentDTO>();
		for (AccidentShop acc : lists) {
			AccidentDTO dto = new AccidentDTO();
			String id = acc.getAccident().getId();
			String name = acc.getAccident().getName();
			Date time = acc.getAccident().getTime();
			String user = "";
			if(acc.getAccident().getUser()!=null){
				user = acc.getAccident().getUser().getName();
			}
			dto.setId(id);
			dto.setName(name);
			dto.setTime(time);
			dto.setUser(user);
			list.add(dto);
		}
		return list;
	}
	
	@Override
	public AccidentShop getAccidentShopByAccidentId(Accident accident) {
		String hql = "FROM AccidentShop a "
				+ " LEFT JOIN FETCH a.org "
				+ " LEFT JOIN FETCH a.accident "
				+ " LEFT JOIN FETCH a.attachFile "
				+ " LEFT JOIN FETCH a.attachFile.files"
				+ " WHERE a.accident.id =:accidentId"
				+ " AND a.org.id =:orgId";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("accidentId", accident.getId());
		query.setParameter("orgId", accident.getUser().getOrganization().getId());
		return (AccidentShop) query.uniqueResult();
	}
	

	@Override
	public void addAccidentShop(AccidentShop accShop) {
		sessionFactory.getCurrentSession().persist(accShop);
	}

	@Override
	public void updateAccidentShop(AccidentShop accShop,UploadFileDto[] dtos,User user) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			accShop.setAttachFile(attachFile);
		}else{
			//上传文件为空
			accShop.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().merge(accShop);
	}
	
	@Override
	public void deleteShops(Accident a) {
		List<AccidentShop> accShops = getAccidentShop(a);
		if(accShops == null || accShops.size() == 0){
			return;
		}
		for(AccidentShop acc : accShops){
			deleteAccidentShop(acc);
		}
	}
	private void deleteAccidentShop(AccidentShop a){
		try {
			AttachFile attachFile = a.getAttachFile();
			Session session = sessionFactory.getCurrentSession();
			String hql = "delete AccidentShop a where a.id =:id";
			session.createQuery(hql).setParameter("id", a.getId()).executeUpdate();
			if (attachFile != null) {
				String attachFileId = attachFile.getId();
				// 删除附件
				attachFileService.deleteAttachFile(attachFileId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询计划的所有回报
	 * @param a 计划
	 * @return
	 */
	private List<AccidentShop> getAccidentShop(Accident a){
		String eql = "FROM AccidentShop accShop WHERE accShop.accident = :accident";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("accident", a);
		return query.list();
	}

}
