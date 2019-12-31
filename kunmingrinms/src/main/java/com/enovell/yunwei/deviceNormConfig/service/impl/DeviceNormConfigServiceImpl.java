package com.enovell.yunwei.deviceNormConfig.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.deviceNormConfig.dto.DeviceNormConfigDTO;
import com.enovell.yunwei.deviceNormConfig.service.DeviceNormConfigService;
import com.enovell.yunwei.emergency.domain.SpareNorm;
import com.enovell.yunwei.util.DataExistStatus;

/**      
 * 项目名称：kunmingrinms
 * 类名称：DeviceNormConfigServiceImpl   
 * 类描述:  应急备品指标接口实现类
 * 创建人：yangsy
 * 创建时间：2016-12-26
 */
@SuppressWarnings("unchecked")
@Service("deviceNormConfigService")
@Transactional
public class DeviceNormConfigServiceImpl implements DeviceNormConfigService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<SpareNorm> getSpareNorms(DeviceNormConfigDTO dto, int first, int max) {
		
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的eql
		String newEql = null;
		String eql = "FROM SpareNorm dnc " 
					+ " LEFT JOIN FETCH dnc.deviceName "
					+ " WHERE 1 = 1 ";
		// 拼装查询条件
		newEql = createSql(dto, eql, conditionMap);
		Query query = sessionFactory.getCurrentSession().createQuery(newEql);
		
		if(first != -1 && max != -1) {
			query.setFirstResult(first);
			query.setMaxResults(max);
		}
		for(String key: conditionMap.keySet()) {
			query.setParameter(key,	conditionMap.get(key));
		}
		return query.list();
	}
	@Override
	public long getSpareNormCount(DeviceNormConfigDTO dto) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String eql = "SELECT COUNT(dnc.id) FROM SpareNorm dnc where 1 = 1 "; 
		// 已经拼装好的eql
		String newEql = null;
		newEql = createSql(dto, eql, conditionMap)+ " ORDER BY dnc.deviceName DESC ";
		Query query = sessionFactory.getCurrentSession().createQuery(newEql);
		for(String key: conditionMap.keySet()) {
			query.setParameter(key,	conditionMap.get(key));
		}
		return ((Long) query.uniqueResult()).intValue();
	}
	/**
	 * createSql 拼装查询条件
	 * @param dto 查询条件
	 * @param eql 基本eql
	 * @param conditionMap 存放查询条件的键值
	 * @return 拼装好的eql
	 */
	private String createSql(DeviceNormConfigDTO dto, String eql, Map<String, Object> conditionMap) {
		if(dto == null) {
			return eql;
		}
		StringBuffer newEql = new StringBuffer();
		newEql.append(eql);
		// 删除字段为1的条件(即未删除)
		newEql.append(" AND dnc.exist =:exist ");
		conditionMap.put("exist", DataExistStatus.EXIST);
		if(dto.getDeviceType()!= null) {
			newEql.append("AND dnc.deviceName.deviceCategory = :deviceCategory ");
			conditionMap.put("deviceCategory", dto.getDeviceType());
		}
		if(dto.getDeviceConfig() != null) {
			
			newEql.append("AND dnc.deviceName.id = :id ");
			conditionMap.put("id", dto.getDeviceConfig().getId());
		}
		return newEql.toString();
	}
	/**
	 * 根据设备类别获取设备名称
	 */
	@Override
	public List<SpareNorm> getDeivceConfigByTypeId(String id) {
		if(id != ""){
			String eql = "FROM DeviceName dc "
				+ " WHERE dc.deviceCategory =:id "
				+ " AND dc.exist =:exist ";
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(eql);
			int typeId = Integer.valueOf(id);
			query.setParameter("id", typeId);
			query.setParameter("exist", DataExistStatus.EXIST);
			return query.list();
		}else{
			return null;
		}
	}
	@Override
	public SpareNorm addSpareNorm(SpareNorm dnc) {
		sessionFactory.getCurrentSession().persist(dnc);
		return dnc;
	}
	@Override
	public SpareNorm getSpareNormById(String id) {
		String eql = "FROM SpareNorm dnc " 
						+ " LEFT JOIN FETCH dnc.deviceName "
						+ "WHERE dnc.id =:id ";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("id", id);
		return (SpareNorm) query.uniqueResult();
	}
	@Override
	public SpareNorm updateSpareNorm(SpareNorm dnc) {
		sessionFactory.getCurrentSession().merge(dnc);
		return dnc;
	}
	
	/**
	 * 
	 * deleteDeviceNormConfigsById 根据id,删除数据
	 * @param ids
	 */
	private  void deleteDeviceNormConfigsById(List<String> ids){
		for (int i = 0; i < ids.size(); i++) {
			try {
				String hql = "DELETE DeviceName d WHERE d.id =:id";
				Session session= sessionFactory.getCurrentSession();
				session.createQuery(hql).setParameter("id", ids.get(i)).executeUpdate();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void deleteDeviceNormConfigs(List<String> ids) {
//		deleteDeviceNormConfigsById(ids);
		delDeviceNormConfigsById(ids);
	}
	
	/**
	 * 
	 * delDeviceNormConfigsById 逻辑删除
	 * @param ids
	 */
	private void delDeviceNormConfigsById(List<String> ids) {
		if (ids != null && ids.size() != 0) {
			for (String id : ids) {
				SpareNorm spareNorm = (SpareNorm) sessionFactory
						.getCurrentSession().load(SpareNorm.class, id);
				spareNorm.setExist(DataExistStatus.NOT_EXIST);
				sessionFactory.getCurrentSession().saveOrUpdate(spareNorm);
			}
		}
	}
	
	@Override
	public boolean checkNorm(String name) {
		String eql = "FROM SpareNorm dnc " 
				+ " LEFT JOIN FETCH dnc.deviceName "
				+ "WHERE dnc.deviceName.id =:id AND dnc.exist =:exist";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("id", name);
		query.setParameter("exist", DataExistStatus.EXIST);
//		SpareNorm result = (SpareNorm) query.uniqueResult();
		List<SpareNorm> result = query.list();
		if (result != null) {
			for (SpareNorm spareNorm : result) {
				if(spareNorm.getNormValue() != null) {
					return true;
				}
			}
			return false;
//			if(result.getNormValue()!=null){
//				return true;
//			}else{				
//				return false;
//			}
		} else {
			return false;
		}
	}
	
}
