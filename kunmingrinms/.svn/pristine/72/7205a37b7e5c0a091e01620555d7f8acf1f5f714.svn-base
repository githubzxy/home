package com.enovell.yunwei.dispathRoot.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.dispathRoot.domain.DispatchRootHistory;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathRootHistoryService   
 * 类描述:  调度管理历史操作接口
 * 创建人：lidt 
 * 创建时间：2016-12-16 上午10:31:40
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:31:40   
 *
 */
public interface DispathRootHistoryService {
	
	/**
	 * 创建操作流水
	 * @param beginStatus 开始状态
	 * @param endStatus 结束状态
	 * @param task 所属任务
	 * @param transactUser 执行人
	 * @param remarks 备注
	 * @param time 当前时间的偏移量（毫秒）
	 * @return
	 */
	public DispatchRootHistory createHistory(String beginStatus,
                                             String endStatus, DispathRoot task, User transactUser, String remarks, int time);
	
	/**
	 * 删除该任务下的所有操作流水
	 * @param dispatch
	 */
	public void deleteHistoryByObj(DispathRoot dispatch);
	
}
