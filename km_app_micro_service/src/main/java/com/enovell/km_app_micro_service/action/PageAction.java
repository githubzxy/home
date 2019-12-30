package com.enovell.km_app_micro_service.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 移动应用web端入口Action
 * @author yangsy
 */
@Controller
@RequestMapping("/kmmsApp")
public class PageAction {
	
	@RequestMapping("/page/login")
	public String login(HttpServletRequest request){
		String threePerId = request.getParameter("threePerId");
		request.setAttribute("perId", threePerId);
		return "login";
	}
	//打卡地点基础信息录入
	@RequestMapping("/page/basicInformation")
	public String basicInformation(HttpServletRequest request){
		String threePerId = request.getParameter("threePerId");
		request.setAttribute("perId", threePerId);
		return "basicInformation";
	}
	//移动APP上传资料管理
	@RequestMapping("/page/uploadFileManage")
	public String uploadFileManage(HttpServletRequest request){
		String threePerId = request.getParameter("threePerId");
		request.setAttribute("perId", threePerId);
		return "uploadFileManagePage";
	}
	//移动APP上传资料统计管理
	@RequestMapping("/page/dataStatisticsManage")
	public String dataStatisticsManage(HttpServletRequest request){
		String threePerId = request.getParameter("threePerId");
		request.setAttribute("perId", threePerId);
		return "dataStatisticsManagePage";
	}
}