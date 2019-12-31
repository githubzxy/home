package com.enovell.yunwei.dispathRoot.web;

import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.domain.UploadFile;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.attach.tozip.FileUtil;
import com.enovell.yunwei.attach.tozip.ZipFileManager;
import com.enovell.yunwei.attach.tozip.ZipToFile;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.dispathRoot.service.DispathRootTreeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispatchZipFileAction   
 * 类描述:  调令回复附件打包下载
 * 创建人：lidt 
 * 创建时间：2016-12-16 上午10:34:52
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:34:52   
 *
 */
@Controller
@RequestMapping(value = "/dispatchZipFileAction")
public class DispatchZipFileAction extends ZipFileManager {
	
	@Resource(name = "DispathRootTreeService")
	private DispathRootTreeService dispathRootTreeService;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	private boolean canZip = false;

	@RequestMapping(value = "/dispatchFilesToZip", method = RequestMethod.POST)
	@ResponseBody
	public String dispatchFilesToZip(HttpServletRequest request,
			@RequestParam("parentId") String parentId) {

		String targetZip = zipPath + "/zipfile.zip";

		// 目标文件夹
		String targetUrl = filePath + "/zipload";

		File folder = new File(targetUrl);
		deleteFile(folder);

		// 创建压缩文件
		File file = new File(targetZip);
		file.delete(); // 删除原来的压缩文件
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}

		DispathRoot parent = new DispathRoot();
		parent.setId(parentId);
		List<DispathRoot> childList = dispathRootTreeService
				.getDispathRootTreeList(parent);

		try {
			for (DispathRoot wot : childList) {
				dealWithFile(targetUrl, wot);
			}

			if (canZip) {
				ZipToFile.zipFile(filePath + "/zipload", targetZip);
			} else {
				targetZip = "0";
			}
			FileUtil.del(filePath + "/zipload");
		} catch (Exception e) {
			System.out.println("" + e.getMessage());
			return "0";
		}
		return targetZip;
	}

	/**
	 * 
	 * deleteFile 删除已存在的文件夹及下面的文件
	 * 
	 * @param folder
	 */
	private void deleteFile(File folder) {
		if (folder.exists()) {// 判断文件是否存在
			if (folder.isFile()) {// 判断是否是文件
				folder.delete();// 删除文件
			} else if (folder.isDirectory()) {// 否则如果它是一个目录
				File[] files = folder.listFiles();// 声明目录下所有的文件 files[];
				for (int i = 0; i < files.length; i++) {// 遍历目录下所有的文件
					deleteFile(files[i]);// 把每个文件用这个方法进行迭代
				}
				folder.delete();// 删除文件夹
			}
		} else {
			System.out.println("所删除的文件不存在");
		}

	}

	/**
	 * 查询子附件，并将附件放到指定文件夹中
	 * 
	 * @param targetUrl
	 *            目标文件夹
	 * @param orderTransactor
	 * @throws IOException
	 */
	private void querySubFile(String targetUrl, DispathRoot dispath) {

		Set<DispathRoot> children = dispath.getChildren();
		if (children == null || children.isEmpty()) {
			return;
		}
		for (DispathRoot cmd : children) {
			dealWithFile(targetUrl, cmd);
		}
	}

	/**
	 * 处理附件
	 * 
	 * @param targetUrl
	 * @param wot
	 * @throws IOException
	 */
	private void dealWithFile(String targetUrl, DispathRoot dispath) {

		// 目标文件夹
		targetUrl += "/" + dispath.getUser().getOrganization().getName();
		// 创建目标文件夹
		File target = new File(targetUrl);
		target.mkdirs();

		try {
			querySubFile(targetUrl, dispath);
			AttachFile af = dispath.getReplyAttachFile();
			if (af == null) {
				return;
			}
			List<UploadFile> list = attachFileService.getFiles(af.getId());
			if (list == null || list.isEmpty()) {

				return;
			}
			for (UploadFile uf : list) {
				File targetFile = new File(targetUrl + "/" + uf.getName());
				File sourceFile = new File(uf.getPath());
				FileUtil.copyFile(sourceFile, targetFile);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		canZip = true;
	}
}
