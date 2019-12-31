package com.enovell.yunwei.friend.web;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.friend.domain.Friend;
import com.enovell.yunwei.friend.domain.FriendGroup;
import com.enovell.yunwei.friend.dto.FriendDTO;
import com.enovell.yunwei.friend.dto.FriendGroupDTO;
import com.enovell.yunwei.friend.service.FriendGroupService;
import com.enovell.yunwei.friend.service.FriendService;
import com.enovell.yunwei.util.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * 项目名称：kunmingrinms 类名称：FriendGroupAction 类描述: 好友组管理Action 创建人：lidt
 * 创建时间：2016-11-30 上午10:13:18 修改人：lidt 修改时间：2016-11-30 上午10:13:18
 * 
 */
@Controller
@RequestMapping(value = "/friendGroupAction")
public class FriendGroupAction {

	@Resource(name = "friendGroupService")
	private FriendGroupService friendGroupService;
	@Resource(name = "friendService")
	private FriendService friendService;

	/**
	 * 
	 * getFriendGroupList 获取好友组列表
	 * 
	 * @param request
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getFriendGroupList", method = RequestMethod.POST)
	@ResponseBody
	public String getFriendGroupList(HttpServletRequest request) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		FriendGroupDTO fgDTO = new FriendGroupDTO();
		fgDTO.setUser(user);
		List<FriendGroupDTO> list = friendGroupService
				.getFriendGroupDTOs(fgDTO);
		return JsonUtil.javaToJsonAsString(list);
	}

	/**
	 * 
	 * getFriendList 查询好友
	 * 
	 * @param request
	 * @param friendGroupId
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getFriendList", method = RequestMethod.POST)
	@ResponseBody
	public String getFriendList(HttpServletRequest request,
			@RequestParam("id") String friendGroupId) {
		FriendGroup fg = new FriendGroup();
		fg.setId(friendGroupId);
		FriendDTO fDTO = new FriendDTO();
		fDTO.setFriendGroup(fg);
		List<Friend> list = friendService.selectFriends(fDTO);
		return JsonUtil.javaToJsonAsString(list);
	}

	/**
	 * 
	 * addFriendGroup 增加好友组
	 * 
	 * @param request
	 * @param friendGroup
	 *            好友组名称
	 * @return 0,成功、其他失败
	 */
	@RequestMapping(value = "/addFriendGroup", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addFriendGroup(HttpServletRequest request,
			FriendGroup friendGroup) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		friendGroup.setBelongUser(user);
		friendGroup.setSn(0);
		try {
			friendGroupService.addFriendGroup(friendGroup);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增失败", null);
		}
		return ResultMsg.getSuccess("新增成功", null);
	}

	/**
	 * 
	 * getfriendGroupById 根据id获取好友组
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getfriendGroupById", method = RequestMethod.POST)
	@ResponseBody
	public String getfriendGroupById(@RequestParam("id") String id) {
		FriendGroup fg = friendGroupService.getFriendGroupById(id);
		return JsonUtil.javaToJsonAsString(fg);

	}

	/**
	 * 
	 * updateFriendGroup 修改好友组
	 * 
	 * @param id
	 * @param name
	 *            好友组名称
	 * @return 0,成功、其他失败
	 */
	@RequestMapping(value = "/updateFriendGroup", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateFriendGroup(@RequestParam("id") String id,
			@RequestParam("group") String name) {
		FriendGroup friendGroup = friendGroupService.getFriendGroupById(id);
		friendGroup.setName(name);
		try {
			friendGroupService.updateFriendGroup(friendGroup);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("修改失败", null);
		}
		return ResultMsg.getSuccess("修改成功", null);
	}

	/**
	 * 
	 * delFriendGroup 删除好友组
	 * 
	 * @param id
	 * @return 0,成功、其他失败
	 */
	@RequestMapping(value = "/deleteFriendGroup", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteFriendGroup(@RequestParam("id") String id) {
		try {
			friendGroupService.deleteFriendGroup(id);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("删除失败", null);
		}
		return ResultMsg.getSuccess("删除成功", null);

	}

	/**
	 * 
	 * sortFriendGroup 好友组排序
	 * 
	 * @param ids
	 *            好友组ids
	 * @return 0,成功、其他失败
	 */
	@RequestMapping(value = "/sortFriendGroup", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg sortFriendGroup(@RequestParam("ids") String ids) {
		if (StringUtils.isNotBlank(ids)) {
			try {
				friendGroupService.sortFriendGroup(ids);
			} catch (Exception e) {
				e.printStackTrace();
				return ResultMsg.getFailure("排序失败", null);
			}
			return ResultMsg.getSuccess("排序成功", null);
		}
		return ResultMsg.getFailure("排序失败", null);
	}

	/**
	 * 
	 * changeFriend 组员调整
	 * 
	 * @param friendGroupId
	 *            好友组id
	 * @param friends
	 *            好友
	 * @return 0,成功、其他失败
	 */
	@RequestMapping(value = "/changeFriend", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg changeFriend(@RequestParam("id") String friendGroupId,
			@RequestParam("friends") String friends) {
		User[] users = JsonUtil.jsonToJavaObj(friends, User[].class);
		List<Friend> friendList = new ArrayList<Friend>();
		for (User user : users) {
			FriendGroup friendGroup = new FriendGroup();
			friendGroup.setId(friendGroupId);
			Friend friend = new Friend();
			friend.setFriendGroup(friendGroup);
			friend.setUser(user);
			friendList.add(friend);
		}
		try {
			friendGroupService.changeFriendGroup(friendList);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("调整失败", null);
		}
		return ResultMsg.getSuccess("调整成功", null);
	}

}
