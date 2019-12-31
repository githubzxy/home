package com.enovell.yunwei.dispathRoot.domain;

import com.enovell.system.common.domain.User;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispatchRootHistory   
 * 类描述:  历史调令记录
 * 创建人：lidt 
 * 创建时间：2016-12-7 上午9:15:56
 * 修改人：lidt 
 * 修改时间：2016-12-7 上午9:15:56   
 *
 */
@Entity
@Table(name="DISPATCHROOT_HISTORY")
public class DispatchRootHistory implements Serializable {

	private static final long serialVersionUID = -8697537073207487664L;

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
	 * 调度
	 */
	private DispathRoot dispatchRoot;
	
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
	@JoinColumn(name="DISPATCHROOT_ID_")
	public DispathRoot getDispatchRoot() {
		return dispatchRoot;
	}

	public void setDispatchRoot(DispathRoot dispatchRoot) {
		this.dispatchRoot = dispatchRoot;
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
		if (!(object instanceof DispatchRootHistory)) {
            return false;
        }
		DispatchRootHistory other = (DispatchRootHistory) object;
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
}
