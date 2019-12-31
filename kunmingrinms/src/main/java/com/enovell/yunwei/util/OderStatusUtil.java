package com.enovell.yunwei.util;
/**  
* 创建时间：2017年6月23日 上午11:10:31  
* 项目名称：kunmingrinms  
* 文件名称：OderStatusUtil.java  
* 类说明：拼装排序状态工具类
* @author luoyan    
*/
public class OderStatusUtil {
	
	/**
	 * 按照数组中状态顺序进行排序分页查询数据
	 * getOderStatus 
	 * @param status
	 * @author luoyan
	 */
	public static String getOderStatus(String[] status) {
		String oderStatus = "";
		for (int i = 1; i <= status.length; i++) {
			if(i==status.length){
				oderStatus += status[i-1]+","+i;
				continue;
			}
			oderStatus += status[i-1]+","+i+",";
		}
		return oderStatus;
	}
}
