package com.enovell.yunwei.onduty.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.onduty.domain.OnDutyDeptDTO;
import com.enovell.yunwei.onduty.service.ImportDataUtil;
import com.enovell.yunwei.onduty.service.OnDutyDeptService;
import com.enovell.yunwei.onduty.service.OndutyInsertService;
import com.enovell.yunwei.onduty.service.OndutyService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.ValidateMsg;

@Controller
@RequestMapping(value = "/onDutyDeptAction")
public class OnDutyDeptAction {

	@Resource(name = "onDutyDeptService")
	private OnDutyDeptService onDutyDeptService;
	
	@Resource(name = "ondutyService")
	private OndutyService onDutyService;
	
	
	
	@RequestMapping(value = "/getOnDutyByDto", method = RequestMethod.POST)
	@ResponseBody
	public String getOnDutyDeptDTOList() {
		
		List<OnDutyDeptDTO> onDutyDeptDTOs = onDutyDeptService.getOnDutyDeptDTOList();
		return JsonUtil.javaToJsonAsString(onDutyDeptDTOs);
	}
	
	@RequestMapping(value = "/saveOnDutyOrg", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg saveOnDutyOrg(
			@RequestParam("orgIds") String orgIds
			) {
		try {
			if(orgIds != null) {
				String[] orgArray = orgIds.split(",");
				onDutyDeptService.saveOnDutyOrg(orgArray);
				return ResultMsg.getSuccess("配置值班部门成功", null);
			}
			return ResultMsg.getFailure("配置值班部门失败", null);
		} catch (Exception e) {
			return ResultMsg.getFailure("配置值班部门失败", null);
		}
	}
	/**
	 * 
	 * importData 导入部门值班管理信息
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/importData", method = RequestMethod.POST)
	public void importData(
			HttpServletRequest request,
			HttpServletResponse response) {
		
		String perId = request.getParameter("perId");
		
		// 获得上下文中CommonsMultipartResolver
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		User createUser = (User) request.getSession().getAttribute("user");
		
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
					String originFileName = file.getOriginalFilename();
					try {
						Workbook wb = WorkbookFactory.create(file.getInputStream());
						List<ValidateMsg> msgs = new ArrayList<ValidateMsg>();
						List<ValidateMsg> results = onDutyDeptService.validate(originFileName,msgs,wb,createUser);
						if(results.isEmpty()){
							response.sendRedirect("../views/onduty/onDutyPage.jsp?threePerId="+perId);
						}else{
							Workbook wbDown = ImportDataUtil.writeErrorMsgToResponse(results);
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
							response.setContentType("text/html;charset=UTF-8");
							request.setCharacterEncoding("UTF-8");
							
							String fileName = "errorMsg-"+sdf.format(new Date())+".xls";
							
							response.setContentType("application/vnd.ms-excel;charset=utf-8");
							response.setHeader("Content-disposition", "attachment; filename="
									+ new String(fileName.getBytes("utf-8"), "ISO8859-1"));//进行文件名转码，在win客户端下载时显示正确的文件名
							wbDown.write(response.getOutputStream());
							response.getOutputStream().flush();  
							response.getOutputStream().close();  
						}
					} catch (Exception e) {
						e.printStackTrace();
						response.setContentType("text/html;charset=UTF-8");
						response.setCharacterEncoding("UTF-8");
						try {
							response.getWriter().write(ImportDataUtil.getResultHTML("文件导入失败，请联系管理员"));
						} catch (IOException e1) {
							e1.printStackTrace();
						}
					}
				}
			}
		}
	}
	
	
	
}
