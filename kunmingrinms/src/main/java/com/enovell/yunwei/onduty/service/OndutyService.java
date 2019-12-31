package com.enovell.yunwei.onduty.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.onduty.domain.OnDuty;
import com.enovell.yunwei.onduty.domain.OnDutyDTO;
import com.enovell.yunwei.onduty.domain.OnDutyQueryDTO;
import com.enovell.yunwei.onduty.dto.OnDutyNew;

/**值班业务逻辑接口
 * @author roy
 * 2015年7月23日-下午4:34:49
 */
public interface OndutyService {
	
	
	/**
	 * 根据值班部门与值班人获取值班人
	 * checkDeptAndPeople
	 * @param ondutyDept
	 * @param ondutyPeople
	 * @return
	 */
	public User getDeptAndPeople(String ondutyDept,String ondutyPeople);
	
	
	/**
	 * 新增
	 * @param onDuty
	 * @return
	 */
	public OnDuty add(OnDuty onDuty);
	
	/**
	 * 批量新增
	 * @param list
	 * @throws ParseException 
	 */
	public String addBoth(User user,String onduyUsers,String dateStr)  ;
	
	/**
	 * 通过id获取
	 * @param id
	 * @return
	 */
	public OnDuty getById(String id);
	/**
	 * 修改
	 * @param onDuty
	 * @return
	 * @throws ParseException 
	 */
	public String update(User curUser,OnDuty onDuty) ;
	/**
	 * 通过id删除
	 * @param idList
	 */
	public void delete(List<String> idList);
	/**
	 * 获取全部
	 * @return
	 */
	public List<OnDuty> getAll();
	/**
	 * 通过条件分页获取
	 * @param dto
	 * @param first
	 * @param max
	 * @return
	 */
	public GridDto<OnDutyNew> getByDTO(OnDutyDTO dto,int first,int max);
	
	
	/**
	 * 情况汇报
	 * @param onDuty
	 * @return
	 */
	public String report(OnDuty onDuty);
	
	/**
	 * 通过条件获取全部，并按值班人所在部门（orgIndex）进行排序
	 * @param dto
	 * @param first
	 * @param max
	 * @return
	 */
	public List<OnDuty> getAllByDTO(OnDutyDTO dto);
	
	/**
	 * 验证指定的人在指定的日期是否能添加值班信息---用于新增
	 * 是- true  否-false
	 * @param user
	 * @param date
	 * @return 
	 */
	public Boolean addCheckOnly(List<User> users,Date date);
	
	/**
	 * 
	 * updateCheckOnl y验证指定的人在指定的日期是否能添加值班信息---用于修改
	 * @param user
	 * @param date
	 * @param curOnDuty
	 * @return
	 */
	public Boolean updateCheckOnly(User user, Date date, OnDuty curOnDuty);
	/**
	 * 
	 * updateCheckOnl 查询当日当前用户值班信息
	 * @param userId
	 * @return
	 */
	public OnDuty getTodayUserDuty(String userId) ;

	
///---------------------------------------------首页值班模块---------------------------------------------
	
	
	/**根据日期查询首页值班列表内容
	 * @param dutyDate
	 * @return
	 */
	public List<OnDutyQueryDTO> getHomeDuty(String dutyDate);
	
	/**
	 * 根据人员查询当天的值班
	 * @param userId
	 * @return
	 */

	public List<OnDuty> getToDayDutyByUser(String userId);

	
	/**
	 * 值班汇报保存 
	 * @param dutyId
	 * @param content
	 */
	public void updateDuty(String dutyId,String content);
	
}
