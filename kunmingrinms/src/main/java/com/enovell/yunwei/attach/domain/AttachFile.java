package com.enovell.yunwei.attach.domain;


/**
 * 
 */

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * 
 * 
 * 项目名称：kunmingrinms
 * 类名称：AttachFile.java
 * 类描述:  轻量化附件上传模型的主实体(包含多个子文件)
 * 创建人：潘忠瑞
 * 创建时间：2014-10-22
 * 修改人：潘忠瑞
 * 修改时间：2014-10-22 
 *
 */
@Entity
@Table(name="ATTACH_FILE")
public class AttachFile {
	/**
	 * 主键
	 */
	private String id;
	/**
	 * 文件
	 */
	private Set<UploadFile> files;
	/**
	 * 上传人
	 */
	private String createUser;
	/**
	 * 上传时间
	 */
	private Date createTime;
	
	@Id
	@Column(name = "ID_")
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid" , strategy = "uuid")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="attachFile")
	public Set<UploadFile> getFiles() {
		return files;
	}
	public void setFiles(Set<UploadFile> files) {
		this.files = files;
	}
	
	@Column(name="CREATEUSER_")
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
	@Temporal(value=TemporalType.TIMESTAMP)
	@Column(name="CREATETIME_")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
