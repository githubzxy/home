package com.enovell.yunwei.railLine.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.yunwei.railLine.service.RailLineService;
import com.enovell.yunwei.util.JsonUtil;
/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：RailLineAction   
 * 类描述:  线路 action
 * 创建人：ltf 
 * 创建时间：2016-11-24 下午4:45:43
 * 修改人：ltf
 * 修改时间：2016-11-24 下午4:45:43   
 *
 */
@Controller
@RequestMapping(value = "/railLineAction")
public class RailLineAction {
	@Resource(name="railLineService")
	RailLineService railLineService;
	
	@RequestMapping(value = "/getRailLineNames", method = RequestMethod.POST)
	@ResponseBody
	public String getRailLineNames(){
		return JsonUtil.javaToJsonAsString(railLineService.getRailLineNames());
	}
	
	/**
	 * 
	 * isExistsRailLineName 判断线路名是否存在
	 * @param railLineName
	 * @return
	 */
	@RequestMapping(value = "/isExistsRailLineName", method = RequestMethod.POST)
	@ResponseBody
	public boolean isExistsRailLineName(@RequestParam("railLineName") String railLineName){
		return railLineService.isExistsRailLineName(railLineName);
	}
	
}



