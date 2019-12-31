
/**   
 * 文件名：LoginDTO.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-5-16 下午1:30:04   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.system.dto;

import java.io.Serializable;
import java.util.Date;

/**      
 * 项目名称：kunmingrinms
 * 类名称：LoginDTO   
 * 类描述:  登录日志DTO
 * 创建人：lidt 
 * 创建时间：2017-5-16 下午1:30:04
 * 修改人：lidt 
 * 修改时间：2017-5-16 下午1:30:04   
 *    
 */

public class LoginDTO implements Serializable{

	private static final long serialVersionUID = 8874949778448529191L;
	
	/**
	 * 组织机构ID
	 */
	private String orgId;
	
	/**
	 * 组织结构名
	 */
	private String orgName;

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

	/**
	 * 操作时间(开始时间)
	 */
	private String startTime;

	/**
	 * 操作时间(结束时间)
	 */
	private String endTime;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getOperationTime() {
		return operationTime;
	}

	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}

	
}
