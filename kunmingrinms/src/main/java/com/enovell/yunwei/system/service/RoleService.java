package com.enovell.yunwei.system.service;

import com.enovell.system.common.domain.Role;
import com.enovell.system.common.domain.User;

import java.util.List;

/**
 * 角色管理业务逻辑接口
 * @author Roy
 * 2017年2月7日--上午10:42:45
 */
public interface RoleService {

	/**分页查询角色列表
	 * @param start
	 * @param limit
	 * @param roleName
	 * @return
	 */
	List<Role> getAllRole(String start, String limit, String roleName);

	Role getRoleById(String roleId);
	
	/**查询角色总数
	 * @param roleName
	 * @return
	 */
	Long getAllRoleCount(String roleName);

	/**保存角色
	 * @param currentUser
	 * @param roleId
	 * @param roleName
	 * @param desc
	 * @param perIds
	 */
	void saveOrUpdateRole(User currentUser, String roleId, String roleName, String desc, String perIds);

	/**删除角色
	 * @param roleId
	 */
	void deleteRole(String roleId);

	/**将一个角色指派给多个用户
	 * @param roleId
	 * @param userIds
	 */
	void assignToUser(String orgId, String roleId, String userIds);

	
	/**根据角色ID获取对应的用户集合
	 * @param roleId
	 * @return
	 */
	List<User> getUserByRole(String roleId);
	
	/**
	 * 
	 * getRoleNameByUserId 通过用户Id,查询用户的角色,并进行拼接
	 * @param userId
	 * @return 逗号拼接好的角色
	 */
	public String getRoleNameByUserId(String userId);
}
