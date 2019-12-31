
/**   
 * 文件名：TaskRootHistory.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-15 下午12:20:02   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.domain;

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


/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootHistory   
 * 类描述:  历史任务 实体
 * 创建人：ltf 
 * 创建时间：2016-12-15 下午12:20:02
 * 修改人：ltf
 * 修改时间：2016-12-15 下午12:20:02   
 *    
 */
@Entity
@Table(name="TASKROOT_HISTORY")
public class TaskRootHistory implements Serializable {
	
	private static final long serialVersionUID = 6811748335500343622L;

	/**
	 * 主键
	 */
	private String id;
	
	/**
	 * 完成时间
	 */
	private Date finishDate;
	
	/**
	 * 任务开始状态
	 */
	private String beginStatus;
	
	/**
	 * 结束状态
	 */
	private String endStatus;
	
	/**
	 * 任务
	 */
	private TaskRoot task;
	
	/**
	 * 办理人
	 */
	private User transactUser;
	
	/**
	 * 备注
	 */
	private String remarks;

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

	@Column(name="FINISHDATE_")
	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	@Column(name="BEGINSTATUS_")
	public String getBeginStatus() {
		return beginStatus;
	}

	public void setBeginStatus(String beginStatus) {
		this.beginStatus = beginStatus;
	}

	@Column(name="ENDSTATUS_")
	public String getEndStatus() {
		return endStatus;
	}

	public void setEndStatus(String endStatus) {
		this.endStatus = endStatus;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="TASKID_")
	public TaskRoot getTask() {
		return task;
	}

	public void setTask(TaskRoot task) {
		this.task = task;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="TRANSACTUSERID_")
	public User getTransactUser() {
		return transactUser;
	}

	public void setTransactUser(User transactUser) {
		this.transactUser = transactUser;
	}
	
	@Column(name = "REMARKS_")
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof TaskRootHistory)) {
            return false;
        }
		TaskRootHistory other = (TaskRootHistory) object;
		if(id != null && other.getId() != null && id.equals(other.getId())){
			return true;
		}
		return false;
	}
	
	@Override
	public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
	}

	@Override
	public String toString() {
		return "TaskRootHistory [id=" + id + ", finishDate=" + finishDate
				+ ", beginStatus=" + beginStatus + ", endStatus=" + endStatus
				+ ", task=" + task + ", transactUser=" + transactUser
				+ ", remarks=" + remarks + "]";
	}
	
}





