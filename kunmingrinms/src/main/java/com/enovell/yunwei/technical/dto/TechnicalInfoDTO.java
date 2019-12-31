package com.enovell.yunwei.technical.dto;

import java.io.Serializable;
import java.util.Date;

import com.enovell.system.common.domain.Organization;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：TechnicalInfoDTO   
 * 类描述: 竣工和技术图纸的资料查询条件
 * 创建人：zhangsihong 
 * 创建时间：2012-9-3 下午02:20:06
 * 修改人：zhangsihong 
 * 修改时间：2012-9-3 下午02:20:06   
 *
 */
public class TechnicalInfoDTO implements Serializable {
	   
	private static final long serialVersionUID = 7462850195348866811L;

	/**
	 * 资料名称
	 */
	private String name;

	/**
	 * 所属部门
	 */
	private Organization depart;
	
	/**
	 * 线别
	 */
	private String railLine;
	
	/**
	 * 资料类别
	 */
	private Integer technicalInfoType;
	
	/**
	 * 创建开始时间
	 */
	private Date createStartDate;
	
	/**
	 * 创建结束时间
	 */
	private Date createEndDate;
	
	/**
	 * 竣工开始时间
	 */
	private Date completionStartDate;
	
	/**
	 * 竣工结束时间
	 */
	private Date completionEndDate;

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

	public String getRailLine() {
		return railLine;
	}

	public void setRailLine(String railLine) {
		this.railLine = railLine;
	}
	
	public Integer getTechnicalInfoType() {
		return technicalInfoType;
	}

	public void setTechnicalInfoType(Integer technicalInfoType) {
		this.technicalInfoType = technicalInfoType;
	}
	
	public Date getCreateStartDate() {
		return createStartDate;
	}

	public void setCreateStartDate(Date createStartDate) {
		this.createStartDate = createStartDate;
	}

	public Date getCreateEndDate() {
		return createEndDate;
	}

	public void setCreateEndDate(Date createEndDate) {
		this.createEndDate = createEndDate;
	}

	public Date getCompletionStartDate() {
		return completionStartDate;
	}

	public void setCompletionStartDate(Date completionStartDate) {
		this.completionStartDate = completionStartDate;
	}

	public Date getCompletionEndDate() {
		return completionEndDate;
	}

	public void setCompletionEndDate(Date completionEndDate) {
		this.completionEndDate = completionEndDate;
	}
	
}
