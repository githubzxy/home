package com.enovell.yunwei.onduty.service;

import java.util.List;

import org.apache.poi.ss.usermodel.Workbook;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.ValidateMsg;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：OnDutyValidateService   
 * 类描述:  全部值班管理导入excel的内容有效性验证接口
 * 创建人：yangsy
 * 创建时间：2017-5-4 下午3:52:53
 *
 */
public interface OnDutyValidateService {
	
	/**
	 * 数据有效性验证
	 * ondutyDeptAndPeopleValidate 
	 * @param originFileName
	 * @param msgs
	 * @param wb
	 * @param orgId
	 * @return
	 * @author luoyan
	 */
	public List<ValidateMsg> ondutyDeptAndPeopleValidate(String originFileName,List<ValidateMsg> msgs, Workbook wb,String orgId);
	
	/**
	 * 验证数据是否重复
	 * ondutyRepeatValidate 
	 * @param originFileName
	 * @param msgs
	 * @param wb
	 * @return
	 * @author luoyan
	 */
	public List<ValidateMsg> ondutyRepeatValidate(String originFileName,List<ValidateMsg> msgs, Workbook wb);
	/**
	 * 
	 * validate 验证方法
	 * @param originFileName
	 * @param msgs
	 * @param wb
	 * @return
	 */
	public List<ValidateMsg> validate(String originFileName, List<ValidateMsg> msgs, Workbook wb,User createUser);
	
	
}
