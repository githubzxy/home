
/**   
 * 文件名：DeviceName.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-29 下午9:05:23   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.domain;

import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


/**      
 * 项目名称：kunmingrinms
 * 类名称：DeviceName   
 * 类描述:  设备名称-实体
 * 创建人：ltf 
 * 创建时间：2016-11-29 下午9:05:23
 * 修改人：ltf
 * 修改时间：2016-11-29 下午9:05:23   
 */

@Entity
@Table(name="DAILY_DEVICENAME_")
public class DailyDeviceName implements Serializable {
	   
	private static final long serialVersionUID = 253482301052310532L;

	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 设备类别
	 */
	private Integer deviceCategory;

	/**
	 * 单位
	 */
	private Integer unit;
	
	/**
	 * 创建时间
	 */
	private Date createTime;
	
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	private Boolean exist = DataExistStatus.EXIST;
	
	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name="system-uuid",strategy="uuid")
	@Column(name="ID_", length = 32)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "NAME_",length = 128)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="DEVICECATEGORYID_")
	public Integer getDeviceCategory() {
		return deviceCategory;
	}

	public void setDeviceCategory(Integer deviceCategory) {
		this.deviceCategory = deviceCategory;
	}
	
	@Column(name="UNITID_")
	public Integer getUnit() {
		return unit;
	}

	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME_")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "EXIST_")
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DailyDeviceName other = (DailyDeviceName) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DeviceName [id=" + id + ", name=" + name + ", deviceCategory="
				+ deviceCategory + ", unit=" + unit + ", createTime="
				+ createTime + "]";
	}
	
}
