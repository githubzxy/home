package com.enovell.yunwei.dispathRoot.web;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.dispathRoot.dto.DispatchRootExportDTO;
import com.enovell.yunwei.dispathRoot.dto.DispathManageDTO;
import com.enovell.yunwei.dispathRoot.service.DispathBusinessService;
import com.enovell.yunwei.dispathRoot.service.DispathRootService;
import com.enovell.yunwei.dispathRoot.service.DispathRootTreeService;
import com.enovell.yunwei.system.dto.NameAndIdDTO;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 
 * 项目名称：kunmingrinms 
 * 类名称：DispatchRootAction 
 * 类描述: 调度命令Action 
 * 创建人：lidt
 * 创建时间：2016-12-16 上午10:34:28 
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:34:28
 * 
 */
@Controller
@RequestMapping(value = "/dispatchRootAction")
public class DispatchRootAction {

	@Resource(name = "DispathRootService")
	private DispathRootService dispathRootService;

	@Resource(name = "DispathBusinessService")
	private DispathBusinessService dispathBusinessService;

	@Resource(name = "DispathRootTreeService")
	private DispathRootTreeService dispathRootTreeService;
	
	/**
	 * 创建分页查询
	 * getDispatchRootList 
	 * @param request
	 * @param number
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param overTimeStatus
	 * @param start
	 * @param limit
	 * @return
	 * @author luoyan
	 */
	@RequestMapping(value = "/getAddListByDTO", method = RequestMethod.POST)
	@ResponseBody
	public String getAddListByDTO(HttpServletRequest request,
			@RequestParam("number") String number,
			@RequestParam("status") String status,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime,
			@RequestParam(value = "overTimeStatus",required = false ) String overTimeStatus,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathManageDTO dto = new DispathManageDTO();
		dto.setIsRoot(DispathRoot.IS_ROOT);
		dto.setOverTimeStatus(overTimeStatus);
		dto.setUser(user);
		if (StringUtils.isNotBlank(number)) {
			dto.setDispatchNum(number.replace(" ", ""));
		}
		if (StringUtils.isNotBlank(status)) {
			dto.setStatus(status);
		}
		if (StringUtils.isNotBlank(startTime)) {
			dto.setSendDateStartByRoot(StringDateToDateUtil.getDate(startTime));
		}
		if (StringUtils.isNotBlank(endTime)) {
			dto.setSendDateEndByRoot(StringDateToDateUtil.getDate(endTime));
		}
		GridDto<DispathRoot> gridDto = dispathRootService.getAddListByGridDto(dto,	start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}


	/**
	 * 
	 * getDispatchRootList 获取调度命令list
	 * 
	 * @param number 命令号
	 * @param status 状态
	 * @param startTime 创建开始时间
	 * @param endTime 创建结束时间
	 * @param start
	 * @param limit
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getDispatchRootList", method = RequestMethod.POST)
	@ResponseBody
	public String getDispatchRootList(HttpServletRequest request,
			@RequestParam("number") String number,
			@RequestParam("status") String status,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime,
			@RequestParam("overTimeStatus") String overTimeStatus,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathManageDTO dto = new DispathManageDTO();
		dto.setIsRoot(DispathRoot.IS_ROOT);
		dto.setOverTimeStatus(overTimeStatus);
		dto.setUser(user);
		if (StringUtils.isNotBlank(number)) {
			dto.setDispatchNum(number.replace(" ", ""));
		}
		if (StringUtils.isNotBlank(status)) {
			dto.setStatus(status);
		}
		if (StringUtils.isNotBlank(startTime)) {
			dto.setSendDateStartByRoot(StringDateToDateUtil.getDate(startTime));
		}
		if (StringUtils.isNotBlank(endTime)) {
			dto.setSendDateEndByRoot(StringDateToDateUtil.getDate(endTime));
		}
		GridDto<DispathRoot> gridDto = dispathRootService.getByGridDto(dto,	start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * addDispatchRoot 新增调度命令
	 * 
	 * @param request
	 * @param number 命令号
	 * @param nowTime 当前时间
	 * @param organizations 组织机构
	 * @param dispatchUser 值班调度
	 * @param acceptUser 受理人
	 * @param copyUser 抄送人
	 * @param content 命令内容
	 * @param issueUser 命令签发者
	 * @param uploadFileArr 上传文件
	 * @return
	 */
	@RequestMapping(value = "/addDispatchRoot", method = RequestMethod.POST)
	@ResponseBody
	public String addDispatchRoot(HttpServletRequest request,
			@RequestParam("number") String number,
			@RequestParam("nowTime") String nowTime,
			@RequestParam("organizations") String organizations,
			@RequestParam("dispatchUser") String dispatchUser,
			@RequestParam("acceptUser") String acceptUser,
			@RequestParam("copyUser") String copyUser,
			@RequestParam("content") String content,
			@RequestParam("issueUser") String issueUser,
			@RequestParam("uploadFileArr") String uploadFileArr,
			@RequestParam("deadLine") String deadLine
			) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathRoot dispathRoot = new DispathRoot();
		dispathRoot.setCreateUser(user);// 创建人
		dispathRoot.setSendUser(user); // 发令人
		dispathRoot.setUser(user);// 当前调度所属人
		if (StringUtils.isNotBlank(number)) {
			dispathRoot.setDispatchNum(number);// 命令号
		}
		if (StringUtils.isNotBlank(nowTime)) {
			dispathRoot.setCreateDate(StringDateToDateUtil.getDateAndTime(nowTime));// 创建时间
		}
		if (StringUtils.isNotBlank(organizations)) {
			dispathRoot.setOrganization(organizations);// 受令单位
		}
		if (StringUtils.isNotBlank(dispatchUser)) {
			dispathRoot.setDispatchUser(dispatchUser);// 值班调度
		}
		if(StringUtils.isNotBlank(deadLine)) {
			dispathRoot.setDeadLine(StringDateToDateUtil.getDate(deadLine));
		}
		User[] acceptUsers = JsonUtil.jsonToJavaObj(acceptUser, User[].class);
		Set<User> acceptUserSet = new HashSet<User>();
		for (User u : acceptUsers) {
			acceptUserSet.add(u);// 受理人
		}
		dispathRoot.setAcceptUser(acceptUserSet);
		User[] copyUsers = JsonUtil.jsonToJavaObj(copyUser, User[].class);
		if (copyUsers.length != 0) {
			Set<User> copyUserSet = new HashSet<User>();
			for (User u : copyUsers) {
				copyUserSet.add(u);// 抄送人
			}
			dispathRoot.setCopyUser(copyUserSet);
		}
		if (StringUtils.isNotBlank(content)) {
			dispathRoot.setSuggestion(content);// 命令内容
		}
		if (StringUtils.isNotBlank(issueUser)) {
			dispathRoot.setIssueUser(issueUser);// 命令签发者
		}
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		dispathRootService.add(dispathRoot, dtos);
		return null;
	}

