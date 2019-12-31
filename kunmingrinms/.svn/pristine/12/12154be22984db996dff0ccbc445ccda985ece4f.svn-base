package com.enovell.yunwei.system.service.impl;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.Role;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.service.RoleService;
import org.apache.commons.lang.StringUtils;
import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 角色业务逻辑实现类
 * @author Roy
 * 2017年2月7日--上午10:46:12
 */
@Transactional()
@Service("roleService")
@SuppressWarnings("unchecked")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private SessionFactory sessionFactory;
	/* (non-Javadoc)
	 * @see com.enovell.yunwei.system.service.RoleService#getAllRole(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public List<Role> getAllRole(String start, String limit, String roleName) {
		Criteria c = sessionFactory.getCurrentSession().createCriteria(Role.class);
		c.add(Restrictions.eq("state", Role.EXIST));
		c.add(Restrictions.ne("name", "roleAdmin"));
		
		if(StringUtils.isNotBlank(roleName)){
			c.add(Restrictions.like("name", "%"+roleName+"%"));
		}
		c.addOrder(Order.asc("sn"));
		c.setFirstResult(Integer.parseInt(start));
		c.setMaxResults(Integer.parseInt(limit));
		List<Role> result = c.list();
		return result;
	}

	/* (non-Javadoc)
	 * @see com.enovell.yunwei.system.service.RoleService#getAllRoleCount(java.lang.String)
	 */
	@Override
	public Long getAllRoleCount(String roleName) {
		Criteria c = sessionFactory.getCurrentSession().createCriteria(Role.class);
		c.add(Restrictions.eq("state", Role.EXIST));
		c.add(Restrictions.ne("name", "roleAdmin"));
		if(StringUtils.isNotBlank(roleName)){
			c.add(Restrictions.like("name", "%"+roleName+"%"));
		}
		c.setProjection(Projections.rowCount());
		Long result = (Long) c.uniqueResult();
		return result;
	}

	/* (non-Javadoc)
	 * @see com.enovell.yunwei.system.service.RoleService#saveOrUpdateRole(com.enovell.system.common.domain.Role, java.lang.String)
	 */
	@Override
	public void saveOrUpdateRole(User currentUser, String roleId, String roleName, String desc, String perIds) {
		boolean isNew = StringUtils.isBlank(roleId);
		if(isNew){
			roleId = UUID.randomUUID().toString().replaceAll("-", "");
			String roleSql = "insert into cfg_safe_role"
					+ "(ROLE_ID_,ROLE_CREATE_TIME,CREATE_USER_ID_,ROLE_DESC_,ROLE_NAME_,ROLE_ADMIN_,ROLE_STATE_,SN_) "
					+ "values(?,?,?,?,?,?,?,?)";
			Query roleQuery = sessionFactory.getCurrentSession().createSQLQuery(roleSql);
			roleQuery.setParameter(0, roleId);
			roleQuery.setParameter(1, new Date());
			roleQuery.setParameter(2, currentUser.getId());
			roleQuery.setParameter(3, desc);
			roleQuery.setParameter(4, roleName);
			roleQuery.setParameter(5, 0);
			roleQuery.setParameter(6, Role.EXIST);
			roleQuery.setParameter(7, 0);
			roleQuery.executeUpdate();
		}else{
			String roleSql = "update cfg_safe_role set ROLE_NAME_ = ?,ROLE_DESC_= ? where ROLE_ID_=?";
			Query roleQuery = sessionFactory.getCurrentSession().createSQLQuery(roleSql);
			roleQuery.setParameter(0, roleName);
			roleQuery.setParameter(1, desc);
			roleQuery.setParameter(2, roleId);
			roleQuery.executeUpdate();
		}
		String[] perIdArr = perIds.split(",");
		if(!isNew){
			String deleteSql = "delete from cfg_safe_role_permission where role_id_ = ?";
			Query delQuery = sessionFactory.getCurrentSession().createSQLQuery(deleteSql);
			delQuery.setParameter(0, roleId);
			delQuery.executeUpdate();
		}
		String insertSql = "insert into cfg_safe_role_permission values (?,?)";
		Query insQuery = sessionFactory.getCurrentSession().createSQLQuery(insertSql);
		for(String perId : perIdArr){
			insQuery.setParameter(0, roleId);
			insQuery.setParameter(1, perId);
			insQuery.executeUpdate();
		}
	}

	/* (non-Javadoc)
	 * @see com.enovell.yunwei.system.service.RoleService#deleteRole(java.lang.String)
	 */
	@Override
	public void deleteRole(String roleId) {
		Role role = (Role) sessionFactory.getCurrentSession().get(Role.class, roleId);
		role.setDeleteTime(new Date());
		role.setState(Role.REMOVE);
		sessionFactory.getCurrentSession().saveOrUpdate(role);
	}

	/* (non-Javadoc)
	 * @see com.enovell.yunwei.system.service.RoleService#assignToUser(java.lang.String, java.lang.String)
	 */
	@Override
	public void assignToUser(String orgId, String roleId, String userIds) {
		String[] userIdsArr = userIds.split(",");
		String delSql = "delete from cfg_safe_user_role where role_id_=? and user_id_ in (select USER_ID_ from cfg_safe_user where ORGANIZATION_ID_ = ?)";
		Query delQuery = sessionFactory.getCurrentSession().createSQLQuery(delSql);
		delQuery.setParameter(0, roleId);
		delQuery.setParameter(1, orgId);
		delQuery.executeUpdate();
		if(!("".equals(userIds))&&userIds.length()!=0){
			String insSql = "insert into cfg_safe_user_role values(?,?)";
			Query insQuery = sessionFactory.getCurrentSession().createSQLQuery(insSql);
			for(String userId : userIdsArr){
				insQuery.setParameter(0, roleId);
				insQuery.setParameter(1, userId);
				insQuery.executeUpdate();
			}
		}
	}
	
	@Override
	public List<User> getUserByRole(String roleId) {
		
		String sql ="select t.user_id_,u.user_name_,o.org_name_ from CFG_SAFE_USER_ROLE t "+
					"left join cfg_safe_user u on u.user_id_=t.user_id_ "+
					"left join cfg_base_organization o on o.org_id_ = u.organization_id_ "+
					"where t.role_id_=:roleId ";
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("roleId", roleId);
		List<Object[]> list = query.list();
		List<User> result = new ArrayList<User>();
		for(Object[] obj : list){
			User user = new User();
			user.setId(obj[0].toString());
			user.setName(obj[1].toString());
			Organization org = new Organization();
			org.setName(obj[2].toString());
			user.setOrganization(org);
			result.add(user);
		}
		return result;
	}

	@Override
	public Role getRoleById(String roleId) {
		Role role = (Role) sessionFactory.getCurrentSession().get(Role.class, roleId);
		return role;
	}

	@Override
	public String getRoleNameByUserId(String userId) {
		String sql = "select r.role_name_ from CFG_SAFE_USER_ROLE ur "
				+ " left join CFG_SAFE_USER u on u.user_id_ = ur.user_id_ "
				+ " left join CFG_SAFE_ROLE r on r.role_id_ = ur.role_id_ "
				+ " where r.role_state_ = :state "
				+ " and u.user_id_ = :userId ";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("state", Role.EXIST);
		List<Object> list = query.list();
		String roleNames = "";//拼接角色名
		String roleNamesSub = "";//去掉第一个逗号,截取角色名
		if (list != null && list.size() != 0) {
			for (Object object : list) {
				roleNames = roleNames + "," + object.toString();
			}
			roleNamesSub = roleNames.substring(1, roleNames.length());
		}
		return roleNamesSub;
	}

}
