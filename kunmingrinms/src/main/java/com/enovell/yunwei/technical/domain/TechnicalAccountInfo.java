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
 * 项目名称：kunmingrinms
 * 类名称：TechnicalAccountInfo   
 * 类描述:  技术台账实体
 * 创建人：yangsy 
 * 创建时间：2016-11-25 
 */
@Entity
@Table(name="TECHNICALACCOUNTINFO")
public class TechnicalAccountInfo implements Serializable{

	private static final long serialVersionUID = 7415154198146262178L;
	
	
	private String id;
	
	/**
	 * 台账名称
	 */
	private String name;
	
	/**
	 * 台账类别
	 */
	private Integer type;
	
	/**
	 * 施工地点
	 */
	private String address;
	
	/**
	 * 所属部门
	 */
	private Organization depart;
	
	/**
	 * 备注
	 */
	private String remark;
	
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
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name="system-uuid",strategy="uuid")
	@Column(name="ID_")
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


	@Column(name="NAME_")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "TYPE_ID_")
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	@Column(name="ADDRESS_")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DEPART_ID_")
	public Organization getDepart() {
		return depart;
	}

	public void setDepart(Organization depart) {
		this.depart = depart;
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

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="UPDATEDATE_")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="CREATEUSER_")
	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="UPDATEUSER_")
	public User getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ATTACHFILE_")
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
		TechnicalAccountInfo other = (TechnicalAccountInfo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
