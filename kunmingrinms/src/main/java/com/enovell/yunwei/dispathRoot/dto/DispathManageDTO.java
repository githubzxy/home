package com.enovell.yunwei.dispathRoot.dto;

import com.enovell.system.common.domain.User;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathManageDTO   
 * 类描述:  查询DTO
 * 创建人：lidt 
 * 创建时间：2016-12-7 上午9:18:22
 * 修改人：lidt 
 * 修改时间：2016-12-7 上午9:18:22   
 *
 */
public class DispathManageDTO implements Serializable {
	
	private static final long serialVersionUID = -7748420857726231587L;
	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 命令号
	 */
	private String dispatchNum;
	/**
	 * 状态
	 */
	private String status;
	/**
	 * 所属人
	 */
	private User user;
	/**
	 * 创建时间开始
	 */
	private Date createDateStart;
	/**
	 * 创建时间结束
	 */
	private Date createDateEnd;
	
	/**
	 * 发令时间(根调令)
	 */
	private Date sendDateStartByRoot;
	
	/**
	 * 发令时间(根调令)
	 */
	private Date sendDateEndByRoot;
	
	/**
	 * 发送时间开始
	 */
	private Date sendDateStart;
	/**
	 * 发送时间结束
	 */
	private Date sendDateEnd;
	
	/**
	 * 是否是根
	 */
	private String isRoot;
	/**
	 * 抄送人
	 */
	private User copyUser;
	
	/**
	 * 受令人单位ID(用于车间主任待办)
	 */
	private String userOrgId;
	
	/**
	 * 是否超期 1_超期 2_未超期 ""_全部
	 */
	private String overTimeStatus;
	
	public String getOverTimeStatus() {
		return overTimeStatus;
	}

	public void setOverTimeStatus(String overTimeStatus) {
		this.overTimeStatus = overTimeStatus;
	}

	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getCreateDateStart() {
		return createDateStart;
	}
	public void setCreateDateStart(Date createDateStart) {
		this.createDateStart = createDateStart;
	}
	public Date getCreateDateEnd() {
		return createDateEnd;
	}
	public void setCreateDateEnd(Date createDateEnd) {
		this.createDateEnd = createDateEnd;
	}
	public String getIsRoot() {
		return isRoot;
	}
	public void setIsRoot(String isRoot) {
		this.isRoot = isRoot;
	}
	public Date getSendDateStart() {
		return sendDateStart;
	}
	public void setSendDateStart(Date sendDateStart) {
		this.sendDateStart = sendDateStart;
	}
	public Date getSendDateEnd() {
		return sendDateEnd;
	}
	public void setSendDateEnd(Date sendDateEnd) {
		this.sendDateEnd = sendDateEnd;
	}
	public User getCopyUser() {
		return copyUser;
	}
	public void setCopyUser(User copyUser) {
		this.copyUser = copyUser;
	}
	public String getDispatchNum() {
		return dispatchNum;
	}
	public void setDispatchNum(String dispatchNum) {
		this.dispatchNum = dispatchNum;
	}
	public String getUserOrgId() {
		return userOrgId;
	}
	public void setUserOrgId(String userOrgId) {
		this.userOrgId = userOrgId;
	}
	public Date getSendDateStartByRoot() {
		return sendDateStartByRoot;
	}
	public void setSendDateStartByRoot(Date sendDateStartByRoot) {
		this.sendDateStartByRoot = sendDateStartByRoot;
	}
	public Date getSendDateEndByRoot() {
		return sendDateEndByRoot;
	}
	public void setSendDateEndByRoot(Date sendDateEndByRoot) {
		this.sendDateEndByRoot = sendDateEndByRoot;
	}
	
}
