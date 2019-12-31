/**   
 * Copyright © 2019 eSunny Info. Tech Ltd. All rights reserved.
 *
 * @Package: com.enovell.yunwei.system.service 
 * @author: lidt   
 * @date: 2019年5月29日 下午4:07:47 
 */
package com.enovell.yunwei.system.service;

import com.enovell.yunwei.system.domain.LoginErrorTime;

/**   
 *    
  *  项目名称：RINMS2MAIN_ES   
  *  类名称：LoginErrorTimeService   
  *  类描述：   登录次数限制日志接口
  *  创建人：zhouxy
  *  创建时间：2019年5月29日 下午4:07:47
 *    
 */
public interface LoginErrorTimeService {
	
	/**
	 * 
	 * addLoginErrorTime 新增登录错误次数
	 * 
	 * @param userName 登录用户名
	 */
	public void addLoginErrorTime(String userName);
	
	/**
	 * 
	 * getCountByUserName 根据登录用户名获取登录错误次数
	 * 
	 * @param userName 登录用户名
	 * @return
	 */
	public int getCountByUserName(String userName);
	
	/**  
	 * getLoginErrorTimeLast 获取登录用户名的最新一条
	 * 
	 * @param userName 登录用户名
	 * @return 
	 */  
	public LoginErrorTime getLoginErrorTimeLast(String userName);
	
	/**
	 * 
	 * clearLoginErrorTime 清空登录错误次数
	 * 
	 * @param userName 登录用户名
	 */
	public void clearLoginErrorTime(String userName);

}