	/**
	 * 
	 * addAndSendDispatchRoot 新增并派发调度命令
	 * 
	 * @param request
	 * @param number 命令号
	 * @param nowTime 当前时间
	 * @param organizations 组织机构
	 * @param dispatchUser 值班调度
	 * @param acceptUser 受理人
	 * @param copyUser 抄送人
	 * @param content 命令内容
	 * @param issueUser 命令签发者
	 * @param uploadFileArr 上传文件
	 * @return
	 */
	@RequestMapping(value = "/addAndSendDispatchRoot", method = RequestMethod.POST)
	@ResponseBody
	public String addAndSendDispatchRoot(HttpServletRequest request,
			@RequestParam("number") String number,
			@RequestParam("nowTime") String nowTime,
			@RequestParam("organizations") String organizations,
			@RequestParam("dispatchUser") String dispatchUser,
			@RequestParam("acceptUser") String acceptUser,
			@RequestParam("copyUser") String copyUser,
			@RequestParam("content") String content,
			@RequestParam("issueUser") String issueUser,
			@RequestParam("uploadFileArr") String uploadFileArr,
			@RequestParam("deadLine") String deadLine) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathRoot dispathRoot = new DispathRoot();
		dispathRoot.setCreateUser(user);// 创建人
		dispathRoot.setUser(user);// 当前调度所属人
		if (StringUtils.isNotBlank(number)) {
			dispathRoot.setDispatchNum(number);// 命令号
		}
		if (StringUtils.isNotBlank(nowTime)) {
			dispathRoot.setCreateDate(StringDateToDateUtil.getDateAndTime(nowTime));// 创建时间
		}
		if (StringUtils.isNotBlank(organizations)) {
			dispathRoot.setOrganization(organizations);// 受令单位
		}
		if (StringUtils.isNotBlank(dispatchUser)) {
			dispathRoot.setDispatchUser(dispatchUser);// 值班调度
		}
		if(StringUtils.isNotBlank(deadLine)) {
			dispathRoot.setDeadLine(StringDateToDateUtil.getDate(deadLine));
		}
		User[] acceptUsers = JsonUtil.jsonToJavaObj(acceptUser, User[].class);
		Set<User> acceptUserSet = new HashSet<User>();
		for (User u : acceptUsers) {
			acceptUserSet.add(u);// 受理人
		}
		dispathRoot.setAcceptUser(acceptUserSet);
		User[] copyUsers = JsonUtil.jsonToJavaObj(copyUser, User[].class);
		if (copyUsers.length != 0) {
			Set<User> copyUserSet = new HashSet<User>();
			for (User u : copyUsers) {
				copyUserSet.add(u);// 抄送人
			}
			dispathRoot.setCopyUser(copyUserSet);
		}
		if (StringUtils.isNotBlank(content)) {
			dispathRoot.setSuggestion(content);// 命令内容
		}
		if (StringUtils.isNotBlank(issueUser)) {
			dispathRoot.setIssueUser(issueUser);// 命令签发者
		}
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		dispathBusinessService.addAndSend(dispathRoot,dtos);
		return null;
	}

	/**
	 * 
	 * getDispatchRootById 根据id查询调度命令
	 * 
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getDispatchRootById", method = RequestMethod.POST)
	@ResponseBody
	public String getDispatchRootById(@RequestParam("id") String id) {

		DispathRoot dispathRoot = dispathRootService.getById(id);
		dispathRoot.setChildren(null);
		return JsonUtil.javaToJsonAsString(dispathRoot);

	}

	/**
	 * 
	 * sendDispatchRoot 派发调度命令
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/sendDispatchRoot", method = RequestMethod.POST)
	@ResponseBody
	public String sendDispatchRoot(@RequestParam("id") String id) {

		DispathRoot dispathRoot = new DispathRoot();
		dispathRoot.setId(id);
		dispathBusinessService.send(dispathRoot);
		return null;

	}

	/**
	 * 
	 * updateDispatchRoot 修改调度命令
	 * 
	 * @param request
	 * @param id
	 * @param number 命令号
	 * @param nowTime 当前时间
	 * @param organizations 组织机构
	 * @param dispatchUser 值班调度
	 * @param acceptUser 受理人
	 * @param copyUser 抄送人
	 * @param content 命令内容
	 * @param issueUser 命令签发者
	 * @param uploadFileArr 上传文件
	 * @return
	 */
	@RequestMapping(value = "/updateDispatchRoot", method = RequestMethod.POST)
	@ResponseBody
	public String updateDispatchRoot(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("number") String number,
			@RequestParam("nowTime") String nowTime,
			@RequestParam("organizations") String organizations,
			@RequestParam("dispatchUser") String dispatchUser,
			@RequestParam("acceptUser") String acceptUser,
			@RequestParam("copyUser") String copyUser,
			@RequestParam("content") String content,
			@RequestParam("issueUser") String issueUser,
			@RequestParam("uploadFileArr") String uploadFileArr,
			@RequestParam("deadLine") String deadLine) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		// 获取信息发布(显示在页面上的数据)
		DispathRoot dispathRoot = new DispathRoot();
		if (StringUtils.isNotBlank(id)) {
			dispathRoot.setId(id);// ID
		}
		if (StringUtils.isNotBlank(number)) {
			dispathRoot.setDispatchNum(number);// 命令号
		}
		if (StringUtils.isNotBlank(nowTime)) {
			dispathRoot.setCreateDate(StringDateToDateUtil.getDateAndTime(nowTime));// 创建时间
		}
		if (StringUtils.isNotBlank(organizations)) {
			dispathRoot.setOrganization(organizations);// 受令单位
		}
		if (StringUtils.isNotBlank(dispatchUser)) {
			dispathRoot.setDispatchUser(dispatchUser);// 值班调度
		}
		if(StringUtils.isNotBlank(deadLine)) {
			dispathRoot.setDeadLine(StringDateToDateUtil.getDate(deadLine));
		}
		User[] acceptUsers = JsonUtil.jsonToJavaObj(acceptUser, User[].class);
		Set<User> acceptUserSet = new HashSet<User>();
		for (User u : acceptUsers) {
			acceptUserSet.add(u);// 受理人
		}
		dispathRoot.setAcceptUser(acceptUserSet);
		User[] copyUsers = JsonUtil.jsonToJavaObj(copyUser, User[].class);
		if (copyUsers.length != 0) {
			Set<User> copyUserSet = new HashSet<User>();
			for (User u : copyUsers) {
				copyUserSet.add(u);// 抄送人
			}
			dispathRoot.setCopyUser(copyUserSet);
		} else {
			dispathRoot.setCopyUser(null);
		}
		if (StringUtils.isNotBlank(content)) {
			dispathRoot.setSuggestion(content);// 命令内容
		}
		if (StringUtils.isNotBlank(issueUser)) {
			dispathRoot.setIssueUser(issueUser);// 命令签发者
		}
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		try {
			dispathBusinessService.updateYiPaiAndSave(dispathRoot, dtos, user);
		} catch (Exception e) {
			return "修改失败！";
		}
		return null;
	}

	/**
	 * 
	 * updateAndSendDispatchRoot 修改并派发调度命令
	 * 
	 * @param request
	 * @param id
	 * @param number 命令号
	 * @param nowTime 当前时间
	 * @param organizations 组织机构
	 * @param dispatchUser 值班调度
	 * @param acceptUser 受理人
	 * @param copyUser 抄送人
	 * @param content 命令内容
	 * @param issueUser 命令签发者
	 * @param uploadFileArr 上传文件
	 * @return
	 */
	@RequestMapping(value = "/updateAndSendDispatchRoot", method = RequestMethod.POST)
	@ResponseBody
	public String updateAndSendDispatchRoot(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("number") String number,
			@RequestParam("nowTime") String nowTime,
			@RequestParam("organizations") String organizations,
			@RequestParam("dispatchUser") String dispatchUser,
			@RequestParam("acceptUser") String acceptUser,
			@RequestParam("copyUser") String copyUser,
			@RequestParam("content") String content,
			@RequestParam("issueUser") String issueUser,
			@RequestParam("uploadFileArr") String uploadFileArr,
			@RequestParam("deadLine") String deadLine) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		// 获取信息发布(显示在页面上的数据)
		DispathRoot dispathRoot = new DispathRoot();
		if (StringUtils.isNotBlank(id)) {
			dispathRoot.setId(id);// ID
		}
		if (StringUtils.isNotBlank(number)) {
			dispathRoot.setDispatchNum(number);// 命令号
		}
		if (StringUtils.isNotBlank(nowTime)) {
			dispathRoot.setCreateDate(StringDateToDateUtil.getDateAndTime(nowTime));// 创建时间
		}
		if (StringUtils.isNotBlank(organizations)) {
			dispathRoot.setOrganization(organizations);// 受令单位
		}
		if (StringUtils.isNotBlank(dispatchUser)) {
			dispathRoot.setDispatchUser(dispatchUser);// 值班调度
		}
		if(StringUtils.isNotBlank(deadLine)) {
			dispathRoot.setDeadLine(StringDateToDateUtil.getDate(deadLine));
		}
		User[] acceptUsers = JsonUtil.jsonToJavaObj(acceptUser, User[].class);
		Set<User> acceptUserSet = new HashSet<User>();
		for (User u : acceptUsers) {
			acceptUserSet.add(u);// 受理人
		}
		dispathRoot.setAcceptUser(acceptUserSet);
		User[] copyUsers = JsonUtil.jsonToJavaObj(copyUser, User[].class);
		if (copyUsers.length != 0) {
			Set<User> copyUserSet = new HashSet<User>();
			for (User u : copyUsers) {
				copyUserSet.add(u);// 抄送人
			}
			dispathRoot.setCopyUser(copyUserSet);
		} else {
			dispathRoot.setCopyUser(null);
		}
		if (StringUtils.isNotBlank(content)) {
			dispathRoot.setSuggestion(content);// 命令内容
		}
		if (StringUtils.isNotBlank(issueUser)) {
			dispathRoot.setIssueUser(issueUser);// 命令签发者
		}
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		try {
			dispathBusinessService.updateAndSend(dispathRoot, dtos, user);
		} catch (Exception e) {
			return "修改并派发失败！";
		}
		return null;
	}

	/**
	 * 
	 * deleteDispatchRoot 批量删除调度命令
	 * 
	 * @param jsonIds
	 * @return
	 */
	@RequestMapping(value = "/deleteDispatchRoot", method = RequestMethod.POST)
	@ResponseBody
	public String deleteDispatchRoot(@RequestParam("jsonIds") String jsonIds) {
		dispathRootService.delByIds(jsonIds);
		return null;
	}
	
	/**
	 * 
	 * updateSelectUsers 变更执行人
	 * @param request
	 * @param id 调令ID
	 * @param receiveUserIds 变更的执行人员
	 * @param organizations 受令单位
	 * @return 1-变更执行人保存成功；2-失败；3-受理人没有变化
	 */
	@RequestMapping(value = "/updateSelectUsers", method = RequestMethod.POST)
	@ResponseBody
	public String updateSelectUsers(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("receiveUser") String receiveUser,
			@RequestParam("organizations") String organizations) {
		// 读取session中的用户
		User user = (User)request.getSession().getAttribute("user");
		// 接收人
		User[] receiveUserArr = JsonUtil.jsonToJavaObj(receiveUser, User[].class);
		List<String> receiveUserIds = new ArrayList<String>();
		for (User u : receiveUserArr) {
			receiveUserIds.add(u.getId());
		}
		
		ResultMsg result = new ResultMsg();
		try {
			String msg = dispathBusinessService.updateSelectUsers(id, receiveUserIds, user, organizations);
			if ("1".equals(msg)) {
				result.setStatus("3");
				result.setMsg("受理人没有变化！");
			}else {
				result.setStatus(ResultMsg.SUC_STATUS);
				result.setMsg("变更执行人保存成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setStatus(ResultMsg.FAIL_STATUS);
			result.setMsg(e.getMessage());//保存失败信息
		}
		return JsonUtil.javaToJsonAsString(result);
	}

	/**
	 * 
	 * getDispathRootTreeList 子调度命令树结构
	 * 
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getDispathRootTreeList", method = RequestMethod.POST)
	@ResponseBody
	public String getDispathRootTreeList(@RequestParam("id") String id) {
		DispathRoot dr = new DispathRoot();
		dr.setId(id);
		List<DispathRoot> childList = dispathRootTreeService.getDispathRootTreeList(dr);
		DispathRoot dispathRoot = dispathRootService.getById(id);
		for (DispathRoot d : childList) {
			d.setAssignRemark(dispathRoot.getAssignRemark());
		}
		return JsonUtil.javaToJsonAsString(childList);
	}

	/**
	 * 
	 * expDispatchRoot 调令导出excel
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expDispatchRoot", method = RequestMethod.POST)
	public void expDispatchRoot(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<DispatchRootExportDTO> dataList = new ArrayList<DispatchRootExportDTO>();
		DispatchRootExportDTO[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson,
				DispatchRootExportDTO[].class);
		Collections.addAll(dataList, dtos);

		String[] headerTableColumns = new String[] {
				"命令号" + "_" + "30" + "_" + "my.getDispatchNum()",
				"值班调度" + "_" + "30" + "_" + "my.getDispatchUser()",
				"发令时间" + "_" + "20" + "_" + "my.getSendDate()",
				"完成期限" + "_" + "20" + "_" + "my.getDeadLine()",
				"发令人" + "_" + "30" + "_" + "my.getSendUser()",
				"状态" + "_" + "30" + "_" + "my.getStatus()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		CommonPoiExportExcel<DispatchRootExportDTO> export = new CommonPoiExportExcel<DispatchRootExportDTO>();
		export.exportXls("创建调度命令", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}

	/**
	 * 
	 * getAllDispatchRootQuery 全部调度命令查询
	 * 
	 * @param request
	 * @param number 命令号
	 * @param status 状态
	 * @param startTime 创建开始时间
	 * @param endTime 创建结束时间
	 * @param start
	 * @param limit
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getAllDispatchRootQuery", method = RequestMethod.POST)
	@ResponseBody
	public String getAllDispatchRootQuery(HttpServletRequest request,
			@RequestParam("number") String number,
			@RequestParam("status") String status,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime,
			@RequestParam("start") int start, @RequestParam("limit") int limit,
			@RequestParam("overTimeStatus") String overTimeStatus) {
		DispathManageDTO dto = new DispathManageDTO();
		dto.setIsRoot(DispathRoot.IS_ROOT);
		dto.setOverTimeStatus(overTimeStatus);
		if (StringUtils.isNotBlank(number)) {
			dto.setDispatchNum(number.replace(" ", ""));
		}
		if (StringUtils.isNotBlank(status)) {
			dto.setStatus(status);
		}
		if (StringUtils.isNotBlank(startTime)) {
			dto.setSendDateStartByRoot(StringDateToDateUtil.getDate(startTime));
		}
		if (StringUtils.isNotBlank(endTime)) {
			dto.setSendDateEndByRoot(StringDateToDateUtil.getDate(endTime));
		}
		GridDto<DispathRoot> gridDto = dispathRootService.getByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * expAllDispatchRoot 全部调令导出
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expAllDispatchRoot", method = RequestMethod.POST)
	public void expAllDispatchRoot(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<DispatchRootExportDTO> dataList = new ArrayList<DispatchRootExportDTO>();
		DispatchRootExportDTO[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson,
				DispatchRootExportDTO[].class);
		Collections.addAll(dataList, dtos);

		String[] headerTableColumns = new String[] {
				"命令号" + "_" + "30" + "_" + "my.getDispatchNum()",
				"值班调度" + "_" + "30" + "_" + "my.getDispatchUser()",
				"发令时间" + "_" + "20" + "_" + "my.getSendDate()",
				"完成期限" + "_" + "20" + "_" + "my.getDeadLine()",
				"发令人" + "_" + "30" + "_" + "my.getSendUser()",
				"状态" + "_" + "30" + "_" + "my.getStatus()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		CommonPoiExportExcel<DispatchRootExportDTO> export = new CommonPoiExportExcel<DispatchRootExportDTO>();
		export.exportXls("全部调度命令", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}

	/**
	 * 
	 * getDispathBacklog 获取待办调令list
	 * 
	 * @param request
	 * @param number 命令号
	 * @param status 状态
	 * @param startTime 发送开始时间
	 * @param endTime 发送结束时间
	 * @param start
	 * @param limit
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getDispathBacklog", method = RequestMethod.POST)
	@ResponseBody
	public String getDispathBacklog(HttpServletRequest request,
			@RequestParam("number") String number,
			@RequestParam("status") String status,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime,
			@RequestParam("start") int start, @RequestParam("limit") int limit,
			@RequestParam("overTimeStatus") String overTimeStatus
			) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathManageDTO dto = new DispathManageDTO();
		dto.setOverTimeStatus(overTimeStatus);
		dto.setUser(user);
		dto.setIsRoot(DispathRoot.IS_NOT_ROOT);
		if (StringUtils.isNotBlank(number)) {
			dto.setDispatchNum(number.replace(" ", ""));
		}
		if (StringUtils.isNotBlank(status)) {
			dto.setStatus(status);
		}
		if (StringUtils.isNotBlank(startTime)) {
			dto.setSendDateStart(StringDateToDateUtil.getDate(startTime));
		}
		if (StringUtils.isNotBlank(endTime)) {
			dto.setSendDateEnd(StringDateToDateUtil.getDate(endTime));
		}
		GridDto<DispathRoot> gridDto = dispathRootService.getToDoByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * receive 待办调令接收
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/receive", method = RequestMethod.POST)
	@ResponseBody
	public String receive(@RequestParam("id") String id) {
		DispathRoot dispathRoot = new DispathRoot();
		dispathRoot.setId(id);
		dispathBusinessService.receive(dispathRoot);
		return null;
	}

	/**
	 * 
	 * reply 回复
	 * 
	 * @param request
	 * @param id
	 * @param replyContent 回复内容
	 * @param uploadFileArr 上传文件
	 * @return
	 */
	@RequestMapping(value = "/dispathRootReply", method = RequestMethod.POST)
	@ResponseBody
	public Boolean dispathRootReply(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("replyContent") String replyContent,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathRoot dispathRoot = new DispathRoot();
		dispathRoot.setId(id);
		if (StringUtils.isNotBlank(replyContent)) {
			dispathRoot.setReplyContent(replyContent);
		}
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		return dispathBusinessService.reply(dispathRoot, dtos, user);
	}
	@RequestMapping(value = "/changereceive", method = RequestMethod.POST)
	@ResponseBody
	public Boolean Changereceive(@RequestParam("id") String id,HttpServletRequest request) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathRoot dispathRoot = new DispathRoot();
		return dispathBusinessService.ChangeReveive(dispathRoot, user);
	}
	/**
	 * 
	 * drAssignBefore 分派前加载之前分派过的人员
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/drAssignBefore", method = RequestMethod.POST)
	@ResponseBody
	public String drAssignBefore(@RequestParam("id") String id){
		DispathRoot parent = new DispathRoot();
		parent.setId(id);
		DispathRoot dr = dispathRootService.getDispatchByParent(parent);
		return JsonUtil.javaToJsonAsString(dr);
	}
	
	@RequestMapping(value="/checkSelectedWorkAreaUser",method=RequestMethod.POST)
	@ResponseBody
	public String checkSelectedWorkAreaUser(HttpServletRequest request,
													@RequestParam("workShopId") String workShopId, 
													@RequestParam("rootId") String rootId){
		User user = (User) request.getSession().getAttribute("user");
		return JsonUtil.javaToJsonAsString(dispathRootService.checkSelectedWorkAreaUser(workShopId, rootId,user.getId()));
	}

	/**
	 * 
	 * dispathRootAssign 分派
	 * 
	 * @param id
	 * @param assignUser 分派人员
	 * @param assignContent 分派说明
	 * @return
	 */
	@RequestMapping(value = "/dispathRootAssign", method = RequestMethod.POST)
	@ResponseBody
	public Boolean dispathRootAssign(@RequestParam("id") String id,
			@RequestParam("assignUser") String assignUser,
			@RequestParam("assignContent") String assignContent) {
		User[] assignUsers = JsonUtil.jsonToJavaObj(assignUser, User[].class);
		List<User> users = new ArrayList<User>();
		for (User user : assignUsers) {
			users.add(user);// 分派执行人员
		}
		DispathRoot dispathRoot = new DispathRoot();
		dispathRoot.setId(id);
		if (StringUtils.isNotBlank(assignContent)) {
			dispathRoot.setAssignRemark(assignContent);
		}
		return dispathBusinessService.assign(dispathRoot, users);
	}

	/**
	 * 
	 * expDispatchBacklog 待办调令导出Excel
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expDispatchBacklog", method = RequestMethod.POST)
	public void expDispatchBacklog(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<DispatchRootExportDTO> dataList = new ArrayList<DispatchRootExportDTO>();
		DispatchRootExportDTO[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson,
				DispatchRootExportDTO[].class);
		Collections.addAll(dataList, dtos);

		String[] headerTableColumns = new String[] {
				"命令号" + "_" + "30" + "_" + "my.getDispatchNum()",
				"发令单位" + "_" + "30" + "_" + "my.getOrganization()",
				"发令人" + "_" + "30" + "_" + "my.getSendUser()",
				"发令时间" + "_" + "20" + "_" + "my.getSendDate()",
				"完成期限" + "_" + "20" + "_" + "my.getDeadLine()",
				"状态" + "_" + "30" + "_" + "my.getStatus()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		CommonPoiExportExcel<DispatchRootExportDTO> export = new CommonPoiExportExcel<DispatchRootExportDTO>();
		export.exportXls("待办调度命令", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}

	/**
	 * 
	 * getDispatchRootCopyList 抄送列表list
	 * 
	 * @param request
	 * @param number 命令号
	 * @param status 状态
	 * @param startTime 创建开始时间
	 * @param endTime 创建结束时间
	 * @param start
	 * @param limit
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getDispatchRootCopyList", method = RequestMethod.POST)
	@ResponseBody
	public String getDispatchRootCopyList(HttpServletRequest request,
			@RequestParam("number") String number,
			@RequestParam("status") String status,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime,
			@RequestParam("start") int start, @RequestParam("limit") int limit,
			@RequestParam("overTimeStatus") String overTimeStatus) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathManageDTO dto = new DispathManageDTO();
		dto.setOverTimeStatus(overTimeStatus);
		dto.setIsRoot(DispathRoot.IS_ROOT);
		dto.setCopyUser(user);
		if (StringUtils.isNotBlank(number)) {
			dto.setDispatchNum(number.replace(" ", ""));
		}
		if (StringUtils.isNotBlank(status)) {
			dto.setStatus(status);
		}
		if (StringUtils.isNotBlank(startTime)) {
			dto.setSendDateStartByRoot(StringDateToDateUtil.getDate(startTime));
		}
		if (StringUtils.isNotBlank(endTime)) {
			dto.setSendDateEndByRoot(StringDateToDateUtil.getDate(endTime));
		}
		GridDto<DispathRoot> gridDto = dispathRootService.getByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * expDispatchRootCopy 调度命令抄送列表Excel导出
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expDispatchRootCopy", method = RequestMethod.POST)
	public void expDispatchRootCopy(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<DispatchRootExportDTO> dataList = new ArrayList<DispatchRootExportDTO>();
		DispatchRootExportDTO[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson,
				DispatchRootExportDTO[].class);
		Collections.addAll(dataList, dtos);

		String[] headerTableColumns = new String[] {
				"命令号" + "_" + "30" + "_" + "my.getDispatchNum()",
				"值班调度" + "_" + "30" + "_" + "my.getDispatchUser()",
				"发令时间" + "_" + "20" + "_" + "my.getSendDate()",
				"完成期限" + "_" + "20" + "_" + "my.getDeadLine()",
				"发令人" + "_" + "30" + "_" + "my.getSendUser()",
				"状态" + "_" + "30" + "_" + "my.getStatus()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		CommonPoiExportExcel<DispatchRootExportDTO> export = new CommonPoiExportExcel<DispatchRootExportDTO>();
		export.exportXls("调度命令抄送列表", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}
	
	/**
	 * getSelectUsersByOrgId 根据组织机构orgId获取用户（用于多选显示）
	 * id 为待转派的命令id（通过该id获取父命令id，
                        		通过父命令id获取所有该父命令的子命令，
                        		子命令中有个owner属性表示的命令所属用户，
                        		通过这个属性过滤掉下拉选中已经拥有子命令的用户）
	 */
	@RequestMapping(value = "/getSelectUsersByOrgId", method = RequestMethod.POST)
	@ResponseBody
	public String getSelectUsersByOrgId (
			@RequestParam("orgId") String orgId,
			@RequestParam("id") String id
			) {
		if(StringUtils.isNotBlank(orgId)) {
			List<NameAndIdDTO> data = dispathBusinessService.getSelectUsersByOrgId(id,orgId);
			return JsonUtil.javaToJsonAsString(data);
		}
		return "";
	}
	
	/**转派任务-多选-yangsy*/
	@RequestMapping(value="/turnToSendMultiUser",method=RequestMethod.POST)
	@ResponseBody
	public String turnToSendMultiUser(
			@RequestParam("id") String id,
			@RequestParam("receiveUserId") String receiveUserId ){
		dispathBusinessService.turnToSendMultiUser(id, receiveUserId);
		return null;
	}
	
	/**
	 * 
	 * getToDoByWorkShopDirector 获取待办调令(车间主任)数据
	 * 
	 * @param request
	 * @param number 命令号
	 * @param status 状态
	 * @param startTime 发令开始时间
	 * @param endTime 发令结束时间
	 * @param start 
	 * @param limit
	 * @return JSON字符串
	 */
	@RequestMapping(value="/getToDoByWorkShopDirector", method=RequestMethod.POST)
	@ResponseBody
	public String getToDoByWorkShopDirector(
			HttpServletRequest request,
			@RequestParam("number") String number,
			@RequestParam("status") String status,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime,
			@RequestParam("start") int start, @RequestParam("limit") int limit,
			@RequestParam("overTimeStatus") String overTimeStatus) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		DispathManageDTO dto = new DispathManageDTO();
		dto.setIsRoot(DispathRoot.IS_NOT_ROOT);
		dto.setOverTimeStatus(overTimeStatus);
		dto.setUserOrgId(user.getOrganization().getId());
		if (StringUtils.isNotBlank(number)) {
			dto.setDispatchNum(number.replace(" ", ""));
		}
		if (StringUtils.isNotBlank(status)) {
			dto.setStatus(status);
		}
		if (StringUtils.isNotBlank(startTime)) {
			dto.setSendDateStart(StringDateToDateUtil.getDate(startTime));
		}
		if (StringUtils.isNotBlank(endTime)) {
			dto.setSendDateEnd(StringDateToDateUtil.getDate(endTime));
		}
		GridDto<DispathRoot> gridDto = dispathRootService.getToDoGridDtoByWorkShopDirector(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**
	 * 
	 * expToDoByWorkShopDirector 待办调令(车间主任)导出Excel
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expToDoByWorkShopDirector", method = RequestMethod.POST)
	public void expToDoByWorkShopDirector(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<DispatchRootExportDTO> dataList = new ArrayList<DispatchRootExportDTO>();
		DispatchRootExportDTO[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson,
				DispatchRootExportDTO[].class);
		Collections.addAll(dataList, dtos);

		String[] headerTableColumns = new String[] {
				"命令号" + "_" + "30" + "_" + "my.getDispatchNum()",
				"发令单位" + "_" + "30" + "_" + "my.getOrganization()",
				"发令人" + "_" + "20" + "_" + "my.getSendUser()",
				"发令时间" + "_" + "20" + "_" + "my.getSendDate()",
				"完成期限" + "_" + "20" + "_" + "my.getDeadLine()",
				"受令单位" + "_" + "30" + "_" + "my.getUserOrg()",
				"受令人" + "_" + "20" + "_" + "my.getUser()",
				"状态" + "_" + "15" + "_" + "my.getStatus()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		CommonPoiExportExcel<DispatchRootExportDTO> export = new CommonPoiExportExcel<DispatchRootExportDTO>();
		export.exportXls("待办调度命令", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}

}
