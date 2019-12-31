package com.enovell.yunwei.communicate.service;

import java.util.List;

import com.enovell.system.common.domain.Organization;
import com.enovell.yunwei.accident.domain.Accident;
import com.enovell.yunwei.accident.domain.AccidentShop;
import com.enovell.yunwei.accident.dto.AccidentShopDTO;
import com.enovell.yunwei.communicate.domain.Communicate;
import com.enovell.yunwei.communicate.domain.CommunicateShop;
import com.enovell.yunwei.communicate.dto.CommunicateDTO;

/**
 * 项目名称：kunmingrinms
 * 类名称：CommunicateService 
 * 类描述: 通信演练计划接口 
 * 创建人：yangsy
 * 创建时间：2016-12-21 
 */
public interface CommunicateService {
	
	/**
	 * 多条件分页查询
	 * @param accidentDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<CommunicateDTO> getAllCommunicateData(CommunicateDTO communicateDTO,int first,int max);
	/**
	 * 获取记录数
	 * @param communicateDTO
	 * @return
	 */
	public long getCommunicateCount(CommunicateDTO communicateDTO);
	/**
	 * 添加计划
	 */
	public void addCommunicate(Communicate c,String orgIds);
	/**
	 * getCommunicateById 根据id获取该id对应的通信演练计划信息
	 * @param id
	 * @return
	 */
	public Communicate getCommunicateById(String id);
	/**
	 * 修改计划
	 */
	public void updateCommunicate(Communicate c);
	/**
	 * 删除计划
	 */
	public void deleteCommunicates(String jsonIds);
	/**
	 * getAllCommunicateShopDataById 获取汇报信息显示到通信演练计划详细信息的表里
	 * @param id 通信演练计划的id
	 * @param first
	 * @param max
	 * @return
	 */
	public List<CommunicateShop> getAllCommunicateShopDataById(String id,int first,int max);
	/**
	 * 获取该id下需汇报部门的记录数
	 * @param id
	 * @return
	 */
	public long getCommunicateShopCountById(String id);
	/**
	 * getCommunicateShopById 根据id获取该id对应的汇报信息
	 * @param id
	 * @return
	 */
	public CommunicateShop getCommunicateShopById(String id);
	
	
	/**
	 * -------------------------------------------------------------------------------
	 */
	
	
	/**
	 * 添加计划
	 */
	public void addAccident(Accident a);
	/**
	 * addAccidentWithOrgs 添加计划，可以传递派发机构
	 * @param a 事故救援演练计划实体
	 * @param orgs 组织机构集合
	 */
	public void addAccidentWithOrgs(Accident a, List<Organization> orgs);
	/**
	 * 删除计划
	 */
	public void deleteAccident(List<String> ids);
	/**
	 * 分页查询
	 * @param aDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<Accident> serachAccident(AccidentShopDTO aDTO, int first, int max);
	/**
	 * 查询总数
	 * @param aDTO
	 * @return
	 */
	public int serachCount(AccidentShopDTO aDTO);
	/**
	 * 查询计划的所有汇报
	 * @param a
	 * @return
	 */
	public List<AccidentShop> getAccidentShop(Accident a);
	
}
