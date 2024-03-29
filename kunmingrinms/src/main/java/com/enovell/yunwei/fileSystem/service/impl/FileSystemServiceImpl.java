
/**
 * 文件名：FileSystemServiceImpl.java
 * 版本信息：IRMS1.0
 * 日期：2013-4-22 上午11:09:21
 * Copyright Enovell Corporation 2013
 * 版权所有
 * 
 */

package com.enovell.yunwei.fileSystem.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.fileSystem.domain.FileSystem;
import com.enovell.yunwei.fileSystem.dto.FileSystemDTO;
import com.enovell.yunwei.fileSystem.dto.FileSystemExportDTO;
import com.enovell.yunwei.fileSystem.service.FileSystemService;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.JsonUtil;


/**      
 * 项目名称：kunmingrinms
 * 类名称：FileSystemServiceImpl   
 * 类描述:  文件系统接口实现类
 * 创建人：zhangsihong
 * 创建时间：2013-4-22 上午11:09:21
 * 修改人：zhangsihong 
 * 修改时间：2013-4-22 上午11:09:21   
 *    
 */
@Service("fileSystemService")
@Transactional
public class FileSystemServiceImpl implements FileSystemService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	@Autowired
	private NamedParameterJdbcTemplate nj;
	
	/**
	 * 通过文件id查询对应数据
	 */
	@Override
	public FileSystem getFileSystemById(String id) {
		
		String hql = "FROM FileSystem f "
				+ " LEFT JOIN FETCH f.organization "
				+ " LEFT JOIN FETCH f.createUser "
				+ " LEFT JOIN FETCH f.attachFile "
				+ " LEFT JOIN FETCH f.attachFile.files "
				+ " WHERE f.id ='"+id+"'" ;
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		FileSystem result = (FileSystem)query.uniqueResult();
		
		return result;
		
	}
	/**
	 * 查询实现方法
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<FileSystemDTO> getAllFileSystems(FileSystemDTO dto, int first, int max) {
		
		//存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String newEql = null;
		
		String eql = "FROM FileSystem f "
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
		
		List<FileSystem> list = query.list();
		
		List<FileSystemDTO> dtolist = getShow(list);
		
		return dtolist;

	}
	/**
	 * 获取查询数据的总数量
	 */
	@Override
	public Long getAllFileSystemCount(FileSystemDTO dto) {
		
		//存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String eql = "SELECT COUNT(f.id) FROM FileSystem f WHERE f.exist=:exist "; 
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
	public FileSystem addFileSystem(FileSystemDTO dto, User user) {
		FileSystem fileSystem = new FileSystem();
		//设置文件名
		fileSystem.setFileName(dto.getFileName());
		//设置文件类型
		fileSystem.setFileType(dto.getFileType());
		//设置适用范围
		fileSystem.setFileSuitableRange(dto.getFileSuitableRange());
		//设置有效时间
		fileSystem.setFileValidTime(dto.getFileValidTime());
		//设置是否细化
		fileSystem.setIsDetailing("0".equals(dto.getIsDetailing()) ? false : true);
		//设置备注
		fileSystem.setRemark(dto.getRemark());
		//设置创建时间
		Date createDate = new Date();
		fileSystem.setCreateDate(createDate);
		//设置创建用户（为当前登录用户）
		fileSystem.setCreateUser(user);
		//设置用户所在部门（为当前用户所在部门）
		fileSystem.setOrganization(user.getOrganization());
		//获取多个上传文件的dto
		String uploadFileArr = dto.getUploadFileArr();
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		if (dtos != null && dtos.length != 0) {
			//保存上传文件，并得到上传文件id
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			//保存附件，获取附件信息
			fileSystem.setAttachFile(attachFile);
		}
		
		sessionFactory.getCurrentSession().save(fileSystem);
		
		return null;
	}
	
	/*@Override
	public FileSystem updateFileSystem(FileSystem fileSystem,UploadFileDto[] dtos) {
		if (dtos.length != 0) {
			// 保存上传文件，并得到上传文件id
			AttachFile attachFile = attachFileService.addAttachFile(dtos,fileSystem.getCreateUser());
			fileSystem.setAttachFile(attachFile);
		}else {
			fileSystem.setAttachFile(null);
		}
		sessionFactory.getCurrentSession().saveOrUpdate(fileSystem);
		
		return null;
	}*/
	
	@Override
	public FileSystem updateFileSystem(FileSystemDTO dto, User user) {
//		FileSystem fileSystem = new FileSystem();
		FileSystem fileSystem = getFileSystemById(dto.getId());
//		// 取出附件
//		String attachFileId = null;
//		if (fileSystem.getAttachFile() != null) {
//			attachFileId = fileSystem.getAttachFile().getId();
//		}
		//设置文件名
		fileSystem.setFileName(dto.getFileName());
		//设置文件类型
		fileSystem.setFileType(dto.getFileType());
		//设置适用范围
		fileSystem.setFileSuitableRange(dto.getFileSuitableRange());
		//设置有效时间
		fileSystem.setFileValidTime(dto.getFileValidTime());
		//设置是否细化
		fileSystem.setIsDetailing("0".equals(dto.getIsDetailing()) ? false : true);
		//设置备注
		fileSystem.setRemark(dto.getRemark());
		//设置创建时间
		Date createDate = new Date();
		fileSystem.setCreateDate(createDate);
		//设置创建用户（为当前登录用户）
		fileSystem.setCreateUser(user);
		//设置用户所在部门（为当前用户所在部门）
		fileSystem.setOrganization(user.getOrganization());
		//获取多个上传文件的dto
		String uploadFileArr = dto.getUploadFileArr();
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		if (dtos != null && dtos.length != 0) {
			//保存上传文件，并得到上传文件id
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			//保存附件，获取附件信息
			fileSystem.setAttachFile(attachFile);
		}else{
//			if (attachFileId != null) {
//				attachFileService.deleteAttachFile(attachFileId);
//			}
			fileSystem.setAttachFile(null);
		}
		
		sessionFactory.getCurrentSession().saveOrUpdate(fileSystem);
		
		return null;
	}
	
	@Override
	public void deleteFileSystemsByIds(List<String> ids) {
		
		for (int i = 0; i < ids.size(); i++) {
			
			FileSystem fs = getFileSystemById(ids.get(i));
			fs.setExist(DataExistStatus.NOT_EXIST);
			sessionFactory.getCurrentSession().saveOrUpdate(fs);
			
//			try {
//				
//				AttachFile af = fs.getAttachFile();
//				
//				String hql = "DELETE FileSystem f WHERE f.id =:id";
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
	 * 在getAllFileSystems(FileSystemDTO dto, int first, int max)中调用该方法。
	 * @param list
	 * @return
	 */
	private List<FileSystemDTO> getShow(List<FileSystem> list) {
		
		List<FileSystemDTO> dtolist = new ArrayList<FileSystemDTO>();
		
		for (int i = 0; i < list.size(); i++) {
			
			FileSystemDTO dd = new FileSystemDTO();
			
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
	 * @param FileSystemDTO	查询条件
	 * @param eql 基本eql
	 * @param conditionMap 存放查询条件的键值
	 * @return 拼装好的eql
	 */
	private String createSql(FileSystemDTO dto, String eql, Map<String, Object> conditionMap) {
		
		if(dto == null) {
			return eql;
		}
		StringBuffer newEql = new StringBuffer();
		newEql.append(eql);
		if(StringUtils.isNotEmpty(dto.getFileName())) {
			
			newEql.append("AND f.fileName like :fileName ");
			conditionMap.put("fileName", "%" + dto.getFileName() + "%");
		}
		if(dto.getFileType() != null&&!"".equals(dto.getFileType())) {
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
	public List<FileSystemExportDTO> getAllFile(FileSystemDTO fileSystemDTO) {
		//存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String newEql = null;
		String eql = "FROM FileSystem f "
				+ " LEFT JOIN FETCH f.organization "
				+ " LEFT JOIN FETCH f.createUser "
				+ " LEFT JOIN FETCH f.attachFile "
				+ " WHERE f.exist=:exist ";
		// 拼装查询条件
		newEql = createSql(fileSystemDTO, eql, conditionMap);
		Query query = sessionFactory.getCurrentSession().createQuery(newEql);
		query.setParameter("exist", DataExistStatus.EXIST);
		
		for(String key: conditionMap.keySet()) {
			query.setParameter(key,	conditionMap.get(key));
		}
		
		List<FileSystem> list = query.list();
		List<FileSystemExportDTO> dtolist = getExportData(list);
		return dtolist;
	}
	
	/**    
	 * getExportData 获取导出的数据
	 * @param list
	 * @return
	 */
	private List<FileSystemExportDTO> getExportData(List<FileSystem> list){
		List<FileSystemExportDTO> dtolist = new ArrayList<FileSystemExportDTO>();
		
		for (int i = 0; i < list.size(); i++) {
			FileSystemExportDTO fe = new FileSystemExportDTO();
			fe.setFileName(list.get(i).getFileName());
			fe.setCreateStartDate(list.get(i).getCreateDate());
			if(list.get(i).getFileType() != null) {
				fe.setFileType(list.get(i).getFileType());
			}
			if("12200".equals(list.get(i).getFileType())) {
				fe.setFileType("通信线路及附属设备");
			}else if ("12201".equals(list.get(i).getFileType())) {
				fe.setFileType("传输与接入网系统");
			}else if("12204".equals(list.get(i).getFileType())) {
				fe.setFileType("数据通信系统");
			}else if("12202".equals(list.get(i).getFileType())) {
				fe.setFileType("调度通信系统");
			}else if("12203".equals(list.get(i).getFileType())) {
				fe.setFileType("综合视频监控系统");
			}else if("12205".equals(list.get(i).getFileType())) {
				fe.setFileType("图像与语音监控系统");
			}else if("31100".equals(list.get(i).getFileType())) {
				fe.setFileType("时间与时钟同步系统");
			}else if("31101".equals(list.get(i).getFileType())) {
				fe.setFileType("会议系统");
			}else if("31102".equals(list.get(i).getFileType())) {
				fe.setFileType("通信电源及环境监控系统");
			}else if("31103".equals(list.get(i).getFileType())) {
				fe.setFileType("应急通信系统");
			}else if("31104".equals(list.get(i).getFileType())) {
				fe.setFileType("GSM-R数字移动通信系统");
			}else if("31105".equals(list.get(i).getFileType())) {
				fe.setFileType("无线列调通信系统");
			}else if("41100".equals(list.get(i).getFileType())) {
				fe.setFileType("电报及电话系统");
			}else if("42201".equals(list.get(i).getFileType())) {
				fe.setFileType("综合网管系统");
			}else if("42202".equals(list.get(i).getFileType())) {
				fe.setFileType("广播与站场通信系统");
			}else if("42203".equals(list.get(i).getFileType())) {
				fe.setFileType("自然灾害及异物侵限系统");
			}else if("42204".equals(list.get(i).getFileType())) {
				fe.setFileType("机房空调及防雷接地系统");
			}else if("42205".equals(list.get(i).getFileType())) {
				fe.setFileType("客运引导系统");
			}
			fe.setOrganization(list.get(i).getOrganization().getName());
			dtolist.add(fe);
		}
		return dtolist;
	}
	
	@Override
	public List<String> getProType() {
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = " SELECT " +
				" 	    DISTINCT dc.type_ " +
				" 	FROM " +
				" 	    record_sys_consts dc " ;
//		if (StringUtils.isNotBlank(type)) {
//			sql += " WHERE dc.TYPE_ like :type ";
//			map.put("type", "%" + type + "%");
//		}
		sql +="ORDER BY dc.type_ DESC ";
		List<String> list = nj.queryForList(sql, map).stream().map(s ->{
			return s.get("TYPE_").toString();
		}).collect(Collectors.toList());
		return list;
	}
}
