package com.enovell.yunwei.technical.service;

import java.util.List;

import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.technical.domain.TechnicalInfo;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;

/**
 * 
 * 项目名称：kunmingrinms 类名称：TechnicalInfoService 类描述: 技术图纸和竣工资料接口 创建人：lidt
 * 创建时间：2016-11-15 下午3:40:52 修改人：lidt 修改时间：2016-11-15 下午3:40:52
 * 
 */
public interface TechnicalInfoService {

	/**
	 * 
	 * addTechnicalInfo 新增技术图纸
	 * @param technicalInfo
	 * @param dtos
	 * @return
	 */
	public TechnicalInfo addTechnicalInfo(TechnicalInfo technicalInfo,UploadFileDto[] dtos);

	/**
	 * 
	 * updateTechnicalInfo 修改技术图纸
	 * @param technicalInfo
	 * @param dtos
	 * @return
	 */
	public TechnicalInfo updateTechnicalInfo(TechnicalInfo technicalInfo,UploadFileDto[] dtos);

	/**
	 * 
	 * getTechnicalInfoById 根据id获取技术图纸
	 * @param id
	 * @return
	 */
	public TechnicalInfo getTechnicalInfoById(String id);

	/**
	 * 删除
	 */
	public void deleteTechnicalInfo(TechnicalInfo completionInfo);

	/**
	 * 批量删除技术图纸
	 */
	public void deleteTechnicalInfos(String ids);

	/**
	 * 删除
	 */
	public void deleteTechnicalInfos(List<TechnicalInfo> completionInfos);

	/**
	 * 查询竣工资料
	 * 
	 * @param technicalInfoDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<TechnicalInfo> getAllCompletionInfos(
			TechnicalInfoDTO completionInfoDTO, int first, int max);

	/**
	 * 获取竣工资料记录数
	 * 
	 * @param technicalInfoDTO
	 * @return
	 */
	public int getCompletionInfoCount(TechnicalInfoDTO technicalInfoDTO);

	/**
	 * 
	 * 查询技术资料
	 * 
	 * @param technicalInfoDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<TechnicalInfo> getAllTechnicalInfoInfos(
			TechnicalInfoDTO completionInfoDTO, int first, int max);

	/**
	 * 获取技术资料记录数
	 * 
	 * @param technicalInfoDTO
	 * @return
	 */
	public int getTechnicalInfoInfoCount(TechnicalInfoDTO technicalInfoDTO);

}
