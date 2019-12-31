
/**   
 * 文件名：OnDutyDeptServiceImpl.java    
 * 版本信息：RINMS2.0   
 * 日期：2013-12-25 上午11:08:13   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.onduty.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.onduty.domain.OnDutyDept;
import com.enovell.yunwei.onduty.domain.OnDutyDeptDTO;
import com.enovell.yunwei.onduty.service.OnDutyDeptService;
import com.enovell.yunwei.onduty.service.OnDutyValidateService;
import com.enovell.yunwei.onduty.service.OndutyInsertService;
import com.enovell.yunwei.system.service.OrganizationService;
import com.enovell.yunwei.util.CellUtil;
import com.enovell.yunwei.util.OrganizationIdUtil;
import com.enovell.yunwei.util.ValidateMsg;


/**      
 * 项目名称：kunmingrinms
 * 类名称：OnDutyDeptServiceImpl   
 * 类描述:  
 * 创建人：jiangming 
 * 创建时间：2013-12-25 上午11:08:13
 * 修改人：zhangsihong
 * 修改时间：2015-09-08 上午11:01:54   
 * 修改人： luoyan  2017-7-7  验证使用onDutyValidateService公用方法   
 */
@Transactional
@Service("onDutyDeptService")
public class OnDutyDeptServiceImpl implements OnDutyDeptService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name = "organizationService")
	private OrganizationService organizationService;
	@Resource(name = "ondutyInsertService")
	private OndutyInsertService ondutyInsertService;
	@Resource(name="onDutyValidateService")
	private OnDutyValidateService onDutyValidateService;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OnDutyDeptDTO> getOnDutyDeptDTOList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Organization organization = new Organization();
		organization.setId(OrganizationIdUtil.CON_ONDUTY_ORG_PARENTIDS);
		// 获取昆明通信段中的所有组织机构
		List<Organization> canOnDutyOrgs = organizationService.getChildrenByParent(organization);
		
		String hql = "From OnDutyDept";
		Query query = session.createQuery(hql);
		List<OnDutyDept> onDutyDepts = query.list();
		
		Map<String, OnDutyDept> onDutyDeptMap = new HashMap<String, OnDutyDept>();
		for(OnDutyDept onDutyDept : onDutyDepts) {
			onDutyDeptMap.put(onDutyDept.getOrgId(), onDutyDept);
		}
		
		return getOnDutyDeptDTOs(canOnDutyOrgs,onDutyDeptMap);
	}
	/**
	 * 已经标记值班组织机构
	 * getOnDutyDeptDTOs 
	 * @return
	 * @author luoyan
	 */
	private List<OnDutyDeptDTO> getOnDutyDeptDTOs(List<Organization> canOnDutyOrgs,Map<String, OnDutyDept> onDutyDeptMap) {
		List<OnDutyDeptDTO> onDutyDeptDTOs = new ArrayList<OnDutyDeptDTO>();
		OnDutyDeptDTO onDutyDeptDTO = null;
		for(Organization canOnDutyOrg : canOnDutyOrgs) {
			onDutyDeptDTO = new OnDutyDeptDTO();
			onDutyDeptDTO.setOrgId(canOnDutyOrg.getId());
			onDutyDeptDTO.setOrgName(canOnDutyOrg.getName());
			if(onDutyDeptMap.get(canOnDutyOrg.getId()) == null) {
				onDutyDeptDTO.setHasOnDuty(false);
			} else {
				onDutyDeptDTO.setHasOnDuty(true);
			}
			onDutyDeptDTOs.add(onDutyDeptDTO);
		}
		return onDutyDeptDTOs;
	}

	@Override
	public void save(String orgId) {
		Session session = sessionFactory.getCurrentSession();
		if (orgId != null && !orgId.isEmpty()) {
			OnDutyDept odd = new OnDutyDept();
			odd.setOrgId(orgId);
			session.saveOrUpdate(odd);
		}
	}

	@Override
	public void save(String[] orgIds) {
		if (orgIds != null) {
			for (String orgId : orgIds) {
				this.save(orgId);
			}
		}
	}	

	@Override
	public void removeAll() {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("Delete From OnDutyDept odd").executeUpdate();
	}

	@Override
	public void saveOnDutyOrg(String[] orgIds) {
		this.removeAll();
		this.save(orgIds);
	}
	
	
	@Override
	public List<ValidateMsg> validate(String originFileName,List<ValidateMsg> msgs, Workbook wb,User createUser) {
		String orgId = createUser.getOrganization().getId();
		List<ValidateMsg> results = fileTypeValidate(originFileName,msgs,wb,orgId);//对文件进行验证（文件标题）
		if(results.isEmpty()){//数据的有效性验证（是否有空行，单元格是否为空，日期与星期是否匹配，值班人与值班部门是否存在系统组织里）
			results = onDutyValidateService.ondutyDeptAndPeopleValidate(originFileName, msgs, wb, orgId);
		}
		if(results.isEmpty()){//验证数据是否重复
			results = onDutyValidateService.ondutyRepeatValidate(originFileName,msgs,wb);
		}
		if(results.isEmpty()){//无任何错误信息（导入数据库）
			ondutyInsertService.batchInsertDeviceAnalyse(wb,createUser);
		}
		return results;
	}
	
	private List<ValidateMsg> fileTypeValidate(String originFileName,List<ValidateMsg> msgs, Workbook wb,String orgId){
		Sheet sheet = wb.getSheetAt(0);
		String title = CellUtil.getTitle(sheet,orgId);
		if(StringUtils.isBlank(title) || !title.equals("部门值班管理信息表")){
			ValidateMsg m = new ValidateMsg();
			m.setRow("1");
			m.setSheet(sheet.getSheetName());
			m.setFileName(originFileName);
			m.setErrorMsg("文件标题有误，应为【部门值班管理信息表】");
			msgs.add(m);
		}
		return msgs;
	}
	
	
	
}
