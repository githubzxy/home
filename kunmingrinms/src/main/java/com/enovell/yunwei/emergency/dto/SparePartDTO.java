
/**   
 * 文件名：SparePartDTO.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 上午12:17:41   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目名称：kunmingrinms
 * 类名称：SparePartDTO   
 * 类描述:  备品查询-用于查询条件
 * 创建人：ltf 
 * 创建时间：2016-11-30 上午12:17:41
 * 修改人：ltf
 * 修改时间：2016-11-30 上午12:17:41   
 *    
 */

public class SparePartDTO implements Serializable {
	
	private static final long serialVersionUID = -5747076711078639360L;

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
	 * 入库开始时间
	 */
	private Date inStartDate;
	
	/**
	 * 入库结束时间
	 */
	private Date inEndDate;

	public Integer getSpeciality() {
		return speciality;
	}

	public void setSpeciality(Integer speciality) {
		this.speciality = speciality;
	}

	public String getPlatesName() {
		return platesName;
	}

	public void setPlatesName(String platesName) {
		this.platesName = platesName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getDeviceNameId() {
		return deviceNameId;
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

	public String getDeviceProperties() {
		return deviceProperties;
	}

	public void setDeviceProperties(String deviceProperties) {
		this.deviceProperties = deviceProperties;
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


	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}
	

	

	public Date getInStartDate() {
		return inStartDate;
	}

	public void setInStartDate(Date inStartDate) {
		this.inStartDate = inStartDate;
	}

	public Date getInEndDate() {
		return inEndDate;
	}

	public void setInEndDate(Date inEndDate) {
		this.inEndDate = inEndDate;
	}

	@Override
	public String toString() {
		return "SparePartDTO [speciality=" + speciality + ", deviceNameId=" + deviceNameId + ", sparePartModel="
				+ sparePartModel + ", workShopId=" + workShopId + ", workAreaId=" + workAreaId + ", factory=" + factory
				+ ", depositLocation=" + depositLocation + ", deviceProperties=" + deviceProperties + ", checkStatus="
				+ checkStatus + "]";
	}

	
}



