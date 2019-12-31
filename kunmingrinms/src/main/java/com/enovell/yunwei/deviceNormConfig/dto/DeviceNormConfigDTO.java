package com.enovell.yunwei.deviceNormConfig.dto;

import java.io.Serializable;

import com.enovell.yunwei.emergency.domain.SpareNorm;


/**      
 * 项目名称：kunmingrinms
 * 类名称：DeviceNormConfigDTO   
 * 类描述:  应急备品指标查询类
 * 创建人：yangsy
 * 创建时间：2016-12-23
 */

public class DeviceNormConfigDTO implements Serializable {
	
	
	private static final long serialVersionUID = -525088464978380249L;

	/**
	 * 设备类别
	 */
	private Integer deviceType;
	
	/**
	 * 设备名称
	 */
	private SpareNorm deviceConfig;
	
	
	public Integer getDeviceType() {
		return deviceType;
	}
	
	public void setDeviceType(Integer deviceType) {
		this.deviceType = deviceType;
	}

	public SpareNorm getDeviceConfig() {
		return deviceConfig;
	}

	public void setDeviceConfig(SpareNorm deviceConfig) {
		this.deviceConfig = deviceConfig;
	}
	
}
