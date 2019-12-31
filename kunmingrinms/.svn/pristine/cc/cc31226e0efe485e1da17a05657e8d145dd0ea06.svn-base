/**   
 * 文件名：ProductInstructionManager.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-9-26 下午2:17:33   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.technical.web;

import java.util.ArrayList;
import java.util.Collections;
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
import com.enovell.yunwei.technical.domain.ProductInstruction;
import com.enovell.yunwei.technical.dto.TechnicalDocumentExportDTO;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;
import com.enovell.yunwei.technical.service.ProductInstructionService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;

/**
 * 项目名称：kunmingrinms
 * 类名称：ProductInstructionManager 
 * 类描述: 产品说明书Action
 * 创建人：zhangsihong 
 * 创建时间：2013-9-26 下午2:17:33 
 * 修改人：zhangsihong 
 * 修改时间：2013-9-26 下午2:17:33
 * 
 */
@Controller
@RequestMapping(value = "/productInstruction")
public class ProductInstructionAction {

	@Resource(name = "ProductInstructionService")
	private ProductInstructionService productInstructionService;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * 
	 * getProductInstructionList 查询产品说明书列表
	 * 
	 * @param depart
	 *            部门
	 * @param name
	 *            产品说明书名称
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
			@RequestParam(value = "depart", required=false) String depart,
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="technicalInfoType", required=false) String technicalInfoType,
			@RequestParam(value="createStartDate", required=false) String createStartDate,
			@RequestParam(value="createEndDate", required=false) String createEndDate,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
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
		List<ProductInstruction> dto = productInstructionService
				.getProductInstructions(technicalInfoDTO, start, limit);
		long results = productInstructionService
				.getProductInstructionCount(technicalInfoDTO);
		GridDto<ProductInstruction> gridDto = new GridDto<ProductInstruction>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * addProductInstruction 新增产品说明书
	 * 
	 * @param request
	 * @param name
	 *            产品说明书名称
	 * @param technicalInfoType
	 *            资料类别
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return
	 */
	@RequestMapping(value = "/addProductInstruction", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addProductInstruction(HttpServletRequest request,
			@RequestParam("name") String name,
			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		ProductInstruction productInstruction = new ProductInstruction();
		productInstruction.setName(name);// 产品说明书名
		productInstruction.setDepart(user.getOrganization());// 所属部门
		productInstruction.setTechnicalInfoType(Integer
				.valueOf(technicalInfoType));// 资料类别
		productInstruction.setRemark(remark);// 备注
		productInstruction.setCreateUser(user);// 用户名
		productInstruction.setCreateDate(new Date());// 创建时间
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		try {
			// 新增产品说明书信息
			productInstructionService.addProductInstruction(productInstruction,dtos);
			return ResultMsg.getSuccess("新增成功！", null);
		}catch(Exception e) {
			e.printStackTrace();
			return ResultMsg.getFailure("新增失败！", null);
		}
		
	}

	/**
	 * 
	 * getProductInstructionById 根据id获取产品说明书
	 * 
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getProductInstructionById", method = RequestMethod.POST)
	@ResponseBody
	public String getProductInstructionById(@RequestParam("id") String id) {
		ProductInstruction productInstruction = productInstructionService
				.getProductInstructionById(id);
		return JsonUtil.javaToJsonAsString(productInstruction);
	}

	/**
	 * 
	 * deleteTechnicalInfos 批量删除产品说明书
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delProductInstruction", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteProductInstruction(@RequestParam("jsonIds") String jsonIds) {
		try {
			productInstructionService.deleteProductInstructions(jsonIds);
			return ResultMsg.getSuccess("删除成功！", null);
		}catch(Exception e) {
			return ResultMsg.getFailure("删除失败！", null);
		}
	}

	/**
	 * 
	 * updateProductInstruction 修改产品说明书
	 * 
	 * @param request
	 * @param id
	 *            产品说明书id
	 * @param name
	 *            产品说明书名称
	 * @param technicalInfoType
	 *            资料类别
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return
	 */
	@RequestMapping(value = "/updateProductInstruction", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateProductInstruction(HttpServletRequest request,
			@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		// 获取产品说明书信息(显示在页面上的数据)
		ProductInstruction productInstruction = productInstructionService
				.getProductInstructionById(id);
		// 取出附件
		String attachFileId = null;
		if (productInstruction.getAttachFile() != null) {
			attachFileId = productInstruction.getAttachFile().getId();
		}
		productInstruction.setCreateUser(user);
		productInstruction.setName(name);// 产品说明书名
		productInstruction.setTechnicalInfoType(Integer
				.valueOf(technicalInfoType));// 资料类别
		productInstruction.setRemark(remark);// 备注
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		try {
			// 修改产品说明书
			productInstructionService.updateProductInstruction(productInstruction,
					dtos);
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
	 * expProductInstruction 导出产品说明书
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expProductInstruction", method = RequestMethod.POST)
	public void expProductInstruction(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<TechnicalDocumentExportDTO> dataList = new ArrayList<TechnicalDocumentExportDTO>();
		TechnicalDocumentExportDTO[] dtos = JsonUtil.jsonToJavaObj(
				exportXlsJson, TechnicalDocumentExportDTO[].class);
		Collections.addAll(dataList, dtos);

		String[] headerTableColumns = new String[] {
				"产品说明书" + "_" + "60" + "_" + "my.getName()",
				"所属部门" + "_" + "30" + "_" + "my.getDepart()",
				"资料类别" + "_" + "30" + "_" + "my.getTechnicalInfoType()",
				"创建时间" + "_" + "25" + "_" + "my.getCreateStartDate()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();

		CommonPoiExportExcel<TechnicalDocumentExportDTO> export = new CommonPoiExportExcel<TechnicalDocumentExportDTO>();
		export.exportXls("产品说明书", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}

}
