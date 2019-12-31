package com.enovell.yunwei.message.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.message.dto.IssueMessageDTO;
import com.enovell.yunwei.message.service.MessageService;
import com.enovell.yunwei.util.JsonUtil;

/**
 * 
 * 项目名称：RINMS2MAIN 
 * 类名称：IssueMessageAction 
 * 类描述: 信息发布Action 
 * 创建人：lidt
 * 创建时间：2016-11-25 下午2:50:57 
 * 修改人：lidt 
 * 修改时间：2016-11-25 下午2:50:57
 * 
 */
@Controller
@RequestMapping(value = "/issueMessageAction")
public class IssueMessageAction {

	@Resource(name = "MessageService")
	private MessageService messageService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * 
	 * getIssueMessageList 查询信息发布
	 * 
	 * @param theme 主题
	 * @param startTime 发布开始时间
	 * @param endTime 发布结束时间
	 * @param start
	 * @param limit
	 * @return 
	 */
	@RequestMapping(value = "/getIssueMessageList", method = RequestMethod.POST)
	@ResponseBody
	public String getIssueMessageList(
			HttpServletRequest request,
			@RequestParam(value = "theme",required=false) String theme,
			@RequestParam(value = "issueOrgName",required=false) String issueOrgName,
			@RequestParam(value = "startTime",required=false) String startTime,
			@RequestParam(value = "endTime",required=false) String endTime,
			@RequestParam("start") int start,
			@RequestParam("limit") int limit) {
		
		IssueMessageDTO issueMessageDTO = new IssueMessageDTO();
		
		if(StringUtils.isNotEmpty(theme)){
			issueMessageDTO.setTheme((theme.replaceAll(" ", "")));
		}
		if(StringUtils.isNotEmpty(issueOrgName)){
			issueMessageDTO.setIssueOrgName((issueOrgName.replaceAll(" ", "")));
		}
		
		if(StringUtils.isNotEmpty(startTime)){
			SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			Date date = new Date();
			try {
				date = sdf.parse(startTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			issueMessageDTO.setStartTime(date);
		}
		
		if(StringUtils.isNotEmpty(endTime)){
			SimpleDateFormat sdf  =   new  SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" ); 
			Date date = new Date();
			try {
				date = sdf.parse(endTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			issueMessageDTO.setEndTime(date);
		}
		User user = (User) request.getSession().getAttribute("user");
		  Organization org = user.getOrganization();
		    String loginOrgId = org.getId();
		    String loginOrgName=org.getName();
		    Integer loginOrgType = org.getType();

		GridDto<IssueMessageDTO> gridDto = messageService.getIssueMessages(issueMessageDTO,start,limit);
		//判断登录用户：段用户只看到段发布的数据
		if(loginOrgType==1500 || loginOrgType== 1501 ){
			List<IssueMessageDTO> list = gridDto.getRows();
//			list.stream().filter(s->
//			(s.getOrgType()!=1502)).collect(Collectors.toList());
			List<IssueMessageDTO> newList = new ArrayList<>();
			for (IssueMessageDTO imd : list) {
				if(imd.getOrgType()!=null&&imd.getOrgType()!=1502){
					newList.add(imd);
				}
			}
			gridDto.setRows(newList);
		}
		//判断登录用户：车间用户
		if(loginOrgType==1502 ){
			List<IssueMessageDTO> list = gridDto.getRows();
			List<IssueMessageDTO> newList = new ArrayList<>();
			for (IssueMessageDTO imd : list) {
				if(imd.getOrgType()<1502||loginOrgId.equals(imd.getOrgId())){
					newList.add(imd);
				}
			}
			gridDto.setRows(newList);
		}
		//判断登录用户：工区用户只能看到段发布的信息以及所属工区发布的信息
			if(loginOrgType==1503 ){
			  List<IssueMessageDTO> list = gridDto.getRows();
			  String  parentOrgId = messageService.getOrgIdByLoginOrgName(loginOrgName);
			  List<IssueMessageDTO> newList = new ArrayList<>();
				for (IssueMessageDTO imd : list) {
					if(imd.getOrgType()<1502||parentOrgId.equals(imd.getOrgId())){
						newList.add(imd);
					}
				}
				newList.forEach(System.out::println);
				gridDto.setRows(newList);
			}
		return JsonUtil.javaToJsonAsString(gridDto);

	}
	
	/**
	 * 
	 * addIssueMessage 新增信息发布
	 *
	 * @param request
	 * @param issueMessageDTO
	 * @return
	 */
	@RequestMapping(value = "/addIssueMessage", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addIssueMessage(HttpServletRequest request,
			IssueMessageDTO issueMessageDTO) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
//		String orgId = user.getOrganization().getId();
		try {
			// 新增信息发布
			messageService.addIssueMessage(issueMessageDTO, user);
			return ResultMsg.getSuccess("新增信息成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增信息失败！", null);
		}
	}
	
	/**
	 * 
	 * getIssueMessageById 根据id查询信息发布
	 * 
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getIssueMessageById", method = RequestMethod.POST)
	@ResponseBody
	public String getIssueMessageById(@RequestParam("id") String id) {
		IssueMessageDTO issueMessage = messageService.getMessageDtoById(id);
		return JsonUtil.javaToJsonAsString(issueMessage);
	}

	/**
	 * 
	 * updateIssueMessage 修改信息发布
	 *
	 * @param request
	 * @param issueMessageDTO
	 * @return
	 */
	@RequestMapping(value = "/updateIssueMessage", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateIssueMessage(HttpServletRequest request,
			IssueMessageDTO issueMessageDTO) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		try{
			// 修改信息发布
			messageService.updateIssueMessage(issueMessageDTO, user);
			return ResultMsg.getSuccess("修改信息成功!", null);
		}catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("修改信息失败!", null);
		}
	}
	
	/**
	 * 
	 * delIssueMessage 批量删除信息发布
	 * 
	 * @param jsonIds
	 * @return 
	 */
	@RequestMapping(value = "/delIssueMessage", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg delIssueMessage(@RequestParam("jsonIds") String jsonIds) {
		try {
			messageService.deleteIssueMessages(jsonIds);
			return ResultMsg.getSuccess("删除信息成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("删除信息失败！", null);
		}
	}
	/**
	 * 
	 * topIssueMessage 批量置顶信息发布
	 * 
	 * @param jsonIds
	 * @return 
	 */
	@RequestMapping(value = "/topIssueMessage", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg topIssueMessage(@RequestParam("jsonIds") String jsonIds) {
		try {
			messageService.topIssueMessages(jsonIds);
			return ResultMsg.getSuccess("置顶成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("置顶失败！", null);
		}
	}
	/**
	 * 
	 * cancelIssueMessage 批量取消置顶信息发布
	 * 
	 * @param jsonIds
	 * @return 
	 */
	@RequestMapping(value = "/cancelIssueMessage", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg cancelIssueMessage(@RequestParam("jsonIds") String jsonIds) {
		try {
			messageService.cancelIssueMessages(jsonIds);
			return ResultMsg.getSuccess("取消置顶成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("取消置顶失败！", null);
		}
	}
	
	/**
	 * 
	 * expIssueMessage 导出信息发布
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expIssueMessage", method = RequestMethod.POST)
	public void expIssueMessage(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {
		
		IssueMessageDTO issueMessageDTO = JsonUtil.jsonToJavaObj(exportXlsJson, IssueMessageDTO.class);
		List<IssueMessageDTO> dataList= messageService.getAllIssueMessage(issueMessageDTO);
		//跟据登录用户对导出数据做过滤
		User user = (User) request.getSession().getAttribute("user");
		  Organization org = user.getOrganization();
		  String loginOrgId = org.getId();
		  String loginOrgName=org.getName();
		  Integer loginOrgType = org.getType();
		  List<IssueMessageDTO> newList = new ArrayList<>();
		//判断登录用户：段用户只导出段发布的数据
			if(loginOrgType==1500 || loginOrgType== 1501 ){
				for (IssueMessageDTO imd : dataList) {
					if(imd.getOrgType()!=1502){
						newList.add(imd);
					}
				}
			}
			//判断登录用户：车间用户
			if(loginOrgType==1502 ){
				for (IssueMessageDTO imd : dataList) {
					if(imd.getOrgType()<1502||loginOrgId.equals(imd.getOrgId())){
						newList.add(imd);
					}
				}
			}
			//判断登录用户：工区用户只能看到段发布的信息以及所属工区发布的信息
				if(loginOrgType==1503 ){
				  String  parentOrgId = messageService.getOrgIdByLoginOrgName(loginOrgName);
					for (IssueMessageDTO imd : dataList) {
						if(imd.getOrgType()<1502||parentOrgId.equals(imd.getOrgId())){
							newList.add(imd);
					}
				}
			}
		String[] headerTableColumns = new String[] {
				"信息主题" + "_" + "30" + "_" + "my.getTheme()",
				"发布部门" + "_" + "30" + "_" + "my.getIssueOrgName()",
				"发布时间" + "_" + "20" + "_" + "my.getIssueTime()",
				"信息类别" + "_" + "30" + "_" + "my.getTypeName()",
				"信息内容" + "_" + "60" + "_" + "my.getContent()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));

		CommonPoiExportExcel<IssueMessageDTO> export = new CommonPoiExportExcel<IssueMessageDTO>();
		export.exportXls("信息发布", headerTableColumns, expandJexlContext,
				newList, request, response);
	}
	/**
	 * 主页搜索栏部门下拉选数据来源
	 */
	@PostMapping("/getIssueOrgName")
	@ResponseBody
	public List<Map<String,String>> getIssueOrgName(){
		List<String> List=messageService.getIssueOrgName();
		List<Map<String,String>> datas=new ArrayList<>();
		for (String string : List) {
			Map<String,String> map=new HashMap<String, String>();
			map.put("text", string);
			map.put("value", string);
			
			datas.add(map);
		}
		return datas;
	}

}
