package com.enovell.yunwei.onduty.domain;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.DataExistStatus;


/**
 * 值班
 * @author panzr
 * @date 2013-2-4下午3:45:27
 */
@Entity
@Table(name="ONDUTY")
public class OnDuty implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2504680111174549416L;
	
	/**
	 * id
	 */
	private String id;

	/**
	 * 值班时间
	 */
//	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dutyDate;
	
	/**
	 * 创建日期
	 */
//	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date creatDate;
	/**
	 * 创建人
	 */
	private User creatUser;
	
	/**
	 * 值班人
	 */
	private User user;
	/**
	 * 固定电话号码
	 */
	private String fixedNum;
	/**
	 * 手机号码
	 */
	private String cellPhoneNum;
	
	/**
	 * 值班情况汇报
	 */
	private String situation;
	
	/**
	 * 值班日期的星期编号
	 */
	private String week;
	
	/**
	 * 汇报状态
	 * 1-未汇报 2-已汇报
	 */
	private String status;
	
	/**
	 * 汇报时间
	 */
	private Date reportDate;
	
	/**
	 * 备注
	 */
	private String remarks;
	
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	private Boolean exist = DataExistStatus.EXIST;
	
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
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DUTYDATE_")
	public Date getDutyDate()  {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");		
		return dutyDate;
	}
	public void setDutyDate(Date dutyDate) {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");		
		this.dutyDate = dutyDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATDATE_")
	public Date getCreatDate() {
		return creatDate;
	}
	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="CREATUSERID_")
	public User getCreatUser() {
		return creatUser;
	}
	public void setCreatUser(User creatUser) {
		this.creatUser = creatUser;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="USERID_")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "FIXEDNUM_")
	public String getFixedNum() {
		return fixedNum;
	}
	public void setFixedNum(String fixedNum) {
		this.fixedNum = fixedNum;
	}
	
	@Column(name = "CELLPHONENUM_")
	public String getCellPhoneNum() {
		return cellPhoneNum;
	}
	public void setCellPhoneNum(String cellPhoneNum) {
		this.cellPhoneNum = cellPhoneNum;
	}
	
	@Column(name = "SITUATION_",length = 1000)
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	
	@Column(name = "WEEK_")
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	
	@Column(name = "STATUS_")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "REPORTDATE_")
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	
	@Column(name = "REMARKS_")
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@Column(name = "EXIST_")
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}
	
	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof OnDuty)) {
            return false;
        }
		OnDuty other = (OnDuty) object;
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
