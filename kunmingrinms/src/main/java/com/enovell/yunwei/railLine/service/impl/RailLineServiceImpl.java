package com.enovell.yunwei.railLine.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.railLine.service.RailLineService;

/**      
 * 项目名称：kunmingrinms
 * 类名称：RailLineServiceImpl   
 * 类描述:  线路 接口实现类
 * 创建人：ltf
 * 创建时间：2016-11-24 下午16:40:15
 * 修改人：ltf
 * 修改时间：2016-11-24 下午16:40:15
 */
@Transactional
@Service("railLineService")
public class RailLineServiceImpl implements RailLineService {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<String> getRailLineNames(){
		String sql=" select rl.name_ from res_base_rail_line rl " ;
		Query query=sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<String> railLineNames=query.list();
		return railLineNames;
	}

	@Override
	public boolean isExistsRailLineName(String railLineName) {
		String sql = " select rl.name_ from res_base_rail_line rl where rl.name_ =:railLineName " ;
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("railLineName", railLineName);
		String name = (String) query.uniqueResult();
		if (name != null && !name.equals("")) {
			return true;
		}
		return false;
	}
}
