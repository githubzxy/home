package com.enovell.yunwei.emergencyOrg.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.emergencyOrg.domain.EmergencyOrg;
import com.enovell.yunwei.emergencyOrg.dto.EmergencyOrgDTO;
import com.enovell.yunwei.emergencyOrg.service.EmergencyOrgService;
import com.enovell.yunwei.util.DataExistStatus;
/**
 * 项目名称：kunmingrinms 
 * 类名称：EmergencyOrgServiceImpl
 * 描述: 机构管理实现类
 * 创建人：yangsy 
 * 创建时间：2016-12-07 
 */
@SuppressWarnings("unchecked")
@Service("emergencyOrgService")
@Transactional
public class EmergencyOrgServiceImpl implements EmergencyOrgService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/**
	 * 查询机构显示成树结构
	 */
	@Override
	public List<EmergencyOrg> getOrgChildrenByPid(String pid) {
		EmergencyOrg parentOrg = new EmergencyOrg();
		parentOrg.setId(pid);
		parentOrg.setParent(null);
		parentOrg.setChildren(null);
		List<EmergencyOrg> childList = sessionFactory.getCurrentSession().
				createCriteria(EmergencyOrg.class)
				.add(Restrictions.eq("exist", DataExistStatus.EXIST))
				.add(Restrictions.eq("parent", parentOrg))
				.addOrder(Order.asc("sn"))
				.list();
		
		/** 用于BUI树形组件TreeStore
		 * TreeStore中的“leaf”属性判定是否为叶子节点
		 * leaf=true：叶子节点
		 * leaf=false：非叶子节点
		 */
		
		for(EmergencyOrg child : childList) {
			int count = getChildrenCount(child.getId());
			if(count > 0) {
				child.setIsLeaf(false);
			} else {
				child.setIsLeaf(true);
			}
		}
		return childList;
	}
	// 根据父id（pid）查询子机构的数量
	private int getChildrenCount(String pid) {
		String sql = " SELECT COUNT(e.ID_) FROM EMERGRNCYORG e WHERE e.EMERGENCYORGID_ =:pid AND e.EXIST_ =:exist";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setParameter("pid", pid);
		query.setParameter("exist", DataExistStatus.EXIST);
		return ((BigDecimal) query.uniqueResult()).intValue();
	}
	/**
	 * 新增子机构
	 */
	@Override
	public void addOrg(EmergencyOrg newOrg) {
		sessionFactory.getCurrentSession().save(newOrg);
	}
	/**
	 * 根据id获取一个机构的数据
	 */
	@Override
	public EmergencyOrg getOrgDataById(String id) {
		String hql = "FROM EmergencyOrg e " 
						+ " LEFT JOIN FETCH e.parent "
						+ " WHERE e.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (EmergencyOrg) query.uniqueResult();
	}
	/**
	 * 修改机构名称
	 */
	@Override
	public void updateOrg(String orgId,String name) {
		String sql = " update EMERGRNCYORG e set e.NAME_ =:name where e.ID_ =:orgId";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("name", name);
		query.setParameter("orgId", orgId);
		query.executeUpdate();
	}
	/**
	 * 验证一个机构下是否存在子机构
	 */
	@Override
	public long checkChildrenOrg(String id) {
		String sql = " SELECT COUNT(e.ID_) FROM EMERGRNCYORG e WHERE e.EMERGENCYORGID_ =:id and e.EXIST_=:exist ";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setParameter("id", id);
		query.setParameter("exist",DataExistStatus.EXIST);
		return ((BigDecimal) query.uniqueResult()).intValue();
	}
	/**
	 * 验证一个机构下是否存在应急人员
	 */
	@Override
	public long checkOrgPeople(String id) {
		String sql = " SELECT COUNT(e.ID_) FROM EMERGENCYUSER e WHERE e.EMERGENCYORGID_ =:id and e.EXIST_=:exist  ";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setParameter("id", id);
		query.setParameter("exist",DataExistStatus.EXIST);
		return ((BigDecimal) query.uniqueResult()).intValue();
	}
	/**
	 * 删除机构
	 */
	@Override
	public void deleteOrg(String id) {
		EmergencyOrg emergencyOrg = getEmergencyOrgById(id);
		emergencyOrg.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(emergencyOrg);
//		String hql = "DELETE EmergencyOrg e WHERE e.id =:id";
//		Session session= sessionFactory.getCurrentSession();
//		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}
	/**
	 * 根据父节点id获取子元素（用于排序当中）
	 */
	@Override
	public List<EmergencyOrgDTO> getChildrenByParentId(String parentId) {
		EmergencyOrg parentOrg = new EmergencyOrg();
		parentOrg.setId(parentId);
		parentOrg.setParent(null);
		parentOrg.setChildren(null);
		List<EmergencyOrg> childList = sessionFactory.getCurrentSession().
				createCriteria(EmergencyOrg.class)
				.add(Restrictions.eq("parent", parentOrg))
				.add(Restrictions.eq("exist", DataExistStatus.EXIST))
				.addOrder(Order.asc("sn"))
				.list();
		List<EmergencyOrgDTO> list = getShowList(childList);
		return list;
	}
	/**
	 * 获取显示数据
	 * @param childList
	 * @return
	 */
	private List<EmergencyOrgDTO> getShowList(List<EmergencyOrg> childList) {
		List<EmergencyOrgDTO> list = new ArrayList<EmergencyOrgDTO>();
		for (EmergencyOrg emergencyOrg : childList) {
			EmergencyOrgDTO dto = new EmergencyOrgDTO();
			dto.setValue(emergencyOrg.getId());
			dto.setText(emergencyOrg.getName());
			list.add(dto);
		}
		return list;
	}
	/**
	 * 排序
	 */
	@Override
	public void sortOrg(String sortId) {
		String[] idArray = sortId.split(",");
		for (int i = 0; i < idArray.length; i++) {
			EmergencyOrg emergencyOrg = new EmergencyOrg();
			emergencyOrg.setId(idArray[i]);
			emergencyOrg.setSn(i);
			updateSort(emergencyOrg);
		}
	}
	/**
	 * 修改排列顺序
	 * @param emergencyOrg
	 */
	private void updateSort(EmergencyOrg emergencyOrg) {
		String sql = " UPDATE EmergencyOrg e SET e.sn =:sn WHERE e.id =:id ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("sn", emergencyOrg.getSn());
		query.setParameter("id", emergencyOrg.getId());
		query.executeUpdate();
	}
	
	/**
	 * -------------------------------------------------------------------------------------------
	 */
	
	/**
	 * 原有方法
	 */
	
	/**
	 * 新增机构
	 * parameter EmergencyOrg son And EmergencyOrg parent
	 */
	@Override
	public EmergencyOrg addEmergencyOrg(EmergencyOrg son, EmergencyOrg parent) {
		son.setParent(parent);
		sessionFactory.getCurrentSession().persist(son);
		return son;
	}
	@Override
	public EmergencyOrg updateEmergencyOrg(EmergencyOrg emergencyOrg) {
		EmergencyOrg newEmergencyOrg = getEmergencyOrgById(emergencyOrg.getId());
		if (newEmergencyOrg != null) {
			sessionFactory.getCurrentSession().merge(emergencyOrg);
		}
		return emergencyOrg;
	}
	/**
	 * 根据id获取对应的机构对象
	 */
	@Override
	public EmergencyOrg getEmergencyOrgById(String id) {
		String hql = "FROM EmergencyOrg e " 
				+ " LEFT JOIN FETCH e.parent "
				+ " WHERE e.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (EmergencyOrg) query.uniqueResult();
	}

	@Override
	public EmergencyOrg getEmergencyOrgByObject(EmergencyOrg emergencyOrg) {
		EmergencyOrg myEmergencyOrg = null;
		if (emergencyOrg != null && emergencyOrg.getId() != null) {
			myEmergencyOrg = getEmergencyOrgById(emergencyOrg.getId());
		}
		return myEmergencyOrg;
	}
	/**
	 * 获取机构树
	 */
	@Override
	public EmergencyOrg getEmergencyOrgTree() {
		String eql = "FROM EmergencyOrg as eo WHERE eo.parent is null";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		EmergencyOrg emergencyOrg = (EmergencyOrg) query.uniqueResult();
		initTree(emergencyOrg);
		return emergencyOrg;
	}

	private void initTree(EmergencyOrg parent) {
		Set<EmergencyOrg> organizations = parent.getChildren();
		if (organizations != null && !organizations.isEmpty()) {
			for (EmergencyOrg organization : organizations) {
				initTree(organization);
			}
		}
	}
	/**
	 * 删除机构
	 */
	@Override
	public void deleteEmergencyOrg(EmergencyOrg emergencyOrg) {
		EmergencyOrg psEmergencyOrg = getEmergencyOrgById(emergencyOrg.getId());
		if (psEmergencyOrg != null) {
			psEmergencyOrg.setExist(DataExistStatus.NOT_EXIST);
//			sessionFactory.getCurrentSession().delete(psEmergencyOrg);
		}
	}

	@Override
	public List<EmergencyOrg> getAllEmergencyOrg() {
		String eql = "FROM EmergencyOrg";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		List<EmergencyOrg> list = query.list();
		return list;
	}

	@Override
	public int getContent() {
		String eql = "SELECT COUNT(e.id) FROM EmergencyOrg e WHERE 1=1 ";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		return ((Long) query.uniqueResult()).intValue();
	}

	@Override
	public List<EmergencyOrg> getEmergencyOrgByName(String name) {
		String eql = "FROM EmergencyOrg e WHERE e.name = '" + name + "'";
		List<EmergencyOrg> list = new ArrayList<EmergencyOrg>();
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		list = query.list();
		return list;
	}

	@Override
	public boolean isChildNode(EmergencyOrg typeOrg) {
		boolean isChildNode = true;

		EmergencyOrg emergencyOrg = getEmergencyOrgByObject(typeOrg);
		if (emergencyOrg != null && emergencyOrg.getChildren().size() != 0) {
			isChildNode = false;
		}
		return isChildNode;
	}

	@Override
	public List<EmergencyOrg> getChildrenByPanrentOrg(EmergencyOrg parent) {
		String eql = "SELECT DISTINCT o FROM EmergencyOrg as o "
				+ "LEFT JOIN FETCH o.parent " + "LEFT JOIN FETCH o.children "
				+ "WHERE o.parent =:parent";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("parent", parent);
		return query.list();
	}

	@Override
	public List<EmergencyOrg> getAllChildren(EmergencyOrg parent) {
		return getChildrenOrg(parent, new ArrayList<EmergencyOrg>());
	}
	
	private List<EmergencyOrg> getChildrenOrg(EmergencyOrg parent ,List<EmergencyOrg> list){
		Set<EmergencyOrg> orgs = parent.getChildren();
		if(orgs != null) {
			for(EmergencyOrg org : orgs) {
				list.add(org);
				getChildrenOrg(org,list);
			}
		}
		return list;
	}
	@Override
	public void updateEmergenOrgSN(List<EmergencyOrg> emergencyOrgs) {
		
	}

//	@Override
//	public void updateEmergenOrgSN(List<EmergencyOrg> emergencyOrgs) {
//		for(EmergencyOrg emergencyOrg : emergencyOrgs){
//			EmergencyOrg eo = sessionFactory.getCurrentSession().find(EmergencyOrg.class, emergencyOrg.getId());
//			eo.setSn(emergencyOrg.getSn());
//			sessionFactory.getCurrentSession().merge(eo);
//		}
//		
//	}

}
