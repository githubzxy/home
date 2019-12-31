package com.enovell.yunwei.system.web;

import com.enovell.system.common.domain.Permission;
import com.enovell.system.common.domain.Role;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.service.PermissionService;
import com.enovell.yunwei.util.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping(value = "/permission")
public class PermissionAction {

	@Resource(name = "permissionService")
	private PermissionService permissionService;
	
	/**
	 * 
	 * getPerById 根据id获取权限
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getPerById", method = RequestMethod.POST)
	@ResponseBody
	public String getPerById(
			@RequestParam("id") String id
			) {
		Permission permission = permissionService.getPerById(id);
		return JsonUtil.javaToJsonAsString(permission);
	}
	
	/**
	 * 
	 * getNextPers 获取下一级权限
	 * @return
	 */
	@RequestMapping(value = "/getNextPers", method = RequestMethod.POST)
	@ResponseBody
	public  String getNextPers(
			HttpServletRequest request
			) {
		
		String curPerId = request.getParameter("curPerId");
		User user = (User) request.getSession().getAttribute("user");
		Permission permission = null;
		if(StringUtils.isNotBlank(curPerId)) {
			permission = new Permission();
			permission.setId(curPerId);
		}
		Set<Permission> permissions = permissionService.getNextPers(user, permission);
		return JsonUtil.javaToJsonAsString(permissions);
	}
	
	@RequestMapping(value = "/getPersByRole", method = RequestMethod.POST)
	@ResponseBody
	public String getPersByRole(@RequestParam(value="roleId") String roleId){
		Role role = new Role();
		role.setId(roleId);
		List<Permission> result = permissionService.getPersByRole(role);
		return JsonUtil.javaToJsonAsString(result);
	}
	@RequestMapping(value = "/getAllPers", method = RequestMethod.POST)
	@ResponseBody
	public String getAllPers(){
		String result = permissionService.getAllPers();
		return result;
	}
	/**根据三级权限ID和当前用户获取按钮权限列表
	 * @param perId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getBtnPers", method = RequestMethod.POST)
	public void getBtnPers(@RequestParam String perId,HttpServletRequest request,HttpServletResponse response) throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		List<Permission> perList = permissionService.getBtnPers(perId,user);
		String result = JsonUtil.javaToJsonAsString(perList);
		request.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");  
        PrintWriter out = response.getWriter();  //输出中文，这一句一定要放到response.setContentType("text/html;charset=utf-8"),  response.setHeader("Cache-Control", "no-cache")后面，否则中文返回到页面是乱码  
		out.print(result);
		out.flush();
		out.close();
	}
}
