
/**   
 * 文件名：SparePart.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-29 下午5:40:15   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.domain;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**      
 * 项目名称：kunmingrinms
 * 类名称：SparePart   
 * 类描述:  应急备品
 * 创建人：ltf 
 * 创建时间：2016-11-29 下午5:40:15
 * 修改人：ltf
 * 修改时间：2016-11-29 下午5:40:15   
 * 修改人：yangsy
 * 修改时间：2019-05-30 下午3:41:10
 */
@Entity
@Table(name = "SPAREPART")
public class SparePart implements Serializable {
	   
	private static final long serialVersionUID = -8456514918470173520L;

	/**
	 * 待审核
	 */
	final static public String NO_CHECK = "1";
	
	/**
	 * 审核通过
	 */
	final static public String CHECK_PASS = "2";
	
	/**
	 * 审核不通过
	 */
	final static public String CHECK_NOT_PASS = "3";
	
	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 板件名称（作为改动后的设备名称字段）
	 */
	private String platesName;
	
	/**
	 * 单位
	 */
	private String unit;
	
	/**
	 * 数量
	 */
	private Double amount;
	
	/**
	 * 设备类别
	 */
	private Integer speciality;
	
	/**
	 * 设备名称（废弃该字段）
	 */
	private DeviceName sparePartName;
	
	/**
	 * 规格型号
	 */
	private String sparePartModel;
	
	/**
	 * 所属车间
	 */
	private Organization workShop;
	
	/**
	 * 所属工区
	 */
	private Organization workArea;
	

	/**
	 * 备品类型
	 */
//	private SpareType spareType;
	
	/**
	 * 创建日期
	 */
	private Date createDate;
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
	 * 是否存在（true 存在 false 已被删除）
	 */
	private Boolean exist = DataExistStatus.EXIST;
	
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

	@Column(name = "PLATESNAME_",length = 128)
	public String getPlatesName() {
		return platesName;
	}

	public void setPlatesName(String platesName) {
		this.platesName = platesName;
	}
	
	@Column(name="UNIT_")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "AMOUNT_",precision=12, scale=2)
	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	@Column(name="SPECIALITYID_")
	public Integer getSpeciality() {
		return speciality;
	}

	public void setSpeciality(Integer speciality) {
		this.speciality = speciality;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="SPAREPARTNAMEID_")
	public DeviceName getSparePartName() {
		return sparePartName;
	}

	public void setSparePartName(DeviceName sparePartName) {
		this.sparePartName = sparePartName;
	}

	@Column(name = "SPARE_PART_MODEL_")
	public String getSparePartModel() {
		return sparePartModel;
	}

	public void setSparePartModel(String sparePartModel) {
		this.sparePartModel = sparePartModel;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="WORKSHOPID_")
	public Organization getWorkShop() {
		return workShop;
	}

	public void setWorkShop(Organization workShop) {
		this.workShop = workShop;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="WORKAREAID_")
	public Organization getWorkArea() {
		return workArea;
	}

	public void setWorkArea(Organization workArea) {
		this.workArea = workArea;
	}
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name="SPARETYPE_ID_")
//	public SpareType getSpareType() {
//		return spareType;
//	}
//
//	public void setSpareType(SpareType spareType) {
//		this.spareType = spareType;
//	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATEDATE_")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Column(name = "SPARE_PART_COMMENT_",length=4000)
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Column(name = "EXIST_")
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}
	
	@Column(name = "FACTORY_")
	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}
	
	@Column(name = "DEPOSIT_LOCATION_")
	public String getDepositLocation() {
		return depositLocation;
	}

	public void setDepositLocation(String depositLocation) {
		this.depositLocation = depositLocation;
	}

	@Column(name = "DEVICE_PROPERTIES_")
	public String getDeviceProperties() {
		return deviceProperties;
	}

	public void setDeviceProperties(String deviceProperties) {
		this.deviceProperties = deviceProperties;
	}

	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="BUY_DATE_")
	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	@Column(name="BUY_REASON_")
	public String getBuyReason() {
		return buyReason;
	}

	public void setBuyReason(String buyReason) {
		this.buyReason = buyReason;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="IN_DATE_")
	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	@Column(name="SOFTWARE_EDITION_")
	public String getSoftwareEdition() {
		return softwareEdition;
	}

	public void setSoftwareEdition(String softwareEdition) {
		this.softwareEdition = softwareEdition;
	}

	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof SparePart)) {
            return false;
        }
		SparePart other = (SparePart) object;
		if(getId() != null && other.getId() != null && getId().equals(other.getId())){
			return true;
		}
		return false;
	}
	
	@Override
	public int hashCode() {
        int hash = 0;
        hash += (getId() != null ? getId().hashCode() : 0);
        return hash;
	}

	@Column(name = "CHECK_STATUS_")
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CHECK_USER_ID")
	public User getCheckUser() {
		return checkUser;
	}

	public void setCheckUser(User checkUser) {
		this.checkUser = checkUser;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CHECK_DATE_")
	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	@Override
	public String toString() {
		return "SparePart [id=" + id + ", platesName=" + platesName + ", amount=" + amount + ", speciality="
				+ speciality + ", sparePartName=" + sparePartName + ", sparePartModel=" + sparePartModel + ", workShop="
				+ workShop + ", workArea=" + workArea + ", createDate=" + createDate + ", comment=" + comment
				+ ", factory=" + factory + ", depositLocation=" + depositLocation + ", deviceProperties="
				+ deviceProperties + ", checkStatus=" + checkStatus + ", checkUser=" + checkUser + ", checkDate="
				+ checkDate + ", exist=" + exist + "]";
	}
	
	
	
}
