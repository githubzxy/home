package com.enovell.yunwei.onduty.domain;

import java.io.Serializable;
import java.util.Date;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;

/**
 * 值班查询实体
 * @author panzr
 * @date 2013-2-4下午3:57:09
 * 
 * 修改人：luoyan 2017-7-6 
 */
public class OnDutyDTO implements Serializable{

	private static final long serialVersionUID = -1051203742343739169L;

	/**
	 * 值班人姓名
	 */
	private String name;
	
	/**
	 * 查询值班时间段开始
	 */
	private Date startDate;
	/**
	 * 查询值班时间结束
	 */
	private Date endDate;
	/**
	 * 所属部门   改为String类型
	 */
	private String orgId;
	/**
	 * 星期号
	 */
	private String week;
	
	
	/**
	 * 汇报状态
	 * 1-以汇报 2-未汇报
	 */
	private String status;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
}
