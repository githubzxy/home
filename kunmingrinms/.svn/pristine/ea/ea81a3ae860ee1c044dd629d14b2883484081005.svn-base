package com.enovell.yunwei.system.domain;


import com.enovell.system.common.domain.User;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * 消息提醒
 * 用于待办提醒
 * 
 * 有n（红色）条内部请示待处理
 * 
 * 项目名称：guangtieYearMonth
 * 类名称：MessageRemind.java
 * 类描述:  
 * 创建人：潘忠瑞
 * 创建时间：2014-11-25
 * 修改人：潘忠瑞
 * 修改时间：2014-11-25 
 *
 */
@Entity
@Table(name = "MESSAGE_REMIND")
public class MessageRemind {
	
	/**
	 * 内部请示-车间
	 */
	public static final String INNERREQUEST_WORKSHOP = "1";
	 
	 /**
	  * 内部请示-管理员
	  */
	public static final String INNERREQUEST_MANAGER = "2";
	 
	 /**
	  * 内部请示-段科室
	  */
	public static final String INNERREQUEST_SEGMENT = "3";
	 
	 /**
	  * 内部请示-主管领导
	  */
	public static final String INNERREQUEST_LEADER = "4";
	
	 /**
	  * 内部请示-段长，书记
	  */
	public static final String INNERREQUEST_BIG_LEADER = "5";
	
	private String id;
	/**
	 * 接收人
	 */
	private User receptUser;
	/**
	 * 发起时间
	 */
	private Date sendDate;
	/**
	 * 消息内容
	 */
	private String content;
	/**
	 * 消息类型
	 */
	private String type;
	/**
	 * 数据条数
	 */
	private int count;
	/**
	 * 存储的数据在表中的id
	 */
	private String objId;
	@Id
	@Column(name = "ID_")
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid" , strategy = "uuid")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="RECEPT_USER_")
	public User getReceptUser() {
		return receptUser;
	}
	public void setReceptUser(User receptUser) {
		this.receptUser = receptUser;
	}
	
	@Temporal(value=TemporalType.TIMESTAMP)
	@Column(name="SEND_DATE_")
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	
	@Column(name="CONTENT_")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name="TYPE_")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name="COUNT_")
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Column(name = "OBJ_ID_")
	public String getObjId() {
		return objId;
	}
	public void setObjId(String objId) {
		this.objId = objId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MessageRemind other = (MessageRemind) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
