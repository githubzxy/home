package com.enovell.yunwei.friend.service;

import com.enovell.yunwei.friend.domain.Friend;
import com.enovell.yunwei.friend.dto.FriendDTO;

import java.util.List;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：FriendService   
 * 类描述:  好友接口
 * 创建人：lidt 
 * 创建时间：2016-11-30 下午2:53:26
 * 修改人：lidt 
 * 修改时间：2016-11-30 下午2:53:26   
 *
 */
public interface FriendService {

	/**
	 * 添加好友
	 * 
	 * @param friend
	 */
	public void addFriend(Friend friend);

	/**
	 * 修改好友
	 * 
	 * @param friend
	 */
	public void updateFriend(Friend friend);

	/**
	 * 删除好友
	 * 
	 * @param friend
	 */
	public void deleteFriend(Friend friend);

	/**
	 * 删除好友组中好友
	 * 
	 * @param groupId
	 */
	public void deleteFriendByGroup(String groupId);

	/**
	 * 查询好友
	 * 
	 * @param fDTO
	 * @return
	 */
	public List<Friend> selectFriends(FriendDTO fDTO);

	/**
	 * 
	 * getFriendCount 获取好友记录数
	 * 
	 * @param fDTO
	 * @return
	 */
	public int getFriendCount(FriendDTO fDTO);
}
