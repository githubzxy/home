package com.enovell.yunwei.message.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.message.domain.IssueMessage;
import com.enovell.yunwei.message.dto.IssueMessageDTO;
import com.enovell.yunwei.message.service.MessageService;
import com.enovell.yunwei.onduty.domain.OnDuty;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.JsonUtil;

/**
 * 
 * 项目名称：RINMS2MAIN
 * 类名称：MessageServiceImpl   
 * 类描述:  信息发布实现类
 * 创建人：lidt 
 * 创建时间：2016-11-25 下午2:51:19
 * 修改人：lidt 
 * 修改时间：2016-11-25 下午2:51:19   
 *
 */
@SuppressWarnings("unchecked")
@Service("MessageService")
@Transactional
public class MessageServiceImpl implements MessageService {

	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	@Autowired
	private NamedParameterJdbcTemplate template;
	@Override
	public List<IssueMessage> getMessage(IssueMessage m, int i, int j) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " from IssueMessage i "
				+ " where i.issue = :issue "
				+ " AND i.exist =:exist ";
		if(m.getType() != null) {
			hql += " AND i.type =:type ";
		}
		if(StringUtils.isNotBlank(m.getTheme())) {
			hql += " AND i.theme like :theme ";
		}
		if(m.getOrgType() != null) {
			hql += "AND i.orgType = :orgType ";
		}
		if(StringUtils.isNotBlank(m.getTopStatus())) {
			hql += "AND i.topStatus = :topStatus ";
		}
			hql	+= " order by createTime desc ";
		Query q = session.createQuery(hql);
		q.setParameter("issue", m.getIssue());
		q.setParameter("exist", DataExistStatus.EXIST);
		q.setFirstResult(i);
		q.setMaxResults(j);
		if(m.getType() != null) {
			q.setParameter("type", m.getType().intValue());
		}
		if(StringUtils.isNotBlank(m.getTheme())) {
			q.setParameter("theme","%" + m.getTheme() + "%");
		}
		if(m.getOrgType() != null) {
			q.setParameter("orgType", m.getOrgType().intValue());
		}
		if(StringUtils.isNotBlank(m.getTopStatus())) {
			q.setParameter("topStatus", m.getTopStatus());
		}
		return q.list();
	}
	
	@Override
	public IssueMessage getMessageById(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM IssueMessage i "
				+ " LEFT JOIN FETCH i.attachFile "
				+ " LEFT JOIN FETCH i.attachFile.files" + " WHERE i.id =:id";
		Query q = session.createQuery(hql);
		q.setParameter("id", id);
		return (IssueMessage) q.uniqueResult();
	}

	@Override
	public IssueMessageDTO getMessageDtoById(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM IssueMessage i "
				+ " LEFT JOIN FETCH i.attachFile "
				+ " LEFT JOIN FETCH i.attachFile.files" + " WHERE i.id =:id";
		Query q = session.createQuery(hql);
		q.setParameter("id", id);
		IssueMessage issueMessage = (IssueMessage) q.uniqueResult();
		IssueMessageDTO dto = new IssueMessageDTO();
		dto.setId(issueMessage.getId());
		dto.setTheme(issueMessage.getTheme());
		dto.setType(issueMessage.getType());
		dto.setIssueOrgName(issueMessage.getIssueOrgName());
		dto.setContent(issueMessage.getContent());
		dto.setIssueTime(issueMessage.getIssueTime());
		if(issueMessage.getAttachFile() != null){
			List<UploadFileDto> uploadFileArr = attachFileService.getUploadFileDtos(issueMessage.getAttachFile().getId());
			dto.setUploadFileArr(uploadFileArr);
			dto.setAttachFileId(issueMessage.getAttachFile().getId());
		}
		return dto;
	}

	@Override
	public IssueMessage addIssueMessage(IssueMessageDTO issueMessageDTO, User user) {
		IssueMessage issueMessage = new IssueMessage();
		issueMessage.setTheme(issueMessageDTO.getTheme());// 信息发布主题
		issueMessage.setType(issueMessageDTO.getType());// 信息发布类型
		issueMessage.setContent(issueMessageDTO.getContent());// 信息发布内容
		issueMessage.setCreateTime(new Date());// 创建时间
		issueMessage.setIssueUser(user);// 发布人
		issueMessage.setIssueTime(new Date());// 发布时间
		issueMessage.setIssue(2);
		issueMessage.setTopStatus("0");
		issueMessage.setIssueOrgName(issueMessageDTO.getIssueOrgName());
		issueMessage.setOrgId(issueMessageDTO.getOrgId());
		issueMessage.setOrgType(issueMessageDTO.getOrgType());
		//获取多个上传文件的dto
		String uploadFileArr = issueMessageDTO.getAttachFileId();
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadFileArr, UploadFileDto[].class);
		if (dtos != null && dtos.length != 0) {
			//保存上传文件，并得到上传文件id
			AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
			//保存附件，获取附件信息
			issueMessage.setAttachFile(attachFile);
		}
		sessionFactory.getCurrentSession().save(issueMessage);
		return null;
	}
	
	@Override
	public IssueMessage updateIssueMessage(IssueMessageDTO issueMessageDTO,User user) {
		IssueMessage issueMessage = getMessageById(issueMessageDTO.getId());
		issueMessage.setTheme(issueMessageDTO.getTheme());// 信息发布主题
		issueMessage.setType(issueMessageDTO.getType());// 信息发布类型
		issueMessage.setContent(issueMessageDTO.getContent());// 信息发布内容
		
		String uploadArr = issueMessageDTO.getAttachFileId();
		UploadFileDto[] dtos = JsonUtil.jsonToJavaObj(uploadArr, UploadFileDto[].class);
		// 最新的数据中存在附件
		if (dtos != null && dtos.length > 0) {
			// 原数据存在附件
			if (issueMessage.getAttachFile() != null) {
				// 删除上传文件
				attachFileService.deleteUploadByAttachFileId(issueMessage.getAttachFile().getId());
				AttachFile attachFile = new AttachFile();
				attachFile.setId(issueMessage.getAttachFile().getId());
				// 添加最新的上传文件
				attachFileService.addUploadFile(dtos, attachFile);
			} else {// 原数据没有附件
				// 添加最新的附件
				AttachFile attachFile = attachFileService.addAttachFile(dtos, user);
				issueMessage.setAttachFile(attachFile);
			}
		} else {// 最新的数据中没有附件
			// 原数据存在附件
			if(issueMessage.getAttachFile() != null){
				// 删除上传文件
				attachFileService.deleteUploadByAttachFileId(issueMessage.getAttachFile().getId());
			}
		}
		
		sessionFactory.getCurrentSession().saveOrUpdate(issueMessage);
		return null;
	}

	@Override
	public void deleteIssueMessages(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
			delIssueMessage(id);
		}
	}
	
	/**
	 * 
	 * delIssueMessage 逻辑删除
	 * @param id
	 */
	private void delIssueMessage(String id){
		IssueMessage message = (IssueMessage) sessionFactory.getCurrentSession()
				.load(IssueMessage.class, id);
		message.setExist(DataExistStatus.NOT_EXIST);
		sessionFactory.getCurrentSession().saveOrUpdate(message);
		
	}

	/**
	 * 修改人：luoyan 2017-7-10  前端封装查询条件为dto
	 */
	@Override
	public GridDto<IssueMessageDTO> getIssueMessages(
			IssueMessageDTO issueMessageDTO,int start,int limit) {
		GridDto<IssueMessageDTO> gridDto = new GridDto<IssueMessageDTO>();
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的hql
		String newHql = null;
		String hql = "FROM IssueMessage t " + " WHERE t.issue =:issue ";
		// 拼装查询条件
		newHql = createSql(issueMessageDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("issue", IssueMessage.ISISSUE);
		query.setFirstResult(start);
		query.setMaxResults(limit);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		List<IssueMessageDTO> lists = getIssueMessageShow(query.list());
		gridDto.setRows(lists);
		long results = getIssueMessageCount(issueMessageDTO);
		gridDto.setResults(results);
		
		return gridDto;
	}

	/**
	 * 
	 * createSql 拼装查询条件
	 * 
	 * @param dto
	 *            信息发布查询条件
	 * @param hql
	 *            基本hql
	 * @param conditionMap
	 *            存放查询条件的键值
	 * @return 拼装好的hql
	 */
	private String createSql( IssueMessageDTO dto, String hql,
			Map<String, Object> conditionMap) {
		if (dto == null) {
			return hql;
		}
		StringBuffer newHql = new StringBuffer();
		newHql.append(hql);
		// 删除字段为1的条件(即未删除)
		newHql.append(" AND t.exist =:exist ");
		conditionMap.put("exist", DataExistStatus.EXIST);
		if (StringUtils.isNotEmpty(dto.getTheme())) {
			newHql.append("AND t.theme like :theme ");
			conditionMap.put("theme", "%" + dto.getTheme() + "%");
		}
		if(dto.getType() != null) {
			newHql.append("AND t.type = :type ");
			conditionMap.put("type", dto.getType().intValue());
		}
		if(dto.getOrgType() != null) {
			newHql.append("AND t.orgType = :orgType ");
			conditionMap.put("orgType", dto.getOrgType().intValue());
		}
		
		if (StringUtils.isNotEmpty(dto.getIssueOrgName())) {
			newHql.append("AND t.issueOrgName like :issueOrgName ");
			conditionMap.put("issueOrgName", "%" + dto.getIssueOrgName() + "%");
		}
		if (dto.getStartTime() != null) {
			newHql.append("AND t.issueTime >= :createTime ");
			conditionMap.put("createTime", dto.getStartTime());
		}
		if (dto.getEndTime() != null) {
			newHql.append("AND t.issueTime <= :endTime ");
			conditionMap.put("endTime", dto.getEndTime());
		}
		
//		//根据不同用户显示
//		if(loginOrgType==1500 && loginOrgType==1501){	
//			System.out.println("++++++++++++++++++++++++++++++++++");
//			System.out.println(loginOrgType);
//			newHql.append("AND t.orgType = 1500 ");
//			conditionMap.put("orgType", 1500);
//			
//		}
		newHql.append("ORDER BY t.issueTime DESC ");
 		return newHql.toString();
	}

	@Override
	public int getIssueMessageCount(IssueMessageDTO issueMessageDTO) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String hql = "SELECT COUNT(t.id) FROM IssueMessage t WHERE t.issue = 2 ";
		// 已经拼装好的hql
		String newHql = null;
		newHql = createSql(issueMessageDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		return ((Long) query.uniqueResult()).intValue();
	}

	/**
	 * 
	 * getIssueMessageShow 信息发布的显示
	 * 
	 * @param lists
	 * @return
	 * luonf 2017-10-27 添加IssueMessageDTO中typeName的映射
	 */
	private List<IssueMessageDTO> getIssueMessageShow(List<IssueMessage> lists) {
		List<IssueMessageDTO> list = new ArrayList<IssueMessageDTO>();
		for (IssueMessage issueMessage : lists) {
			IssueMessageDTO dto = new IssueMessageDTO();
			
			dto.setId(issueMessage.getId());
			dto.setTheme(issueMessage.getTheme());
			dto.setContent(issueMessage.getContent());
			dto.setIssueTime(issueMessage.getIssueTime());
			dto.setIssueUserName(issueMessage.getIssueUser().getName());
			dto.setOrgId(issueMessage.getOrgId());
			dto.setOrgType(issueMessage.getOrgType());
			dto.setIssueOrgName(issueMessage.getIssueOrgName());
			dto.setType(issueMessage.getType());
			if(StringUtils.isNotBlank(issueMessage.getTopStatus())&&issueMessage.getTopStatus().equals("0")){
				dto.setTopStatus("否");
			}
			if(StringUtils.isNotBlank(issueMessage.getTopStatus())&&issueMessage.getTopStatus().equals("1")){
				dto.setTopStatus("是");
			}
			if(issueMessage.getType() == 10022) {
				dto.setTypeName("最新通知");
			}else if(issueMessage.getType() == 10023) {
				dto.setTypeName("新闻");
			}else if(issueMessage.getType() == 10024) {
				dto.setTypeName("公示公告");
			}
//			else if(issueMessage.getType() == 10025) {
//				dto.setTypeName("安全通报信息");
//			}else if(issueMessage.getType() == 10026) {
//				dto.setTypeName("值班信息");
//			}else if(issueMessage.getType() == 10027) {
//				dto.setTypeName("故障通报消息");
//			}
			list.add(dto);
		}
		return list;
	}

	@Override
	public List<IssueMessageDTO> getAllIssueMessage(IssueMessageDTO issueMessageDTO) {
		// 存放查询条件map
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		// 已经拼装好的hql
		String newHql = null;
		String hql = "FROM IssueMessage t " + " WHERE t.issue =:issue ";
		// 拼装查询条件
		newHql = createSql(issueMessageDTO, hql, conditionMap);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(newHql);
		query.setParameter("issue", IssueMessage.ISISSUE);
		for (String key : conditionMap.keySet()) {
			query.setParameter(key, conditionMap.get(key));
		}
		List<IssueMessageDTO> lists = getIssueMessageShow(query.list());
		return lists;
	}

	@Override
	public List<OnDuty> getDutyMessage(String date) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM OnDuty od "
			+ " LEFT JOIN FETCH od.creatUser "
			+ " LEFT JOIN FETCH od.user "
			+ " LEFT JOIN FETCH od.user.organization "
			+ " WHERE  od.dutyDate >= :startDate "
			+ " AND od.dutyDate <= :endDate " 
			+ " AND od.exist =:exist ";
		Query d=null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			d = session.createQuery(hql);
			d.setParameter("startDate", format.parse(date));
			d.setParameter("endDate", format.parse(date));
			d.setParameter("exist", DataExistStatus.EXIST);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d.list();
	}

	@Override
	public List<String> getIssueOrgName() {
		String sql="select t.org_name_ from cfg_base_organization t where t.type_ = :type and t.DELETE_STATE_=:state";
		Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("type", 1500);
        paramMap.put("state", 1);
        
        List<String> workShopList1=template.queryForList(sql,paramMap, String.class);
        paramMap.put("type",1501);
        paramMap.put("state", 1);
        List<String> workShopList2=template.queryForList(sql,paramMap, String.class);
        paramMap.put("type",1502);
        paramMap.put("state", 1);
		List<String> workShopList3=template.queryForList(sql,paramMap, String.class);
		List<String > workShopList = new ArrayList<>();
		workShopList.addAll(workShopList1);
		workShopList.addAll(workShopList2);
		workShopList.addAll(workShopList3);
		return workShopList;
	}

	@Override
	public String getOrgIdByLoginOrgName(String OrgName) {
		String sql="select s.org_id_ from cfg_base_organization s where s.org_id_="
				+ "(select t.parent_id_ from cfg_base_organization t where t.org_name_=:OrgName)";
		 Map<String,String> param = new HashMap<>();
	        param.put("OrgName",OrgName);
	        try {
	            return template.queryForObject(sql, param, String.class);
	        }catch (EmptyResultDataAccessException e){
	            return null;
	        }
	}
	@Override
	public void topIssueMessages(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
			topMessage(id);
		}
	}

	public void topMessage(String id) {
		IssueMessage message = (IssueMessage) sessionFactory.getCurrentSession()
				.load(IssueMessage.class, id);
		message.setTopStatus("1");
		sessionFactory.getCurrentSession().saveOrUpdate(message);
		
	}

	@Override
	public void cancelIssueMessages(String jsonIds) {
		String[] ids = jsonIds.split(",");
		for (String id : ids) {
			cancelMessage(id);
		}
	}
	public void cancelMessage(String id) {
		IssueMessage message = (IssueMessage) sessionFactory.getCurrentSession()
				.load(IssueMessage.class, id);
		message.setTopStatus("0");
		sessionFactory.getCurrentSession().saveOrUpdate(message);
		
	}

}
