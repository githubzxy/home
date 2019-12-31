
/**   
 * 文件名：TechnicalRegulationService.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-9-26 上午11:12:13   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.technical.service;

import java.util.List;

import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.technical.domain.TechnicalRegulation;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;


/**      
 * 项目名称：kunmingrinms
 * 类名称：TechnicalRegulationService   
 * 类描述:  技术规章接口
 * 创建人：zhangsihong 
 * 创建时间：2013-9-26 上午11:12:13
 * 修改人：zhangsihong 
 * 修改时间：2013-9-26 上午11:12:13   
 *    
 */
public interface TechnicalRegulationService {

	/**
	 * 新增
	 * @param TechnicalRegulation
	 * @return
	 */
	public TechnicalRegulation addTechnicalRegulation(TechnicalRegulation technicalRegulation,UploadFileDto[] dtos);
	
	/**
	 * 修改
	 * @param TechnicalRegulation
	 * @return
	 */
	public TechnicalRegulation updateTechnicalRegulation(TechnicalRegulation technicalRegulation,UploadFileDto[] dtos);
	
	/**
	 * 
	 * getTechnicalRegulationById 根据id获取技术规章
	 * @param id
	 * @return
	 */
	public TechnicalRegulation getTechnicalRegulationById(String id);
	
	/**
	 * 
	 * deleteTechnicalRegulations 批量删除技术规章
	 * @param ids
	 */
	public void deleteTechnicalRegulations(String ids);
	
	/**
	 * 
	 * getTechnicalRegulations 获取技术规章
	 * @param technicalInfoDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<TechnicalRegulation> getTechnicalRegulations(TechnicalInfoDTO technicalInfoDTO,int first,int max);
	
	/**
	 * 获取技术规章记录数
	 * @param technicalInfoDTO
	 * @return
	 */
	public int getTechnicalRegulationCount(TechnicalInfoDTO technicalInfoDTO);
}
