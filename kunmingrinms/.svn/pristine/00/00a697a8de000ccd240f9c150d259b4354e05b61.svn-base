
/**   
 * 文件名：TaskRootHistoryService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-20 上午10:59:42   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.taskManage.domain.TaskRoot;
import com.enovell.yunwei.taskManage.domain.TaskRootHistory;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootHistoryService   
 * 类描述:  历史任务 接口
 * 创建人：ltf 
 * 创建时间：2016-12-20 上午10:59:42
 * 修改人：ltf
 * 修改时间：2016-12-20 上午10:59:42   
 *    
 */
public interface TaskRootHistoryService {
	
	/**    
	 * addTaskHistory 新增历史任务
	 * @param beginStatus 开始状态
	 * @param endStatus 结束状态
	 * @param task 任务
	 * @param transactUser 操作人
	 * @param remarks 备注
	 * @return
	 */
	public TaskRootHistory addTaskHistory(
			String beginStatus,String endStatus, TaskRoot task, User transactUser,String remarks);
	
	/**    
	 * deleteTaskHistoryByTask 删除指定任务的所有流水
	 * @param task
	 */
	public void deleteTaskHistoryByTask(TaskRoot task);
	
	/**    
	 * getAllTaskHistoryByTask 获取指定任务的所有流水
	 * @param task
	 * @return
	 */
	public List<TaskRootHistory> getAllTaskHistoryByTask(TaskRoot task);
	
	
}
