package com.enovell.yunwei.attach.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.domain.UploadFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;

import java.util.List;

/**
 * 文件处理接口实现
 * 
 * 项目名称：kunmingrinms 类名称：AttachFileService.java 类描述: 创建人：潘忠瑞
 * 创建时间：2014-10-30 修改人：潘忠瑞 修改时间：2014-10-30
 * 
 */
public interface AttachFileService {

	/**
	 * 通过id获取附件
	 * 
	 * @param fileId
	 * @return
	 */
	public UploadFile getById(String fileId);

	/**
	 * 
	 * getFiles 根据附件id,查询文件
	 * @param attachFileId
	 * @return
	 */
	public List<UploadFile> getFiles(String attachFileId);

	/**
	 * 
	 * addAttachFile 保存附件
	 * @param dtos 上传文件
	 * @param user 上传用户
	 * @return
	 */
	public AttachFile addAttachFile(UploadFileDto[] dtos, User user);
	
	/**
	 * 
	 * updateAttachFile 修改附件
	 *
	 * @author lidt
	 * @date 2017-7-5 上午11:26:56 
	 * @param dtos 上传文件
	 * @param attachFileId 历史附件
	 * @return
	 */
	public AttachFile updateAttachFile(UploadFileDto[] dtos, String attachFileId);

	/**
	 * 
	 * deleteAttachFile 删除附件
	 * 
	 * @param attachFileId
	 *            附件id
	 */
	public void deleteAttachFile(String attachFileId);
	
	/**
	 * 
	 * deleteUpload 根据附件ID,删除文件
	 *
	 * @author lidt
	 * @date 2017-7-6 下午2:07:04 
	 * @param attachFileId 附件ID
	 * @return  1-成功，0-失败
	 */
	public int deleteUploadByAttachFileId(String attachFileId);

	/**通过多个附件id获取对应文件
	 * @param ids 逗号分割
	 * @return
	 */
	public List<UploadFile> getFilesByIds(String ids);
	
	/**
	 * 
	 * getAttachFileById 根据附件ID,获取附件
	 *
	 * @author lidt
	 * @date 2017-7-6 下午2:00:18 
	 * @param attachFileId 附件ID
	 * @return
	 */
	public AttachFile getAttachFileById(String attachFileId);
	
	/**
	 * 
	 * addUploadFile 新增上传文件
	 *
	 * @author lidt
	 * @date 2017-7-6 下午2:14:57 
	 * @param dtos 上传文件
	 * @param attachFile 附件
	 * @return 1-成功，0-失败
	 */
	public int addUploadFile(UploadFileDto[] dtos, AttachFile attachFile);
	
	/**
	 * 
	 * getUploadFileDtos 根据附件id,获取上传文件
	 *
	 * @author lidt
	 * @date 2018年3月28日 下午2:14:15 
	 * @param attachFileId
	 * @return
	 */
	public List<UploadFileDto> getUploadFileDtos(String attachFileId);

}
