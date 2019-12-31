package com.enovell.yunwei.commNetworkStop.web;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.commNetworkStop.domain.CommNetStop;
import com.enovell.yunwei.commNetworkStop.dto.CommNetStopDto;
import com.enovell.yunwei.commNetworkStop.dto.CommNetStopExportDto;
import com.enovell.yunwei.commNetworkStop.dto.CommNetStopShowDto;
import com.enovell.yunwei.commNetworkStop.service.CommNetStopService;
import com.enovell.yunwei.commNetworkStop.service.CommNetStopValidateService;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.ValidateMsg;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

/**      
 * 项目名称：tldw
 * 类名称：CommNetStopAction 
 * 类描述:   通信网停机要点 action 
 * 创建人：ltf
 * 创建时间：2016-11-21 上午11:01:15
 * 修改人：ltf
 * 修改时间：2016-11-21 上午11:01:15
 * 
 * 修改人：luoyan 2017-7-13
 */
@Controller
@RequestMapping("/commNetStopAction")
public class CommNetStopAction {
	@Resource(name="commNetStopService")
	CommNetStopService commNetStopService;
	
	@Resource(name="attachFileService")
    AttachFileService attachFileService;
	
	@Resource(name="commNetStopValidateService")
    CommNetStopValidateService validateService;
	
	/**获取所有线路名称*/
	@RequestMapping("/getRailLineNames")
	@ResponseBody
	public String getRailLineNames(){
		List<String> railLineNames=commNetStopService.getRailLineNames();
		return JsonUtil.javaToJsonAsString(railLineNames);
	}
	
