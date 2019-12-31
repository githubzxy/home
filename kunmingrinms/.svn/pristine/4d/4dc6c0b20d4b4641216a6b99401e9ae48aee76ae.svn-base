package com.enovell.yunwei.emergencyOrg.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.enovell.system.common.domain.Position;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 应急人员
 */
@Entity //表示该JavaBean为一个实体Bean
@Table(name = "EMERGENCYUSER") //标识该实体Bean映射到数据库中的哪张表
public class EmergencyUser implements Serializable{
	
	
	private static final long serialVersionUID = -6205404399485294319L;
	
	
	private String id;
	
	/**
	 * 姓名
	 */
	private String name;
	
	/**
	 * 办公电话
	 */
	private String officeTelephone;
	
	/**
	 * 手机号码
	 */
	private String mobileNumber;
	
	/**
	 * 岗位
	 */
	private Position position;
	
	/**
	 * 职能
	 */
	private String post;
	
	/**
	 * 所属应急机构
	 */
	private EmergencyOrg emergencyOrg;
	
	/**
	 * 应急人员
	 */
	private User user;
	
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	
	private Boolean exist = DataExistStatus.EXIST;

	
	@Id //标识该字段为主键
	@Column(name="ID_") //映射到数据库中的ID_字段
	@GeneratedValue(generator="system-uuid") //主键的生成策略
	@GenericGenerator(name="system-uuid",strategy="uuid")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "EXIST_")
	public boolean isExist() {
		return exist;
	}
	public void setExist(boolean exist) {
		this.exist = exist;
	}

	@Column(name="NAME_")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="OFFICETELEPHONE_")
	public String getOfficeTelephone() {
		return officeTelephone;
	}

	public void setOfficeTelephone(String officeTelephone) {
		this.officeTelephone = officeTelephone;
	}

	@Column(name="MOBILENUMBER_")
	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="POSITIONID_")
	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	@Column(name="POSTID_")
	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="EMERGENCYORGID_")
	public EmergencyOrg getEmergencyOrg() {
		return emergencyOrg;
	}

	public void setEmergencyOrg(EmergencyOrg emergencyOrg) {
		this.emergencyOrg = emergencyOrg;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="USER_ID_")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof EmergencyUser)) {
            return false;
        }
		EmergencyUser other = (EmergencyUser) object;
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
