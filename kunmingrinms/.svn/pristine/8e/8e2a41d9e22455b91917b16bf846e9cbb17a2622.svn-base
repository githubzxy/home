
/**   
 * 文件名：SpareNorm.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-2 上午9:14:15   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.domain;

import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareNorm   
 * 类描述:  日常备品指标
 * 创建人：ltf 
 * 创建时间：2016-12-2 上午9:14:15
 * 修改人：ltf
 * 修改时间：2016-12-2 上午9:14:15   
 *    
 */
@Entity
@Table(name = "DAILY_SPARE_NORM")
public class DailySpareNorm implements Serializable {
	
	private static final long serialVersionUID = -4469797832214990573L;

	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 设备名称
	 */
	private DailyDeviceName dailyDeviceName;
	
	/**
	 * 指标值
	 */
	private Double normValue;
	
	/**
	 * 备注
	 */
	private String remark;
	
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	private Boolean exist = DataExistStatus.EXIST;

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
	public DailyDeviceName getDailyDeviceName() {
		return dailyDeviceName;
	}

	public void setDailyDeviceName(DailyDeviceName dailyDeviceName) {
		this.dailyDeviceName = dailyDeviceName;
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
		DailySpareNorm other = (DailySpareNorm) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SpareNorm [id=" + id + ", deviceName=" + dailyDeviceName
				+ ", normValue=" + normValue + ", remark=" + remark + "]";
	}
	
}




