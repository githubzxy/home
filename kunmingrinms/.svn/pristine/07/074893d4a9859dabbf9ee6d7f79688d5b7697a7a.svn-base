
/**   
 * 文件名：TaskRootTreeService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-20 下午6:13:28   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.service;

import java.util.List;

import com.enovell.yunwei.taskManage.domain.TaskRoot;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootTreeService   
 * 类描述:  子调令树形列表数据 接口
 * 创建人：ltf 
 * 创建时间：2016-12-20 下午6:13:28
 * 修改人：ltf
 * 修改时间：2016-12-20 下午6:13:28   
 *    
 */
public interface TaskRootTreeService {

	/**    
	 * getTaskRootTreeList 子任务命令树结构
	 * @param panrent
	 * @return
	 */
	public List<TaskRoot> getTaskRootTreeList(TaskRoot panrent);
	
	/**    
	 * quyy
	 * getTaskRootTreeList 子任务命令树结构，用于回复附件打包
	 * @param panrent
	 * @return
	 */
	public List<TaskRoot> getTaskRootTreeListForZip(TaskRoot panrent);
	
	/**
	 * 
	 * addColorByStatus 根据不同的状态设置不同的颜色
	 *
	 * @param taskRoot 任务
	 */
	public void addColorByStatus(TaskRoot taskRoot);
	
}
