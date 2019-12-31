package com.enovell.yunwei.emergencyOrg.service;

import java.util.List;

import com.enovell.system.common.domain.Position;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.emergencyOrg.domain.EmergencyOrg;
import com.enovell.yunwei.emergencyOrg.domain.EmergencyUser;
import com.enovell.yunwei.emergencyOrg.dto.EmergencyUserDTO;

/**
 * 项目名称：kunmingrinms 
 * 类名称：EmergencyUserService 
 * 类描述: 应急人员接口
 * 创建人：yangsy
 * 创建时间：2016-12-07 
 */

public interface EmergencyUserService {
	
	/**
	 * 获取岗位信息
	 * @return
	 */
	public List<Position> getPositionData();
	
	
	/**
	 * -------------------------------------------------------------------------------------
	 */
	
	
	/**
	 * 新增应急人员
	 * @param emergencyUser
	 * @return
	 */
	public EmergencyUser addEmergencyUser(EmergencyUser emergencyUser);
	
	/**
	 * 修改
	 * @param emergencyUser
	 * @return
	 */
	public EmergencyUser updateEmergencyUser(EmergencyUser emergencyUser);
	
	/**
	 * 通过id获取
	 * @param id
	 * @return
	 */
	public EmergencyUser getEmergencyUserById(String id);
	/**
	 * 通过id获取
	 * @param id
	 * @return
	 */
	public List<EmergencyUserDTO> getEmergencyPeopleById(String id);
	
	/**
	 * 通过姓名获取
	 * @param name
	 * @return
	 */
	public EmergencyUser getEmergencyUserByName(String name);
	
	/**
	 * 删除
	 */
	public void deleteEmergencyUser(List<String> ids);
	/**
	 * 删除
	 */
	public void deleteEmergencyUser(String id);
	/**
	 * 删除
	 */
	public void deleteEmergencyUser(EmergencyUser emergencyUser);
	/**
	 * 删除
	 */
	public void deleteEmergencyUsers(String[] ids);
	/**
	 * 删除
	 */
	public void deleteEmergencyUsers(List<EmergencyUser> emergencyUsers);
	
	/**
	 * 获取所有
	 * @return
	 */
	public List<EmergencyUserDTO> getAllEmergencyUsers(int first,int max);
	/**
	 * 获取所有
	 * @return
	 */
	public long getEmergencyUsersCount();
	
	/**
	 * 多条件分页查询
	 * @param emergencyOrg
	 * @param first
	 * @param max
	 * @return
	 */
	public List<EmergencyUserDTO> getAllEmergencyUsers(EmergencyUserDTO emergencyUserDTO,int first,int max);
	
	/**
	 * 获取记录数
	 * @param emergencyOrg
	 * @return
	 */
	public long getEmergencyUsersCount(EmergencyUserDTO emergencyUserDTO);
	
	/**
	 * 通过应急机构集合分页查询人员
	 * @param orgs
	 * @param first
	 * @param max
	 * @return
	 */
	public List<EmergencyUser> getEmergencyUsersByEmergencyOrgs(List<EmergencyOrg> orgs,int first,int max);
	
	/**
	 * 通过应急机构集合分页查询人员的记录条数
	 * @param orgs
	 * @return
	 */
	public int getEmergencyUsersByEmergencyOrgsCount(List<EmergencyOrg> orgs);
	
	/**
	 * 导入组织用户到应急人员表
	 * @param users 需要导入的人员
	 * @param emergencyOrg 要导入的应急机构
	 */
	public void importEmergencyUser(List<User> users,EmergencyOrg emergencyOrg/*,Post post*/);

	
}
