package com.enovell.yunwei.system.dto;

import java.io.Serializable;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：UserToRoleDTO   
 * 类描述:  用户角色页面展示DTO
 * 创建人：lidt 
 * 创建时间：2017-3-27 上午10:31:42
 * 修改人：lidt 
 * 修改时间：2017-3-27 上午10:31:42   
 *
 */
public class UserToRoleDTO implements Serializable{

	private static final long serialVersionUID = -3840693461794166913L;
	
	/**
	 * 用户Id
	 */
	private String userId;
	
	/**
	 * 组织机构Id
	 */
	private String orgId;
	
	/**
	 * 用户名
	 */
	private String userName;
	
	/**
	 * 组织机构
	 */
	private String orgName;
	
	/**
	 * 角色
	 */
	private String roleName;
	
	/**
	 * 固定电话
	 */
	private String telephoneNumber;

	/**
	 * 联系电话
	 */
	private String phone;
	
	/**
	 * 备注
	 */
	private String remark;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	public String getTelephoneNumber() {
		return telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
