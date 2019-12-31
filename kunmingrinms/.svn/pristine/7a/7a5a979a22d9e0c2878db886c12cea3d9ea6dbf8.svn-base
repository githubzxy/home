package com.enovell.yunwei.system.service.impl;


import com.enovell.system.common.domain.Organization;
import com.enovell.yunwei.system.service.OrganizationService;
import org.apache.commons.lang.StringUtils;
import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 
 * 项目名称：guangtieYearMonth
 * 类名称：OrganizationServiceImpl   
 * 类描述:  组织机构service实现类
 * 创建人：张思红 
 * 创建时间：2014-10-28 上午10:28:41
 * 修改人：张思红 
 * 修改时间：2014-10-28 上午10:28:41   
 *
 */
@SuppressWarnings("unchecked")
@Transactional
@Service("organizationService")
public class OrganizationServiceImpl implements OrganizationService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void add(Organization organization) {
		organization.setDeleteState(Organization.EXIST);
		organization.setOrgIndex(0);
		sessionFactory.getCurrentSession().save(organization);
	}
	
	private Organization getOrganizationById(String id) {
		
		String hql = " From Organization o "
							+ " LEFT JOIN FETCH o.parent  "
							+ " where o.id = :id ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		return (Organization) query.uniqueResult();
	}
	
	@Override
	public void update(Organization organization) {
		
		Organization org = getOrganizationById(organization.getId());
		org.setName(organization.getName());
		org.setParent(organization.getParent());
		org.setType(organization.getType());
		org.setDesc(organization.getDesc());
		sessionFactory.getCurrentSession().saveOrUpdate(org);
	}
	
	@Override
	public void delete(String id) {
		
		Organization org = getOrganizationById(id);
		org.setDeleteState(Organization.DELETE);
		sessionFactory.getCurrentSession().saveOrUpdate(org);
	}
	
	public void batchDelete(String ids) {
		
		String[] idArray = ids.split(",");
		String sql = " update CFG_BASE_ORGANIZATION o set o.DELETE_STATE_ =:deleteState where o.ORG_ID_ in (:ids) ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("deleteState", Organization.DELETE);
		query.setParameterList("ids", idArray);
		query.executeUpdate();
	}
	
	private void updateSql(int orgIndex, String orgId) {
		String sql = " update CFG_BASE_ORGANIZATION o set o.ORGINDEX_ =:orgIndex where o.ORG_ID_ =:orgId ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("orgIndex", orgIndex);
		query.setParameter("orgId", orgId);
		query.executeUpdate();
	}
	
	@Override
	public void saveSort(String ids) {
		
		String[] idArray = ids.split(",");
		for(int i = 0; i < idArray.length; i++) {
			updateSql(i, idArray[i]);
		}
	}
	
	@Override
	public List<Organization> getChildrenByPid(String pid) {
		Organization parentOrg = new Organization();
		parentOrg.setId(pid);
		List<Organization> childList = sessionFactory.getCurrentSession().
				createCriteria(Organization.class)
				.add(Restrictions.eq("parent", parentOrg))
				.add(Restrictions.eq("deleteState", Organization.EXIST))
				.addOrder(Order.asc("orgIndex"))
				.list();
		/*
		 * 用于BUI树形组件TreeStore
		 * TreeStore中的“leaf”属性判定是否为叶子节点
		 * leaf=true：叶子节点
		 * leaf=false：非叶子节点
		 */
		for(Organization child : childList) {
			int count = getChildrenCount(child.getId());
			if(count > 0) {
				child.setIsdept(false);
			} else {
				child.setIsdept(true);
			}
		}
		return childList;
	}
	
	// 根据父id（pid）查询子机构的数量
	private int getChildrenCount(String pid) {
		String sql = " SELECT count(o.ORG_ID_) FROM CFG_BASE_ORGANIZATION o where o.PARENT_ID_ =:pid and o.DELETE_STATE_ =:deleteState  ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("pid", pid);
		query.setParameter("deleteState", Organization.EXIST);
		return ((BigDecimal) query.uniqueResult()).intValue();
	}

	@Override
	public List<Organization> getChildrenByPidAndCurId(String pid, String curId) {
		
		Organization parentOrg = new Organization();
		parentOrg.setId(pid);
		
		Criteria criteria = sessionFactory.getCurrentSession().
				createCriteria(Organization.class)
				.add(Restrictions.eq("parent", parentOrg))
				.add(Restrictions.eq("deleteState", Organization.EXIST));
		if(StringUtils.isNotBlank(curId)) {
			criteria.add(Restrictions.ne("id", curId));
		}
		List<Organization> childList = criteria.addOrder(Order.asc("orgIndex")).list();
		/*
		 * 用于BUI树形组件TreeStore
		 * TreeStore中的“leaf”属性判定是否为叶子节点
		 * leaf=true：叶子节点
		 * leaf=false：非叶子节点
		 */
		for(Organization child : childList) {
			int count = getChildrenCount(child.getId());
			if(count > 0) {
				child.setIsdept(false);
			} else {
				child.setIsdept(true);
			}
		}
		return childList;
	}
	
	@Override
	public List<Organization> getChildrenByParent(Organization parent) {
		
		Session session = sessionFactory.getCurrentSession();
		
		String pql = " SELECT DISTINCT o FROM Organization as o "
				+ " LEFT JOIN FETCH o.parent "
				+ " WHERE o.parent =:parent " 
				+ " AND o.deleteState =:deleteState "
				+ " ORDER BY o.orgIndex ";
		Query query = session.createQuery(pql);
		query.setParameter("parent", parent);
		query.setParameter("deleteState", Organization.EXIST);
		return query.list();
	}

	@Override
	public List<Organization> getSegmentByPid(String pid) {

		Organization parentOrg = new Organization();
		parentOrg.setId(pid);
		List<Organization> childList = sessionFactory.getCurrentSession().
				createCriteria(Organization.class)
				.add(Restrictions.eq("parent", parentOrg))
				.add(Restrictions.ne("type", 4))	//排除车间(type=4)
				.add(Restrictions.eq("deleteState", Organization.EXIST))
				.addOrder(Order.asc("orgIndex"))
				.list();
		/*
		 * 用于BUI树形组件TreeStore
		 * TreeStore中的“leaf”属性判定是否为叶子节点
		 * leaf=true：叶子节点
		 * leaf=false：非叶子节点
		 */
		for(Organization child : childList) {
			int count = getChildrenCount(child.getId());
			if(count > 0) {
				child.setIsdept(false);
			} else {
				child.setIsdept(true);
			}
		}
		return childList;
	}
	
	@Override
	public List<Organization> getAllWorkshop() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Organization o Where o.type = 1502 AND o.deleteState =:deleteState Order By o.orgIndex";
		Query query = session.createQuery(hql);
		query.setParameter("deleteState", Organization.EXIST);
		return query.list();
	}
	
	@Override
	public void saveSegmentAndWorkshop(String segmentId, String[] workshopIds){
		Session session = sessionFactory.getCurrentSession();
		// 先删除与segmentId关联的所有workshopIds数据
		String sql = "Delete From SEGMENT_WORKSHOP_RELATIVE s Where s.SEGMENT_ID = :segmentId";
		Query query = session.createSQLQuery(sql);
		query.setParameter("segmentId", segmentId);
		query.executeUpdate();
		
		// 添加新的segmentId关联的所有workshopIds数据
		sql = "Insert Into SEGMENT_WORKSHOP_RELATIVE s (SEGMENT_ID, WORKSHOP_ID) Values (:segmentId,:workshopId)";
		for(String workshopId : workshopIds) {
			query = session.createSQLQuery(sql);
			query.setParameter("segmentId", segmentId);
			query.setParameter("workshopId", workshopId);
			query.executeUpdate();
		}
	}
	
	@Override
	public List<Organization> getAllWorkshopBySegment(String segmentId) {
		Session session = sessionFactory.getCurrentSession();
		List<Organization> allWorkshopList = getAllWorkshop();
		Map<String, Organization> allWorkshopMap = new HashMap<String, Organization>();
		for(Organization workshop : allWorkshopList) {
			if(workshop != null) {
				workshop.setIsdept(false);// 默认不选中
				allWorkshopMap.put(workshop.getId(), workshop);
			}
		}
		
		String sql = "Select s.WORKSHOP_ID From SEGMENT_WORKSHOP_RELATIVE s Where s.SEGMENT_ID = :segmentId";
		Query query = session.createSQLQuery(sql);
		query.setParameter("segmentId", segmentId);
		List<String> selectedWorkshopList = query.list();
		Organization organization = null;
		for(String workshopId : selectedWorkshopList) {
			organization = allWorkshopMap.get(workshopId);
			if(organization != null) {
				organization.setIsdept(true);// 选中
			}
		}
		
		return allWorkshopList;
	}
	
	@Override
	public Organization getOrgChildrenById(String orgId) {
		Organization org = (Organization) sessionFactory.getCurrentSession().
				createCriteria(Organization.class)
				.setFetchMode("children", FetchMode.JOIN)
				.add(Restrictions.eq("id", orgId))
				.add(Restrictions.eq("deleteState", Organization.EXIST))
				.uniqueResult();
		return org;
	}

	@Override
	public List<Organization> getOndutyOrgs(String sortField) {
		String hql = "Select org From Organization org, OnDutyDept odd "
				+ " Where org.id = odd.orgId AND org.deleteState =:deleteState";
		if(StringUtils.isNotBlank(sortField)){
			hql += " Order by org." + sortField.trim();
		}
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("deleteState", Organization.EXIST);
		return query.list();
	}

	@Override
	public Organization getParentOrgByChild(String orgId) {
		Organization org = (Organization) sessionFactory.getCurrentSession().
		createCriteria(Organization.class)
		.setFetchMode("parent", FetchMode.JOIN)
		.add(Restrictions.eq("id", orgId))
		.add(Restrictions.eq("deleteState", Organization.EXIST))
		.uniqueResult();
		return org.getParent();
	}
}
