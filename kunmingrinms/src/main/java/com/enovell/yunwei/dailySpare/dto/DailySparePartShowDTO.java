
/**   
 * 文件名：SparePartDTO.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 上午12:17:41   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.dto;

import com.enovell.system.common.domain.User;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目名称：kunmingrinms
 * 类名称：SparePartDTO   
 * 类描述:  备品查询-前台展示
 * 创建人：ltf 
 * 创建时间：2016-11-30 上午12:17:41
 * 修改人：ltf
 * 修改时间：2016-11-30 上午12:17:41   
 *    
 */

public class DailySparePartShowDTO implements Serializable {
	
	private static final long serialVersionUID = 7813160737997015263L;
	
	/**
	 * 日常备品id
	 */
	private String id;

	/**
	 * 设备类别
	 */
//	private Integer speciality;
	private String speciality;
	
	/**
	 * 设备名称
	 */
	private String platesName;
	
	/**
	 * 设备名称
	 */
	private String sparePartName;
	/**
	 * 规格型号
	 */
	private String sparePartModel;
	
//	/**
//	 * 单位
//	 */
//	
//	private Integer unit;
	/**
	 * 单位
	 */
	private String unit;
	
	/**
	 * 数量
	 */
	private Double amount;
	
	/**
	 * 所属车间id
	 */
	private String workShopId;
	
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
	 * 设备属性
	 */
	private String deviceProperties;
	
	/**
	 * 审核状态
	 */
	private String checkStatus;
	
	/**
	 * 审核人
	 */
	private User checkUser;
	
	/**
	 * 审核时间
	 */
	private Date checkDate;
	/**
	 * 板件可用设备型号
	 */
	private String availableModle;
	/**
	 * 设备或单板编号
	 */
	private String singleNumber;
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

	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}

	public User getCheckUser() {
		return checkUser;
	}

	public void setCheckUser(User checkUser) {
		this.checkUser = checkUser;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	/**
	 * 备注
	 */
	private String comment;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

//	public Integer getSpeciality() {
//		return speciality;
//	}
//
//	public void setSpeciality(Integer speciality) {
//		this.speciality = speciality;
//	}
	
	



	public String getSparePartName() {
		return sparePartName;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public void setSparePartName(String sparePartName) {
		this.sparePartName = sparePartName;
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
//
//	public Integer getUnit() {
//		return unit;
//	}
//
//	public void setUnit(Integer unit) {
//		this.unit = unit;
//	}

	public Double getAmount() {
		return amount;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getWorkShopId() {
		return workShopId;
	}

	public void setWorkShopId(String workShopId) {
		this.workShopId = workShopId;
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
		return "DailySparePartShowDTO [id=" + id + ", speciality=" + speciality + ", platesName=" + platesName
				+ ", sparePartModel=" + sparePartModel + ", unit=" + unit + ", amount=" + amount + ", workShopId="
				+ workShopId + ", workShop=" + workShop + ", workArea=" + workArea + ", factory=" + factory
				+ ", depositLocation=" + depositLocation + ", deviceProperties=" + deviceProperties + ", checkStatus="
				+ checkStatus + ", checkUser=" + checkUser + ", checkDate=" + checkDate + ", availableModle="
				+ availableModle + ", singleNumber=" + singleNumber + ", buyDate=" + buyDate + ", buyReason="
				+ buyReason + ", inDate=" + inDate + ", softwareEdition=" + softwareEdition + ", comment=" + comment
				+ "]";
	}

}



