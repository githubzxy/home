/**   
 * 文件名：TechnicalInfoServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2012-9-3 下午01:19:04   
 * Copyright Enovell Corporation 2012    
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
import com.enovell.yunwei.technical.domain.TechnicalInfo;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;
import com.enovell.yunwei.technical.service.TechnicalInfoService;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 项目名称：kunmingrinms 类名称：技术资料 类描述: 创建人：zhangsihong 创建时间：2012-9-3 下午01:19:04
 * 修改人：zhangsihong 修改时间：2012-9-3 下午01:19:04
 * 
 */
@SuppressWarnings("unchecked")
@Service("TechnicalInfoService")
@Transactional
public class TechnicalInfoServiceImpl implements TechnicalInfoService {

	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	@Override
	public TechnicalInfo addTechnicalInfo(TechnicalInfo technicalInfo,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, technicalInfo.getCreateUser());
			technicalInfo.setAttachFile(attachFile);
		}
		sessionFactory.getCurrentSession().save(technicalInfo);
		return technicalInfo;
	}

	@Override
	public TechnicalInfo updateTechnicalInfo(TechnicalInfo technicalInfo,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, technicalInfo.getUpdateUser());
			technicalInfo.setAttachFile(attachFile);
		} else {
			// 上传文件为空
			technicalInfo.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().saveOrUpdate(technicalInfo);
		return technicalInfo;
	}

	@Override
	public TechnicalInfo getTechnicalInfoById(String id) {
		String hql = "FROM TechnicalInfo t "
				+ " LEFT JOIN FETCH t.depart "
				+ " LEFT JOIN FETCH t.createUser "
				+ " LEFT JOIN FETCH t.attachFile "
				+ " LEFT JOIN FETCH t.attachFile.files"
				+ " WHERE t.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (TechnicalInfo) query.uniqueResult();
	}

	/**
	 * 
	 * deleteTechnicalInfo 删除操作
	 * @param id
	 */
	public void deleteTechnicalInfo(String id) {
		TechnicalInfo technicalInfo = getTechnicalInfoById(id);
		technicalInfo.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(technicalInfo);
//		technicalInfo.setIsDelete();
//		try {
//			AttachFile attachFile = technicalInfo.getAttachFile();
//			// 删除技术资料
//			Session session = sessionFactory.getCurrentSession();
//			String hql = "delete TechnicalInfo " + " where id =:id";
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
	public void deleteTechnicalInfo(TechnicalInfo completionInfo) {

		if (completionInfo == null) {
			return;
		}
		deleteTechnicalInfo(completionInfo.getId());
	}

	@Override
	public void deleteTechnicalInfos(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
			deleteTechnicalInfo(id);
		}
	}

	@Override
	public void deleteTechnicalInfos(List<TechnicalInfo> completionInfos) {

		for (TechnicalInfo technicalInfo : completionInfos) {
			deleteTechnicalInfo(technicalInfo);
		}
	}

	@Override
	public List<TechnicalInfo> getAllCompletionInfos(
			TechnicalInfoDTO completionInfoDTO, int first, int max) {

		// 得到技术信息集合
		return getAllTechnicalInfos(completionInfoDTO, first, max,
				TechnicalInfo.COMPLETION);
	}

	/**
	 * 
	 * createSql 拼装查询条件
	 * 
	 * @param technicalInfoDTO
	 *            竣工和技术图纸的资料查询条件
	 * @param eql
	 *            基本eql
	 * @param conditionMap
	 *            存放查询条件的键值
	 * @return 拼装好的eql
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
		if (dto.getCompletionStartDate() != null) {
			newHql.append("AND t.completionDate >= :completionStartDate ");
			conditionMap.put("completionStartDate",
					dto.getCompletionStartDate());
		}
		if (dto.getCompletionEndDate() != null) {
			newHql.append("AND t.completionDate <= :completionEndDate ");
			conditionMap.put("completionEndDate", dto.getCompletionEndDate());
		}

		newHql.append("ORDER BY t.createDate DESC ");

		return newHql.toString();
	}

	/**
	 * 
	 * getAllTechnicalInfos 得到技术资料集合
	 * 
	 * @param completionInfoDTO
	 *            查询条件
	 * @param first
	 *            第一条记录
	 * @param max
	 *            最大记录
	 * @param type
	 *            类型
	 * @return 技术资料集合
	 */
	private List<TechnicalInfo> getAllTechnicalInfos(
			TechnicalInfoDTO completionInfoDTO, int start, int limit,
			Integer type) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的hql
		String newHql = null;
		String hql = "FROM TechnicalInfo t "
				+ " LEFT JOIN FETCH t.depart "
				+ " WHERE t.type =:type and t.exist=:exist ";
		// 拼装查询条件
		newHql = createSql(completionInfoDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("type", type);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setFirstResult(start);
		query.setMaxResults(limit);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
//		List<TechnicalDto> lists = getTechnicalInfoShow(query.list());
		return query.list();
	}

	@Override
	public int getCompletionInfoCount(TechnicalInfoDTO technicalInfoDTO) {
		// 得到技术信息记录数
		return getAllTechnicalCount(technicalInfoDTO, TechnicalInfo.COMPLETION);
	}

	/**
	 * 
	 * getAllTechnicalCount 得到技术信息记录数
	 * 
	 * @param completionInfoDTO
	 *            查询条件
	 * @param type
	 *            类型
	 * @return 技术信息记录数
	 */
	private int getAllTechnicalCount(TechnicalInfoDTO completionInfoDTO,
			Integer type) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String hql = "SELECT COUNT(t.id) FROM TechnicalInfo t WHERE t.type =:type and t.exist=:exist ";
		// 已经拼装好的eql
		String newHql = null;
		newHql = createSql(completionInfoDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("type", type);
		query.setParameter("exist", DataExistStatus.EXIST);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		return ((Long) query.uniqueResult()).intValue();
	}

	@Override
	public List<TechnicalInfo> getAllTechnicalInfoInfos(
			TechnicalInfoDTO completionInfoDTO, int start, int limit) {
		// 得到技术信息集合
		return getAllTechnicalInfos(completionInfoDTO, start, limit,
				TechnicalInfo.TACHNICAL);
	}

	@Override
	public int getTechnicalInfoInfoCount(TechnicalInfoDTO technicalInfoDTO) {

		// 得到技术信息记录数
		return getAllTechnicalCount(technicalInfoDTO, TechnicalInfo.TACHNICAL);
	}

}
