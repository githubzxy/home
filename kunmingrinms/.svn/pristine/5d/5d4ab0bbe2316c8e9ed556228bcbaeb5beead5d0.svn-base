
/**   
 * 文件名：SafeSystemService.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-4-22 上午10:59:45   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.safeSystem.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.safeSystem.domain.SafeSystem;
import com.enovell.yunwei.safeSystem.dto.SafeSystemDTO;
import com.enovell.yunwei.safeSystem.dto.SafeSystemExportDTO;



/**      
 * 项目名称：kunmingrinms
 * 类名称：SafeSystemService   
 * 类描述:  安全规章接口
 * 创建人：zhangsihong
 * 创建时间：2013-4-22 上午10:59:45
 * 修改人：zhangsihong 
 * 修改时间：2013-4-22 上午10:59:45   
 *    
 */
public interface SafeSystemService {

	/**
	 * 
	 * addSafeSystem 添加文件
	 * @param SafeSystemDTO
	 * @return
	 */
	public SafeSystem addSafeSystem(SafeSystemDTO SafeSystem, User user);
	
	/**
	 * 
	 * updateSafeSystem 修改文件
	 * @param SafeSystemDTO
	 * @return
	 */
	public SafeSystem updateSafeSystem(SafeSystemDTO SafeSystem, User user);
	
	/**
	 * 
	 * getSafeSystemById 根据id获取文件
	 * @param id
	 * @return
	 */
	public SafeSystem getSafeSystemById(String id);
	
	/**
	 * 
	 * getAllSafeSystems 根据条件查询文件数据
	 * @param dto
	 * @param first
	 * @param max
	 * @return
	 */
	public List<SafeSystemDTO> getAllSafeSystems(SafeSystemDTO dto, int first, int max);
	
	/**
	 * 
	 * getAllSafeSystemCount 根据条件查询文件数据记录数
	 * @param dto
	 * @return
	 */
	public Long getAllSafeSystemCount(SafeSystemDTO dto);
	
	/**
	 * 
	 * deleteSafeSystemsByIds 根据ids集合删除文件
	 * @param ids
	 */
	public void deleteSafeSystemsByIds(List<String> ids);

	/**    
	 * getAllFile 根据条件查询所有文件，用于导出excel
	 * @param SafeSystemDTO 条件
	 * @return
	 */
	public List<SafeSystemExportDTO> getAllFile(SafeSystemDTO SafeSystemDTO);
	
}
