package com.enovell.yunwei.dispathRoot.domain;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathRoot   
 * 类描述:  调度命令实体
 * 创建人：lidt 
 * 创建时间：2016-11-29 上午10:39:39
 * 修改人：lidt 
 * 修改时间：2016-11-29 上午10:39:39   
 *
 */
@Entity
@Table(name = "DISPATHROOT")
public class DispathRoot implements Serializable {

	private static final long serialVersionUID = -5261410393500010734L;

	/**
	 * 草稿 1
	 */
	public static final String CAO_GAO = "1";

	/**
	 * 已派发 2
	 */
	public static final String YI_PAI_FA = "2";

	/**
	 * 待接收 3
	 */
	public static final String DAI_JIE_SHOU = "3";
	/**
	 * 接收 3.5
	 */
	public static final String YI_JIE_SHOU = "3.5";
	/**
	 * 处理中 4
	 */
	public static final String CHU_LI_ZHONG = "4";
	/**
	 * 待回复5
	 */
	public static final String DAI_HUI_FU = "5";
	/**
	 * 已回复6
	 */
	public static final String YI_HUI_FU = "6";
	/**
	 * 已分派7
	 */
	public static final String YI_FEN_PAI = "7";
	/**
	 * 已归档 8
	 */
	public static final String YI_GUI_DANG = "8";
	/**
	 * 是根1
	 */
	public static final String IS_ROOT = "1";
	/**
	 * 不是根2
	 */
	public static final String IS_NOT_ROOT = "2";
	
	//超期状态
	/**
	 * 超期
	 */
	final  static public String IS_OVERTIME = "1";
	
	/**
	 * 没有超期
	 */
	final static public String IS_NOT_OVERTIME = "2";

	private String id;

	/**
	 * 调令标题（因业务要求，该字段已废除）
	 */
	private String title;
	
	/**
	 * 命令号
	 */
	private String dispatchNum;
	
	/**
	 * 创建人
	 */
	private User createUser;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 发令人
	 */
	private User sendUser;
	/**
	 * 发令时间
	 */
	private Date sendDate;
	/**
	 * 受令人
	 */
	private Set<User> acceptUser = new HashSet<User>();
	/**
	 * 抄送人
	 */
	private Set<User> copyUser = new HashSet<User>();
	/**
	 * 领导批示
	 */
	private String suggestion;
	/**
	 * 调度命令附件
	 */
	private AttachFile attachFile;

	/**
	 * 回复附件
	 */
	private AttachFile replyAttachFile;
	/**
	 * 回复内容
	 */
	private String replyContent;
	/**
	 * 回复时间
	 */
	private Date replyDate;
	/**
	 * 根调令
	 */
	private DispathRoot root;
	/**
	 * 所属父调度
	 */
	private DispathRoot parentDispath;
	/**
	 * 当前调度所属人
	 */
	private User user;
	/**
	 * 子任务
	 */
	private Set<DispathRoot> children = new HashSet<DispathRoot>();
	/**
	 * 是否是根 1-是 2-不是
	 */
	private String isRoot;
	/**
	 * 临时分派意见，组装后的数据
	 */
	private String tempAssignRemark;
	/**
	 * 分派备注
	 */
	private String assignRemark;
	/**
	 * 状态
	 */
	private String status;
	/**
	 * 值班调度
	 */
	private String dispatchUser;
	/**
	 * 命令签发者
	 */
	private String issueUser;
	/**
	 * 受令单位
	 */
	private String organization;
	/**
	 * 受理时间
	 */
	private Date acceptDate;
	/**
	 * 完成期限
	 */
	private Date deadLine;
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	private Boolean exist = DataExistStatus.EXIST;
	
	/**
	 * 颜色控制 状态status对应的颜色
	 */
	private boolean caogao;
	private boolean daijieshou;
	private boolean chulizhong;
	private boolean yiguidang;
	
