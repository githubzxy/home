package com.enovell.yunwei.emergencyOrg.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.enovell.yunwei.util.DataExistStatus;

/**
 * 应急机构
 */
@Entity
@Table(name = "EMERGRNCYORG")
public class EmergencyOrg implements Serializable{
	
	
	private static final long serialVersionUID = 1114527328149597231L;
	
	
	private String id;
	
	/**
	 * 机构名称
	 */
	private String name;
	
	/**
	 * 父机构
	 */
	private EmergencyOrg parent;
	
	/**
	 * 子机构
	 */
	private Set<EmergencyOrg> children = new HashSet<EmergencyOrg>();
	
	/**
	 * 机构序号
	 */
	private int sn;
	
	/**
	 * 判断节点类型（false 不是叶子节点 true 是叶子节点）
	 */
	private boolean isLeaf;
	
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

	@Column(name = "EXIST_")
	public boolean isExist() {
		return exist;
	}
	public void setExist(boolean exist) {
		this.exist = exist;
	}
	
	@Column(name = "NAME_")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "EMERGENCYORGID_")
	public EmergencyOrg getParent() {
		return parent;
	}

	public void setParent(EmergencyOrg parent) {
		this.parent = parent;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
	public Set<EmergencyOrg> getChildren() {
		return children;
	}

	public void setChildren(Set<EmergencyOrg> children) {
		this.children = children;
	}
	
	@Column(name = "SN_")
	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}
	
	@Transient
	public boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(boolean isLeaf) {
		this.isLeaf= isLeaf;
	}

	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof EmergencyOrg)) {
            return false;
        }
		EmergencyOrg other = (EmergencyOrg) object;
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
