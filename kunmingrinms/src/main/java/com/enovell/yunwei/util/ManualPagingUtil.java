
/**   
 * 文件名：ManualPagingUtil.java    
 * author：quyy  
 * 日期：2017年8月7日 下午3:34:18   
 * Copyright Enovell Corporation 2017      
 */

package com.enovell.yunwei.util;

/**      
 * 项目名称：kunmingrinms
 * 类名称：ManualPagingUtil   
 * 类描述: 手动分页时，根据第一次查询的数据总条数和first，max。获得第二次查询时的first值和max值
 * 创建人：quyy 
 * 创建时间：2017年8月7日 下午3:34:18   
 *    
 */

public class ManualPagingUtil {
	/**
	 * 
	 * isExecuteSecondFun 判断第一次是否查询所有需要的数据，第二次查询方法是否执行。true-执行，false-不执行
	 * @author quyy
	 * @param countFirst
	 * @param first
	 * @param max
	 * @return
	 */
	public static Boolean isExecuteSecondFun(Long countFirst,int first,int max){
		if(first-countFirst>0){
			return true;
		}else{
			if(countFirst-first-max<0){//如果第一次查询出的数据个数不够
				return true;
			}else{
				return false;
			}
		}
	}
	/**
	 * 
	 * getSecondFirst 得到第二次查询的first值
	 * @author quyy
	 * @param countFirst
	 * @param first
	 * @param max
	 * @return
	 */
	public static Integer getSecondFirst(Long countFirst,int first,int max){
		if(first-countFirst>0){//如果第一次查询的first值大于第一次查询出来的数据的总条数
			return (int)(first-countFirst);
		}else{
			if(countFirst-first-max<0){//如果第一次查询出的数据个数不够
				return 0;
			}
		}
		return null;
	}
	/**
	 * 
	 * getSecondMax 得到第二次查询的max值
	 * @author quyy
	 * @param countFirst
	 * @param first
	 * @param max
	 * @return
	 */
	public static Integer getSecondMax(Long countFirst,int first,int max){
		if(first-countFirst>0){//如果第一次查询的first值大于第一次查询出来的数据的总条数
			return max;
		}else{
			if(countFirst-first-max<0){//如果第一次查询出的数据个数不够
				return (int) (max-countFirst+first);
			}
		}
		return null;
	}
}
