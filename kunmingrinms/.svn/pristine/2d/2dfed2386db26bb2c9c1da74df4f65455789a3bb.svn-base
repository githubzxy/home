package com.enovell.yunwei.circuitWO.web;

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
import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.circuitWO.dto.CircuitWOExportDto;
import com.enovell.yunwei.circuitWO.dto.CircuitWOSearchDto;
import com.enovell.yunwei.circuitWO.service.CircuitWOBusinessService;
import com.enovell.yunwei.circuitWO.service.CircuitWORootTreeService;
import com.enovell.yunwei.circuitWO.service.CircuitWOService;
import com.enovell.yunwei.circuitWO.service.ToDoCircuitWOService;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.util.JsonUtil;

/**
 * 项目名称：kumingrinms
 * 类名称：CircuitSheetManage  
 * 类描述:  电路工单管理 action
 * @author lilt
 * @since 2018-10-29 4:44:46 PM
 */
@Controller
@RequestMapping("circuitWOAction")
public class CircuitWOAction {
	@Resource(name="circuitWOService")
	private CircuitWOService circuitService;
	
	@Resource(name="circuitBusinessService")
	private CircuitWOBusinessService circuitBusinessService;
	
	@Resource(name = "circuitRootTreeService")
	private CircuitWORootTreeService citcuitRootTreeService;
	
