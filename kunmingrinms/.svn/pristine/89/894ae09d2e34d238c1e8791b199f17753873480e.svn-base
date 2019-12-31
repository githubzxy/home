
/**   
 * 文件名：Login.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-5-16 上午11:14:20   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.system.domain;

import com.enovell.system.common.domain.Organization;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**      
 * 项目名称：kunmingrinms
 * 类名称：Login   
 * 类描述:  登录日志实体
 * 创建人：lidt 
 * 创建时间：2017-5-16 上午11:14:20
 * 修改人：lidt 
 * 修改时间：2017-5-16 上午11:14:20   
 *    
 */
@Entity
@Table(name = "ENO_LOGIN")
public class Login implements Serializable{

	private static final long serialVersionUID = -6044084370258965469L;

	/**
	 * 登录日志id
	 */
	private String id;

	/**
	 * 组织结构
	 */
	private Organization org;
	
	/**
	 * 操作人
	 */
	private String userName;
	
	/**
	 * 内容
	 */
	private String content;

	/**
	 * 操作时间
	 */
	private Date operationTime;

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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORG_ID_")
	public Organization getOrg() {
		return org;
	}

	public void setOrg(Organization org) {
		this.org = org;
	}

	@Column(name = "USERNAME_")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "CONTENT_")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(value = TemporalType.TIMESTAMP)
	@Column(name = "OPERATION_TIME_")
	public Date getOperationTime() {
		return operationTime;
	}

	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}
	
}
