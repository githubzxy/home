
/**   
 * 文件名：CircuitWO.java    
 * 版本信息：IRMS1.0   
 * 日期：2018-11-05 11:15:31 AM   
 * Copyright Enovell Corporation 2018    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.circuitWO.domain;

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
 * 项目名称：RINMS2MAIN
 * 类名称：CircuitWO   
 * 类描述:  电路工单根任务 实体
 * 创建人：lilt 
 * 创建时间：2018-11-05 11:15:31 AM
 *    
 */
@Entity
@Table(name="CIRCUIT_WORK_ORDER")
public class CircuitWO implements Serializable {
	
	private static final long serialVersionUID = -5010389471103037834L;
	
	/**
	 * 草稿 1
	 */
	public static final String CAO_GAO = "1";
	
	/**
	 * 待接收 2
	 */
	public static final String DAI_JIE_SHOU = "2";
	
	/**
	 * 处理中 3
	 */
	public static final String CHU_LI_ZHONG = "3";
	
	/**
	 * 待归档 4
	 */
	public static final String DAI_GUI_DANG = "4";
	
	/**
	 * 已归档 5
	 */
	public static final String YI_GUI_DANG = "5";
	/**
	 * 待回复
	 */
	public static final String DAI_HUI_FU = "6";
	/**
	 * 已回复
	 */
	public static final String YI_HUI_FU = "7";
	/**
	 * 已退回
	 */
	public static final String YI_TUI_HUI = "8";
	/**
	 * 已分派
	 */
	public static final String YI_FEN_PAI = "9";
	/**
	 * 待审核
	 */
	public static final String DAI_SHEN_HE = "10";
	/**
	 * 审核通过
	 */
	public static final String SHEN_HE_TONG_GUO = "11";
	/**
	 * 审核不通过
	 */
	public static final String SHEN_HE_BU_TONG_GUO = "12";
	
	/**
	 * 是根
	 */
	public static final String IS_ROOT = "1";
	/**
	 * 不是根
	 */
	public static final String IS_NOT_ROOT = "2";
	
	/**
	 * 超时
	 */
	public static final String IS_OVERTIME = "1";
	/**
	 * 未超时
	 */
	public static final String IS_NOT_OVERTIME = "2";
	
	private String id;
	/**
	 * 任务标题
	 */
	private String title;
	/**
	 * 任务所属人（对于根来说就是创建者，对于子任务来说就是当钱任务的执行人）
	 */
	private User owner;
	/**
	 * 创建人 （在任务管理模块是用创建人进行过滤的）
	 */
	private User creatUser;
	/**
	 * 联系人（默认可选）
	 */
	private User linkman;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 接收人集合
	 */
	private Set<User> receiveUsers = new HashSet<User>();
	/**
	 * 完成期限
	 */
	private Date limitTime;
	/**
	 * 发送时间
	 */
	private Date sendDate;
	/**
	 * 发送人
	 */
	private User sendUser;
	/**
	 * 状态
	 */
	private String status;
	
	/**
	 * 归档人
	 */
	private User fileUser;
	
	/**
	 * 归档时间
	 */
	private Date fileDate;
	/**
	 * 任务类型
	 */
	private Integer taskType;
	/**
	 * 紧急程度
	 */
	private Integer taskLevel;
	/**
	 * 任务方案（附件）
	 */
	private AttachFile taskAttachFile;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 抄送人
	 */
	private Set<User> carbonCopyUser = new HashSet<User>(0);
	
	/**
	 * 根任务
	 */
	private CircuitWO root;
	/**
	 * 分派备注
	 */
	private String assignRemark;
	
	/**
	 * 临时分派备注,用于展示所有父的分派备注
	 */
	private String tempAssignRemark;
	
