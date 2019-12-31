package com.enovell.yunwei.personaltodoprompt.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.yunwei.util.JsonUtil;

/**
 * 
 * 项目名称：RINMS2MAIN
 * 类名称：PersonalPromptAction   
 * 类描述:  信息提示与待办关系服务Action
 * 创建人：lidt 
 * 创建时间：2017-6-21 下午3:32:38
 * 修改人：lidt 
 * 修改时间：2017-6-21 下午3:32:38   
 *
 */
@Controller
@RequestMapping(value = "/personalPromptAction")
public class PersonalPromptAction {
	
	
	@RequestMapping(value = "/getShowPromptDTOs", method = RequestMethod.POST)
	@ResponseBody
	public String getShowPromptDTOs(HttpServletRequest request) {
		return JsonUtil.javaToJsonAsString(new ArrayList<>());
	}

}
