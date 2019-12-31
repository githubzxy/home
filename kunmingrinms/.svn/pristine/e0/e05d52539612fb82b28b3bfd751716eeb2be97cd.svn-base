package com.enovell.yunwei.commNetworkStop.service.impl;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.attach.service.AttachFileService;
import com.enovell.yunwei.commNetworkStop.domain.CommNetStop;
import com.enovell.yunwei.commNetworkStop.dto.CommNetStopDto;
import com.enovell.yunwei.commNetworkStop.dto.CommNetStopShowDto;
import com.enovell.yunwei.commNetworkStop.service.CommNetStopService;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.util.DataExistStatus;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**      
 * 项目名称：tldw
 * 类名称：CommNetStopServiceImpl   
 * 类描述:  通信网停机要点 接口实现类
 * 创建人：ltf
 * 创建时间：2016-11-21 上午11:01:15
 * 修改人：ltf
 * 修改时间：2016-11-21 上午11:01:15
 */
@Service("commNetStopService")
@SuppressWarnings("unchecked")
@Transactional
public class CommNetStopServiceImpl implements CommNetStopService {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Resource(name="attachFileService")
    AttachFileService attachFileService;
	
	@Override
	public List<String> getRailLineNames(){
		String sql=" select rl.name_ from res_base_rail_line rl " ;
		Query query=sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<String> railLineNames=query.list();
		return railLineNames;
	}
	
	private boolean railLineIsExist(String railLineName){
		String sql=" select rl.name_ from res_base_rail_line rl where rl.name_ like :railLineName " ;
		Query query=sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("railLineName", railLineName);
		List<String> railLineNames=query.list();
		return railLineNames.size()>0?true:false;
	}
	
	@Override
	public CommNetStop addCommNetStop(CommNetStop commNetStop, UploadFileDto[] dtos, User user) throws Exception {
		//判断线路名称是否存在
		if(!railLineIsExist(commNetStop.getRailLineName())){
			throw new Exception("线路不正确，请重新选择");
		}
		if(dtos.length>0){
			//保存添加的附件及上传文件相关信息
			AttachFile attachFile=attachFileService.addAttachFile(dtos, user);
			commNetStop.setAttachFile(attachFile);//若有附件，则添加至'停机要点信息'中
		}
		commNetStop.setState(CommNetStop.WAIT_EXAMINE);//设置状态为'待审核'
		commNetStop.setCreateDate(new Date());//创建时间
		commNetStop.setApplyOrg(user.getOrganization());//申请单位
		sessionFactory.getCurrentSession().save(commNetStop);
		return commNetStop;
	}

	@Override
	public CommNetStop updateCommNetStop(CommNetStop param, UploadFileDto[] dtos, User user) throws Exception {
		//判断线路名称是否存在
		if(!railLineIsExist(param.getRailLineName())){
			throw new Exception("线路不正确，请重新选择");
		}
		CommNetStop cns=searchCommNetStopById(param.getId());
		cns.setRailLineName(param.getRailLineName());
		cns.setBelongOffice(param.getBelongOffice());
		cns.setStartDate(param.getStartDate());
		cns.setEndDate(param.getEndDate());
		cns.setWorkContent(param.getWorkContent());
		cns.setBelongCraft(param.getBelongCraft());
		cns.setExecutionType(param.getExecutionType());
		cns.setExecutionAttr(param.getExecutionAttr());
		cns.setExecutionAddr(param.getExecutionAddr());
		cns.setMainNetName(param.getMainNetName());
		cns.setRailwaysBureau(param.getRailwaysBureau());
		cns.setPlanCaption(param.getPlanCaption());
		cns.setSkyLight(param.getSkyLight());
		if(dtos.length>0){
			//保存添加的附件及上传文件相关信息
			AttachFile attachFile=attachFileService.addAttachFile(dtos, user);
			cns.setAttachFile(attachFile);//若有附件，则添加至'停机要点信息'中
		}else {
			// 上传文件为空
			cns.setAttachFile(null);
		}
		cns.setState(CommNetStop.WAIT_EXAMINE);//设置状态为'待审核'
		cns.setCreateDate(new Date());//修改时间
		cns.setApplyOrg(user.getOrganization());//申请单位
		sessionFactory.getCurrentSession().saveOrUpdate(cns);
		return cns;
	}

