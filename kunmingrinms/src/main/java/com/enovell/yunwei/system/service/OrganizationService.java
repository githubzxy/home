package com.enovell.yunwei.system.service;

import com.enovell.system.common.domain.Organization;

import java.util.List;

/**
 * 
 * 项目名称：guangtieYearMonth
 * 类名称：OrganizationService   
 * 类描述:  组织机构service
 * 创建人：张思红 
 * 创建时间：2014-10-28 上午10:29:10
 * 修改人：张思红 
 * 修改时间：2014-10-28 上午10:29:10   
 *
 */
public interface OrganizationService {
	/**
	 * 组织机构类型：车间
	 */
	int ORG_TYPE_CJ = 1502;
	/**
	 * 组织机构类型：科室
	 */
	int ORG_TYPE_KS = 1051;
	/**
	 * 组织机构类型：工区
	 */
	int ORG_TYPE_GQ = 1503;
	/**
	 * 组织机构类型： 好友组
	 */
	int ORG_TYPE_FIRENDS = 6;


	/**
	 * 
	 * add 新增
	 * @param organization
	 */
	public void add(Organization organization);
	
	/**
	 * 
	 * update 修改
	 * @param organization
	 */
	public void update(Organization organization);
	
	/**
	 * 
	 * delete 删除
	 * @param id
	 */
	public void delete(String id);
	
	/**
	 * 
	 * batchDelete 批量删除
	 * @param ids
	 */
	public void batchDelete(String ids);
	
	/**
	 * 
	 * saveSort 保存排序
	 * @param ids
	 */
	public void saveSort(String ids);
	
	/**
	 * 
	 * getChildrenByPid 通过Pid（父id）查询其children
	 * @param pid
	 * @return List<Organization>
	 */
	public List<Organization> getChildrenByPid(String pid);
	
	/**
	 * 
	 * getChildrenByPidAndCurId 通过Pid（父id）和不等于curId查询其children
	 * @param pid 父id
	 * @param curId 选中节点id
	 * @return
	 */
	public List<Organization> getChildrenByPidAndCurId(String pid, String curId);
	
	/**
	 * 
	 * getChildrenByParent 根据父机构获取子机构
	 * @param parent
	 * @return
	 */
	public List<Organization> getChildrenByParent(Organization parent);
	
	/**
	 * 
	 * getSegmentByPid 通过父id查询科室（排除车间）
	 * @param pid
	 * @return
	 */
	public List<Organization> getSegmentByPid(String pid);
	
	/**
	 * 
	 * getAllWorkshop 查询所有车间
	 * @return
	 */
	public List<Organization> getAllWorkshop();
	
	/**
	 * 
	 * saveSegmentAndWorkshop 保存段与车间的关系表
	 * @param segmentId
	 * @param workshopIds
	 */
	public void saveSegmentAndWorkshop(String segmentId, String[] workshopIds);
	
	/**
	 * 
	 * getAllWorkshopBySegment 查询所有车间标记
	 * @return
	 */
	public List<Organization> getAllWorkshopBySegment(String segmentId);
	
	/**
	 * 
	 * getOrgChildrenById 通过id查询组织机构，包含其children
	 * @param orgId
	 * @return
	 */
	public Organization getOrgChildrenById(String orgId);
	
	/**获取值班机构
	 * @param sortField 排序日段
	 * @return
	 */
	public List<Organization> getOndutyOrgs(String sortField);
	
	/**
	 * 
	 * getParentOrgByChild 根据子结构id查询父组织结构
	 * @param orgId 
	 * @return
	 * @author quyy
	 */
	public Organization getParentOrgByChild(String orgId);
	
}
