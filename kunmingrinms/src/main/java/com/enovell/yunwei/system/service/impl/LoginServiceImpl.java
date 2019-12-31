
/**   
 * 文件名：LoginServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-5-16 上午11:24:11   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.system.service.impl;

import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.system.domain.Login;
import com.enovell.yunwei.system.dto.LoginDTO;
import com.enovell.yunwei.system.service.LoginService;
import com.enovell.yunwei.util.PagingUtil;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**      
 * 项目名称：kunmingrinms
 * 类名称：LoginServiceImpl   
 * 类描述:  登录日志实现类
 * 创建人：lidt 
 * 创建时间：2017-5-16 上午11:24:11
 * 修改人：lidt 
 * 修改时间：2017-5-16 上午11:24:11   
 *    
 */
@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService{
	
	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public Login addLogin(Login login) {
		Session session = sessionFactory.getCurrentSession();
		session.save(login);
		return login;
	}

	@Override
	public List<Map<String, Object>> getLoginCountOfOrg(String orgType,
			String startTime, String endTime) {
		String sql = " SELECT COUNT(o.org_name_) AS count,o.org_name_ AS orgName,o.orgindex_ "+
					 " FROM ENO_LOGIN l, cfg_base_organization o, cfg_safe_user u "+
					 " WHERE l.org_id_ = o.org_id_ and l.content_ = '登录系统'"
					 + " and l.username_ = u.user_name_ and u.user_delstate_ = 1 ";
		List<Object> searchParam = new ArrayList<Object>();
		if (StringUtils.isNotBlank(orgType)) {
			sql += " AND o.type_=?";
			searchParam.add(orgType);
		}
		if(StringUtils.isNotBlank(startTime)){
			sql += " AND l.OPERATION_TIME_>=TO_DATE(?,'yyyy-mm-dd hh24:mi:ss')";
			searchParam.add(startTime);
		}
		if(StringUtils.isNotBlank(endTime)){
			sql += " AND l.OPERATION_TIME_<= TO_DATE(?,'yyyy-mm-dd hh24:mi:ss')";
			searchParam.add(endTime);
		}
		sql += " GROUP BY o.org_name_,o.orgindex_ ";
		sql += " ORDER BY o.ORGINDEX_ desc";
		return jdbcTemplate.queryForList(sql, searchParam.toArray());
	}

	@Override
	public GridDto<LoginDTO> getGridDtoList(LoginDTO dto, int start, int limit) {
		String getLoginSql = " SELECT "
				+ " 	L.USERNAME_, "
				+ " 	O.ORG_NAME_, "
				+ " 	L.CONTENT_, "
				+ " 	L.OPERATION_TIME_ "
				+ " FROM "
				+ " 	ENO_LOGIN L, "
				+ " 	CFG_SAFE_USER U, "
				+ " 	CFG_BASE_ORGANIZATION O "
				+ " WHERE "
				+ " 	L.ORG_ID_ = O.ORG_ID_ "
				+ " 	AND L.USERNAME_ = U.USER_NAME_ "
				+ " 	AND U.USER_DELSTATE_ = 1 ";
		List<Object> param = new ArrayList<Object>();
		if(StringUtils.isNotBlank(dto.getOrgId())){
			getLoginSql += " AND L.ORG_ID_ = ?";
			param.add(dto.getOrgId());
		}
		if(StringUtils.isNotBlank(dto.getUserName())){
			getLoginSql += " AND L.USERNAME_ LIKE ?";
			param.add("%" + dto.getUserName().trim() + "%");
		}
		if(StringUtils.isNotBlank(dto.getStartTime())){
			getLoginSql += " AND L.OPERATION_TIME_>=TO_DATE(?,'yyyy-mm-dd hh24:mi:ss')";
			param.add(dto.getStartTime());
		}
		if(StringUtils.isNotBlank(dto.getEndTime())){
			getLoginSql += " AND L.OPERATION_TIME_<= TO_DATE(?,'yyyy-mm-dd hh24:mi:ss')";
			param.add(dto.getEndTime());
		}
		getLoginSql += " ORDER BY L.OPERATION_TIME_ DESC ";
		List<LoginDTO> list = jdbcTemplate.query(getLoginSql, param.toArray(), new RowMapper<LoginDTO>() {
			@Override
			public LoginDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				LoginDTO dto = new LoginDTO();
				dto.setOrgName(rs.getString("ORG_NAME_"));
				dto.setUserName(rs.getString("USERNAME_"));
				dto.setContent(rs.getString("CONTENT_"));
				dto.setOperationTime(rs.getTimestamp("OPERATION_TIME_"));
				return dto;
			}
		});
		
		List<LoginDTO> pagingList = PagingUtil.getPagingListData(list, start, limit);
		GridDto<LoginDTO> result = new GridDto<LoginDTO>();
		result.setRows(pagingList);
		result.setResults(Long.valueOf(list.size()));
		return result;
	}

}
