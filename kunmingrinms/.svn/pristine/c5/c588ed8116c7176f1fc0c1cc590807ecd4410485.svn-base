package com.enovell.yunwei.system.service;

import com.enovell.system.common.domain.Permission;
import com.enovell.system.common.domain.Role;
import com.enovell.system.common.domain.User;

import java.util.List;
import java.util.Set;

/**
 * 
 * 项目名称：kunmingrinmsFINAL
 * 类名称：PermissionService   
 * 类描述:  权限接口
 * 创建人：张思红 
 * 创建时间：2014-12-11 上午9:38:42
 * 修改人：张思红 
 * 修改时间：2014-12-11 上午9:38:42   
 *
 */
public interface PermissionService {

	/**
	 * 
	 * getPerById 根据id获取权限
	 * @param id
	 * @return
	 */
	public Permission getPerById(String id);
	
	/**
	 * 
	 * getNextPers 获取下一级权限
	 * @param user 所属用户
	 * @param parent 父级权限
	 * @return
	 */
	public  Set<Permission> getNextPers(User user, Permission parent);

	/**获取所有权限,以树型结构JSON封装
	 * @return
	 */
	public String getAllPers();

	/**根据角色获取对应的权限列表
	 * @param role
	 * @return
	 */
	public List<Permission> getPersByRole(Role role);

	/**根据三级权限ID和当前用户获取按钮权限列表
	 * @param perId
	 * @param user
	 * @return
	 */
	public List<Permission> getBtnPers(String perId, User user);
}
