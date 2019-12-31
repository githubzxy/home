
/**   
 * 文件名：SpareNormService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-2 上午10:25:53   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.service;

import com.enovell.yunwei.emergency.domain.SpareNorm;

import java.util.List;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareNormService   
 * 类描述:  应急备品指标 接口
 * 创建人：ltf 
 * 创建时间：2016-12-2 上午10:25:53
 * 修改人：ltf
 * 修改时间：2016-12-2 上午10:25:53   
 *    
 */

public interface SpareNormService {
	
	
	/**    
	 * getAllSpareNorms 查询所有应急备品指标
	 * @return
	 */
	public List<SpareNorm> getAllSpareNorms() ;
	
	
}




