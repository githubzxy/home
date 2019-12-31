package com.enovell.yunwei.onduty.dto;

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

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.DataExistStatus;


/**
 * 值班
 * @author zlt
 * @date 2013-2-4下午3:45:27
 */

public class OnDutyNew implements Serializable{
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
	private String dutyDate;
	
	/**
	 * 创建日期
	 */
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
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getDutyDate()  {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");		
		return dutyDate;
	}
	public void setDutyDate(String dutyDate) {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");		
		this.dutyDate = dutyDate;
	}
	
	
	public Date getCreatDate() {
		return creatDate;
	}
	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}
	
	
	public User getCreatUser() {
		return creatUser;
	}
	public void setCreatUser(User creatUser) {
		this.creatUser = creatUser;
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	public String getFixedNum() {
		return fixedNum;
	}
	public void setFixedNum(String fixedNum) {
		this.fixedNum = fixedNum;
	}
	
	
	public String getCellPhoneNum() {
		return cellPhoneNum;
	}
	public void setCellPhoneNum(String cellPhoneNum) {
		this.cellPhoneNum = cellPhoneNum;
	}
	
	
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	
	
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}
	
	
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof OnDutyNew)) {
            return false;
        }
		OnDutyNew other = (OnDutyNew) object;
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
