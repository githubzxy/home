
/**   
 * 文件名：ProductInstructionService.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-9-26 上午11:12:13   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.technical.service;

import java.util.List;

import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.technical.domain.ProductInstruction;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;


/**      
 * 项目名称：kunmingrinms
 * 类名称：ProductInstructionService   
 * 类描述:  产品说明书接口
 * 创建人：zhangsihong 
 * 创建时间：2013-9-26 上午11:12:13
 * 修改人：zhangsihong 
 * 修改时间：2013-9-26 上午11:12:13   
 *    
 */
public interface ProductInstructionService {

	/**
	 * 
	 * addProductInstruction 新增产品说明书
	 * @param productInstruction
	 * @param dtos
	 * @return
	 */
	public ProductInstruction addProductInstruction(ProductInstruction productInstruction,UploadFileDto[] dtos);
	
	/**
	 * 
	 * updateProductInstruction 修改产品说明书
	 * @param productInstruction
	 * @param dtos
	 * @return
	 */
	public ProductInstruction updateProductInstruction(ProductInstruction productInstruction,UploadFileDto[] dtos);
	
	/**
	 * 
	 * getProductInstructionById 根据id获取产品说明书
	 * @param id
	 * @return
	 */
	public ProductInstruction getProductInstructionById(String id);
	
	/**
	 * 
	 * deleteProductInstructions 批量删除产品说明书
	 * @param ids
	 */
	public void deleteProductInstructions(String ids);
	
	/**
	 * 
	 * getProductInstructions 获取产品说明书
	 * @param technicalInfoDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<ProductInstruction> getProductInstructions(TechnicalInfoDTO technicalInfoDTO,int first,int max);
	
	/**
	 * 获取技术规章记录数
	 * @param technicalInfoDTO
	 * @return
	 */
	public int getProductInstructionCount(TechnicalInfoDTO technicalInfoDTO);
}
