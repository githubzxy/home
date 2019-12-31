package com.enovell.yunwei.technical.service;

import java.util.List;

import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.technical.domain.TechnicalAccountInfo;
import com.enovell.yunwei.technical.dto.TechnicalAccountDTO;
import com.enovell.yunwei.technical.dto.TechnicalDto;

/**
 * 项目名称：kunmingrinms 
 * 类名称：TechnicalAccountService 
 * 类描述: 技术台账接口 
 * 创建人：yangsy
 * 创建时间：2016-11-25 
 * 
 */
public interface TechnicalAccountService {

	/**
	 * addAccountData 新增技术台账
	 * @param technicalAcountInfo
	 * @return
	 */
	public TechnicalAccountInfo addAccountData(TechnicalAccountInfo technicalAcountInfo,UploadFileDto[] dtos);
	
	/**
	 * getTechnicalAccountById 根据id获取技术台账
	 * @param id
	 * @return
	 */
	public TechnicalAccountInfo getTechnicalAccountById(String id);
	
	/**
	 * updateAccountData 修改技术台账
	 * @param technicalAcountInfo
	 * @return
	 */
	public TechnicalAccountInfo updateAccountData(TechnicalAccountInfo technicalAcountInfo,UploadFileDto[] dtos);

	/**
	 * 批量删除技术台账
	 */
	public void delTechnicalAccountData(String ids);

	/**
	 * 查询技术台账
	 * @param technicalInfoDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<TechnicalDto> getAccountData(
			TechnicalAccountDTO technicalAccountDTO, int first, int max);

	/**
	 * 获取技术台账记录数
	 * @param technicalInfoDTO
	 * @return
	 */
	public long getCount(TechnicalAccountDTO technicalAccountDTO);

}
