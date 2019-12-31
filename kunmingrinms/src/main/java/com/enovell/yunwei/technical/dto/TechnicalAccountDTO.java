package com.enovell.yunwei.technical.dto;

import java.io.Serializable;
import java.util.Date;

import com.enovell.system.common.domain.Organization;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：TechnicalAccountDTO   
 * 类描述: 技术台账查询条件
 * 创建人：yangsy 
 * 创建时间：2016-11-25
 * 
 */
public class TechnicalAccountDTO implements Serializable {

	
	private static final long serialVersionUID = -7562752107497440632L;

	/**
	 * 台账名称
	 */
	private String name;

	/**
	 * 所属部门
	 */
	private Organization depart;
	
	/**
	 * 台账类别
	 */
	private Integer type;
	
	/**
	 * 创建开始时间
	 */
	private Date startDate;
	
	/**
	 * 创建结束时间
	 */
	private Date endDate;
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Organization getDepart() {
		return depart;
	}

	public void setDepart(Organization depart) {
		this.depart = depart;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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
	
}
