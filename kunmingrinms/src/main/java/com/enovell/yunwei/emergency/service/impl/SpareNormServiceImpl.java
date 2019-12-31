
/**   
 * 文件名：SpareNormServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-2 上午10:28:11   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.service.impl;

import com.enovell.yunwei.emergency.domain.SpareNorm;
import com.enovell.yunwei.emergency.service.SpareNormService;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareNormServiceImpl   
 * 类描述:  应急备品指标 接口实现类
 * 创建人：ltf 
 * 创建时间：2016-12-2 上午10:28:11
 * 修改人：ltf
 * 修改时间：2016-12-2 上午10:28:11   
 *    
 */
@SuppressWarnings("unchecked")
@Service("spareNormService")
@Transactional
public class SpareNormServiceImpl implements SpareNormService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<SpareNorm> getAllSpareNorms() {
		String hql = " FROM SpareNorm sn "
					+ " LEFT JOIN FETCH sn.deviceName dn "
//					+ " LEFT JOIN FETCH dn.deviceCategory "
					+ " WHERE 1=1 ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}
