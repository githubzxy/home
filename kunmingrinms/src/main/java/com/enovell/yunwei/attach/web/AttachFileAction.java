package com.enovell.yunwei.attach.web;

import com.enovell.yunwei.attach.domain.UploadFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.util.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * 附件处理 action
 * 
 * 项目名称：guangtieYearMonth 类名称：AttachFileAction.java 类描述: 创建人：潘忠瑞 创建时间：2014-10-30
 * 修改人：潘忠瑞 修改时间：2014-10-30
 * 
 */
@Controller
@RequestMapping(value = "/attachFile")
public class AttachFileAction {
	/**
	 * 服务器文件路径
	 */
	public static String filePath;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public UploadFileDto upload(HttpServletRequest request) throws Exception {
		// 获得上下文中CommonsMultipartResolver
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		request.setCharacterEncoding("utf-8");
		UploadFileDto dto = new UploadFileDto();
		// 因为request里面可以存很多类型的内容这里要放到request中保存的是否为Multipart类型
		if (multipartResolver.isMultipart(request)) {
			// 将HttpServletRequest强转为SpringMVC提供的MultipartHttpServletRequest类型
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> it = multiRequest.getFileNames(); // 获取所有上传文件的名字
			while (it.hasNext()) {
				MultipartFile file = multiRequest.getFile(it.next()); // 根据名字找到对应的文件,这里文件名和文件成键值对关系
				String uploadFileName = file.getOriginalFilename();
				String[] tempNames = uploadFileName.split("\\.");// 分割上传文件名和后缀名
				// 已上传时间的格式命名上传文件名
				String newName = String.valueOf((new Date()).getTime());

				if (tempNames.length != 0) {
					newName += "." + tempNames[tempNames.length - 1];
				}
				String pathAndName = filePath + "/" + newName; // 需要上传的目录

				dto.setName(uploadFileName);
				dto.setPath(pathAndName);

				File localFile = new File(pathAndName); // 要将文件写至这个路径下的文件
				try {
					file.transferTo(localFile); // 利用SpringMVC自带的读写文件方法
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return dto;
		
	}

	/**
	 * 文件下载
	 * 
	 * @param fileName
	 * @param request
	 * @param response
	 */
	@RequestMapping("/download")
	public void download(@RequestParam("fileId") String fileId,
			HttpServletRequest request, HttpServletResponse response) {
		UploadFile file = attachFileService.getById(fileId);
		String path = file.getPath();
		String fileName = file.getName();
		File fileLoad = new File(path);
		try {
			fileName = urlEncoder(request, fileName);

			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.setContentType("binary/octet-stream");

			response.setHeader("Content-disposition", "attachment; fileName = "
					+ fileName);
			FileInputStream in = new FileInputStream(fileLoad);
			OutputStream out = response.getOutputStream();
			byte[] buffer = new byte[2048];
			int n = -1;
			while ((n = in.read(buffer)) != -1) {
				out.write(buffer, 0, n);
			}
			out.close();
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/getFilesByAttachFileId", method = RequestMethod.POST)
	public @ResponseBody
	String getFilesByAttachFileId(@RequestParam("attachFileId") String attachFileId) {

		List<UploadFile> files = attachFileService.getFiles(attachFileId);
		return JsonUtil.javaToJsonAsString(files);
	}
	
	@RequestMapping(value = "/getFilesByAttachFileIds", method = RequestMethod.POST)
	public @ResponseBody
	String getFilesByAttachFileIds(@RequestParam("attachFileId") String attachFileId) {
		List<UploadFile> files = attachFileService.getFilesByIds(attachFileId);
		return JsonUtil.javaToJsonAsString(files);
	}

	/**
	 * 
	 * convert2Html 附件转换为html
	 * 
	 * @param fileId
	 * @param request
	 * @return
	 */
	public String convert2Html(@RequestParam("fileId") String fileId,
			HttpServletRequest request) {
		// UploadFile file = attachFileService.getById(fileId);
		// String path = file.getPath();
		// String fileName = file.getName();
		// fileName = urlEncoder(request, fileName);
		//
		// String officePath = filePath + "/" + name;
		// String pdfPath = filePath + "/" + name.substring(0,
		// name.indexOf(".")) + ".pdf";
		// String swfPath = getPath() + "kunmingrinms-debug/swf/" +
		// name.substring(0, name.indexOf(".")) + ".swf";
		//
		// ConvertTools.office2PDF(path, destPath);

		return null;
	}

	/**
	 * 
	 * urlEncoder 防止附件中文乱码
	 * 
	 * @param request
	 * @param fileName
	 * @return
	 */
	public static String urlEncoder(HttpServletRequest request, String fileName) {
		try {
			// 将字母全部转化为大写，判断是否存在RV字符串
			if (request.getHeader("User-Agent").toUpperCase().indexOf("RV") > 0) {
				// 处理IE 的头部信息
				fileName = URLEncoder.encode(fileName, "UTF-8");// 对字符串进行URL加码，中文字符变成%+16进制
			} else {
				// 处理其他的头部信息
				fileName = new String(fileName.substring(
						fileName.lastIndexOf("/") + 1).getBytes("UTF-8"),
						"ISO8859-1");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
}
