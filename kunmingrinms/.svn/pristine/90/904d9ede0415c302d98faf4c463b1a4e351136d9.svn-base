package com.enovell.yunwei.commNetworkStop.domain;

import com.enovell.system.common.domain.Organization;
import com.enovell.yunwei.attach.domain.AttachFile;
import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 项目名称：tldw
 * 类名称：CommNetStop
 * 类描述:  停机要点 实体类
 * 创建人：ltf
 * 创建时间：2016年11月18日 上午11:20:18
 * 修改人：ltf
 * 修改时间：2016年11月18日 上午11:20:18
 */
@Entity
@Table(name = "MAINSTOP_")
public class CommNetStop implements Serializable {

    private static final long serialVersionUID = -6997749343595469398L;

    /**
     * 从EXCEL文件中第2行开始读取逐台检查登记表记录，从0开始计数
     */
    public static final int START_ROW_NUM = 1;

    /**
     * 待审核
     */
    public static final int WAIT_EXAMINE = 0;
    /**
     * 待回复
     */
    public static final int WAIT_REPLY = 1;
    /**
     * 完成
     */
    public static final int FINISH = 2;
    /**
     * 未完成
     */
    public static final int UNFINISH = 3;
    /**
     * 已取消
     */
    public static final int CANCEL = 4;


    /**
     * 主键ID
     */
    private String id;

    /**
     * 状态
     */
    private Integer state;

    /**
     * 线路名称
     */
    private String railLineName;

    /**
     * 创建时间
     */
    private Date createDate;

    /**
     * 开始时间
     */
    private Date startDate;

    /**
     * 结束时间
     */
    private Date endDate;

    /**
     * 所属局
     */
    private String belongOffice;

    /**
     * 申请单位
     */
    private Organization applyOrg;

    /**
     * 施工地点
     */
    private String executionAddr;

    /**
     * 所属专业
     * 0代表GSM-R；1代表传输网（设备）；2代表传输网（线路）；3代表隐患属性
     */
    private Integer belongCraft;

    /**
     * 施工类别
     * 0代表施工Ⅰ级；1代表施工Ⅱ级；2代表施工Ⅲ级（一般）；
     * 3代表施工Ⅲ级（重点）；4代表维修Ⅰ级；5代表维修Ⅱ级；
     */
    private Integer executionType;

    /**
     * 施工属性
     * 0代表电路调整；1代表机房标准化建设；2代表设备计表测试；
     * 3代表市政改迁；4代表铁路迁改；5代表线路故障处理；6代表隐患环网
     */
    private Integer executionAttr;

    /**
     * 工作内容
     * 0代表电路调整；1代表光缆割接；2代表光缆接头盒；
     * 3代表接头割接；4代表开盒确认故障点；5代表设备计表；6代表设备尾纤更换
     */
    private String workContent;

    /**
     * 涉及骨干网名称
     */
    private String mainNetName;

    /**
     * 涉及铁路局
     */
    private String railwaysBureau;

    /**
     * 计划说明
     */
    private String planCaption;

    /**
     * 上传附件
     */
    private AttachFile attachFile;

    /**
     * 完成情况说明
     */
    private String situationCaption;

    /**
     * 回复附件
     */
    private AttachFile restoreFile;

    /**
     * 方案审批编号
     */
    private String planExaminNum;

    /**
     * 月度计划审批编号
     */
    private String monthPlanExamin;

    /**
     * 昆铁施工台计划号
     */
    private String executionPlanNum;

    /**
     * 批复附件
     */
    private AttachFile examinFile;

    /**
     * 是否存在（true 存在 false 已被删除）
     */

    private Boolean exist = DataExistStatus.EXIST;
    /**
     * 是否天窗
     * false 否
     * true  是
     */
    private Boolean skyLight;

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

    @Column(name = "EXIST_")
    public boolean getExist() {
        return exist;
    }

    public void setExist(boolean exist) {
        this.exist = exist;
    }


    @Column(name = "STATE_")
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Column(name = "RAIL_LINE_NAME_")
    public String getRailLineName() {
        return railLineName;
    }

    public void setRailLineName(String railLineName) {
        this.railLineName = railLineName;
    }

    @Column(name = "START_DATE_")
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Column(name = "END_DATE_")
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @ManyToOne()
    @JoinColumn(name = "APPLY_ORG_")
    public Organization getApplyOrg() {
        return applyOrg;
    }

    public void setApplyOrg(Organization applyOrg) {
        this.applyOrg = applyOrg;
    }

    @Column(name = "EXECUTION_ADDR_")
    public String getExecutionAddr() {
        return executionAddr;
    }

    public void setExecutionAddr(String executionAdd) {
        this.executionAddr = executionAdd;
    }

    @Column(name = "BELONG_CRAFT_")
    public Integer getBelongCraft() {
        return belongCraft;
    }

    public void setBelongCraft(Integer belongCraft) {
        this.belongCraft = belongCraft;
    }

    @Column(name = "EXECUTION_TYPE_")
    public Integer getExecutionType() {
        return executionType;
    }

    public void setExecutionType(Integer executionType) {
        this.executionType = executionType;
    }

    @Column(name = "EXECUTION_ATTR_")
    public Integer getExecutionAttr() {
        return executionAttr;
    }

    public void setExecutionAttr(Integer executionAttr) {
        this.executionAttr = executionAttr;
    }

    @Column(name = "WORK_CONTENT_")
    public String getWorkContent() {
        return workContent;
    }

    public void setWorkContent(String workContent) {
        this.workContent = workContent;
    }

    @Column(name = "MAIN_NET_NAME_")
    public String getMainNetName() {
        return mainNetName;
    }

