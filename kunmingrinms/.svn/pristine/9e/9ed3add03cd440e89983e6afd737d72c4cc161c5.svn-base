package com.enovell.yunwei.deviceUnitConfig.service.impl;

import com.enovell.yunwei.deviceUnitConfig.domain.DeviceUnitConfig;
import com.enovell.yunwei.deviceUnitConfig.service.DeviceUnitConfigService;
import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

@SuppressWarnings("unchecked")
@Service("deviceUnitConfigService")
@Transactional
public class DeviceUnitConfigServiceImpl implements DeviceUnitConfigService{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<DeviceUnitConfig> getUnitData(DeviceUnitConfig duc, int first, int max){
		String eql = "FROM DeviceUnitConfig duc "+"WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(duc, eql, map)+ " ORDER BY duc.createDate DESC  ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<DeviceUnitConfig> list = query.list();
		return list;
	}
	@Override
	public long getCount(DeviceUnitConfig duc){
		String eql = "SELECT COUNT(duc.id) FROM DeviceUnitConfig duc WHERE 1=1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(duc, eql, map);
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	private String createSql(DeviceUnitConfig duc,String sql,Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
		//删除字段为1的条件(即未删除)
		buffer.append(" AND duc.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		if (duc != null) {
			if (duc.getUnit() != null && duc.getUnit().length() != 0) {
				buffer.append("AND duc.unit like :unit ");
				map.put("unit", "%" + duc.getUnit() + "%");
			}
		}
		return buffer.toString();
	}
	
	@Override
	public DeviceUnitConfig getUnitById(String id) {
		String hql = "FROM DeviceUnitConfig d "
				+ " WHERE d.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", Integer.valueOf(id));
		return (DeviceUnitConfig) query.uniqueResult();
	}
	
	@Override
	public DeviceUnitConfig addUnit(DeviceUnitConfig duc) {
		if(duc != null){
			sessionFactory.getCurrentSession().persist(duc);
			return duc;
		}
		return null;
	}
	
	@Override
	public void deleteDeviceUnitConfigs(String ids) {
		deleteDeviceUnitConfigsById(ids);
	}
	
	/**
	 * 
	 * deleteDeviceUnitConfigsById 逻辑删除
	 * @param ids
	 */
	private void deleteDeviceUnitConfigsById(String ids) {
		String hql = "update DeviceUnitConfig set exist =:exist where id in (" + ids + ")";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("exist", DataExistStatus.NOT_EXIST);
		query.executeUpdate();
	}
	
	@Override
	public List<DeviceUnitConfig> getUnits() {
		String hql = "FROM DeviceUnitConfig";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		return query.list();
	}
	@Override
	public List<DeviceUnitConfig> getExistUnits() {
		String hql = "FROM DeviceUnitConfig duc WHERE duc.exist = :exist";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("exist", DataExistStatus.EXIST);
		return query.list();
	}
	@Override
	public BigDecimal getMaxIdNum() {
		String sql = "select max(id_) from deviceunit_";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
//		return ((Integer) query.uniqueResult()).intValue();
		return (BigDecimal) query.uniqueResult();
	}
	
}
