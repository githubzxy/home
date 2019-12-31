package com.enovell.yunwei.safeSystem.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.safeSystem.domain.SafeSystem;
import com.enovell.yunwei.safeSystem.dto.SafeSystemDTO;
import com.enovell.yunwei.safeSystem.dto.SafeSystemExportDTO;
import com.enovell.yunwei.safeSystem.service.SafeSystemService;
import com.enovell.yunwei.util.JsonUtil;

@Controller
@RequestMapping(value = "/safeSystemAction")
public class SafeSystemAction {
	
	@Resource(name = "safeSystemService")
	private SafeSystemService safeSystemService;
	
	/**
	 * 分页查询、条件查询
	 * @param fileName
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value = "/getData" ,method = RequestMethod.POST)
	@ResponseBody
	public String getData(@RequestParam(value = "fileName",required=false) String fileName,
			@RequestParam(value = "fileType",required=false) Integer fileType,
			@RequestParam(value = "startDate",required=false) String startDate,
			@RequestParam(value = "endDate",required=false) String endDate,
			@RequestParam(value = "fileSuitableRange",required=false) Integer fileSuitableRange,
			@RequestParam(value = "organization",required=false) String organization,
			@RequestParam("start") int start,
			@RequestParam("limit") int limit){
		SafeSystemDTO dto = new SafeSystemDTO();
		
		if(StringUtils.isNotEmpty(fileName)){
			
			dto.setFileName(fileName.replaceAll(" ", ""));
			
		}
		if(StringUtils.isNotEmpty(organization)){
			
			dto.setOrganization(organization);
			
		}
		if(StringUtils.isNotEmpty(startDate)){
			
			SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			Date date = new Date();
			try {
				date = sdf.parse(startDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			dto.setStartDate(date);
			
		}
		if(StringUtils.isNotEmpty(endDate)){
			
			SimpleDateFormat sdf  =   new  SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" ); 
			Date date = new Date();
			try {
				date = sdf.parse(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			dto.setEndDate(date);
			
		}
		if(fileType!=null){
			
			dto.setFileType(fileType);
			
		}
		if(fileSuitableRange!=null){
			
			dto.setFileSuitableRange(fileSuitableRange);
			
		}
		
		Long count = 0L;
		
		List<SafeSystemDTO> dtolist = new ArrayList<SafeSystemDTO>();
		
		dtolist = safeSystemService.getAllSafeSystems(dto, start, limit);
		
		count = safeSystemService.getAllSafeSystemCount(dto);
		
		GridDto<SafeSystemDTO> gridDto = new GridDto<SafeSystemDTO>();
		gridDto.setRows(dtolist);
		gridDto.setResults(count);
		String jResult = JsonUtil.javaToJsonAsString(gridDto);
		return jResult;
		
	}
	
	/**
	 * 页面单元格点击事件（编辑、删除）的响应方法，用于获取点击行的数据
	 * @param fileId
	 * @return
	 */
	@RequestMapping(value = "/getDataById" ,method = RequestMethod.POST)
	@ResponseBody
	public String getDataById(@RequestParam(value = "fileId",required=false) String fileId){
		
		SafeSystem result = safeSystemService.getSafeSystemById(fileId);
		
		String json = JsonUtil.javaToJsonAsString(result);
		
		return json;
		
	}
	
	
	/**
	 * luonf 2017-10-30 修改为用DTO接收参数
	 */
	@RequestMapping(value = "/addInfor" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addInfor(SafeSystemDTO fs,
			HttpServletRequest request){
		//通过Session获取当前登录用户信息
		User user = (User)request.getSession().getAttribute("user");
		try {
			//调用新增用户到数据库的方法
			safeSystemService.addSafeSystem(fs, user);
			return ResultMsg.getSuccess("新增规章制度成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增规章制度失败！", null);
		}
		
	}
	
	/**
	 * luonf 2017-10-30  修改为用DTO接收参数
	 */
	@RequestMapping(value = "/updateRecord" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateRecord(SafeSystemDTO fs,
			HttpServletRequest request) throws IOException{
		//通过Session获取当前登录用户信息
		User user = (User)request.getSession().getAttribute("user");
		try {
			// 修改技术图纸
			safeSystemService.updateSafeSystem(fs, user);
			return ResultMsg.getSuccess("修改规章制度成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("修改规章制度失败！", null);
		}
	}
	
	@RequestMapping(value = "/delRecord" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg delRecord(@RequestParam("ids") List<String> ids){
		
		try {
			safeSystemService.deleteSafeSystemsByIds(ids);
			return ResultMsg.getSuccess("删除规章制度成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("删除规章制度失败！", null);
		}
		
	}
	
	/**
	 * luonf 2017-10-26  修改为导出数据通过后台查询
	 */
	@RequestMapping(value = "/exportXls", method = RequestMethod.POST)
	@ResponseBody
	public void exportXls(@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request,
			HttpServletResponse response) {
		SafeSystemDTO fileSystemDTO = JsonUtil.jsonToJavaObj(exportXlsJson, SafeSystemDTO.class);
		List<SafeSystemExportDTO> dataList= safeSystemService.getAllFile(fileSystemDTO);
		String[] headerTableColumns = new String[]{ 
				"规章制度名称" + "_" +"80" + "_" + "my.getFileName()",
				"规章制度类型" + "_" +"25" + "_" + "my.getFileType()",
				"所属部门" + "_" +"15" + "_" + "my.getOrganization()",
				"上传时间" + "_" +"20" + "_" + "my.getCreateStartDate()"
		}; 
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		
		CommonPoiExportExcel<SafeSystemExportDTO> export = new CommonPoiExportExcel<SafeSystemExportDTO>();
		export.exportXls("安全规章管理", headerTableColumns, expandJexlContext, dataList, request, response);
	}
}
