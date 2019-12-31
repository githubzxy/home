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
import com.enovell.yunwei.technical.domain.CompletionInfo;
import com.enovell.yunwei.technical.dto.CompletionInfoDTO;
import com.enovell.yunwei.technical.dto.TechnicalDocumentExportDTO;
import com.enovell.yunwei.technical.service.CompletionInfoService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;

/**
 * 
 * 项目名称：kunmingrinms 
 * 类名称：CompletionAction 
 * 类描述: 竣工资料Action 
 * 创建人：lidt 创建时间：2016-11-25 上午10:01:26 
 * 修改人：lidt 
 * 修改时间：2016-11-25 上午10:01:26
 * 
 */
@Controller
@RequestMapping(value = "/completionAction")
public class CompletionAction {

	@Resource(name = "CompletionInfoService")
	private CompletionInfoService completionInfoService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * 
	 * getAllCompletionInfos 得到竣工资料list
	 * 
	 * @param departId
	 * @param name
	 *            竣工资料名
	 * @param railName
	 *            线别名
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
	@RequestMapping(value = "/getAllCompletionInfos", method = RequestMethod.POST)
	@ResponseBody
	public String getAllCompletionInfos(
			@RequestParam("departId") String departId,
			@RequestParam("name") String name,
			@RequestParam("railLine") String railName,
			@RequestParam("technicalInfoType") String technicalInfoType,
			@RequestParam("createStartDate") String createStartDate,
			@RequestParam("createEndDate") String createEndDate,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		CompletionInfoDTO completionInfoDTO = new CompletionInfoDTO();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(departId)) {
			Organization organization = new Organization();
			organization.setId(departId);
			completionInfoDTO.setDepart(organization);
		}
		if (StringUtils.isNotEmpty(name)) {
			completionInfoDTO.setName(name.replace(" ", ""));
		}
		if (StringUtils.isNotBlank(railName)) {
			completionInfoDTO.setRailLine(railName);
		}
		if (StringUtils.isNotEmpty(technicalInfoType)) {
			completionInfoDTO.setTechnicalInfoType(Integer
					.valueOf(technicalInfoType));
		}
		if (StringUtils.isNotEmpty(createStartDate)) {
			completionInfoDTO.setCreateStartDate(StringDateToDateUtil
					.getDate(createStartDate));
		}
		if (StringUtils.isNotEmpty(createEndDate)) {
			completionInfoDTO.setCreateEndDate(StringDateToDateUtil
					.getDate(createEndDate));
		}

