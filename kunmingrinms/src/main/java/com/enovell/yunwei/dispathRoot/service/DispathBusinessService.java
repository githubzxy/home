package com.enovell.yunwei.dispathRoot.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.dto.UploadFileDto;
import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.system.dto.NameAndIdDTO;

import java.util.List;


/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathBusinessService   
 * 类描述:  调度管理业务接口
 * 创建人：lidt 
 * 创建时间：2016-12-16 上午10:30:57
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:30:57   
 *
 */
public interface DispathBusinessService {
	
	/**
	 * 
	 * addAndSend 新增并派发
	 *
	 * @param dispathRoot 调令
	 * @param dtos
	 * @return
	 */
	public DispathRoot addAndSend(DispathRoot dispathRoot, UploadFileDto[] dtos);

	/**
	 *
	 * updateAndSend 修改并派发
	 *
	 * @param dispathRoot 调令
	 * @param dtos
	 * @param user 登录用户
	 * @return
	 */
	public DispathRoot updateAndSend(DispathRoot dispathRoot, UploadFileDto[] dtos, User user);

	/**
	 *
	 * updateYiPaiAndSave 修改已派发并保存
	 *
	 * @param dispathRoot 调令
	 * @param dtos
	 * @param user 登录用户
	 */
	public void  updateYiPaiAndSave(DispathRoot dispathRoot, UploadFileDto[] dtos, User user);

	/**
	 *
	 * send 派发
	 *
	 * @param dispathRoot 调令
	 * @return
	 */
	public DispathRoot send(DispathRoot dispathRoot);

	/**
	 *
	 * receive 接收
	 *
	 * @param dispathRoot 调令
	 */
	public void receive(DispathRoot dispathRoot);

	/**
	 *
	 * turnToSend 转派
	 *
	 * @param dispathRoot 调令
	 * @param user 登录用户
	 */
	public void turnToSend(DispathRoot dispathRoot, User user);

	/**
	 *
	 * assign 分派
	 *
	 * @param dispathRoot 调令
	 * @param users 分派人员
	 */
	public Boolean assign(DispathRoot dispathRoot, List<User> users);

	/**
	 *
	 * reply 回复-由于是自动归档，所以最后一个回复完成后就全部归档了
	 *
	 * @param dispathRoot 调令
	 * @param dtos
	 * @param user 登录用户
	 */
	public Boolean reply(DispathRoot dispathRoot, UploadFileDto[] dtos, User user);
	
	/**
	 * 
	 * file 归档
	 *
	 * @param panrentDispath 调令
	 */
	public void file(DispathRoot panrentDispath);
	
	/**
	 * 
	 * updateSelectUsers 变更执行人
	 * @param dispathId 调令id
	 * @param receiveUserIds 执行人
	 * @param user 当前登陆人
	 * @param organizations 受令单位
	 * @return 1-无变化,null-操作成功
	 * 
	 */
	public String updateSelectUsers(String dispathId, List<String> receiveUserIds, User user, String organizations);
	
	/**
	 * 
	 * getSelectUsersByOrgId 根据组织机构id查询用户（用于多选显示）
	 * @param id 待转派命令的id
	 * @param orgId 组织机构id
	 * @return
	 */
	public List<NameAndIdDTO> getSelectUsersByOrgId(String id, String orgId);
	
	/**    
	 * turnToSendMultiUser 转派命令（能多选）
	 * @param id 待转派命令id
	 * @param receiveUserId 转派接收人集合
	 */
	public void turnToSendMultiUser(String id, String receiveUserId);

	public Boolean ChangeReveive(DispathRoot dispathRoot, User user);
	
}
