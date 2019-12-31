/**   
 * 文件名：TaskShowDto.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-13 下午3:52:01   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.dto;

import java.io.Serializable;
import java.util.Date;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskShowDto   
 * 类描述:  任务管理 前台展示Dto
 * 创建人：ltf 
 * 创建时间：2016-12-13 下午3:52:01
 * 修改人：ltf
 * 修改时间：2016-12-13 下午3:52:01   
 *    
 */
public class TaskShowDto implements Serializable {

	private static final long serialVersionUID = 193189327071862894L;
	/**
	 * 草稿 1
	 */
	public static final int CAO_GAO = 1;
	/**
	 * 待接收 2
	 */
	public static final int DAI_JIE_SHOU = 2;
	/**
	 * 处理中 3
	 */
	public static final int CHU_LI_ZHONG = 3;
	/**
	 * 待归档 4
	 */
	public static final int DAI_GUI_DANG = 4;
	/**
	 * 已归档 5
	 */
	public static final int YI_GUI_DANG = 5;
	/**
	 * 待回复
	 */
	public static final int DAI_HUI_FU = 6;
	/**
	 * 已回复
	 */
	public static final int YI_HUI_FU = 7;
	/**
	 * 已退回
	 */
	public static final int YI_TUI_HUI = 8;
	/**
	 * 已分派
	 */
	public static final int YI_FEN_PAI = 9;
	/**
	 * 待审核
	 */
	public static final int DAI_SHEN_HE = 10;
	/**
	 * 审核通过
	 */
	public static final int SHEN_HE_TONG_GUO = 11;
	/**
	 * 审核不通过
	 */
	public static final int SHEN_HE_BU_TONG_GUO = 12;

	/**
	 * 任务id
	 */
	private String id;

	/**
	 * 任务标题
	 */
	private String title;

	/**
	 * 紧急程度
	 */
	private Integer taskLevel;

	/**
	 * 任务类别
	 */
	private Integer taskType;

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
	private Date sendDate;

	/**
	 * 完成期限
	 */
	private Date limitTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getTaskLevel() {
		return taskLevel;
	}

	public void setTaskLevel(Integer taskLevel) {
		this.taskLevel = taskLevel;
	}

	public Integer getTaskType() {
		return taskType;
	}

	public void setTaskType(Integer taskType) {
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

}
