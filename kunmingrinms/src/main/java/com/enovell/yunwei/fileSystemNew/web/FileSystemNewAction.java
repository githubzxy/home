package com.enovell.yunwei.fileSystemNew.web;

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
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.fileSystemNew.domain.FileSystemNew;
import com.enovell.yunwei.fileSystemNew.dto.FileSystemDTO;
import com.enovell.yunwei.fileSystemNew.dto.FileSystemExportDTO;
import com.enovell.yunwei.fileSystemNew.service.FileSystemNewService;
import com.enovell.yunwei.util.JsonUtil;

@Controller
@RequestMapping(value = "/fileSystemNewAction")
public class FileSystemNewAction {
	
	@Resource(name = "fileSystemNewService")
	private FileSystemNewService fileSystemNewService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
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
		FileSystemDTO dto = new FileSystemDTO();
		
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
		
		List<FileSystemDTO> dtolist = new ArrayList<FileSystemDTO>();
		
		dtolist = fileSystemNewService.getAllFileSystems(dto, start, limit);
		
		count = fileSystemNewService.getAllFileSystemCount(dto);
		
		GridDto<FileSystemDTO> gridDto = new GridDto<FileSystemDTO>();
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
		
		FileSystemNew result = fileSystemNewService.getFileSystemById(fileId);
		
		String json = JsonUtil.javaToJsonAsString(result);
		