	private boolean daihuifu;
	private boolean yihuifu;
	private boolean yifenpai;
	private boolean yiChaoQi;
	
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(name = "ID_")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "TITLE_")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "DISPATCHNUM_")
	public String getDispatchNum() {
		return dispatchNum;
	}

	public void setDispatchNum(String dispatchNum) {
		this.dispatchNum = dispatchNum;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CREATEUSER_ID_")
	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATEDATE_")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SENDUSER_ID_")
	public User getSendUser() {
		return sendUser;
	}

	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "SENDDATE_")
	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	@ManyToMany
	@JoinTable(name = "DISPATH_ACCEPT_USER", joinColumns = { @JoinColumn(name = "DISPATH_ID_") }, inverseJoinColumns = { @JoinColumn(name = "USER_ID") })
	public Set<User> getAcceptUser() {
		return acceptUser;
	}

	public void setAcceptUser(Set<User> acceptUser) {
		this.acceptUser = acceptUser;
	}

	@ManyToMany
	@JoinTable(name = "DISPATH_COPY_USER", joinColumns = { @JoinColumn(name = "DISPATH_ID_") }, inverseJoinColumns = { @JoinColumn(name = "USER_ID") })
	public Set<User> getCopyUser() {
		return copyUser;
	}

	public void setCopyUser(Set<User> copyUser) {
		this.copyUser = copyUser;
	}

	@Column(name = "SUGGESTION_", length = 1000)
	public String getSuggestion() {
		return suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ATTACHFILE_ID_")
	public AttachFile getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(AttachFile attachFile) {
		this.attachFile = attachFile;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "REPLY_ATTACHFILE_ID_")
	public AttachFile getReplyAttachFile() {
		return replyAttachFile;
	}

	public void setReplyAttachFile(AttachFile replyAttachFile) {
		this.replyAttachFile = replyAttachFile;
	}

	@Column(name = "REPLY_CONTENT_", length = 1000)
	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ROOT_ID_")
	public DispathRoot getRoot() {
		return root;
	}

	public void setRoot(DispathRoot root) {
		this.root = root;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PARENT_DISPATH_ID_")
	public DispathRoot getParentDispath() {
		return parentDispath;
	}

	public void setParentDispath(DispathRoot parentDispath) {
		this.parentDispath = parentDispath;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USER_ID_")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parentDispath")
	public Set<DispathRoot> getChildren() {
		return children;
	}

	public void setChildren(Set<DispathRoot> children) {
		this.children = children;
	}

	@Column(name = "ISROOT_")
	public String getIsRoot() {
		return isRoot;
	}

	public void setIsRoot(String isRoot) {
		this.isRoot = isRoot;
	}

	@Column(name = "ASSIGNREMARK_", length = 2000)
	public String getAssignRemark() {
		return assignRemark;
	}

	public void setAssignRemark(String assignRemark) {
		this.assignRemark = assignRemark;
	}

	@Transient
	public String getTempAssignRemark() {
		return tempAssignRemark;
	}

	public void setTempAssignRemark(String tempAssignRemark) {
		this.tempAssignRemark = tempAssignRemark;
	}

	@Column(name = "STATUS_")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "REPLY_DATE_")
	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	@Column(name = "DISPATCHUSER")
	public String getDispatchUser() {
		return dispatchUser;
	}

	public void setDispatchUser(String dispatchUser) {
		this.dispatchUser = dispatchUser;
	}

	@Column(name = "ISSUEUSER")
	public String getIssueUser() {
		return issueUser;
	}

	public void setIssueUser(String issueUser) {
		this.issueUser = issueUser;
	}

	@Column(name = "ORGANIZATION")
	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}
	
	@Column(name = "ACCEPTDATE_")
	public Date getAcceptDate() {
		return acceptDate;
	}

	public void setAcceptDate(Date acceptDate) {
		this.acceptDate = acceptDate;
	}
	
	@Column(name = "EXIST_")
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DEADLINE_")
	public Date getDeadLine() {
		return deadLine;
	}
	
	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}
	
	
	@Transient
	public boolean isCaogao() {
		return caogao;
	}

	public void setCaogao(boolean caogao) {
		this.caogao = caogao;
	}

	@Transient
	public boolean isDaijieshou() {
		return daijieshou;
	}

	public void setDaijieshou(boolean daijieshou) {
		this.daijieshou = daijieshou;
	}

	@Transient
	public boolean isChulizhong() {
		return chulizhong;
	}

	public void setChulizhong(boolean chulizhong) {
		this.chulizhong = chulizhong;
	}

	@Transient
	public boolean isYiguidang() {
		return yiguidang;
	}

	public void setYiguidang(boolean yiguidang) {
		this.yiguidang = yiguidang;
	}

	@Transient
	public boolean isDaihuifu() {
		return daihuifu;
	}

	public void setDaihuifu(boolean daihuifu) {
		this.daihuifu = daihuifu;
	}

	@Transient
	public boolean isYihuifu() {
		return yihuifu;
	}

	public void setYihuifu(boolean yihuifu) {
		this.yihuifu = yihuifu;
	}

	@Transient
	public boolean isYifenpai() {
		return yifenpai;
	}

	public void setYifenpai(boolean yifenpai) {
		this.yifenpai = yifenpai;
	}
	
	@Transient
	public boolean isYiChaoQi() {
		return yiChaoQi;
	}

	public void setYiChaoQi(boolean yiChaoQi) {
		this.yiChaoQi = yiChaoQi;
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
		DispathRoot other = (DispathRoot) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DispathRoot [id=" + id + ", title=" + title + ", dispatchNum="
				+ dispatchNum + ", createUser=" + createUser + ", createDate="
				+ createDate + ", sendUser=" + sendUser + ", sendDate="
				+ sendDate + ", acceptUser=" + acceptUser + ", copyUser="
				+ copyUser + ", suggestion=" + suggestion + ", attachFile="
				+ attachFile + ", replyAttachFile=" + replyAttachFile
				+ ", replyContent=" + replyContent + ", replyDate=" + replyDate
				+ ", root=" + root + ", parentDispath=" + parentDispath
				+ ", user=" + user + ", isRoot="
				+ isRoot + ", tempAssignRemark=" + tempAssignRemark
				+ ", assignRemark=" + assignRemark + ", status=" + status
				+ ", dispatchUser=" + dispatchUser + ", issueUser=" + issueUser
				+ ", organization=" + organization + "]";
	}

}
