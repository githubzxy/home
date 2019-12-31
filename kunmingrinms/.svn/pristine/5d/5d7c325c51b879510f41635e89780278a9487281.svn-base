package com.enovell.yunwei.circuitWO.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.circuitWO.dto.NameAndIdDTO;
import com.enovell.yunwei.circuitWO.dto.CircuitWOSearchDto;
import com.enovell.yunwei.common.dto.GridDto;

public interface ToDoCircuitWOService {
	/**    
	 * getCircuitWOShowDtoOfToDoGridDto 根据dto查询待办任务-封装数据
	 * @param dto 查询条件封装的对象
	 * @param start 开始行
	 * @param limit 行数
	 * @return GridDto<CircuitWO> 待办任务集合
	 */
	GridDto<CircuitWO> getCircuitWOShowDtoOfToDoGridDto(CircuitWOSearchDto dto, int start, int limit);
	/**
	 * getCircuitWORecentOfToDoGridDto 获取回退的列表-数据封装
	 * @param dto 查询条件封装的对象
	 * @param start 开始行
	 * @param limit 行数
	 * @return GridDto<CircuitWO> 已回归任务集合
	 */
	GridDto<CircuitWO> getCircuitWORecentOfToDoGridDto(CircuitWOSearchDto dto, int start, int limit);
	/**    
	 * receive 接收任务
	 * @param id 任务Id
	 */
	void receive(String id);
	/**    
	 * sendBack 退回任务
	 * @param id 任务id
	 * @param sendBackRemark 备注
	 */
	void sendBack(String id, String sendBackRemark);
	/**    
	 * assign 分派任务，
	 * 将当前子任务分派给其他的人，
	 *	包含修改功能，清除当前子任务的子任务，在根据传入的人生成新的子任务，
	 *	父任务设置待接收，子任务设置成待接收
	 * @param taskRoot
	 * @return Boolean 是否分派成功
	 */
	Boolean assign(CircuitWO taskParam);
	/**    
	 * turnToSendMultiUser 转派任务（能多选）
	 * @param id 待转派任务id
	 * @param receiveUserId 转派接收人集合
	 */
	void turnToSendMultiUser(String id, String receiveUserId);
	/**    
	 * reply 回复任务
	 * 回复完成后，当前任务状态变为“已回复”，
	 * 相对父任务(parent)，若当前任务是同级最后一条（相对根未全部完成），则其父任务（非根）状态变为“已回复”，否则仍为“已分派”；
	 * 相对根任务(root)，若当前任务是同级最后一条，则当前任务、父任务为“已回复”、根任务为“待归档”
	 * @param taskRoot
	 * @param dtos
	 * @return CircuitWO
	 */
	CircuitWO reply(CircuitWO taskRoot, UploadFileDto[] dtos);
	/**
	 * getSelectUsersByOrgId 根据组织机构id查询用户（用于多选显示）
	 * @param id 待转派任务的id
	 * @param orgId 组织机构id
	 * @return List<NameAndIdDTO>
	 */
	List<NameAndIdDTO> getSelectUsersByOrgId(String id, String orgId);
	/**
	 * getToDoByWorkShopDirector 获取待办任务(车间主任)数据
	 * @param dto
	 * @param start
	 * @param limit
	 * @return GridDto<CircuitWO>
	 */
	GridDto<CircuitWO> getToDoByWorkShopDirectorGridDto(CircuitWOSearchDto dto, int start, int limit);
	/**
	 * checkSelectedWorkAreaUser 根据车间id和任务根节点id查询该车间下的所有不执行该任务的工区用户
	 * @param workShopId 车间id
	 * @param rootId 任务根节点id
	 * @return List<User>
	 */
	List<User> checkSelectedWorkAreaUser(String workShopId, String rootId, String id);

}
