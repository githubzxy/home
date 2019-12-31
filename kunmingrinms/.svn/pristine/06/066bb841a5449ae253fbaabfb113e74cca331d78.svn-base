package com.enovell.yunwei.commNetworkStop.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.commNetworkStop.domain.CommNetStop;
import com.enovell.yunwei.commNetworkStop.dto.CommNetStopDto;
import com.enovell.yunwei.commNetworkStop.dto.CommNetStopShowDto;
import com.enovell.yunwei.common.dto.GridDto;

import java.util.List;

/**      
 * 项目名称：tldw
 * 类名称：CommNetStopService 
 * 类描述:   通信网停机要点 接口
 * 创建人：ltf
 * 创建时间：2014-11-21 上午11:01:15
 * 修改人：ltf
 * 修改时间：2014-11-21 上午11:01:15
 */
public interface CommNetStopService {
	
	/**
	 * getRailLineNames 获取所有线路名称集合
	 * @return
	 */
	public List<String> getRailLineNames();
	
	/**
	 * 添加停机要点计划
	 * @param commNetStop
	 * 	@param dtos
	 * @param user
	 * @return
	 * @throws Exception 
	 */
	public CommNetStop addCommNetStop(CommNetStop commNetStop, UploadFileDto[] dtos, User user) throws Exception;
	
	/**    
	 * updateCommNetStop 修改停机要点计划
	 * @param param
	 * @param dtos
	 * @param user
	 * @return
	 * @throws Exception 
	 */
	public CommNetStop updateCommNetStop(CommNetStop param, UploadFileDto[] dtos, User user) throws Exception;

	/**
	 * 删除停机要点计划
	 * @param idArr
	 */
	public void deleteCommNetStop(String[] idArr);
	
	/**
	 * searchCommNetStopShowDto 根据条件dto查询停机要点showDto-分页查询
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<CommNetStopShowDto> searchCommNetStopShowDto(CommNetStopDto dto, int start, int limit);
	
	/**
	 * searchCommNetStop 根据条件dto查询停机要点-分页查询
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<CommNetStop> searchCommNetStop(CommNetStopDto dto, int start, int limit);

	/**
	 * searchCount 根据条件dto查询停机要点总数
	 * @param dto
	 * @return
	 */
	public Long searchCount(CommNetStopDto dto);

	/**
	 * searchCommNetStopById 根据id查询停机要点
	 * @param id
	 * @return
	 */
	public CommNetStop searchCommNetStopById(String id) ;

	/**
	 * examin 审核停机要点计划
	 * @param param
	 * @param dtos
	 * @param user
	 */
	public void examin(CommNetStop param, UploadFileDto[] dtos, User user);

	/**
	 * replyCommNetStop 回复停机要点
	 * @param param 包含id、完成情况、状态
	 * @param replyFileDtos 回复附件
	 * @param user
	 */
	public void replyCommNetStop(CommNetStop param, UploadFileDto[] replyFileDtos, User user);

	/**
	 * cancelCommNetStopp 取消停机要点计划
	 * @param id
	 */
	public void cancelCommNetStop(String id);

	/**
	 * updateAndExamin 修改并审核
	 * @param commNetStop 修改的信息
	 * @param uploadFileDtos 修改后的上传附件
	 * @param checkFileDtos 批复附件
	 * @param user
	 * @throws Exception
	 */
	public void updateAndExamin(CommNetStop commNetStop,
                                UploadFileDto[] uploadFileDtos, UploadFileDto[] checkFileDtos, User user) throws Exception;


}
