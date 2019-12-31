package com.enovell.yunwei.dispathRoot.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.dispathRoot.dto.DispathManageDTO;

import java.util.List;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathRootService   
 * 类描述:  调度管理根任务非业务接口
 * 创建人：lidt 
 * 创建时间：2016-12-16 上午10:32:13
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:32:13   
 *
 */
public interface DispathRootService {
	
	/**
	 * 
	 * getById 根据id获取调令
	 *
	 * @param id 
	 * @return
	 */
	public DispathRoot getById(String id);
	
	/**
	 * 
	 * add 新增调令
	 *
	 * @param dispathRoot 调令
	 * @param dtos 上传文件
	 * @return
	 */
	public DispathRoot add(DispathRoot dispathRoot, UploadFileDto[] dtos);
	
	/**
	 * 
	 * update 修改调令
	 *
	 * @author lidt
	 * @date 2017-7-5 下午4:17:26 
	 * @param dispathRoot 调令
	 * @param dtos 上传文件
	 * @param user 登录用户
	 * @return
	 */
	public DispathRoot update(DispathRoot dispathRoot, UploadFileDto[] dtos, User user);
	
	/**
	 * 
	 * delById 根据ID物理删除
	 *
	 * @param id
	 */
	public void delById(String id);
	
	/**
	 * 
	 * delByIds 根据ID逻辑删除
	 *
	 * @param ids
	 */
	public void delByIds(String ids);
	
	/**
	 * 
	 * getByGridDto 通过条件获取封装后的调令数据
	 *
	 * @author lidt
	 * @date 2017-7-5 上午11:25:42 
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<DispathRoot> getByGridDto(DispathManageDTO dto, int start, int limit);
	
	/**
	 * 
	 * getByDTO 通过条件获取调令数据
	 *
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<DispathRoot> getByDTO(DispathManageDTO dto, int start, int limit);

	/**
	 *
	 * getCountByDTO 通过条件获取调令数量
	 *
	 * @param dto
	 * @return
	 */
	public int getCountByDTO(DispathManageDTO dto);

	/**
	 *
	 * getToDoByGridDto 通过条件获取封装后的待办调令数据
	 *
	 * @author lidt
	 * @date 2017-7-5 上午11:25:42
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<DispathRoot> getToDoByGridDto(DispathManageDTO dto, int start, int limit);

	/**
	 *
	 * getToDoByDTO 获取待办调令数据
	 *
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<DispathRoot> getToDoByDTO(DispathManageDTO dto, int start, int limit);

	/**
	 *
	 * getToDoCountByDTO 获取待办调令数量
	 *
	 * @param dto
	 * @return
	 */
	public int getToDoCountByDTO(DispathManageDTO dto);

	/**
	 *
	 * getDispatchByParent 通过父调令获取子调令
	 * @param parent 父调令
	 * @return
	 */
	public DispathRoot getDispatchByParent(DispathRoot parent);

	/**
	 *
	 * getToDoGridDtoByWorkShopDirector 获取待办调令(车间主任)封装后的数据
	 *
	 * @author lidt
	 * @date 2017-7-6 下午4:20:51
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public GridDto<DispathRoot> getToDoGridDtoByWorkShopDirector(DispathManageDTO dto, int start, int limit);

	/**
	 * getToDoByWorkShopDirector 获取待办调令(车间主任)数据
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 */
	public List<DispathRoot> getToDoByWorkShopDirector(DispathManageDTO dto, int start, int limit);

	/**
	 * getToDoCountByByWorkShopDirector 获取待办调令(车间主任)数据长度
	 * @param dto
	 * @return
	 */
	public long getToDoCountByByWorkShopDirector(DispathManageDTO dto);
	/**
	 *
	 * checkSelectedWorkAreaUser 根据车间id和命令根节点id查询该车间下的所有不执行该命令的工区用户,
	 *                           除了当前登陆用户以外的
	 * @author quyy
	 * @param workShopId 车间id
	 * @param rootId 任务根节点id
	 * @return
	 */
	public List<User> checkSelectedWorkAreaUser(String workShopId, String rootId, String userId);

	/**
	 * 创建分页查询
	 * getAddListByGridDto 
	 * @param dto
	 * @param start
	 * @param limit
	 * @return
	 * @author luoyan
	 */
	public GridDto<DispathRoot> getAddListByGridDto(DispathManageDTO dto, int start, int limit);
	
	
	
}
