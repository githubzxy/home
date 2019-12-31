package com.enovell.yunwei.userInfoManager.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Where;

import com.enovell.system.common.domain.Organization;

/**
 * 
 * 项目名称：kunmingrinmsFINAL
 * 类名称：User   
 * 类描述:  用户信息数据封装
 * 创建人：liwt
 * 创建时间：2018-11-28
 *
 */

@Entity
@Table(name = "USER_INFO")
@Where(clause="USER_DELSTATE_ = 1")
public class UserInfo implements Serializable{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7585337410352727363L;

	private String id;
	
	private Organization organization;
	
	private String name ;
	
	private String telephoneNumber;
	
	private String phone;
	
	private String remark;

	private Integer deleState;
	
//	private String password;
	
	private Date createTime;
	@Column(name="USER_REMARK_",
		    length=(int) 500)
	public String getRemark() {
		return remark;
	}
	@Column(name="USER_DELSTATE_",
		    length=(int) 1)
	public Integer getDeleState() {
		return deleState;
	}
	@Temporal(value=javax.persistence.TemporalType.TIMESTAMP)
	  @Column(name="USER_CREATE_TIME_",
	    length=(int) 7)
	public Date getCreateTime() {
		return createTime;
	}
	@Column(name="USER_TELPHONENUMBER_",
		    length=(int) 20)
	public String getTelephoneNumber() {
		return telephoneNumber;
	}
	@Column(name="USER_PHONE_",
		    length=(int) 20)
	public String getPhone() {
		return phone;
	}
	@Id
	@Column(name="USER_ID_",length=(int) 32)
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name="system-uuid",
		    strategy="uuid")
	public String getId() {
		return id;
	}
//	@Column(name="PASSWORD_",
//		    length=(int) 50)
//	public String getPassword() {
//		return password;
//	}
	@ManyToOne(fetch=javax.persistence.FetchType.LAZY)
	@JoinColumn(name="ORGANIZATION_ID_")
	public Organization getOrganization() {
		return organization;
	}
	@Column(name="USER_NAME_",
		    length=(int) 50)
	public String getName() {
		return name;
	}
//	public void setPassword(String password) {
//		this.password = password;
//	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public void setDeleState(Integer deleState) {
		this.deleState = deleState;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public void setName(String name) {
		this.name = name;
	}


	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
