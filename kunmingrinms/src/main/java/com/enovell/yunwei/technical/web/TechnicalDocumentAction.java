package com.enovell.yunwei.technical.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
import com.enovell.yunwei.technical.domain.TechnicalDocumentInfo;
import com.enovell.yunwei.technical.dto.TechnicalDocumentExportDTO;
import com.enovell.yunwei.technical.dto.TechnicalDto;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;
import com.enovell.yunwei.technical.service.TechnicalDocumentInfoService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;

/**
 * 项目名称：kunmingrinms 类名称：TechnicalDocumentAction 类描述: 技术资料Action 创建人：yangsy
 * 创建时间：2016-11-24 
 * 
 */
@Controller
@RequestMapping(value = "/technicalDocument")
public class TechnicalDocumentAction {

	@Resource(name = "TechnicalDocumentInfoService")
	private TechnicalDocumentInfoService technicalInfoService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * 
	 * addTechnicalInfo 添加技术资料
	 * 
	 * @param request
	 * @param name
	 *            技术资料名
	 * @param technicalInfoType
	 *            资料类别
	 * @param address
	 *            施工地点
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return ResultMsg
	 */
	@RequestMapping(value = "/addTechnical", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addTechnicalInfo(HttpServletRequest request,
			@RequestParam("name") String name,
//			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("address") String address,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		TechnicalDocumentInfo technicalInfo = new TechnicalDocumentInfo();
		technicalInfo.setName(name);// 技术资料名
		technicalInfo.setDepart(user.getOrganization());// 所属部门
//		technicalInfo.setTechnicalInfoType(Integer.valueOf(technicalInfoType));// 资料类别
		technicalInfo.setAddress(address);// 施工地点
		technicalInfo.setRemark(remark);// 备注
		technicalInfo.setCreateUser(user);// 用户名
		technicalInfo.setCreateDate(new Date());// 创建时间
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		try{
			// 新增技术资料信息
			technicalInfoService.addTechnicalInfo(technicalInfo,dtos);
			return ResultMsg.getSuccess("新增成功", null);
		}catch(Exception e) {
			return ResultMsg.getFailure("新增失败", null);
		}
	}

	/**
	 * 
	 * updateTechnicalInfo 修改技术资料
	 * 
	 * @param request
	 * @param id
	 *            技术资料id
	 * @param name
	 *            技术资料名称
	 * @param technicalInfoType
	 *            所属部门
	 * @param address
	 *            施工地点
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return ResultMsg
	 */
	@RequestMapping(value = "/updateTechnical", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateTechnicalInfo(HttpServletRequest request,
			@RequestParam("id") String id, @RequestParam("name") String name,
//			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("address") String address,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		// 获取技术资料信息(显示在页面上的数据)
		TechnicalDocumentInfo technicalInfo = technicalInfoService
				.getTechnicalInfoById(id);
		// 取出附件
		String attachFileId = null;
		if (technicalInfo.getAttachFile() != null) {
			attachFileId = technicalInfo.getAttachFile().getId();
		}
		technicalInfo.getAttachFile();
		technicalInfo.setName(name);// 技术资料名
//		technicalInfo.setTechnicalInfoType(Integer.valueOf(technicalInfoType));// 资料类别
		technicalInfo.setAddress(address);// 施工地点
		technicalInfo.setRemark(remark);// 备注
		technicalInfo.setUpdateUser(user);// 用户名
		technicalInfo.setUpdateDate(new Date());// 修改时间
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		try {
			// 修改技术资料
			technicalInfoService.updateTechnicalInfo(technicalInfo,dtos);
			// 删除附件
			if (attachFileId != null) {
				attachFileService.deleteAttachFile(attachFileId);
			}
			return ResultMsg.getSuccess("修改成功", null);
		}catch(Exception e) {
			return ResultMsg.getFailure("修改失败", null);
		}
		
		
	}

	/**
	 * 
	 * getTechnicalInfoById 根据id获取技术资料
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getTechnicalById", method = RequestMethod.POST)
	@ResponseBody
	public String getTechnicalInfoById(@RequestParam("id") String id) {
		TechnicalDocumentInfo info = technicalInfoService.getTechnicalInfoById(id);
		return JsonUtil.javaToJsonAsString(info);
	}

	/**
	 * 
	 * deleteTechnicalInfos 批量删除技术资料
	 * 
	 * @param ids
	 * @return ResultMsg
	 */
	@RequestMapping(value = "/delTechnical", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteTechnicalInfos(@RequestParam("jsonIds") String jsonIds) {
		try {
			technicalInfoService.deleteTechnicalInfos(jsonIds);
			return ResultMsg.getSuccess("删除成功", null);
		}catch(Exception e) {
			return ResultMsg.getFailure("删除失败", null);
		}
	}



	/**
	 * 
	 * getAllTechnicalInfoInfos 查询技术资料
	 * 
	 * @param depart
	 *            所属部门
	 * @param name
	 *            资料名称
	 * @param technicalInfoType
	 *            资料类别
	 * @param createStartDate
	 *            创建开始时间
	 * @param createEndDate
	 *            创建结束时间
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value = "/technicalList", method = RequestMethod.POST)
	@ResponseBody
	public String getAllTechnicalInfoInfos(
			@RequestParam(value = "depart", required = false) String depart,
			@RequestParam(value = "name", required = false) String name,
//			@RequestParam(value = "technicalInfoType", required = false) String technicalInfoType,
			@RequestParam(value = "createStartDate", required = false) String createStartDate,
			@RequestParam(value = "createEndDate", required = false) String createEndDate,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		TechnicalInfoDTO technicalInfoDTO = new TechnicalInfoDTO();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(depart)) {
			Organization organization = new Organization();
			organization.setId(depart);
			technicalInfoDTO.setDepart(organization);
		}
		if (StringUtils.isNotEmpty(name)) {
			String newName = name.replaceAll(" ", "");
			technicalInfoDTO.setName(newName);
		}
//		if (StringUtils.isNotEmpty(technicalInfoType)) {
//			technicalInfoDTO.setTechnicalInfoType(Integer
//					.valueOf(technicalInfoType));
//		}
		if (StringUtils.isNotEmpty(createStartDate)) {
			technicalInfoDTO.setCreateStartDate(StringDateToDateUtil
					.getDate(createStartDate));
		}
		if (StringUtils.isNotEmpty(createEndDate)) {
			technicalInfoDTO.setCreateEndDate(StringDateToDateUtil
					.getDate(createEndDate));
		}
		List<TechnicalDto> dto = technicalInfoService.getAllTechnicalInfoInfos(
				technicalInfoDTO, start, limit);
		long results = technicalInfoService
				.getTechnicalInfoInfoCount(technicalInfoDTO);
		GridDto<TechnicalDto> gridDto = new GridDto<TechnicalDto>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 获取技术资料记录数
	 * 
	 * @param technicalInfoDTO
	 * @return
	 */
	public int getTechnicalInfoInfoCount(TechnicalInfoDTO technicalInfoDTO) {

		return technicalInfoService.getTechnicalInfoInfoCount(technicalInfoDTO);
	}


	/**
	 * 
	 * exportXls 导出Excel
	 * @param name
	 * @param depart
	 * @param technicalInfoType
	 * @param createDate
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/exportXls", method = RequestMethod.POST)
	@ResponseBody
	public void exportXls(@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request,
			HttpServletResponse response) {
		List<TechnicalDocumentExportDTO> dataList = new ArrayList<TechnicalDocumentExportDTO>();
		TechnicalDocumentExportDTO[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson, TechnicalDocumentExportDTO[].class);
		Collections.addAll(dataList, dtos);
		String[] headerTableColumns = new String[]{ 
				"资料名称" + "_" +"60" + "_" + "my.getName()",
				"所属部门" + "_" +"30" + "_" + "my.getDepart()",
//				"资料类别" + "_" +"30" + "_" + "my.getTechnicalInfoType()",
				"创建时间" + "_" +"25" + "_" + "my.getCreateStartDate()"
		}; 
		CommonPoiExportExcel<TechnicalDocumentExportDTO> export = new CommonPoiExportExcel<TechnicalDocumentExportDTO>();
		export.exportXls("机房技术资料及台账", headerTableColumns, new HashMap(), dataList, request, response);
	}
}
