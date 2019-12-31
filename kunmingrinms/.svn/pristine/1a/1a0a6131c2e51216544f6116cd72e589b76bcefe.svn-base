
/**   
 * 文件名：TaskRootAction.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-13 下午3:37:28   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.taskManage.domain.TaskRoot;
import com.enovell.yunwei.taskManage.dto.TaskExportDto;
import com.enovell.yunwei.taskManage.dto.TaskSearchDto;
import com.enovell.yunwei.taskManage.service.TaskBusinessService;
import com.enovell.yunwei.taskManage.service.TaskRootService;
import com.enovell.yunwei.taskManage.service.TaskRootTreeService;
import com.enovell.yunwei.taskManage.service.ToDoTaskRootService;
import com.enovell.yunwei.util.JsonUtil;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootAction   
 * 类描述:  临时任务管理 action
 * 创建人：ltf 
 * 创建时间：2016-12-13 下午3:37:28
 * 修改人：ltf
 * 修改时间：2016-12-13 下午3:37:28   
 */
@Controller
@RequestMapping("/taskRootAction")
public class TaskRootAction {
	
	@Resource(name="taskRootService")
	private TaskRootService taskRootService;
	
	@Resource(name="taskBusinessService")
	private TaskBusinessService taskBusinessService;
	
	@Resource(name = "taskRootTreeService")
	private TaskRootTreeService taskRootTreeService;
	
	@Resource(name = "toDoTaskRootService")
	private ToDoTaskRootService toDoTaskRootService;
	
