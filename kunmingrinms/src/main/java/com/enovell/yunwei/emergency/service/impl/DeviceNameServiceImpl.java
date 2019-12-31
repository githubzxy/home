
/**   
 * 文件名：DeviceNameServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-29 下午10:54:42   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.service.impl;

import com.enovell.yunwei.emergency.domain.DeviceName;
import com.enovell.yunwei.emergency.service.DeviceNameService;
import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**      
 * 项目名称：kunmingrinms
 * 类名称：DeviceNameServiceImpl   
 * 类描述:  设备配置-接口实现类
 * 创建人：ltf 
 * 创建时间：2016-11-29 下午10:54:42
 * 修改人：ltf
 * 修改时间：2016-11-29 下午10:54:42   
 *    
 */
@SuppressWarnings("unchecked")
@Service("deviceNameService")
@Transactional
public class DeviceNameServiceImpl implements DeviceNameService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<DeviceName> getDeviceNamesByDeviceCategory(Integer deviceCategory) {
		if(deviceCategory == null){
			return null;
		}
		String hql = " FROM DeviceName e " 
					+" WHERE e.deviceCategory =:deviceCategory " 
					+" AND e.exist =:exist " 
					+" ORDER by e.name ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("deviceCategory", deviceCategory);
		query.setParameter("exist", DataExistStatus.EXIST);
		return  query.list();
	}

	@Override
	public DeviceName getDeviceNameById(String id) {
		String hql = "FROM DeviceName e WHERE e.id =:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		return  (DeviceName)query.uniqueResult();
	}

}
