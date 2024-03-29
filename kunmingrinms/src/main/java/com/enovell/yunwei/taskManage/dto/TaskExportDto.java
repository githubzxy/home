
/**   
 * 文件名：TaskExportDto.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-26 下午10:31:00   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.dto;

import java.io.Serializable;
import java.util.Date;


/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskExportDto   
 * 类描述:  任务导出Excel Dto
 * 创建人：ltf 
 * 创建时间：2016-12-26 下午10:31:00
 * 修改人：ltf
 * 修改时间：2016-12-26 下午10:31:00   
 *    
 */

public class TaskExportDto  implements Serializable {
	
	
	private static final long serialVersionUID = 6774577875528989214L;

	/**
	 * 任务标题
	 */
	private String title;
	
	/**
	 * 紧急程度
	 */
	private String taskLevel;
	
	/**
	 * 任务类别
	 */
	private String taskType;
	
	/**
	 * 联系人
	 */
	private String linkman;
	
	
	/**
	 * 状态
	 */
	private String status;
	
	/**
	 * 派发单位
	 */
	private String org;
	
	/**
	 * 派发时间
	 */
	private Date  sendDate;
	
	/**
	 * 完成期限
	 */
	private Date  limitTime;
	
	/**
	 * 受令人单位(用于车间主任)
	 */
	private String ownerOrg;
	
	/**
	 * 受令人(用于车间主任)
	 */
	private String owner;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTaskLevel() {
		return taskLevel;
	}

	public void setTaskLevel(String taskLevel) {
		this.taskLevel = taskLevel;
	}

	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public Date getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	@Override
	public String toString() {
		return "TaskExportDto [title=" + title + ", taskLevel=" + taskLevel
				+ ", taskType=" + taskType + ", linkman=" + linkman
				+ ", status=" + status + ", org=" + org + ", sendDate="
				+ sendDate + ", limitTime=" + limitTime + "]";
	}

	public String getOwnerOrg() {
		return ownerOrg;
	}

	public void setOwnerOrg(String ownerOrg) {
		this.ownerOrg = ownerOrg;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
}
