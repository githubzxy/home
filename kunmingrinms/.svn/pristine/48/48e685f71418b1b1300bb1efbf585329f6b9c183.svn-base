package com.enovell.yunwei.accident.service;

import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.accident.domain.Accident;
import com.enovell.yunwei.accident.domain.AccidentShop;
import com.enovell.yunwei.accident.dto.AccidentDTO;
import com.enovell.yunwei.attach.dto.UploadFileDto;

/**
 * 项目名称：kunmingrinms
 * 类名称：AccidentShopService 
 * 类描述: 事故演练计划接口 
 * 创建人：yangsy
 * 创建时间：2016-12-19
 */

public interface AccidentShopService {
	
	/**
	 * 获取登录用户需要汇报的计划信息
	 * @param accident
	 * @param first
	 * @param max
	 * @return
	 */
	public List<AccidentDTO> getAllAccidentDataByUser(Accident accident ,User user,int first, int max);
	/**
	 * 获取记录数
	 * @param id
	 * @return
	 */
	public long getAccidentCountByUser(Accident accident ,User user);
	/**
	 * getAccidentShopByAccidentId 根据id获取该id对应的汇报信息
	 * @param id
	 * @return
	 */
	public AccidentShop getAccidentShopByAccidentId(Accident accident);
	/**
	 * 添加
	 */
	public void addAccidentShop(AccidentShop accShop);
	
	/**
	 * 修改
	 * @param AccShop
	 */
	public void updateAccidentShop(AccidentShop accShop,UploadFileDto[] dtos,User user);
	
	/**
	 * 删除 计划的所有汇报
	 * @param a
	 */
	public void deleteShops(Accident a);
	
}
