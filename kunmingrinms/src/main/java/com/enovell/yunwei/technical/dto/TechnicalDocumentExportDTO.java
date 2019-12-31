package com.enovell.yunwei.technical.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：TechnicalDocumentExportDTO   
 * 类描述: 技术资料导出excel的DTO
 * 创建人：yangsy 
 * 创建时间：2016-11-24 
 *
 */
public class TechnicalDocumentExportDTO implements Serializable {

	private static final long serialVersionUID = 2924907056596931532L;

	/**
	 * 资料名称
	 */
	private String name;

	/**
	 * 所属部门
	 */
	private String depart;

	
	/**
	 * 资料类别
	 */
	private String technicalInfoType;
	
	/**
	 * 创建开始时间
	 */
	private Date createStartDate;
	
	/**
	 * 线别
	 */
	private String railLine;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getTechnicalInfoType() {
		return technicalInfoType;
	}

	public void setTechnicalInfoType(String technicalInfoType) {
		this.technicalInfoType = technicalInfoType;
	}

	public Date getCreateStartDate() {
		return createStartDate;
	}

	public void setCreateStartDate(Date createStartDate) {
		this.createStartDate = createStartDate;
	}

	public String getRailLine() {
		return railLine;
	}

	public void setRailLine(String railLine) {
		this.railLine = railLine;
	}

}
