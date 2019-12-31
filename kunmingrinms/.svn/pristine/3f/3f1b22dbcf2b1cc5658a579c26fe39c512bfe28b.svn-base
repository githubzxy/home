package com.enovell.yunwei.dispathRoot.service.impl;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.dispathRoot.domain.DispatchRootHistory;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.dispathRoot.service.DispathRootHistoryService;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathRootHistoryServiceImpl   
 * 类描述:  调度管理历史操作实现
 * 创建人：lidt 
 * 创建时间：2016-12-16 上午10:31:10
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:31:10   
 *
 */
@Transactional
@Service("DispathRootHistoryService")
public class DispathRootHistoryServiceImpl implements DispathRootHistoryService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public DispatchRootHistory createHistory(String beginStatus, String endStatus, DispathRoot dispatchRoot, User transactUser,
			String remarks, int time) {
		DispatchRootHistory history = new DispatchRootHistory();
		history.setBeginStatus(beginStatus);
		history.setEndStatus(endStatus);
		history.setDispatchRoot(dispatchRoot);
		history.setRemarks(remarks);
		history.setTransactUser(transactUser);
		history.setFinishDate(new Date());
		sessionFactory.getCurrentSession().save(history);
		return history;
	}

	@Override
	public void deleteHistoryByObj(DispathRoot dispatch) {
		String sql = " DELETE FROM DispatchRootHistory dh WHERE  dh.dispatchRoot = :dispatch ";
		Query query  = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("dispatch", dispatch);
		query.executeUpdate();
	}

}
