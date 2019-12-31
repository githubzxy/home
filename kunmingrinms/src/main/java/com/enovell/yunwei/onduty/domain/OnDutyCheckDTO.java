package com.enovell.yunwei.onduty.domain;

import java.io.Serializable;
import java.util.Date;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：OnDutyCheckDTO   
 * 类描述:  用于封装验证数据是否重复的DTO
 * 创建人：yangsy
 * 创建时间：2017-5-9 上午11:40:08
 *
 */
public class OnDutyCheckDTO implements Serializable{
	
	private static final long serialVersionUID = -8868152730715683155L;

	/**
	 * 值班日期
	 */
	private Date dutyDate;
	
	/**
	 * 所属部门
	 */
	private Organization organization;
	
	/**
	 * 值班人
	 */
	private User user;
	/**
	 * 序号
	 */
	private String index;
	
	/**
	 * 行号
	 */
	private String row;

	public Date getDutyDate() {
		return dutyDate;
	}

	public void setDutyDate(Date dutyDate) {
		this.dutyDate = dutyDate;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}

}