	@Override
	public void deleteCommNetStop(String[] idArr) {
		String hql=" update CommNetStop cns set cns.exist=:exist where cns.id in (:idArr) ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("exist", DataExistStatus.NOT_EXIST);
		query.setParameterList("idArr", idArr).executeUpdate();
	}
	
	
	/**    
	 * convertCommNetStopToShowDto 将停机要点信息转化为前台展示的数据信息
	 * @param cns
	 * @return
	 */
	private CommNetStopShowDto convertCommNetStopToShowDto(CommNetStop cns){
		CommNetStopShowDto showDto=new CommNetStopShowDto();
		showDto.setId(cns.getId());
		showDto.setState(cns.getState());
		showDto.setStartDate(cns.getStartDate());
		showDto.setEndDate(cns.getEndDate());
		showDto.setRailLineName(cns.getRailLineName());
		showDto.setApplyOrgName(cns.getApplyOrg().getName());//申请单位名称
		showDto.setExecutionAddr(cns.getExecutionAddr());
		showDto.setBelongCraft(cns.getBelongCraft());
		showDto.setExecutionType(cns.getExecutionType());
		showDto.setExecutionAttr(cns.getExecutionAttr());
		showDto.setWorkContent(cns.getWorkContent());
		showDto.setMainNetName(cns.getMainNetName());
		showDto.setRailwaysBureau(cns.getRailwaysBureau());
		showDto.setPlanExaminNum(cns.getPlanExaminNum());
		showDto.setMonthPlanExamin(cns.getMonthPlanExamin());
		showDto.setExecutionPlanNum(cns.getExecutionPlanNum());
		showDto.addStateColor(showDto.getState());//不同记录显示不同的颜色
		showDto.setSkyLight(cns.getSkyLight());
		return showDto;
	}
	
	@Override
	public GridDto<CommNetStopShowDto> searchCommNetStopShowDto(CommNetStopDto dto, int start, int limit){
		GridDto<CommNetStopShowDto> gridDto=new GridDto<CommNetStopShowDto>();

		//条件查询停机要点
		List<CommNetStop>  commNetStopList=searchCommNetStop(dto, start, limit);
		List<CommNetStopShowDto> showDtoList=new ArrayList<CommNetStopShowDto>();
		for(CommNetStop cns:commNetStopList){
			//将停机要点信息转化为前台展示的数据信息
			CommNetStopShowDto showDto=convertCommNetStopToShowDto(cns);
			showDtoList.add(showDto);
		}
		gridDto.setRows(showDtoList);
		gridDto.setResults(searchCount(dto));
		return gridDto;
	}
	
	
	/**
	 * 将查询条件dto设置到Criteria对象中
	 * @param dto
	 * @return
	 */
	private Criteria  getCriteriaByDto(Criteria criteria, CommNetStopDto dto){
		if(dto==null){
			return criteria;
		}
		String railLineName=dto.getRailLineName();
		if(StringUtils.isNotBlank(railLineName)){
		criteria.add(Restrictions.like("railLineName", "%"+railLineName.trim()+"%"));
		}
		String workContent=dto.getWorkContent();
		if(StringUtils.isNotBlank(workContent)){
		criteria.add(Restrictions.eq("workContent", workContent));
		}
		String orgId=dto.getOrg();
		if(StringUtils.isNotBlank(orgId)){
			criteria.add(Restrictions.eq("o.id", orgId));
		}
		Integer belongCraft=dto.getBelongCraft();
		if(belongCraft!=null){
		criteria.add(Restrictions.eq("belongCraft", belongCraft));
		}
		Integer executionType=dto.getExecutionType();
		if(executionType!=null){
		criteria.add(Restrictions.eq("executionType", executionType));
		}
		Integer executionAttr=dto.getExecutionAttr();
		if(executionAttr!=null){
		criteria.add(Restrictions.eq("executionAttr", executionAttr));
		}
		String mainNetName=dto.getMainNetName();
		if(StringUtils.isNotBlank(mainNetName)){
		criteria.add(Restrictions.like("mainNetName", "%"+mainNetName.trim()+"%"));
		}
		Integer state=dto.getState();
		
		if(state!=null){
		criteria.add(Restrictions.eq("state", state));
		}
		if(dto.getSkyLight()!=null){
			criteria.add(Restrictions.eq("skyLight",dto.getSkyLight()));
		}
		return criteria;
	}
	@Override
	public List<CommNetStop> searchCommNetStop(CommNetStopDto dto, int start, int limit) {
		Criteria criteria=sessionFactory.getCurrentSession().createCriteria(CommNetStop.class)
				.add(Restrictions.eq("exist", DataExistStatus.EXIST))
				.setFetchMode("applyOrg", FetchMode.JOIN)
				.createAlias("applyOrg", "o");
		
		criteria=getCriteriaByDto(criteria,dto);
		criteria.addOrder(Order.desc("createDate"));
		criteria.setFirstResult(start);
		criteria.setMaxResults(limit);
		return criteria.list();
	}

