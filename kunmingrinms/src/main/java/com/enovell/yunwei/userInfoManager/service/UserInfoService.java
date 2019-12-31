package com.enovell.yunwei.userInfoManager.service;

import java.util.List;

import com.enovell.yunwei.system.dto.UserToRoleDTO;
import com.enovell.yunwei.userInfoManager.domain.UserInfo;

/**用户业务逻辑接口
 * @author roy
 * 2014年8月29日-下午3:08:00
 */
public interface UserInfoService {

	/**分页条件查询所有用户
	 * @param start
	 * @param limit
	 * @param userName 用户名，模糊查询
	 * @param userOrg 用户所属组织机构ID
	 * @return
	 */
	public List<UserToRoleDTO> getAllUser(String start, String limit, String userName, String userOrg);
	
	
	/**条件查询所有用户数量
	 * @param userName 用户名，模糊查询
	 * @param userOrg 用户所属组织机构ID
	 * @return
	 */
	public long getAllUserCounts(String userName, String userOrg);

	/**保存用户
	 * @param userId
	 * @param userName
	 * @param organization
	 * @param telephoneNumber
	 * @param phone
	 * @param remark
	 */
	public void saveOrUpdateUser(String userId, String userName, String organization, String telephoneNumber, String phone, String remark);
	
	/**逻辑删除对应用户
	 * @param userId
	 */
	public void deleteUser(String userId);
	
	/**根据ID获取用户
	 * @param id
	 * @return
	 */
	public UserInfo getUserById(String id);
	
}
