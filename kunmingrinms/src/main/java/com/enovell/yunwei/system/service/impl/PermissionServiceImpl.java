package com.enovell.yunwei.system.service.impl;

import com.enovell.system.common.domain.Permission;
import com.enovell.system.common.domain.Role;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.service.PermissionService;
import com.enovell.yunwei.util.JsonUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Property;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@SuppressWarnings("unchecked")
@Transactional(readOnly = true)
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("rawtypes")
	@Override
	public Permission getPerById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Permission e " +
				" LEFT JOIN FETCH e.module " +
				" where e.id = :id ");
		query.setParameter("id", id);

		Iterator iterator = query.iterate();
		Permission per = iterator.hasNext() ? (Permission) iterator.next() : null;
		if(per != null) {
			
			per.getChildren().size();
			return per;
		}
		
		return null;
	}

	@Override
	public  Set<Permission> getNextPers(User user, Permission parent) {
		
		if(parent == null) {
			
			return getRootPers(user);
		}
		return getPersByUserAndPar(user, parent);
	}
	
	/**
	 * 
	 * getRootPers 根据用户查询一级权限
	 * @param user
	 * @return
	 */
	private Set<Permission> getRootPers(User user) {
		
		Session session = sessionFactory.getCurrentSession();
		String eql = "from Permission p  "
				+ " left join fetch p.functionPo "
				+ "  left join fetch p.module m"
				+ " left join fetch p.roles r " 
				+ " left join fetch r.users u "
				+ " where u.id =:id "
//				+ " and m.state = 1 "
				+ " and p.parent in (select per from Permission per where per.parent is null) "
				+ " order by p.sn ";
		
		Query query = session.createQuery(eql);
		query.setParameter("id", user.getId());
		List<Permission> perList = query.list();
		Set<Permission> perSet = new TreeSet<Permission>(perList);
		return perSet;
	}
	
	/**
	 * 
	 * getPersByUserAndPar 根据用户和权限parent父类查询权限
	 * @param user
	 * @param parent
	 * @return
	 */
	private Set<Permission> getPersByUserAndPar(User user, Permission parent) {
		
		Set<Permission> perSet = getPersByUserAndParent(user, parent);
		for(Permission p : perSet) {
			
			Set<Permission> childs =getPersByUserAndParent(user, p);
			p.setChildren(childs);
		}
		return perSet;
	}
	
	private Set<Permission> getPersByUserAndParent(User user, Permission parent) {
		
		Session session = sessionFactory.getCurrentSession();
		String eql = "from Permission p  "
				+ " left join fetch p.functionPo "
				+ " left join fetch p.module "
				+ " left join fetch p.roles r " 
				+ " left join fetch r.users u "
				+ " where u.id =:id "
				+ " and p.parent.id = :perId "
				+ " order by p.sn ";
		
		Query query = session.createQuery(eql);
		query.setParameter("id", user.getId());
		query.setParameter("perId", parent.getId());
		List<Permission> perList = query.list();
		// 特别注意：TreeSet实现去重和排序时，处在同一级权限的sn_字段不能相同
		Set<Permission> perSet = new TreeSet<Permission>(perList);
		return perSet;
	}

	@Override
	public String getAllPers() {
		String sql = "select * from cfg_safe_permission p start with p.parent_id_ is null connect by prior p.permission_id_ = p.parent_id_ order siblings by p.sn_";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<Object[]> allPers = query.list();
		List<PermissionDto> allPerList = new ArrayList<PermissionDto>();
		PermissionDto root = convertToDto(allPers.get(0));
		for(int i = 1;i < allPers.size();i++){
			allPerList.add(convertToDto(allPers.get(i)));
		}
		for(PermissionDto p : allPerList){
			recurToRoot(root,p,allPerList);
		}
		return JsonUtil.javaToJsonAsString(root.getChildren());
	}

	private PermissionDto convertToDto(Object[] objects) {
		PermissionDto result = new PermissionDto();
		result.setId((String) objects[0]);
		result.setText((String) objects[1]);
		if(objects[6] != null)
			result.setParentId((String) objects[6]);
		return result;
	}

	/**将所有权限封装到root对象中
	 * @param root
	 * @param p
	 */
	private void recurToRoot(PermissionDto root, PermissionDto p,List<PermissionDto> allPers) {
		if(p.getParentId().equals(root.getId())){
			if(!root.getChildren().contains(p))
				root.getChildren().add(p);
		}else{
			PermissionDto parent = findParent(p.getParentId(),allPers);
			if(!parent.getChildren().contains(p))
				parent.getChildren().add(p);
			recurToRoot(root,parent,allPers);
		}
	}

	private PermissionDto findParent(String parentId, List<PermissionDto> allPers) {
		for(PermissionDto p : allPers){
			if(parentId.equals(p.getId())){
				return p;
			}
		}
		return null;
	}

	@Override
	public List<Permission> getPersByRole(Role role) {
		Criteria c = sessionFactory.getCurrentSession().createCriteria(Permission.class);
		c.createAlias("roles", "role");
		Property p = Property.forName("role.id");
		c.add(p.eq(role.getId()));
		List<Permission> result = c.list();
		return result;
	}

	@Override
	public List<Permission> getBtnPers(String perId, User user) {
		Session session = sessionFactory.getCurrentSession();
		String eql = "from Permission p  "
				+ " left join fetch p.functionPo "
				+ " left join fetch p.module "
				+ " left join fetch p.roles r " 
				+ " left join fetch r.users u "
				+ " where u.id =:id "
				+ " and p.parent.id = :perId "
				+ " and p.permissionMark = :permissionMark "
				+ " order by p.sn ";
		
		Query query = session.createQuery(eql);
		query.setParameter("id", user.getId());
		query.setParameter("perId",perId);
		query.setParameter("permissionMark","yunweibtn");
		List<Permission> perList = query.list();
		return perList;
	}
}

class PermissionDto{
	private String id;
	private String parentId;
	private String text;
	private List<PermissionDto> children = new ArrayList<PermissionDto>();
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<PermissionDto> getChildren() {
		return children;
	}
	public void setChildren(List<PermissionDto> children) {
		this.children = children;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
}