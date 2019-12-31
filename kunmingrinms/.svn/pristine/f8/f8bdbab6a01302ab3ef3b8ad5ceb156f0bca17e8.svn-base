package com.enovell.yunwei.circuitWO.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.circuitWO.dto.CircuitWOSearchDto;
import com.enovell.yunwei.common.dto.GridDto;

public interface CircuitWOService {
	/**
	 * getAddListByGridDto 分页获取新增数据列表
	 * @param dto 查询条件封装的对象
	 * @param start 开始行
	 * @param limit 行数
	 * @author lilt
	 * @since 2018-10-30 5:24:13 PM
	 */
	GridDto<CircuitWO> getAddListByGridDto(CircuitWOSearchDto dto, int start, int limit);
	/**
	 * getByGridDto 分页获取全部临时任务数据的列表
	 * @param dto 查询条件封装的对象
	 * @param start 开始行
	 * @param limit 行数
	 * @author lilt
	 * @since 2018-10-30 5:25:41 PM
	 */
	GridDto<CircuitWO> getByGridDto(CircuitWOSearchDto dto, int start, int limit);
	/**
	 * getById 通过Id查询指定一条临时任务的详情信息
	 * @param id 临时任务Id
	 * @author lilt
	 * @since 2018-10-30 5:27:50 PM
	 */
	CircuitWO getById(String id);
	/**
	 * deleteCircuitWOByIds 批量删除指定临时任务id的数据
	 * @param ids 临时任务的id集合
	 * @author lilt
	 * @since 2018-10-30 5:29:08 PM
	 */
	void deleteCircuitWOByIds(String ids);
	/**
	 * getCheckByGridDto 分页查询任务审核列表数据
	 * @param dto 查询条件封装的对象
	 * @param start 开始行
	 * @param limit 行数
	 * @author lilt
	 * @since 2018-10-30 5:30:28 PM
	 */
	GridDto<CircuitWO> getCheckByGridDto(CircuitWOSearchDto dto, int start, int limit);
	/**
	 * addCircuitWO 新增任务
	 * @param taskRoot 任务信息对象
	 * @return CircuitWO
	 */
	CircuitWO addCircuitWO(CircuitWO taskRoot);
	/**
	 * updateCircuitWO 修改任务
	 * @param taskRoot 修改的任务信息对象
	 */
	CircuitWO updateCircuitWO(CircuitWO taskRoot);
	/**    
	 * deleteCircuitWOById 退回任务管理,根据id删除
	 * @param id 任务id
	 * @param user 登录用户
	 */
	void deleteCircuitWOById(String id, User user);

}
