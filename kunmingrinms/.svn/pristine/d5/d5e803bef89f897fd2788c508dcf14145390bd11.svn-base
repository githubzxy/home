
/**   
 * 文件名：DeviceNameAction.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 下午2:37:53   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.web;


import com.enovell.yunwei.dailySpare.service.DailyDeviceNameService;
import com.enovell.yunwei.util.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**      
 * 项目名称：kunmingrinms
 * 类名称：DeviceNameAction   
 * 类描述:  设备配置 action
 * 创建人：ltf 
 * 创建时间：2016-11-30 下午2:37:53
 * 修改人：ltf
 * 修改时间：2016-11-30 下午2:37:53   
 *    
 */
@Controller
@RequestMapping("/dailySpare/deviceNameAction")
public class DailyDeviceNameAction {
	
	@Resource(name="dailyDeviceNameService")
	DailyDeviceNameService dailyDeviceNameService;
	
	@RequestMapping(value="/getDeviceNamesByDeviceCategory",method=RequestMethod.POST)
	@ResponseBody
	public String getDeviceNamesByDeviceCategory(@RequestParam("deviceCategory") Integer deviceCategory){
		return JsonUtil.javaToJsonAsString(
				dailyDeviceNameService.getDeviceNamesByDeviceCategory(deviceCategory));
	}
	
	@RequestMapping(value="/getDeviceNameById",method=RequestMethod.POST)
	@ResponseBody
	public String getDeviceNameById(@RequestParam("id") String id){
		return JsonUtil.javaToJsonAsString(
				dailyDeviceNameService.getDeviceNameById(id));
	}
	
}
