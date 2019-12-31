
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
import com.enovell.yunwei.technical.domain.TechnicalAccountInfo;
import com.enovell.yunwei.technical.dto.TechnicalAccountDTO;
import com.enovell.yunwei.technical.dto.TechnicalAccountExportDTO;
import com.enovell.yunwei.technical.dto.TechnicalDto;
import com.enovell.yunwei.technical.service.TechnicalAccountService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;

/**
 * 项目名称：kunmingrinms 
 * 类名称：TechnicalAccountAction 
 * 类描述: 技术台账Action 
 * 创建人：yangsy
 * 创建时间：2016-11-25 
 */
@Controller
@RequestMapping(value = "/technicalAccountAction")
public class TechnicalAccountAction {

	@Resource(name = "TechnicalAccountService")
	private TechnicalAccountService technicalAccountService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * addAccountData 添加技术台账
	 * 
	 * @param request
	 * @param name
	 *            技术台账名
	 * @param type
	 *            台账类别
	 * @param address
	 *            施工地点
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return 0,成功、其他失败
	 */
	@RequestMapping(value = "/addAccountData", method = RequestMethod.POST)
	@ResponseBody
	public String addAccountData(HttpServletRequest request,
			@RequestParam("name") String name,
			@RequestParam("type") String type,
			@RequestParam("address") String address,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		TechnicalAccountInfo technicalAcountInfo = new TechnicalAccountInfo();
		technicalAcountInfo.setName(name);// 技术台账名
		technicalAcountInfo.setDepart(user.getOrganization());// 所属部门
		technicalAcountInfo.setType(Integer.valueOf(type));// 台账类别
		technicalAcountInfo.setAddress(address);// 施工地点
		technicalAcountInfo.setRemark(remark);// 备注
		technicalAcountInfo.setCreateUser(user);// 用户名
		technicalAcountInfo.setCreateDate(new Date());// 创建时间
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		// 新增技术台账信息
		technicalAccountService.addAccountData(technicalAcountInfo,dtos);
		return "0";
	}

	/**
	 * updateAccountData 修改技术台账
	 * 
	 * @param request
	 * @param id
	 *            技术台账id
	 * @param name
	 *            技术台账名称
	 * @param type
	 *            台账类别
	 * @param address
	 *            施工地点
	 * @param remark
	 *            备注
	 * @param uploadFileArr
	 *            上传文件
	 * @return 0,成功、其他失败
	 */
	@RequestMapping(value = "/updateAccountData", method = RequestMethod.POST)
	@ResponseBody
	public String updateAccountData(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("type") String type,
			@RequestParam("address") String address,
			@RequestParam("remark") String remark,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		// 获取技术台账信息(显示在页面上的数据)
		TechnicalAccountInfo technicalAcountInfo = technicalAccountService
				.getTechnicalAccountById(id);
		// 取出附件
		String attachFileId = null;
		if (technicalAcountInfo.getAttachFile() != null) {
			attachFileId = technicalAcountInfo.getAttachFile().getId();
		}
		technicalAcountInfo.getAttachFile();
		technicalAcountInfo.setName(name);// 技术台账名
		technicalAcountInfo.setType(Integer.valueOf(type));// 台账类别
		technicalAcountInfo.setAddress(address);// 施工地点
		technicalAcountInfo.setRemark(remark);// 备注
		technicalAcountInfo.setUpdateUser(user);// 用户名
		technicalAcountInfo.setUpdateDate(new Date());// 修改时间
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
				UploadFileDto[].class);
		// 修改技术台账
		technicalAccountService.updateAccountData(technicalAcountInfo,dtos);
		// 删除附件
		if (attachFileId != null) {
			attachFileService.deleteAttachFile(attachFileId);
		}
		return "0";
	}

	/**
	 * getTechnicalAccountById 根据id获取技术台账
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getTechnicalAccountById", method = RequestMethod.POST)
	@ResponseBody
	public String getTechnicalAccountById(@RequestParam("id") String id) {
		TechnicalAccountInfo info = technicalAccountService.getTechnicalAccountById(id);
		return JsonUtil.javaToJsonAsString(info);
	}

	/**
	 * delTechnicalAccountData 批量删除技术台账
	 * @param ids
	 * @return 0,成功、其他失败
	 */
	@RequestMapping(value = "/delTechnicalAccountData", method = RequestMethod.POST)
	@ResponseBody
	public String delTechnicalAccountData(@RequestParam("jsonIds") String jsonIds) {
		technicalAccountService.delTechnicalAccountData(jsonIds);
		return "0";
	}
	
	/**
	 * getAccountData 查询技术台账
	 * 
	 * @param depart
	 *            所属部门
	 * @param name
	 *            台账名称
	 * @param type
	 *            台账类别
	 * @param createStartDate
	 *            创建开始时间
	 * @param createEndDate
	 *            创建结束时间
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value = "/getAccountData", method = RequestMethod.POST)
	@ResponseBody
	public String getAccountData(
			@RequestParam(value = "depart", required = false) String depart,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		TechnicalAccountDTO technicalAccountDTO = new TechnicalAccountDTO();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(depart)) {
			Organization organization = new Organization();
			organization.setId(depart);
			technicalAccountDTO.setDepart(organization);
		}
		if (StringUtils.isNotEmpty(name)) {
			String newName = name.replaceAll(" ", "");
			technicalAccountDTO.setName(newName);
		}
		if (StringUtils.isNotEmpty(type)) {
			technicalAccountDTO.setType(Integer
					.valueOf(type));
		}
		if (StringUtils.isNotEmpty(startDate)) {
			technicalAccountDTO.setStartDate(StringDateToDateUtil
					.getDate(startDate));
		}
		if (StringUtils.isNotEmpty(endDate)) {
			technicalAccountDTO.setEndDate(StringDateToDateUtil
					.getDate(endDate));
		}
		List<TechnicalDto> dto = technicalAccountService.getAccountData(
				technicalAccountDTO, start, limit);
		long results = technicalAccountService
				.getCount(technicalAccountDTO);
		GridDto<TechnicalDto> gridDto = new GridDto<TechnicalDto>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}

	/**
	 * 获取技术台账记录数
	 * @param technicalInfoDTO
	 * @return
	 */
	public long getCount(TechnicalAccountDTO technicalAccountDTO) {

		return technicalAccountService.getCount(technicalAccountDTO);
		
	}

	/**
	 * exportXls 导出Excel
	 * @param name
	 * @param depart
	 * @param type
	 * @param createDate
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/exportXls", method = RequestMethod.POST)
	@ResponseBody
	public void exportXls(@RequestParam("exportXlsJson") String exportXlsJson,
			HttpServletRequest request,
			HttpServletResponse response) {
		List<TechnicalAccountExportDTO> dataList = new ArrayList<TechnicalAccountExportDTO>();
		TechnicalAccountExportDTO[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson, TechnicalAccountExportDTO[].class);
		Collections.addAll(dataList, dtos);
		String[] headerTableColumns = new String[]{ 
				"台账名称" + "_" +"60" + "_" + "my.getName()",
				"所属部门" + "_" +"30" + "_" + "my.getDepart()",
				"台账类别" + "_" +"30" + "_" + "my.getType()",
				"创建时间" + "_" +"25" + "_" + "my.getCreateDate()"
		}; 
		CommonPoiExportExcel<TechnicalAccountExportDTO> export = new CommonPoiExportExcel<TechnicalAccountExportDTO>();
		export.exportXls("技术台账", headerTableColumns, new HashMap(), dataList, request, response);
	}
}
