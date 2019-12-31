/**   
 * 文件名：ProductInstructionServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2013-9-26 上午11:19:25   
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
import com.enovell.yunwei.technical.domain.ProductInstruction;
import com.enovell.yunwei.technical.dto.TechnicalInfoDTO;
import com.enovell.yunwei.technical.service.ProductInstructionService;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 项目名称：kunmingrinms 类名称：ProductInstructionServiceImpl 类描述: 产品说明书接口实现类 创建人：zhangsihong
 * 创建时间：2013-9-26 上午11:19:25 修改人：zhangsihong 修改时间：2013-9-26 上午11:19:25
 * 
 */
@SuppressWarnings("unchecked")
@Service("ProductInstructionService")
@Transactional
public class ProductInstructionServiceImpl implements ProductInstructionService {

	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	@Override
	public ProductInstruction addProductInstruction(
			ProductInstruction productInstruction,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, productInstruction.getCreateUser());
			productInstruction.setAttachFile(attachFile);
		}
		sessionFactory.getCurrentSession().save(productInstruction);
		return productInstruction;
	}

	@Override
	public ProductInstruction updateProductInstruction(
			ProductInstruction productInstruction,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, productInstruction.getCreateUser());
			productInstruction.setAttachFile(attachFile);
		} else {
			// 上传文件为空
			productInstruction.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().saveOrUpdate(productInstruction);
		return productInstruction;
	}

	@Override
	public ProductInstruction getProductInstructionById(String id) {
		String hql = "FROM ProductInstruction t "
				+ " LEFT JOIN FETCH t.depart "
				+ " LEFT JOIN FETCH t.createUser "
				+ " LEFT JOIN FETCH t.attachFile "
				+ " LEFT JOIN FETCH t.attachFile.files " + " WHERE t.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (ProductInstruction) query.uniqueResult();
	}

	/**
	 * 
	 * deleteProductInstruction 删除操作
	 * 
	 * @param id
	 */
	public void deleteProductInstruction(String id) {
		ProductInstruction productInstruction = getProductInstructionById(id);
		productInstruction.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(productInstruction);
//		try {
//			AttachFile attachFile = productInstruction.getAttachFile();
//			// 删除技术资料
//			Session session = sessionFactory.getCurrentSession();
//			String hql = "delete ProductInstruction " + " where id =:id";
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
	public void deleteProductInstructions(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
			deleteProductInstruction(id);
		}
	}

	@Override
	public List<ProductInstruction> getProductInstructions(
			TechnicalInfoDTO technicalInfoDTO, int first, int max) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的hql
		String newHql = null;
		String hql = "FROM ProductInstruction t "
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
		newHql.append("ORDER BY t.createDate DESC ");
		return newHql.toString();
	}

	@Override
	public int getProductInstructionCount(TechnicalInfoDTO technicalInfoDTO) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String hql = "SELECT COUNT(t.id) FROM ProductInstruction t WHERE t.exist=:exist ";
		// 已经拼装好的hql
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

}
