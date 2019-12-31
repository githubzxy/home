package com.enovell.yunwei.system.service;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.domain.MessageRemind;

import java.util.List;

/**
 * 消息提醒接口
 * 
 * 项目名称：guangtieYearMonth
 * 类名称：MessageRemindService.java
 * 类描述:  
 * 创建人：潘忠瑞
 * 创建时间：2014-11-25
 * 修改人：潘忠瑞
 * 修改时间：2014-11-25 
 *
 */
public interface MessageRemindService {
	/**
	 * 通过人获取当前登录人的消息提醒
	 * @param user
	 * @return 
	 * List 消息组
	 * Map<,>
	 */
	public List<MessageRemind> getMessageByUser(User user);
	/**
	 * 通过人获取当前登录人的消息提醒，返回一个组装的数组包含id组，数量和类型
	 * @param user
	 * @return
	 */
	public List<Object[]> getMessageDtoByUser(User user);
	/**
	 * 根据id字符串删除数据
	 * @param ids
	 */
	public void delMsg(String ids);
	/**
	 * 根据登录人删除该登录人的消息
	 * @param user
	 */
	public void delMsgByUser(User user);
	/**
	 * 新增一条消息提醒
	 * @param receptUser 设置消息接收人
	 * @param type 消息类型（属于哪个模块）
	 * @param objId 当前操作数据对象的id
	 * @return
	 */
	public MessageRemind add(User receptUser, String type, String objId);
	/**
	 * 通过数据对象的id删除消息
	 * @param objId
	 */
	public void delByObjId(String objId);
}
