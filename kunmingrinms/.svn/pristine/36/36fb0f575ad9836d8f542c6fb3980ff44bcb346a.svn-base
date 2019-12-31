package com.enovell.yunwei.userInfoManager.web;

import com.enovell.yunwei.userInfoManager.domain.UserInfo;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.system.dto.UserToRoleDTO;
import com.enovell.yunwei.userInfoManager.service.UserInfoService;
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
import java.util.List;

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
@RequestMapping(value = "/userInfoAction")
public class UserInfoAction {

	@Resource(name = "userInfoService")
	private UserInfoService userService;
	
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
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public void deleteUser(@RequestParam("userId") String userId){
		userService.deleteUser(userId);
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

		UserInfo user = userService.getUserById(id);
		return JsonUtil.javaToJsonAsString(user);
	}
}
