package com.enovell.yunwei.communicate.dto;

import java.io.Serializable;
import java.util.Date;
/**
 * 项目名称：kunmingrinms
 * 类名称：CommunicateDTO   
 * 类描述:  通信演练计划显示DTO
 * 创建人：yangsy 
 * 创建时间：2016-12-19 
 */
public class CommunicateDTO implements Serializable {
	
	
	private static final long serialVersionUID = 4412509265482701660L;
	/**
	 * 主键id
	 */
	private String id;
	/**
	 * 计划名称
	 */
	private String name;
	/**
	 * 创建人
	 */
	private String user;
	/**
	 * 创建时间
	 */
	private Date time;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
}
