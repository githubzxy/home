package com.enovell.yunwei.attach.tozip;

import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.domain.UploadFile;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.attach.web.AttachFileAction;
import com.enovell.yunwei.common.ExportTools;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：ZipFileManager   
 * 类描述:  压缩文件
 * 创建人：lidt 
 * 创建时间：2016-12-16 下午2:09:58
 * 修改人：lidt 
 * 修改时间：2016-12-16 下午2:09:58   
 *
 */
public class ZipFileManager {

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	/**
	 * 服务器文件路径
	 */
	public static String zipPath = ExportTools.getInstance().getPath()
			+ "files";

	public static String filePath = AttachFileAction.filePath;

	public String filesToZip(List<ZipFileDTO> zfDTOs) {
		boolean canZip = false;
		String targetZip = zipPath + "/zipfile.zip";
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

	public String fileToZip(ZipFileDTO zfDTO) throws Exception {

		// 目标文件夹
		String targetUrl = filePath + "/" + zfDTO.getName();
		// 创建目标文件夹
		File target = new File(targetUrl);
		target.mkdirs();
		AttachFile af = zfDTO.getAf();
		for (UploadFile uf : af.getFiles()) {
			File targetFile = new File(targetUrl + "/" + uf.getName());
			File sourceFile = new File(uf.getPath());
			FileUtil.copyFile(sourceFile, targetFile);
		}

		String targetZip = zipPath + "/" + zfDTO.getZipName() + ".zip";

		ZipToFile.zipFile(filePath + "/zipload", targetZip);
		FileUtil.del(filePath + "/zipload");
		return targetUrl;
	}

}
