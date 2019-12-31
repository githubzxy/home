package com.enovell.yunwei.friend.service;

import com.enovell.yunwei.friend.domain.Friend;
import com.enovell.yunwei.friend.domain.FriendGroup;
import com.enovell.yunwei.friend.dto.FriendGroupDTO;

import java.util.List;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：FriendGroupService   
 * 类描述:  好友组接口
 * 创建人：lidt 
 * 创建时间：2016-11-30 下午2:53:00
 * 修改人：lidt 
 * 修改时间：2016-11-30 下午2:53:00   
 *
 */
public interface FriendGroupService {

	/**
	 * 添加好友组
	 * 
	 * @param fg
	 */
	public void addFriendGroup(FriendGroup fg);

	/**
	 * 修改好友组
	 * 
	 * @param fg
	 */
	public void updateFriendGroup(FriendGroup fg);

	/**
	 * 修改好友组名称
	 * 
	 * @param fg
	 */
	public void updateFriendGroupName(FriendGroup fg);

	/**
	 * 批量修改
	 * 
	 * @param fgs
	 */
	public void updateFriendGroups(List<FriendGroup> fgs);

	/**
	 * 删除好友组
	 * 
	 * @param id
	 */
	public void deleteFriendGroup(String id, List<FriendGroup> friendG);

	/**
	 * 查询好友组
	 * 
	 * @param fgDTO
	 * @return
	 */
	public List<FriendGroup> selectFriendGroup(FriendGroupDTO fgDTO);

	/**
	 * 调整好友组中好友
	 * 
	 * @param friends
	 */
	public void changeFriendGroup(List<Friend> friends);

	/**
	 * 
	 * getFriendGroupDTOs 查询好友组
	 * 
	 * @param fgDTO
	 * @return
	 */
	public List<FriendGroupDTO> getFriendGroupDTOs(FriendGroupDTO fgDTO);

	/**
	 * 
	 * getFriendGroupById 根据 id查询好友组
	 * 
	 * @param id
	 * @return
	 */
	public FriendGroup getFriendGroupById(String id);
	
	/**
	 * 
	 * deleteFriendGroup 删除好友组
	 * @param id 好友组id
	 */
	public void deleteFriendGroup(String id);

	/**
	 * 
	 * sortFriendGroup 好友组排序
	 * @param ids 好友组ids
	 */
	public void sortFriendGroup(String ids);
	
	
}
