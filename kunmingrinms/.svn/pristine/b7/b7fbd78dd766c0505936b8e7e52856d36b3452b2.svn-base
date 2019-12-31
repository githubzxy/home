package com.enovell.yunwei.deviceConfig.service;

import java.util.List;
import java.util.Map;

import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.deviceConfig.dto.DeviceConfigDTO;
import com.enovell.yunwei.emergency.domain.DeviceName;

/**
 * 项目名称：kunmingrinms
 * 类名称：DeviceConfigService 
 * 类描述: 应急日常设备配置接口 
 * 创建人：yangsy
 * 创建时间：2016-12-23
 */
public interface DeviceConfigService {
	/**
	 * 设备单位从数据库查中文给前端展示，且用jdbctemplate
	 * @Title: getDeviceCfByDTO 
	 * @param dto
	 * @param first
	 * @param max
	 * @return
	 * List<DeviceName>
	 * @author luoyan
	 */
	public List<DeviceName> getDeviceCfByDTO(DeviceConfigDTO dto, int first, int max);
	
	/**
	 * getDeviceConfigByDTO 根据查询条件获得带分页信息的DeviceConfig对象的List集合
	 * @param dnDTO 查询条件
	 * @param first
	 * @param max
	 * @return DeviceConfig对象的List集合
	 */
	public List<DeviceName> getDeviceConfigByDTO(DeviceConfigDTO dto, int first, int max);
	/**
	 * 获取记录数
	 * @param dto
	 * @return
	 */
	public long getDeviceConfigCount(DeviceConfigDTO dto);
	/**
	 * 新增
	 * @param deviceName
	 * @return
	 */
	public ResultMsg addDeviceConfig(DeviceName dc);
	/**
	 * 通过id获取
	 * @param id
	 * @return
	 */
	public DeviceName getDeviceConfigById(String id);
	/**
	 * 修改
	 * @param deviceName
	 * @return
	 */
	public ResultMsg updateDeviceConfig(DeviceName deviceConfig);
	/**
	 * 批量删除
	 * @param ids
	 * @throws Exception 
	 */
	public String deleteDeviceConfigs(List<String> ids) throws Exception;
	/**
	 * 验证设备是否已有
	 */
	public boolean checkName(String name , Integer type);
	
//	/**
//	 * 通过名字获取
//	 * @param name
//	 * @return
//	 */
//	public DeviceName getDeviceNameByName(String name);
//	
//	/**
//	 * 获取所有
//	 * @return
//	 */
//	public List<DeviceName> getAllDeviceNames();
//	
//	/**
//	 * 通过设备类别获取
//	 * @param deviceCategory
//	 * @return
//	 */
//	public List<DeviceName> getDeviceNamesByDeviceCategory(DeviceCategory deviceCategory);
//	
//	
//	/**
//	 * 通过id删除
//	 * @param id
//	 */
//	public void deleteDeviceName(String id);
//	
//	/**
//	 * 删除
//	 * @param deviceName
//	 */
//	public void deleteDeviceName(DeviceName deviceName);
//	
//	/**
//	 * 批量删除
//	 * @param deviceNameList
//	 */
//	public void deleteDeviceNames(List<DeviceName> deviceNameList);
//	
//	/**
//	 * deleteDeviceNameByIds 通过id集合批量删除
//	 * @param ids 要删除实体的id集合
//	 * @return 删除的数量
//	 */
//	public int deleteDeviceNameByIds(List<String> ids);
}
