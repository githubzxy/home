
/**   
 * 文件名：FileSystemService.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-4-22 上午10:59:45   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.fileSystem.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.fileSystem.domain.FileSystem;
import com.enovell.yunwei.fileSystem.dto.FileSystemDTO;
import com.enovell.yunwei.fileSystem.dto.FileSystemExportDTO;



/**      
 * 项目名称：kunmingrinms
 * 类名称：FileSystemService   
 * 类描述:  文件系统接口
 * 创建人：zhangsihong
 * 创建时间：2013-4-22 上午10:59:45
 * 修改人：zhangsihong 
 * 修改时间：2013-4-22 上午10:59:45   
 *    
 */
public interface FileSystemService {

	/**
	 * 
	 * addFileSystem 添加文件
	 * @param FileSystemDTO
	 * @return
	 */
	public FileSystem addFileSystem(FileSystemDTO fileSystem, User user);
	
	/**
	 * 
	 * updateFileSystem 修改文件
	 * @param FileSystemDTO
	 * @return
	 */
	public FileSystem updateFileSystem(FileSystemDTO fileSystem, User user);
	
	/**
	 * 
	 * getFileSystemById 根据id获取文件
	 * @param id
	 * @return
	 */
	public FileSystem getFileSystemById(String id);
	
	/**
	 * 
	 * getAllFileSystems 根据条件查询文件数据
	 * @param dto
	 * @param first
	 * @param max
	 * @return
	 */
	public List<FileSystemDTO> getAllFileSystems(FileSystemDTO dto, int first, int max);
	
	/**
	 * 
	 * getAllFileSystemCount 根据条件查询文件数据记录数
	 * @param dto
	 * @return
	 */
	public Long getAllFileSystemCount(FileSystemDTO dto);
	
	/**
	 * 
	 * deleteFileSystemsByIds 根据ids集合删除文件
	 * @param ids
	 */
	public void deleteFileSystemsByIds(List<String> ids);

	/**    
	 * getAllFile 根据条件查询所有文件，用于导出excel
	 * @param FileSystemDTO 条件
	 * @return
	 */
	public List<FileSystemExportDTO> getAllFile(FileSystemDTO fileSystemDTO);
	
	/**
	 * 获取专业类别的集合
	 */
	public List<String> getProType();
	
}
