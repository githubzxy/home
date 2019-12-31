package com.enovell.yunwei.attach.service.impl;

import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.domain.UploadFile;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.attach.service.ZipFileService;
import com.enovell.yunwei.attach.tozip.FileUtil;
import com.enovell.yunwei.attach.tozip.ZipFileDTO;
import com.enovell.yunwei.attach.tozip.ZipToFile;
import com.enovell.yunwei.attach.web.AttachFileAction;
import com.enovell.yunwei.common.ExportTools;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：ZipFileServiceImpl   
 * 类描述:  压缩文件实体类
 * 创建人：yangsy
 * 创建时间：2016-12-27
 *
 */
@Service("zipFileService")
@Transactional
public class ZipFileServiceImpl implements ZipFileService{

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * 服务器文件路径
	 */
	public static String zipPath = ExportTools.getInstance().getPath() + "files";

	public static String filePath = AttachFileAction.filePath;

	@Override
	public String filesToZip(List<ZipFileDTO> zfDTOs) {
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