	@Resource(name = "toDoCircuitWOService")
	private ToDoCircuitWOService toDoCircuitWOService;
	
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
		CircuitWOSearchDto dto=JsonUtil.jsonToJavaObj(param, CircuitWOSearchDto.class,JsonUtil.DATE);
		User user = (User) request.getSession().getAttribute("user");
		dto.setOwner(user);//任务所属人
		GridDto<CircuitWO> gridDto = circuitService.getAddListByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * getCircuitWOByDto 根据dto查询根任务-分页查询-创建任务
	 * @param request
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getCircuitWOByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getCircuitWOByDto(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit){
		CircuitWOSearchDto dto=JsonUtil.jsonToJavaObj(param, CircuitWOSearchDto.class);
		User user = (User) request.getSession().getAttribute("user");
		dto.setOwner(user);//任务所属人
		GridDto<CircuitWO> gridDto = circuitService.getByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**
	 * 
	 * getCircuitWOById 根据id查询任务
	 *
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getCircuitWOById",method=RequestMethod.POST)
	@ResponseBody
	public String getCircuitWOById(@RequestParam("id") String id){
		CircuitWO taskRoot = circuitService.getById(id);
		taskRoot.setChildren(null);
		return JsonUtil.javaToJsonAsString(taskRoot);
	}
	
	/**
	 * addAndSendCircuitWO 新增并派发任务
	 * @param request
	 * @param param
	 * @param receiveUser
	 * @param carbonCopyUser
	 * @param uploadFileArr
	 * @return
	 */
	@RequestMapping(value="/addAndSendCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String addAndSendCircuitWO(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("receiveUser") String receiveUser, 
													@RequestParam("carbonCopyUser") String carbonCopyUser,
													@RequestParam("uploadFileArr") String uploadFileArr){
		User user = (User) request.getSession().getAttribute("user");
		CircuitWO taskRoot=new CircuitWO();
		
		taskRoot.setCreatUser(user);
		taskRoot.setOwner(user);
		CircuitWO paramTask=JsonUtil.jsonToJavaObj(param, CircuitWO.class,JsonUtil.DATE);
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
		
		circuitBusinessService.addAndSendCircuitWO(taskRoot, dtos);
		return null;
	}
	
	/**
	 * addCircuitWO 新增任务
	 * @param request
	 * @param param
	 * @param receiveUser
	 * @param carbonCopyUser
	 * @param uploadFileArr
	 * @return
	 */
	@RequestMapping(value="/addCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String addCircuitWO(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("receiveUser") String receiveUser, 
													@RequestParam("carbonCopyUser") String carbonCopyUser,
													@RequestParam("uploadFileArr") String uploadFileArr){
		User user = (User) request.getSession().getAttribute("user");
		CircuitWO taskRoot = new CircuitWO();
		
		taskRoot.setCreatUser(user);
		taskRoot.setOwner(user);
		CircuitWO paramTask = JsonUtil.jsonToJavaObj(param, CircuitWO.class,JsonUtil.DATE);
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
		circuitBusinessService.add(taskRoot, dtos);
		return null;
	}
	
	/**
	 * updateAndSendCircuitWO 修改任务（修改并派发任务）
	 * @param request
	 * @param param
	 * @param receiveUser
	 * @param carbonCopyUser
	 * @param uploadFileArr
	 * @return
	 */
	@RequestMapping(value="/updateAndSendCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String updateAndSendCircuitWO(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("receiveUser") String receiveUser, 
													@RequestParam("carbonCopyUser") String carbonCopyUser,
													@RequestParam("uploadFileArr") String uploadFileArr){
		User user = (User) request.getSession().getAttribute("user");
		CircuitWO paramTask=JsonUtil.jsonToJavaObj(param, CircuitWO.class,JsonUtil.DATE);
		
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
			circuitBusinessService.updateAndSendCircuitWO(paramTask, dtos, user);
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
	 * updateCircuitWO 修改任务并保存
	 * @param request
	 * @param param
	 * @param receiveUser
	 * @param carbonCopyUser
	 * @param uploadFileArr
	 * @return
	 */
	@RequestMapping(value="/updateCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String updateCircuitWO(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("receiveUser") String receiveUser, 
													@RequestParam("carbonCopyUser") String carbonCopyUser,
													@RequestParam("uploadFileArr") String uploadFileArr){
		User user = (User) request.getSession().getAttribute("user");
		CircuitWO paramTask=JsonUtil.jsonToJavaObj(param, CircuitWO.class,JsonUtil.DATE);
		
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
			circuitBusinessService.updateAndSave(paramTask, dtos, user);
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
	 * deleteCircuitWOByIds 删除任务
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/deleteCircuitWOByIds",method=RequestMethod.POST)
	@ResponseBody
	public String deleteCircuitWOByIds(@RequestParam("ids") String ids){
		circuitService.deleteCircuitWOByIds(ids);
		return null;
	}
	
	/**
	 * sendToCheck 发送审核
	 * @param id
	 * @param receiveUserId
	 * @return
	 */
	@RequestMapping(value="/sendToCheck",method=RequestMethod.POST)
	@ResponseBody
	public String sendToCheck(@RequestParam("id") String id, 
													@RequestParam("receiveUserId") String receiveUserId){
		circuitBusinessService.sendToCheck(id, receiveUserId);
		return null;
	}
	
	/**
	 * sendCircuitWO 派发
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/sendCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String sendCircuitWO(@RequestParam("id") String id){
		//派发
		circuitBusinessService.sendCircuitWO(id);
		return null;
	}
	
	/**
	 * getCircuitWOTreeList 详情，获取子任务调度树
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getCircuitWOTreeList",method=RequestMethod.POST)
	@ResponseBody
	public String getCircuitWOTreeList(@RequestParam("id") String id){
		CircuitWO taskRoot = new CircuitWO();
		taskRoot.setId(id);
		List<CircuitWO> taskRootTree = citcuitRootTreeService.getCircuitWOTreeList(taskRoot,id);
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
			String msg = circuitBusinessService.updateSelectUsers(taskId, receiveUserIds, user);
			if ("1".equals(msg)) {
				result.setStatus("3");
				result.setMsg("执行人没有变化！");
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
	 * expCircuitWO 导出任务至Excel
	 * @param exportXlsJson
	 * @param fileName
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/expCircuitWO",method = RequestMethod.POST)
	@ResponseBody
	public void expCircuitWO(@RequestParam("exportXlsJson") String exportXlsJson,
												@RequestParam("fileName") String fileName,
												HttpServletRequest request, HttpServletResponse response ){
		//获得当前页的所有记录（数组）
		CircuitWOExportDto[] dtos=JsonUtil.jsonToJavaObj(exportXlsJson, CircuitWOExportDto[].class,JsonUtil.DATE);
		if(dtos==null){
			return;
		}
		//将数组转化为List集合	
		List<CircuitWOExportDto> dataList=new ArrayList<CircuitWOExportDto>(Arrays.asList(dtos));	
		String[] headerTableColumns = null;
		if ("创建工单".equals(fileName) || "全部工单查询".equals(fileName)
				|| "抄送列表".equals(fileName)) {
			headerTableColumns = new String[] {// 标题行
					"工单主题" + "_" + "25" + "_" + "my.getTitle()",
					"工单类型" + "_" + "25" + "_" + "my.getTaskType()",
					"派发时间" + "_" + "25" + "_" + "my.getSendDate()",
					"完成期限" + "_" + "25" + "_" + "my.getLimitTime()",
					"联系人" + "_" + "25" + "_" + "my.getLinkman()",
					"状态" + "_" + "25" + "_" + "my.getStatus()" };
		} else {
			headerTableColumns = new String[] {// 标题行
					"工单主题" + "_" + "25" + "_" + "my.getTitle()",
					"工单类型" + "_" + "25" + "_" + "my.getTaskType()",
					"派发时间" + "_" + "25" + "_" + "my.getSendDate()",
					"完成期限" + "_" + "25" + "_" + "my.getLimitTime()",
					"联系人" + "_" + "25" + "_" + "my.getLinkman()",
					"送审时间" + "_" + "25" + "_" + "my.getSendDate()",
					"状态" + "_" + "25" + "_" + "my.getStatus()" };
		}
		
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE));
		
		CommonPoiExportExcel<CircuitWOExportDto> export = new CommonPoiExportExcel<CircuitWOExportDto>();
		export.exportXls(fileName, headerTableColumns, expandJexlContext,dataList, request, response);
	}
	
	/**
	 * getShowDtoOfBackCircuitWO 已退回任务（查看的数据与用户无关）-条件、分页查询
	 * @date 2017-7-7 下午2:28:15 
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getShowDtoOfBackCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String getShowDtoOfBackCircuitWO(@RequestParam("param") String param, 
										@RequestParam("start") int start, 
										@RequestParam("limit") int limit){
		CircuitWOSearchDto dto=JsonUtil.jsonToJavaObj(param, CircuitWOSearchDto.class,JsonUtil.DATE);
		dto.setStatus(CircuitWO.YI_TUI_HUI);//已退回状态
		GridDto<CircuitWO> gridDto = toDoCircuitWOService.getCircuitWORecentOfToDoGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**
	 * resendBackCircuitWO 已退回任务重派
	 * @param id
	 * @param receiveUserId
	 * @return
	 */
	@RequestMapping(value="/resendBackCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String resendBackCircuitWO(@RequestParam("id") String id, 
													@RequestParam("receiveUserId") String receiveUserId){
		circuitBusinessService.resend(id, receiveUserId);
		return null;
	}
	
	/**
	 * delBackCircuitWO 已退回任务删除
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/delBackCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String delBackCircuitWO(@RequestParam("id") String id,
			HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		circuitBusinessService.delBackCircuitWO(id, user);
		return null;
	}
	
	/**
	 * getCheckByDTO 根据dto查询任务-分页查询-任务审核
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
		CircuitWOSearchDto dto=JsonUtil.jsonToJavaObj(param, CircuitWOSearchDto.class,JsonUtil.DATE);
		User user = (User) request.getSession().getAttribute("user");
		dto.setOwner(user);//隐藏条件-任务所属人
		GridDto<CircuitWO> gridDto = circuitService.getCheckByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**
	 * checkCircuitWO 审核任务
	 * @param id
	 * @param checkFileArr
	 * @param checkMsg
	 * @param status
	 * @return
	 */
	@RequestMapping(value="/checkCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String checkCircuitWO(@RequestParam("id") String id,
											@RequestParam("checkFileArr") String checkFileArr,
											@RequestParam("checkMsg") String checkMsg,
											@RequestParam("status") String status){
		CircuitWO taskRoot=new CircuitWO();
		taskRoot.setId(id);
		// 获取多个上传的审核文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(checkFileArr,UploadFileDto[].class);
		taskRoot.setCheckMsg(checkMsg);
		taskRoot.setStatus(status);
		
		circuitBusinessService.checkCircuitWO(taskRoot,dtos);
		return null;
	}
	
	/**
	 * getAllCircuitWOOfRootByDto 根据dto查询全部任务-分页查询-全部任务查询
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getAllCircuitWOOfRootByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getAllCircuitWOOfRootByDto(@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit){
		CircuitWOSearchDto dto=JsonUtil.jsonToJavaObj(param, CircuitWOSearchDto.class,JsonUtil.DATE);
		GridDto<CircuitWO> gridDto = circuitService.getByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * getCopyCircuitWOListByDto 根据dto查询全部任务-分页查询-抄送列表
	 * @param request
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getCopyCircuitWOListByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getCopyCircuitWOListByDto(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit){
		CircuitWOSearchDto dto=JsonUtil.jsonToJavaObj(param, CircuitWOSearchDto.class,JsonUtil.DATE);
		User user = (User) request.getSession().getAttribute("user");//抄送人
		dto.setCopyUser(user);
		GridDto<CircuitWO> gridDto = circuitService.getByGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
}