		GridDto<CompletionInfo> gridDto = completionInfoService.getGridDtos(
				completionInfoDTO, start, limit);

		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 
	 * addCompletionInfo 新增竣工资料
	 * 
	 * @param request
	 * @param name
	 *            竣工资料
	 * @param railLineName
	 *            线别名
	 * @param completionTime
	 *            竣工时间
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
	@RequestMapping(value = "/addCompletionInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addCompletionInfo(
			HttpServletRequest request,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "railLine", required = false) String railLineName,
			@RequestParam(value = "completionTime", required = false) String completionTime,
			@RequestParam(value = "technicalInfoType", required = false) String technicalInfoType,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "remark", required = false) String remark,
			@RequestParam(value = "uploadFileArr", required = false) String uploadFileArr) {
		try{
			// 读取session中的用户
			User user = (User) request.getSession().getAttribute("user");
			CompletionInfo completionInfo = new CompletionInfo();
			completionInfo.setName(name);// 技术图纸名
			completionInfo.setRailLineName(railLineName);
			completionInfo.setCompletionDate(StringDateToDateUtil
					.getDate(completionTime));
			completionInfo.setDepart(user.getOrganization());// 所属部门
			completionInfo.setTechnicalInfoType(Integer.valueOf(technicalInfoType));// 资料类别
			completionInfo.setAddress(address);// 施工地点
			completionInfo.setRemark(remark);// 备注
			completionInfo.setCreateUser(user);// 用户名
			completionInfo.setCreateDate(new Date());// 创建时间
			// 获取多个上传文件的dto
			UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
					UploadFileDto[].class);
			// 新增技术图纸信息
			completionInfoService.addCompletionInfo(completionInfo, dtos);
			return ResultMsg.getSuccess("新增成功！", null);
		}catch(Exception e){
			e.printStackTrace();
			return ResultMsg.getFailure("保存数据失败，请联系管理员！", null);
		}
		
		
	}

	/**
	 * 
	 * getCompletionById 根据id获取竣工资料
	 * 
	 * @param id
	 * @return JSON字符串
	 */
	@RequestMapping(value = "/getCompletionById", method = RequestMethod.POST)
	@ResponseBody
	public String getCompletionById(@RequestParam("id") String id) {
		CompletionInfo info = completionInfoService.getCompletionInfoById(id);
		return JsonUtil.javaToJsonAsString(info);
	}

	/**
	 * 
	 * updateCompletion 这里添加描述信息
	 * 
	 * @param request
	 * @param id
	 * @param name
	 *            竣工资料
	 * @param railLineName
	 *            线别名
	 * @param completionTime
	 *            竣工时间
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
	@RequestMapping(value = "/updateCompletion", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateCompletion(
			HttpServletRequest request,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "railLine", required = false) String railLineName,
			@RequestParam(value = "completionTime", required = false) String completionTime,
			@RequestParam(value = "technicalInfoType", required = false) String technicalInfoType,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "remark", required = false) String remark,
			@RequestParam(value = "uploadFileArr", required = false) String uploadFileArr) {
		try{
			// 读取session中的用户
			User user = (User) request.getSession().getAttribute("user");
			// 获取技术图纸信息(显示在页面上的数据)
			CompletionInfo completionInfo = completionInfoService
					.getCompletionInfoById(id);
			// 取出附件
			String attachFileId = null;
			if (completionInfo.getAttachFile() != null) {
				attachFileId = completionInfo.getAttachFile().getId();
			}
			completionInfo.setName(name);// 技术图纸名
			completionInfo.setRailLineName(railLineName);
			completionInfo.setCompletionDate(StringDateToDateUtil
					.getDate(completionTime));
			completionInfo.setTechnicalInfoType(Integer.valueOf(technicalInfoType));// 资料类别
			completionInfo.setAddress(address);// 施工地点
			completionInfo.setRemark(remark);// 备注
			completionInfo.setUpdateUser(user);// 用户名
			completionInfo.setUpdateDate(new Date());// 修改时间
			// 获取多个上传文件的dto
			UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
					UploadFileDto[].class);
			// 修改技术图纸
			completionInfoService.updateCompletionInfo(completionInfo, dtos);
			// 删除附件
			if (attachFileId != null) {
				attachFileService.deleteAttachFile(attachFileId);
			}
			return ResultMsg.getSuccess("修改成功！", null);
		}catch(Exception e){
			return ResultMsg.getFailure("修改失败，请重试！", null);
		}
	}

	/**
	 * 
	 * delCompletion 批量删除竣工资料
	 * 
	 * @param jsonIds
	 * @return 
	 */
	@RequestMapping(value = "/delCompletion", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg delCompletion(@RequestParam("jsonIds") String jsonIds) {
		try{
			completionInfoService.deleteCompletionInfos(jsonIds);
			return ResultMsg.getSuccess("删除成功！", null);
		}catch(Exception e){
			return ResultMsg.getFailure("删除失败，请稍后重试！", null);
		}
		
	}

	/**
	 * 
	 * expCompletion 导出竣工资料
	 * 
	 * @param exportXlsJson
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/expCompletion", method = RequestMethod.POST)
	public void expCompletion(
			@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request, HttpServletResponse response) {

		List<TechnicalDocumentExportDTO> dataList = new ArrayList<TechnicalDocumentExportDTO>();
		TechnicalDocumentExportDTO[] dtos = JsonUtil.jsonToJavaObj(
				exportXlsJson, TechnicalDocumentExportDTO[].class);
		Collections.addAll(dataList, dtos);

		String[] headerTableColumns = new String[] {
				"资料名称" + "_" + "60" + "_" + "my.getName()",
				"所属部门" + "_" + "30" + "_" + "my.getDepart()",
				"线别名称" + "_" + "20" + "_" + "my.getRailLine()",
				"资料类别" + "_" + "30" + "_" + "my.getTechnicalInfoType()",
				"创建时间" + "_" + "25" + "_" + "my.getCreateStartDate()" };

		Map<String, Object> expandJexlContext = new HashMap<String, Object>();

		CommonPoiExportExcel<TechnicalDocumentExportDTO> export = new CommonPoiExportExcel<TechnicalDocumentExportDTO>();
		export.exportXls("竣工资料", headerTableColumns, expandJexlContext,
				dataList, request, response);
	}

}
