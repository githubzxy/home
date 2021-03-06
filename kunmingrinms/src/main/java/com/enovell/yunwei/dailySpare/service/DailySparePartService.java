
/**   
 * 文件名：SparePartService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 上午12:05:19   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.dailySpare.domain.DailySparePart;
import com.enovell.yunwei.dailySpare.domain.DailySpareUseStock;
import com.enovell.yunwei.dailySpare.dto.*;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SparePartService   
 * 类描述:  日常备品-接口
 * 创建人：ltf 
 * 创建时间：2016-11-30 上午12:05:19
 * 修改人：ltf
 * 修改时间：2016-11-30 上午12:05:19   
 *    
 */

public interface DailySparePartService {
	
	/**    
	 * addSparePart 新增备品备件
	 * @param dailySparePart 备品备件
	 * @param useStock 入库记录
	 * @return
	 */
	public DailySparePart addSparePart(DailySparePart dailySparePart, DailySpareUseStock useStock);


	/**
	 * addSparePart 新增备品备件
	 * @param spareInfo 前端获取的备品信息及操作信息
	 * @param user
	 * @return
	 */
	public DailySparePart addSparePart(DailySparePartInfoDTO spareInfo, User user);


	/**
	 * updateSparePart 修改备品备件
	 * @param dailySparePart
	 * @return
	 */
	public DailySparePart updateSparePart(DailySparePart dailySparePart);


	/**
	 * updateSparePartNoRecordUseStock 修改备品
	 * @param paramSpare
	 * @return
	 */
	public DailySparePart updateSparePartNoRecordUseStock(DailySparePart paramSpare);


	/**
	 * inSparePart 备品备件入库
	 * @param paramSpare
	 * @param user
	 * @return
	 */
	public DailySparePart inSparePart(DailySparePart paramSpare, User user);

	/**
	 * outSparePart 出库或报废（两个功能逻辑相同）
	 * @param paramSpare
	 * @param user
	 * @param rearon
	 * @return
	 */
	public DailySparePart outOrScrapSparePart(DailySparePart paramSpare, User user, String rearon);

	/**
	 * ReturnSparePart 备品备件返厂
	 * @param paramSpare
	 * @param user
	 * @return
	 */
	public DailySparePart ReturnSparePart(DailySparePart paramSpare, User user);


	/**
	 * moveSparePart 移库
	 * @param id 待移库的备品id
	 * @param workShopId 接收车间id
	 * @param workAreaId 接收工区id
	 * @param amountMove 移库数量
	 * @param user 操作人
	 */
	public void moveSparePart(
            String id, String workShopId, String workAreaId, double amountMove, User user);

	/**
	 * 删除备品备件（同时会删除所有使用记录）
	 */
	public void deleteSpareParts(String[] idArr);

	/**
	 * 通过id查询备品备件
	 * @param id
	 * @return
	 */
	public DailySparePart getSparePartById(String id);


	/**
	 * getSparePartByIds 通过ids(id集合)查询备品备件
	 * @param ids
	 * @return
	 */
	public List<DailySparePart> getSparePartByIds(String[] ids);



	/**
	 * getAllSparePartsByDTO 条件查询备品备件（不分页）
	 * @param dto
	 * @return
	 */
	public List<DailySparePart> getAllSparePartsByDTO(DailySparePartDTO dto);

	/**
	 * getSparePartsByDTO 分页、条件查询备品备件
	 * @param dto 条件
	 * @param first
	 * @param max
	 * @return
	 */
	public List<DailySparePart> getSparePartsByDTO(DailySparePartDTO dto, int first, int max);

	/**
	 * getSparePartCount 获取记录数
	 * @param dto
	 * @return
	 */
	public Long getSparePartCount(DailySparePartDTO dto);

	/**
	 * getSparePartShowDto 分页、条件查询备品备件前端展示的dto
	 * @param dto
	 * @param first
	 * @param max
	 * @return
	 */
	public List<DailySparePartShowDTO> getSparePartShowDto(DailySparePartDTO dto, int first, int max);


	/**
	 * getAreaSpareStatisticsByShop 根据条件（车间id查询）查询所有工区的备品统计数据（具体到工区），
	 * 	并将相同备品数据合并成一条
	 * @param workShopId
	 * @return
	 */
	public List<Map<String,Object>> getAreaSpareStatisticsByShop(String workShopId);


	/**
	 * getShopSpareStatistics 查询所有车间的备品统计数据（具体到车间）
	 * @return
	 */
	public List<Map<String,Object>> getShopSpareStatistics();

	/**
	 * getSpareAndNormByDto 条件查询备品信息及指标--分页查询
	 * @param dto	查询条件（设备名称、所属车间、状态）
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<DailySpareAndNormDTO> getSpareAndNormByDto(DailySpareAndNormDTO dto, int start, int limit);


	/**
	 * getSpareAndNormByDtoCount 条件查询备品信息及指标记录数
	 * @param dto	查询条件（设备名称、所属车间、状态）
	 * @return
	 */
	public Long getSpareAndNormByDtoCount(DailySpareAndNormDTO dto);

	/**
	 *
	 * importExcel 导入excel
	 * @param file 导入的文件
	 * @return 如果导入的数据存在问题—返回错误文件的workbook 如果数据正确—返回null
	 * @author quyy
	 */
	public Workbook importExcel(MultipartFile file, User user) throws Exception;

	/**
	 * 备品备件批量审核通过
	 * auditSparePass
	 * @param ids
	 * @param user 审核人
	 * @author luoyan
	 */
	public void auditSparePass(String ids, User user);

	/**
	 * 备品备件批量审核不通过
	 * auditSparePass
	 * @param ids
	 * @param user 审核人
	 * @author luoyan
	 */
	public void auditSpareNoPass(String ids, User user);
	
	
	//----------------------------全部导出Excel-----------------------------
	/**
	 * 日常备品-导出至Excel
	 * getSparePartExportDto 
	 * @param dto 查询条件封装
	 * @return
	 * @author luoyan
	 */
	public List<DailySparePartExportDTO> getSparePartExportDto(DailySparePartDTO dto);
	
	/**
	 * 导出至Excel（用于高铁、普铁无线、普铁有线统计）
	 * getExpSpareAndNorm 
	 * @param dto
	 * @return
	 * @author luoyan
	 */
	public List<DailySpareAndNormExportDTO> getExpSpareAndNorm(DailySpareAndNormDTO dto);


	/**
	 * 转换日常设备类型为中文
	 * emergencySpeciality 
	 * @param speciality
	 * @return
	 * @author luoyan
	 */
	public String emergencySpeciality(Integer speciality);
	/**
	 * 根据系统名获取设备类别
	 * @param systemName
	 * @return
	 */
	public  List<String> getTypeBySystem(String systemName);
	/**
	 * 获取设备所属系统名称
	 * @param systemName
	 * @return
	 */
	public  List<String> getSystemName();
	//----------------------------导出结束--------------------------------
}












