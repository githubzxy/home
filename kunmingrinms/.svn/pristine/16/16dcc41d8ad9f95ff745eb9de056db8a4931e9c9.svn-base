package com.enovell.yunwei.communicate.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.communicate.domain.Communicate;
import com.enovell.yunwei.communicate.domain.CommunicateShop;
import com.enovell.yunwei.communicate.dto.CommunicateDTO;

/**
 * 项目名称：kunmingrinms
 * 类名称：CommunicateShopService 
 * 类描述: 通信演练计划接口 
 * 创建人：yangsy
 * 创建时间：2016-12-21
 */

public interface CommunicateShopService {
	
	/**
	 * 添加
	 */
	public void addCommunicateShop(CommunicateShop cs);
	/**
	 * 删除计划的所有汇报
	 * @param a
	 */
	public void deleteShops(Communicate c);
	/**
	 * 获取登录用户需要汇报的计划信息（显示到汇报页面中）
	 * @param accident
	 * @param first
	 * @param max
	 * @return
	 */
	public List<CommunicateDTO> getAllCommunicateDataByUser(Communicate communicate ,User user,int first, int max);
	/**
	 * 获取记录数
	 * @param id
	 * @return
	 */
	public long getCommunicateCountByUser(Communicate communicate ,User user);
	/**
	 * getCommunicateShopByCommunicateId 根据id获取该id对应的汇报信息
	 * @param id
	 * @return
	 */
	public CommunicateShop getCommunicateShopByCommunicateId(Communicate communicate);
	/**
	 * 更新
	 */
	public void updateCommunicateShop(CommunicateShop cs);
	
	/**
	 * ---------------------------------------------------------------------------------------
	 */
	
}