		return json;
		
	}
	
	/*@RequestMapping(value = "/addInfor" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addInfor(@RequestParam(value = "fileName") String fileName,
			@RequestParam(value = "fileType") Integer fileType,
			@RequestParam(value = "fileSuitableRange") Integer fileSuitableRange,
			@RequestParam(value = "fileValidTime") Integer fileValidTime,
			@RequestParam(value = "isDetailing") Boolean isDetailing,
			@RequestParam(value = "remark",required=false) String remark,
			@RequestParam(value = "uploadFileArr",required=false) String uploadFileArr,
			HttpServletRequest request){
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		FileSystem fs = new FileSystem();
		//设置文件名
		fs.setFileName(fileName);
		//设置文件类型
		fs.setFileType(fileType);
		//设置适用范围
		fs.setFileSuitableRange(fileSuitableRange);
		//设置有效时间
		fs.setFileValidTime(fileValidTime);
		//设置是否细化
		fs.setIsDetailing(isDetailing);
		//设置备注
		fs.setRemark(remark);
		//新建当前系统时间
		Date createDate = new Date();
		//设置创建时间
		fs.setCreateDate(createDate);
		//通过Session获取当前登录用户信息
		User user = (User)request.getSession().getAttribute("user");
		//设置创建用户（为当前登录用户）
		fs.setCreateUser(user);
		//设置用户所在部门（为当前用户所在部门）
		fs.setOrganization(user.getOrganization());
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		try {
			//调用新增用户到数据库的方法
			fileSystemNewService.addFileSystem(fs,dtos);
			return ResultMsg.getSuccess("新增文件成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增文件失败！", null);
		}
	}*/
	
	/**
	 * luonf 2017-10-30 修改为用DTO接收参数
	 */
	@RequestMapping(value = "/addInfor" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addInfor(FileSystemDTO fs,
			HttpServletRequest request){
		//通过Session获取当前登录用户信息
		User user = (User)request.getSession().getAttribute("user");
		try {
			//调用新增用户到数据库的方法
			fileSystemNewService.addFileSystem(fs, user);
			return ResultMsg.getSuccess("新增规章制度成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增规章制度失败！", null);
		}
		
	}
	/*@RequestMapping(value = "/updateRecord" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateRecord(@RequestParam(value = "id") String id,
			@RequestParam(value = "fileName") String fileName,
			@RequestParam(value = "fileType") Integer fileType,
			@RequestParam(value = "fileSuitableRange") Integer fileSuitableRange,
			@RequestParam(value = "fileValidTime") Integer fileValidTime,
			@RequestParam(value = "isDetailing") Boolean isDetailing,
			@RequestParam(value = "remark",required=false) String remark,
			@RequestParam(value = "uploadFileArr",required=false) String uploadFileArr,
			HttpServletRequest request) throws IOException{
		
		request.setCharacterEncoding("UTF-8");
		
		FileSystem fs = fileSystemNewService.getFileSystemById(id);
		// 取出附件
		String attachFileId = null;
		if (fs.getAttachFile() != null) {
			attachFileId = fs.getAttachFile().getId();
		}
		fs.getAttachFile();
		//设置文件名
		fs.setFileName(fileName);
		//设置文件类型
		fs.setFileType(fileType);
		//设置适用范围
		fs.setFileSuitableRange(fileSuitableRange);
		//设置有效时间
		fs.setFileValidTime(fileValidTime);
		//设置是否细化
		fs.setIsDetailing(isDetailing);
		//设置备注
		fs.setRemark(remark);
		//设置修改时间
		fs.setUpdateDate(new Date());
		//通过Session获取当前登录用户信息
		User user = (User)request.getSession().getAttribute("user");
		//设置创建用户（为当前登录用户）
		fs.setCreateUser(user);
		//设置用户所在部门（为当前用户所在部门）
		fs.setOrganization(user.getOrganization());
		
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		try {
			// 修改技术图纸
			fileSystemNewService.updateFileSystem(fs,dtos);
			// 删除附件
			if (attachFileId != null) {
				attachFileService.deleteAttachFile(attachFileId);
			}
			return ResultMsg.getSuccess("修改文件成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("修改文件失败！", null);
		}
	}*/
	
	/**
	 * luonf 2017-10-30  修改为用DTO接收参数
	 */
	@RequestMapping(value = "/updateRecord" ,method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateRecord(FileSystemDTO fs,
			HttpServletRequest request) throws IOException{
		//通过Session获取当前登录用户信息
		User user = (User)request.getSession().getAttribute("user");
		try {
			// 修改技术图纸
			fileSystemNewService.updateFileSystem(fs, user);
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
			fileSystemNewService.deleteFileSystemsByIds(ids);
			return ResultMsg.getSuccess("删除规章制度成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("删除规章制度失败！", null);
		}
		
	}
	
	/*@RequestMapping(value = "/exportXls", method = RequestMethod.POST)
	@ResponseBody
	public void exportXls(@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request,
			HttpServletResponse response) {
		List<FileSystemExportDTO> dataList = new ArrayList<FileSystemExportDTO>();
		FileSystemExportDTO[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson, FileSystemExportDTO[].class);
		Collections.addAll(dataList, dtos);
		String[] headerTableColumns = new String[]{ 
				"文件主题" + "_" +"80" + "_" + "my.getFileName()",
				"文件类型" + "_" +"25" + "_" + "my.getFileType()",
				"适用范围" + "_" +"15" + "_" + "my.getFileSuitableRange()",
				"有效时间" + "_" +"15" + "_" + "my.getFileValidTime()",
				"是否细化" + "_" +"15" + "_" + "my.getIsDetailing()",
				"所属部门" + "_" +"15" + "_" + "my.getOrganization()"
		}; 
		CommonPoiExportExcel<FileSystemExportDTO> export = new CommonPoiExportExcel<FileSystemExportDTO>();
		export.exportXls("文件系统", headerTableColumns, new HashMap(), dataList, request, response);
	}*/
	/**
	 * luonf 2017-10-26  修改为导出数据通过后台查询
	 */
	@RequestMapping(value = "/exportXls", method = RequestMethod.POST)
	@ResponseBody
	public void exportXls(@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request,
			HttpServletResponse response) {
		FileSystemDTO fileSystemDTO = JsonUtil.jsonToJavaObj(exportXlsJson, FileSystemDTO.class);
		List<FileSystemExportDTO> dataList= fileSystemNewService.getAllFile(fileSystemDTO);
		String[] headerTableColumns = new String[]{ 
				"规章制度名称" + "_" +"80" + "_" + "my.getFileName()",
				"规章制度类型" + "_" +"25" + "_" + "my.getFileType()",
				"所属部门" + "_" +"15" + "_" + "my.getOrganization()",
				"上传时间" + "_" +"20" + "_" + "my.getCreateStartDate()"
		}; 
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		
		CommonPoiExportExcel<FileSystemExportDTO> export = new CommonPoiExportExcel<FileSystemExportDTO>();
		export.exportXls("技术规章管理", headerTableColumns, expandJexlContext, dataList, request, response);
	}
}
