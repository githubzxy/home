package com.enovell.yunwei.deviceUnitConfig.domain;

import com.enovell.yunwei.util.DataExistStatus;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DeviceUnitConfig   
 * 类描述:  应急备品单位实体
 * 创建人：yangsy
 * 创建时间：2017-5-27 下午3:28:42
 *
 */
@Entity
@Table(name = "DEVICEUNIT_")
public class DeviceUnitConfig implements Serializable {
	 
	private static final long serialVersionUID = -8648617079635380921L;
	
	
	private Integer id;
	
	/**
	 * 单位名
	 */
	private String unit;
	
	
	
	private String remark;
	
	
	private Date createDate;
	
	
	private Boolean exist = DataExistStatus.EXIST;

	@Id
	@Column(name="ID_")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="UNIT_")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Column(name="REMARK_")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATEDATE_")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name="EXIST_")
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}
	
}
