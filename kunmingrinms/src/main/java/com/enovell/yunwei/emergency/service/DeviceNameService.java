
/**   
 * 文件名：DeviceNameService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-29 下午10:51:26   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.service;

import com.enovell.yunwei.emergency.domain.DeviceName;

import java.util.List;

/**      
 * 项目名称：kunmingrinms
 * 类名称：DeviceNameService   
 * 类描述: 	设备配置-接口
 * 创建人：ltf 
 * 创建时间：2016-11-29 下午10:51:26
 * 修改人：ltf
 * 修改时间：2016-11-29 下午10:51:26   
 *    
 */

public interface DeviceNameService {
	
	
	/**    
	 * getDeviceNamesByDeviceCategory 通过设备类别获取设备名称
	 * @param deviceCategory 设备类别
	 * @return
	 */
	public List<DeviceName> getDeviceNamesByDeviceCategory(Integer deviceCategory);
	
	
	/**    
	 * getDeviceNameById 根据id查询设备名称
	 * @param id
	 * @return
	 */
	public DeviceName getDeviceNameById(String id);
	
}









