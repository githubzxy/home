package com.enovell.yunwei.technical.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：TechnicalInfo   
 * 类描述:  技术图纸
 * 创建人：lidt 
 * 创建时间：2016-11-25 上午9:53:11
 * 修改人：lidt 
 * 修改时间：2016-11-25 上午9:53:11   
 *
 */
@Entity
@Table(name = "TECHNICALINFO")
public class TechnicalInfo implements Serializable {

	private static final long serialVersionUID = -3795784600825007860L;

	/**
	 * 技术资料
	 */
	public static final Integer TACHNICAL = 1;

	/**
	 * 竣工资料
	 */
	public static final Integer COMPLETION = 2;

	private String id;

	/**
	 * 1 技术资料 2 竣工资料
	 */
	private Integer type;

	/**
	 * 资料名称
	 */
	private String name;

	/**
	 * 资料类别
	 */
	private Integer technicalInfoType;

	/**
	 * 施工地点
	 */
	private String address;

	/**
	 * 所属部门
	 */
	private Organization depart;

	/**
	 * 线别
	 */
	private String railLineId;

	/**
	 * 备注
	 */
	private String remark;

	/**
	 * 竣工时间
	 */
	private Date completionDate;

	/**
	 * 创建日期
	 */
	private Date createDate;

	/**
	 * 修改日期
	 */
	private Date updateDate;

	/**
	 * 创建人
	 */
	private User createUser;

	/**
	 * 修改人
	 */
	private User updateUser;

	/**
	 * 附件
	 */
	private AttachFile attachFile;
	
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	
	private Boolean exist = DataExistStatus.EXIST;

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(name = "ID_")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	@Column(name = "EXIST_")
	public boolean isExist() {
		return exist;
	}
	public void setExist(boolean exist) {
		this.exist = exist;
	}
	
	@Column(name = "TYPE_", length = 1)
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "NAME_")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "technical_Info_Type_id")
	public Integer getTechnicalInfoType() {
		return technicalInfoType;
	}

	public void setTechnicalInfoType(Integer technicalInfoType) {
		this.technicalInfoType = technicalInfoType;
	}

	@Column(name = "ADDRESS_")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DEPART_ID")
	public Organization getDepart() {
		return depart;
	}

	public void setDepart(Organization depart) {
		this.depart = depart;
	}

	@Column(name = "RAILLINE_ID")
	public String getRailLineId() {
		return railLineId;
	}

	public void setRailLineId(String railLineId) {
		this.railLineId = railLineId;
	}

	@Column(name = "REMARK_")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "COMPLETIONDATE_")
	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATEDATE_")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "UPDATEDATE_")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CREATEUSER_")
	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "UPDATEUSER_")
	public User getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ATTACHFILE_")
	public AttachFile getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(AttachFile attachFile) {
		this.attachFile = attachFile;
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
		TechnicalInfo other = (TechnicalInfo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