	/**
	 * 创建页面分页查询
	 * getAddListByDto 
	 * @param request
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 * @author luoyan
	 */
	@RequestMapping(value="/getAddListByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getAddListByDto(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit){
		TaskSearchDto dto=JsonUtil.jsonToJavaObj(param, TaskSearchDto.class,JsonUtil.DATE);
		User user = (User) request.getSession().getAttribute("user");
		dto.setOwner(user);//任务所属人
		GridDto<TaskRoot> gridDto = taskRootService.getAddListByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * 
	 * getTaskByDto 根据dto查询根任务-分页查询-创建任务
	 *
	 * @param request
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getTaskByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getTaskByDto(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit){
		TaskSearchDto dto=JsonUtil.jsonToJavaObj(param, TaskSearchDto.class);
		User user = (User) request.getSession().getAttribute("user");
		dto.setOwner(user);//任务所属人
		GridDto<TaskRoot> gridDto = taskRootService.getByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**
	 * 
	 * getTaskById 根据id查询任务
	 *
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getTaskById",method=RequestMethod.POST)
	@ResponseBody
	public String getTaskById(@RequestParam("id") String id){
		TaskRoot taskRoot = taskRootService.getById(id);
		taskRoot.setChildren(null);
		return JsonUtil.javaToJsonAsString(taskRoot);
	}
	
	/**
	 * 
	 * addAndSendTaskRoot 新增并派发任务
	 *
	 * @param request
	 * @param param
	 * @param receiveUser
	 * @param carbonCopyUser
	 * @param uploadFileArr
	 * @return
	 */
	@RequestMapping(value="/addAndSendTaskRoot",method=RequestMethod.POST)
	@ResponseBody
	public String addAndSendTaskRoot(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("receiveUser") String receiveUser, 
													@RequestParam("carbonCopyUser") String carbonCopyUser,
													@RequestParam("uploadFileArr") String uploadFileArr){
		User user = (User) request.getSession().getAttribute("user");
		TaskRoot taskRoot=new TaskRoot();
		
		taskRoot.setCreatUser(user);
		taskRoot.setOwner(user);
		TaskRoot paramTask=JsonUtil.jsonToJavaObj(param, TaskRoot.class,JsonUtil.DATE);
		taskRoot.setTitle(paramTask.getTitle());
		taskRoot.setLinkman(user);
		taskRoot.setLimitTime(paramTask.getLimitTime());
		taskRoot.setTaskType(paramTask.getTaskType());
		taskRoot.setTaskLevel(paramTask.getTaskLevel());
		taskRoot.setRemark(paramTask.getRemark());
		
		
		taskRoot.setSendUser(user);
		//接收人
		User[] receiveUserArr = JsonUtil.jsonToJavaObj(receiveUser, User[].class);
		Set<User> receiveUserSet=new HashSet<User>();
		for (User ru : receiveUserArr) {
			receiveUserSet.add(ru);
		}
		taskRoot.setReceiveUsers(receiveUserSet);
		
		//抄送人
		User[] carbonCopyUserArr = JsonUtil.jsonToJavaObj(carbonCopyUser, User[].class);
		Set<User> carbonCopyUserSet=new HashSet<User>();
		for (User cu : carbonCopyUserArr) {
			carbonCopyUserSet.add(cu);
		}
		taskRoot.setCarbonCopyUser(carbonCopyUserSet);
		
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,UploadFileDto[].class);
		
		taskBusinessService.addAndSendTaskRoot(taskRoot, dtos);
		return null;
	}
	
	/**
	 * 
	 * addTaskRoot 新增任务
	 *
	 * @param request
	 * @param param
	 * @param receiveUser
	 * @param carbonCopyUser
	 * @param uploadFileArr
	 * @return
	 */
	@RequestMapping(value="/addTaskRoot",method=RequestMethod.POST)
	@ResponseBody
	public String addTaskRoot(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("receiveUser") String receiveUser, 
													@RequestParam("carbonCopyUser") String carbonCopyUser,
													@RequestParam("uploadFileArr") String uploadFileArr){
		User user = (User) request.getSession().getAttribute("user");
		TaskRoot taskRoot = new TaskRoot();
		
		taskRoot.setCreatUser(user);
		taskRoot.setOwner(user);
		TaskRoot paramTask = JsonUtil.jsonToJavaObj(param, TaskRoot.class,JsonUtil.DATE);
		taskRoot.setTitle(paramTask.getTitle());
		taskRoot.setLinkman(user);
		taskRoot.setLimitTime(paramTask.getLimitTime());
		taskRoot.setTaskType(paramTask.getTaskType());
		taskRoot.setTaskLevel(paramTask.getTaskLevel());
		taskRoot.setRemark(paramTask.getRemark());
		
		//接收人
		User[] receiveUserArr = JsonUtil.jsonToJavaObj(receiveUser, User[].class);
		Set<User> receiveUserSet=new HashSet<User>();
		for (User ru : receiveUserArr) {
			receiveUserSet.add(ru);
		}
		taskRoot.setReceiveUsers(receiveUserSet);
		
		//抄送人
		User[] carbonCopyUserArr = JsonUtil.jsonToJavaObj(carbonCopyUser, User[].class);
		Set<User> carbonCopyUserSet=new HashSet<User>();
		for (User cu : carbonCopyUserArr) {
			carbonCopyUserSet.add(cu);
		}
		taskRoot.setCarbonCopyUser(carbonCopyUserSet);
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,UploadFileDto[].class);
		//保存
		taskBusinessService.add(taskRoot, dtos);
		return null;
	}
	
	/**
	 * 
	 * updateAndSendTaskRoot 修改任务（修改并派发任务）
	 *
	 * @param request
	 * @param param
	 * @param receiveUser
	 * @param carbonCopyUser
	 * @param uploadFileArr
	 * @return
	 */
	@RequestMapping(value="/updateAndSendTaskRoot",method=RequestMethod.POST)
	@ResponseBody
	public String updateAndSendTaskRoot(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("receiveUser") String receiveUser, 
													@RequestParam("carbonCopyUser") String carbonCopyUser,
													@RequestParam("uploadFileArr") String uploadFileArr){
		User user = (User) request.getSession().getAttribute("user");
		TaskRoot paramTask=JsonUtil.jsonToJavaObj(param, TaskRoot.class,JsonUtil.DATE);
		
		//接收人
		User[] receiveUserArr = JsonUtil.jsonToJavaObj(receiveUser, User[].class);
		Set<User> receiveUserSet=new HashSet<User>();
		for (User ru : receiveUserArr) {
			receiveUserSet.add(ru);
		}
		paramTask.setReceiveUsers(receiveUserSet);
		
		//抄送人
		User[] carbonCopyUserArr = JsonUtil.jsonToJavaObj(carbonCopyUser, User[].class);
		Set<User> carbonCopyUserSet=new HashSet<User>();
		for (User cu : carbonCopyUserArr) {
			carbonCopyUserSet.add(cu);
		}
		paramTask.setCarbonCopyUser(carbonCopyUserSet);
		
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,UploadFileDto[].class);
		
