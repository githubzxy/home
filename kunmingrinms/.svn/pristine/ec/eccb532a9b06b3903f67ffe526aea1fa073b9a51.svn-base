package com.enovell.yunwei.deviceUnitConfig.web;

import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.deviceUnitConfig.domain.DeviceUnitConfig;
import com.enovell.yunwei.deviceUnitConfig.service.DeviceUnitConfigService;
import com.enovell.yunwei.util.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/deviceUnitConfigAction")
public class DeviceUnitConfigAction {

	@Resource(name = "deviceUnitConfigService")
	private DeviceUnitConfigService deviceUnitConfigService;

	@RequestMapping(value = "/getDeviceUnitConfig", method = RequestMethod.POST)
	@ResponseBody
	public String getDeviceUnitConfig(@RequestParam(value = "unit", required = false) String unitName,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {

		DeviceUnitConfig duc = new DeviceUnitConfig();

		if (StringUtils.isNotEmpty(unitName)) {
			duc.setUnit(unitName);
		}

		List<DeviceUnitConfig> resultList = deviceUnitConfigService.getUnitData(duc, start, limit);
		long count = deviceUnitConfigService.getCount(duc);

		GridDto<DeviceUnitConfig> gridDto = new GridDto<DeviceUnitConfig>();
		gridDto.setRows(resultList);
		gridDto.setResults(count);
		String jResult = JsonUtil.javaToJsonAsString(gridDto);
		return jResult;

	}

	@RequestMapping(value = "/getUnitById", method = RequestMethod.POST)
	@ResponseBody
	public String getUnitById(@RequestParam("id") String id) {
		DeviceUnitConfig deviceUnitConfig = deviceUnitConfigService.getUnitById(id);
		return JsonUtil.javaToJsonAsString(deviceUnitConfig);
	}

	/**
	 * 
	 * getUnits 获取全部单位数据（包括已删除的）
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getUnits", method = RequestMethod.POST)
	@ResponseBody
	public String getUnits() {
		List<DeviceUnitConfig> deviceUnitConfig = deviceUnitConfigService.getUnits();
		return JsonUtil.javaToJsonAsString(deviceUnitConfig);
	}

	/**
	 * 
	 * getExistUnits 获取未被删除的单位数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getExistUnits", method = RequestMethod.POST)
	@ResponseBody
	public String getExistUnits() {
		List<DeviceUnitConfig> deviceUnitConfig = deviceUnitConfigService.getExistUnits();
		return JsonUtil.javaToJsonAsString(deviceUnitConfig);
	}

	@RequestMapping(value = "/addDeviceUnitConfig", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addDeviceUnitConfig(
			// @RequestParam(value = "unit",required=false) String unitName){
			DeviceUnitConfig duc) {// 修改时间：2017-10-27 14:45:37 by:lism 内容：使用对象接收
		BigDecimal max = deviceUnitConfigService.getMaxIdNum();
		Integer num = max.intValue();
		// DeviceUnitConfig duc = new DeviceUnitConfig();
		duc.setId(num + 1);
		// duc.setUnit(unitName);
		duc.setCreateDate(new Date());
		try {
			DeviceUnitConfig ducNew = deviceUnitConfigService.addUnit(duc);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增失败", null);
		}
		return ResultMsg.getSuccess("新增成功", null);
	}

	@RequestMapping(value = "/deleteDeviceUnitConfigs", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteDeviceUnitConfigs(@RequestParam("jsonIds") String jsonIds) {
		try {
			deviceUnitConfigService.deleteDeviceUnitConfigs(jsonIds);
			return ResultMsg.getSuccess("删除成功", null);
		} catch (Exception e) {
			return ResultMsg.getFailure("删除失败", null);
		}
	}

}
