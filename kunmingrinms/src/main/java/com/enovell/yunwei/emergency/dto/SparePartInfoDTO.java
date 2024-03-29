
/**   
 * 文件名：SparePartInfoDTO.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 下午5:52:25   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.dto;

import java.io.Serializable;
import java.util.Date;


/**
 * 项目名称：kunmingrinms
 * 类名称：SparePartInfoDTO   
 * 类描述:  应急备品信息-用于封装入库弹出框（新增功能）信息
 * 创建人：ltf 
 * 创建时间：2016-11-30 下午5:52:25
 * 修改人：ltf
 * 修改时间：2016-11-30 下午5:52:25   
 *    
 */

public class SparePartInfoDTO implements Serializable {
	
	private static final long serialVersionUID = 5597290673410220234L;
	
	/**
	 * 设备类别
	 */
	private Integer speciality;
	
	/**
	 * 设备名称id
	 */
	private String deviceNameId;
	/**
	 * 设备名称
	 */
	private String platesName;
	/**
	 * 单位
	 */
	private String unit;
	
	/**
	 * 规格型号
	 */
	private String sparePartModel;
	
	/**
	 * 所属车间id
	 */
	private String workShopId;
	
	/**
	 * 所属工区id
	 */
	private String workAreaId;
	
	/**
	 * 数量
	 */
	private Double amount;
	
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

	public Integer getSpeciality() {
		return speciality;
	}

	public void setSpeciality(Integer speciality) {
		this.speciality = speciality;
	}

	public String getDeviceNameId() {
		return deviceNameId;
	}

	public String getPlatesName() {
		return platesName;
	}

	public void setPlatesName(String platesName) {
		this.platesName = platesName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public void setDeviceNameId(String deviceNameId) {
		this.deviceNameId = deviceNameId;
	}

	public String getSparePartModel() {
		return sparePartModel;
	}

	public void setSparePartModel(String sparePartModel) {
		this.sparePartModel = sparePartModel;
	}

	public String getWorkShopId() {
		return workShopId;
	}

	public void setWorkShopId(String workShopId) {
		this.workShopId = workShopId;
	}

	public String getWorkAreaId() {
		return workAreaId;
	}

	public void setWorkAreaId(String workAreaId) {
		this.workAreaId = workAreaId;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
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
		return "SparePartInfoDTO [speciality=" + speciality + ", deviceNameId="
				+ deviceNameId + ", sparePartModel=" + sparePartModel
				+ ", workShopId=" + workShopId + ", workAreaId=" + workAreaId
				+ ", amount=" + amount + ", comment=" + comment + "]";
	}
	
}