		ResultMsg result = new ResultMsg();
		try {
			//修改并派发
			taskBusinessService.updateAndSendTaskRoot(paramTask, dtos, user);
			result.setStatus(ResultMsg.SUC_STATUS);
			result.setMsg("修改并保存成功！");
		} catch (Exception e) {
			e.printStackTrace();
			result.setStatus(ResultMsg.FAIL_STATUS);
			result.setMsg(e.getMessage());//保存失败信息
		}
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**
	 * 
	 * updateTaskRoot 修改任务并保存
	 *
	 * @param request
	 * @param param
	 * @param receiveUser
	 * @param carbonCopyUser
	 * @param uploadFileArr
	 * @return
	 */
	@RequestMapping(value="/updateTaskRoot",method=RequestMethod.POST)
	@ResponseBody
	public String updateTaskRoot(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("receiveUser") String receiveUser, 
													@RequestParam("carbonCopyUser") String carbonCopyUser,
													@RequestParam("uploadFileArr") String uploadFileArr){
		User user = (User) request.getSession().getAttribute("user");
		TaskRoot paramTask=JsonUtil.jsonToJavaObj(param, TaskRoot.class,JsonUtil.DATE);
		
		//接收人
		User[] receiveUserArr = JsonUtil.jsonToJavaObj(receiveUser, User[].class);
		Set<User> receiveUserSet=new HashSet<User>();
		for (User ru : receiveUserArr) {
			receiveUserSet.add(ru);
		}
		paramTask.setReceiveUsers(receiveUserSet);
		
		//抄送人
		User[] carbonCopyUserArr = JsonUtil.jsonToJavaObj(carbonCopyUser, User[].class);
		Set<User> carbonCopyUserSet=new HashSet<User>();
		for (User cu : carbonCopyUserArr) {
			carbonCopyUserSet.add(cu);
		}
		paramTask.setCarbonCopyUser(carbonCopyUserSet);
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,UploadFileDto[].class);
		
		ResultMsg result=new ResultMsg();
		//保存
		try {
			taskBusinessService.updateAndSave(paramTask, dtos, user);
			result.setStatus(ResultMsg.SUC_STATUS);
			result.setMsg("修改并保存成功！");
		} catch (Exception e) {
			e.printStackTrace();
			result.setStatus(ResultMsg.FAIL_STATUS);
			result.setMsg(e.getMessage());//保存失败信息
		}
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**
	 * 
	 * deleteTaskRootByIds 删除任务
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/deleteTaskRootByIds",method=RequestMethod.POST)
	@ResponseBody
	public String deleteTaskRootByIds(@RequestParam("ids") String ids){
		taskRootService.deleteTaskRootByIds(ids);
		return null;
	}
	
	/**
	 * 
	 * sendToCheck 发送审核
	 *
	 * @param id
	 * @param receiveUserId
	 * @return
	 */
	@RequestMapping(value="/sendToCheck",method=RequestMethod.POST)
	@ResponseBody
	public String sendToCheck(@RequestParam("id") String id, 
													@RequestParam("receiveUserId") String receiveUserId){
		taskBusinessService.sendToCheck(id, receiveUserId);
		return null;
	}
	
