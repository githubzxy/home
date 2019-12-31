package com.enovell.yunwei.message.service;

import java.util.Date;
import java.util.List;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.message.domain.IssueMessage;
import com.enovell.yunwei.message.dto.IssueMessageDTO;
import com.enovell.yunwei.onduty.domain.OnDuty;

/**
 * 
 * 项目名称：RINMS2MAIN
 * 类名称：MessageService   
 * 类描述:  信息发布接口
 * 创建人：lidt 
 * 创建时间：2016-11-25 下午2:08:38
 * 修改人：lidt 
 * 修改时间：2016-11-25 下午2:08:38   
 *
 */
public interface MessageService {
	
	/**
	 * 
	 * getMessage 首页显示
	 * @param m
	 * @param i
	 * @param j
	 * @return
	 */
	List<IssueMessage> getMessage(IssueMessage m, int i, int j); 
	
	/**
	 * 
	 * getMessageById 根据id获取信息发布
	 * @param id
	 * @return
	 */
	public IssueMessage getMessageById(String id);
	
	/**
	 * 
	 * getMessageDtoById 根据id获取信息发布
	 * @param id
	 * @return
	 */
	public IssueMessageDTO getMessageDtoById(String id);

	/**
	 * 
	 * addIssueMessage 新增信息发布
	 * @param issueMessageDTO 新增的数据
	 * @param user 登录用户
	 * @return
	 */
	public IssueMessage addIssueMessage(IssueMessageDTO issueMessageDTO, User user);
	
	/**
	 * 
	 * updateIssueMessage 修改信息发布
	 * @param issueMessageDTO 修改的数据
	 * @param user 登录用户
	 * @return
	 */
	public IssueMessage updateIssueMessage(IssueMessageDTO issueMessageDTO, User user);
	
	/**
	 * 
	 * deleteIssueMessage 批量删除信息发布
	 * @param ids
	 */
	public void deleteIssueMessages(String ids);
	
	/**
	 * 
	 * topIssueMessage 批量置顶信息发布
	 * @param ids
	 */
	public void topIssueMessages(String ids);
	/**
	 * 
	 * cancelIssueMessage 批量取消置顶信息发布
	 * @param ids
	 */
	public void cancelIssueMessages(String ids);
	
	/**
	 * 
	 * getIssueMessages 获取信息发布数据
	 * @param technicalInfoDTO
	 * @param first
	 * @param max
	 * @return
	 */
	public GridDto<IssueMessageDTO> getIssueMessages(IssueMessageDTO issueMessageDTO,int start,int limit);
	
	/**
	 * 获取信息发布数据数
	 * @param technicalInfoDTO
	 * @return
	 */
	public int getIssueMessageCount(IssueMessageDTO issueMessageDTO);

	
	/**    
	 * getAllIssueMessage 根据条件查询所有发布的信息，用于导出excel
	 * @param issueMessageDTO 条件
	 * @return
	 */
	List<IssueMessageDTO> getAllIssueMessage(IssueMessageDTO issueMessageDTO);
	/**
	 * 
	 */
	List<OnDuty> getDutyMessage(String date); 
	/**
	 * 搜索栏发布部门下拉框数据源
	 * 
	 */
	List<String> getIssueOrgName();
	/**
	 *根据登录用户组织名获取其上级部门id
	 */
	String getOrgIdByLoginOrgName(String OrgName);
}
