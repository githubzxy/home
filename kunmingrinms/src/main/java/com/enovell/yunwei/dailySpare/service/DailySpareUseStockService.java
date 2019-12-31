
/**   
 * 文件名：SpareUseStockService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 下午5:12:21   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.dailySpare.domain.DailySparePart;
import com.enovell.yunwei.dailySpare.domain.DailySpareUseStock;

import java.util.List;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareUseStockService   
 * 类描述:  日常备品使用记录 接口
 * 创建人：ltf 
 * 创建时间：2016-11-30 下午5:12:21
 * 修改人：ltf
 * 修改时间：2016-11-30 下午5:12:21   
 *    
 */

public interface DailySpareUseStockService {
	
	/**    
	 * addSpareUseStock 增加一条使用记录
	 * @param useStock
	 * @return
	 */
	public DailySpareUseStock addSpareUseStock(DailySpareUseStock useStock);
	
	
	/**    
	 * addSpareUseStock 增加一条使用记录
	 * @param amount 使用数量
	 * @param reason 使用原因
	 * @param user 使用人
	 * @param dailySparePart 使用的备品
	 * @param state 状态（入库还是出库）
	 * @return
	 */
	public DailySpareUseStock addSpareUseStock(Double amount, String reason, User user, DailySparePart dailySparePart, String state);
	
	
	/**    
	 * deleteSpareUseStockBySparePart 删除指定日常备品对应的所有使用记录
	 * @param dailySparePartList 指定的日常备品集合
	 */
	public void deleteSpareUseStockBySparePart(List<DailySparePart> dailySparePartList);
	
	
	/**    
	 * getSpareUseStockInBySparePartId 查询指定备品的使用记录（若状态state为null或空字符串，则不区分状态）
	 * @param sparePartId
	 * @return
	 */
	public List<DailySpareUseStock> getSpareUseStockBySparePartId(String sparePartId, String state, int start, int limit);
	
	
	/**    
	 * getSpareUseStockCountBySparePartId 查询指定备品的使用记录数量
	 * @param sparePartId
	 * @param state
	 * @return
	 */
	public Long getSpareUseStockCountBySparePartId(String sparePartId, String state);
	
}





