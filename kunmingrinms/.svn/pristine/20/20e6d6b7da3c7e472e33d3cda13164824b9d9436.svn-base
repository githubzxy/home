package com.enovell.yunwei.friend.service.impl;

import com.enovell.yunwei.friend.domain.Friend;
import com.enovell.yunwei.friend.domain.FriendGroup;
import com.enovell.yunwei.friend.dto.FriendGroupDTO;
import com.enovell.yunwei.friend.service.FriendGroupService;
import com.enovell.yunwei.friend.service.FriendService;
import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * 
 * 项目名称：kunmingrinms 类名称：FriendGroupServiceImpl 类描述: 好友组实现类 创建人：lidt
 * 创建时间：2016-11-30 下午2:53:43 修改人：lidt 修改时间：2016-11-30 下午2:53:43
 * 
 */
@SuppressWarnings("unchecked")
@Transactional
@Service("friendGroupService")
public class FriendGroupServiceImpl implements FriendGroupService {

	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "friendService")
	private FriendService fs;

	@Override
	public void addFriendGroup(FriendGroup fg) {
		sessionFactory.getCurrentSession().save(fg);
	}

	@Override
	public void updateFriendGroup(FriendGroup fg) {
		sessionFactory.getCurrentSession().saveOrUpdate(fg);
	}

	@Override
	public void deleteFriendGroup(String id, List<FriendGroup> fgs) {

		Session session = sessionFactory.getCurrentSession();
		fs.deleteFriendByGroup(id);
		session.delete((session.get(FriendGroup.class, id)));
		for (FriendGroup fg : fgs) {
			updateFriendGroupSn(fg);
		}
	}

	private void updateFriendGroupSn(FriendGroup fg) {
		Session session = sessionFactory.getCurrentSession();
		String eql = "UPDATE FriendGroup fg SET fg.sn = :sn WHERE fg.id = :id";
		Query query = session.createQuery(eql);
		query.setParameter("sn", fg.getSn());
		query.setParameter("id", fg.getId());
		query.executeUpdate();
	}

	@Override
	public List<FriendGroup> selectFriendGroup(FriendGroupDTO fgDTO) {
		String eql = "FROM FriendGroup fg LEFT JOIN FETCH fg.belongUser WHERE 1=1 ";
		Query query = getSelectQuery(fgDTO, eql);
		return query.list();
	}

	protected Query getSelectQuery(FriendGroupDTO fgDTO, String eql) {
		Session session = sessionFactory.getCurrentSession();
		Map<String, Object> args = new HashMap<String, Object>();
		if (fgDTO.getUser() != null) {
			eql += " AND fg.belongUser = :user ";
			args.put("user", fgDTO.getUser());
		}

		// 删除字段为1的条件(即未删除)
		eql += " AND fg.exist =:exist ";
		args.put("exist", DataExistStatus.EXIST);
		// 根据排序结果进行排序
		eql += " ORDER BY fg.sn ASC ";
		Query query = session.createQuery(eql);
		Iterator<Map.Entry<String, Object>> iterator = args.entrySet()
				.iterator();
		while (iterator.hasNext()) {
			Map.Entry<String, Object> entry = iterator.next();
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return query;
	}

	/**
	 * 
	 * showFriendGroups 拼接显示好友组
	 * 
	 * @param lists
	 * @return
	 */
	private List<FriendGroupDTO> showFriendGroups(List<FriendGroup> lists) {
		List<FriendGroupDTO> list = new ArrayList<FriendGroupDTO>();
		for (FriendGroup friendGroup : lists) {
			FriendGroupDTO dto = new FriendGroupDTO();
			dto.setText(friendGroup.getName());
			dto.setValue(friendGroup.getId());
			list.add(dto);
		}
		return list;
	}

	@Override
	public void changeFriendGroup(List<Friend> friends) {
		fs.deleteFriendByGroup(friends.get(0).getFriendGroup().getId());
		if (friends != null && friends.size() != 0) {
			for (Friend f : friends) {
				fs.updateFriend(f);
			}
		}
	}

	@Override
	public void updateFriendGroups(List<FriendGroup> fgs) {
		for (FriendGroup fg : fgs) {
			updateFriendGroupSn(fg);
		}
	}

	@Override
	public void updateFriendGroupName(FriendGroup fg) {
		Session session = sessionFactory.getCurrentSession();
		String eql = "UPDATE FriendGroup fg SET fg.name = :name WHERE fg.id = :id";
		Query query = session.createQuery(eql);
		query.setParameter("name", fg.getName());
		query.setParameter("id", fg.getId());
		query.executeUpdate();
	}

	@Override
	public List<FriendGroupDTO> getFriendGroupDTOs(FriendGroupDTO fgDTO) {
		String eql = "FROM FriendGroup fg LEFT JOIN FETCH fg.belongUser WHERE 1=1 ";
		Query query = getSelectQuery(fgDTO, eql);
		List<FriendGroupDTO> list = showFriendGroups(query.list());
		return list;
	}

	@Override
	public FriendGroup getFriendGroupById(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM FriendGroup f WHERE f.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (FriendGroup) query.uniqueResult();
	}

	@Override
	public void deleteFriendGroup(String id) {
		Session session = sessionFactory.getCurrentSession();
//		fs.deleteFriendByGroup(id);
//		session.delete((session.get(FriendGroup.class, id)));
		
		// 逻辑删除
		FriendGroup friendGroup = (FriendGroup) session.load(FriendGroup.class,
				id);
		friendGroup.setExist(DataExistStatus.NOT_EXIST);
		session.saveOrUpdate(friendGroup);
		
	}

	/**
	 * 
	 * updateSql 修改好友组排序
	 * 
	 * @param fg
	 *         好友组
	 */
	private void updateSql(FriendGroup fg) {
		String sql = " UPDATE FriendGroup fg SET fg.sn =:sn WHERE fg.id =:id ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("sn", fg.getSn());
		query.setParameter("id", fg.getId());
		query.executeUpdate();
	}

	@Override
	public void sortFriendGroup(String ids) {
		String[] idArray = ids.split(",");
		for (int i = 0; i < idArray.length; i++) {
			FriendGroup fg = new FriendGroup();
			fg.setId(idArray[i]);
			fg.setSn(i);
			updateSql(fg);
		}
	}

}
