package com.enovell.yunwei.deviceNormConfig.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.enovell.yunwei.emergency.domain.DeviceName;
import org.hibernate.annotations.GenericGenerator;


/**
 * 项目名称：kunmingrinms
 * 类名称：DeviceConfig
 * 类描述:  应急设备标准配置实体类
 * 创建人：yangsy 
 * 创建时间：2016-12-23
 */

@Entity
@Table(name = "SPARE_NORM")
public class DeviceNormConfig implements Serializable {
	
	
	private static final long serialVersionUID = -7717495185963509326L;
	
	
	private String id;
	
	/**
	 * 设备名称
	 */
	private DeviceName deviceConfig;
	
	/**
	 * 指标值
	 */
	private Double normValue;
	
	/**
	 * 备注
	 */
	private String remark;

	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name="system-uuid",strategy="uuid")
	@Column(name="ID_")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DEVICE_NAME_ID")
	public DeviceName getDeviceConfig() {
		return deviceConfig;
	}

	public void setDeviceConfig(DeviceName deviceConfig) {
		this.deviceConfig = deviceConfig;
	}

	@Column(name = "NORM_VALUE_")
	public Double getNormValue() {
		return normValue;
	}

	public void setNormValue(Double normValue) {
		this.normValue = normValue;
	}

	@Column(name = "REMARK_")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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
		DeviceNormConfig other = (DeviceNormConfig) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
