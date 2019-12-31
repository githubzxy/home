/**   
 * Copyright © 2019 eSunny Info. Tech Ltd. All rights reserved.
 *
 * @Package: com.enovell.yunwei.system.service.impl 
 * @author: lidt   
 * @date: 2019年5月29日 下午4:17:35 
 */
package com.enovell.yunwei.system.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.system.domain.LoginErrorTime;
import com.enovell.yunwei.system.service.LoginErrorTimeService;

/**   
 *    
  *  项目名称：RINMS2MAIN_ES   
  *  类名称：LoginErrorTimeServiceImpl   
  *  类描述：   登录错误提醒
  *  创建人：zhouxy
  *  创建时间：2019年5月29日 下午4:17:35
 *    
 */
@Transactional
@Service("loginErrorTimeService")
public class LoginErrorTimeServiceImpl implements LoginErrorTimeService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addLoginErrorTime(String userName) {
		LoginErrorTime loginErrorTime = new LoginErrorTime();
		loginErrorTime.setUserName(userName);
		loginErrorTime.setLoginTime(new Date());
		sessionFactory.getCurrentSession().save(loginErrorTime);
	}

	@Override
	public int getCountByUserName(String userName) {
		String sql = " SELECT count(USER_NAME_) FROM ENO_LOGIN_ERROR_TIME where USER_NAME_ =:userName ";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("userName", userName);
		return ((BigDecimal) query.uniqueResult()).intValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public LoginErrorTime getLoginErrorTimeLast(String userName) {
		String hql = " From LoginErrorTime where userName = :userName order by loginTime desc ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userName", userName);
		List<LoginErrorTime> list = query.list();
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void clearLoginErrorTime(String userName) {
		String hql = " delete LoginErrorTime User where userName =:userName ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userName", userName);
		query.executeUpdate();
	}

}
