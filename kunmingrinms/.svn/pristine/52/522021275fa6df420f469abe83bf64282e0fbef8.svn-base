package com.enovell.yunwei.emergencyOrg.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.system.common.domain.Position;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.emergencyOrg.domain.EmergencyOrg;
import com.enovell.yunwei.emergencyOrg.domain.EmergencyUser;
import com.enovell.yunwei.emergencyOrg.dto.EmergencyOrgDTO;
import com.enovell.yunwei.emergencyOrg.dto.EmergencyUserDTO;
import com.enovell.yunwei.emergencyOrg.service.EmergencyOrgService;
import com.enovell.yunwei.emergencyOrg.service.EmergencyUserService;
import com.enovell.yunwei.util.JsonUtil;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：EmergencyOrgAction   
 * 类描述:  机构管理Action
 * 创建人：yangsy
 * 创建时间：2016-12-06
 *
 */
@Controller
@RequestMapping(value = "/emergencyOrgAction")
public class EmergencyOrgAction {

	@Resource(name = "emergencyOrgService")
	private EmergencyOrgService emergencyOrgService;
	
	@Resource(name = "emergencyUserService")
	private EmergencyUserService emergencyUserService;
	
	/**
	 * 页面leftDiv的请求
	 */
	
	/**
	 * getOrgChildrenById 通过Pid（父id）查询其children
	 */
	@RequestMapping(value = "/getOrgChildrenByPid", method = RequestMethod.POST)
	@ResponseBody
	public String getChildrenByPid (@RequestParam("id") String id) {
		List<EmergencyOrg> childList = emergencyOrgService.getOrgChildrenByPid(id);
		return JsonUtil.javaToJsonAsString(childList);
	}
	/**
	 * addOrg 新增子机构
	 * @param name
	 * @param parentId
	 */
	@RequestMapping(value = "/addOrg", method = RequestMethod.POST)
	@ResponseBody
	public void addOrg(@RequestParam("name") String name,
			@RequestParam("orgId") String parentId) {
		
		EmergencyOrg parent = new EmergencyOrg();
		parent.setId(parentId);
		
		EmergencyOrg  newOrg = new EmergencyOrg();
		newOrg.setName(name);
		newOrg.setParent(parent);
		
		emergencyOrgService.addOrg(newOrg);
		
	}
	/**
	 * getOrgDataById 根据id获取一个机构的数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getOrgDataById", method = RequestMethod.POST)
	@ResponseBody
	public String getOrgDataById (@RequestParam("id") String id) {
		EmergencyOrg emergencyOrg = emergencyOrgService.getOrgDataById(id);
		return JsonUtil.javaToJsonAsString(emergencyOrg);
	}
	/**
	 * updateOrg 修改子机构名称
	 * @param orgId
	 * @param name
	 */
	@RequestMapping(value = "/updateOrg", method = RequestMethod.POST)
	@ResponseBody
	public void updateOrg(@RequestParam("orgId") String orgId,
			@RequestParam("name") String name) {
		emergencyOrgService.updateOrg(orgId,name);
	}
	/**
	 * checkChildrenOrg 验证一个机构下是否存在子机构
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/checkChildrenOrg", method = RequestMethod.POST)
	@ResponseBody
	public long checkChildrenOrg (@RequestParam("id") String id) {
		long count = emergencyOrgService.checkChildrenOrg(id);
		return count;
	}
	/**
	 * checkOrgPeople 验证一个机构下是否存在应急人员
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/checkOrgPeople", method = RequestMethod.POST)
	@ResponseBody
	public long checkOrgPeople (@RequestParam("id") String id) {
		long count = emergencyOrgService.checkOrgPeople(id);
		return count;
	}
	/**
	 * deleteOrg 删除机构
	 * @param id
	 */
	@RequestMapping(value = "/deleteOrg", method = RequestMethod.POST)
	@ResponseBody
	public void deleteOrg(@RequestParam("id") String id) {
		emergencyOrgService.deleteOrg(id);
	}
	/**
	 * getChildrenByParentId 根据父节点id获取子元素
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getChildrenByParentId", method = RequestMethod.POST)
	@ResponseBody
	public String getChildrenByParentId (@RequestParam("parentId") String parentId) {
		List<EmergencyOrgDTO> childList = emergencyOrgService.getChildrenByParentId(parentId);
		return JsonUtil.javaToJsonAsString(childList);
	}
	
	@RequestMapping(value = "/sortOrg", method = RequestMethod.POST)
	@ResponseBody
	public void sortOrg(@RequestParam("sortId") String sortId) {
		if (StringUtils.isNotBlank(sortId)) {
			emergencyOrgService.sortOrg(sortId);
		}
	}
	/**
	 * getEmergencyOrgTree
	 */
	@RequestMapping(value = "/getEmergencyOrgTree", method = RequestMethod.POST)
	@ResponseBody
	public String getEmergencyOrgTree (@RequestParam("id") String id) {
		EmergencyOrg childList = emergencyOrgService.getEmergencyOrgTree();
		return JsonUtil.javaToJsonAsString(childList);
	}
	
	/**
	 * 页面rightDiv的请求
	 */
	
