package com.enovell.yunwei.system.web;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.service.MessageRemindService;
import com.enovell.yunwei.util.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 消息提醒
 * 
 * 项目名称：guangtieYearMonth 类名称：MessageRemindAction.java 类描述: 创建人：潘忠瑞
 * 创建时间：2014-11-25 修改人：潘忠瑞 修改时间：2014-11-25
 * 
 */
@Controller
@RequestMapping(value = "/messageRemind")
public class MessageRemindAction {
	@Resource(name = "messageRemindService")
	private MessageRemindService messageRemindService;

	@RequestMapping(value = "/getMsgByUser", method = RequestMethod.POST)
	@ResponseBody
	public String upload(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		List<Object[]> list = messageRemindService.getMessageDtoByUser(user);
		return JsonUtil.javaToJsonAsString(list);
	}

	@RequestMapping(value = "/delMsg", method = RequestMethod.POST)
	@ResponseBody
	public void delMsg(HttpServletRequest request
			) {
		User user = (User) request.getSession().getAttribute("user");
		messageRemindService.delMsgByUser(user);
	}

}
