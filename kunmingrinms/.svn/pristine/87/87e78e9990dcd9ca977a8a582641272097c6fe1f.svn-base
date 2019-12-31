package com.enovell.yunwei.accident.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.accident.domain.Accident;
import com.enovell.yunwei.accident.domain.AccidentShop;
import com.enovell.yunwei.accident.dto.AccidentDTO;
import com.enovell.yunwei.accident.service.AccidentService;
import com.enovell.yunwei.accident.service.AccidentShopService;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.attach.service.ZipFileService;
import com.enovell.yunwei.attach.tozip.ZipFileDTO;
import com.enovell.yunwei.attach.web.AttachFileAction;
import com.enovell.yunwei.common.ExportTools;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.util.JsonUtil;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：AccidentAction   
 * 类描述:  应急演练Action
 * 创建人：yangsy
 * 创建时间：2016-12-15
 *   modifyBy：yl 2017-10-16/4 轻量化改造
 */
@Controller
@RequestMapping(value = "/accidentAction")
public class AccidentAction {
	
	@Resource(name = "accidentService")
	private AccidentService accidentService;
	@Resource(name = "accidentShopService")
	private AccidentShopService accidentShopService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	@Resource(name = "zipFileService")
	private ZipFileService zipFileService;
	
	public static String zipPath = ExportTools.getInstance().getPath() + "files";

	public static String filePath = AttachFileAction.filePath;
	
	/**
	 * getAllAccidentData
	 */
	@RequestMapping(value = "/getAllAccidentData", method = RequestMethod.POST)
	@ResponseBody
	public String getAllAccidentData (@RequestParam(value = "projectName", required = false) String projectName,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		AccidentDTO accidentDTO = new AccidentDTO();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(projectName)) {
			accidentDTO.setName(projectName);
		}
		
		List<AccidentDTO> dto = accidentService.getAllAccidentData(accidentDTO, start, limit);
		long results = accidentService.getAccidentCount(accidentDTO);
		