    public void setMainNetName(String mainNetName) {
        this.mainNetName = mainNetName;
    }

    @Column(name = "RAILWAYS_BUREAU_")
    public String getRailwaysBureau() {
        return railwaysBureau;
    }

    public void setRailwaysBureau(String railwaysBureau) {
        this.railwaysBureau = railwaysBureau;
    }

    @Column(name = "PLAN_CAPTION_")
    public String getPlanCaption() {
        return planCaption;
    }

    public void setPlanCaption(String planCaption) {
        this.planCaption = planCaption;
    }

    @ManyToOne()
    @JoinColumn(name = "ATTACH_FILE_")
    public AttachFile getAttachFile() {
        return attachFile;
    }

    public void setAttachFile(AttachFile attachFile) {
        this.attachFile = attachFile;
    }

    @ManyToOne()
    @JoinColumn(name = "RESTORE_FILE_")
    public AttachFile getRestoreFile() {
        return restoreFile;
    }

    public void setRestoreFile(AttachFile restoreFile) {
        this.restoreFile = restoreFile;
    }

    @Column(name = "PLAN_EXAMIN_NUM_")
    public String getPlanExaminNum() {
        return planExaminNum;
    }

    public void setPlanExaminNum(String planExaminNum) {
        this.planExaminNum = planExaminNum;
    }

    @Column(name = "MONTH_PLAN_EXAMIN_")
    public String getMonthPlanExamin() {
        return monthPlanExamin;
    }

    public void setMonthPlanExamin(String monthPlanExamin) {
        this.monthPlanExamin = monthPlanExamin;
    }

    @Column(name = "EXECUTION_PLAN_NUM_")
    public String getExecutionPlanNum() {
        return executionPlanNum;
    }

    public void setExecutionPlanNum(String executionPlanNum) {
        this.executionPlanNum = executionPlanNum;
    }

    @Column(name = "SITUATION_CAPTION_")
    public String getSituationCaption() {
        return situationCaption;
    }

    public void setSituationCaption(String situationCaption) {
        this.situationCaption = situationCaption;
    }

    @Column(name = "BELONG_OFFICE_")
    public String getBelongOffice() {
        return belongOffice;
    }

    public void setBelongOffice(String belongOffice) {
        this.belongOffice = belongOffice;
    }

    @Column(name = "CREATE_DATE_")
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @ManyToOne()
    @JoinColumn(name = "EXAMIN_FILE_")
    public AttachFile getExaminFile() {
        return examinFile;
    }

    public void setExaminFile(AttachFile examinFile) {
        this.examinFile = examinFile;
    }
    @Column(name="SKY_LIGHT_")
    public Boolean getSkyLight() {
        return skyLight;
    }

    public void setSkyLight(Boolean skyLight) {
        this.skyLight = skyLight;
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
        CommNetStop other = (CommNetStop) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "CommNetStop [id=" + id + ", state=" + state + ", railLineName="
                + railLineName + ", createDate=" + createDate + ", startDate="
                + startDate + ", endDate=" + endDate + ", belongOffice="
                + belongOffice + ", applyOrg=" + applyOrg
                + ", executionAddr=" + executionAddr + ", belongCraft="
                + belongCraft + ", executionType=" + executionType
                + ", executionAttr=" + executionAttr + ", workContent="
                + workContent + ", mainNetName=" + mainNetName
                + ", railwaysBureau=" + railwaysBureau + ", planCaption="
                + planCaption + ", attachFile=" + attachFile
                + ", situationCaption=" + situationCaption
                + ", restoreFile=" + restoreFile + ", planExaminNum="
                + planExaminNum + ", monthPlanExamin=" + monthPlanExamin
                + ", executionPlanNum=" + executionPlanNum
                + ", examinFile=" + examinFile + "]";
    }

    /**
     * 工作内容常量
     */
    public static final int CIRCUITADJUSTMENT = 0;    //电路调整
    public static final int CABLE_CUTOVER = 1;    //光缆割接
    public static final int CABLE_JOINTBOX = 2;    //光缆接头盒
    public static final int JOINT_CUTOVER = 3;    //接头割接
    public static final int BOX_FAULT = 4; //开盒确认故障点
    public static final int EQUIPMENT = 5;//设备计表
    public static final int EQUIPMENT_FIBER_REPLACE = 6;//设备尾纤更换

    /**
     * 所属专业
     */
    public static final int GSM_R = 0;//GSM-R
    public static final int TRANSNETWORK_EQUIPMENT = 1;    //传输网（设备）
    public static final int TRANSNETWORK_LINE = 2;    //传输网（线路）
    public static final int DANGER_ATTR = 3;//隐患属性

    /**
     * 施工类别
     */
    public static final int CONST_ONE = 0;    //施工Ⅰ级
    public static final int CONST_TWO = 1;    //施工Ⅱ级
    public static final int CONST_THREE_GENERAL = 2;    //施工Ⅲ级（一般）
    public static final int CONST_THREE_IMPORTANT = 3;    //施工Ⅲ级（重点）
    public static final int REPAIR_ONE = 4; //维修Ⅰ级
    public static final int REPAIR_TWO = 5;    //维修Ⅱ级


    /**
     * 施工属性
     */
    public static final int CIRCUIT_ADJUSTMENT = 0;    //电路调整
    public static final int STANDARD_CONST = 1;    //机房标准化建设
    public static final int EQUIPMENT_TEST = 2;    //设备计表测试
    public static final int MUNICIPAL_CHANGE = 3;    //市政改迁
    public static final int RAILWAY_CHANGE = 4; //铁路迁改
    public static final int LINE_FAULT_HANDLING = 5;    //线路故障处理
    public static final int DANGER_RING_NETWORK = 6;    //隐患环网

}
	
	
