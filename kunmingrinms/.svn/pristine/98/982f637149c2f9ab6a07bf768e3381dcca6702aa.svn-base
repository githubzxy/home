
/**   
 * 文件名：OnDutyDeptService.java    
 * 版本信息：RINMS2.0   
 * 日期：2013-12-25 上午11:01:54   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.onduty.service;

import java.util.List;

import org.apache.poi.ss.usermodel.Workbook;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.onduty.domain.OnDutyDeptDTO;
import com.enovell.yunwei.util.ValidateMsg;


/**      
 * 项目名称：kunmingrinms
 * 类名称：OnDutyDeptService   
 * 类描述:  
 * 创建人：jiangming 
 * 创建时间：2013-12-25 上午11:01:54
 * 修改人：zhangsihong
 * 修改时间：2015-09-08 上午11:01:54   
 *    
 */
public interface OnDutyDeptService {
	
	/**
	 * 
	 * getOnDutyDeptDTOList 获得值班信息的查询信息
	 * @return OnDutyDeptDTO的List集合
	 */
	public List<OnDutyDeptDTO> getOnDutyDeptDTOList();
	
	/**
	 * 
	 * save 保存值班部门
	 * @param orgId 机构id
	 */
	public void save(String orgId);
	
	/**
	 * 
	 * save 保存多个值班部门
	 * @param orgId 机构id数组
	 */
	public void save(String[] orgIds);
	
	/**
	 * 
	 * removeAll 移除所有值班部门
	 */
	public void removeAll();
	
	/**
	 * 
	 * saveOnDutyOrg 设置多个个值班部门
	 * @param orgIds 机构Id数组
	 */
	public void saveOnDutyOrg(String[] orgIds);
	
	/**
	 * 
	 * validate 验证方法
	 * @param originFileName
	 * @param msgs
	 * @param wb
	 * @return
	 */
	public List<ValidateMsg> validate(String originFileName, List<ValidateMsg> msgs, Workbook wb, User createUser);
	
	
}
