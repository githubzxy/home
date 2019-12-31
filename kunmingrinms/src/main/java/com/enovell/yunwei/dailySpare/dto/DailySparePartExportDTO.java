
/**   
 * 文件名：SparePartExportDTO.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-1 下午2:39:18   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.dto;

import java.io.Serializable;
import java.util.Date;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SparePartExportDTO   
 * 类描述:  日常备品导出值Excel的表头Dto
 * 创建人：ltf 
 * 创建时间：2016-12-1 下午2:39:18
 * 修改人：ltf
 * 修改时间：2016-12-1 下午2:39:18   
 *    
 */

public class DailySparePartExportDTO implements Serializable {
	
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
	 * 设备所属系统
	 */
	private String deviceProperties;
	/**
	 * 设备类别
	 */
	private String speciality;
	
	/**
	 * 板件名称
	 */
	private String platesName;
	/**
	 * 板件可用设备型号
	 */
	private String availableModle;
	/**
	 * 设备或单板编号
	 */
	private String singleNumber;
	
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
	 * 入库原因
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
	
	/**
	 * 所属车间
	 */
	private String workShop;
	
	/**
	 * 所属工区
	 */
	private String workArea;

	/**
	 * 厂家
	 */
	private String factory;
	
	/**
	 * 存放地点
	 */
	private String depositLocation;
	/**
	 * 备注
	 */
	private String comment;
	
//	/**
//	 * 购置时间
//	 */
//	private Date buyDate;
	

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}



	public String getPlatesName() {
		return platesName;
	}

	public void setPlatesName(String platesName) {
		this.platesName = platesName;
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

	
	
//	public Date getBuyDate() {
//		return buyDate;
//	}
//
//	public void setBuyDate(Date buyDate) {
//		this.buyDate = buyDate;
//	}

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

	public String getAvailableModle() {
		return availableModle;
	}

	public void setAvailableModle(String availableModle) {
		this.availableModle = availableModle;
	}

	public String getSingleNumber() {
		return singleNumber;
	}

	public void setSingleNumber(String singleNumber) {
		this.singleNumber = singleNumber;
	}

	@Override
	public String toString() {
		return "DailySparePartExportDTO [checkStatus=" + checkStatus + ", checkDate=" + checkDate + ", checkUserName="
				+ checkUserName + ", deviceProperties=" + deviceProperties + ", speciality=" + speciality
				+ ", platesName=" + platesName + ", availableModle=" + availableModle + ", singleNumber=" + singleNumber
				+ ", sparePartModel=" + sparePartModel + ", unit=" + unit + ", amount=" + amount + ", buyReason="
				+ buyReason + ", inDate=" + inDate + ", softwareEdition=" + softwareEdition + ", workShop=" + workShop
				+ ", workArea=" + workArea + ", factory=" + factory + ", depositLocation=" + depositLocation
				+ ", comment=" + comment + "]";
	}




	
}




