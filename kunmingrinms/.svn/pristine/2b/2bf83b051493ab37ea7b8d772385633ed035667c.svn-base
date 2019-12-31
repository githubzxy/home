package com.enovell.yunwei.system.web;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.system.domain.RoleConfigShowDTO;
import com.enovell.yunwei.system.dto.UserToRoleDTO;
import com.enovell.yunwei.system.service.UserService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.MD5Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 
 * 项目名称：kunmingrinmsFINAL
 * 类名称：UserAction   
 * 类描述:  用户控制类
 * 创建人：张思红 
 * 创建时间：2015-9-7 下午3:35:51
 * 修改人：张思红 
 * 修改时间：2015-9-7 下午3:35:51   
 *
 */
@Controller
@RequestMapping(value = "/userAction")
public class UserAction {

	@Resource(name = "userService")
	private UserService userService;
	
	/**
	 * getOrgChildrenById 通过Pid（父id）查询其children
	 */
	@RequestMapping(value = "/getUsersByIds", method = RequestMethod.POST)
	@ResponseBody
	public String getUsersByIds (
			@RequestParam("ids") String ids
			) {
		if(StringUtils.isNotBlank(ids)) {
			List<User> users = userService.getUsersByIds(ids.split(","));
			return JsonUtil.javaToJsonAsString(users);
		}
		return "";
	}
	
