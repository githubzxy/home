package com.enovell.yunwei.userInfoManager.service.impl;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.Role;
import com.enovell.yunwei.system.dto.UserToRoleDTO;
import com.enovell.yunwei.system.service.OrganizationService;
import com.enovell.yunwei.userInfoManager.domain.UserInfo;
import com.enovell.yunwei.userInfoManager.service.UserInfoService;
import com.enovell.yunwei.util.MD5Util;
import org.apache.commons.lang.StringUtils;
import org.hibernate.*;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author roy
 * 2014年8月29日-下午3:12:10
 */
@SuppressWarnings("unchecked")
@Transactional()
@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Resource(name = "organizationService")
	private OrganizationService organizationService;
	
	@Override
	public List<UserToRoleDTO> getAllUser(String start, String limit, String userName, String userOrg) {
		List<Organization> orgList = new ArrayList<Organization>();
		if(StringUtils.isNotBlank(userOrg)){
			Organization org = new Organization();
			org.setId(userOrg);
			orgList.add(org);
			List<Organization> childList = organizationService.getChildrenByPid(userOrg);
			orgList.addAll(childList);
		}
		Criteria c = sessionFactory.getCurrentSession().createCriteria(UserInfo.class);
		c.setFetchMode("organization", FetchMode.JOIN);
		c = queryUserByParam(userName, c,orgList);
		c.setFirstResult(Integer.parseInt(start)).setMaxResults(Integer.parseInt(limit));
		List<UserToRoleDTO> result = getUserToRoleDTOs(c.list());
		return result;
	}
	
	/**
	 * 
	 * getRoleName 通过用户Id,查询用户的角色,并进行拼接
	 * @param userId
	 * @return 逗号拼接好的角色
	 */
	private String getRoleName(String userId) {
		String sql = "select r.role_name_ from CFG_SAFE_USER_ROLE ur "
				+ " left join CFG_SAFE_USER u on u.user_id_ = ur.user_id_ "
				+ " left join CFG_SAFE_ROLE r on r.role_id_ = ur.role_id_ "
				+ " where r.role_state_ = :state "
				+ " and u.user_id_ = :userId ";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("state", Role.EXIST);
		List<Object> list = query.list();
		String roleNames = "";//拼接角色名
		String roleNamesSub = "";//去掉第一个逗号,截取角色名
		if (list != null && list.size() != 0) {
			for (Object object : list) {
				roleNames = roleNames + "," + object.toString();
			}
			roleNamesSub = roleNames.substring(1, roleNames.length());
		}
		return roleNamesSub;
	}
	
	/**
	 * 
	 * getUserToRoleDTOs 显示信息
	 * @param users
	 * @return 
	 */
	private List<UserToRoleDTO> getUserToRoleDTOs(List<UserInfo> users){
		List<UserToRoleDTO> list = new ArrayList<UserToRoleDTO>();
		for (UserInfo user : users) {
			UserToRoleDTO dto = new UserToRoleDTO();
			dto.setUserId(user.getId());
			if (user.getOrganization() != null) {
				dto.setOrgId(user.getOrganization().getId());
				dto.setOrgName(user.getOrganization().getName());
			}
			dto.setUserName(user.getName());
			dto.setRoleName(getRoleName(user.getId()));
			dto.setTelephoneNumber(user.getTelephoneNumber());
			dto.setPhone(user.getPhone());
			dto.setRemark(user.getRemark());
			list.add(dto);
		}
		return list;
	}
	
	@Override
	public long getAllUserCounts(String userName, String userOrg) {
		List<Organization> orgList = new ArrayList<Organization>();
		if(StringUtils.isNotBlank(userOrg)){
			Organization org = new Organization();
			org.setId(userOrg);
			orgList.add(org);
			List<Organization> childList = organizationService.getChildrenByPid(userOrg);
			orgList.addAll(childList);
		}
		Criteria c = sessionFactory.getCurrentSession().createCriteria(UserInfo.class);
		c = queryUserByParam(userName, c,orgList);
		c.setProjection(Projections.rowCount());
		Long result = (Long) c.uniqueResult();
		return result;
	}
	
	/**封装动态查询条件
	 * @param userName
	 * @param c
	 * @param orgList
	 * @return
	 */
	private Criteria queryUserByParam(String userName, Criteria c,List<Organization> orgList) {
		if(StringUtils.isNotBlank(userName)){
			c.add(Restrictions.like("name", "%"+userName+"%"));
		}
		if(orgList!=null&&orgList.size()!=0){
			c.add(Restrictions.in("organization", orgList));
		}
		return c;
	}

	@Override
	public void saveOrUpdateUser(String userId, String userName, String organization, String telephoneNumber, String phone, String remark) {
		UserInfo user;
		Organization o = new Organization();
		o.setId(organization);
		if(StringUtils.isNotBlank(userId)){
			user =  (UserInfo) sessionFactory.getCurrentSession().get(UserInfo.class, userId);
		}else{
			user = new UserInfo();
			user.setCreateTime(new Date());
//			user.setPassword(MD5Util.toMD5("888888"));
			user.setDeleState(1);
		}
		user.setName(userName);
		user.setOrganization(o);
		user.setRemark(remark);
		user.setTelephoneNumber(telephoneNumber);
		user.setPhone(phone);
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}


	@Override
	public void deleteUser(String userId) {
		if(StringUtils.isNotBlank(userId)){
			UserInfo source = (UserInfo) sessionFactory.getCurrentSession().get(UserInfo.class, userId);
			source.setDeleState(0);
			sessionFactory.getCurrentSession().saveOrUpdate(source);
		}
	}

	@Override
	public UserInfo getUserById(String id) {
		return (UserInfo) sessionFactory.getCurrentSession().
				createCriteria(UserInfo.class)
				.add(Restrictions.eq("id", id))
				.setFetchMode("organization", FetchMode.JOIN)
				.setFetchMode("region", FetchMode.JOIN)
				.uniqueResult();
	}
}