		GridDto<AccidentDTO> gridDto = new GridDto<AccidentDTO>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * addAccident 新增计划
	 * @param projectName
	 * @param uploadFileArr
	 */
	@RequestMapping(value = "/addAccident", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addAccident(HttpServletRequest request,
			@RequestParam("projectName") String projectName,
			@RequestParam("orgIds") String orgIds,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		
		// 读取session中的用户
		Accident accident = new Accident();
		accident.setName(projectName);// 演练计划名称
		User user = (User) request.getSession().getAttribute("user");
		accident.setUser(user);// 用户名
		accident.setTime(new Date());// 创建时间
		try {
			// 获取多个上传文件的dto
			UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
					UploadFileDto[].class);
			accidentService.addAccident(accident,orgIds,dtos);
		}catch(Exception ex) {
			return ResultMsg.getFailure("添加失败", null);
		}
		return ResultMsg.getSuccess("添加成功", null);
	}
	/**
	 * getAccidentById 根据id获取该id对应的计划数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getAccidentById", method = RequestMethod.POST)
	@ResponseBody
	public String getAccidentById (@RequestParam("id") String id) {
		Accident accident = accidentService.getAccidentById(id);
		return JsonUtil.javaToJsonAsString(accident);
	}
	/**
	 * updateAccidentData 修改演练计划
	 * @param request
	 * @param id
	 * @param name
	 * @param uploadFileArr
	 */
	@RequestMapping(value = "/updateAccidentData", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateAccidentData(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		// 获取信息
		Accident accident = accidentService.getAccidentById(id);
		// 取出附件
		String attachFileId = null;
		if (accident.getAttachFile() != null) {
			attachFileId = accident.getAttachFile().getId();
		}
		try {
			accident.getAttachFile();
			accident.setName(name);// 演练计划名称
			// 获取多个上传文件的dto
			UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
					UploadFileDto[].class);
			// 修改计划
			accidentService.updateAccident(accident,dtos,user);
			// 删除附件
			if (attachFileId != null) {
				attachFileService.deleteAttachFile(attachFileId);
			}
		}catch(Exception ex) {
			return ResultMsg.getFailure("修改失败", null);
		}
		return ResultMsg.getSuccess("修改成功", null);
	}
	/**
	 * 删除计划
	 * @param ids
	 */
	@RequestMapping(value = "/deleteAccidents", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteAccidents(@RequestParam("jsonIds") String jsonIds) {
		try {
			accidentService.deleteAccidents(jsonIds);
		}catch(Exception ex) {
			return ResultMsg.getFailure("删除失败", null); 
		}
		return ResultMsg.getSuccess("删除成功", null);
	}
	
	/**
	 * ------------------------------------------------------------------------------------------
	 */
	
	/**
	 * getAllAccidentShopDataById 通过计划id查询该id下的所有汇报信息
	 */
	@RequestMapping(value = "/getAllAccidentShopDataById", method = RequestMethod.POST)
	@ResponseBody
	public String getAllAccidentShopDataById (@RequestParam(value = "id", required = false) String id,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		
		List<AccidentShop> dto = accidentService.getAllAccidentShopDataById(id, start, limit);
		long results = accidentService.getAccidentShopCountById(id);
		
		GridDto<AccidentShop> gridDto = new GridDto<AccidentShop>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * getAccidentShopById 根据id获取该id对应的汇报数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getAccidentShopById", method = RequestMethod.POST)
	@ResponseBody
	public String getAccidentShopById (@RequestParam("id") String id) {
		AccidentShop accidentShop = accidentService.getAccidentShopById(id);
		return JsonUtil.javaToJsonAsString(accidentShop);
	}
	
	/**
	 * ------------------------------------------------------------------------------------------
	 */
	
	/**
	 * getAllAccidentDataByUser
	 */
	@RequestMapping(value = "/getAllAccidentDataByUser", method = RequestMethod.POST)
	@ResponseBody
	public String getAllAccidentDataByUser (HttpServletRequest request,
			@RequestParam(value = "projectName", required = false) String projectName,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		
		Accident accident= new Accident();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(projectName)) {
			accident.setName(projectName);
		}
		
		List<AccidentDTO> dto = accidentShopService.getAllAccidentDataByUser(accident, user , start, limit);
		long results = accidentShopService.getAccidentCountByUser(accident,user);
		GridDto<AccidentDTO> gridDto = new GridDto<AccidentDTO>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * getAccidentShopByAccidentId 根据id获取该id对应的汇报数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getAccidentShopByAccidentId", method = RequestMethod.POST)
	@ResponseBody
	public String getAccidentShopByAccidentId (HttpServletRequest request,
			@RequestParam("id") String id) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		Accident accident = new Accident();
		accident.setId(id);
		//使用user限定是谁进行的汇报
		accident.setUser(user);
		AccidentShop accidentShop = accidentShopService.getAccidentShopByAccidentId(accident);
		return JsonUtil.javaToJsonAsString(accidentShop);
	}
	/**
	 * updateAccidentShopData 更新汇报
	 * @param request
	 * @param id
	 * @param name
	 * @param uploadFileArr
	 */
	@RequestMapping(value = "/updateAccidentShopData", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateAccidentShopData(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("content") String content,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		Accident accident = new Accident();
		accident.setId(id);
		//使用user限定是谁进行的汇报
		accident.setUser(user);
		AccidentShop accidentShop = accidentShopService.getAccidentShopByAccidentId(accident);
		// 取出附件
		String attachFileId = null;
		if (accidentShop.getAttachFile() != null) {
			attachFileId = accidentShop.getAttachFile().getId();
		}
		accidentShop.getAttachFile();
		accidentShop.setContent(content);//更新内容
		accidentShop.setReplyTime(new Date());//设置更新时间（回复时间）
		try {
				// 获取多个上传文件的dto
				UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
						UploadFileDto[].class);
				// 更新汇报
				accidentShopService.updateAccidentShop(accidentShop,dtos,user);
				// 删除附件
				if (attachFileId != null) {
					attachFileService.deleteAttachFile(attachFileId);
				}
		}catch(Exception ex) {
			return ResultMsg.getFailure("汇报失败", null);
		}
		return ResultMsg.getSuccess("汇报成功", null);
	}
	
	/**
	 * getZipFile 获取需要打包的文件
	 */
	@RequestMapping(value = "/getZipFile", method = RequestMethod.POST)
	@ResponseBody
	public String getZipFile (@RequestParam(value = "accidentShopStr", required = false) String accidentShopStr) {
		
		AccidentShop[] as = JsonUtil.jsonToJavaObj(accidentShopStr, AccidentShop[].class);
		List<ZipFileDTO> zfDTOs = new ArrayList<ZipFileDTO>();
		for(int i = 0 ; i<as.length ; i++){
			AccidentShop accidentShop = accidentService.getAccidentShopById(as[i].getId());
			if(accidentShop.getAttachFile()!=null){
				ZipFileDTO zDTO = new ZipFileDTO();
				zDTO.setName(accidentShop.getOrg().getName());
				zDTO.setAf(accidentShop.getAttachFile());
				zfDTOs.add(zDTO);
			}
		}
		String str=zipFileService.filesToZip(zfDTOs);
		System.out.println("打包下载路径"+str);
		
		return JsonUtil.javaToJsonAsString(str);
		
	}
	
}
