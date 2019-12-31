package com.enovell.yunwei.system.web;

import com.enovell.system.common.domain.Role;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.system.service.RoleService;
import com.enovell.yunwei.util.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 角色管理ACTION
 * @author Roy
 * 2017年2月7日--上午9:42:11
 */
@Controller
@RequestMapping(value = "/roleAction")
public class RoleAction {

	@Resource(name="roleService")
	private RoleService roleService;
	
	/**查询角色分页列表
	 * @param start
	 * @param limit
	 * @param roleName 角色名模糊查询
	 * @return
	 */
	@RequestMapping(value = "/getAllRole", method = RequestMethod.POST)
	@ResponseBody
	public String getAllRole(@RequestParam("start") String start,
			@RequestParam("limit") String limit,
			@RequestParam(value="roleName",required=false) String roleName){
		List<Role> roles = roleService.getAllRole(start,limit,roleName);
		Long counts = roleService.getAllRoleCount(roleName);
		GridDto<Role> result = new GridDto<Role>();
		result.setRows(roles);
		result.setResults(counts);
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**保存角色（包含新增和修改）
	 * @param roleName
	 * @param roleId 为空时为新增；有值时为修改
	 * @param desc
	 * @param perIds 权限ID集合，以英文逗号分割
	 * @param request
	 */
	@RequestMapping(value = "/saveRole", method = RequestMethod.POST)
	@ResponseBody
	public void saveRole(
			@RequestParam("roleName") String roleName,
			@RequestParam(value="roleId",required=false) String roleId,
			@RequestParam(value="desc",required=false) String desc,
			@RequestParam("perIds") String perIds,
			HttpServletRequest request){
		User currentUser = (User) request.getSession().getAttribute("user");
		roleService.saveOrUpdateRole(currentUser,roleId,roleName,desc,perIds);
	}
	
	@RequestMapping(value = "/getRoleById", method = RequestMethod.POST)
	@ResponseBody
	public String getRoleById(
			@RequestParam(value="roleId",required=false) String roleId,HttpServletRequest request){
//		User currentUser = (User) request.getSession().getAttribute("user");
		Role role = roleService.getRoleById(roleId);
		return JsonUtil.javaToJsonAsString(role);
	}
	
	/**删除角色
	 * @param roleId
	 */
	@RequestMapping(value = "/deleteRole", method = RequestMethod.POST)
	@ResponseBody
	public void deleteRole(@RequestParam(value="roleId") String roleId){
		roleService.deleteRole(roleId);
	}
	
	/**将角色指派给多个用户
	 * @param roleId
	 * @param userIds 用户ID集合，以英文逗号分割
	 */
	@RequestMapping(value = "/assignToUser", method = RequestMethod.POST)
	@ResponseBody
	public void assignToUser(@RequestParam(value="orgId") String orgId,
			@RequestParam(value="roleId") String roleId,
			@RequestParam("userIds") String userIds){
		roleService.assignToUser(orgId,roleId,userIds);
	}
	/**根据角色ID获取用户集合
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value = "/getUserByRole", method = RequestMethod.POST)
	@ResponseBody
	public String getUserByRole(@RequestParam(value="roleId") String roleId){
		List<User> result = roleService.getUserByRole(roleId);
		return JsonUtil.javaToJsonAsString(result);
	}
}
