
/**   
 * 文件名：TaskRootHistoryServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-20 上午11:08:18   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.service;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.taskManage.domain.TaskRoot;
import com.enovell.yunwei.taskManage.domain.TaskRootHistory;
import com.enovell.yunwei.taskManage.service.TaskRootHistoryService;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootHistoryServiceImpl   
 * 类描述:  历史任务 接口实现类
 * 创建人：ltf 
 * 创建时间：2016-12-20 上午11:08:18
 * 修改人：ltf
 * 修改时间：2016-12-20 上午11:08:18   
 *    
 */
@Transactional
@Service("taskRootHistoryService")
public class TaskRootHistoryServiceImpl implements TaskRootHistoryService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public TaskRootHistory addTaskHistory(String beginStatus, String endStatus,
									TaskRoot task, User transactUser, String remarks) {
		TaskRootHistory taskHistory = new TaskRootHistory();
		taskHistory.setBeginStatus(beginStatus);
		taskHistory.setEndStatus(endStatus);
		taskHistory.setTask(task);
		taskHistory.setTransactUser(transactUser);
		taskHistory.setRemarks(remarks);
		taskHistory.setFinishDate(new Date());
		sessionFactory.getCurrentSession().save(taskHistory);
		return taskHistory;
	}

	@Override
	public void deleteTaskHistoryByTask(TaskRoot task) {
		String hql = " DELETE FROM TaskRootHistory h WHERE  h.task = :task ";
		Query query  = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("task", task).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TaskRootHistory> getAllTaskHistoryByTask(TaskRoot task) {
		String hql = "FROM TaskRootHistory h " 
						+ " LEFT JOIN FETCH h.task t "
						+ " LEFT JOIN FETCH h.transactUser u "
						+ " LEFT JOIN FETCH u.organization "
						+ " WHERE h.task =:task " 
						+ " ORDER BY h.finishDate ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("task", task);
		return query.list();
	}

}
