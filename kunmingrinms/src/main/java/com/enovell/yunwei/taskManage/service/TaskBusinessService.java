/**   
 * 文件名：TaskBusinessService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-15 下午12:24:09   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.taskManage.domain.TaskRoot;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskBusinessService   
 * 类描述:  任务管理 业务接口
 * 创建人：ltf 
 * 创建时间：2016-12-15 下午12:24:09
 * 修改人：ltf
 * 修改时间：2016-12-15 下午12:24:09   
 *    
 */

public interface TaskBusinessService {

	/**    
	 * add 新增带附件的任务
	 * @param taskRoot
	 * @param dtos
	 * @return
	 */
	public TaskRoot add(TaskRoot taskRoot, UploadFileDto[] dtos);

	/**    
	 * addAndSendTaskRoot 新增并派发任务
	 * @param taskRoot
	 * @return
	 */
	public TaskRoot addAndSendTaskRoot(TaskRoot taskRoot, UploadFileDto[] dtos);

	/**    
	 * updateAndSendTaskRoot 修改并派发任务
	 * @param paramTask
	 * @param dtos
	 * @param user
	 * @return
	 * @throws Exception 
	 */
	public TaskRoot updateAndSendTaskRoot(TaskRoot paramTask,
			UploadFileDto[] dtos, User user) throws Exception;

	/**    
	 * updateAndSave 修改并保存任务
	 * @param paramTask
	 * @param dtos
	 * @param user
	 * @throws Exception 
	 */
	public void updateAndSave(TaskRoot paramTask, UploadFileDto[] dtos, User user)
			throws Exception;

	/**    
	 * sendToCheck 发送审核
	 * @param id 任务id
	 * @param receiveUserId 审核人Id
	 * @return
	 */
	public TaskRoot sendToCheck(String id, String receiveUserId);

	/**    
	 * sendTaskRoot 派发任务
	 * @param id
	 * @return
	 */
	public TaskRoot sendTaskRoot(String id);

	/**    
	 * resend 任务重派（已退回任务再派），重派只能派发给一个人
	 * @param id
	 * @param receiveUserId
	 */
	public void resend(String id, String receiveUserId);

	/**    
	 * checkTask 任务审核
	 * @param paramTask 审核数据
	 * @param dtos 审核成功上传的附件信息
	 * @return
	 */
	public TaskRoot checkTask(TaskRoot paramTask, UploadFileDto[] dtos);

	/**    
	 * delBackTask 退回任务删除
	 * @param id
	 * @param user 登录用户
	 * @return 
	 */
	public TaskRoot delBackTask(String id, User user);

	/**    
	 * autoFile 自动归档（子任务全部回复完成）
	 * @param root
	 * @param fileRemarks//归档备注（回复完成归档、删除退回任务归档）
	 */
	public void autoFile(TaskRoot root, String fileRemarks);

	/**
	 * 
	 * updateSelectUsers 变更执行人
	 * @param taskId 任务id
	 * @param receiveUserIds 任务接收人
	 * @param user 当前登陆人
	 * @return 1-无变化,null-操作成功
	 * 
	 * @author quyy
	 */
	public String updateSelectUsers(String taskId, List<String> receiveUserIds, User user);

}
