package com.enovell.yunwei.communicate.web;

import java.io.File;
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
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.domain.UploadFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.attach.tozip.FileUtil;
import com.enovell.yunwei.attach.tozip.ZipFileDTO;
import com.enovell.yunwei.attach.tozip.ZipToFile;
import com.enovell.yunwei.attach.web.AttachFileAction;
import com.enovell.yunwei.common.ExportTools;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.communicate.domain.Communicate;
import com.enovell.yunwei.communicate.domain.CommunicateShop;
import com.enovell.yunwei.communicate.dto.CommunicateDTO;
import com.enovell.yunwei.communicate.service.CommunicateService;
import com.enovell.yunwei.communicate.service.CommunicateShopService;
import com.enovell.yunwei.util.JsonUtil;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：CommunicateAction   
 * 类描述:  应急演练Action
 * 创建人：yangsy
 * 创建时间：2016-12-21
 *
 */
@Controller
@RequestMapping(value = "/communicateAction")
public class CommunicateAction {
	
	@Resource(name = "communicateService")
	private CommunicateService communicateService;
	@Resource(name = "communicateShopService")
	private CommunicateShopService communicateShopService;
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	public static String zipPath = ExportTools.getInstance().getPath() + "files";

	public static String filePath = AttachFileAction.filePath;
	
	/**
	 * getAllCommunicateData 获取显示到通信计划页面的数据
	 */
	@RequestMapping(value = "/getAllCommunicateData", method = RequestMethod.POST)
	@ResponseBody
	public String getAllCommunicateData (@RequestParam(value = "projectName", required = false) String projectName,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		CommunicateDTO communicateDTO = new CommunicateDTO();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(projectName)) {
			communicateDTO.setName(projectName);
		}
		
		List<CommunicateDTO> dto = communicateService.getAllCommunicateData(communicateDTO, start, limit);
		long results = communicateService.getCommunicateCount(communicateDTO);
		
