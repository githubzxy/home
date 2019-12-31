package com.enovell.yunwei.taskManage.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.domain.UploadFile;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.attach.tozip.FileUtil;
import com.enovell.yunwei.attach.tozip.ZipFileManager;
import com.enovell.yunwei.attach.tozip.ZipToFile;
import com.enovell.yunwei.taskManage.domain.TaskRoot;
import com.enovell.yunwei.taskManage.service.TaskRootTreeService;

/**
 * 
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootZipFileAction   
 * 类描述:  调令回复附件打包下载
 * 创建人：ltf
 * 创建时间：2016-12-16 上午10:34:52
 * 修改人：ltf
 * 修改时间：2016-12-16 上午10:34:52   
 *
 */
@Controller
@RequestMapping(value = "/taskRootZipFileAction")
public class TaskRootZipFileAction extends ZipFileManager {
	
	@Resource(name = "taskRootTreeService")
	private TaskRootTreeService taskRootTreeService;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	private boolean canZip = false;

	@RequestMapping(value = "/taskReplyFilesToZip", method = RequestMethod.POST)
	@ResponseBody
	public String taskReplyFilesToZip(HttpServletRequest request,
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

		TaskRoot parent = new TaskRoot();
		parent.setId(parentId);
		List<TaskRoot> childList = taskRootTreeService.getTaskRootTreeListForZip(parent);

		try {
			for (TaskRoot t : childList) {
				dealWithFile(targetUrl, t);
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
	 * @param t
	 * @throws IOException
	 */
	private void querySubFile(String targetUrl, TaskRoot t) {

		Set<TaskRoot> children = t.getChildren();
		if (children == null || children.isEmpty()) {
			return;
		}
		for (TaskRoot child : children) {
			dealWithFile(targetUrl, child);
		}
	}

	/**
	 * 处理附件
	 * 
	 * @param targetUrl
	 * @param t
	 * @throws IOException
	 */
	private void dealWithFile(String targetUrl, TaskRoot t) {

		// 目标文件夹
		targetUrl += "/" + t.getOwner().getOrganization().getName();
		// 创建目标文件夹
		File target = new File(targetUrl);
		target.mkdirs();

		try {
			querySubFile(targetUrl, t);
			AttachFile af = t.getResponseAttachFile();
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
