/**   
 * 文件名：TechnicalRegulationManager.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-9-26 下午2:17:59   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.technical.web;

import java.util.Collections;
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

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.technical.domain.TechnicalRegulation;
import com.enovell.yunwei.technical.dto.TechnicalDocumentExportDTO;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;
import com.enovell.yunwei.technical.service.TechnicalRegulationService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;


/**
 * 项目名称：kunmingrinms 
 * 类名称：TechnicalRegulationManager 
 * 类描述: 技术规章管理类
 * 创建人：zhangsihong 
 * 创建时间：2013-9-26 下午2:17:59 
 * 修改人：zhangsihong 
 * 修改时间：2013-9-26 下午2:17:59
 * 
 */
@Controller
@RequestMapping(value = "/technicalRegulation")
public class TechnicalRegulationAction {

	@Resource(name = "TechnicalRegulationService")
	private TechnicalRegulationService technicalRegulationService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * 
	 * getProductInstructionList 查询技术规章列表
	 * 
	 * @param depart
	 *            部门
	 * @param name
	 *            技术规章名称
	 * @param technicalInfoType
	 *            资料类别
	 * @param createStartDate
	 *            创建时间
	 * @param createEndDate
	 *            创建人
	 * @param start
	 * @param limit
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public String getProductInstructionList(
			@RequestParam(value="depart",required=false) String depart,
			@RequestParam(value="name",required=false) String name,
			@RequestParam(value="technicalInfoType",required=false) String technicalInfoType,
			@RequestParam(value="createStartDate",required=false) String createStartDate,
			@RequestParam(value="createEndDate",required=false) String createEndDate,
			@RequestParam(value="start") int start, @RequestParam("limit") int limit) {
		TechnicalInfoDTO technicalInfoDTO = new TechnicalInfoDTO();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(depart)) {
			Organization organization = new Organization();
			organization.setId(depart);
			technicalInfoDTO.setDepart(organization);
		}
		if (StringUtils.isNotEmpty(name)) {
			technicalInfoDTO.setName(name.replace(" ", ""));
		}
		if (StringUtils.isNotEmpty(technicalInfoType)) {
			technicalInfoDTO.setTechnicalInfoType(Integer
					.valueOf(technicalInfoType));
		}
		if (StringUtils.isNotEmpty(createStartDate)) {
			technicalInfoDTO.setCreateStartDate(StringDateToDateUtil
					.getDate(createStartDate));
		}
		if (StringUtils.isNotEmpty(createEndDate)) {
			technicalInfoDTO.setCreateEndDate(StringDateToDateUtil
					.getDate(createEndDate));
		}
		List<TechnicalRegulation> dto = technicalRegulationService
				.getTechnicalRegulations(technicalInfoDTO, start, limit);
		long results = technicalRegulationService
				.getTechnicalRegulationCount(technicalInfoDTO);
		GridDto<TechnicalRegulation> gridDto = new GridDto<TechnicalRegulation>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * addTechnicalRegulation 新增技术规章
	 * 
	 * @param request
	 * @param name
	 *            技术规章名称
	 * @param technicalInfoType
	 *            资料类别
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return
	 */
	@RequestMapping(value = "/addTechnicalRegulation", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addTechnicalRegulation(HttpServletRequest request,
			@RequestParam("name") String name,
			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		TechnicalRegulation technicalRegulation = new TechnicalRegulation();
		technicalRegulation.setName(name);// 产品说明书名
		technicalRegulation.setDepart(user.getOrganization());// 所属部门
		technicalRegulation.setTechnicalInfoType(Integer
				.valueOf(technicalInfoType));// 资料类别
		technicalRegulation.setRemark(remark);// 备注
		technicalRegulation.setCreateUser(user);// 用户名
		technicalRegulation.setCreateDate(new Date());// 创建时间
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);

		try {
			// 新增产品说明书信息
			technicalRegulationService.addTechnicalRegulation(technicalRegulation,
					dtos);
//			return null;
			return ResultMsg.getSuccess("新增成功！", null);
		}catch(Exception e) {
			return ResultMsg.getFailure("新增失败！", null);
		}
		
	}

	/**
	 * 
	 * getTechnicalRegulationById 根据id获取技术规章
	 * 
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getTechnicalRegulationById", method = RequestMethod.POST)
	@ResponseBody
	public String getTechnicalRegulationById(@RequestParam("id") String id) {
		TechnicalRegulation technicalRegulation = technicalRegulationService
				.getTechnicalRegulationById(id);
		return JsonUtil.javaToJsonAsString(technicalRegulation);
	}

	/**
	 * 
	 * delTechnicalRegulation 批量删除技术规章
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delTechnicalRegulation", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteTechnicalRegulation(
			@RequestParam("jsonIds") String jsonIds) {
		
		try {
			technicalRegulationService.deleteTechnicalRegulations(jsonIds);
			return ResultMsg.getSuccess("删除成功！", null);
		}catch(Exception e) {
			return ResultMsg.getFailure("删除失败！", null);
		}
//		return null;
	}

	/**
	 * 
	 * updateTechnicalRegulation 修改技术规章
	 * 
	 * @param request
	 * @param id
	 *            技术规章id
	 * @param name
	 *            技术规章名称
	 * @param technicalInfoType
	 *            资料类别
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return
	 */
	@RequestMapping(value = "/updateTechnicalRegulation", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateTechnicalRegulation(HttpServletRequest request,
			@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		// 获取技术规章信息(显示在页面上的数据)
		TechnicalRegulation technicalRegulation = technicalRegulationService
				.getTechnicalRegulationById(id);
		// 取出附件
		String attachFileId = null;
		if (technicalRegulation.getAttachFile() != null) {
			attachFileId = technicalRegulation.getAttachFile().getId();
		}
		technicalRegulation.setCreateUser(user);
		technicalRegulation.setName(name);// 技术规章名
		technicalRegulation.setTechnicalInfoType(Integer
				.valueOf(technicalInfoType));// 资料类别
		technicalRegulation.setRemark(remark);// 备注
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		try {
			// 修改技术规章
			technicalRegulationService.updateTechnicalRegulation(
					technicalRegulation, dtos);
			// 删除附件
			if (attachFileId != null) {
				attachFileService.deleteAttachFile(attachFileId);
			}
			return ResultMsg.getSuccess("修改成功！", null);
		}catch(Exception e) {
			return ResultMsg.getFailure("修改失败！", null);
		}
	}

	/**
	 * 
	 * expTechnicalRegulation 导出技术规章
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expTechnicalRegulation", method = RequestMethod.POST)
	public void expTechnicalRegulation(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<TechnicalDocumentExportDTO> dataList = new ArrayList<TechnicalDocumentExportDTO>();
		TechnicalDocumentExportDTO[] dtos = JsonUtil.jsonToJavaObj(
				exportXlsJson, TechnicalDocumentExportDTO[].class);
		Collections.addAll(dataList, dtos);
		String[] headerTableColumns = new String[] {
				"技术规章" + "_" + "60" + "_" + "my.getName()",
				"所属部门" + "_" + "30" + "_" + "my.getDepart()",
				"资料类别" + "_" + "30" + "_" + "my.getTechnicalInfoType()",
				"创建时间" + "_" + "25" + "_" + "my.getCreateStartDate()" };
		
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		CommonPoiExportExcel<TechnicalDocumentExportDTO> export = new CommonPoiExportExcel<TechnicalDocumentExportDTO>();
		export.exportXls("技术规章", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}

}
