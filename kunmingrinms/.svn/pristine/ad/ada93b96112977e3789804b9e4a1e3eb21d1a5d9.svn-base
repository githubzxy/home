
/**   
 * 文件名：CommNetStopValidateService.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-5-4 下午3:15:17   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.commNetworkStop.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.ValidateMsg;
import org.apache.poi.ss.usermodel.Workbook;

import java.util.List;

/**      
 * 项目名称：yunwei
 * 类名称：CommNetStopValidateService   
 * 类描述:  停机要点导入数据接口
 * 创建人：lidt 
 * 创建时间：2017-5-8 下午5:12:22
 * 修改人：lidt 
 * 修改时间：2017-5-8 下午5:12:22    
 *    
 */
public interface CommNetStopValidateService {
	
	/**
	 * 
	 * getValidateMsg 获取上传文件的错误信息
	 * @param wb
	 * @param uploadName 文件名
	 * @param user 登录用户
	 */
	public List<ValidateMsg> getValidateMsg(Workbook wb, String uploadName, User user);

}
