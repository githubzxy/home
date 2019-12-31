package com.enovell.yunwei.system.web;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.friend.domain.FriendGroup;
import com.enovell.yunwei.friend.dto.FriendGroupDTO;
import com.enovell.yunwei.friend.service.FriendGroupService;
import com.enovell.yunwei.system.service.OrganizationService;
import com.enovell.yunwei.util.JsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 
 * 项目名称：guangtieYearMonth
 * 类名称：OrganizationAction   
 * 类描述:  组织机构控制类
 * 创建人：张思红 
 * 创建时间：2014-10-28 上午11:50:47
 * 修改人：张思红 
 * 修改时间：2014-10-28 上午11:50:47   
 *
 */
@Controller
@RequestMapping(value = "/organization")
public class OrganizationAction {

	@Resource(name = "organizationService")
	private OrganizationService organizationService;
	
	@Resource(name = "friendGroupService")
	private FriendGroupService friendGroupService;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(
			@RequestParam("name") String name,
			@RequestParam("parentId") String parentId,
			@RequestParam("type") Integer type,
			@RequestParam("desc") String desc
			) {
		
		Organization parentOrg = new Organization();
		parentOrg.setId(parentId);
		
		Organization organization = new Organization();
		organization.setName(name);
		organization.setParent(parentOrg);
		organization.setType(type);
		organization.setDesc(desc);
		
		organizationService.add(organization);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("parentId") String parentId,
			@RequestParam("type") Integer type,
			@RequestParam("desc") String desc
			) {
		
		Organization parentOrg = new Organization();
		parentOrg.setId(parentId);
		
		Organization organization = new Organization();
		organization.setId(id);
		organization.setName(name);
		organization.setParent(parentOrg);
		organization.setType(type);
		organization.setDesc(desc);
		
		organizationService.update(organization);
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(
			@RequestParam("id") String id
			) {
		organizationService.delete(id);
	}
	
	@RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
	@ResponseBody
	public void batchDelete(
			@RequestParam("ids") String ids
			) {
		if(StringUtils.isNotBlank(ids)) {
			organizationService.batchDelete(ids);
		}
	}
	
	@RequestMapping(value = "/saveSort", method = RequestMethod.POST)
	@ResponseBody
	public void saveSort(
			@RequestParam("ids") String ids
			) {
		if(StringUtils.isNotBlank(ids)) {
			organizationService.saveSort(ids);
		}
	}
	
	/**
	 * getOrgChildrenById 通过Pid（父id）查询其children
	 */
	@RequestMapping(value = "/getOrgChildrenById", method = RequestMethod.POST)
	@ResponseBody
	public String getChildrenByPid (
			@RequestParam("id") String id
			) {
		List<Organization> childList = organizationService.getChildrenByPid(id);
		return JsonUtil.javaToJsonAsString(childList);
	}
	
	/**
	 * 
	 * getChildrenByPidAndCurId 通过Pid（父id）和不等于curId查询其children
	 */
	@RequestMapping(value = "/getChildrenByPidAndCurId", method = RequestMethod.POST)
	@ResponseBody
	public String getChildrenByPidAndCurId(
			@RequestParam("id") String id,
			@RequestParam("curId") String curId
			) {
		List<Organization> childList = organizationService.getChildrenByPidAndCurId(id, curId);
		return JsonUtil.javaToJsonAsString(childList);
	}
	
	@RequestMapping(value = "/getChildrenByParent", method = RequestMethod.POST)
	@ResponseBody
	public String getChildrenByParent (
			@RequestParam("id") String id
			) {
		Organization parentOrg = new Organization();
		parentOrg.setId(id);
		List<Organization> childList = organizationService.getChildrenByParent(parentOrg);
		return JsonUtil.javaToJsonAsString(childList);
	}
	
	/**
	 * getSegmentByPid 通过父id查询科室（排除车间）
	 */
	@RequestMapping(value = "/getSegmentByPid", method = RequestMethod.POST)
	@ResponseBody
	public String getSegmentByPid (
			@RequestParam("id") String id
			) {
		List<Organization> childList = organizationService.getSegmentByPid(id);
		return JsonUtil.javaToJsonAsString(childList);
	}
	
	/**
	 * getSegmentByPid 查询所有车间
	 */
	@RequestMapping(value = "/getAllWorkshop", method = RequestMethod.POST)
	@ResponseBody
	public String getAllWorkshop () {
		List<Organization> childList = organizationService.getAllWorkshop();
		return JsonUtil.javaToJsonAsString(childList);
	}
	
	/**
	 * getSegmentByPid 查询所有车间
	 */
	@RequestMapping(value = "/saveSegmentAndWorkshop", method = RequestMethod.POST)
	@ResponseBody
	public String saveSegmentAndWorkshop (
			@RequestParam("segmentId") String segmentId,
			@RequestParam("workshopIds") String workshopIds
			) {
		organizationService.saveSegmentAndWorkshop(segmentId, workshopIds.split(","));
		return null;
	}
	/**
	 * 
	 * saveSegmentAndWorkshopToAutumn 这里添加描述信息
	 *
	 * @author yangsy
	 * @date 2017年11月3日 上午10:42:33 
	 * @param segmentId
	 * @param workshopIds
	 * @return
	 */
	@RequestMapping(value = "/saveSegmentAndWorkshopToAutumn", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg saveSegmentAndWorkshopToAutumn (
			@RequestParam("segmentId") String segmentId,
			@RequestParam("workshopIds") String workshopIds
			) {
		try{
			organizationService.saveSegmentAndWorkshop(segmentId, workshopIds.split(","));
			return ResultMsg.getSuccess("保存成功", null);
		}catch (Exception e) {
			return ResultMsg.getFailure("失败成功", null);
		}
	}
	
	/**
	 * getSegmentByPid 查询所有车间
	 */
	@RequestMapping(value = "/getAllWorkshopBySegment", method = RequestMethod.POST)
	@ResponseBody
	public String getAllWorkshopBySegment (
			@RequestParam("segmentId") String segmentId
			) {
		List<Organization> childList = organizationService.getAllWorkshopBySegment(segmentId);
		return JsonUtil.javaToJsonAsString(childList);
	}
	
	/**
	 * 
	 * getOrgAndFriend 查询昆明通信段组织机构和当前用户的好友组
	 * @param id 组织机构id
	 * @param request 用于获取session中的User
	 * @return
	 */
	@RequestMapping(value = "/getOrgAndFriend", method = RequestMethod.POST)
	@ResponseBody
	public String getOrgAndFriend(
			@RequestParam("id") String id,
			HttpServletRequest request
			) {
		
		List<Organization> orgChildList = organizationService.getChildrenByPid(id);
		String childListStr = JsonUtil.javaToJsonAsString(orgChildList);
		
		// 如果是昆明通信段，需要查询好友组
		if("8affa073533aa3d601533bbef63e0010".equals(id)) {
			User user = (User) request.getSession().getAttribute("user");
			FriendGroupDTO friendGroupDTO = new FriendGroupDTO();
			friendGroupDTO.setUser(user);
			List<FriendGroup> fgList =  friendGroupService.selectFriendGroup(friendGroupDTO);
			String fgListStr = JsonUtil.javaToJsonAsString(fgList);
			
			// id都为8affa073533aa3d601533bbef63e0010， 方便前端判断不能勾选
			// isdept : false 不是叶子节点
			// expanded : true 默认展开该节点
			String rootFGStr = "{\"id\" : \"8affa073533aa3d601533bbef63e0010\", \"name\" : \"好友组\", \"isdept\" : false, \"expanded\" : true, \"children\" : "+ fgListStr +"}";
			String rootOrgStr = "{\"id\" : \"8affa073533aa3d601533bbef63e0010\", \"name\" : \"昆明通信段\", \"isdept\" : false, \"expanded\" : true, \"children\" : "+ childListStr +"}";
			
			String jsonArray = "[" + rootFGStr + ", " + rootOrgStr + "]";
			
			return jsonArray;
		}
		
		return childListStr;
	}
}
