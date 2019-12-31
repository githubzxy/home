package com.enovell.yunwei.circuitWO.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.circuitWO.domain.CircuitWO;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：CircuitWOBusinessService   
 * 类描述:  任务管理 业务接口
 * 创建人：ltf 
 * 创建时间：2016-12-15 下午12:24:09
 * 修改人：ltf
 * 修改时间：2016-12-15 下午12:24:09   
 * 修改人：lilt
 * 修改时间：2018-11-01 7:34 PM    
 */
public interface CircuitWOBusinessService {
	/**    
	 * autoFile 自动归档（子任务全部回复完成）
	 * @param root
	 * @param fileRemarks//归档备注（回复完成归档、删除退回任务归档）
	 */
	void autoFile(CircuitWO root, String fileRemarks);
	/**    
	 * addAndSendCircuitWO 新增并派发任务
	 * @param taskRoot 任务详情对象
	 * @param dtos 附件文件对象集合
	 * @return CircuitWO
	 */
	CircuitWO addAndSendCircuitWO(CircuitWO taskRoot, UploadFileDto[] dtos);
	/**    
	 * add 新增带附件的任务
	 * @param taskRoot 任务信息对象
	 * @param dtos 任务附带的文件对象集合
	 * @return CircuitWO
	 */
	CircuitWO add(CircuitWO taskRoot, UploadFileDto[] dtos);
	/**    
	 * updateAndSendCircuitWO 修改并派发任务
	 * @param paramTask 修改的任务对象
	 * @param dtos 任务附带的文件对象集合
	 * @param user 操作用户信息
	 * @return CircuitWO
	 * @throws Exception
	 */
	CircuitWO updateAndSendCircuitWO(CircuitWO paramTask, UploadFileDto[] dtos, User user)  throws Exception;
	/**    
	 * updateAndSave 修改并保存任务
	 * @param paramTask 修改的任务对象
	 * @param dtos 任务附带的文件对象集合
	 * @param user 操作用户信息
	 * @throws Exception 
	 */
	void updateAndSave(CircuitWO paramTask, UploadFileDto[] dtos, User user) throws Exception;
	/**    
	 * sendToCheck 发送审核
	 * @param id 任务id
	 * @param receiveUserId 审核人Id
	 * @return
	 */
	CircuitWO sendToCheck(String id, String receiveUserId);
	/**    
	 * sendTaskRoot 派发任务
	 * @param id 任务Id
	 * @return CircuitWO
	 */
	CircuitWO sendCircuitWO(String id);
	/**
	 * updateSelectUsers 变更执行人
	 * @param taskId 任务id
	 * @param receiveUserIds 任务接收人
	 * @param user 当前登陆人
	 * @return 1-无变化,null-操作成功
	 */
	String updateSelectUsers(String taskId, List<String> receiveUserIds, User user);
	/**    
	 * resend 任务重派（已退回任务再派），重派只能派发给一个人
	 * @param id 任务id
	 * @param receiveUserId 接收用户Id
	 */
	void resend(String id, String receiveUserId);
	/**    
	 * delBackCircuitWO 退回任务删除
	 * @param id 任务id
	 * @param user 登录用户
	 * @return CircuitWO
	 */
	CircuitWO delBackCircuitWO(String id, User user);
	/**    
	 * checkCircuitWO 任务审核
	 * @param paramTask 审核数据
	 * @param dtos 审核成功上传的附件信息
	 * @return CircuitWO
	 */
	CircuitWO checkCircuitWO(CircuitWO taskRoot, UploadFileDto[] dtos);

}
