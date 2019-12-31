package com.enovell.yunwei.accident.service;

import java.util.List;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.accident.domain.Accident;
import com.enovell.yunwei.accident.domain.AccidentShop;
import com.enovell.yunwei.accident.dto.AccidentDTO;
import com.enovell.yunwei.accident.dto.AccidentShopDTO;
import com.enovell.yunwei.attach.dto.UploadFileDto;

/**
 * 项目名称：kunmingrinms
 * 类名称：AccidentService 
 * 类描述: 事故演练计划接口 
 * 创建人：yangsy
 * 创建时间：2016-12-15 
 */
public interface AccidentService {
	
	/**
	 * 多条件分页查询
	 * @param accidentDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public List<AccidentDTO> getAllAccidentData(AccidentDTO accidentDTO,int first,int max);
	/**
	 * 获取记录数
	 * @param accidentDTO
	 * @return
	 */
	public long getAccidentCount(AccidentDTO accidentDTO);
	/**
	 * getAccidentById 根据id获取该id对应的计划信息
	 * @param id
	 * @return
	 */
	public Accident getAccidentById(String id);
	/**
	 * 添加计划
	 */
	public void addAccident(Accident a,String orgIds,UploadFileDto[] dtos);
	/**
	 * 删除计划
	 */
	public void deleteAccidents(String jsonIds);
	/**
	 * getAllAccidentShopDataById 获取汇报信息显示到事故演练计划详细信息的表里
	 * @param id 事故演练计划的id
	 * @param first
	 * @param max
	 * @return
	 */
	public List<AccidentShop> getAllAccidentShopDataById(String id,int first,int max);
	/**
	 * 获取记录数
	 * @param id
	 * @return
	 */
	public long getAccidentShopCountById(String id);
	/**
	 * getAccidentShopById 根据id获取该id对应的汇报信息
	 * @param id
	 * @return
	 */
	public AccidentShop getAccidentShopById(String id);
	
	
	
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
	 * 修改计划
	 */
	public void updateAccident(Accident a,UploadFileDto[] dtos,User user);
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
