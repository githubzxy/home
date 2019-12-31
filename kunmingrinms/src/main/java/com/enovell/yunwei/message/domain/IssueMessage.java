package com.enovell.yunwei.message.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.util.DataExistStatus;

/**
 * 
 * 项目名称：RINMS2MAIN
 * 类名称：IssueMessage   
 * 类描述:  信息发布
 * 创建人：lidt 
 * 创建时间：2016-11-25 下午2:07:37
 * 修改人：lidt 
 * 修改时间：2016-11-25 下午2:07:37   
 *
 */
@Entity
@Table(name = "MESSAGE")
public class IssueMessage implements Serializable {
	private static final long serialVersionUID = 5892367664650441186L;

	/**
	 * 没有发布
	 */
	public static final int NOTISSUE = 1;
	/**
	 * 已发布
	 */
	public static final int ISISSUE = 2;
	/**
	 * 没有置顶
	 */
	public static final String NOTTOP = "2";
	/**
	 * 已置顶
	 */
	public static final String ISTOP = "1";

	/**
	 * Id
	 */
	private String id;

	/**
	 * 信息主题
	 */
	private String theme;

	/**
	 * 信息类型
	 */
	private Integer type;

	/**
	 * 信息内容
	 */
	private String content;

	/**
	 * 发布时间
	 */
	private Date issueTime;

	/**
	 * 发布人
	 */
	private User issueUser;
	/**
	 * 发布部门
	 */
	private String issueOrgName;
	/**
	 * 发布人组织id
	 */
	private String orgId;
	/**
	 * 发布人组织类型
	 */
	private Integer orgType;
	
	/**
	 * 创建时间
	 */
	private Date createTime;

	/**
	 * 创建人
	 */
	private User createUser;

	/**
	 * 附件
	 */
	private AttachFile attachFile;

	/**
	 * 是否发布 1 没有发布 2 已发布
	 */
	private int issue;
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	private Boolean exist = DataExistStatus.EXIST;
	/**
	 * 置顶状态   “是”置顶   “否”不置顶
	 */
	private String topStatus;

	@Id
	@Column(name = "PROBLEM_ID", length = 32)
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "THEME")
	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	@Column(name = "MESSAGE_TYPE")
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	@Column(name = "ISSUE_ORGNAME")
	public String getIssueOrgName() {
		return issueOrgName;
	}

	public void setIssueOrgName(String issueOrgName) {
		this.issueOrgName = issueOrgName;
	}
	@Column(name = "CONTENT")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	@Column(name = "ORGID")
	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	@Column(name = "ORGTYPE")
	public Integer getOrgType() {
		return orgType;
	}

	public void setOrgType(Integer orgType) {
		this.orgType = orgType;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ISSUE_TIME")
	public Date getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(Date issueTime) {
		this.issueTime = issueTime;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ISSUE_USER")
	public User getIssueUser() {
		return issueUser;
	}
	
	public void setIssueUser(User issueUser) {
		this.issueUser = issueUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ATTACHFILE_")
	public AttachFile getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(AttachFile attachFile) {
		this.attachFile = attachFile;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CREATE_USER")
	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	@Column(name = "ISSUE")
	public int getIssue() {
		return issue;
	}

	public void setIssue(int issue) {
		this.issue = issue;
	}
	
	@Column(name = "EXIST_")
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}
	
	@Column(name = "TOP_STATUS_")
	public String getTopStatus() {
		return topStatus;
	}
	public void setTopStatus(String topStatus) {
		this.topStatus = topStatus;
	}

	@Override
	public String toString() {
		return "IssueMessage [id=" + id + ", theme=" + theme + ", type=" + type + ", content=" + content
				+ ", issueTime=" + issueTime + ", issueUser=" + issueUser + ", issueOrgName=" + issueOrgName
				+ ", orgId=" + orgId + ", orgType=" + orgType + ", createTime=" + createTime + ", createUser="
				+ createUser + ", attachFile=" + attachFile + ", issue=" + issue + ", exist=" + exist + ", topStatus="
				+ topStatus + "]";
	}




}
