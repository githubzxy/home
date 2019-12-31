package com.enovell.yunwei.friend.dto;

import com.enovell.system.common.domain.User;

import java.io.Serializable;

public class FriendGroupDTO implements Serializable {
	
	private static final long serialVersionUID = -7997520894523247677L;
	
	/**
	 * 人员
	 */
	private User user;
	
	/**
	 * 好友组名字
	 */
	private String text;
	
	/**
	 * 好友组id
	 */
	private String value;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
}
