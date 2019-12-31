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
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.technical.domain.CompletionInfo;
import com.enovell.yunwei.technical.dto.CompletionInfoDTO;
import com.enovell.yunwei.technical.service.CompletionInfoService;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：CompletionInfoServiceImpl   
 * 类描述:  竣工资料实现类
 * 创建人：lidt 
 * 创建时间：2016-11-25 上午9:55:55
 * 修改人：lidt 
 * 修改时间：2016-11-25 上午9:55:55   
 *
 */
@SuppressWarnings("unchecked")
@Service("CompletionInfoService")
@Transactional
public class CompletionInfoServiceImpl implements CompletionInfoService {

	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	@Override
	public CompletionInfo addCompletionInfo(CompletionInfo completionInfo,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, completionInfo.getCreateUser());
			completionInfo.setAttachFile(attachFile);
		}
		sessionFactory.getCurrentSession().save(completionInfo);
		return completionInfo;
	}

	@Override
	public CompletionInfo updateCompletionInfo(CompletionInfo completionInfo,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, completionInfo.getUpdateUser());
			completionInfo.setAttachFile(attachFile);
		} else {
			// 上传文件为空
			completionInfo.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().saveOrUpdate(completionInfo);
		return completionInfo;
	}

	@Override
	public CompletionInfo getCompletionInfoById(String id) {
		String hql = "FROM CompletionInfo t " + " LEFT JOIN FETCH t.depart "
				+ " LEFT JOIN FETCH t.createUser "
				+ " LEFT JOIN FETCH t.attachFile "
				+ " LEFT JOIN FETCH t.attachFile.files" + " WHERE t.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (CompletionInfo) query.uniqueResult();
	}

	@Override
	public void deleteCompletionInfos(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
			deleteCompletionInfo(id);
		}
	}

	private void deleteCompletionInfo(String id) {
		CompletionInfo completionInfo = getCompletionInfoById(id);
		completionInfo.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(completionInfo);
//		try {
//			AttachFile attachFile = completionInfo.getAttachFile();
//			// 删除技术资料
//			Session session = sessionFactory.getCurrentSession();
//			String hql = "delete CompletionInfo " + " where id =:id";
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

	private String createSql(CompletionInfoDTO completionInfoDTO, String hql,
			Map<String, Object> conditionMap) {
		if (completionInfoDTO == null) {
			return hql;
		}
		StringBuffer newHql = new StringBuffer();
		newHql.append(hql);
		if (StringUtils.isNotEmpty(completionInfoDTO.getName())) {
			newHql.append("AND t.name like :name ");
			conditionMap.put("name", "%" + completionInfoDTO.getName() + "%");
		}
		if (completionInfoDTO.getTechnicalInfoType() != null) {
			newHql.append("AND t.technicalInfoType = :technicalInfoType ");
			conditionMap.put("technicalInfoType",
					completionInfoDTO.getTechnicalInfoType());
		}
		if (completionInfoDTO.getRailLine() != null) {
			newHql.append("AND t.railLineName like :railLineName ");
			conditionMap.put("railLineName","%" + completionInfoDTO.getRailLine() + "%");
		}
		if (completionInfoDTO.getDepart() != null) {
			newHql.append("AND t.depart = :depart ");
			conditionMap.put("depart", completionInfoDTO.getDepart());
		}
		if (completionInfoDTO.getCreateStartDate() != null) {
			newHql.append("AND t.createDate >= :createStartDate ");
			conditionMap.put("createStartDate",
					completionInfoDTO.getCreateStartDate());
		}
		if (completionInfoDTO.getCreateEndDate() != null) {
			newHql.append("AND t.createDate <= :createEndDate ");
			conditionMap.put("createEndDate",
					completionInfoDTO.getCreateEndDate());
		}
		if (completionInfoDTO.getCompletionStartDate() != null) {
			newHql.append("AND t.completionDate >= :completionStartDate ");
			conditionMap.put("completionStartDate",
					completionInfoDTO.getCompletionStartDate());
		}
		if (completionInfoDTO.getCompletionEndDate() != null) {
			newHql.append("AND t.completionDate <= :completionEndDate ");
			conditionMap.put("completionEndDate",
					completionInfoDTO.getCompletionEndDate());
		}

		newHql.append("ORDER BY t.createDate DESC ");

		return newHql.toString();
	}

	private List<CompletionInfo> getAllCompletionInfos(
			CompletionInfoDTO completionInfoDTO, int first, int max) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的hql
		String newHql = null;
		String hql = "FROM CompletionInfo t "
				+ " LEFT JOIN FETCH t.depart "
				+ " WHERE t.exist=:exist ";
		// 拼装查询条件
		newHql = createSql(completionInfoDTO, hql, conditionMap);
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

	private Long getCompletionInfoCount(CompletionInfoDTO completionInfoDTO) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String hql = "SELECT COUNT(t.id) FROM CompletionInfo t WHERE t.exist=:exist ";
		// 已经拼装好的eql
		String newHql = null;
		newHql = createSql(completionInfoDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("exist", DataExistStatus.EXIST);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		return (Long) query.uniqueResult();
	}

	@Override
	public GridDto<CompletionInfo> getGridDtos(CompletionInfoDTO completionInfoDTO, int first,
			int max) {
		GridDto<CompletionInfo> gridDto = new GridDto<CompletionInfo>();
		gridDto.setRows(getAllCompletionInfos(completionInfoDTO, first, max));
		gridDto.setResults(getCompletionInfoCount(completionInfoDTO));

		return gridDto;
	}

}
