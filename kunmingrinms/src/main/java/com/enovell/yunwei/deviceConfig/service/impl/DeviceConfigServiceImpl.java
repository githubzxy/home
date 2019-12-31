package com.enovell.yunwei.deviceConfig.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.common.dto.ResultMsg;
import com.enovell.yunwei.deviceConfig.dto.DeviceConfigDTO;
import com.enovell.yunwei.deviceConfig.service.DeviceConfigService;
import com.enovell.yunwei.emergency.domain.DeviceName;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.SqlUtil;

@SuppressWarnings("unchecked")
@Service("deviceConfigService")
@Transactional
public class DeviceConfigServiceImpl implements DeviceConfigService{
	
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private NamedParameterJdbcTemplate nj;
	
	@Override
	public List<DeviceName> getDeviceCfByDTO(DeviceConfigDTO dto, int first, int max){
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = " SELECT " +
				" 	    dc.*, " +
				" 	    du.unit_ " +
				" 	FROM " +
				" 	    devicename_ dc, " +
				" 	    deviceunit_ du " +
				" 	WHERE " +
				" 	    dc.unitid_ = du.id_ " +
				" 	    AND   dc.exist_ = :exist " +
				" 	    AND   du.exist_ = :exist ";
		map.put("exist", DataExistStatus.EXIST);
		if (dto != null) {
			if (StringUtils.isNotBlank(dto.getName())) {
				sql += " AND dc.NAME_ like :name ";
				map.put("name", "%" + dto.getName() + "%");
			}
			if (dto.getDeviceCategory()!=null){
				sql += "AND dc.DEVICECATEGORYID_ =:type ";
				map.put("type", dto.getDeviceCategory());
			}
		}
		sql = SqlUtil.buildPagingSql(sql, map, first, max);
		List<DeviceName> list = nj.queryForList(sql, map).stream().map(s->{
			DeviceName d = new DeviceName();
			d.setId(String.valueOf(s.get("ID_")));
			d.setName(String.valueOf(s.get("NAME_")));
			d.setUnit(Integer.parseInt(s.get("UNITID_").toString()));
			d.setDeviceCategory(Integer.parseInt(s.get("DEVICECATEGORYID_").toString()));
			d.setExist(Boolean.getBoolean(s.get("EXIST_").toString()));
			
			if(s.get("CREATE_TIME_")!=null) {
				SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				Date date = new Date();
				try {
					date = sdf.parse(s.get("CREATE_TIME_").toString());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				d.setCreateTime(date);
			}
			return d;
		}).collect(Collectors.toList());
		return list;
	}
	
	@Override
	public List<DeviceName> getDeviceConfigByDTO(DeviceConfigDTO dto, int first, int max){
		String eql = "FROM DeviceName dc "+"WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(dto, eql, map)+ " ORDER BY dc.createTime DESC  ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<DeviceName> list = query.list();
		return list;
	}
	@Override
	public long getDeviceConfigCount(DeviceConfigDTO dto){
		String eql = "SELECT COUNT(dc.id_) FROM devicename_ dc ,"+
				" 	    deviceunit_ du " +
				" 	WHERE " +
				" 	    dc.unitid_ = du.id_ " +
				" AND dc.exist_ =:exist "+
				" 	    AND   du.exist_ = :exist ";
		Map<String, Object> map = new HashMap<String, Object>();
		// 删除字段为1的条件(即未删除)
		map.put("exist", DataExistStatus.EXIST);
		if (dto != null) {
			if (dto.getName() != null && dto.getName().length() != 0) {
				eql += "AND dc.name_ like :name ";
				map.put("name", "%" + dto.getName() + "%");
			}
			if (dto.getDeviceCategory()!=null){
				eql +="AND dc.DEVICECATEGORYID_=:type ";
				map.put("type", dto.getDeviceCategory());
			}
		}
		Long  result = nj.queryForObject(eql, map,Long.class);
		return result;
	}
	private String createSql(DeviceConfigDTO dto,String sql,Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
		// 删除字段为1的条件(即未删除)
		buffer.append(" AND dc.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		if (dto != null) {
			if (dto.getName() != null && dto.getName().length() != 0) {
				buffer.append("AND dc.name like :name ");
				map.put("name", "%" + dto.getName() + "%");
			}
			if (dto.getDeviceCategory()!=null){
				buffer.append("AND dc.deviceCategory=:type ");
				map.put("type", dto.getDeviceCategory());
			}
		}
		return buffer.toString();
	}
	@Override
	public ResultMsg addDeviceConfig(DeviceName dc) {
		if(dc != null){
			try {
				sessionFactory.getCurrentSession().persist(dc);
			} catch (Exception e) {
				e.printStackTrace();
				return ResultMsg.getFailure("新增失败!", null);
			}
			return ResultMsg.getSuccess("新增成功!", null);
		}
		return ResultMsg.getFailure("新增失败!", null);
	}
	@Override
	public DeviceName getDeviceConfigById(String id) {
		if(id != ""){
			String eql = "FROM DeviceName dc " + "WHERE dc.id =:id";
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(eql);
			query.setParameter("id", id);
			return (DeviceName) query.uniqueResult();
		}else{
			return null;
		}
	}
	@Override
	public ResultMsg updateDeviceConfig(DeviceName deviceConfig) {
		if(deviceConfig != null){
			try {
				sessionFactory.getCurrentSession().merge(deviceConfig);
			} catch (Exception e) {
				return ResultMsg.getFailure("修改失败!", null);
			}
			return ResultMsg.getSuccess("修改成功!", null);
		}else{
			return ResultMsg.getFailure("修改失败!", null);
		}
	}
	
	/**
	 * 
	 * deleteDeviceConfigsById 根据id,删除数据
	 * @param ids
	 * @return
	 */
	private String deleteDeviceConfigsById(List<String> ids)throws Exception{
		Session session= sessionFactory.getCurrentSession();
		try {
			for (int i = 0; i < ids.size(); i++) {

				String sql = "DELETE SPARE_NORM d WHERE d.DEVICE_NAME_ID =:id";
				Query query = session.createSQLQuery(sql);
				query.setParameter("id", ids.get(i));
				
				String sql1 = "DELETE DEVICENAME_ d WHERE d.ID_ =:id";
				Query query1 = session.createSQLQuery(sql1);
				query1.setParameter("id", ids.get(i));
				
				query.executeUpdate();
				query1.executeUpdate();
			}
		} catch (Exception e) {	
			e.printStackTrace();
			throw e;
		}
		
		return "";
	}
	
	@Override
//	@Transactional(rollbackFor=Exception.class)
	public String deleteDeviceConfigs(List<String> ids) throws Exception {
//		deleteDeviceConfigsById(ids);
		delDeviceConfigsById(ids);
		return "";
		
	}
	
	/**
	 * 
	 * delDeviceConfigsById 逻辑删除
	 * @param ids
	 * @return
	 */
	private String delDeviceConfigsById(List<String> ids){
		if (ids != null && ids.size() != 0) {
			for (String id : ids) {
				DeviceName deviceName = (DeviceName) sessionFactory
						.getCurrentSession().load(DeviceName.class, id);
				deviceName.setExist(DataExistStatus.NOT_EXIST);
				sessionFactory.getCurrentSession().saveOrUpdate(deviceName);
			}
		}
		return "";
	}
	
	@Override
	public boolean checkName(String name, Integer type) {
		
		String eql = "SELECT COUNT(dc.id) FROM DeviceName dc WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(name, type, eql, map);
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		int result = ((Long) query.uniqueResult()).intValue();
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}
	private String createSql(String name, Integer type, String sql,Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
//		if (name != null && name.length() != 0 && type != null) {
//			buffer.append("AND dc.name like :name ");
//			map.put("name", name);
//			buffer.append("AND dc.deviceCategory=:type ");
//			map.put("type", type);
//		}
		buffer.append("AND dc.name like :name ");
		map.put("name", name);
		buffer.append("AND dc.deviceCategory=:type ");
		map.put("type", type);
		// 删除字段为1的条件(即未删除)
		buffer.append(" AND dc.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		return buffer.toString();
	}

//	@Override
//	public DeviceName getDeviceNameByName(String name) {
//		DeviceName deviceName = new DeviceName();
//		if(name != null){
//			String eql = "FROM DeviceName e " +
//					"LEFT JOIN FETCH e.deviceCategory " +
//					"LEFT JOIN FETCH e.unit " +
//					"WHERE e.name =:name";
//			Query query = entityManager.createQuery(eql);
//			query.setParameter("name", name);
//			deviceName = (DeviceName)query.getSingleResult();
//		}
//		return deviceName;
//	}
//
//	@Override
//	public List<DeviceName> getAllDeviceNames() {
//		String eql = "FROM DeviceName e " +
//				"LEFT JOIN FETCH e.deviceCategory " +
//				"LEFT JOIN FETCH e.unit ";
//		Query query = entityManager.createQuery(eql);
//		return query.getResultList();
//	}
//
//	
//	
//	@Override
//	public List<DeviceName> getDeviceNamesByDeviceCategory(
//			DeviceCategory deviceCategory) {
//		if(deviceCategory == null){
//			return null;
//		}
//		String eql = "FROM DeviceName e " +
//				"LEFT JOIN FETCH e.deviceCategory " +
//				"LEFT JOIN FETCH e.unit " +
//				"WHERE e.deviceCategory =:deviceCategory";
//		Query query = entityManager.createQuery(eql);
//		query.setParameter("deviceCategory", deviceCategory);
//		List<DeviceName> list = query.getResultList();
//		return ArraySort.sortListByChina(list, "getName");
//	}
//
//
//	@Override
//	public void deleteDeviceName(String id) {
//		DeviceName typeDeviceName = getDeviceNameById(id);
//		if(typeDeviceName != null){
//			entityManager.remove(typeDeviceName);
//		}
//	}
//
//	@Override
//	public void deleteDeviceName(DeviceName deviceName) {
//		deleteDeviceName(deviceName.getId());
//	}
//
//	@Override
//	public void deleteDeviceNames(String[] ids) {
//		for(int i = 0;i<ids.length;i++){
//			deleteDeviceName(ids[i]);
//		}
//	}
//
//	@Override
//	public void deleteDeviceNames(List<DeviceName> deviceNameList) {
//		for(DeviceName deviceName:deviceNameList){
//			deleteDeviceName(deviceName);
//		}
//	}
//	
//	@Override
//	public int deleteDeviceNameByIds(List<String> ids){
//		if (ids == null || ids.size() < 1) {
//			return 0;
//		}
//		String jpql = "Delete From DeviceName dn Where dn.id In (:ids)";
//		Query query = entityManager.createQuery(jpql);
//		query.setParameter("ids", ids);
//		return query.executeUpdate();
//	}
}
