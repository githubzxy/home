
package com.enovell.yunwei.technical.service.impl;

import java.util.ArrayList;
import java.util.Date;
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
import com.enovell.yunwei.technical.domain.TechnicalDocumentInfo;
import com.enovell.yunwei.technical.dto.TechnicalDto;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;
import com.enovell.yunwei.technical.service.TechnicalDocumentInfoService;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 项目名称：kunmingrinms 类名称：技术资料 类描述: 创建人：yangsy 创建时间：2016-11-24 
 * 
 */
@SuppressWarnings("unchecked")
@Service("TechnicalDocumentInfoService")
@Transactional
public class TechnicalDocumentInfoServiceImpl implements TechnicalDocumentInfoService {

	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	@Override
	public TechnicalDocumentInfo addTechnicalInfo(TechnicalDocumentInfo technicalInfo,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, technicalInfo.getCreateUser());
			technicalInfo.setAttachFile(attachFile);
		}
		sessionFactory.getCurrentSession().save(technicalInfo);
		return technicalInfo;
	}

	@Override
	public TechnicalDocumentInfo updateTechnicalInfo(TechnicalDocumentInfo technicalInfo,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, technicalInfo.getUpdateUser());
			technicalInfo.setAttachFile(attachFile);
		}else {
			//上传文件为空
			technicalInfo.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().saveOrUpdate(technicalInfo);
		return technicalInfo;
	}

	@Override
	public TechnicalDocumentInfo getTechnicalInfoById(String id) {
		String hql = "FROM TechnicalDocumentInfo t "
				+ " LEFT JOIN FETCH t.depart "
				+ " LEFT JOIN FETCH t.createUser "
				+ " LEFT JOIN FETCH t.attachFile "
				+ " LEFT JOIN FETCH t.attachFile.files"
				+ " WHERE t.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (TechnicalDocumentInfo) query.uniqueResult();
	}

	/**
	 * 
	 * deleteTechnicalInfo 删除操作
	 * @param id
	 */
	public void deleteTechnicalInfo(String id) {
		TechnicalDocumentInfo technicalInfo = getTechnicalInfoById(id);
		technicalInfo.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(technicalInfo);
//		try {
//			AttachFile attachFile = technicalInfo.getAttachFile();
//			// 删除技术资料
//			Session session = sessionFactory.getCurrentSession();
//			String hql = "delete TechnicalDocumentInfo " + " where id =:id";
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
	public void deleteTechnicalInfos(String jsonIds) {
		String[] ids = jsonIds.split(",");
		//TODO 性能问题待优化
		for (String id : ids) {
			deleteTechnicalInfo(id);
		}
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
	public List<TechnicalDto> getAllTechnicalInfoInfos(
			TechnicalInfoDTO completionInfoDTO, int start, int limit) {
		// 得到技术信息集合
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的hql
		String newHql = null;
		String hql = "FROM TechnicalDocumentInfo t " + " LEFT JOIN FETCH t.depart "
				+ " WHERE t.exist=:exist ";
		// 拼装查询条件
		newHql = createSql(completionInfoDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setFirstResult(start);
		query.setMaxResults(limit);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		List<TechnicalDto> lists = getTechnicalInfoShow(query.list());
		return lists;
	}

	@Override
	public int getTechnicalInfoInfoCount(TechnicalInfoDTO technicalInfoDTO) {
		// 得到技术信息记录数
		// 存放查询条件map
				Map<String, Object> conditionMap = new HashMap<String, Object>();
				String hql = "SELECT COUNT(t.id) FROM TechnicalDocumentInfo t WHERE t.exist=:exist ";
				// 已经拼装好的eql
				String newHql = null;
				newHql = createSql(technicalInfoDTO, hql, conditionMap);
				Session session = sessionFactory.getCurrentSession();
				Query query = session.createQuery(newHql);
				query.setParameter("exist", DataExistStatus.EXIST);
				for (String key : conditionMap.keySet()) {
					query.setParameter(key, conditionMap.get(key));
				}
				return ((Long) query.uniqueResult()).intValue();
	}

	/**
	 * 
	 * getTechnicalInfoShow 技术资料的显示
	 * 
	 * @param lists
	 * @return
	 */
	private List<TechnicalDto> getTechnicalInfoShow(List<TechnicalDocumentInfo> lists) {
		List<TechnicalDto> list = new ArrayList<TechnicalDto>();
		for (TechnicalDocumentInfo technicalInfo : lists) {
			TechnicalDto dto = new TechnicalDto();
			String id = technicalInfo.getId();
			String name = technicalInfo.getName();
			String depart = technicalInfo.getDepart().getName();
			/*Integer technicalInfoType = technicalInfo.getTechnicalInfoType()
					.intValue();*/
			Date createDate = technicalInfo.getCreateDate();
			AttachFile attachFile = technicalInfo.getAttachFile();
			dto.setId(id);
			dto.setName(name);
			dto.setDepart(depart);
//			dto.setTechnicalInfoType(technicalInfoType);
			dto.setCreateDate(createDate);
			if (attachFile != null) {
				dto.setAttachFileId(attachFile.getId());
			}
			list.add(dto);
		}
		return list;
	}

}
