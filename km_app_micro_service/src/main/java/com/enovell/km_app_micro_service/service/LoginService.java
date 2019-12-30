package com.enovell.km_app_micro_service.service;

import com.enovell.system.common.domain.User;

/**登录业务逻辑处理接口
 * @author RoySong
 * @date 2017年10月17日
 */
public interface LoginService {

	/** 登录时通过用户名和密码获取用户ID
	 * @param userName 用户名
	 * @param password 已经进行过MD5转换的密码
	 * @return 用户
	 */
	User getUser(String userName, String password);

}
