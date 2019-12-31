package com.enovell.yunwei.fileSystemNew.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：FileSystemExportDTO   
 * 类描述: 文件系统导出excel的DTO
 * 创建人：yangsy 
 * 创建时间：2016-11-24 
 *
 */
public class FileSystemExportDTO implements Serializable {

	private static final long serialVersionUID = 8932984849448464515L;

	/**
	 * 文件名称
	 */
	private String fileName;

	/**
	 * 文件类型
	 */
	private String fileType;

	/**
	 * 适用范围
	 */
	private String fileSuitableRange;
	
	/**
	 * 有效时间
	 */
	private String fileValidTime;
	
	/**
	 * 是否细化
	 */
	private String isDetailing;
	
	/**
	 * 所属部门
	 */
	private String organization;
	
	/**
	 * 创建开始时间
	 */
	private Date createStartDate;
	
	

	public Date getCreateStartDate() {
		return createStartDate;
	}

	public void setCreateStartDate(Date createStartDate) {
		this.createStartDate = createStartDate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileSuitableRange() {
		return fileSuitableRange;
	}

	public void setFileSuitableRange(String fileSuitableRange) {
		this.fileSuitableRange = fileSuitableRange;
	}

	public String getFileValidTime() {
		return fileValidTime;
	}

	public void setFileValidTime(String fileValidTime) {
		this.fileValidTime = fileValidTime;
	}

	public String getIsDetailing() {
		return isDetailing;
	}

	public void setIsDetailing(String isDetailing) {
		this.isDetailing = isDetailing;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

}
