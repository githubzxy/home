package com.enovell.yunwei.system.service.impl;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.Role;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.ArraySort;
import com.enovell.yunwei.friend.domain.FriendGroup;
import com.enovell.yunwei.friend.dto.FriendGroupDTO;
import com.enovell.yunwei.friend.service.FriendGroupService;
import com.enovell.yunwei.system.domain.RoleConfigShowDTO;
import com.enovell.yunwei.system.dto.UserToRoleDTO;
import com.enovell.yunwei.system.service.OrganizationService;
import com.enovell.yunwei.system.service.UserService;
import com.enovell.yunwei.util.MD5Util;
import org.apache.commons.lang.StringUtils;
import org.hibernate.*;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * @author roy
 * 2014年8月29日-下午3:12:10
 */
@SuppressWarnings("unchecked")
@Transactional()
@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Resource(name = "organizationService")
	private OrganizationService organizationService;
	
	@Resource(name = "friendGroupService")
	private FriendGroupService friendGroupService;
	@Resource(name = "namedParameterJdbcTemplate")
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	/**
	 * 昆明通信段以下部门的数据
	 */
	public final static  String  GUANGZOU_TXD_ID= "8affa073533aa3d601533bbef63e0010";

	@Override
	public User getUserByName(String userName) {
		return (User) sessionFactory.getCurrentSession().
				createCriteria(User.class)
				.add(Restrictions.eq("name", userName))
				.setFetchMode("organization", FetchMode.JOIN)
				.setFetchMode("region", FetchMode.JOIN)
				.uniqueResult();
	}

	@Override
	public User getUserById(String id) {
		return (User) sessionFactory.getCurrentSession().
				createCriteria(User.class)
				.add(Restrictions.eq("id", id))
				.setFetchMode("organization", FetchMode.JOIN)
				.setFetchMode("region", FetchMode.JOIN)
				.uniqueResult();
	}
	
	@Override
	public List<User> getUsersByIds(String[] ids) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " From User u " 
						+ " LEFT JOIN FETCH u.organization " 
						+ " where u.id in (:ids)";
		Query query = session.createQuery(hql);
		query.setParameterList("ids", ids);
		List<User> users = query.list();
		return ArraySort.sortListByChina(users, "getName");
	}
	
	@Override
	public List<User> getUsersByOrgId(String orgId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " From User u " 
						+ " LEFT JOIN FETCH u.organization " 
						+ " where u.organization.id = :orgId";
		Query query = session.createQuery(hql);
		query.setParameter("orgId", orgId);
		return query.list();
	}
	

	@Override
	public List<User> getUserByOrgIds(String[] orgIds) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " FROM User u "
						+ " LEFT JOIN FETCH u.organization "
						+ " WHERE u.organization.id in (:orgIds) ";
		Query query = session.createQuery(hql);
		query.setParameterList("orgIds", orgIds);
		List<User> users = query.list();
		return ArraySort.sortListByChina(users, "getName");
	}
	
	@Override
	public List<User> getUserByFriendGroupIds(String[] friendGroupIds) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " SELECT u FROM User u, Friend f"
						+ " LEFT JOIN FETCH u.organization "
						+ " WHERE u.id = f.user.id"
						+ " AND f.friendGroup.id in (:friendGroupIds) ";
		Query query = session.createQuery(hql);
		query.setParameterList("friendGroupIds", friendGroupIds);
		List<User> users = query.list();
		return ArraySort.sortListByChina(users, "getName");
	}
	
	@Override
	public List<User> getUsersByRoleName(String roleName) {
		String hql = " FROM User u  WHERE EXISTS ( FROM u.roles AS r WHERE r.name = :roleName ) ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("roleName", roleName);
		List<User> users = query.list();
		return ArraySort.sortListByChina(users, "getName");
	}
	
	/**封装动态查询条件
	 * @param userName
	 * @param c
	 * @param orgList
	 * @return
	 */
	private Criteria queryUserByParam(String userName, Criteria c,List<Organization> orgList) {
		if(StringUtils.isNotBlank(userName)){
			c.add(Restrictions.like("name", "%"+userName+"%"));
		}
		if(orgList!=null&&orgList.size()!=0){
			c.add(Restrictions.in("organization", orgList));
		}
		return c;
	}

	@Override
	public List<UserToRoleDTO> getAllUser(String start, String limit, String userName, String userOrg) {
		List<Organization> orgList = new ArrayList<Organization>();
		if(StringUtils.isNotBlank(userOrg)){
			Organization org = new Organization();
			org.setId(userOrg);
			orgList.add(org);
			List<Organization> childList = organizationService.getChildrenByPid(userOrg);
			orgList.addAll(childList);
		}
		Criteria c = sessionFactory.getCurrentSession().createCriteria(User.class);
		c.setFetchMode("organization", FetchMode.JOIN);
		c = queryUserByParam(userName, c,orgList);
		c.setFirstResult(Integer.parseInt(start)).setMaxResults(Integer.parseInt(limit));
		List<UserToRoleDTO> result = getUserToRoleDTOs(c.list());
		return result;
	}

	/**
	 * 
	 * getUserToRoleDTOs 显示信息
	 * @param users
	 * @return 
	 */
	private List<UserToRoleDTO> getUserToRoleDTOs(List<User> users){
		List<UserToRoleDTO> list = new ArrayList<UserToRoleDTO>();
		for (User user : users) {
			UserToRoleDTO dto = new UserToRoleDTO();
			dto.setUserId(user.getId());
			if (user.getOrganization() != null) {
				dto.setOrgId(user.getOrganization().getId());
				dto.setOrgName(user.getOrganization().getName());
			}
			dto.setUserName(user.getName());
			dto.setRoleName(getRoleName(user.getId()));
			dto.setTelephoneNumber(user.getTelephoneNumber());
			dto.setPhone(user.getPhone());
			dto.setRemark(user.getRemark());
			list.add(dto);
		}
		return list;
	}
	
	/**
	 * 
	 * getRoleName 通过用户Id,查询用户的角色,并进行拼接
	 * @param userId
	 * @return 逗号拼接好的角色
	 */
	private String getRoleName(String userId) {
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

	@Override
	public long getAllUserCounts(String userName, String userOrg) {
		List<Organization> orgList = new ArrayList<Organization>();
		if(StringUtils.isNotBlank(userOrg)){
			Organization org = new Organization();
			org.setId(userOrg);
			orgList.add(org);
			List<Organization> childList = organizationService.getChildrenByPid(userOrg);
			orgList.addAll(childList);
		}
		Criteria c = sessionFactory.getCurrentSession().createCriteria(User.class);
		c = queryUserByParam(userName, c,orgList);
		c.setProjection(Projections.rowCount());
		Long result = (Long) c.uniqueResult();
		return result;
	}

	@Override
	public void saveOrUpdateUser(String userId, String userName, String organization, String telephoneNumber, String phone, String remark) {
		User user;
		Organization o = new Organization();
		o.setId(organization);
		if(StringUtils.isNotBlank(userId)){
			user =  (User) sessionFactory.getCurrentSession().get(User.class, userId);
		}else{
			user = new User();
			user.setCreateTime(new Date());
			user.setPassword(MD5Util.toMD5("888888"));
			user.setDeleState(1);
		}
		user.setName(userName);
		user.setOrganization(o);
		user.setRemark(remark);
		user.setTelephoneNumber(telephoneNumber);
		user.setPhone(phone);
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	@Override
	public void resetUser(String userId, String password) {
		if(StringUtils.isNotBlank(userId)){
			User source = (User) sessionFactory.getCurrentSession().get(User.class, userId);
			source.setPassword(password);
			sessionFactory.getCurrentSession().saveOrUpdate(source);
		}
	}

	@Override
	public void deleteUser(String userId) {
		if(StringUtils.isNotBlank(userId)){
			User source = (User) sessionFactory.getCurrentSession().get(User.class, userId);
			source.setDeleState(0);
			sessionFactory.getCurrentSession().saveOrUpdate(source);
		}
	}
	
	@Override
	public List<RoleConfigShowDTO> getRoleConfigShow(String orgId , String roleId) {
		List<User> user = getUsersByOrgId(orgId);
		List<User> selectedUser =  getUserByRole(roleId);
		Map<String, User> onRoleMap = new HashMap<String, User>();
		for(User su : selectedUser) {
			onRoleMap.put(su.getId(), su);
		}
		
		// 已经标记为角色的用户
		List<RoleConfigShowDTO> dto = new ArrayList<RoleConfigShowDTO>();
		RoleConfigShowDTO roleConfigShowDTO = null;
		for(User u : user) {
			roleConfigShowDTO = new RoleConfigShowDTO();
			roleConfigShowDTO.setUserId(u.getId());
			roleConfigShowDTO.setUserName(u.getName());
			roleConfigShowDTO.setUserPhone(u.getTelephoneNumber());
			if(onRoleMap.get(u.getId()) == null) {
				roleConfigShowDTO.setHasOnRole(false);
			} else {
				roleConfigShowDTO.setHasOnRole(true);
			}
			dto.add(roleConfigShowDTO);
		}
		return dto;
	}
	
	private List<User> getUserByRole(String roleId) {
		
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
	public Organization getOrganizationById(String id){
		return (Organization) sessionFactory.getCurrentSession().
				createCriteria(Organization.class)
				.add(Restrictions.eq("id", id))
				.uniqueResult();
	}

	/**
	 * 
	 * getUsersByNameOrOrgType 科室车间工区查询
	 * @param name 用户名
	 * @param orgType 组织机构类型(3-科室,4-车间,5-工区)
	 * @return List<User>
	 */
	private List<User> getUsersByNameOrOrgType(String name, String orgType){
		List<User> result = new ArrayList<User>();
		Organization orgPrent = new Organization();
		orgPrent.setId(GUANGZOU_TXD_ID);
		Session session = sessionFactory.getCurrentSession();
		//查询部门账号
		String hql = "FROM User u "
				+ " LEFT JOIN FETCH u.organization o"
				+ " WHERE u.name like :name "
				+ " AND o.type=:type "
				+ " AND u.deleState=:userdel "
				+ " AND o.deleteState=:orgdel "
				+ " AND u.name=o.name "
				+ " AND o.parent=:guangzouTxdId "//数据是昆明通信段以下部门的数据
				+ " ORDER BY o.orgIndex ";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%"); // 用户名
		query.setParameter("type", Integer.valueOf(orgType));// 组织机构类型
		query.setParameter("userdel", 1);// 用户未删除
		query.setParameter("orgdel", 1);// 组织机构未删除
		query.setParameter("guangzouTxdId", orgPrent);
		
		List<User> users = query.list();
		result.addAll(users);
		
		//查询部门账号以外的账号
		String hql2 = "FROM User u "
				+ " LEFT JOIN FETCH u.organization o"
				+ " WHERE u.name like :name "
				+ " AND o.type=:type "
				+ " AND u.deleState=:userdel "
				+ " AND o.deleteState=:orgdel "
				+ " AND u.name!=o.name "
				+ " AND o.parent=:guangzouTxdId"//数据是昆明通信段以下部门的数据
				+ " ORDER BY o.orgIndex ";
		Query query2 = session.createQuery(hql2);
		query2.setParameter("name", "%" + name + "%"); // 用户名
		query2.setParameter("type", Integer.valueOf(orgType));// 组织机构类型
		query2.setParameter("userdel", 1);// 用户未删除
		query2.setParameter("orgdel", 1);// 组织机构未删除
		query2.setParameter("guangzouTxdId", orgPrent);
		
		List<User> users2 = query2.list();
		result.addAll(users2);
		return result;
	}
	/**
	 * 
	 * getUsersByNameOrOrgType 科室车间工区查询
	 * @param name 用户名
	 * @param orgType 组织机构类型(3-科室,4-车间,5-工区)
	 * @return List<User>
	 */
	private List<User> getUsersByNameOrByOrgTypeNew(String name, String orgType){
		List<User> result = new ArrayList<User>();
		Organization orgPrent = new Organization();
		orgPrent.setId(GUANGZOU_TXD_ID);
		Session session = sessionFactory.getCurrentSession();
		//查询部门账号
		String hql = "FROM User u "
				+ " LEFT JOIN FETCH u.organization o"
				+ " WHERE u.name like :name "
				+ " AND u.deleState=:userdel "
				+ " AND o.deleteState=:orgdel "
				+ " AND u.name=o.name "
				+ " AND o.parent=:guangzouTxdId ";//数据是昆明通信段以下部门的数据
		if(!"".equals(orgType)) {
			hql += " AND o.type=:type ";
		}		
		hql +=  " ORDER BY o.orgIndex ";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%"); // 用户名
		if(!"".equals(orgType)) {
			query.setParameter("type", Integer.valueOf(orgType));// 组织机构类型
		}		
		query.setParameter("userdel", 1);// 用户未删除
		query.setParameter("orgdel", 1);// 组织机构未删除
		query.setParameter("guangzouTxdId", orgPrent);		
		List<User> users = query.list();
		result.addAll(users);
		
		//查询部门账号以外的账号
		String hql2 = "FROM User u "
				+ " LEFT JOIN FETCH u.organization o"
				+ " WHERE u.name like :name "
				+ " AND u.deleState=:userdel "
				+ " AND o.deleteState=:orgdel "
				+ " AND u.name!=o.name "
				+ " AND o.parent=:guangzouTxdId";//数据是昆明通信段以下部门的数据
		if(!"".equals(orgType)) {
			hql2 += " AND o.type=:type ";
		}		
		hql2 += " ORDER BY o.orgIndex ";
		Query query2 = session.createQuery(hql2);
		query2.setParameter("name", "%" + name + "%"); // 用户名
		if (!"".equals(orgType)) {
			query2.setParameter("type", Integer.valueOf(orgType));// 组织机构类型
		}
		query2.setParameter("userdel", 1);// 用户未删除
		query2.setParameter("orgdel", 1);// 组织机构未删除
		query2.setParameter("guangzouTxdId", orgPrent);
		
		List<User> users2 = query2.list();
		result.addAll(users2);
		return result;
	}
	
	@Override
	public List<User> getUsersByNameOrByOrgType(String name, String orgType) {
		List<User> users = new ArrayList<User>();
			
		// orgType:6,表示选择了好友组
		if (!(""+OrganizationService.ORG_TYPE_FIRENDS).equals(orgType)) {
			users = getUsersByNameOrByOrgTypeNew(name.replace(" ", ""), orgType);
			return users;
		} else {
			String fgIds = getUserByNameOrFriend();
			String[] fgIdsArray = fgIds.split(",");
			// 根据好友组ID,查询所有的好友(其中包含了重复的好友数据)
			List<User> userList = getUserByFriendGroupIds(name.replace(" ", ""), fgIdsArray);			
			Map<String, User> map = new LinkedHashMap<String, User>();
			// 去出重复的好友数据
			for (User u : userList) {
				map.put(u.getName(), u);
			}
			// 加载无重复的好友数据
			for (User u : map.values()) {
				users.add(u);
			}
			return users;
		}
	}
	@Override
	public List<User> getUsersByNameOrOrgType(String name, String orgType, User user) {
		List<User> users = new ArrayList<User>();
		//如果登录用户为车间用户 qyy加
		if(user.getOrganization().getType()==OrganizationService.ORG_TYPE_CJ){
			String orgId = user.getOrganization().getId();
			users = getUsersByParentOrgId(orgId);
			return users;
		}
		
		// orgType:6,表示选择了好友组
		if (!(""+OrganizationService.ORG_TYPE_FIRENDS).equals(orgType)) {
			users = getUsersByNameOrOrgType(name.replace(" ", ""), orgType);
			return users;
		} else {
			String fgIds = getUserByNameOrFriend(user);
			String[] fgIdsArray = fgIds.split(",");
			// 根据好友组ID,查询所有的好友(其中包含了重复的好友数据)
			List<User> userList = getUserByFriendGroupIds(name.replace(" ", ""), fgIdsArray);
			
			Map<String, User> map = new LinkedHashMap<String, User>();
			// 去出重复的好友数据
			for (User u : userList) {
				map.put(u.getName(), u);
			}
			// 加载无重复的好友数据
			for (User u : map.values()) {
				users.add(u);
			}
		}
		return users;
	}
	/**
	 * 
	 * getUsersByParentOrgId 根据父组织结构id 查询子机构的所有用户
	 * @param orgId
	 * @return 用户集合数据
	 * @author quyy
	 */
	public List<User> getUsersByParentOrgId(String orgId) {
		List<User> result = new ArrayList<User>();
		String hql = "FROM User u "
			+ " LEFT JOIN FETCH u.organization o"
			+ " WHERE o.parent=:orgParent "
			+ " AND u.deleState=:userdel "
			+ " AND o.deleteState=:orgdel "
			+ " ORDER BY o.orgIndex ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		Organization orgParent = new Organization();
		orgParent.setId(orgId);
		query.setParameter("orgParent",orgParent );
		query.setParameter("userdel", 1);// 用户未删除
		query.setParameter("orgdel", 1);// 组织机构未删除
		result = query.list();
		return result;
	}

	/**
	 * 
	 * getUserByFriend 好友组查询,获取好友组ID
	 * @param user 登录用户
	 * @return FriendGroupIds
	 */
	private String getUserByNameOrFriend(User user){
		FriendGroupDTO friendGroupDTO = new FriendGroupDTO();
		friendGroupDTO.setUser(user);
		// 获取登录用户的好友组
		List<FriendGroup> fgList = friendGroupService.selectFriendGroup(friendGroupDTO);
		String fgIds = "";
		// 取出好友组的ID，以","号进行拼接
		for (FriendGroup friendGroup : fgList) {
			fgIds = fgIds + "," + friendGroup.getId();
		}
		return fgIds;
	}
	/**
	 * 
	 * getUserByFriend 好友组查询,获取好友组ID
	 * @return FriendGroupIds
	 */
	private String getUserByNameOrFriend(){
		FriendGroupDTO friendGroupDTO = new FriendGroupDTO();
//		friendGroupDTO.setUser();
		// 获取登录用户的好友组
		List<FriendGroup> fgList = friendGroupService.selectFriendGroup(friendGroupDTO);
		String fgIds = "";
		// 取出好友组的ID，以","号进行拼接
		for (FriendGroup friendGroup : fgList) {
			fgIds = fgIds + "," + friendGroup.getId();
		}
		return fgIds;
	}
	
	/**
	 * 
	 * getUserByFriendGroupIds 根据用户名或者好友组ID查询用户
	 * @param name 用户名
	 * @param friendGroupIds 好友组ID
	 * @return
	 */
	private List<User> getUserByFriendGroupIds(String name, String[] friendGroupIds) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " SELECT u FROM User u, Friend f "
						+ " LEFT JOIN FETCH u.organization o "
						+ " WHERE u.id = f.user.id "
						+ " AND u.name like :name "
						+ " AND u.deleState =:userdel "
						+ " AND f.friendGroup.id in (:friendGroupIds) "
						+ " ORDER BY o.type,o.name ";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%");
		query.setParameter("userdel", 1);
		query.setParameterList("friendGroupIds", friendGroupIds);
		List<User> users = query.list();
		return users;
	}
	
	/**
	 * 用于转派时下拉选中的人员
	 */

	@Override
	public List<User> getAllUsers(String orgId){
		Session session = sessionFactory.getCurrentSession();
		String hql = " From User u " 
						+ " LEFT JOIN FETCH u.organization " 
						+ " where u.organization.id = :orgId and u.deleState = :exist";
		Query query = session.createQuery(hql);
		query.setParameter("orgId", orgId);
		query.setParameter("exist", 1);
		 return query.list();
	}

	@Override
	public List<User> getTurnToUsers(String receiveUserId) {
		
		String[] receiveIds = receiveUserId.split(",");
		List<User> turnToUsers = new ArrayList<User>();
		for(int i=0;i<receiveIds.length;i++){
			turnToUsers.add(getUserById(receiveIds[i]));//转派后的数据所属人（可以为多人）
		}
		
		return turnToUsers;
		
	}

	@Override
	public User getUserByIdJdbc(String id) {
		String sql = "SELECT "+
				"	    U.USER_ID_, "+
				"	    U.USER_NAME_, "+
				"	    U.ORGANIZATION_ID_, "+
				"	    O.ORG_NAME_, "+
				"	    O.TYPE_, "+
				"	    O.PARENT_ID_, "+
				"	    O.ORGINDEX_, "+
				"	    PO.ORG_NAME_ AS P_ORG_NAME_, "+
				"	    PO.TYPE_ AS P_TYPE_, "+
				"	    PO.ORGINDEX_ AS P_ORGINDEX_ "+
				"	FROM "+
				"	    CFG_SAFE_USER U, "+
				"	    CFG_BASE_ORGANIZATION O, "+
				"	    CFG_BASE_ORGANIZATION PO "+
				"	WHERE "+
				"	    U.USER_ID_ = :userId "+
				"	    AND   U.ORGANIZATION_ID_ = O.ORG_ID_ "+
				"	    AND   O.PARENT_ID_ = PO.ORG_ID_ "+
				"	    AND   U.EXIST_ = 1 ";
		Map<String,Object> map = new HashMap<>();
		map.put("userId", id);
		User user = namedParameterJdbcTemplate.queryForObject(sql, map, new RowMapper<User>(){
			@Override
			public User mapRow(ResultSet rs, int arg1) throws SQLException {
				User u = new User();
				u.setId(rs.getString("USER_ID_"));
				u.setName(rs.getString("USER_NAME_"));
				Organization o = new Organization();
				o.setId(rs.getString("ORGANIZATION_ID_"));
				o.setName(rs.getString("ORG_NAME_"));
				o.setType(rs.getInt("TYPE_"));
				o.setOrgIndex(rs.getInt("ORGINDEX_"));
				Organization po = new Organization();
				po.setId(rs.getString("PARENT_ID_"));
				po.setName(rs.getString("P_ORG_NAME_"));
				po.setType(rs.getInt("P_TYPE_"));
				po.setOrgIndex(rs.getInt("P_ORGINDEX_"));
				o.setParent(po);
				u.setOrganization(o);
				return u;
			}
			
		});
		return user;
	}
	
}