	/**
	 * 
	 * sendTaskRoot 派发
	 *
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/sendTaskRoot",method=RequestMethod.POST)
	@ResponseBody
	public String sendTaskRoot(@RequestParam("id") String id){
		//派发
		taskBusinessService.sendTaskRoot(id);
		return null;
	}
	
	/**
	 * 
	 * getTaskRootTreeList 详情，获取子任务调度树
	 *
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getTaskRootTreeList",method=RequestMethod.POST)
	@ResponseBody
	public String getTaskRootTreeList(@RequestParam("id") String id){
		TaskRoot taskRoot = new TaskRoot();
		taskRoot.setId(id);
		List<TaskRoot> taskRootTree = taskRootTreeService.getTaskRootTreeList(taskRoot);
		return JsonUtil.javaToJsonAsString(taskRootTree);
	}
	
	/**
	 * 
	 * updateReceiveUser 变更执行人
	 * @param taskId 任务主表ID
	 * @param receiveUser 变更的执行人员
	 * @return 1-变更执行人保存成功；2-失败；3-受理人没有变化
	 */
	@RequestMapping(value="/updateReceiveUser",method = RequestMethod.POST)
	@ResponseBody
	public String updateReceiveUser(@RequestParam("id") String taskId,
			@RequestParam("receiveUser") String receiveUser,
			HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		//接收人
		User[] receiveUserArr = JsonUtil.jsonToJavaObj(receiveUser, User[].class);
		List<String> receiveUserIds = new ArrayList<String>();
		for (User u : receiveUserArr) {
			receiveUserIds.add(u.getId());
		}
		
		ResultMsg result = new ResultMsg();
		try {
			String msg = taskBusinessService.updateSelectUsers(taskId, receiveUserIds, user);
			if ("1".equals(msg)) {
				result.setStatus("3");
				result.setMsg("接收人没有变化！");
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
	 * expTaskRoot 导出任务至Excel
	 *
	 * @param exportXlsJson
	 * @param fileName
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/expTaskRoot",method = RequestMethod.POST)
	@ResponseBody
	public void expTaskRoot(@RequestParam("exportXlsJson") String exportXlsJson,
												@RequestParam("fileName") String fileName,
												HttpServletRequest request, HttpServletResponse response ){
		//获得当前页的所有记录（数组）
		TaskExportDto[] dtos=JsonUtil.jsonToJavaObj(exportXlsJson, TaskExportDto[].class,JsonUtil.DATE);
		if(dtos==null){
			return;
		}
		//将数组转化为List集合	
		List<TaskExportDto> dataList=new ArrayList<TaskExportDto>(Arrays.asList(dtos));	
		String[] headerTableColumns = null;
		if ("创建任务".equals(fileName) || "全部任务查询".equals(fileName)
				|| "抄送列表".equals(fileName)) {
			headerTableColumns = new String[] {// 标题行
					"任务标题" + "_" + "25" + "_" + "my.getTitle()",
					"紧急程度" + "_" + "25" + "_" + "my.getTaskLevel()",
					"任务类别" + "_" + "25" + "_" + "my.getTaskType()",
					"派发时间" + "_" + "25" + "_" + "my.getSendDate()",
					"完成期限" + "_" + "25" + "_" + "my.getLimitTime()",
					"联系人" + "_" + "25" + "_" + "my.getLinkman()",
					"状态" + "_" + "25" + "_" + "my.getStatus()" };
		} else {
			headerTableColumns = new String[] {// 标题行
					"任务标题" + "_" + "25" + "_" + "my.getTitle()",
					"紧急程度" + "_" + "25" + "_" + "my.getTaskLevel()",
					"任务类别" + "_" + "25" + "_" + "my.getTaskType()",
					"派发时间" + "_" + "25" + "_" + "my.getSendDate()",
					"完成期限" + "_" + "25" + "_" + "my.getLimitTime()",
					"联系人" + "_" + "25" + "_" + "my.getLinkman()",
					"送审时间" + "_" + "25" + "_" + "my.getSendDate()",
					"状态" + "_" + "25" + "_" + "my.getStatus()" };
		}
		
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE));
		
		CommonPoiExportExcel<TaskExportDto> export = new CommonPoiExportExcel<TaskExportDto>();
		export.exportXls(fileName, headerTableColumns, expandJexlContext,dataList, request, response);
	}
	
	/**
	 * 
	 * getShowDtoOfBackTask 已退回任务（查看的数据与用户无关）-条件、分页查询
	 *
	 * @date 2017-7-7 下午2:28:15 
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getShowDtoOfBackTask",method=RequestMethod.POST)
	@ResponseBody
	public String getShowDtoOfBackTask(@RequestParam("param") String param, 
										@RequestParam("start") int start, 
										@RequestParam("limit") int limit){
		TaskSearchDto dto=JsonUtil.jsonToJavaObj(param, TaskSearchDto.class,JsonUtil.DATE);
		dto.setStatus(TaskRoot.YI_TUI_HUI);//已退回状态
		GridDto<TaskRoot> gridDto = toDoTaskRootService.getTaskRecentOfToDoGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**
	 * 
	 * resendBackTask 已退回任务重派
	 *
	 * @param id
	 * @param receiveUserId
	 * @return
	 */
	@RequestMapping(value="/resendBackTask",method=RequestMethod.POST)
	@ResponseBody
	public String resendBackTask(@RequestParam("id") String id, 
													@RequestParam("receiveUserId") String receiveUserId){
		taskBusinessService.resend(id, receiveUserId);
		return null;
	}
	
	/**
	 * 
	 * delBackTask 已退回任务删除
	 *
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/delBackTask",method=RequestMethod.POST)
	@ResponseBody
	public String delBackTask(@RequestParam("id") String id,
			HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		taskBusinessService.delBackTask(id, user);
		return null;
	}
	
	/**
	 * 
	 * getCheckByDTO 根据dto查询任务-分页查询-任务审核
	 *
	 * @param request
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getCheckByDTO",method=RequestMethod.POST)
	@ResponseBody
	public String getCheckByDTO(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit){
		TaskSearchDto dto=JsonUtil.jsonToJavaObj(param, TaskSearchDto.class,JsonUtil.DATE);
		User user = (User) request.getSession().getAttribute("user");
		dto.setOwner(user);//隐藏条件-任务所属人
		GridDto<TaskRoot> gridDto = taskRootService.getCheckByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**
	 * 
	 * checkTask 审核任务
	 *
	 * @param id
	 * @param checkFileArr
	 * @param checkMsg
	 * @param status
	 * @return
	 */
	@RequestMapping(value="/checkTask",method=RequestMethod.POST)
	@ResponseBody
	public String checkTask(@RequestParam("id") String id,
											@RequestParam("checkFileArr") String checkFileArr,
											@RequestParam("checkMsg") String checkMsg,
											@RequestParam("status") String status){
		TaskRoot taskRoot=new TaskRoot();
		taskRoot.setId(id);
		// 获取多个上传的审核文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(checkFileArr,UploadFileDto[].class);
		taskRoot.setCheckMsg(checkMsg);
		taskRoot.setStatus(status);
		
		taskBusinessService.checkTask(taskRoot,dtos);
		return null;
	}
	
	/**
	 * 
	 * getAllTaskOfRootByDto 根据dto查询全部任务-分页查询-全部任务查询
	 *
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getAllTaskOfRootByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getAllTaskOfRootByDto(@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit){
		TaskSearchDto dto=JsonUtil.jsonToJavaObj(param, TaskSearchDto.class,JsonUtil.DATE);
		GridDto<TaskRoot> gridDto = taskRootService.getByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * getCopyTaskListByDto 根据dto查询全部任务-分页查询-抄送列表
	 *
	 * @param request
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getCopyTaskListByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getCopyTaskListByDto(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit){
		TaskSearchDto dto=JsonUtil.jsonToJavaObj(param, TaskSearchDto.class,JsonUtil.DATE);
		User user = (User) request.getSession().getAttribute("user");//抄送人
		dto.setCopyUser(user);
		GridDto<TaskRoot> gridDto = taskRootService.getByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	
}
