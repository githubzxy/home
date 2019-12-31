package com.enovell.yunwei.onduty.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.onduty.domain.OnDuty;
import com.enovell.yunwei.onduty.domain.OnDutyDTO;
import com.enovell.yunwei.onduty.dto.OnDutyNew;
import com.enovell.yunwei.onduty.service.ImportDataUtil;
import com.enovell.yunwei.onduty.service.OnDutyValidateService;
import com.enovell.yunwei.onduty.service.OndutyService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.ValidateMsg;

@Controller
@RequestMapping(value = "/ondutyNewAction")
public class OndutyNewAction {

	@Resource(name = "ondutyService")
	private OndutyService ondutyService;
	@Resource(name = "onDutyValidateService")
	private OnDutyValidateService onDutyValidateService;
	
	
	
	/**
	 * 通过条件分页获取
	 * getOnDutyByDto 
	 * @param start
	 * @param limit
	 * @param orgId
	 * @param dutyName 值班人
	 * @param week
	 * @param startDate
	 * @param endDate
	 * @param status
	 * @return
	 * 修改人:luoyan 2017-7-6   查询条件封装为dto
	 */
	@RequestMapping(value = "/getOnDutyByDto", method = RequestMethod.POST)
	@ResponseBody
	public String getOnDutyByDto(@RequestParam("start") int start,
			@RequestParam("limit") int limit,
			@RequestParam("param") String params
			) {
		
		OnDutyDTO onDutyDTO = JsonUtil.jsonToJavaObj(params, OnDutyDTO.class,"yyyy/MM/dd" );
		GridDto<OnDutyNew> gridDto = ondutyService.getByDTO(onDutyDTO, start, limit);
		
		return JsonUtil.javaToJsonAsString(gridDto, JsonUtil.DATE);
	}
	

	
	/**
	 * 批量新增
	 * addBoth 
	 * @param onduyUsers
	 * @param dateStr
	 * @param request
	 * @return
	 * 修改人:luoyan 2017-7-6  业务由service处理
	 */
	@RequestMapping(value = "/addBoth", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addBoth(
			@RequestParam("onduyUsers") String onduyUsers,
			@RequestParam("dateStr") String dateStr,
			HttpServletRequest request
			) {
		User curUser = (User) request.getSession().getAttribute("user");
		try {
			String msg = ondutyService.addBoth(curUser,onduyUsers,dateStr);
			if (msg != null && "false".equals(msg)) {
				return ResultMsg.getFailure("值班日期中已存在该值班人，请重新选择！", false);
			}
			return ResultMsg.getSuccess("新增成功！", null);
		} catch (Exception e) {
			return ResultMsg.getFailure("新增失败", null);
		}
	}
	
	

	/**
	 * 根据ID获取
	 * getById 
	 * @param ondutyId
	 * @return
	 */
	@RequestMapping(value = "/getById", method = RequestMethod.POST)
	@ResponseBody
	public String getById(
			@RequestParam("ondutyId") String ondutyId
			) {
		OnDuty onDuty = ondutyService.getById(ondutyId);
		return JsonUtil.javaToJsonAsString(onDuty, JsonUtil.DATE);
	}
	
	
	/**
	 * 修改
	 * update 
	 * @param ondutyStr
	 * @param request
	 * @return
	 * 修改人:luoyan 2017-7-6  业务由service处理
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg update(
			@RequestParam("ondutyStr") String ondutyStr,
			HttpServletRequest request
			) {
		
		OnDuty onDuty = JsonUtil.jsonToJavaObj(ondutyStr, OnDuty.class, JsonUtil.DATE);
		User curUser = (User) request.getSession().getAttribute("user");
		try {
			String msg = ondutyService.update(curUser,onDuty);
			if (msg !=null && "false".equals(msg)) {
				return ResultMsg.getFailure("值班日期中已存在该值班人，请重新选择!", false);
			}
			return ResultMsg.getSuccess("修改成功！", null);
		} catch (Exception e) {
			return ResultMsg.getFailure("修改失败！", null);
		}
		
	}
	
	/**
	 * 删除
	 * delete 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg delete(
			@RequestParam("ids") String ids
			) {
		String[] idsArray = ids.split(",");
		List<String> idList = Arrays.asList(idsArray);
		try {
			ondutyService.delete(idList);
			return ResultMsg.getSuccess("删除成功", null);
		} catch (Exception e) {
			return ResultMsg.getFailure("删除失败", null);
		}
		
	}
	
	/**
	 * 查询当日当前用户值班信息
	 * getTodayUserDuty 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/getTodayUserDuty", method = RequestMethod.POST)
	@ResponseBody
	public String getTodayUserDuty(
			@RequestParam("userId") String userId
			) {

		OnDuty todayUserDuty = ondutyService.getTodayUserDuty(userId);
	
		return JsonUtil.javaToJsonAsString(todayUserDuty, JsonUtil.DATE);
	}
	
	/**
	 * 汇报
	 * report 
	 * @param ondutyStr
	 * @param request
	 * @return
	 * 修改人:luoyan 2017-7-6  业务由service处理
	 */
	@RequestMapping(value = "/report", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg report(
			@RequestParam("ondutyStr") String ondutyStr,
			HttpServletRequest request
			) {
		
		OnDuty onDuty = JsonUtil.jsonToJavaObj(ondutyStr, OnDuty.class, JsonUtil.DATE);
		try {
			String msg = ondutyService.report(onDuty);
			if (msg != null && "false".equals(msg)) {
				return ResultMsg.getFailure("值班日期中已存在该值班人，请重新选择！", false);
			}
			return ResultMsg.getSuccess("情况汇报成功", null);
		} catch (Exception e) {
			return ResultMsg.getFailure("情况汇报失败", null);
		}
	}

	/**
	 * 导入数据
	 * importData 
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
						List<ValidateMsg> results = onDutyValidateService.validate(originFileName,msgs,wb,createUser);//验证数据有效性
						if(results.isEmpty()){
							response.sendRedirect("../views/ondutyNew/onDutyAllPage.jsp?threePerId="+perId);
							//request.setAttribute("permissionId", perId);
							//request.getRequestDispatcher("/views/onduty/onDutyAllPage.jsp").forward(request, response);//转发到apage.jsp
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
	
