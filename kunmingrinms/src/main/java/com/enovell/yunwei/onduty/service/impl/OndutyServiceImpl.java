package com.enovell.yunwei.onduty.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.onduty.domain.OnDuty;
import com.enovell.yunwei.onduty.domain.OnDutyDTO;
import com.enovell.yunwei.onduty.domain.OnDutyQueryDTO;
import com.enovell.yunwei.onduty.dto.OnDutyNew;
import com.enovell.yunwei.onduty.service.OndutyService;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.JsonUtil;

/**
 * @author roy 2015年7月23日-下午4:36:39
 */
@Transactional
@SuppressWarnings("unchecked")
@Service("ondutyService")
public class OndutyServiceImpl implements OndutyService {

	@Autowired
	private SessionFactory sessionFactory;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");//日期格式化模板
	
	
	
	@Override
	public User getDeptAndPeople(String ondutyDept, String ondutyPeople) {
		
		Session session = sessionFactory.getCurrentSession();
		String eql = "FROM User u "
				+ " LEFT JOIN FETCH u.organization o"
				+ " WHERE u.name=:name AND o.name=:dept AND u.deleState=:userdel AND o.deleteState=:orgdel";
		Query query = session.createQuery(eql);
		query.setParameter("name", ondutyPeople);
		query.setParameter("dept", ondutyDept);
		query.setParameter("userdel", 1);
		query.setParameter("orgdel", 1);
		return (User) query.uniqueResult();
	}
	
	@Override
	public OnDuty add(OnDuty onDuty) {
		Session session = sessionFactory.getCurrentSession();
		onDuty.setStatus("1");
		onDuty.setRemarks("");
		session.save(onDuty);
		return onDuty;
	}
	
