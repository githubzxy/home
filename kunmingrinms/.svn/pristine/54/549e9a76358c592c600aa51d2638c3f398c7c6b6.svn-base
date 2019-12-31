package com.enovell.yunwei.technical.service;

import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.technical.domain.CompletionInfo;
import com.enovell.yunwei.technical.dto.CompletionInfoDTO;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：CompletionInfoService   
 * 类描述:  竣工资料接口
 * 创建人：lidt 
 * 创建时间：2016-11-25 上午9:55:10
 * 修改人：lidt 
 * 修改时间：2016-11-25 上午9:55:10   
 *
 */
public interface CompletionInfoService {
	
	/**
	 * 
	 * addCompletionInfo 新增竣工资料
	 * @param completionInfo
	 * @param dtos
	 * @return
	 */
	public CompletionInfo addCompletionInfo(CompletionInfo completionInfo,UploadFileDto[] dtos);

	/**
	 * 
	 * updateCompletionInfo 修改竣工资料
	 * @param completionInfo
	 * @param dtos
	 * @return
	 */
	public CompletionInfo updateCompletionInfo(CompletionInfo completionInfo,UploadFileDto[] dtos);

	/**
	 * 
	 * getCompletionInfoById 根据id获取竣工资料
	 * 
	 * @param id
	 * @return
	 */
	public CompletionInfo getCompletionInfoById(String id);

	/**
	 * 批量删除竣工资料
	 */
	public void deleteCompletionInfos(String ids);

	/**
	 * 查询竣工资料
	 * 
	 * @param technicalInfoDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public GridDto<CompletionInfo> getGridDtos(CompletionInfoDTO completionInfoDTO, int first,
			int max);

}
