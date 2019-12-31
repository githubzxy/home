
/**   
 * 文件名：ToDoCircuitWOAction.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-21 下午6:15:48   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

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

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.circuitWO.dto.CircuitWOExportDto;
import com.enovell.yunwei.circuitWO.dto.NameAndIdDTO;
import com.enovell.yunwei.circuitWO.dto.CircuitWOSearchDto;
import com.enovell.yunwei.circuitWO.service.CircuitWOBusinessService;
import com.enovell.yunwei.circuitWO.service.ToDoCircuitWOService;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.util.JsonUtil;


/**      
 * 项目名称：kumingrinms
 * 类名称：toDoCircuitWOAction   
 * 类描述:  待办任务 action
 * 创建人：ltf 
 * 创建时间：2016-12-21 下午6:15:48
 * 修改人：yangsy
 * 修改时间：2017-5-24 下午2:34:10 
 */
@Controller
@RequestMapping("/toDoCircuitWOAction")
public class ToDoCircuitWOAction {

	@Resource(name="toDoCircuitWOService")
	private ToDoCircuitWOService toDoCircuitWOService;
	
	@Resource(name="circuitBusinessService")
	private CircuitWOBusinessService circuitBusinessService;
	
	/**
	 * 
	 * getCircuitWOShowDtoOfToDo 根据dto查询待办任务-分页查询-待办任务
	 *
	 * @param request
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getCircuitWOShowDtoOfToDo",method=RequestMethod.POST)
	@ResponseBody
	public String getCircuitWOShowDtoOfToDo(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit ){
		CircuitWOSearchDto dto=JsonUtil.jsonToJavaObj(param, CircuitWOSearchDto.class,JsonUtil.DATE);
		User user = (User) request.getSession().getAttribute("user");
		//设置隐含条件
		dto.setOwner(user);
		dto.setIsRoot(CircuitWO.IS_NOT_ROOT);//不是根
		GridDto<CircuitWO> gridDto = toDoCircuitWOService.getCircuitWOShowDtoOfToDoGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**
	 * 
	 * receiveToDoTask 接收任务
	 *
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/receiveToDoTask",method=RequestMethod.POST)
	@ResponseBody
	public String receiveToDoTask(@RequestParam("id") String id ){
		toDoCircuitWOService.receive(id);
		return null;
	}
	
	/**
	 * 
	 * sendBackToDoCircuitWO 退回任务
	 *
	 * @param id
	 * @param sendBackRemark
	 * @return
	 */
	@RequestMapping(value="/sendBackToDoCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public String sendBackToDoCircuitWO(@RequestParam("id") String id,
														@RequestParam("sendBackRemark") String sendBackRemark ){
		toDoCircuitWOService.sendBack(id, sendBackRemark);
		return null;
	}
	
	/**
	 * 
	 * assignToDoCircuitWO 分派任务
	 *
	 * @param id
	 * @param assignRemark
	 * @param receiveUser
	 * @return
	 */
	@RequestMapping(value="/assignToDoCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public Boolean assignToDoCircuitWO(@RequestParam("id") String id,
														@RequestParam("assignRemark") String assignRemark,
														@RequestParam("receiveUser") String receiveUser){
		CircuitWO taskParam=new CircuitWO();
		taskParam.setId(id);
		taskParam.setAssignRemark(assignRemark);//分派说明
		//接收人（分派执行人）
		User[] receiveUserArr = JsonUtil.jsonToJavaObj(receiveUser, User[].class);
		Set<User> receiveUserSet=new HashSet<User>();
		for (User ru : receiveUserArr) {
			receiveUserSet.add(ru);
		}
		taskParam.setReceiveUsers(receiveUserSet);
		
		return toDoCircuitWOService.assign(taskParam);
	}
	
	/**转派任务-多选-yangsy*/
	@RequestMapping(value="/turnToSendMultiUser",method=RequestMethod.POST)
	@ResponseBody
	public String turnToSendMultiUser(
			@RequestParam("id") String id,
			@RequestParam("receiveUserId") String receiveUserId ){
		toDoCircuitWOService.turnToSendMultiUser(id, receiveUserId);
		return null;
	}
	
