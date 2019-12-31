package com.enovell.yunwei.system.service;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.domain.RoleConfigShowDTO;
import com.enovell.yunwei.system.dto.UserToRoleDTO;

import java.util.List;


/**用户业务逻辑接口
 * @author roy
 * 2014年8月29日-下午3:08:00
 */
public interface UserService {

	/**根据用户名和密码获取对应用户
	 * @param userName
	 * @return
	 */
	public User getUserByName(String userName);
	
	
	/**根据ID获取用户
	 * @param id
	 * @return
	 */
	public User getUserById(String id);
	
	/**
	 * 
	 * getUsersByIds 根据ids查询用户
	 * @param ids
	 * @return
	 */
	public List<User> getUsersByIds(String[] ids);
	
	/**
	 * 
	 * getUsersByOrgId 根据组织机构id查询用户
	 * @param orgId 组织机构id
	 * @return
	 */
	public List<User> getUsersByOrgId(String orgId);
	
	/**
	 * 
	 * getUserByOrgIds 根据组织机构ids查询用户
	 * @param orgIds
	 * @return
	 */
	public List<User> getUserByOrgIds(String[] orgIds);
	
	/**
	 * 
	 * getUserByFriendGroupIds 根据好友组查询用户
	 * @param friendGroupIds
	 * @return
	 */
	public List<User> getUserByFriendGroupIds(String[] friendGroupIds);
	
	/**
	 * 
	 * getUsersByRoleName 根据角色名称获取用户
	 * @return
	 */
	public List<User> getUsersByRoleName(String roleName);


	/**分页条件查询所有用户
	 * @param start
	 * @param limit
	 * @param userName 用户名，模糊查询
	 * @param userOrg 用户所属组织机构ID
	 * @return
	 */
	public List<UserToRoleDTO> getAllUser(String start, String limit, String userName, String userOrg);


	/**条件查询所有用户数量
	 * @param userName 用户名，模糊查询
	 * @param userOrg 用户所属组织机构ID
	 * @return
	 */
	public long getAllUserCounts(String userName, String userOrg);


	/**重置对应用户的密码
	 * @param userId
	 * @param password
	 */
	public void resetUser(String userId, String password);


	/**逻辑删除对应用户
	 * @param userId
	 */
	public void deleteUser(String userId);


	/**保存用户
	 * @param userId
	 * @param userName
	 * @param organization
	 * @param telephoneNumber
	 * @param phone
	 * @param remark
	 */
	public void saveOrUpdateUser(String userId, String userName, String organization, String telephoneNumber, String phone, String remark);
	
	/**
	 * getRoleConfigShow 获得角色配置的显示数据
	 * @return RoleConfigShowDTO
	 */
	public List<RoleConfigShowDTO> getRoleConfigShow(String orgId, String roleId);
	
	/**
	 * 
	 * getOrganizationById 根据id,获取组织机构信息
	 * @param id
	 * @return
	 */
	public Organization getOrganizationById(String id);
	
	/**
	 * 
	 * getUsersByNameOrOrgType 根据用户名或者组织机构ID查询用户信息(用于人员选择公共组件)
	 * @param name 用户名
	 * @param orgType 组织机构类型(3-科室,4-车间,5-工区,6-好友组)
	 * @param user 登录用户
	 * @return
	 */
	public List<User> getUsersByNameOrOrgType(String name, String orgType, User user);
	
	/**
	 * 根据组织机构id查询所有用户
	 * getAllUsers 这里添加描述信息
	 * @param orgId
	 * @return
	 */
	public List<User> getAllUsers(String orgId);
	/**
	 * 
	 * getTurnToUsers 获取转派人员
	 * @param receiveUserId 转派人员的id
	 * @return List<User>
	 * @author ysy
	 */
	public List<User> getTurnToUsers(String receiveUserId);
	
	/**
	 * 
	 * getUsersByParentOrgId 根据父组织机构的id查询其所有的子机构
	 * @author quyy
	 * @param orgIdParent
	 * @return
	 */
	public List<User>  getUsersByParentOrgId(String orgIdParent);


	
	/**    
	 * getUsersByNameOrByOrgType 这里添加描述信息
	 * @param name
	 * @param orgType
	 * @return
	 */
	
	public List<User> getUsersByNameOrByOrgType(String name, String orgType);
	
	/**
	 * 用jdbctemplate查询
	 * @Title: getUserByIdJdbc 
	 * @param id
	 * @return
	 * User
	 * @author luoyan
	 */
	public User getUserByIdJdbc(String id);
 
	
}
