package com.enovell.yunwei.accident.domain;

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

import org.hibernate.annotations.GenericGenerator;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 项目名称：kunmingrinms
 * 类名称：Accident   
 * 类描述:  事故演练计划实体
 * 创建人：yangsy 
 * 创建时间：2016-12-15 
 */

@Entity
@Table(name="ACCIDENT_")
public class Accident implements Serializable {
	
	
	private static final long serialVersionUID = 3796736546980449496L;

	/**
	 * 主键id
	 */
	private String id;
	/**
	 * 计划名称
	 */
	private String name;
	/**
	 * 创建人
	 */
	private User user;
	/**
	 * 创建时间
	 */
	private Date time;
	/**
	 * 附件
	 */
	private AttachFile attachFile;
	
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	
	private Boolean exist=DataExistStatus.EXIST;
	
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
	
	@Column(name = "NAME_")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USER_")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "TIME_")
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ATTACH_FILE_")
	public AttachFile getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(AttachFile attachFile) {
		this.attachFile = attachFile;
	}
	
}
