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

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.communicate.domain.Communicate;
import com.enovell.yunwei.communicate.domain.CommunicateShop;
import com.enovell.yunwei.communicate.dto.CommunicateDTO;
import com.enovell.yunwei.communicate.service.CommunicateShopService;
import com.enovell.yunwei.util.DataExistStatus;

@SuppressWarnings("unchecked")
@Service("communicateShopService")
@Transactional
public class CommunicateShopServiceImpl implements CommunicateShopService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Override
	public void addCommunicateShop(CommunicateShop cs) {
		sessionFactory.getCurrentSession().persist(cs);
	}
	@Override
	public void deleteShops(Communicate c) {
		List<CommunicateShop> comShops = getCommunicateShop(c);
		if(comShops == null || comShops.size() == 0){
			return;
		}
		for(CommunicateShop cs : comShops){
			deleteCommunicateShop(cs);
		}
	}
	private void deleteCommunicateShop(CommunicateShop cs){
		try {
			AttachFile attachFile = cs.getAttachFile();
			Session session = sessionFactory.getCurrentSession();
			String hql = "delete CommunicateShop cs where cs.id =:id";
			session.createQuery(hql).setParameter("id", cs.getId()).executeUpdate();
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
	 * @param c 计划
	 * @return
	 */
	private List<CommunicateShop> getCommunicateShop(Communicate c){
		String eql = "FROM CommunicateShop cs WHERE cs.communicate = :c";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("c", c);
		return query.list();
	}
	/**
	 * 获取登录用户需要汇报的计划信息（显示到汇报页面中）
	 * @param accident
	 * @param first
	 * @param max
	 * @return
	 */
	@Override
	public List<CommunicateDTO> getAllCommunicateDataByUser(Communicate communicate , User user,int first, int max) {
		String eql = "FROM CommunicateShop comShop LEFT JOIN FETCH comShop.attachFile  LEFT JOIN FETCH comShop.communicate LEFT JOIN FETCH comShop.communicate.user LEFT JOIN FETCH comShop.communicate.attachFile WHERE comShop.communicate.exist=:exist ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(communicate, user , eql, map)+ " ORDER BY comShop.communicate.time DESC  ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setFirstResult(first);
		query.setMaxResults(max);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<CommunicateDTO> list = getShow(query.list());
		return list;
	}
	@Override
	public long getCommunicateCountByUser(Communicate communicate ,User user) {
		String eql = "SELECT COUNT(comShop.id) FROM CommunicateShop comShop WHERE comShop.communicate.exist=:exist ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(communicate, user, eql, map);
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("exist", DataExistStatus.EXIST);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	private String createSql(Communicate communicate, User user , String sql,
			Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
		if (communicate != null) {
			if (communicate.getName() != null && communicate.getName().length() != 0) {
				buffer.append(" AND comShop.communicate.name like :name ");
				map.put("name", "%" + communicate.getName() + "%");
			}
			buffer.append(" AND comShop.org.id=:id ");
			map.put("id",user.getOrganization().getId());
		}
		return buffer.toString();
	}
	private List<CommunicateDTO> getShow(List<CommunicateShop> lists) {
		List<CommunicateDTO> list = new ArrayList<CommunicateDTO>();
		for (CommunicateShop cs : lists) {
			CommunicateDTO dto = new CommunicateDTO();
			String id = cs.getCommunicate().getId();
			String name = cs.getCommunicate().getName();
			Date time = cs.getCommunicate().getTime();
			String user = "";
			if(cs.getCommunicate().getUser()!=null){
				user = cs.getCommunicate().getUser().getName();
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
	public CommunicateShop getCommunicateShopByCommunicateId(Communicate communicate) {
		String hql = "FROM CommunicateShop cs "
				+ " LEFT JOIN FETCH cs.org "
				+ " LEFT JOIN FETCH cs.communicate "
				+ " LEFT JOIN FETCH cs.attachFile "
				+ " LEFT JOIN FETCH cs.attachFile.files"
				+ " WHERE cs.communicate.id =:communicateId"
				+ " AND cs.org.id =:orgId";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("communicateId", communicate.getId());
		query.setParameter("orgId", communicate.getUser().getOrganization().getId());
		return (CommunicateShop) query.uniqueResult();
	}
	@Override
	public void updateCommunicateShop(CommunicateShop cs) {
		sessionFactory.getCurrentSession().merge(cs);
	}

}
