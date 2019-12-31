package com.enovell.yunwei.friend.dto;

import com.enovell.yunwei.friend.domain.FriendGroup;

import java.io.Serializable;

public class FriendDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4229311863832303142L;
	
	/**
	 * 所属好友组
	 */
	private FriendGroup friendGroup;

	public FriendGroup getFriendGroup() {
		return friendGroup;
	}

	public void setFriendGroup(FriendGroup friendGroup) {
		this.friendGroup = friendGroup;
	}
	
	
}
