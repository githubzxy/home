package com.enovell.yunwei.friend.service.impl;

import com.enovell.yunwei.friend.domain.Friend;
import com.enovell.yunwei.friend.domain.FriendGroup;
import com.enovell.yunwei.friend.dto.FriendDTO;
import com.enovell.yunwei.friend.service.FriendService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：FriendServiceImpl   
 * 类描述:  好友实现类
 * 创建人：lidt 
 * 创建时间：2016-11-30 下午2:53:55
 * 修改人：lidt 
 * 修改时间：2016-11-30 下午2:53:55   
 *
 */
@SuppressWarnings("unchecked")
@Transactional
@Service("friendService")
public class FriendServiceImpl implements FriendService {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addFriend(Friend friend) {
		sessionFactory.getCurrentSession().save(friend);
	}

	@Override
	public void updateFriend(Friend friend) {
		sessionFactory.getCurrentSession().saveOrUpdate(friend);
	}

	@Override
	public void deleteFriend(Friend friend) {
		sessionFactory.getCurrentSession().delete(friend);
	}

	@Override
	public List<Friend> selectFriends(FriendDTO fDTO) {
		String eql = "FROM Friend f "
				+ " LEFT JOIN FETCH f.user u "
				+ " LEFT JOIN FETCH u.organization o "
				+ " LEFT JOIN FETCH f.friendGroup "
				+ " WHERE u.deleState = 1 ";
		Query query = getSelectQuery(fDTO, eql);
		return query.list();
	}

	protected Query getSelectQuery(FriendDTO fDTO, String eql) {
		Session session = sessionFactory.getCurrentSession();
		Map<String, Object> args = new HashMap<String, Object>();
		if (fDTO.getFriendGroup() != null) {
			eql += " AND f.friendGroup = :fg ";
			args.put("fg", fDTO.getFriendGroup());
		}

		Query query = session.createQuery(eql);
		Iterator<Map.Entry<String, Object>> iterator = args.entrySet()
				.iterator();
		while (iterator.hasNext()) {
			Map.Entry<String, Object> entry = iterator.next();
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return query;
	}
	
	@Override
	public int getFriendCount(FriendDTO fDTO) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String hql = "SELECT COUNT(f.id) FROM Friend f WHERE 1=1 ";
		// 已经拼装好的hql
		Query query = getSelectQuery(fDTO, hql);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		return ((Long) query.uniqueResult()).intValue();
	}

	@Override
	public void deleteFriendByGroup(String groupId) {
		Session session = sessionFactory.getCurrentSession();

		FriendDTO fDTO = new FriendDTO();
		FriendGroup fg = new FriendGroup();
		fg.setId(groupId);
		fDTO.setFriendGroup(fg);
		List<Friend> fs = selectFriends(fDTO);
		for (Friend f : fs) {
			session.delete(f);
		}
	}

}
