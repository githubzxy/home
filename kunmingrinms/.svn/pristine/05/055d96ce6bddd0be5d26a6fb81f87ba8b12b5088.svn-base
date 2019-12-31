
/**   
 * 文件名：LoginLogAction.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-5-16 下午2:37:10   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.system.web;

import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.system.dto.LoginDTO;
import com.enovell.yunwei.system.service.LoginService;
import com.enovell.yunwei.util.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**      
 * 项目名称：kunmingrinms
 * 类名称：LoginLogAction   
 * 类描述:  登录日志Action
 * 创建人：lidt 
 * 创建时间：2017-5-16 下午2:37:10
 * 修改人：lidt 
 * 修改时间：2017-5-16 下午2:37:10   
 *    
 */
@Controller
@RequestMapping("/loginLogAction")
public class LoginLogAction {
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	/**
	 * 
	 * getLoginList 登录日志列表展示
	 * @param org 组织机构ID
	 * @param userName 操作人
	 * @param startTime 操作时间-开始时间
	 * @param endTime 操作时间-结束时间
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value = "/loginList", method = RequestMethod.POST)
	@ResponseBody
	public String getLoginList(
			@RequestParam("org") String org,
			@RequestParam("userName") String userName,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		LoginDTO dto = new LoginDTO();
		// 条件查询
		if (StringUtils.isNotEmpty(org)) {
			dto.setOrgId(org);
		}
		if (StringUtils.isNotEmpty(userName)) {
			dto.setUserName(userName.replace(" ", ""));
		}
		if (StringUtils.isNotEmpty(startTime)) {
			dto.setStartTime(startTime);
		}
		if (StringUtils.isNotEmpty(endTime)) {
			dto.setEndTime(endTime);
		}
		GridDto<LoginDTO> gridDto = loginService.getGridDtoList(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * 
	 * getLoginCountOfOrg 根据组织机构类型和登录时间段来查询组织机构登录系统次数
	 */
	@RequestMapping(value = "/getLoginCountOfOrg", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getLoginCountOfOrg(
			@RequestParam("orgType") String orgType,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime) {
		List<Map<String, Object>> rows  = loginService.getLoginCountOfOrg(orgType, startTime, endTime);
		return rows;
	}
	

}
