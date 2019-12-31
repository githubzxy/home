/**   
 * 文件名：Login.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-5-16 上午11:34:22   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.system.annotation;

import java.lang.annotation.*;

/**      
 * 项目名称：kunmingrinms
 * 类名称：Login   
 * 类描述:  登录日志注解
 * 创建人：lidt 
 * 创建时间：2017-5-16 上午11:34:22
 * 修改人：lidt 
 * 修改时间：2017-5-16 上午11:34:22   
 *    
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LoginAnnotation {

	/**
	 * 
	 * content 操作内容(例：登录系统，退出系统)
	 * @return
	 */
	public String content() default "";
}