	@Override
	public Long searchCount(CommNetStopDto dto) {
		Criteria criteria=sessionFactory.getCurrentSession().createCriteria(CommNetStop.class)
						  .add(Restrictions.eq("exist", DataExistStatus.EXIST))
						  .setFetchMode("applyOrg", FetchMode.JOIN)
						  .createAlias("applyOrg", "o");
		criteria=getCriteriaByDto(criteria, dto);
		criteria.setProjection(Projections.rowCount());
		return (Long) criteria.uniqueResult();
	}
	
	
	@Override
	public CommNetStop searchCommNetStopById(String id) {
		Criteria criteria=sessionFactory.getCurrentSession().createCriteria(CommNetStop.class)
				.setFetchMode("applyOrg", FetchMode.JOIN)
				.add(Restrictions.eq("id", id));
		return (CommNetStop)criteria.uniqueResult();
	}
	
	@Override
	public void examin(CommNetStop param, UploadFileDto[] dtos, User user) {
		CommNetStop cns=searchCommNetStopById(param.getId());
		if(dtos.length>0){
			//保存添加的附件及上传文件相关信息
			AttachFile attachFile=attachFileService.addAttachFile(dtos, user);
			cns.setExaminFile(attachFile);//若有附件，则添加至'停机要点信息审核附件'中
		}
		cns.setPlanExaminNum(param.getPlanExaminNum());
		cns.setMonthPlanExamin(param.getMonthPlanExamin());
		cns.setExecutionPlanNum(param.getExecutionPlanNum());
		cns.setState(CommNetStop.WAIT_REPLY);//审核后状态改为'待回复'
		sessionFactory.getCurrentSession().saveOrUpdate(cns);
	}

	@Override
	public void replyCommNetStop(CommNetStop param, UploadFileDto[] replyFileDtos, User user) {
		CommNetStop cns=searchCommNetStopById(param.getId());
		if(replyFileDtos.length>0){
			//保存回复附件
			AttachFile attachFile=attachFileService.addAttachFile(replyFileDtos, user);
			cns.setRestoreFile(attachFile);
		}
		cns.setSituationCaption(param.getSituationCaption());
		cns.setState(param.getState());
		sessionFactory.getCurrentSession().saveOrUpdate(cns);
	}

	@Override
	public void cancelCommNetStop(String id) {
		CommNetStop cns=searchCommNetStopById(id);
		cns.setState(CommNetStop.CANCEL);//状态改为取消
		sessionFactory.getCurrentSession().saveOrUpdate(cns);
	}

	@Override
	public void updateAndExamin(CommNetStop commNetStop,
                                UploadFileDto[] uploadFileDtos, UploadFileDto[] checkFileDtos, User user) throws Exception{
		//判断线路名称是否存在
		if(!railLineIsExist(commNetStop.getRailLineName())){
			throw new Exception("线路不正确，请重新选择");
		}
		
		CommNetStop cns=searchCommNetStopById(commNetStop.getId());
		if(uploadFileDtos.length>0){
			//保存修改后的附件
			AttachFile uploadFile=attachFileService.addAttachFile(uploadFileDtos, user);
			cns.setAttachFile(uploadFile);
		}else {
			// 上传文件为空
			cns.setAttachFile(null);
		}
		if(checkFileDtos.length>0){
			//保存审核附件
			AttachFile checkFile=attachFileService.addAttachFile(checkFileDtos, user);
			cns.setExaminFile(checkFile);
		}
		cns.setRailLineName(commNetStop.getRailLineName());
		cns.setStartDate(commNetStop.getStartDate());
		cns.setEndDate(commNetStop.getEndDate());
		cns.setBelongOffice(commNetStop.getBelongOffice());
		cns.setWorkContent(commNetStop.getWorkContent());
		cns.setBelongCraft(commNetStop.getBelongCraft());
		cns.setExecutionType(commNetStop.getExecutionType());
		cns.setExecutionAttr(commNetStop.getExecutionAttr());
		cns.setExecutionAddr(commNetStop.getExecutionAddr());
		cns.setMainNetName(commNetStop.getMainNetName());
		cns.setRailwaysBureau(commNetStop.getRailwaysBureau());
		cns.setPlanCaption(commNetStop.getPlanCaption());
		cns.setPlanExaminNum(commNetStop.getPlanExaminNum());
		cns.setMonthPlanExamin(commNetStop.getMonthPlanExamin());
		cns.setExecutionPlanNum(commNetStop.getExecutionPlanNum());
		cns.setState(CommNetStop.WAIT_REPLY);//审核之后状态为“待回复”
        cns.setSkyLight(commNetStop.getSkyLight());
		sessionFactory.getCurrentSession().saveOrUpdate(cns);
	}
	
}
