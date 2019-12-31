package com.enovell.yunwei.deviceUnitConfig.service;

import com.enovell.yunwei.deviceUnitConfig.domain.DeviceUnitConfig;

import java.math.BigDecimal;
import java.util.List;

/**
 * 项目名称：kunmingrinms
 * 类名称：DeviceUnitConfigService 
 * 类描述: 应急设备单位配置接口 
 * 创建人：yangsy
 * 创建时间：2016-12-23
 */
public interface DeviceUnitConfigService {
	
	/**
	 * getUnitData 条件查询
	 * @param duc
	 * @param first
	 * @param max
	 * @return
	 */
	public List<DeviceUnitConfig> getUnitData(DeviceUnitConfig duc, int first, int max);
	/**
	 * getCount 根据条件获取应急备品单位记录数
	 * @param duc
	 * @return
	 */
	public long getCount(DeviceUnitConfig duc);
	
	/**
	 * getUnitById 根据id获取应急备品单位
	 * @param id
	 * @return
	 */
	public DeviceUnitConfig getUnitById(String id);
	/**
	 * getUnits 获取应急备品单位
	 * @return
	 */
	public List<DeviceUnitConfig> getUnits();
	/**
	 * getExistUnits 获取应急备品单位（未被删除）
	 * @return
	 */
	public List<DeviceUnitConfig> getExistUnits();
	/**
	 * addUnit 添加应急备品单位
	 * @param duc
	 * @return
	 */
	public DeviceUnitConfig addUnit(DeviceUnitConfig duc);
	/**
	 * deleteDeviceUnitConfigs 根据id数组删除应急备品单位
	 * @param ids
	 */
	public void deleteDeviceUnitConfigs(String ids);
	/**
	 * 获取最大的id数
	 */
	public BigDecimal getMaxIdNum();
	
}