	/**条件查询停机要点*/
	@RequestMapping("/getCommNetworkStopByDto")
	@ResponseBody
	public String getCommNetStopByDto(
			@RequestParam(required = false) String railLineName,
			@RequestParam(required = false) String belongCraft,
			@RequestParam(required = false) String executionType,
			@RequestParam(required = false) String executionAttr,
			@RequestParam(required = false) String workContent,
			@RequestParam(required = false) String mainNetName,
			@RequestParam(required = false) String org,
			@RequestParam(required = false) String state,
			@RequestParam(required = false) String skyLight,
			HttpServletRequest request,
			int start, int limit){
		
		
		CommNetStopDto dto = new CommNetStopDto();
		if (StringUtils.isNotBlank(railLineName)) {
			dto.setRailLineName(railLineName);
		}
		if (StringUtils.isNotBlank(belongCraft)) {
			dto.setBelongCraft(Integer.valueOf(belongCraft));
		}
		if (StringUtils.isNotBlank(executionType)) {
			dto.setExecutionType(Integer.valueOf(executionType));
		}
		if (StringUtils.isNotBlank(executionAttr)) {
			dto.setExecutionAttr(Integer.valueOf(executionAttr));
		}
		if (StringUtils.isNotBlank(workContent)) {
			dto.setWorkContent(workContent);
		}
		if (StringUtils.isNotBlank(mainNetName)) {
			dto.setMainNetName(mainNetName);
		}
		if (StringUtils.isNotBlank(org)) {
			dto.setOrg(org);
		}
		if(StringUtils.isNotBlank(skyLight)){
			dto.setSkyLight(Boolean.valueOf(skyLight));
		}
		if (StringUtils.isNotBlank(state)) {
			dto.setState(Integer.valueOf(state));
		}
		GridDto<CommNetStopShowDto> gridDto=commNetStopService.searchCommNetStopShowDto(dto, start, limit);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**根据id查询停机要点*/
	@RequestMapping("/getCommNetStopById")
	@ResponseBody
	public String getCommNetStopById(@RequestParam("id") String id){
		CommNetStop cns=commNetStopService.searchCommNetStopById(id);
		ResultMsg result=new ResultMsg();
		result.setStatus("1");
		result.setData(cns);
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**添加停机要点*/
	@RequestMapping("/addCommNetStop")
	@ResponseBody
	public String addCommNetStop(HttpServletRequest request,
                                 @RequestParam("paramAdd") String paramAdd,
                                 @RequestParam("uploadArr") String uploadArr
					){
		CommNetStop cns= JsonUtil.jsonToJavaObj(paramAdd, CommNetStop.class);//停机要点新增信息
		UploadFileDto[] dtos= JsonUtil.jsonToJavaObj(uploadArr, UploadFileDto[].class);//上传文件信息（文件名、路径）
		
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		System.out.println(user);
		System.out.println("----------------------------------------------------------");
		System.out.println(user.getId());
		ResultMsg result=new ResultMsg();
		try {
			//保存添加的停机要点信息
			commNetStopService.addCommNetStop(cns, dtos, user);
		} catch (Exception e) {
			e.printStackTrace();
			result.setStatus("2");
			result.setMsg(e.getMessage());
			return JsonUtil.javaToJsonAsString(result);
		}
		result.setStatus("1");
		result.setMsg("添加成功！");
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**修改停机要点计划*/
	@RequestMapping("/updateCommNetStop")
	@ResponseBody
	public String updateCommNetStop(HttpServletRequest request,
                                    @RequestParam("paramEdit") String paramEdit,
                                    @RequestParam("uploadArrEidt") String uploadArrEidt){
		CommNetStop param= JsonUtil.jsonToJavaObj(paramEdit, CommNetStop.class);//停机要点修改信息
		UploadFileDto[] dtos= JsonUtil.jsonToJavaObj(uploadArrEidt, UploadFileDto[].class);//上传文件信息（文件名、路径）
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		
		CommNetStop cs = commNetStopService.searchCommNetStopById(param.getId());
		// 取出附件
		String attachFileId = null;
		if (cs.getAttachFile() != null) {
			attachFileId = cs.getAttachFile().getId();
		}
		
		ResultMsg result=new ResultMsg();
		//更新停机要点信息
		try {
			commNetStopService.updateCommNetStop(param, dtos, user);
			// 删除附件
			if (attachFileId != null) {
				attachFileService.deleteAttachFile(attachFileId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setStatus("2");
			result.setMsg(e.getMessage());
			return JsonUtil.javaToJsonAsString(result);
		}
		result.setStatus("1");
		result.setMsg("修改成功！");
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**删除停机要点*/
	@RequestMapping("/deleteCommNetStop")
	@ResponseBody
	public String deleteCommNetStop(@RequestParam("ids") String ids){
		String [] idArr=ids.split(",");
		commNetStopService.deleteCommNetStop(idArr);
		ResultMsg result=new ResultMsg();
		result.setStatus("1");
		result.setMsg("删除成功！");
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**审核停机要点*/
	@RequestMapping("/checkCommNetStop")
	@ResponseBody
	public String checkCommNetStop(HttpServletRequest request,
                                   @RequestParam("checkData") String checkData,
                                   @RequestParam("checkArr") String checkArr){
		CommNetStop param= JsonUtil.jsonToJavaObj(checkData, CommNetStop.class);
		UploadFileDto[] dtos= JsonUtil.jsonToJavaObj(checkArr, UploadFileDto[].class);//上传的审核附件信息（文件名、路径）
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		
		commNetStopService.examin(param, dtos, user);
		ResultMsg result=new ResultMsg();
		result.setStatus("1");
		result.setMsg("操作成功！");
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**修改并审核停机要点*/
	@RequestMapping("/updateAndCheckCommNetStop")
	@ResponseBody
	public String updateAndCheckCommNetStop(HttpServletRequest request,
                                            @RequestParam("paramEdit") String paramEdit,
                                            @RequestParam("arrUpload") String arrUpload,
                                            @RequestParam("arrCheck") String arrCheck){
		CommNetStop param= JsonUtil.jsonToJavaObj(paramEdit, CommNetStop.class);//修改表单控件信息
		UploadFileDto[] uploadFileDtos= JsonUtil.jsonToJavaObj(arrUpload, UploadFileDto[].class);//上传附件信息
		UploadFileDto[] checkFileDtos= JsonUtil.jsonToJavaObj(arrCheck, UploadFileDto[].class);//批复附件信息
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		
		CommNetStop cs = commNetStopService.searchCommNetStopById(param.getId());
		// 取出附件
		String attachFileId = null;
		if (cs.getAttachFile() != null) {
			attachFileId = cs.getAttachFile().getId();
		}
		
		ResultMsg result=new ResultMsg();
		try {
			commNetStopService.updateAndExamin(param, uploadFileDtos, checkFileDtos, user);
			// 删除附件
			if (attachFileId != null) {
				attachFileService.deleteAttachFile(attachFileId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setStatus("2");
			result.setMsg(e.getMessage());
			return JsonUtil.javaToJsonAsString(result);
		}
		
		result.setStatus("1");
		result.setMsg("操作成功！");
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**取消停机要点计划*/
	@RequestMapping("/cancelCommNetStop")
	@ResponseBody
	public String cancelCommNetStop(@RequestParam("id") String id ){
		commNetStopService.cancelCommNetStop(id);
		ResultMsg result=new ResultMsg();
		result.setStatus("1");
		result.setMsg("操作成功！");
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**回复停机要点*/
	@RequestMapping("/replyCommNetStop")
	@ResponseBody
	public String replyCommNetStop(HttpServletRequest request,
                                   @RequestParam("paramReply") String paramReply,
                                   @RequestParam("replyArr") String replyArr){
		CommNetStop param= JsonUtil.jsonToJavaObj(paramReply, CommNetStop.class);
		UploadFileDto[] replyFileDtos= JsonUtil.jsonToJavaObj(replyArr, UploadFileDto[].class);//回复附件信息
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		
		commNetStopService.replyCommNetStop(param,replyFileDtos,user);
		ResultMsg result=new ResultMsg();
		result.setStatus("1");
		result.setMsg("操作成功！");
		return JsonUtil.javaToJsonAsString(result);
	}
	
	/**导出停机要点数据值Excel*/
	@RequestMapping(value="/expCommNetStop",method = RequestMethod.POST)
	@ResponseBody
	public void expCommNetStop(@RequestParam("exportXlsJson") String exportXlsJson,
                               HttpServletRequest request, HttpServletResponse response ){
		//获得当前页的所有记录（数组）
		CommNetStopExportDto[] dtos= JsonUtil.jsonToJavaObj(exportXlsJson, CommNetStopExportDto[].class);
		if(dtos==null){
			return;
		}
		//将数组转化为List集合	
		List<CommNetStopExportDto> dataList=new ArrayList<CommNetStopExportDto>(Arrays.asList(dtos));	
		String[] headerTableColumns = new String[] {//标题行
				"状态" + "_" + "10" + "_" + "my.getState()",
				"开始时间" + "_" + "20" + "_" + "tool.format(my.getStartDate())",
				"结束时间" + "_" + "20" + "_"+ "tool.format(my.getEndDate())",
				"线路" + "_" + "20" + "_" + "my.getRailLineName()",
				"申请单位" + "_" + "20" + "_" + "my.getApplyOrgName()",
				"施工地点" + "_" + "25" + "_" + "my.getExecutionAddr()",
				"所属专业" + "_" + "20" + "_" + "my.getBelongCraft()",
				"施工类别" + "_" + "20" + "_" + "my.getExecutionType()",
				"施工属性" + "_" + "20" + "_" + "my.getExecutionAttr()",
				"工作内容" + "_" + "20" + "_" + "my.getWorkContent()",
				"涉及骨干网" + "_" + "25" + "_" + "my.getMainNetName()",
				"涉及铁路局" + "_" + "25" + "_" + "my.getRailwaysBureau()",
				"方案审批编号" + "_" + "20" + "_" + "my.getPlanExaminNum()",
				"月度计划审批编号" + "_" + "20" + "_" + "my.getMonthPlanExamin()",
				"昆铁施工台计划号" + "_" + "20" + "_" + "my.getExecutionPlanNum()"
		};
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		
		CommonPoiExportExcel<CommNetStopExportDto> export = new CommonPoiExportExcel<CommNetStopExportDto>();
		export.exportXls("通信网停机要点", headerTableColumns, expandJexlContext,dataList, request, response);
	}
	
	/**
	 * 
	 * ImportData 导入数据
	 * @param request
	 * @param response
	 * @param perId 配置按钮权限ID
	 */
	@RequestMapping(value = "/importData", method = RequestMethod.POST)
	public void importData(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestParam("perId") String perId
			) {
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		// 获得上下文中CommonsMultipartResolver
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (multipartResolver.isMultipart(request)) {
			// 将HttpServletRequest强转为SpringMVC提供的MultipartHttpServletRequest类型
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> it = multiRequest.getFileNames(); // 获取所有上传文件的名字
			while (it.hasNext()) {
				MultipartFile file = multiRequest.getFile(it.next()); // 根据名字找到对应的文件,这里文件名和文件成键值对关系
				if (!file.isEmpty()) {
					String uploadName = file.getOriginalFilename();
					try {
						Workbook wb = WorkbookFactory.create(file.getInputStream());
						List<ValidateMsg> results = validateService.getValidateMsg(wb, uploadName, user);//对文件进行验证
						if(results.isEmpty()){//无任何错误信息
							request.setAttribute("threePerId", perId);
							request.getRequestDispatcher("/views/commNetStop/stopPlan/stopPlanPage.jsp").forward(request, response);
//							response.sendRedirect(request.getContextPath()+"/views/commNetStop/stopPlan/stopPlanPage.jsp");
						}else{
							writeErrorMsgToResponse(results,request,response);
						}
					} catch (Exception e) {
						e.printStackTrace();
						response.setContentType("text/html;charset=UTF-8");
						response.setCharacterEncoding("UTF-8");
						try {
							response.getWriter().write(getResultHTML("文件导入失败，请联系管理员"));
						} catch (IOException e1) {
							e1.printStackTrace();
						}
					}
				}
			}
		}
	}
	
	/**
	 * 发生异常返回结果HTML
	 * @param msg
	 * @return
	 */
	private String getResultHTML(String msg) {
		String html = "<head>" +
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />" +
				"<style>"+
				"body{text-align:center}"+
				"div {margin:0 auto; width:400px; height:200px; border:1px solid #F00;valign:center;align:center;line-height:100px}"+
				"</style>"+
				"</head>" +
				"<body onLoad=\"setTimeout(window.close, 5000)\">" +
				"<div> " +
				msg + "<br/>" +
				"本页面5秒后自动关闭，或者也可以点击<a href=\"#\" onclick=\"window.close()\">关闭</a>" +
				"</div>" +
				"</body>";
		return html;
	}

	/**
	 * 将失败信息以文件流形式返回给客户端
	 * @param results
	 * @param response
	 */
	private void writeErrorMsgToResponse(List<ValidateMsg> results, HttpServletRequest request,
                                         HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			String fileName = "stopPlan-errorMsg-"+sdf.format(new Date())+".xls";
			Workbook wb = getExcelInputStreamFromErrorMsg(results);

			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(fileName.getBytes("utf-8"), "ISO8859-1"));//进行文件名转码，在win客户端下载时显示正确的文件名

			wb.write(response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		} 		
	}
	
	/**
	 * 生成错误信息Excel
	 * @param results 错误信息结果集
	 * @return
	 */
	private Workbook getExcelInputStreamFromErrorMsg(
			List<ValidateMsg> results) {
		Workbook wb  = new HSSFWorkbook();
		Sheet sheet = wb.createSheet();
		wb.setSheetName(0, "错误描述");
		Row row1 = sheet.createRow(0);
		Cell row1Cell1 = row1.createCell(0);
		row1Cell1.setCellValue("文件名称");
		Cell row1Cell2 = row1.createCell(1);
		row1Cell2.setCellValue("所属页签");
		Cell row1Cell3 = row1.createCell(2);
		row1Cell3.setCellValue("错误描述");
		Cell row1Cell4 = row1.createCell(3);
		row1Cell4.setCellValue("序号");
		Cell row1Cell5 = row1.createCell(4);
		row1Cell5.setCellValue("行");
		Cell row1Cell6 = row1.createCell(5);
		row1Cell6.setCellValue("列");
		CellStyle cs = wb.createCellStyle();
		cs.setWrapText(true);//设置自动换行
		sheet.setColumnWidth(0, 18*256);//文件名称18个字的宽度
		sheet.setColumnWidth(2, 50*256);//错误描述50个字的宽度
		for(int i = 1;i <= results.size();i++){
			ValidateMsg m = results.get(i-1);
			Row r = sheet.createRow(i);
			Cell c1 = r.createCell(0);
			Cell c2 = r.createCell(1);
			Cell c3 = r.createCell(2);
			Cell c4 = r.createCell(3);
			Cell c5 = r.createCell(4);
			Cell c6 = r.createCell(5);
			c1.setCellValue(m.getFileName());
			c2.setCellValue(m.getSheet());
			c3.setCellValue(m.getErrorMsg());
			c3.setCellStyle(cs);
			c4.setCellValue(m.getIndex());
			c5.setCellValue(m.getRow());
			c6.setCellValue(m.getColumn());
		}
		return wb;
	}
	
}