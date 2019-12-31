package com.enovell.yunwei.technical.service;

import java.util.List;

import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.technical.domain.TechnicalDocumentInfo;
import com.enovell.yunwei.technical.dto.TechnicalDto;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;

/**
 * 
 * 项目名称：kunmingrinms 类名称：TechnicalDocumentInfoService 类描述: 技术资料接口 创建人：yangsy
 * 创建时间：2016-11-24 
 * 
 */
public interface TechnicalDocumentInfoService {

	/**
	 * 
	 * addTechnicalInfo 新增技术资料
	 * 
	 * @param technicalInfo
	 * @return
	 */
	public TechnicalDocumentInfo addTechnicalInfo(TechnicalDocumentInfo technicalInfo,UploadFileDto[] dtos);

	/**
	 * 
	 * updateTechnicalInfo 修改技术资料
	 * @param technicalInfo
	 * @return
	 */
	public TechnicalDocumentInfo updateTechnicalInfo(TechnicalDocumentInfo technicalInfo,UploadFileDto[] dtos);

	/**
	 * 
	 * getTechnicalInfoById 根据id获取技术资料
	 * @param id
	 * @return
	 */
	public TechnicalDocumentInfo getTechnicalInfoById(String id);

	/**
	 * 批量删除技术资料
	 */
	public void deleteTechnicalInfos(String ids);


	/**
	 * 
	 * 查询技术资料
	 * 
	 * @param technicalInfoDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<TechnicalDto> getAllTechnicalInfoInfos(
			TechnicalInfoDTO completionInfoDTO, int first, int max);

	/**
	 * 获取技术资料记录数
	 * 
	 * @param technicalInfoDTO
	 * @return
	 */
	public int getTechnicalInfoInfoCount(TechnicalInfoDTO technicalInfoDTO);

}
