
/**   
 * 文件名：HighRailwaySpareDTO.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-2 上午9:31:53   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.dto;

import java.io.Serializable;


/**
 * 项目名称：kunmingrinms
 * 类名称：HighRailwaySpareDTO   
 * 类描述:  应急备品指标Dto 用于封装查询条件及查询结果
 * 创建人：ltf 
 * 创建时间：2016-12-2 上午9:31:53
 * 修改人：ltf
 * 修改时间：2016-12-2 上午9:31:53   
 *    
 */

public class SpareAndNormDTO implements Serializable {
	/** 达标*/
	public static final String STANDARD="1";
	/** 不达标*/
	public static final String NOT_STANDARD="2";
	
	
	private static final long serialVersionUID = 4821378135015580072L;
	
	/**
	 * 设备类别
	 */
	private Integer speciality;
	
	/**
	 * 设备名称
	 */
	private String deviceName;
	
	/**
	 * 设备名称id(用于关联备品指标数据表)
	 */
	private String deviceNameId;
	
	/**
	 * 所属车间
	 */
	private String workShop;
	
	/**
	 * 所属车间id
	 */
	private String workShopId;
	
	/**
	 * 数量（现有量）
	 */
	private Double amount;
	
	/**
	 * 指标值（标准量）
	 */
	private Double normValue;
	
	/**
	 * 状态（1代表达标，2代表不达标）
	 */
	private String status;
	
	/**
	 * 不达标（前端显示时，不达标的行显示红色）
	 */
	private boolean not_standard;
	
	/**
	 * 设备属性
	 */
	private String deviceProperties;
	
	/**
	 * 厂家
	 */
	private String factory;
	
	/**
	 * 存放地点
	 */
	private String depositLocation;
	
	public Integer getSpeciality() {
		return speciality;
	}

	public void setSpeciality(Integer speciality) {
		this.speciality = speciality;
	}

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public String getDeviceNameId() {
		return deviceNameId;
	}

	public void setDeviceNameId(String deviceNameId) {
		this.deviceNameId = deviceNameId;
	}

	public String getWorkShop() {
		return workShop;
	}

	public void setWorkShop(String workShop) {
		this.workShop = workShop;
	}

	public String getWorkShopId() {
		return workShopId;
	}

	public void setWorkShopId(String workShopId) {
		this.workShopId = workShopId;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Double getNormValue() {
		return normValue;
	}

	public void setNormValue(Double normValue) {
		this.normValue = normValue;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	public boolean getNot_standard() {
		return not_standard;
	}

	public void setNot_standard(boolean not_standard) {
		this.not_standard = not_standard;
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

	public static String getStandard() {
		return STANDARD;
	}

	@Override
	public String toString() {
		return "SpareAndNormDTO [speciality=" + speciality + ", deviceName="
				+ deviceName + ", deviceNameId=" + deviceNameId + ", workShop="
				+ workShop + ", workShopId=" + workShopId + ", amount="
				+ amount + ", normValue=" + normValue + ", status=" + status
				+ ", not_standard=" + not_standard + "]";
	}

	/**
	 * 根据现有量和标准量判断是否达标
	 * isStandard 这里添加描述信息
	 * @param amount
	 * @param normValue
	 * @return
	 */
	public static String isStandard(Double amount,Double normValue){
		Double val=amount-normValue;
		if(val>=0.0){
			return STANDARD;
		}else{
			return NOT_STANDARD;
		}
	}	
	
}




