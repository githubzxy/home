package com.enovell.yunwei.system.service.impl;


import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.domain.MessageRemind;
import com.enovell.yunwei.system.service.MessageRemindService;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("messageRemindService")
@Transactional
public class MessageRemindServiceImple implements MessageRemindService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<MessageRemind> getMessageByUser(User user) {
		String sql = " FROM MessageRemind mr Where mr.receptUser = :receptUser";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("receptUser", user);
		List<MessageRemind> returenList = query.list();
		return returenList;
	}

	@Override
	public List<Object[]> getMessageDtoByUser(User user) {
//		List<Object[]> list = sessionFactory.getCurrentSession().createSQLQuery("SELECT WMSYS.WM_CONCAT(ID_),COUNT(*),TYPE_ FROM MESSAGE_REMIND WHERE RECEPT_USER_ = '"+user.getId()+"'  GROUP by TYPE_ ").list();
		List<Object[]> list = sessionFactory.getCurrentSession().createSQLQuery("SELECT COUNT(*),TYPE_ FROM MESSAGE_REMIND WHERE RECEPT_USER_ = '"+user.getId()+"'  GROUP by TYPE_ ").list();
		return list;
	}

	@Override
	public void delMsg(String ids) {
		if(StringUtils.isNotEmpty(ids)){
			ids = ids.substring(0, ids.length()-1);
			String[] idArr = ids.split(",");
			String hql = "delete from MessageRemind mr where mr.id in (:ids)";
			Query query=sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameterList("ids", idArr);//hibernate中传集合和传单个对象的方法是分开的，与ejb实现是不一样的
			query.executeUpdate(); 
		}
	}

	@Override
	public MessageRemind add(User receptUser, String type,String objId) {
		MessageRemind msg = new MessageRemind();
		msg.setReceptUser(receptUser);
		msg.setSendDate(new Date());
		msg.setType(type);
		msg.setObjId(objId);
		sessionFactory.getCurrentSession().saveOrUpdate(msg);
		return msg;
	}

	@Override
	public void delByObjId(String objId) {
		if(StringUtils.isNotEmpty(objId)){
			String hql = "delete from MessageRemind mr where mr.id in (:objId)";
			Query query=sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter("objId", objId);//hibernate中传集合和传单个对象的方法是分开的，与ejb实现是不一样的
			query.executeUpdate(); 
		}
	}

	@Override
	public void delMsgByUser(User user) {
		if(user != null){
			String hql = "delete from MessageRemind mr where mr.receptUser = :receptUser";
			Query query=sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter("receptUser", user);//hibernate中传集合和传单个对象的方法是分开的，与ejb实现是不一样的
			query.executeUpdate(); 
		}
	}

}
