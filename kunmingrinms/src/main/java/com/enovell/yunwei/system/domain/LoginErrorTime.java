
/**   
 * 文件名：LoginErrorTime.java    
 * 版本信息：IRMS1.0   
 * 日期：2019-5-29 上午11:14:20   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.system.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：LoginErrorTime   
 * 类描述:  登录错误次数日志实体
 * 创建人：zhouxy
 * 创建时间：2019-5-29 上午11:14:20
 * 修改人：zhouxy 
 * 修改时间：2019-5-29 上午11:14:20   
 *    
 */
@Entity
@Table(name = "ENO_LOGIN_ERROR_TIME")
public class LoginErrorTime implements Serializable{

	private static final long serialVersionUID = -8330361308057096151L;

	private String id;
	
	/**
	 * 登录人名称
	 */
	private String userName;
	
	/**
	 * 登录时间
	 */
	private Date loginTime;
	
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

	@Column(name = "USER_NAME_")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Temporal(value = TemporalType.TIMESTAMP)
	@Column(name = "LOGIN_TIME_")
	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	
}