	@Override
	public String addBoth(User user,String onduyUsers,String dateStr) {
		Date date = null;
		try {
				date = sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		User[] userArray = JsonUtil.jsonToJavaObj(onduyUsers, User[].class, JsonUtil.DATE);
		List<User> users = Arrays.asList(userArray);
		// 验证指定的人在指定的日期是否能添加值班信息 是- true 否-false
		if(!addCheckOnly(users, date)) {
			// 不唯一 
			return JsonUtil.javaToJsonAsString(false);
		}
		
		List<OnDuty> onDuties = getOnduties(userArray, date, calendar, user);
		for(OnDuty onDuty : onDuties){
			 add(onDuty);
		}
		return null;
	}
	
	/**
	 * 封装数据
	 * getOnduties 
	 * @param userArray
	 * @param date
	 * @param calendar
	 * @param curUser
	 * @return
	 *  修改人:luoyan 2017-7-6  业务由service处理
	 */
	private List<OnDuty> getOnduties(User[] userArray,Date date,Calendar calendar,User curUser) {
		//  保存数据
		List<OnDuty> onDuties = new ArrayList<OnDuty>();
		OnDuty onDuty = null;
		for(User user : userArray) {
			onDuty = new OnDuty();
			onDuty.setUser(user);
			onDuty.setDutyDate(date);
			onDuty.setFixedNum(user.getTelephoneNumber());
			onDuty.setCellPhoneNum(user.getPhone());
			onDuty.setWeek((calendar.get(Calendar.DAY_OF_WEEK) - 1)+"");
			
			onDuty.setCreatUser(curUser);
			onDuty.setCreatDate(new Date());
			onDuties.add(onDuty);
		}
		return onDuties;
	}
	
	@Override
	public OnDuty getById(String id) {
		Session session = sessionFactory.getCurrentSession();
		String eql = "FROM OnDuty od "
				+ " LEFT JOIN FETCH od.creatUser "
				+ " LEFT JOIN FETCH od.user "
				+ " LEFT JOIN FETCH od.user.organization "
				+ " WHERE od.id=:id ";
		Query query = session.createQuery(eql);
		query.setParameter("id", id);
		// 判空
		Iterator<OnDuty> itor = query.list().iterator();
		return itor.hasNext() ? itor.next() : null;
	}

	/**
	 * 修改人:luoyan 2017-7-6  业务由service处理
	 * @throws ParseException 
	 * @throws HibernateException 
	 */
	@Override
	public String update(User curUser,OnDuty onDuty) {
		// 验证指定的人在指定的日期是否能添加值班信息 是- true 否-false
		if(!updateCheckOnly(onDuty.getUser(), onDuty.getDutyDate(), onDuty)) {
			// 不唯一 
			return JsonUtil.javaToJsonAsString(false);
		}
		
		if(StringUtils.isNotBlank(onDuty.getSituation())) {
			onDuty.setStatus("2");
		}
		
		onDuty.setRemarks(curUser.getName() + "修改了（" + onDuty.getUser().getName() +"）的值班情况。");
				
		Session session = sessionFactory.getCurrentSession();
		OnDuty tempObject = getById(onDuty.getId());
		if (tempObject != null) {
//			session.saveOrUpdate(onDuty);// 保存json转java对象"a different object with the same identifier value was already associated with the session"
			session.merge(onDuty);
		}
		return null;
	}
	

	@Override
	public void delete(List<String> idList) {
		delteById(idList);
	}
	
	/**
	 * 
	 * delteById 逻辑删除
	 * @param idList
	 */
	private void delteById(List<String> idList) {
		if (idList != null && idList.size() != 0) {
			for (String id : idList) {
				OnDuty onDuty = (OnDuty) sessionFactory.getCurrentSession()
						.load(OnDuty.class, id);
				onDuty.setExist(DataExistStatus.NOT_EXIST);
				sessionFactory.getCurrentSession().saveOrUpdate(onDuty);
			}
		}
	}

	@Override
	public List<OnDuty> getAll() {
		Session session = sessionFactory.getCurrentSession();
		String eql = "FROM OnDuty od "
				+ " LEFT JOIN FETCH od.creatUser "
				+ " LEFT JOIN FETCH od.user "
				+ " LEFT JOIN FETCH od.user.organization "
				+ " WHERE 1 = 1 ORDER BY od.dutyDate DESC ";
		Query query = session.createQuery(eql);
		List<OnDuty> list = query.list();
		return list;
	}

	@Override
	public GridDto<OnDutyNew> getByDTO(OnDutyDTO dto, int first, int max) {
		
		Session session = sessionFactory.getCurrentSession();
		String eql = "FROM OnDuty od "
				+ " LEFT JOIN FETCH od.creatUser "
				+ " LEFT JOIN FETCH od.user "
				+ " LEFT JOIN FETCH od.user.organization "
				+ " WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(dto, eql, map) + " ORDER BY od.dutyDate DESC,od.user.organization.orgIndex ASC ";
		Query query = session.createQuery(sql);
		query.setFirstResult(first);
		query.setMaxResults(max);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<OnDuty> list = query.list();
		List<OnDutyNew> list1 = new ArrayList<OnDutyNew>();
		for (OnDuty onDuty : list) {
			OnDutyNew odn =new OnDutyNew();
			odn.setDutyDate(sdf.format(onDuty.getDutyDate()));
			odn.setCellPhoneNum(onDuty.getCellPhoneNum());
			odn.setUser(onDuty.getUser());
			odn.setSituation(onDuty.getSituation());
			odn.setFixedNum(onDuty.getFixedNum());
			odn.setWeek(onDuty.getWeek());
			odn.setStatus(onDuty.getStatus());
			odn.setId(onDuty.getId());
			list1.add(odn);
		}
		
		Long count  = getCountByDTO(dto);
		GridDto<OnDutyNew> gridDto = new GridDto<OnDutyNew>();
		gridDto.setResults(count);
		gridDto.setRows(list1);
		return gridDto;
	}

	private Long getCountByDTO(OnDutyDTO dto) {
		
		Session session = sessionFactory.getCurrentSession();
		
		String eql = "SELECT COUNT(od.id) FROM OnDuty od WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(dto, eql, map);
		Query query = session.createQuery(sql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (Long) query.uniqueResult();
	}

	/**
	 * 组装查询条件
	 * @param dto
	 * @param eql
	 * @param map
	 * @return
	 * 
	 * 修改人:luoyan 2017-7-6
	 */
	private String createSql(OnDutyDTO dto, String eql, Map<String, Object> map) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(eql);
		// 删除字段为1的条件(即未删除)
		buffer.append(" AND od.exist =:exist ");
		map.put("exist", DataExistStatus.EXIST);
		if(dto!= null){
			if(StringUtils.isNotBlank(dto.getName())){
				buffer.append(" AND od.user.name like :dutyPerson ");
				map.put("dutyPerson", "%"+dto.getName()+"%");
			}
			if(StringUtils.isNotBlank(dto.getStatus())){
				buffer.append(" AND od.status = :status ");
				map.put("status", dto.getStatus());
			}
			if(StringUtils.isNotBlank(dto.getOrgId())){
				buffer.append(" AND od.user.organization.id =:orgId ");
				map.put("orgId", dto.getOrgId());
			}
			if(StringUtils.isNotBlank(dto.getWeek())){
				buffer.append(" AND od.week = :week ");
				map.put("week", dto.getWeek());
			}
			if (dto.getStartDate()!= null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				Date beginDate = null;
				try {
					beginDate = sdf.parse(sdf.format(dto.getStartDate()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				buffer.append(" AND od.dutyDate >= :begin ");
				map.put("begin", beginDate);
			}
			if (dto.getEndDate()!= null ) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				Date endDate = null;
				try {
					endDate = sdf.parse(sdf.format(dto.getEndDate()));
					Calendar cal = Calendar.getInstance();
					cal.setTime(endDate);
					cal.add(Calendar.SECOND, 60 * 60 * 24 - 1);
					endDate = cal.getTime();
				} catch (ParseException e) {
					e.printStackTrace();
				}
				buffer.append(" AND od.dutyDate <= :endDate ");
				map.put("endDate", endDate);
			}
		}
		return buffer.toString();
	}

	/**
	 * 修改人:luoyan 2017-7-6  业务由service处理
	 */
	@Override
	public String report(OnDuty onDuty) {

		if(StringUtils.isNotBlank(onDuty.getSituation())) {
			onDuty.setStatus("2");
		}else{
			return JsonUtil.javaToJsonAsString(false);
		}
		
		onDuty.setRemarks(onDuty.getUser().getName() + "进行了情况汇报。");
		onDuty.setStatus("2");
		onDuty.setReportDate(new Date());
						
		Session session = sessionFactory.getCurrentSession();
		OnDuty tempObject = getById(onDuty.getId());
		if (tempObject != null) {
//			session.saveOrUpdate(onDuty);// 保存json转java对象"a different object with the same identifier value was already associated with the session"
			session.merge(onDuty);
		}
		return null;
	}

	@Override
	public List<OnDuty> getAllByDTO(OnDutyDTO dto) {
		
		Session session = sessionFactory.getCurrentSession();
		String eql = "FROM OnDuty od "
				+ " LEFT JOIN FETCH od.creatUser "
				+ " LEFT JOIN FETCH od.user "
				+ " LEFT JOIN FETCH od.user.organization "
				+ " WHERE 1 = 1 ";
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = createSql(dto, eql, map) + " ORDER BY od.user.organization.orgIndex ";
		Query query = session.createQuery(sql);
		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<OnDuty> list = query.list();
		return list;
	}

	@Override
	public Boolean addCheckOnly(List<User> users, Date date) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM OnDuty od "
				+ " WHERE  od.dutyDate = :date "
				+ " AND od.user in (:users) "
				/**
				 * 修改人：luoyan 2017-10-13 判断重复时除去已删除的数据
				 */
				+" AND od.exist =:exist ";
		Query query = session.createQuery(hql);
		query.setParameter("exist",DataExistStatus.EXIST);
		query.setParameter("date",date);
		query.setParameterList("users",users);
		List<OnDuty> list = query.list();
		if(list != null && list.size() >= 1) {
			return false;
		}
		return true;
	}
	
	@Override
	public Boolean updateCheckOnly(User user, Date date, OnDuty curOnDuty) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM OnDuty od "
				+ " WHERE  od.dutyDate = :date "
				+ " AND od.user = :user "
				+ " AND od != :curOnDuty "
				/**
				 * 修改人：luoyan 2017-10-13 判断重复时除去已删除的数据
				 */
				+" AND od.exist =:exist ";
		Query query = session.createQuery(hql);
		query.setParameter("exist",DataExistStatus.EXIST);
		query.setParameter("date",date);
		query.setParameter("user",user);
		query.setParameter("curOnDuty",curOnDuty);
		List<OnDuty> list = query.list();
		if(list != null && list.size() >= 1) {
			return false;
		}
		return true;
	}
	
	@Override
	public OnDuty getTodayUserDuty(String userId) {

		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM OnDuty od "
			+ " LEFT JOIN FETCH od.creatUser "
			+ " LEFT JOIN FETCH od.user "
			+ " LEFT JOIN FETCH od.user.organization "
			+ " WHERE  od.dutyDate >= :startDate "
			+ " AND od.dutyDate <= :endDate " 
			+ " AND od.user.id = :userId "
			+ " AND od.exist =:exist ";
		OnDuty duty = null;
		try {

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String today = format.format(new Date());
			duty = (OnDuty)session.createQuery(hql).setParameter("userId", userId)
					.setParameter("startDate", format.parse(today))
					.setParameter("endDate", format.parse(today))
					.setParameter("exist", DataExistStatus.EXIST).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return duty;
	}
	
	///---------------------------------------------首页值班模块---------------------------------------------
	

	@SuppressWarnings("rawtypes")
	@Override
	public List<OnDutyQueryDTO> getHomeDuty(String dutyDate) {
		Session session = sessionFactory.getCurrentSession();

		String sql = "select  o.org_name_, od.org_id_ ,o.orgindex_,t.id_,t.dutydate_,t.week_,t.situation_,t.status_,t.user_name_,t.fixednum_,t.cellphonenum_,t.USER_TELPHONENUMBER_, t.USER_PHONE_ "
				+ "  from ONDUTY_DEPT od left join cfg_base_organization o on od.org_id_=o.org_id_   "
				+ "  left  join  "
				+ "   (select d.*,cu.user_name_, cu.USER_TELPHONENUMBER_, cu.USER_PHONE_,co.org_name_,co.org_id_ from onduty d "
				+ " 	left join cfg_safe_user cu on d.userid_= cu.user_id_"
				+ " 	left join cfg_base_organization co on cu.organization_id_=co.org_id_ where d.dutydate_=:dutyDate "
				+ " 	AND d.exist_ =:exist ) t on t.org_id_ = od.org_id_ "
				+ "  group by o.org_name_,od.org_id_,t.id_,o.orgindex_,t.dutydate_,t.week_,t.situation_,t.status_,t.user_name_,t.fixednum_,t.cellphonenum_,t.USER_TELPHONENUMBER_, t.USER_PHONE_  "
				+ "  order by o.orgindex_ asc";

		List<OnDutyQueryDTO> dtoes = new ArrayList<OnDutyQueryDTO>();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("dutyDate",
					new SimpleDateFormat("yyyy-MM-dd").parse(dutyDate));
			query.setParameter("exist",DataExistStatus.EXIST);
			List list = query.list();
			for (int i = 0; i < list.size(); i++) {

				Object[] obj = (Object[]) list.get(i);
				OnDutyQueryDTO dto = new OnDutyQueryDTO();

				dto.setOrgName((String) obj[0]);
				dto.setUser((String) obj[8]);
				
				if(obj[4]!=null && obj[4]!=""){
					
					dto.setDutyDate(new SimpleDateFormat("yyyy-MM-dd").format((Date) obj[4]));
				}
				dto.setWeek((String) obj[5]);
//				dto.setFixedNum((String) obj[9]);
//				dto.setCellPhoneNum((String) obj[10]);
				dto.setFixedNum((String) obj[11]);// 固定电话
				dto.setCellPhoneNum((String) obj[12]);// 手机
				dto.setSituation((String) obj[6]);
				dto.setDutyId((String) obj[3]);
				dto.setStatus((String)obj[7]);

				dtoes.add(dto);

			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		return dtoes;
	}

	@Override
	public List<OnDuty> getToDayDutyByUser(String userId) {

		Session session = sessionFactory.getCurrentSession();
		String hql = "select d from OnDuty d " + " left join fetch d.user u"
				+ " left join fetch u.organization" + " where exists"
				+ "(select duty.id from OnDuty duty" + " ,OnDutyDept dept"
				+ " where duty.user.organization.id = dept.orgId"
				+ " and duty.user.id =:userId "
				+ " and duty.dutyDate >= :startDate "
				+ " and duty.dutyDate <= :endDate " 
				+ " and duty.exist =:exist " 
				+ " and d.id = duty.id)";
		List<OnDuty> dutys = null;
		try {

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String today = format.format(new Date());
			dutys = session.createQuery(hql).setParameter("userId", userId)
					.setParameter("startDate", format.parse(today))
					.setParameter("endDate", format.parse(today))
					.setParameter("exist", DataExistStatus.EXIST).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dutys;
	}

	@Override
	public void updateDuty(String dutyId, String content) {

		String hql = "update OnDuty d set d.situation=:content,d.status=:status,d.reportDate=:reportDate where d.id=:id ";

		Session session = sessionFactory.getCurrentSession();
		session.createQuery(hql).setParameter("content", content)
				.setParameter("status", "2")
				.setParameter("reportDate", new Date())
				.setParameter("id", dutyId).executeUpdate();

	}


}
