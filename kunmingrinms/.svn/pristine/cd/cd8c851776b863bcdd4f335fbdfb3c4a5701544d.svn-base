
/**   
 * 文件名：ToDoTaskRootService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-21 下午5:56:41   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.taskManage.domain.TaskRoot;
import com.enovell.yunwei.taskManage.dto.NameAndIdDTO;
import com.enovell.yunwei.taskManage.dto.TaskSearchDto;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：ToDoTaskRootService   
 * 类描述:  待办任务 接口
 * 创建人：ltf 
 * 创建时间：2016-12-21 下午5:56:41
 * 修改人：yangsy
 * 修改时间：2017-5-24 下午2:33:17
 */
public interface ToDoTaskRootService {

	/**    
	 * getToDoByDTO 条件获取待办任务--分页查询
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<TaskRoot> getToDoByDTO(TaskSearchDto dto,int start,int limit);
	
	
	/**    
	 * getToDoCountByDTO 条件获取待办任务字段长度
	 * @param dto
	 * @return
	 */
	public Long getToDoCountByDTO(TaskSearchDto dto);
	
	/**    
	 * getTaskShowDtoOfToDoGridDto 根据dto查询待办任务-封装数据
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<TaskRoot> getTaskShowDtoOfToDoGridDto(TaskSearchDto dto, int start, int limit);
	
	/**
	 * getTaskRecentOfToDoGridDto 获取回退的列表-数据封装
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<TaskRoot> getTaskRecentOfToDoGridDto(TaskSearchDto dto, int start, int limit);
	
	/**获取回退的总数
	 * @param dto
	 * @return
	 */
	public long getTaskRecentSize(TaskSearchDto dto);
	/**    
	 * receive 接收任务
	 * @param id
	 */
	public void receive(String id);
	
	/**    
	 * sendBack 退回任务
	 * @param id
	 * @param sendBackRemark
	 */
	public void sendBack(String id, String sendBackRemark);
	
	/**    
	 * assign 分派任务，
	 * 将当前子任务分派给其他的人，
	 *	包含修改功能，清除当前子任务的子任务，在根据传入的人生成新的子任务，
	 *	父任务设置待接收，子任务设置成待接收
	 * @param taskRoot
	 */
	public Boolean assign(TaskRoot taskRoot);
	
	/**    
	 * turnToSend 转派任务
	 * @param id
	 * @param user
	 */
	public void turnToSend(String id,User user);
	
	/**    
	 * turnToSendMultiUser 转派任务（能多选）
	 * @param id 待转派任务id
	 * @param receiveUserId 转派接收人集合
	 */
	public void turnToSendMultiUser(String id, String receiveUserId);
	
	/**    
	 * reply 回复任务
	 * 回复完成后，当前任务状态变为“已回复”，
	 * 相对父任务(parent)，若当前任务是同级最后一条（相对根未全部完成），则其父任务（非根）状态变为“已回复”，否则仍为“已分派”；
	 * 相对根任务(root)，若当前任务是同级最后一条，则当前任务、父任务为“已回复”、根任务为“待归档”
	 * @param taskRoot
	 * @param dtos
	 * @return
	 */
	public TaskRoot reply(TaskRoot taskRoot,UploadFileDto[] dtos);
	
	/**
	 * 
	 * getSelectUsersByOrgId 根据组织机构id查询用户（用于多选显示）
	 * @param id 待转派任务的id
	 * @param orgId 组织机构id
	 * @return
	 */
	public List<NameAndIdDTO> getSelectUsersByOrgId(String id , String orgId);
	
	/**
	 * getToDoByWorkShopDirectorGridDto 获取待办任务(车间主任)数据-数据封装
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<TaskRoot> getToDoByWorkShopDirectorGridDto(TaskSearchDto dto,int start,int limit);
	
	/**
	 * getToDoByWorkShopDirector 获取待办任务(车间主任)数据
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<TaskRoot> getToDoByWorkShopDirector(TaskSearchDto dto,int start,int limit);

	/**
	 * getToDoCountByByWorkShopDirector 获取待办任务(车间主任)数据长度
	 * @param dto
	 * @return
	 */
	public long getToDoCountByByWorkShopDirector(TaskSearchDto dto);
	
	/**
	 * 
	 * checkSelectedWorkAreaUser 根据车间id和任务根节点id查询该车间下的所有不执行该任务的工区用户
	 * @author quyy
	 * @param workShopId 车间id
	 * @param rootId 任务根节点id
	 * @return
	 */
	public List<User> checkSelectedWorkAreaUser(String workShopId,String rootId,String userId);

}