package com.enovell.km_app_micro_service.service;

import org.springframework.stereotype.Service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.enocommon.exceptions.BusiException;

/** 登录业务逻辑处理类
 * @author RoySong
 * @date 2017年10月17日
 */
@Service("LoginService")
public class LoginServiceImpl implements LoginService {

//	@Autowired
//	private NamedParameterJdbcTemplate tpl;

	/* (non-Javadoc)
	 * @see com.enovell.plantform.std.service.LoginService#getUser(java.lang.String, java.lang.String)
	 */
	@Override
	public User getUser(String userName, String password) {
//		String sql = "select u.user_id_ as id_,u.user_name_ as name_,u.organization_id_ as org_id_,u.password_ as password_,u.user_phone_ as phone_,o.org_name_ as org_name_,o.type_ as org_type_ "
//				+ " from cfg_safe_user u left join cfg_base_organization o on u.organization_id_ = o.org_id_ where u.user_name_ = :userName and u.USER_STATE_ = :status";
//		Map<String,Object> paramMap = new HashMap<>();
//		paramMap.put("userName", userName);
//		paramMap.put("status", 1);
//		User user = tpl.queryForObject(sql, paramMap,new UserMapper());
//		if(user == null || user.getId() == null)
//			throw new BusiException("没有找到对应用户，请检查用户是否正确！");
//		String passInDb = user.getPassword();
//		if(!passInDb.equals(password))
//			throw new BusiException("密码错误，请重新输入密码！");
//		return user;
		User user = new User();
		user.setName(userName);
		user.setPassword(password);
		if(!"admin".equals(userName))
			throw new BusiException("没有找到对应用户，请检查用户是否正确！");
		if(!"admin".equals(password))
			throw new BusiException("密码错误，请重新输入密码！");
		return user;
	}
}
//class UserMapper implements RowMapper<User>{
//
//	@Override
//	public User mapRow(ResultSet rs, int idx) throws SQLException {
//		User u = new User();
//		u.setId(rs.getString("ID_"));
//		u.setName(rs.getString("NAME_"));
//		Organization organization = new Organization();
//		organization.setId(rs.getString("ORG_ID_"));
//		organization.setName(rs.getString("ORG_NAME_"));
//		Integer orgType = rs.getString("ORG_TYPE_")!=null?Integer.valueOf(rs.getString("ORG_TYPE_")):null;
//		organization.setType(orgType);
//		u.setOrganization(organization );
//		u.setPassword(rs.getString("PASSWORD_"));
//		u.setPhone(rs.getString("PHONE_"));
//		return u;
//	}
//	
//}