	/**
	 * getAllEmergencyUsers 通过机构id查询其机构下的应急人员
	 */
	@RequestMapping(value = "/getAllEmergencyUsers", method = RequestMethod.POST)
	@ResponseBody
	public String getAllEmergencyUsers (@RequestParam("orgId") String orgId,
			@RequestParam(value = "peopleName", required = false) String peopleName,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		EmergencyUserDTO emergencyUserDTO = new EmergencyUserDTO();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(orgId)) {
			emergencyUserDTO.setOrgId(orgId);
		}
		if (StringUtils.isNotEmpty(peopleName)) {
			emergencyUserDTO.setName(peopleName.replaceAll(" ", ""));
		}
		
		List<EmergencyUserDTO> dto = emergencyUserService.getAllEmergencyUsers(emergencyUserDTO, start, limit);
		long results = emergencyUserService.getEmergencyUsersCount(emergencyUserDTO);
		
		GridDto<EmergencyUserDTO> gridDto = new GridDto<EmergencyUserDTO>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * getPositionData
	 * @return
	 */
	@RequestMapping(value = "/getPositionData", method = RequestMethod.POST)
	@ResponseBody
	public String getPositionData () {
		List<Position> list = emergencyUserService.getPositionData();
		return JsonUtil.javaToJsonAsString(list);
	}
	/**
	 * addOrgPeople 新增应急人员
	 * @param name
	 * @param parentId
	 */
	@RequestMapping(value = "/addOrgPeople", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addOrgPeople(@RequestParam("peopleName") String peopleName,
			@RequestParam("orgNameId") String orgNameId,
			@RequestParam("mobileNumber") String mobileNumber,
			@RequestParam("duty") String duty,
			@RequestParam("officeTelephone") String officeTelephone,
			@RequestParam("position") String position) {
		
		EmergencyUser user = new EmergencyUser();
		user.setName(peopleName);
		EmergencyOrg org = new EmergencyOrg();
		org.setId(orgNameId);
		user.setEmergencyOrg(org);
		user.setMobileNumber(mobileNumber);
		user.setPost(duty);
		user.setOfficeTelephone(officeTelephone);
		Position p = new Position();
		p.setId(position);
		user.setPosition(p);
		try {
			emergencyUserService.addEmergencyUser(user);
			return ResultMsg.getSuccess("新增成员成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增成员失败！", null);
		}
		
	}
	/**
	 * getPeopleDataById 根据id获取一个应急人员的数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getPeopleDataById", method = RequestMethod.POST)
	@ResponseBody
	public String getPeopleDataById (@RequestParam("id") String id) {
		List<EmergencyUserDTO> list = emergencyUserService.getEmergencyPeopleById(id);
		return JsonUtil.javaToJsonAsString(list);
	}
	/**
	 * checkIsUserById 根据id判断数据是否有User
	 * @param id
	 * @return
	 */
//	@RequestMapping(value = "/checkIsUserById", method = RequestMethod.POST)
//	@ResponseBody
//	public boolean checkIsUserById (@RequestParam("id") String id) {
//		EmergencyUser user = emergencyUserService.getEmergencyUserById(id);
//		if(user.getUser()!=null){
//			return true;
//		}else{
//			return false;
//		}
//	}
	/**
	 * 修改应急人员信息
	 * @param id
	 * @param name
	 * @param parentId
	 * @param type
	 * @param desc
	 */
	@RequestMapping(value = "/updateOrgPeople", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateOrgPeople(
			@RequestParam("peopleId") String peopleId,
			@RequestParam("peopleName") String peopleName,
			@RequestParam("orgNameId") String orgNameId,
			@RequestParam("mobileNumber") String mobileNumber,
			@RequestParam("duty") String duty,
			@RequestParam("officeTelephone") String officeTelephone,
			@RequestParam("position") String position) {
		
		EmergencyUser user = emergencyUserService.getEmergencyUserById(peopleId);
		
		if(user.getUser()!=null){
			user.setName(peopleName);
			EmergencyOrg org = new EmergencyOrg();
			org.setId(orgNameId);
			user.setEmergencyOrg(org);
			user.setPost(duty);
		}else{
			user.setName(peopleName);
			EmergencyOrg org = new EmergencyOrg();
			org.setId(orgNameId);
			user.setEmergencyOrg(org);
			user.setMobileNumber(mobileNumber);
			user.setOfficeTelephone(officeTelephone);
			user.setPost(duty);
			Position p = new Position();
			p.setId(position);
			user.setPosition(p);
		}
		try {
			emergencyUserService.updateEmergencyUser(user);
			return ResultMsg.getSuccess("修改成员成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("修改成员失败！", null);
		}
	}
	/**
	 * importEmergencyUsers 批量新增应急人员
	 * @param name
	 * @param parentId
	 */
	@RequestMapping(value = "/importEmergencyUsers", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg importEmergencyUsers(@RequestParam("selectUsers") String selectUsers,
			@RequestParam("orgId") String orgId) {
		User[] u = JsonUtil.jsonToJavaObj(selectUsers, User[].class);
		List<User> list = new ArrayList<User>();
		for(int i = 0 ; i<u.length ; i++){
			list.add(u[i]);
		}
		EmergencyOrg org = new EmergencyOrg();
		org.setId(orgId);
		emergencyUserService.importEmergencyUser(list, org);
		return ResultMsg.getFailure("批量新增成功！", null);
	}
	/**
	 * 删除应急人员
	 * @param ids
	 */
	@RequestMapping(value = "/deleteOrgPeople", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteOrgPeople(@RequestParam("ids") List<String> ids) {
		try {
			emergencyUserService.deleteEmergencyUser(ids);
			return ResultMsg.getSuccess("删除员工成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("删除员工失败！", null);
		}
	}
	
}
