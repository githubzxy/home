package com.enovell.yunwei.friend.domain;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：FriendGroup   
 * 类描述: 好友组实体类 
 * 创建人：lidt 
 * 创建时间：2016-11-30 上午10:08:50
 * 修改人：lidt 
 * 修改时间：2016-11-30 上午10:08:50   
 *
 */
@Entity
@Table(name = "FRIEND_GROUP_")
public class FriendGroup implements Serializable {

	private static final long serialVersionUID = 1861146409293240913L;

	/**
	 * 主键ID
	 */
	private String id;

	/**
	 * 好友组序号
	 */
	private int sn;

	/**
	 * 好友组所属人
	 */
	private User belongUser;

	/**
	 * 好友组名称
	 */
	private String name;

	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	private Boolean exist = DataExistStatus.EXIST;

	@Id
	@Column(name = "ID_", length = 32)
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "SN_")
	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	@ManyToOne()
	@JoinColumn(name = "BELONG_USER_")
	public User getBelongUser() {
		return belongUser;
	}

	public void setBelongUser(User belongUser) {
		this.belongUser = belongUser;
	}

	@Column(name = "NAME_")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "EXIST_")
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}

}
