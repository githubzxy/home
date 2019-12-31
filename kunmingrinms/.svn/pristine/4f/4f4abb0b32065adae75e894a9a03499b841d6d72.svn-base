package com.enovell.yunwei.attach.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.domain.UploadFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.util.JDBCUtil;

/**
 * 文件处理接口
 * 
 * 项目名称：kunmingrinms 类名称：AttachFileServiceImpl.java 类描述: 创建人：潘忠瑞
 * 创建时间：2014-10-30 修改人：潘忠瑞 修改时间：2014-10-30
 * 
 */
@SuppressWarnings("unchecked")
@Service("attachFileService")
@Transactional
public class AttachFileServiceImpl implements AttachFileService {
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public UploadFile getById(String fileId) {
		String selectSql = " SELECT "
				+ " 	* "
				+ " FROM "
				+ " 	PROJECT_FILE F "
				+ " WHERE "
				+ " 	F.ID_ = :fileId ";
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("fileId", fileId);
		UploadFile dto = namedParameterJdbcTemplate.queryForObject(selectSql, paramMap, new RowMapper<UploadFile>(){
			@Override
			public UploadFile mapRow(ResultSet rs, int idx) throws SQLException {
				UploadFile uploadFile = new UploadFile();
				uploadFile.setId(rs.getString("ID_"));
				uploadFile.setName(rs.getString("NAME_"));
				uploadFile.setPath(rs.getString("PATH_"));
				return uploadFile;
			}
		});
		return dto;
	}

	@Override
	public List<UploadFile> getFiles(String attachFileId) {
		String selectSql = " SELECT "
				+ " 	* "
				+ " FROM "
				+ " 	PROJECT_FILE F "
				+ " WHERE "
				+ " 	F.ATTACH_FILE_ = :attachFileId ";
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("attachFileId", attachFileId);
		List<UploadFile> dtos = namedParameterJdbcTemplate.query(selectSql, paramMap, new RowMapper<UploadFile>(){
			@Override
			public UploadFile mapRow(ResultSet rs, int idx) throws SQLException {
				UploadFile uploadFile = new UploadFile();
				uploadFile.setId(rs.getString("ID_"));
				uploadFile.setName(rs.getString("NAME_"));
				uploadFile.setPath(rs.getString("PATH_"));
				return uploadFile;
			}
		});
		return dtos;
	}

	@Override
	public AttachFile addAttachFile(UploadFileDto[] dtos, User user) {
		if(dtos == null || dtos.length == 0) {
			return null;
		}
		// 先保存附件
		String insertSql = " INSERT INTO ATTACH_FILE( "
				+ " ID_, "
				+ " CREATETIME_, "
				+ " CREATEUSER_ "
				+ " ) values(:id,:createTime,:createUser) ";
		String attachFileId = JDBCUtil.getUUID32();
		Map<String, Object> paramMap  = new HashMap<String, Object>();
		paramMap.put("id", attachFileId);
		paramMap.put("createTime", new Date());
		paramMap.put("createUser", user.getName());
		namedParameterJdbcTemplate.update(insertSql, paramMap);
		
		AttachFile attachFile = new AttachFile();
		attachFile.setId(attachFileId);
		// 再保存文件
		addUploadFile(dtos, attachFile);
		return attachFile;
	}

	@Override
	public void deleteAttachFile(String attachFileId) {
		Session session = sessionFactory.getCurrentSession();
		String uploadFileSql = "delete UploadFile " + " where attachFile.id =:aftId";
		session.createQuery(uploadFileSql).setParameter("aftId", attachFileId)
				.executeUpdate();
		String attachFileSql = "delete AttachFile " + " where id =:aftId";
		session.createQuery(attachFileSql).setParameter("aftId", attachFileId)
				.executeUpdate();
	}
	
	@Override
	public List<UploadFile> getFilesByIds(String ids) {
		String[] idArr = ids.split(",");
		List<String> idList = new ArrayList<String>();
		CollectionUtils.addAll(idList, idArr);
		String sql = "FROM UploadFile t WHERE t.attachFile.id in (:attachFileId)";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameterList("attachFileId", idList);
		return query.list();
	}

	@Override
	public int deleteUploadByAttachFileId(String attachFileId){
		String delSql = " DELETE "
				+ " FROM "
				+ " 	PROJECT_FILE F "
				+ " WHERE "
				+ " 	F.attach_file_ = :attachFileId ";
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("attachFileId", attachFileId);
		int result = namedParameterJdbcTemplate.update(delSql, paramMap);
		return result;
	}
	
	@Override
	public AttachFile updateAttachFile(UploadFileDto[] dtos, String attachFileId) {
		AttachFile attachFile = new AttachFile();
		attachFile.setId(attachFileId);
		try {
			// 如果存在附件,则先删除附件下的文件
			deleteUploadByAttachFileId(attachFileId);
			// 再新增上传文件
			addUploadFile(dtos, attachFile);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("attachFileId不能为空");
		}
		return attachFile;
	}

	@Override
	public AttachFile getAttachFileById(String attachFileId) {
		AttachFile attachFile = (AttachFile) sessionFactory.getCurrentSession()
				.get(AttachFile.class, attachFileId);
		return attachFile;
	}

	@Override
	public int addUploadFile(UploadFileDto[] dtos, AttachFile attachFile) {
		int result = 1;
		if (dtos != null && dtos.length != 0) {
			// 循环保存多个上传的文件
			for (UploadFileDto uploadFileDto : dtos) {
			String insertSql = " INSERT INTO PROJECT_FILE( "
					+ " ID_, "
					+ " DATE_, "
					+ " NAME_, "
					+ " PATH_, "
					+ " ATTACH_FILE_ "
					+ " ) values(:id,:date,:fileName,:path,:attachFileId) ";
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", JDBCUtil.getUUID32());
			paramMap.put("date", new Date());
			paramMap.put("fileName", uploadFileDto.getName());
			paramMap.put("path", uploadFileDto.getPath());
			paramMap.put("attachFileId", attachFile.getId());
			result = namedParameterJdbcTemplate.update(insertSql, paramMap);
			}
			return result;
		}
		return result;
	}
	
	@Override
	public List<UploadFileDto> getUploadFileDtos(String attachFileId) {
		List<UploadFile> uploadFileArr = getFiles(attachFileId);
		List<UploadFileDto> result = new ArrayList<UploadFileDto>();
		for (UploadFile uploadFile : uploadFileArr) {
			UploadFileDto dto = new UploadFileDto();
			dto.setUploadFileId(uploadFile.getId());
			dto.setName(uploadFile.getName());
			dto.setPath(uploadFile.getPath());
			result.add(dto);
		}
		return result;
	}
	

}
