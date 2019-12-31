
/**   
 * 文件名：LoginService.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-5-16 上午11:20:43   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.system.service;

import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.system.domain.Login;
import com.enovell.yunwei.system.dto.LoginDTO;

import java.util.List;
import java.util.Map;

/**      
 * 项目名称：kunmingrinms
 * 类名称：LoginService   
 * 类描述:  登录日志接口
 * 创建人：lidt 
 * 创建时间：2017-5-16 上午11:20:43
 * 修改人：lidt 
 * 修改时间：2017-5-16 上午11:20:43   
 *    
 */
public interface LoginService {

	/**
	 * 
	 * addLogin 增加登录日志
	 * 
	 * @param login
	 * @return
	 */
	public Login addLogin(Login login);
	
	/**
	 * 
	 * getLoginCountOfOrg 根据组织机构类型和登录时间段来查询组织机构登录系统次数
	 * @param orgType 组织机构类型
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @return
	 * @author quyy
	 */
	public List<Map<String, Object>> getLoginCountOfOrg(String orgType, String startTime, String endTime);
	
	/**
	 * 
	 * getGridDtoList 查询登录日志列表数据
	 *
	 * @author lidt
	 * @date 2018年1月8日 下午3:05:29 
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<LoginDTO> getGridDtoList(LoginDTO dto, int start, int limit);
	
}
