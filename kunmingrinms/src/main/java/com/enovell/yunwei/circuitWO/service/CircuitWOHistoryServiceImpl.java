package com.enovell.yunwei.circuitWO.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.circuitWO.domain.CircuitWOHistory;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Transactional
@Service("circuitWOHistoryService")
public class CircuitWOHistoryServiceImpl implements CircuitWOHistoryService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public CircuitWOHistory addCircuitWOHistory(String beginStatus, String endStatus, CircuitWO task, User transactUser, String remarks) {
		CircuitWOHistory taskHistory = new CircuitWOHistory();
		taskHistory.setBeginStatus(beginStatus);
		taskHistory.setEndStatus(endStatus);
		taskHistory.setTask(task);
		taskHistory.setTransactUser(transactUser);
		taskHistory.setRemarks(remarks);
		taskHistory.setFinishDate(new Date());
		sessionFactory.getCurrentSession().save(taskHistory);
		return taskHistory;
	}

}