	/**
	 * 回复意见(完成情况)
	 */
	private String responseContent;
	/**
	 * 回复时间
	 */
	private Date responseDate;
	/**
	 * 回复文件
	 */
	private AttachFile responseAttachFile;
	/**
	 * 回复负责人
	 */
	private User chargeUser;
	/**
	 * 回复提交人
	 */
	private User submitUser;
	/**
	 * 所属父任务
	 */
	private CircuitWO panrentTask;
	/**
	 * 子任务
	 */
	private Set<CircuitWO> children;
	/**
	 * 退回意见
	 */
	private String sendBackRemark;
	/**
	 * 是否是根
	 * 1-是 2-不是
	 */
	private String isRoot;
	/**
	 * 审核意见
	 */
	private String checkMsg;
	/**
	 * 审核通过附件
	 */
	private AttachFile checkAttachFile;
	
	/**
	 * 受理时间
	 */
	private Date acceptDate;
	
	/**
	 * 是否存在（true 存在 false 已被删除）
	 */
	private Boolean exist = DataExistStatus.EXIST;
	
	
	/**
	 * 颜色属性(子任务列表颜色属性)
	 */
	private boolean caoGao;
	private boolean daiShenHe;
	private boolean shenHeTongGuo;
	private boolean shenHeBuTongGuo;
	private boolean yiTuiHui;
	private boolean daiJieShou;
	private boolean yiFenPai;
	private boolean chuLiZhong;
	private boolean daiHuiFu;
	private boolean yiHuiFu;
	private boolean yiGuiDang;
	private boolean yiChaoQi;
	
	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name="system-uuid",strategy="uuid")
	@Column(name="ID_")
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

	@ManyToMany
	@JoinTable(name = "CIRCUIT_WORK_ORDER_USER",joinColumns = {@JoinColumn(name = "TASKROOT_ID_")},inverseJoinColumns = {@JoinColumn(name = "USER_ID_")})
	public Set<User> getReceiveUsers() {
		return receiveUsers;
	}

	public void setReceiveUsers(Set<User> receiveUsers) {
		this.receiveUsers = receiveUsers;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name="LIMIT_TIME_")
	public Date getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name="SEND_DATE_")
	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	
	@Column(name = "STATUS_")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="FILE_USER_ID_")
	public User getFileUser() {
		return fileUser;
	}

	public void setFileUser(User fileUser) {
		this.fileUser = fileUser;
	}

	@Temporal(TemporalType.DATE)
	@Column(name="FILE_DATE_")
	public Date getFileDate() {
		return fileDate;
	}

	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}

	@Column(name="TASK_TYPE_ID_")
	public Integer getTaskType() {
		return taskType;
	}

	public void setTaskType(Integer taskType) {
		this.taskType = taskType;
	}

	@Column(name="TASK_LEVEL_ID_")
	public Integer getTaskLevel() {
		return taskLevel;
	}

	public void setTaskLevel(Integer taskLevel) {
		this.taskLevel = taskLevel;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="TASK_ATTACHFILE_ID_")
	public AttachFile getTaskAttachFile() {
		return taskAttachFile;
	}

	public void setTaskAttachFile(AttachFile taskAttachFile) {
		this.taskAttachFile = taskAttachFile;
	}

	@Column(name = "REMARK_",length = 2000)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@ManyToMany
	@JoinTable(name = "CIRCUIT_WORK_ORDER_COPY_USER",joinColumns = {@JoinColumn(name = "TASKROOT_ID")},inverseJoinColumns = {@JoinColumn(name = "USER_ID")})
	public Set<User> getCarbonCopyUser() {
		return carbonCopyUser;
	}

	public void setCarbonCopyUser(Set<User> carbonCopyUser) {
		this.carbonCopyUser = carbonCopyUser;
	}

	@Temporal(TemporalType.DATE)
	@Column(name="CREATE_TIME_")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="SENDUSER_ID_")
	public User getSendUser() {
		return sendUser;
	}

	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="OWNER_ID_")
	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ROOT_ID_")
	public CircuitWO getRoot() {
		return root;
	}

	public void setRoot(CircuitWO root) {
		this.root = root;
	}

	@Column(name = "ASSIGNREMARK_",length = 2000)
	public String getAssignRemark() {
		return assignRemark;
	}

	public void setAssignRemark(String assignRemark) {
		this.assignRemark = assignRemark;
	}

	@Column(name = "RESPONSECONTENT_",length = 2000)
	public String getResponseContent() {
		return responseContent;
	}

	public void setResponseContent(String responseContent) {
		this.responseContent = responseContent;
	}


	@Temporal(TemporalType.DATE)
	@Column(name="RESPONSE_DATE_")
	public Date getResponseDate() {
		return responseDate;
	}

	public void setResponseDate(Date responseDate) {
		this.responseDate = responseDate;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="RESPONSEATTACHFILE_ID_")
	public AttachFile getResponseAttachFile() {
		return responseAttachFile;
	}

	public void setResponseAttachFile(AttachFile responseAttachFile) {
		this.responseAttachFile = responseAttachFile;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="CHARGEUSER_ID_")
	public User getChargeUser() {
		return chargeUser;
	}

	public void setChargeUser(User chargeUser) {
		this.chargeUser = chargeUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="SUBMITUSER_ID_")
	public User getSubmitUser() {
		return submitUser;
	}

	public void setSubmitUser(User submitUser) {
		this.submitUser = submitUser;
	}


	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="PANRENTTASK_ID_")
	public CircuitWO getPanrentTask() {
		return panrentTask;
	}

	public void setPanrentTask(CircuitWO panrentTask) {
		this.panrentTask = panrentTask;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "panrentTask")
	public Set<CircuitWO> getChildren() {
		return children;
	}

	public void setChildren(Set<CircuitWO> children) {
		this.children = children;
	}

	@Column(name = "SENDBACKREMARK_",length = 2000)
	public String getSendBackRemark() {
		return sendBackRemark;
	}

	public void setSendBackRemark(String sendBackRemark) {
		this.sendBackRemark = sendBackRemark;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="LINKMAN_ID_")
	public User getLinkman() {
		return linkman;
	}

	public void setLinkman(User linkman) {
		this.linkman = linkman;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="CREATUSER_ID_")
	public User getCreatUser() {
		return creatUser;
	}

	public void setCreatUser(User creatUser) {
		this.creatUser = creatUser;
	}

	@Column(name = "ISROOT_")
	public String getIsRoot() {
		return isRoot;
	}

	public void setIsRoot(String isRoot) {
		this.isRoot = isRoot;
	}

	@Transient
	public String getTempAssignRemark() {
		return tempAssignRemark;
	}

	public void setTempAssignRemark(String tempAssignRemark) {
		this.tempAssignRemark = tempAssignRemark;
	}
	@Column(name = "CHECKMSG_")
	public String getCheckMsg() {
		return checkMsg;
	}

	public void setCheckMsg(String checkMsg) {
		this.checkMsg = checkMsg;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="CHECKATTACHFILE_")
	public AttachFile getCheckAttachFile() {
		return checkAttachFile;
	}

	public void setCheckAttachFile(AttachFile checkAttachFile) {
		this.checkAttachFile = checkAttachFile;
	}
	
	@Column(name = "EXIST_")
	public Boolean getExist() {
		return exist;
	}

	public void setExist(Boolean exist) {
		this.exist = exist;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "ACCEPT_DATE_")
	public Date getAcceptDate() {
		return acceptDate;
	}

	public void setAcceptDate(Date acceptDate) {
		this.acceptDate = acceptDate;
	}

	@Transient
	public boolean isCaoGao() {
		return caoGao;
	}

	public void setCaoGao(boolean caoGao) {
		this.caoGao = caoGao;
	}

	@Transient
	public boolean isDaiShenHe() {
		return daiShenHe;
	}

	public void setDaiShenHe(boolean daiShenHe) {
		this.daiShenHe = daiShenHe;
	}
	
	@Transient
	public boolean isShenHeTongGuo() {
		return shenHeTongGuo;
	}

	public void setShenHeTongGuo(boolean shenHeTongGuo) {
		this.shenHeTongGuo = shenHeTongGuo;
	}

	@Transient
	public boolean isShenHeBuTongGuo() {
		return shenHeBuTongGuo;
	}

	public void setShenHeBuTongGuo(boolean shenHeBuTongGuo) {
		this.shenHeBuTongGuo = shenHeBuTongGuo;
	}

	@Transient
	public boolean isYiTuiHui() {
		return yiTuiHui;
	}

	public void setYiTuiHui(boolean yiTuiHui) {
		this.yiTuiHui = yiTuiHui;
	}

	@Transient
	public boolean isDaiJieShou() {
		return daiJieShou;
	}

	public void setDaiJieShou(boolean daiJieShou) {
		this.daiJieShou = daiJieShou;
	}

	@Transient
	public boolean isYiFenPai() {
		return yiFenPai;
	}

	public void setYiFenPai(boolean yiFenPai) {
		this.yiFenPai = yiFenPai;
	}

	@Transient
	public boolean isChuLiZhong() {
		return chuLiZhong;
	}

	public void setChuLiZhong(boolean chuLiZhong) {
		this.chuLiZhong = chuLiZhong;
	}

	@Transient
	public boolean isDaiHuiFu() {
		return daiHuiFu;
	}

	public void setDaiHuiFu(boolean daiHuiFu) {
		this.daiHuiFu = daiHuiFu;
	}

	@Transient
	public boolean isYiHuiFu() {
		return yiHuiFu;
	}

	public void setYiHuiFu(boolean yiHuiFu) {
		this.yiHuiFu = yiHuiFu;
	}

	@Transient
	public boolean isYiGuiDang() {
		return yiGuiDang;
	}

	public void setYiGuiDang(boolean yiGuiDang) {
		this.yiGuiDang = yiGuiDang;
	}
	
	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof CircuitWO)) {
            return false;
        }
		CircuitWO other = (CircuitWO) object;
		if(id != null && other.getId() != null && id.equals(other.getId())){
			return true;
		}
		return false;
	}

	@Override
	public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
	}

	
	@Transient
	public boolean isYiChaoQi() {
		return yiChaoQi;
	}

	public void setYiChaoQi(boolean yiChaoQi) {
		this.yiChaoQi = yiChaoQi;
	}

	@Override
	public String toString() {
		return "CircuitWO [id=" + id + ", title=" + title + ", owner=" + owner + ", creatUser=" + creatUser
				+ ", linkman=" + linkman + ", createTime=" + createTime + ", receiveUsers=" + receiveUsers
				+ ", limitTime=" + limitTime + ", sendDate=" + sendDate + ", sendUser=" + sendUser + ", status="
				+ status + ", fileUser=" + fileUser + ", fileDate=" + fileDate + ", taskType=" + taskType
				+ ", taskLevel=" + taskLevel + ", taskAttachFile=" + taskAttachFile + ", remark=" + remark
				+ ", carbonCopyUser=" + carbonCopyUser + ", root=" + root + ", assignRemark=" + assignRemark
				+ ", tempAssignRemark=" + tempAssignRemark + ", responseContent=" + responseContent + ", responseDate="
				+ responseDate + ", responseAttachFile=" + responseAttachFile + ", chargeUser=" + chargeUser
				+ ", submitUser=" + submitUser + ", panrentTask=" + panrentTask + ", children=" + children
				+ ", sendBackRemark=" + sendBackRemark + ", isRoot=" + isRoot + ", checkMsg=" + checkMsg
				+ ", checkAttachFile=" + checkAttachFile + ", acceptDate=" + acceptDate + ", exist=" + exist
				+ ", caoGao=" + caoGao + ", daiShenHe=" + daiShenHe + ", shenHeTongGuo=" + shenHeTongGuo
				+ ", shenHeBuTongGuo=" + shenHeBuTongGuo + ", yiTuiHui=" + yiTuiHui + ", daiJieShou=" + daiJieShou
				+ ", yiFenPai=" + yiFenPai + ", chuLiZhong=" + chuLiZhong + ", daiHuiFu=" + daiHuiFu + ", yiHuiFu="
				+ yiHuiFu + ", yiGuiDang=" + yiGuiDang + ", yiChaoQi=" + yiChaoQi + "]";
	}
	
	

}
