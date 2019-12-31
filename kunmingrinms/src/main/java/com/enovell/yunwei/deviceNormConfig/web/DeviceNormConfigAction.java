package com.enovell.yunwei.deviceNormConfig.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.deviceNormConfig.dto.DeviceNormConfigDTO;
import com.enovell.yunwei.deviceNormConfig.service.DeviceNormConfigService;
import com.enovell.yunwei.emergency.domain.DeviceName;
import com.enovell.yunwei.emergency.domain.SpareNorm;
import com.enovell.yunwei.util.JsonUtil;

@Controller
@RequestMapping(value = "/deviceNormConfigAction")
public class DeviceNormConfigAction {
	
	@Resource(name = "deviceNormConfigService")
	private DeviceNormConfigService deviceNormConfigService;
	
	@RequestMapping(value = "/getDeviceNormConfig" ,method = RequestMethod.POST)
	@ResponseBody
	public String getDeviceConfig(
			@RequestParam(value = "name",required=false) String deviceName,
			@RequestParam(value = "type",required=false) Integer deviceType,
			@RequestParam("start") int start,
			@RequestParam("limit") int limit){
		
		DeviceNormConfigDTO dto = new DeviceNormConfigDTO();
		
		SpareNorm dc = new SpareNorm();
		
		if(StringUtils.isNotEmpty(deviceName)){
			dc.setId(deviceName);
			dto.setDeviceConfig(dc);
		}
		if(deviceType!=null){
			dto.setDeviceType(deviceType);
		}
		
		List<SpareNorm> dtolist = deviceNormConfigService.getSpareNorms(dto, start, limit);
		long count = deviceNormConfigService.getSpareNormCount(dto);
		
		GridDto<SpareNorm> gridDto = new GridDto<SpareNorm>();
		gridDto.setRows(dtolist);
		gridDto.setResults(count);
		String jResult = JsonUtil.javaToJsonAsString(gridDto);
		return jResult;
		
	}
	@RequestMapping(value = "/getDeivceConfigByTypeId" ,method = RequestMethod.POST)
	@ResponseBody
	public String getDeivceConfigByTypeId(@RequestParam(value = "typeId",required=false) String id){
		List<SpareNorm> dc = deviceNormConfigService.getDeivceConfigByTypeId(id);
		return JsonUtil.javaToJsonAsString(dc);
	}
	@RequestMapping(value = "/addDeviceNormConfig" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addInfor(
			@RequestParam(value = "name",required=false) String name,
			@RequestParam(value = "type",required=false) String type,
			@RequestParam(value = "normValue",required=false) Double normValue,
			@RequestParam(value = "remark",required=false) String remark){
		SpareNorm dnc = new SpareNorm();
		DeviceName dc = new DeviceName();
		dnc.setNormValue(normValue);
		dnc.setRemark(remark);
		dc.setDeviceCategory(Integer.valueOf(type));
		dc.setId(name);
		dnc.setDeviceName(dc);
		try {
			SpareNorm sn= deviceNormConfigService.addSpareNorm(dnc);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增失败", null);
		}
		return ResultMsg.getSuccess("新增成功", null);
	}
	/**
	 * getDeviceNormConfigById 通过id获取一条数据信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getDeviceNormConfigById" ,method = RequestMethod.POST)
	@ResponseBody
	public String getDeviceNormConfigById(@RequestParam(value = "id",required=false) String id){
		SpareNorm dnc = deviceNormConfigService.getSpareNormById(id);
		return JsonUtil.javaToJsonAsString(dnc);
	}
	@RequestMapping(value = "/updateDeviceNormConfig" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateDeviceNormConfig(
			@RequestParam(value = "id",required=false) String id,
			@RequestParam(value = "normValue",required=false) Double normValue,
			@RequestParam(value = "remark",required=false) String remark){
		SpareNorm dnc = deviceNormConfigService.getSpareNormById(id);
		dnc.setNormValue(normValue);
		dnc.setRemark(remark);
		SpareNorm sn =  deviceNormConfigService.updateSpareNorm(dnc);
		if(sn != null) {
			return ResultMsg.getSuccess("修改成功", null);
		}
		return ResultMsg.getFailure("修改失败", null);
	}
	@RequestMapping(value = "/deleteDeviceNormConfigs" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteDeviceNormConfigs(@RequestParam("jsonIds") List<String> jsonIds){
		try {
			deviceNormConfigService.deleteDeviceNormConfigs(jsonIds);
			return ResultMsg.getSuccess("删除成功", null);
		} catch (Exception e) {
			return ResultMsg.getFailure("删除失败", null);
		} 
	}
	
	@RequestMapping(value = "/checkNorm" ,method = RequestMethod.POST)
	@ResponseBody
	public String checkNorm(@RequestParam(value = "name",required=false) String name){
		
		boolean result = deviceNormConfigService.checkNorm(name);
		if(result){
			return JsonUtil.javaToJsonAsString("该设备已配置");
		}else{
			return JsonUtil.javaToJsonAsString("");
		}
	}
	
}
