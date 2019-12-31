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

import com.enovell.system.common.domain.Organization;
import com.enovell.yunwei.attach.domain.AttachFile;


/**
 * 项目名称：kunmingrinms
 * 类名称：AccidentShop   
 * 类描述:  事故演练计划实体
 * 创建人：yangsy 
 * 创建时间：2016-12-15 
 */
@Entity
@Table(name="ACCIDENT_SHOP_")
public class AccidentShop implements Serializable {
	
	
	private static final long serialVersionUID = -2385746059604525915L;

	/**
	 * 主键ID
	 */
	private String id;

	/**
	 * 总结
	 */
	private String content;
	
	/**
	 * 附件
	 */
	private AttachFile attachFile;
	
	/**
	 * 回复时间
	 */
	private Date  replyTime;
	
	/**
	 * 执行部门
	 */
	private Organization org;
	
	/**
	 * 所属应急
	 */
	private Accident accident;

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
	@Column(name = "CONTENT_")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ATTACHFILE_")
	public AttachFile getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(AttachFile attachFile) {
		this.attachFile = attachFile;
	}
	
	@Column(name = "REPLYTIME_")
	public Date getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORG_")
	public Organization getOrg() {
		return org;
	}
	public void setOrg(Organization org) {
		this.org = org;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACCIDENT_")
	public Accident getAccident() {
		return accident;
	}
	public void setAccident(Accident accident) {
		this.accident = accident;
	}
	
}
