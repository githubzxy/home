
/**   
 * 文件名：SpareNormServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-2 上午10:28:11   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.service.impl;

import com.enovell.yunwei.dailySpare.domain.DailySpareNorm;
import com.enovell.yunwei.dailySpare.service.DailySpareNormService;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareNormServiceImpl   
 * 类描述:  日常备品指标 接口实现类
 * 创建人：ltf 
 * 创建时间：2016-12-2 上午10:28:11
 * 修改人：ltf
 * 修改时间：2016-12-2 上午10:28:11   
 *    
 */
@SuppressWarnings("unchecked")
@Service("dailySpareNormService")
@Transactional
public class DailySpareNormServiceImpl implements DailySpareNormService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<DailySpareNorm> getAllSpareNorms() {
		String hql = " FROM DailySpareNorm sn "
					+ " LEFT JOIN FETCH sn.dailyDeviceName dn "
//					+ " LEFT JOIN FETCH dn.deviceCategory "
					+ " WHERE 1=1 ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}
