
/**   
 * 文件名：TaskRootService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-13 下午2:50:30   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.taskManage.domain.TaskRoot;
import com.enovell.yunwei.taskManage.dto.TaskSearchDto;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootService   
 * 类描述:  任务管理 非业务接口
 * 创建人：ltf 
 * 创建时间：2016-12-13 下午2:50:30
 * 修改人：ltf
 * 修改时间：2016-12-13 下午2:50:30   
 *    
 */
public interface TaskRootService {
	
	/**    
	 * addTaskRoot 新增任务
	 * @param taskRoot
	 * @return
	 */
	public TaskRoot addTaskRoot(TaskRoot taskRoot);
	
	/**    
	 * update 修改任务
	 * @param taskRoot
	 * @return
	 */
	public TaskRoot updateTaskRoot(TaskRoot taskRoot);
	
	/**    
	 * deleteTaskRootById 退回任务管理,根据id删除
	 * @param id
	 * @param user 登录用户
	 */
	public void deleteTaskRootById(String id, User user);
	
	/**    
	 * deleteTaskRootByIds 根据ids删除多个任务
	 * @param ids
	 */
	public void deleteTaskRootByIds(String ids);
	
	/**    
	 * getById 根据id查询任务完整信息
	 * @param id
	 * @return
	 */
	public TaskRoot getById(String id);
	
	/**    
	 * getByGridDto 根据dto查询任务-分页查询-封装数据
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<TaskRoot> getByGridDto(TaskSearchDto dto, int start, int limit);
	
	/**    
	 * getByDTO 根据dto查询任务-分页查询
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<TaskRoot> getByDto(TaskSearchDto dto,int start,int limit);
	
	/**    
	 * getCountByDto 根据dto查询任务的记录数
	 * @param dto
	 * @return
	 */
	public Long getCountByDto(TaskSearchDto dto);
	
	/**    
	 * getCheckByGridDto 根据Dto查询任务审核列表数据-封装数据
	 * @param dto 查询条件
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<TaskRoot> getCheckByGridDto(TaskSearchDto dto, int start, int limit);
	
	/**    
	 * getCheckByDTO 根据Dto查询任务审核列表数据
	 * @param dto 查询条件
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<TaskRoot> getCheckByDTO(TaskSearchDto dto,int start,int limit);
	
	/**    
	 * getCheckCountByDTO 根据Dto查询任务审核列表数据字段长度
	 * @param dto
	 * @return
	 */
	public Long getCheckCountByDTO(TaskSearchDto dto);

	/**
	 * 创建页面分页查询
	 * getAddListByGridDto 
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 * @author luoyan
	 */
	public GridDto<TaskRoot> getAddListByGridDto(TaskSearchDto dto, int start, int limit);
	
	
}
