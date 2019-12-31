package com.enovell.yunwei.deviceNormConfig.service;

import java.util.List;

import com.enovell.yunwei.deviceNormConfig.dto.DeviceNormConfigDTO;
import com.enovell.yunwei.emergency.domain.SpareNorm;

/**
 * 项目名称：kunmingrinms
 * 类名称：DeviceConfigService 
 * 类描述: 应急设备标准配置接口 
 * 创建人：yangsy
 * 创建时间：2016-12-23
 */
public interface DeviceNormConfigService {
	
	/**
	 * getSpareNorms 根据条件获取应急备品指标
	 * @param dto
	 * @param first
	 * @param max
	 * @return
	 */
	public List<SpareNorm> getSpareNorms(DeviceNormConfigDTO dto, int first, int max);
	/**
	 * getSpareNormCount 根据条件获取应急备品指标记录数
	 * @param dto
	 * @return
	 */
	public long getSpareNormCount(DeviceNormConfigDTO dto);
	/**
	 * 根据设备类别获取设备名称
	 */
	public List<SpareNorm> getDeivceConfigByTypeId(String id);
	/**
	 * addSpareNorm 添加应急备品指标
	 * @param dnc
	 * @return
	 */
	public SpareNorm addSpareNorm(SpareNorm dnc);
	/**
	 * 
	 * getSpareNormById 根据id获取应急备品指标
	 * @param id
	 * @return
	 */
	public SpareNorm getSpareNormById(String id);
	/**
	 * updateSpareNorm 修改应急备品指标
	 * @param dnc
	 * @return
	 */
	public SpareNorm updateSpareNorm(SpareNorm dnc);
	/**
	 * deleteSpareNormByIds 根据id数组删除应急备品指标
	 * @param ids
	 */
	public void deleteDeviceNormConfigs(List<String> ids);
	/**
	 * 验证设备是否已配置标准
	 * @param name
	 * @return
	 */
	public boolean checkNorm(String name);
	
}
