package com.enovell.yunwei.attach.service;

import com.enovell.yunwei.attach.tozip.ZipFileDTO;

import java.util.List;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：ZipFileService   
 * 类描述:  压缩文件接口
 * 创建人：yangsy
 * 创建时间：2016-12-27
 *
 */
public interface ZipFileService {
	
	public String filesToZip(List<ZipFileDTO> zfDTOs);

}
