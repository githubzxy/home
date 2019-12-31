
/**   
 * 文件名：SpareUseStockService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 下午5:14:27   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.service.impl;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.dailySpare.domain.DailySparePart;
import com.enovell.yunwei.dailySpare.domain.DailySpareUseStock;
import com.enovell.yunwei.dailySpare.service.DailySpareUseStockService;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareUseStockService   
 * 类描述:  日常备品使用记录 接口实现类
 * 创建人：ltf 
 * 创建时间：2016-11-30 下午5:14:27
 * 修改人：ltf
 * 修改时间：2016-11-30 下午5:14:27   
 *    
 */
@SuppressWarnings("unchecked")
@Service("dailySpareUseStockService")
@Transactional
public class DailySpareUseStockServiceImpl implements DailySpareUseStockService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public DailySpareUseStock addSpareUseStock(DailySpareUseStock useStock) {
		useStock.setDate(new Date());//更新使用时间
		sessionFactory.getCurrentSession().save(useStock);
		return useStock;
	}

	@Override
	public DailySpareUseStock addSpareUseStock(Double amount, String reason, User user, DailySparePart dailySparePart, String state){
		DailySpareUseStock useStock = new DailySpareUseStock();
		useStock.setAmount(amount);
		useStock.setReason(reason);
		useStock.setUser(user);
		useStock.setDailySparePart(dailySparePart);
		useStock.setState(state);
		useStock.setDate(new Date());//使用时间为当前时间
		sessionFactory.getCurrentSession().save(useStock);
		return useStock;
	}
	
	@Override
	public void deleteSpareUseStockBySparePart(List<DailySparePart> dailySparePartList) {
		String hql=" delete from SpareUseStock sus where sus.dailySparePart in (:sparePartList) ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("sparePartList", dailySparePartList).executeUpdate();//删除指定日常备品的所有使用记录
		
	}
	
	@Override
	public List<DailySpareUseStock> getSpareUseStockBySparePartId(String sparePartId, String state, int start, int limit) {
		String hql = " FROM DailySpareUseStock e "
				+ " LEFT JOIN FETCH e.user " 
				+ " LEFT JOIN FETCH e.dailySparePart sp "
				+ " WHERE sp.id =:sparePartId " ;
		if(StringUtils.isNotBlank(state)){
			hql +=" AND e.state =:state " ;
		}
		hql +=" ORDER by e.date DESC";
		
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		if(StringUtils.isNotBlank(state)){
			query.setParameter("state", state);
		}
		query.setParameter("sparePartId", sparePartId);
		query.setFirstResult(start);
		query.setMaxResults(limit);
		return query.list();
	}

	@Override
	public Long getSpareUseStockCountBySparePartId(
			String sparePartId, String state) {
		String hql = " SELECT count(*) FROM DailySpareUseStock e "
						+ " WHERE e.dailySparePart.id =:sparePartId ";
		if(StringUtils.isNotBlank(state)){
			hql +=" AND e.state =:state " ;
		}
		
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		if(StringUtils.isNotBlank(state)){
			query.setParameter("state", state);
		}
		query.setParameter("sparePartId", sparePartId);
		return (Long)query.uniqueResult();
	}
	
}
