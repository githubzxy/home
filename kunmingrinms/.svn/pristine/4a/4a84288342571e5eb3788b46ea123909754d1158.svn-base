  /**   
 * 文件名：TechnicalManager.java    
 * 版本信息：IRMS1.0   
 * 日期：2012-9-5 下午04:21:06   
 * Copyright Enovell Corporation 2012    
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
import com.enovell.yunwei.technical.domain.TechnicalInfo;
import com.enovell.yunwei.technical.dto.TechnicalDocumentExportDTO;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;
import com.enovell.yunwei.technical.service.TechnicalInfoService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;

/**
 * 项目名称：kunmingrinms 
 * 类名称：TechnicalAction 
 * 类描述: 技术图纸Action 
 * 创建人：zhangsihong
 * 创建时间：2012-9-5 下午04:21:06 
 * 修改人：zhangsihong 
 * 修改时间：2012-9-5 下午04:21:06
 * 
 */
@Controller
@RequestMapping(value = "/technical")
public class TechnicalAction {

	@Resource(name = "TechnicalInfoService")
	private TechnicalInfoService technicalInfoService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * 
	 * addTechnicalInfo 添加技术图纸
	 * 
	 * @param request
	 * @param name
	 *            技术图纸名
	 * @param technicalInfoType
	 *            资料类别
	 * @param address
	 *            施工地点
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return 
	 */
	@RequestMapping(value = "/addTechnical", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addTechnicalInfo(HttpServletRequest request,
			@RequestParam("name") String name,
			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("address") String address,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		try{
			// 读取session中的用户
			User user = (User) request.getSession().getAttribute("user");
			TechnicalInfo technicalInfo = new TechnicalInfo();
			technicalInfo.setType(1);// 类型
			technicalInfo.setName(name);// 技术图纸名
			technicalInfo.setDepart(user.getOrganization());// 所属部门
			technicalInfo.setTechnicalInfoType(Integer.valueOf(technicalInfoType));// 资料类别
			technicalInfo.setAddress(address);// 施工地点
			technicalInfo.setRemark(remark);// 备注
			technicalInfo.setCreateUser(user);// 用户名
			technicalInfo.setCreateDate(new Date());// 创建时间
			// 获取多个上传文件的dto
			UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
					UploadFileDto[].class);
			// 新增技术图纸信息
			technicalInfoService.addTechnicalInfo(technicalInfo,dtos);
			return ResultMsg.getSuccess("新增成功！", null);
		}catch(Exception e){
			e.printStackTrace();
			return ResultMsg.getFailure("新增失败！", null);
		}
		
		
	}

	/**
	 * 
	 * updateTechnicalInfo 修改技术图纸
	 * 
	 * @param request
	 * @param id
	 *            技术图纸id
	 * @param name
	 *            技术图纸名称
	 * @param technicalInfoType
	 *            所属部门
	 * @param address
	 *            施工地点
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return 
	 */
	@RequestMapping(value = "/updateTechnical", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateTechnicalInfo(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("address") String address,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		try{
			// 读取session中的用户
			User user = (User) request.getSession().getAttribute("user");
			// 获取技术图纸信息(显示在页面上的数据)
			TechnicalInfo technicalInfo = technicalInfoService
					.getTechnicalInfoById(id);
			// 取出附件
			String attachFileId = null;
			if (technicalInfo.getAttachFile() != null) {
				attachFileId = technicalInfo.getAttachFile().getId();
			}
			technicalInfo.getAttachFile();
			technicalInfo.setName(name);// 技术图纸名
			technicalInfo.setTechnicalInfoType(Integer.valueOf(technicalInfoType));// 资料类别
			technicalInfo.setAddress(address);// 施工地点
			technicalInfo.setRemark(remark);// 备注
			technicalInfo.setUpdateUser(user);// 用户名
			technicalInfo.setUpdateDate(new Date());// 修改时间
			// 获取多个上传文件的dto
			UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
					UploadFileDto[].class);
			// 修改技术图纸
			technicalInfoService.updateTechnicalInfo(technicalInfo,dtos);
			// 删除附件
			if (attachFileId != null) {
				attachFileService.deleteAttachFile(attachFileId);
			}
			return ResultMsg.getSuccess("修改成功！", null);
		}catch(Exception e){
			e.printStackTrace();
			return ResultMsg.getFailure("修改失败！", null);
		}
		
		
	}

	/**
	 * 
	 * getTechnicalInfoById 根据id获取技术图纸
	 * 
	 * @param id
	 * @return TechnicalInfo
	 */
	@RequestMapping(value = "/getTechnicalById", method = RequestMethod.POST)
	@ResponseBody
	public String getTechnicalInfoById(@RequestParam("id") String id) {
		TechnicalInfo info = technicalInfoService.getTechnicalInfoById(id);
		return JsonUtil.javaToJsonAsString(info);
	}

	/**
	 * 
	 * deleteTechnicalInfos 批量删除技术图纸
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delTechnical", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteTechnicalInfos(@RequestParam("jsonIds") String jsonIds) {
		try{
			//删除技术图纸
			technicalInfoService.deleteTechnicalInfos(jsonIds);
			return ResultMsg.getSuccess("删除成功!", null);
		}catch(Exception e){
			e.printStackTrace();
			return ResultMsg.getFailure("删除失败!", null);
		}
	}

	/**
	 * 
	 * getAllTechnicalInfoInfos 查询技术图纸
	 * 
	 * @param depart
	 *            所属部门
	 * @param name
	 *            图纸名称
	 * @param technicalInfoType
	 *            资料类别
	 * @param createStartDate
	 *            创建开始时间
	 * @param createEndDate
	 *            创建结束时间
	 * @param start
	 * @param limit
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/technicalList", method = RequestMethod.POST)
	@ResponseBody
	public String getAllTechnicalInfoInfos(
			@RequestParam(value="depart",required=false) String depart,
			@RequestParam(value="name",required=false) String name,
			@RequestParam(value="technicalInfoType",required=false) String technicalInfoType,
			@RequestParam(value="createStartDate",required=false) String createStartDate,
			@RequestParam(value="createEndDate",required=false) String createEndDate,
			@RequestParam(value="start") int start, @RequestParam(value="limit") int limit) {
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
		List<TechnicalInfo> dto = technicalInfoService.getAllTechnicalInfoInfos(
				technicalInfoDTO, start, limit);
		long results = technicalInfoService
				.getTechnicalInfoInfoCount(technicalInfoDTO);
		GridDto<TechnicalInfo> gridDto = new GridDto<TechnicalInfo>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * expTechnical 导出技术图纸
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expTechnical", method = RequestMethod.POST)
	@ResponseBody
	public void expTechnical(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<TechnicalDocumentExportDTO> dataList = new ArrayList<TechnicalDocumentExportDTO>();
		TechnicalDocumentExportDTO[] dtos = JsonUtil.jsonToJavaObj(
				exportXlsJson, TechnicalDocumentExportDTO[].class);
		Collections.addAll(dataList, dtos);

		String[] headerTableColumns = new String[] {
				"图纸名称" + "_" + "60" + "_" + "my.getName()",
				"所属部门" + "_" + "30" + "_" + "my.getDepart()",
				"资料类别" + "_" + "30" + "_" + "my.getTechnicalInfoType()",
				"创建时间" + "_" + "25" + "_" + "my.getCreateStartDate()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();

		CommonPoiExportExcel<TechnicalDocumentExportDTO> export = new CommonPoiExportExcel<TechnicalDocumentExportDTO>();
		export.exportXls("系统网络图", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}
}
