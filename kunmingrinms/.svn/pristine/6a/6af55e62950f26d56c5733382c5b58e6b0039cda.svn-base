package com.enovell.yunwei.friend.domain;

import com.enovell.system.common.domain.User;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：Friend   
 * 类描述:  好友实体类
 * 创建人：lidt 
 * 创建时间：2016-11-30 上午10:07:22
 * 修改人：lidt 
 * 修改时间：2016-11-30 上午10:07:22   
 *
 */
@Entity
@Table(name = "FRIEND_")
public class Friend implements Serializable {

	private static final long serialVersionUID = -4531880164754998150L;

	/**
	 * 主键ID
	 */
	private String id;

	/**
	 * 所属好友组
	 */
	private FriendGroup friendGroup;

	/**
	 * 好友序号
	 */
	private int sn;

	/**
	 * 好友信息
	 */
	private User user;

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

	@ManyToOne()
	@JoinColumn(name = "FRIEND_GROUP_")
	public FriendGroup getFriendGroup() {
		return friendGroup;
	}

	public void setFriendGroup(FriendGroup friendGroup) {
		this.friendGroup = friendGroup;
	}

	@Column(name = "SN_")
	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	@ManyToOne()
	@JoinColumn(name = "USER_")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Friend [id=" + id + ", friendGroup=" + friendGroup + ", sn="
				+ sn + ", user=" + user + "]";
	}

}
