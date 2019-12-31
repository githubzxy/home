
/**
 * 文件名：SafeSystemServiceImpl.java
 * 版本信息：IRMS1.0
 * 日期：2013-4-22 上午11:09:21
 * Copyright Enovell Corporation 2013
 * 版权所有
 * 
 */

package com.enovell.yunwei.safeSystem.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.safeSystem.domain.SafeSystem;
import com.enovell.yunwei.safeSystem.dto.SafeSystemDTO;
import com.enovell.yunwei.safeSystem.dto.SafeSystemExportDTO;
import com.enovell.yunwei.safeSystem.service.SafeSystemService;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.JsonUtil;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SafeSystemServiceImpl   
 * 类描述:  文件系统接口实现类
 * 创建人：zhangsihong
 * 创建时间：2013-4-22 上午11:09:21
 * 修改人：zhangsihong 
 * 修改时间：2013-4-22 上午11:09:21   
 *    
 */
@Service("safeSystemService")
@Transactional
public class SafeSystemServiceImpl implements SafeSystemService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	/**
	 * 通过文件id查询对应数据
	 */
	@Override
	public SafeSystem getSafeSystemById(String id) {
		
		String hql = "FROM SafeSystem f "
				+ " LEFT JOIN FETCH f.organization "
				+ " LEFT JOIN FETCH f.createUser "
				+ " LEFT JOIN FETCH f.attachFile "
				+ " LEFT JOIN FETCH f.attachFile.files "
				+ " WHERE f.id ='"+id+"'" ;
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		SafeSystem result = (SafeSystem)query.uniqueResult();
		
		return result;
		
	}
	/**
	 * 查询实现方法
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<SafeSystemDTO> getAllSafeSystems(SafeSystemDTO dto, int first, int max) {
		
		//存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String newEql = null;
		
		String eql = "FROM SafeSystem f "
				+ " LEFT JOIN FETCH f.organization "
				+ " LEFT JOIN FETCH f.createUser "
				+ " LEFT JOIN FETCH f.attachFile "
				+ " WHERE f.exist=:exist ";
		
		// 拼装查询条件
		newEql = createSql(dto, eql, conditionMap);
		Query query = sessionFactory.getCurrentSession().createQuery(newEql);
		query.setParameter("exist", DataExistStatus.EXIST);
		query.setFirstResult(first);
		query.setMaxResults(max);
		
		for(String key: conditionMap.keySet()) {
			query.setParameter(key,	conditionMap.get(key));
		}
		
		List<SafeSystem> list = query.list();
		
		List<SafeSystemDTO> dtolist = getShow(list);
		
		return dtolist;

	}
	/**
	 * 获取查询数据的总数量
	 */
	@Override
	public Long getAllSafeSystemCount(SafeSystemDTO dto) {
		
		//存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String eql = "SELECT COUNT(f.id) FROM SafeSystem f WHERE f.exist=:exist "; 
		String newEql = null;
		newEql = createSql(dto, eql, conditionMap);
		Query query = sessionFactory.getCurrentSession().createQuery(newEql);
		query.setParameter("exist", DataExistStatus.EXIST);
		for(String key: conditionMap.keySet()) {
			query.setParameter(key,	conditionMap.get(key));
		}
		Long count = (Long)query.uniqueResult();
		
		return count;
		
	}

	@Override
	public SafeSystem addSafeSystem(SafeSystemDTO dto, User user) {
		SafeSystem SafeSystem = new SafeSystem();
		//设置文件名
		SafeSystem.setFileName(dto.getFileName());
		//设置文件类型
		SafeSystem.setFileType(dto.getFileType());
		//设置适用范围
		SafeSystem.setFileSuitableRange(dto.getFileSuitableRange());
		//设置有效时间
		SafeSystem.setFileValidTime(dto.getFileValidTime());
		//设置是否细化
		SafeSystem.setIsDetailing("0".equals(dto.getIsDetailing()) ? false : true);
		//设置备注
		SafeSystem.setRemark(dto.getRemark());
		//设置创建时间
		Date createDate = new Date();
		SafeSystem.setCreateDate(createDate);
		//设置创建用户（为当前登录用户）
		SafeSystem.setCreateUser(user);
		//设置用户所在部门（为当前用户所在部门）
		SafeSystem.setOrganization(user.getOrganization());
		//获取多个上传文件的dto
		String uploadFileArr = dto.getUploadFileArr();
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		if (dtos != null && dtos.length != 0) {
			//保存上传文件，并得到上传文件id
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			//保存附件，获取附件信息
			SafeSystem.setAttachFile(attachFile);
		}
		
		sessionFactory.getCurrentSession().save(SafeSystem);
		
		return null;
	}
	
	/*@Override
	public SafeSystem updateSafeSystem(SafeSystem SafeSystem,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存上传文件，并得到上传文件id
			AttachFile attachFile = attachFileService.addAttachFile(dtos,SafeSystem.getCreateUser());
			SafeSystem.setAttachFile(attachFile);
		}else {
			SafeSystem.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().saveOrUpdate(SafeSystem);
		
		return null;
	}*/
	
	@Override
	public SafeSystem updateSafeSystem(SafeSystemDTO dto, User user) {
//		SafeSystem SafeSystem = new SafeSystem();
		SafeSystem SafeSystem = getSafeSystemById(dto.getId());
//		// 取出附件
//		String attachFileId = null;
//		if (SafeSystem.getAttachFile() != null) {
//			attachFileId = SafeSystem.getAttachFile().getId();
//		}
		//设置文件名
		SafeSystem.setFileName(dto.getFileName());
		//设置文件类型
		SafeSystem.setFileType(dto.getFileType());
		//设置适用范围
		SafeSystem.setFileSuitableRange(dto.getFileSuitableRange());
		//设置有效时间
		SafeSystem.setFileValidTime(dto.getFileValidTime());
		//设置是否细化
		SafeSystem.setIsDetailing("0".equals(dto.getIsDetailing()) ? false : true);
		//设置备注
		SafeSystem.setRemark(dto.getRemark());
		//设置创建时间
		Date createDate = new Date();
		SafeSystem.setCreateDate(createDate);
		//设置创建用户（为当前登录用户）
		SafeSystem.setCreateUser(user);
		//设置用户所在部门（为当前用户所在部门）
		SafeSystem.setOrganization(user.getOrganization());
		//获取多个上传文件的dto
		String uploadFileArr = dto.getUploadFileArr();
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		if (dtos != null && dtos.length != 0) {
			//保存上传文件，并得到上传文件id
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			//保存附件，获取附件信息
			SafeSystem.setAttachFile(attachFile);
		}else{
//			if (attachFileId != null) {
//				attachFileService.deleteAttachFile(attachFileId);
//			}
			SafeSystem.setAttachFile(null);
		}
		
		sessionFactory.getCurrentSession().saveOrUpdate(SafeSystem);
		
		return null;
	}
	
	@Override
	public void deleteSafeSystemsByIds(List<String> ids) {
		
		for (int i = 0; i < ids.size(); i++) {
			
			SafeSystem fs = getSafeSystemById(ids.get(i));
			fs.setExist(DataExistStatus.NOT_EXIST);
			sessionFactory.getCurrentSession().saveOrUpdate(fs);
			
//			try {
//				
//				AttachFile af = fs.getAttachFile();
//				
//				String hql = "DELETE SafeSystem f WHERE f.id =:id";
//				Session session= sessionFactory.getCurrentSession();
//				session.createQuery(hql).setParameter("id", ids.get(i)).executeUpdate();
//
//				if (af != null) {
//					String attachFileId = af.getId();
//					// 删除附件
//					attachFileService.deleteAttachFile(attachFileId);
//				}
			
//			} catch (Exception e) {
//				e.printStackTrace();
//			}

		}
		
	}
	
	/**
	 * 封装显示的DTO数据，
	 * 在getAllSafeSystems(SafeSystemDTO dto, int first, int max)中调用该方法。
	 * @param list
	 * @return
	 */
	private List<SafeSystemDTO> getShow(List<SafeSystem> list) {
		
		List<SafeSystemDTO> dtolist = new ArrayList<SafeSystemDTO>();
		
		for (int i = 0; i < list.size(); i++) {
			
			SafeSystemDTO dd = new SafeSystemDTO();
			
			dd.setId(list.get(i).getId());
			dd.setFileName(list.get(i).getFileName());
			dd.setFileType(list.get(i).getFileType());
			dd.setFileSuitableRange(list.get(i).getFileSuitableRange());
			dd.setFileValidTime(list.get(i).getFileValidTime());
			dd.setRemark(list.get(i).getRemark());
			dd.setCreateStartDate(list.get(i).getCreateDate());
			dd.setOrganization(list.get(i).getOrganization().getName());
			dd.setCreateUser(list.get(i).getCreateUser().getName());
			if(list.get(i).getIsDetailing()==false){
				dd.setIsDetailing("否");
			}else{
				dd.setIsDetailing("是");
			}
			dtolist.add(dd);
			
		}
		
		return dtolist;
		
	}
	
	/** createSql 拼装查询条件
	 * @param SafeSystemDTO	查询条件
	 * @param eql 基本eql
	 * @param conditionMap 存放查询条件的键值
	 * @return 拼装好的eql
	 */
	private String createSql(SafeSystemDTO dto, String eql, Map<String, Object> conditionMap) {
		
		if(dto == null) {
			return eql;
		}
		StringBuffer newEql = new StringBuffer();
		newEql.append(eql);
		if(StringUtils.isNotEmpty(dto.getFileName())) {
			
			newEql.append("AND f.fileName like :fileName ");
			conditionMap.put("fileName", "%" + dto.getFileName() + "%");
		}
		if(dto.getFileType() != null) {
			
			newEql.append("AND f.fileType = :fileType ");
			conditionMap.put("fileType", dto.getFileType());
		}
		if(dto.getFileSuitableRange() != null) {
			
			newEql.append("AND f.fileSuitableRange = :fileSuitableRange ");
			conditionMap.put("fileSuitableRange", dto.getFileSuitableRange());
		}
		/*if(dto.getOrganization() != null) {
					
			newEql.append("AND f.organization.id = :organization ");
			conditionMap.put("organization", dto.getOrganization());
		}*/
		if(StringUtils.isNotEmpty(dto.getOrganization())) {
			
			newEql.append("AND f.organization.id = :organization ");
			conditionMap.put("organization", dto.getOrganization());
		}
		if(dto.getCreateUser() != null) {
			
			newEql.append("AND f.createUser = :createUser ");
			conditionMap.put("createUser", dto.getCreateUser());
		}
		if(dto.getStartDate() != null) {
			
			newEql.append("AND f.createDate >= :startDate ");
			conditionMap.put("startDate", dto.getStartDate());
		}
		if(dto.getEndDate() != null) {
			
			newEql.append("AND f.createDate <= :endDate ");
			conditionMap.put("endDate", dto.getEndDate());
		}
		newEql.append("ORDER BY f.createDate DESC ");
		
		return newEql.toString();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SafeSystemExportDTO> getAllFile(SafeSystemDTO SafeSystemDTO) {
		//存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String newEql = null;
		String eql = "FROM SafeSystem f "
				+ " LEFT JOIN FETCH f.organization "
				+ " LEFT JOIN FETCH f.createUser "
				+ " LEFT JOIN FETCH f.attachFile "
				+ " WHERE f.exist=:exist ";
		// 拼装查询条件
		newEql = createSql(SafeSystemDTO, eql, conditionMap);
		Query query = sessionFactory.getCurrentSession().createQuery(newEql);
		query.setParameter("exist", DataExistStatus.EXIST);
		
		for(String key: conditionMap.keySet()) {
			query.setParameter(key,	conditionMap.get(key));
		}
		
		List<SafeSystem> list = query.list();
		List<SafeSystemExportDTO> dtolist = getExportData(list);
		return dtolist;
	}
	
	/**    
	 * getExportData 获取导出的数据
	 * @param list
	 * @return
	 */
	private List<SafeSystemExportDTO> getExportData(List<SafeSystem> list){
		List<SafeSystemExportDTO> dtolist = new ArrayList<SafeSystemExportDTO>();
		
		for (int i = 0; i < list.size(); i++) {
			SafeSystemExportDTO fe = new SafeSystemExportDTO();
			fe.setFileName(list.get(i).getFileName());
			fe.setCreateStartDate(list.get(i).getCreateDate());
			if(list.get(i).getFileType() == 3110109) {
				fe.setFileType("安全规章");
			}else if (list.get(i).getFileType() == 3110110) {
				fe.setFileType("技术规章");
			}else if(list.get(i).getFileType() == 3110111) {
				fe.setFileType("管理制度");
			}
			fe.setOrganization(list.get(i).getOrganization().getName());
			dtolist.add(fe);
		}
		return dtolist;
	}
}