	/**
	 * replyToDoCircuitWO 回复任务
	 * @param request
	 * @param param
	 * @param arr
	 * @return
	 */
	@RequestMapping(value="/replyToDoCircuitWO",method=RequestMethod.POST)
	@ResponseBody
	public Boolean replyToDoCircuitWO(HttpServletRequest request,
													@RequestParam("param") String param,
													@RequestParam("arr") String arr){
		User user = (User) request.getSession().getAttribute("user");//回复提交人
		
		CircuitWO taskParam=JsonUtil.jsonToJavaObj(param, CircuitWO.class,JsonUtil.DATE);
		taskParam.setSubmitUser(user);
		taskParam.setChargeUser(user);//回复负责人同提交人
		// 回复文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(arr,UploadFileDto[].class);
		
		CircuitWO replyTask = toDoCircuitWOService.reply(taskParam,dtos);
		if(replyTask != null){
			circuitBusinessService.autoFile(replyTask.getRoot(),"子任务回复完成后自动归档");
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 
	 * expToDoCircuitWO 导出任务至Excel
	 *
	 * @param exportXlsJson
	 * @param fileName
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/expToDoCircuitWO",method = RequestMethod.POST)
	@ResponseBody
	public void expToDoCircuitWO(@RequestParam("exportXlsJson") String exportXlsJson,
													@RequestParam("fileName") String fileName,
													HttpServletRequest request, HttpServletResponse response ){
		//获得当前页的所有记录（数组）
		CircuitWOExportDto[] dtos=JsonUtil.jsonToJavaObj(exportXlsJson, CircuitWOExportDto[].class,JsonUtil.DATE);
		if(dtos==null){
			return;
		}
		//将数组转化为List集合	
		List<CircuitWOExportDto> dataList=new ArrayList<CircuitWOExportDto>(Arrays.asList(dtos));	
		String[] headerTableColumns = new String[] {//标题行
				"工单主题" + "_" + "20" + "_" + "my.getTitle()",
//				"紧急程度" + "_" + "20" + "_"+ "my.getTaskLevel()",
				"工单类型" + "_" + "20" + "_" + "my.getTaskType()",
				"派发单位" + "_" + "20" + "_" + "my.getOrg()",
				"派发时间" + "_" + "20" + "_" + "tool.format(my.getSendDate())",
				"完成期限" + "_" + "20" + "_" + "tool.format(my.getLimitTime())",
				"联系人" + "_" + "20" + "_" + "my.getLinkman()",
				"状态" + "_" + "20" + "_" + "my.getStatus()"
		};
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		
		CommonPoiExportExcel<CircuitWOExportDto> export = new CommonPoiExportExcel<CircuitWOExportDto>();
		export.exportXls(fileName, headerTableColumns, expandJexlContext,dataList, request, response);
	}
	
	/**
	 * getSelectUsersByOrgId 根据组织机构orgId获取用户（用于多选显示）
	 * id 为待转派的任务id（通过该id获取父任务id，
                        		通过父任务id获取所有该父任务的子任务，
                        		子任务中有个owner属性表示的任务所属用户，
                        		通过这个属性过滤掉下拉选中已经拥有子任务的用户）
	 */
	@RequestMapping(value = "/getSelectUsersByOrgId", method = RequestMethod.POST)
	@ResponseBody
	public String getSelectUsersByOrgId (
			@RequestParam("orgId") String orgId,
			@RequestParam("id") String id
			) {
		if(StringUtils.isNotBlank(orgId)) {
			List<NameAndIdDTO> data = toDoCircuitWOService.getSelectUsersByOrgId(id,orgId);
			return JsonUtil.javaToJsonAsString(data);
		}
		return "";
	}
	
	/**
	 * 
	 * getToDoByWorkShopDirector 获取待办任务(车间主任)list
	 * @param request
	 * @param param
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getToDoByWorkShopDirector",method=RequestMethod.POST)
	@ResponseBody
	public String getToDoByWorkShopDirector(HttpServletRequest request,
													@RequestParam("param") String param, 
													@RequestParam("start") int start, 
													@RequestParam("limit") int limit ){
		CircuitWOSearchDto dto = JsonUtil.jsonToJavaObj(param, CircuitWOSearchDto.class,JsonUtil.DATE);
		User user = (User) request.getSession().getAttribute("user");
		dto.setUserOrgId(user.getOrganization().getId());
		GridDto<CircuitWO> gridDto = toDoCircuitWOService.getToDoByWorkShopDirectorGridDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	@RequestMapping(value="/checkSelectedWorkAreaUser",method=RequestMethod.POST)
	@ResponseBody
	public String checkSelectedWorkAreaUser(HttpServletRequest request,
													@RequestParam("workShopId") String workShopId, 
													@RequestParam("rootId") String rootId){
		User user = (User) request.getSession().getAttribute("user");
		return JsonUtil.javaToJsonAsString(toDoCircuitWOService.checkSelectedWorkAreaUser(workShopId, rootId,user.getId()));
	}
	
	/**
	 * 
	 * expToDoByWorkShopDirector 待办任务(车间主任)导出Excel
	 * @param exportXlsJson
	 * @param fileName
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/expToDoByWorkShopDirector",method = RequestMethod.POST)
	@ResponseBody
	public void expToDoByWorkShopDirector(@RequestParam("exportXlsJson") String exportXlsJson,
													HttpServletRequest request, HttpServletResponse response ){
		//获得当前页的所有记录（数组）
		CircuitWOExportDto[] dtos=JsonUtil.jsonToJavaObj(exportXlsJson, CircuitWOExportDto[].class,JsonUtil.DATE);
		if(dtos==null){
			return;
		}
		//将数组转化为List集合	
		List<CircuitWOExportDto> dataList=new ArrayList<CircuitWOExportDto>(Arrays.asList(dtos));	
		String[] headerTableColumns = new String[] {//标题行
				"工单标题" + "_" + "20" + "_" + "my.getTitle()",
				"工单类型" + "_" + "20" + "_" + "my.getTaskType()",
				"派发单位" + "_" + "20" + "_" + "my.getOrg()",
				"派发时间" + "_" + "20" + "_" + "tool.format(my.getSendDate())",
				"完成期限" + "_" + "20" + "_" + "tool.format(my.getLimitTime())",
				"联系人" + "_" + "20" + "_" + "my.getLinkman()",
				"执行单位" + "_" + "20" + "_" + "my.getOwnerOrg()",
				"执行人" + "_" + "20" + "_" + "my.getOwner()",
				"状态" + "_" + "20" + "_" + "my.getStatus()"
		};
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		
		CommonPoiExportExcel<CircuitWOExportDto> export = new CommonPoiExportExcel<CircuitWOExportDto>();
		export.exportXls("待办工单", headerTableColumns, expandJexlContext,dataList, request, response);
	}
	
}
