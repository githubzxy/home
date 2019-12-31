package com.enovell.yunwei.emergencyOrg.service;

import java.util.List;

import com.enovell.yunwei.emergencyOrg.domain.EmergencyOrg;
import com.enovell.yunwei.emergencyOrg.dto.EmergencyOrgDTO;

/**
 * 项目名称：kunmingrinms 
 * 类名称：EmergencyOrgService 
 * 类描述: 机构管理接口 
 * 创建人：yangsy
 * 创建时间：2016-12-07 
 */

public interface EmergencyOrgService {
	
	/**
	 * getOrgChildrenByPid 通过Pid（父id）查询其children
	 * @param pid
	 * @return List<EmergencyOrg>
	 */
	public List<EmergencyOrg> getOrgChildrenByPid(String pid);
	/**
	 * addOrg 新增子机构
	 * @param newOrg
	 */
	public void addOrg(EmergencyOrg newOrg);
	/**
	 * getOrgDataById 根据id获取一个机构的数据
	 * @param id
	 * @return
	 */
	public EmergencyOrg getOrgDataById(String id);
	/**
	 * updateOrg 修改机构名称
	 * @param emergencyOrg
	 */
	public void updateOrg(String orgId , String name);
	/**
	 * 校验机构下是否存在子机构
	 * @param id
	 * @return
	 */
	public long checkChildrenOrg(String id);
	/**
	 * 校验机构下是否存在应急人员
	 * @param id
	 * @return
	 */
	public long checkOrgPeople(String id);
	/**
	 * deleteOrg 删除机构
	 * @param id
	 */
	public void deleteOrg(String id);
	/**
	 * getChildrenByParentId 根据父节点id获取子元素
	 * @param parentId
	 * @return
	 */
	public List<EmergencyOrgDTO> getChildrenByParentId(String parentId);
	/**
	 * sortOrg 排序
	 * @param sortId
	 */
	public void sortOrg(String sortId);
	
	/**
	 * ------------------------------------------------------------------------------------------
	 */
	
	
	
	/**
	 * 新增
	 * @param emergencyOrg
	 * @return
	 */
	public EmergencyOrg addEmergencyOrg(EmergencyOrg emergencyOrg,EmergencyOrg parent);
	
	/**
	 * 修改
	 * @param emergencyOrg
	 * @return
	 */
	public EmergencyOrg updateEmergencyOrg(EmergencyOrg emergencyOrg);
	
	/**
	 * 通过id获取
	 * @param id
	 * @return
	 */
	public EmergencyOrg getEmergencyOrgById(String id);
	
	/**
	 * 通过对象获取
	 * @param emergencyOrg
	 * @return
	 */
	public EmergencyOrg getEmergencyOrgByObject(EmergencyOrg emergencyOrg);
	
	/**
	 * 获取应急机构树
	 * @return
	 */
	public EmergencyOrg getEmergencyOrgTree();
	
	/**
	 * 删除
	 * @param emergencyOrg
	 */
	public void deleteEmergencyOrg(EmergencyOrg emergencyOrg);
	
	/**
	 * 修改序号
	 * @param emergencyOrgs
	 */
	public void updateEmergenOrgSN(List<EmergencyOrg> emergencyOrgs);
	
	
	/////////////////////////////////////////////////////////////
	/**
	 * 获取所有部门
	 * @return
	 */
	public List<EmergencyOrg> getAllEmergencyOrg();
	
	/**
	 * 获取数据条数
	 * @return
	 */
	public int getContent();
	
	/**
	 * 按名字获取机构列表
	 * @return
	 */
	public List<EmergencyOrg> getEmergencyOrgByName(String name);
	
	/**
	 * 是否为子节点
	 * @param emerencyOrg
	 * @return
	 */
	public boolean isChildNode(EmergencyOrg typeOrg);
	
	/**
	 * 获取父部门下子部门
	 * @param parent
	 * @return
	 */
	public List<EmergencyOrg> getChildrenByPanrentOrg(EmergencyOrg parent);
	
	/**
	 * 获取父部门下所有子部门
	 * @param parent
	 * @return
	 */
	public List<EmergencyOrg> getAllChildren(EmergencyOrg parent);
	
}
