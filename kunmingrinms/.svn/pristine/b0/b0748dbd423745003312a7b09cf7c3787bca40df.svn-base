
/**   
 * 文件名：SpareUseStockService.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 下午5:14:27   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.service.impl;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.emergency.domain.SparePart;
import com.enovell.yunwei.emergency.domain.SpareUseStock;
import com.enovell.yunwei.emergency.service.SpareUseStockService;
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
 * 类描述:  应急备品使用记录 接口实现类
 * 创建人：ltf 
 * 创建时间：2016-11-30 下午5:14:27
 * 修改人：ltf
 * 修改时间：2016-11-30 下午5:14:27   
 *    
 */
@SuppressWarnings("unchecked")
@Service("spareUseStockService")
@Transactional
public class SpareUseStockServiceImpl implements SpareUseStockService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public SpareUseStock addSpareUseStock(SpareUseStock useStock) {
		useStock.setDate(new Date());//更新使用时间
		sessionFactory.getCurrentSession().save(useStock);
		return useStock;
	}

	@Override
	public SpareUseStock addSpareUseStock(Double amount, String reason, User user, SparePart sparePart, String state){
		SpareUseStock useStock = new SpareUseStock();
		useStock.setAmount(amount);
		useStock.setReason(reason);
		useStock.setUser(user);
		useStock.setSparePart(sparePart);
		useStock.setState(state);
		useStock.setDate(new Date());//使用时间为当前时间
		sessionFactory.getCurrentSession().save(useStock);
		return useStock;
	}
	
	@Override
	public void deleteSpareUseStockBySparePart(List<SparePart> sparePartList) {
		String hql=" delete from SpareUseStock sus where sus.sparePart in (:sparePartList) ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("sparePartList", sparePartList).executeUpdate();//删除指定应急备品的所有使用记录
		
	}
	
	@Override
	public List<SpareUseStock> getSpareUseStockBySparePartId(String sparePartId, String state,int start,int limit) {
		String hql = " FROM SpareUseStock e "
				+ " LEFT JOIN FETCH e.user " 
				+ " LEFT JOIN FETCH e.sparePart sp "
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
		String hql = " SELECT count(*) FROM SpareUseStock e "
						+ " WHERE e.sparePart.id =:sparePartId ";
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
