package com.enovell.yunwei.deviceConfig.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.deviceConfig.dto.DeviceConfigDTO;
import com.enovell.yunwei.deviceConfig.service.DeviceConfigService;
import com.enovell.yunwei.emergency.domain.DeviceName;
import com.enovell.yunwei.util.JsonUtil;

@Controller
@RequestMapping(value = "/deviceConfigAction")
public class DeviceConfigAction {

	@Resource(name = "deviceConfigService")
	private DeviceConfigService deviceConfigService;

	@RequestMapping(value = "/getDeviceConfig", method = RequestMethod.POST)
	@ResponseBody
	public String getDeviceConfig(@RequestParam(value = "name", required = false) String deviceName,
			@RequestParam(value = "type", required = false) Integer deviceType, @RequestParam("start") int start,
			@RequestParam("limit") int limit) {

		DeviceConfigDTO dto = new DeviceConfigDTO();

		if (StringUtils.isNotEmpty(deviceName)) {
			dto.setName(deviceName.replace(" ", ""));
		}
		if (deviceType != null) {
			dto.setDeviceCategory(deviceType);
		}

		List<DeviceName> dtolist = deviceConfigService.getDeviceCfByDTO(dto, start, limit);

		Long count = deviceConfigService.getDeviceConfigCount(dto);

		GridDto<DeviceName> gridDto = new GridDto<DeviceName>();
		gridDto.setRows(dtolist);
		gridDto.setResults(count);
		String jResult = JsonUtil.javaToJsonAsString(gridDto);
		return jResult;

	}

	@RequestMapping(value = "/addDeviceConfig", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addInfor(@RequestParam(value = "name", required = false) String deviceName,
			@RequestParam(value = "type", required = false) Integer deviceType,
			@RequestParam(value = "unit", required = false) Integer unit) {
		DeviceName dc = new DeviceName();
		dc.setName(deviceName);
		dc.setDeviceCategory(deviceType);
		dc.setUnit(unit);
		Date createDate = new Date();
		dc.setCreateTime(createDate);
		return deviceConfigService.addDeviceConfig(dc);
	}

	/**
	 * getDeviceConfigById 通过id获取一条数据信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getDeviceConfigById", method = RequestMethod.POST)
	@ResponseBody
	public String getDeviceConfigById(@RequestParam(value = "id", required = false) String id) {
		DeviceName dc = deviceConfigService.getDeviceConfigById(id);
		return JsonUtil.javaToJsonAsString(dc);
	}

	@RequestMapping(value = "/updateDeviceConfig", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateDeviceConfig(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String deviceName,
			@RequestParam(value = "type", required = false) Integer deviceType,
			@RequestParam(value = "unit", required = false) Integer unit) {
		DeviceName dc = deviceConfigService.getDeviceConfigById(id);
		dc.setName(deviceName);
		dc.setDeviceCategory(deviceType);
		dc.setUnit(unit);
		return deviceConfigService.updateDeviceConfig(dc);
	}

	@RequestMapping(value = "/deleteDeviceConfigs", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg delRecord(@RequestParam("jsonIds") List<String> jsonIds) {
		String result = null;
		try {
			result = deviceConfigService.deleteDeviceConfigs(jsonIds);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("删除失败,该设备已入库", null);
		}
		return ResultMsg.getSuccess("删除成功", null);
	}

	/**
	 * getDeviceConfigById 通过id获取一条数据信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/checkName", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkName(@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "type", required = false) Integer type) {
		return deviceConfigService.checkName(name.trim(), type);
	}
}
