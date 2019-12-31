
/**   
 * 文件名：SparePartExportDTO.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-1 下午2:39:18   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.dto;

import java.io.Serializable;
import java.util.Date;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SparePartExportDTO   
 * 类描述:  应急备品导出值Excel的表头Dto
 * 创建人：ltf 
 * 创建时间：2016-12-1 下午2:39:18
 * 修改人：ltf
 * 修改时间：2016-12-1 下午2:39:18   
 *    
 */

public class SparePartExportDTO implements Serializable {
	
	private static final long serialVersionUID = 2066099846147326093L;
	
	/**
	 * 审核状态
	 */
	private String checkStatus;
	/**
	 * 审核时间
	 */
	private Date checkDate;
	
	/**
	 * 审核人
	 */
	private String checkUserName;

	
	/**
	 * 设备类别
	 */
	private String speciality;
	
	/**
	 * 设备名称
	 */
	private String sparePartName;
	
	/**
	 * 规格型号
	 */
	private String sparePartModel;
	
	/**
	 * 单位
	 */
	
	private String unit;
	
	/**
	 * 数量
	 */
	private Double amount;
	
	/**
	 * 所属车间
	 */
	private String workShop;
	
	/**
	 * 所属工区
	 */
	private String workArea;

	/**
	 * 备注
	 */
	private String comment;
	
	/**
	 * 厂家
	 */
	private String factory;
	
	/**
	 * 存放地点
	 */
	private String depositLocation;
	
	/**
	 * 设备属性
	 */
	private String deviceProperties;
	
	/**
	 * 购置时间
	 */
	private Date buyDate;
	
	/**
	 * 购置原因
	 */
	private String buyReason;
	
	/**
	 * 入库时间
	 */
	private Date inDate;
	
	/**
	 * 软件版本
	 */
	private String softwareEdition;

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getSparePartName() {
		return sparePartName;
	}

	public void setSparePartName(String sparePartName) {
		this.sparePartName = sparePartName;
	}

	public String getSparePartModel() {
		return sparePartModel;
	}

	public void setSparePartModel(String sparePartModel) {
		this.sparePartModel = sparePartModel;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getWorkShop() {
		return workShop;
	}

	public void setWorkShop(String workShop) {
		this.workShop = workShop;
	}

	public String getWorkArea() {
		return workArea;
	}

	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
  
	
	
	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}

	public String getDepositLocation() {
		return depositLocation;
	}

	public void setDepositLocation(String depositLocation) {
		this.depositLocation = depositLocation;
	}

	public String getDeviceProperties() {
		return deviceProperties;
	}

	public void setDeviceProperties(String deviceProperties) {
		this.deviceProperties = deviceProperties;
	}
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public String getCheckUserName() {
		return checkUserName;
	}

	public void setCheckUserName(String checkUserName) {
		this.checkUserName = checkUserName;
	}

	
	
	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getBuyReason() {
		return buyReason;
	}

	public void setBuyReason(String buyReason) {
		this.buyReason = buyReason;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public String getSoftwareEdition() {
		return softwareEdition;
	}

	public void setSoftwareEdition(String softwareEdition) {
		this.softwareEdition = softwareEdition;
	}

	@Override
	public String toString() {
		return "SparePartExportDTO [checkStatus=" + checkStatus + ", checkDate=" + checkDate + ", checkUserName="
				+ checkUserName + ", speciality=" + speciality + ", sparePartName=" + sparePartName
				+ ", sparePartModel=" + sparePartModel + ", unit=" + unit + ", amount=" + amount + ", workShop="
				+ workShop + ", workArea=" + workArea + ", comment=" + comment + ", factory=" + factory
				+ ", depositLocation=" + depositLocation + ", deviceProperties=" + deviceProperties + "]";
	}

	
}




