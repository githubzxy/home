/**   
 * 文件名：TechnicalRegulationService.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-9-26 上午11:19:40   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.technical.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.technical.domain.TechnicalRegulation;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;
import com.enovell.yunwei.technical.service.TechnicalRegulationService;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 项目名称：kunmingrinms 类名称：TechnicalRegulationServiceImpl 类描述: 技术规章接口实现类 创建人：zhangsihong
 * 创建时间：2013-9-26 上午11:19:40 修改人：zhangsihong 修改时间：2013-9-26 上午11:19:40
 * 
 */
@SuppressWarnings("unchecked")
@Service("TechnicalRegulationService")
@Transactional
public class TechnicalRegulationServiceImpl implements
		TechnicalRegulationService {

	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	@Override
	public TechnicalRegulation addTechnicalRegulation(
			TechnicalRegulation technicalRegulation,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, technicalRegulation.getCreateUser());
			technicalRegulation.setAttachFile(attachFile);
		}
		sessionFactory.getCurrentSession().save(technicalRegulation);
		return technicalRegulation;
	}

	@Override
	public TechnicalRegulation updateTechnicalRegulation(
			TechnicalRegulation technicalRegulation,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, technicalRegulation.getCreateUser());
			technicalRegulation.setAttachFile(attachFile);
		} else {
			// 上传文件为空
			technicalRegulation.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().saveOrUpdate(technicalRegulation);
		return technicalRegulation;
	}

	@Override
	public TechnicalRegulation getTechnicalRegulationById(String id) {
		String hql = "FROM TechnicalRegulation t "
				+ " LEFT JOIN FETCH t.depart "
				+ " LEFT JOIN FETCH t.createUser "
				+ " LEFT JOIN FETCH t.attachFile "
				+ " LEFT JOIN FETCH t.attachFile.files " + " WHERE t.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (TechnicalRegulation) query.uniqueResult();
	}

	/**
	 * 
	 * deleteTechnicalRegulation 删除操作
	 * 
	 * @param id
	 */
	public void deleteTechnicalRegulation(String id) {
		TechnicalRegulation technicalRegulation = getTechnicalRegulationById(id);
		technicalRegulation.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(technicalRegulation);
//		try {
//			AttachFile attachFile = technicalRegulation.getAttachFile();
//			// 删除技术资料
//			Session session = sessionFactory.getCurrentSession();
//			String hql = "delete TechnicalRegulation " + " where id =:id";
//			session.createQuery(hql).setParameter("id", id).executeUpdate();
//			if (attachFile != null) {
//				String attachFileId = attachFile.getId();
//				// 删除附件
//				attachFileService.deleteAttachFile(attachFileId);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	@Override
	public void deleteTechnicalRegulations(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
			deleteTechnicalRegulation(id);
		}
	}

	@Override
	public List<TechnicalRegulation> getTechnicalRegulations(
			TechnicalInfoDTO technicalInfoDTO, int first, int max) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的hql
		String newHql = null;
		String hql = "FROM TechnicalRegulation t "
				+ " LEFT JOIN FETCH t.depart "
				+ " WHERE t.exist=:exist ";
		// 拼装查询条件
		newHql = createSql(technicalInfoDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setFirstResult(first);
		query.setMaxResults(max);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		return query.list();
	}

	/**
	 * 
	 * createSql 拼装查询条件
	 * 
	 * @param technicalInfoDTO
	 *            竣工和技术图纸的资料查询条件
	 * @param hql
	 *            基本hql
	 * @param conditionMap
	 *            存放查询条件的键值
	 * @return 拼装好的hql
	 */
	private String createSql(TechnicalInfoDTO dto, String hql,
			Map<String, Object> conditionMap) {
		if (dto == null) {
			return hql;
		}
		StringBuffer newHql = new StringBuffer();
		newHql.append(hql);
		if (StringUtils.isNotEmpty(dto.getName())) {
			newHql.append("AND t.name like :name ");
			conditionMap.put("name", "%" + dto.getName() + "%");
		}
		if (dto.getTechnicalInfoType() != null) {
			newHql.append("AND t.technicalInfoType = :technicalInfoType ");
			conditionMap.put("technicalInfoType", dto.getTechnicalInfoType());
		}
		if (dto.getRailLine() != null) {
			newHql.append("AND t.railLine = :railLine ");
			conditionMap.put("railLine", dto.getRailLine());
		}
		if (dto.getDepart() != null) {
			newHql.append("AND t.depart = :depart ");
			conditionMap.put("depart", dto.getDepart());
		}
		if (dto.getCreateStartDate() != null) {
			newHql.append("AND t.createDate >= :createStartDate ");
			conditionMap.put("createStartDate", dto.getCreateStartDate());
		}
		if (dto.getCreateEndDate() != null) {
			newHql.append("AND t.createDate <= :createEndDate ");
			conditionMap.put("createEndDate", dto.getCreateEndDate());
		}
		newHql.append("ORDER BY t.createDate DESC ");
		return newHql.toString();
	}

	@Override
	public int getTechnicalRegulationCount(TechnicalInfoDTO technicalInfoDTO) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String eql = "SELECT COUNT(t.id) FROM TechnicalRegulation t WHERE t.exist=:exist ";
		// 已经拼装好的hql
		String newHql = null;
		newHql = createSql(technicalInfoDTO, eql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("exist", DataExistStatus.EXIST);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		return ((Long) query.uniqueResult()).intValue();
	}

}
