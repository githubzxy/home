
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
import com.enovell.yunwei.technical.domain.TechnicalAccountInfo;
import com.enovell.yunwei.technical.dto.TechnicalAccountDTO;
import com.enovell.yunwei.technical.dto.TechnicalDto;
import com.enovell.yunwei.technical.service.TechnicalAccountService;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 项目名称：kunmingrinms 
 * 类名称：TechnicalAccountServiceImpl
 * 描述: 技术台账实现类
 * 创建人：yangsy 
 * 创建时间：2016-11-25 
 * 
 */
@SuppressWarnings("unchecked")
@Service("TechnicalAccountService")
@Transactional
public class TechnicalAccountServiceImpl implements TechnicalAccountService {

	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	/**
	 * 添加
	 */
	@Override
	public TechnicalAccountInfo addAccountData(TechnicalAccountInfo technicalAcountInfo,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, technicalAcountInfo.getCreateUser());
			technicalAcountInfo.setAttachFile(attachFile);
		}
		sessionFactory.getCurrentSession().save(technicalAcountInfo);
		return technicalAcountInfo;
	}
	/**
	 * 通过id获取单条数据
	 */
	@Override
	public TechnicalAccountInfo getTechnicalAccountById(String id) {
		String hql = "FROM TechnicalAccountInfo t "
				+ " LEFT JOIN FETCH t.depart "
				+ " LEFT JOIN FETCH t.createUser "
				+ " LEFT JOIN FETCH t.attachFile "
				+ " LEFT JOIN FETCH t.attachFile.files"
				+ " WHERE t.id =:id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (TechnicalAccountInfo) query.uniqueResult();
	}
	/**
	 * 修改
	 */
	@Override
	public TechnicalAccountInfo updateAccountData(TechnicalAccountInfo technicalAcountInfo,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存附件和上传文件
			AttachFile attachFile = attachFileService.addAttachFile(dtos, technicalAcountInfo.getUpdateUser());
			technicalAcountInfo.setAttachFile(attachFile);
		}else {
			//上传文件为空
			technicalAcountInfo.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().saveOrUpdate(technicalAcountInfo);
		return technicalAcountInfo;
	}
	/**
	 * 删除
	 */
	@Override
	public void delTechnicalAccountData(String jsonIds) {
		String[] ids = jsonIds.split(",");
		//TODO 性能问题待优化
		for (String id : ids) {
			deleteTechnicalAccount(id);
		}
	}
	/**
	 * deleteTechnicalInfo 删除操作
	 * @param id
	 */
	public void deleteTechnicalAccount(String id) {
		TechnicalAccountInfo technicalAcountInfo = getTechnicalAccountById(id);
		technicalAcountInfo.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(technicalAcountInfo);
		
//		try {
//			AttachFile attachFile = technicalAcountInfo.getAttachFile();
//			// 删除技术资料
//			Session session = sessionFactory.getCurrentSession();
//			String hql = "delete TechnicalAccountInfo " + " where id =:id";
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

	/**
	 * createSql 拼装查询条件
	 * 
	 * @param TechnicalAccountDTO dto
	 *            竣工和技术图纸的资料查询条件
	 * @param eql
	 *            基本eql
	 * @param conditionMap
	 *            存放查询条件的键值
	 * @return 拼装好的eql
	 */
	private String createSql(TechnicalAccountDTO dto, String hql,
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
		if (dto.getType() != null) {
			newHql.append("AND t.type = :type ");
			conditionMap.put("type", dto.getType());
		}
		if (dto.getDepart() != null) {
			newHql.append("AND t.depart = :depart ");
			conditionMap.put("depart", dto.getDepart());
		}
		if (dto.getStartDate() != null) {
			newHql.append("AND t.createDate >= :startDate ");
			conditionMap.put("startDate", dto.getStartDate());
		}
		if (dto.getEndDate() != null) {
			newHql.append("AND t.createDate <= :endDate ");
			conditionMap.put("endDate", dto.getEndDate());
		}

		newHql.append("ORDER BY t.createDate DESC ");

		return newHql.toString();
	}
	/**
	 * 动态查询
	 */
	@Override
	public List<TechnicalDto> getAccountData(
			TechnicalAccountDTO technicalAccountDTO, int start, int limit) {
		// 得到技术信息集合
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的hql
		String newHql = null;
		String hql = "FROM TechnicalAccountInfo t " + " LEFT JOIN FETCH t.depart "
				+ " WHERE t.exist=:exist ";
		// 拼装查询条件
		newHql = createSql(technicalAccountDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setFirstResult(start);
		query.setMaxResults(limit);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		List<TechnicalDto> lists = getShow(query.list());
		return lists;
	}
	/**
	 * 获取查询数据的总数
	 */
	@Override
	public long getCount(TechnicalAccountDTO technicalAccountDTO) {
		// 得到技术信息记录数
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String hql = "SELECT COUNT(t.id) FROM TechnicalAccountInfo t WHERE t.exist=:exist ";
		// 已经拼装好的eql
		String newHql = null;
		newHql = createSql(technicalAccountDTO, hql, conditionMap);
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
	private List<TechnicalDto> getShow(List<TechnicalAccountInfo> lists) {
		List<TechnicalDto> list = new ArrayList<TechnicalDto>();
		for (TechnicalAccountInfo technicalAccountInfo : lists) {
			TechnicalDto dto = new TechnicalDto();
			String id = technicalAccountInfo.getId();
			String name = technicalAccountInfo.getName();
			String depart = technicalAccountInfo.getDepart().getName();
			Integer technicalInfoType = technicalAccountInfo.getType()
					.intValue();
			Date createDate = technicalAccountInfo.getCreateDate();
			AttachFile attachFile = technicalAccountInfo.getAttachFile();
			dto.setId(id);
			dto.setName(name);
			dto.setDepart(depart);
			dto.setTechnicalInfoType(technicalInfoType);
			dto.setCreateDate(createDate);
			if (attachFile != null) {
				dto.setAttachFileId(attachFile.getId());
			}
			list.add(dto);
		}
		return list;
	}

}
