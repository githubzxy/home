package com.enovell.yunwei.attach.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;


/**
 * 
 * 
 * 项目名称：kunmingrinms
 * 类名称：UploadFile.java
 * 类描述:  轻量化附件上传的子文件模型
 * 创建人：潘忠瑞
 * 创建时间：2014-10-22
 * 修改人：潘忠瑞
 * 修改时间：2014-10-22 
 *
 */
@Entity
@Table(name = "PROJECT_FILE")
public class UploadFile {

	/**
	 * 主键id
	 */
	private String id;

	/**
	 * 文件名称
	 */
	private String name;

	/**
	 * 存储路径
	 */
	private String path;
	/**
	 * 附件
	 */
	@JsonIgnore
	private AttachFile attachFile;

	/**
	 * 上传时间
	 */
	private Date date;

	@Id
	@Column(name = "ID_")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name="NAME_")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="PATH_")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Temporal(value = TemporalType.TIMESTAMP)
	@Column(name="date_")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ATTACH_FILE_")
	public AttachFile getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(AttachFile attachFile) {
		this.attachFile = attachFile;
	}
}