		GridDto<CommunicateDTO> gridDto = new GridDto<CommunicateDTO>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * addCommunicate 新增计划
	 * @param projectName
	 * @param uploadFileArr
	 */
	@RequestMapping(value = "/addCommunicate", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg addCommunicate(HttpServletRequest request,
			@RequestParam("projectName") String projectName,
			@RequestParam("orgIds") String orgIds,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		
		Communicate communicate = new Communicate();
		communicate.setName(projectName);// 演练计划名称
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		communicate.setUser(user);// 用户名
		communicate.setTime(new Date());// 创建时间
		// 获取多个上传文件的dto
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,UploadFileDto[].class);
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			communicate.setAttachFile(attachFile);
		}
		try {
				communicateService.addCommunicate(communicate,orgIds);
		}catch(Exception ex) {
			return ResultMsg.getFailure("新增失败", null);
		}
			return ResultMsg.getSuccess("新增成功", null); 
	}
	/**
	 * getCommunicateById 根据id获取该id对应的通信演练计划数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getCommunicateById", method = RequestMethod.POST)
	@ResponseBody
	public String getCommunicateById (@RequestParam("id") String id) {
		Communicate communicate = communicateService.getCommunicateById(id);
		return JsonUtil.javaToJsonAsString(communicate);
	}
	/**
	 * updateCommunicateData 修改演练计划
	 * @param request
	 * @param id
	 * @param name
	 * @param uploadFileArr
	 */
	@RequestMapping(value = "/updateCommunicateData", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateCommunicateData(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		// 获取信息
		Communicate communicate = communicateService.getCommunicateById(id);
		// 取出附件
		String attachFileId = null;
		if (communicate.getAttachFile() != null) {
			attachFileId = communicate.getAttachFile().getId();
		}
		communicate.getAttachFile();
		communicate.setName(name);// 演练计划名称
		ResultMsg rm=null;
		try {
				// 获取多个上传文件的dto
				UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
						UploadFileDto[].class);
				if (dtos.length != 0) {
					// 保存附件和上传文件
					AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
					communicate.setAttachFile(attachFile);
				}else{
					//上传文件为空
					communicate.setAttachFile(null);
				}
				// 修改计划
				communicateService.updateCommunicate(communicate);
				// 删除附件
				if (attachFileId != null) {
					attachFileService.deleteAttachFile(attachFileId);
				}
				rm= ResultMsg.getSuccess("修改成功", null);
		}catch(Exception ex) {
			rm= ResultMsg.getFailure("修改失败", null);
		}
		return rm;
	}
	/**
	 * deleteCommunicates 删除计划
	 * @param ids
	 */
	@RequestMapping(value = "/deleteCommunicates", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg deleteCommunicates(@RequestParam("jsonIds") String jsonIds) {
		try {
			communicateService.deleteCommunicates(jsonIds);
		}catch(Exception ex) {
			return ResultMsg.getFailure("删除失败", null);
		}
		return ResultMsg.getSuccess("删除成功", null);
	}
	
	/**
	 * ------------------------------------------------------------------------------------------
	 */
	
	/**
	 * getAllCommunicateShopDataById 通过计划id查询该id下的所有需要汇报的下发部门的信息（显示到通信演练计划详细信息的表格里）
	 */
	@RequestMapping(value = "/getAllCommunicateShopDataById", method = RequestMethod.POST)
	@ResponseBody
	public String getAllCommunicateShopDataById (@RequestParam(value = "id", required = false) String id,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		
		List<CommunicateShop> dto = communicateService.getAllCommunicateShopDataById(id, start, limit);
		long results = communicateService.getCommunicateShopCountById(id);
		
		GridDto<CommunicateShop> gridDto = new GridDto<CommunicateShop>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * getCommunicateShopById 根据id获取该id对应的汇报数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getCommunicateShopById", method = RequestMethod.POST)
	@ResponseBody
	public String getCommunicateShopById (@RequestParam("id") String id) {
		CommunicateShop communicateShop = communicateService.getCommunicateShopById(id);
		return JsonUtil.javaToJsonAsString(communicateShop);
	}
	
	/**
	 * ------------------------------------------------------------------------------------------
	 */
	
	/**
	 * getAllCommunicateDataByUser
	 */
	@RequestMapping(value = "/getAllCommunicateDataByUser", method = RequestMethod.POST)
	@ResponseBody
	public String getAllCommunicateDataByUser (HttpServletRequest request,
			@RequestParam(value = "projectName", required = false) String projectName,
			@RequestParam("start") int start, @RequestParam("limit") int limit) {
		
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		
		Communicate communicate= new Communicate();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(projectName)) {
			communicate.setName(projectName);
		}
		
		List<CommunicateDTO> dto = communicateShopService.getAllCommunicateDataByUser(communicate, user , start, limit);
		long results = communicateShopService.getCommunicateCountByUser(communicate,user);
		
		GridDto<CommunicateDTO> gridDto = new GridDto<CommunicateDTO>();
		gridDto.setRows(dto);
		gridDto.setResults(results);
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * getCommunicateShopByCommunicateId 根据id获取该id对应的汇报数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getCommunicateShopByCommunicateId", method = RequestMethod.POST)
	@ResponseBody
	public String getCommunicateShopByCommunicateId (HttpServletRequest request,
			@RequestParam("id") String id) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		Communicate communicate = new Communicate();
		communicate.setId(id);
		//使用user限定是谁进行的汇报
		communicate.setUser(user);
		CommunicateShop communicateShop = communicateShopService.getCommunicateShopByCommunicateId(communicate);
		return JsonUtil.javaToJsonAsString(communicateShop);
	}
	/**
	 * updateCommunicateShopData 更新汇报
	 * @param request
	 * @param id
	 * @param name
	 * @param uploadFileArr
	 */
	@RequestMapping(value = "/updateCommunicateShopData", method = RequestMethod.POST)
	@ResponseBody
	public ResultMsg updateCommunicateShopData(HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("content") String content,
			@RequestParam("uploadFileArr") String uploadFileArr) {
		// 读取session中的用户
		User user = (User) request.getSession().getAttribute("user");
		Communicate communicate = new Communicate();
		communicate.setId(id);
		//使用user限定是谁进行的汇报
		communicate.setUser(user);
		// 获取信息
		CommunicateShop communicateShop = communicateShopService.getCommunicateShopByCommunicateId(communicate);
		// 取出附件
		String attachFileId = null;
		if (communicateShop.getAttachFile() != null) {
			attachFileId = communicateShop.getAttachFile().getId();
		}
		communicateShop.getAttachFile();
		communicateShop.setContent(content);// 汇报内容
		communicateShop.setReplyTime(new Date());// 更新时间（汇报时间）
		try {
				// 获取多个上传文件的dto
				UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr,
						UploadFileDto[].class);
				if (dtos.length != 0) {
					// 保存附件和上传文件
					AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
					communicateShop.setAttachFile(attachFile);
				}else {
					//上传文件为空
					communicateShop.setAttachFile(null);
				}
				// 更新汇报
				communicateShopService.updateCommunicateShop(communicateShop);
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
	public String getZipFile (@RequestParam(value = "communicateShopStr", required = false) String communicateShopStr) {
		
		CommunicateShop[] cs = JsonUtil.jsonToJavaObj(communicateShopStr, CommunicateShop[].class);
		List<ZipFileDTO> zfDTOs = new ArrayList<ZipFileDTO>();
		for(int i = 0 ; i<cs.length ; i++){
			CommunicateShop communicateShop = communicateService.getCommunicateShopById(cs[i].getId());
			if(communicateShop.getAttachFile()!=null){
				ZipFileDTO zDTO = new ZipFileDTO();
				zDTO.setName(communicateShop.getOrg().getName());
				zDTO.setAf(communicateShop.getAttachFile());
				zfDTOs.add(zDTO);
			}
		}
		String targetZip = getPath(zfDTOs);
		return JsonUtil.javaToJsonAsString(targetZip);
	}

	private String getPath(List<ZipFileDTO> zfDTOs) {
		boolean canZip = false;
		String targetZip = zipPath + "/zipfile.zip";
		
		targetZip = targetZip.replace("%20", " ");
		
		// 创建压缩文件
		File file = new File(targetZip);
		file.delete(); // 删除原来的压缩文件
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}
		
		try {
			for (ZipFileDTO zfDTO : zfDTOs) {
				// 目标文件夹
				String targetUrl = filePath + "/zipload/" + zfDTO.getName();
				// 创建目标文件夹
				File target = new File(targetUrl);
				target.mkdirs();
				AttachFile af = zfDTO.getAf();
				if (af != null) {
					List<UploadFile> list = attachFileService.getFiles(af
							.getId());
					if (list != null && list.size() != 0) {
						for (UploadFile uf : list) {
							File targetFile = new File(targetUrl + "/"
									+ uf.getName());
							File sourceFile = new File(uf.getPath());
							FileUtil.copyFile(sourceFile, targetFile);
						}
						canZip = true;
					}
				}

			}
			if (canZip) {
				ZipToFile.zipFile(filePath + "/zipload", targetZip);
			} else {
				targetZip = "0";
			}
			FileUtil.del(filePath + "/zipload");
		} catch (Exception e) {
			System.out.println("" + e.getMessage());
		}
		return targetZip;
	}
	
}