	/**
	 * getOrgChildrenById 通过Pid（父id）查询其children
	 */
	@RequestMapping(value = "/getGridUsersByIds", method = RequestMethod.POST)
	@ResponseBody
	public String getGridUsersByIds (
			@RequestParam("ids") String ids
			) {
		GridDto<User> result = new GridDto<User>();
		if(StringUtils.isNotBlank(ids)) {
			List<User> users = userService.getUsersByIds(ids.split(","));
			result.setRows(users);
			return JsonUtil.javaToJsonAsString(result);
		}
		result.setHasError(true);
		result.setError("没有数据");
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**
	 * getUsersByOrgId 根据组织机构orgId获取用户
	 */
	@RequestMapping(value = "/getUsersByOrgId", method = RequestMethod.POST)
	@ResponseBody
	public String getUsersByOrgId (
			@RequestParam("orgId") String orgId
			) {
		if(StringUtils.isNotBlank(orgId)) {
			List<User> users = userService.getUsersByOrgId(orgId);
			return JsonUtil.javaToJsonAsString(users);
		}
		return "";
	}
	
	/**
	 * 
	 * getUserByOrgIds 根据组织机构ids查询用户（包括好友组用户）
	 * @param orgIds
	 * @return
	 */
	@RequestMapping(value = "/getUserByOrgIds", method = RequestMethod.POST)
	@ResponseBody
	public String getUserByOrgIds (
			@RequestParam("orgIds") String orgIds
			) {
		if(StringUtils.isNotBlank(orgIds)) {
			String[] orgArray = orgIds.split(",");
			
			Set<User> userResult = new HashSet<User>();
			userResult.addAll(userService.getUserByOrgIds(orgArray));
			userResult.addAll(userService.getUserByFriendGroupIds(orgArray));
			return JsonUtil.javaToJsonAsString(userResult);
		}
		return "";
	}
	
	/**查询所有用户
	 * @return
	 */
	@RequestMapping(value = "/getAllUser", method = RequestMethod.POST)
	@ResponseBody
	public String getAllUser(@RequestParam("start") String start,
			@RequestParam("limit") String limit,
			@RequestParam(value="userName",required=false) String userName,
			@RequestParam(value="userOrg",required=false) String userOrg,
			HttpServletRequest request
			){
		List<UserToRoleDTO> users = userService.getAllUser(start,limit,userName,userOrg);
		long count = userService.getAllUserCounts(userName,userOrg);
		GridDto<UserToRoleDTO> result = new GridDto<UserToRoleDTO>();
		result.setResults(count);
		result.setRows(users);
		return JsonUtil.javaToJsonAsString(result);
	}
	
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	@ResponseBody
	public void saveUser(
			@RequestParam(value="saveId",required=false) String userId,
			@RequestParam("savaName") String userName,
			@RequestParam("saveOrgVal") String organization,
			@RequestParam("saveTelephoneNumber") String telephoneNumber,
			@RequestParam("savePhone") String phone,
			@RequestParam("saveComment") String remark,
			HttpServletRequest request
			){
		userService.saveOrUpdateUser(userId,userName,organization,telephoneNumber,phone,remark);
	}
	@RequestMapping(value = "/resetUser", method = RequestMethod.POST)
	@ResponseBody
	public void resetUser(@RequestParam("password") String password,@RequestParam("userId") String userId){
		userService.resetUser(userId,MD5Util.toMD5(password));
	}
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public void deleteUser(@RequestParam("userId") String userId){
		userService.deleteUser(userId);
	}
	
	/**根据角色获取对应的用户列表
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value = "/getUserByRole", method = RequestMethod.POST)
	@ResponseBody
	public String getUserByRole(@RequestParam(value="roleName") String roleName){
		List<User> result = userService.getUsersByRoleName(roleName);
		return JsonUtil.javaToJsonAsString(result);
	}
	
	//获取角色配置中列表显示的数据
	@RequestMapping(value = "/getRoleConfigShow", method = RequestMethod.POST)
	@ResponseBody
	public String getRoleConfigShow(@RequestParam(value="orgId") String orgId,
			@RequestParam(value="roleId") String roleId) {
		
		List<RoleConfigShowDTO> dto = userService.getRoleConfigShow(orgId , roleId);
		return JsonUtil.javaToJsonAsString(dto);
		
	}
	
	/**
	 * 
	 * getUserById 通过用户id,获取用户信息
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getUserById", method = RequestMethod.POST)
	@ResponseBody
	public String getUserById(@RequestParam("id") String id) {

		User user = userService.getUserById(id);
		return JsonUtil.javaToJsonAsString(user);
	}
	
	/**
	 * 
	 * getOrganizationById 通过id,获取组织机构信息
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getOrganizationById", method = RequestMethod.POST)
	@ResponseBody
	public String getOrganizationById(@RequestParam("id") String id) {

		Organization organization = userService.getOrganizationById(id);
		return JsonUtil.javaToJsonAsString(organization);
	}
	
	/**
	 * 
	 * getUsersByNameOrOrgType 根据用户名或者组织机构ID查询用户信息(用于人员选择公共组件)
	 * @param name 用户名
	 * @param orgType 组织机构ID
	 * @return
	 */
	@RequestMapping(value = "/getUsersByNameOrOrgType", method = RequestMethod.POST)
	@ResponseBody
	public String getUsersByNameOrOrgType(HttpServletRequest request,
			@RequestParam(value = "name",required = false) String name,
			@RequestParam(value = "orgType",required = false) String orgType,
			@RequestParam(value = "orgId",required = false)String orgId
			) {
		// 获取当前登录用户便于获取好友组
		User user = (User) request.getSession().getAttribute("user");
		if(orgId!=null&&orgType.equals("")){
			String[] orgArray = new String[1];
			orgArray[0] = orgId;
			Set<User> userResult = new HashSet<User>();
			userResult.addAll(userService.getUserByOrgIds(orgArray));
			userResult.addAll(userService.getUserByFriendGroupIds(orgArray));
			return JsonUtil.javaToJsonAsString(userResult);
		}
		List<User> users = userService.getUsersByNameOrOrgType(name, orgType, user);
		return JsonUtil.javaToJsonAsString(users);
	}
	/**
	 * 
	 * getUsersByNameOrOrgType 根据用户名或者组织机构ID查询用户信息(用于人员选择公共组件-专家组管理和应急机构)
	 * @param name 用户名
	 * @param orgType 组织机构ID
	 * @return
	 */
	@RequestMapping(value = "/getUsersByNameOrByOrgType", method = RequestMethod.POST)
	@ResponseBody
	public String getUsersByNameOrByOrgType(HttpServletRequest request,
			@RequestParam(value = "name",required = false) String name,
			@RequestParam(value = "orgType",required = false) String orgType,
			@RequestParam(value = "orgId",required = false)String orgId
			) {
		// 获取当前登录用户便于获取好友组
		if(orgId!=null&&orgType.equals("null")){
			String[] orgArray = new String[1];
			orgArray[0] = orgId;
			Set<User> userResult = new HashSet<User>();
			userResult.addAll(userService.getUserByOrgIds(orgArray));
			userResult.addAll(userService.getUserByFriendGroupIds(orgArray));
			return JsonUtil.javaToJsonAsString(userResult);
		}
		List<User> users = userService.getUsersByNameOrByOrgType(name, orgType);
		return JsonUtil.javaToJsonAsString(users);
	}
	
	
}
