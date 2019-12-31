
/**   
 * 文件名：FileSystem.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-4-22 上午10:42:00   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.fileSystem.domain;

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
 * 类名称：FileSystem   
 * 类描述:  文件系统
 * 创建人：zhangsihong
 * 创建时间：2013-4-22 上午10:42:00
 * 修改人：zhangsihong 
 * 修改时间：2013-4-22 上午10:42:00   
 *    
 */
@Entity
@Table(name = "FILESYSTEM")
public class FileSystem implements Serializable {
	   
	private static final long serialVersionUID = -172709081848559289L;

	/**
	 * 不细化
	 */
	public static final String DETAILING_NO = "0";
	
	/**
	 * 细化
	 */
	public static final String DETAILING_YES = "1";
	
	
	
	private String id;
	
	/**
	 * 文件名称
	 */
	private String fileName;
	
	/**
	 * 文件类型
	 */
	private String fileType;
	
	/**
	 * 适用范围
	 */
	private Integer fileSuitableRange;
	
	/**
	 * 有效时间
	 */
	private Integer fileValidTime;
	
	/**
	 * 是否细化(不细化：0（false）， 细化：1（true）)
	 */
	private Boolean isDetailing;
	
	/**
	 * 所属部门
	 */
	private Organization organization;
	
	/**
	 * 创建人
	 */
	private User createUser;
	
	/**
	 * 创建时间
	 */
	private Date createDate;
	
	/**
	 * 修改时间
	 */
	private Date updateDate;
	
	/**
	 * 备注
	 */
	private String remark;
	
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
	
	
	@Column(name = "FILENAME_")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "FILETYPE_")
	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	@Column(name = "FILE_SUITABLE_RANGE_ID")
	public Integer getFileSuitableRange() {
		return fileSuitableRange;
	}

	public void setFileSuitableRange(Integer fileSuitableRange) {
		this.fileSuitableRange = fileSuitableRange;
	}

	@Column(name = "FILE_VALID_TIME_ID")
	public Integer getFileValidTime() {
		return fileValidTime;
	}

	public void setFileValidTime(Integer fileValidTime) {
		this.fileValidTime = fileValidTime;
	}

	@Column(name = "IS_DETAILING_")
	public Boolean getIsDetailing() {
		return isDetailing;
	}

	public void setIsDetailing(Boolean isDetailing) {
		this.isDetailing = isDetailing;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORGANIZATION_ID")
	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CREATEUSER_ID")
	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
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

	@Column(name = "REMARK_")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ATTACHFILE_ID")
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
		FileSystem other = (FileSystem) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
