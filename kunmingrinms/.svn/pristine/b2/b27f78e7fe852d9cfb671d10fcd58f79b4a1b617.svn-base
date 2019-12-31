package com.enovell.yunwei.commNetworkStop.dto;

import com.enovell.yunwei.commNetworkStop.domain.CommNetStop;

import java.util.Date;

/**      
 * 项目名称：tldw
 * 类名称：CommNetStopDtoShow
 * 类描述:  停机要点dto 用于前端页面展示
 * 创建人：ltf
 * 创建时间：2016年11月21日 下午14:49:25
 * 修改人：ltf
 * 修改时间：2016年11月21日 下午14:49:25
 */
public class CommNetStopShowDto {
	/**
	 * 停机要点ID
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
	 * 开始时间
	 */
	private Date startDate;

	/**
	 * 结束时间
	 */
	private Date endDate;
	
	/**
	 * 申请单位
	 */
	private String applyOrgName;
	
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
	 * 颜色控制 状态state对应的颜色
	 */
	boolean wait_examine;
	boolean wait_reply;
	boolean finish;
	boolean unfinish;
	boolean cancel;

	/**
	 * 是否天窗
	 */
	private Boolean skyLight;
	
	/**
	 * addStateColor 不同状态的记录显示不同的颜色（将对应属性设置为true）
	 * @param state
	 */
	public void addStateColor(Integer state){
		switch(state){
		case CommNetStop.WAIT_EXAMINE:
			wait_examine=true;
			return;
		case CommNetStop.WAIT_REPLY:
			wait_reply=true;
			return;
		case CommNetStop.FINISH:
			finish=true;
			return;
		case CommNetStop.UNFINISH:
			unfinish=true;
			return;
		case CommNetStop.CANCEL:
			cancel=true;
			return;
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	
	
	public String getRailLineName() {
		return railLineName;
	}

	public void setRailLineName(String railLineName) {
		this.railLineName = railLineName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getApplyOrgName() {
		return applyOrgName;
	}

	public void setApplyOrgName(String applyOrgName) {
		this.applyOrgName = applyOrgName;
	}

	public String getExecutionAddr() {
		return executionAddr;
	}

	public void setExecutionAddr(String executionAddr) {
		this.executionAddr = executionAddr;
	}

	public Integer getBelongCraft() {
		return belongCraft;
	}

	public void setBelongCraft(Integer belongCraft) {
		this.belongCraft = belongCraft;
	}

	public Integer getExecutionType() {
		return executionType;
	}

	public void setExecutionType(Integer executionType) {
		this.executionType = executionType;
	}

	public Integer getExecutionAttr() {
		return executionAttr;
	}

	public void setExecutionAttr(Integer executionAttr) {
		this.executionAttr = executionAttr;
	}

	public String getWorkContent() {
		return workContent;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}

	public String getMainNetName() {
		return mainNetName;
	}

	public void setMainNetName(String mainNetName) {
		this.mainNetName = mainNetName;
	}

	public String getRailwaysBureau() {
		return railwaysBureau;
	}

	public void setRailwaysBureau(String railwaysBureau) {
		this.railwaysBureau = railwaysBureau;
	}

	public String getPlanExaminNum() {
		return planExaminNum;
	}

	public void setPlanExaminNum(String planExaminNum) {
		this.planExaminNum = planExaminNum;
	}

	public String getMonthPlanExamin() {
		return monthPlanExamin;
	}

	public void setMonthPlanExamin(String monthPlanExamin) {
		this.monthPlanExamin = monthPlanExamin;
	}

	public String getExecutionPlanNum() {
		return executionPlanNum;
	}

	public void setExecutionPlanNum(String executionPlanNum) {
		this.executionPlanNum = executionPlanNum;
	}
	
	public boolean getWait_examine() {
		return wait_examine;
	}

	public void setWait_examine(boolean wait_examine) {
		this.wait_examine = wait_examine;
	}

	public boolean isWait_reply() {
		return wait_reply;
	}

	public void setWait_reply(boolean wait_reply) {
		this.wait_reply = wait_reply;
	}

	public boolean isFinish() {
		return finish;
	}

	public void setFinish(boolean finish) {
		this.finish = finish;
	}

	public boolean isUnfinish() {
		return unfinish;
	}

	public void setUnfinish(boolean unfinish) {
		this.unfinish = unfinish;
	}

	public boolean isCancel() {
		return cancel;
	}

	public void setCancel(boolean cancel) {
		this.cancel = cancel;
	}

	public Boolean getSkyLight() {
		return skyLight;
	}

	public void setSkyLight(Boolean skyLight) {
		this.skyLight = skyLight;
	}

	@Override
	public String toString() {
		return "CommNetStopShowDto{" +
				"id='" + id + '\'' +
				", state=" + state +
				", railLineName='" + railLineName + '\'' +
				", startDate=" + startDate +
				", endDate=" + endDate +
				", applyOrgName='" + applyOrgName + '\'' +
				", executionAddr='" + executionAddr + '\'' +
				", belongCraft=" + belongCraft +
				", executionType=" + executionType +
				", executionAttr=" + executionAttr +
				", workContent='" + workContent + '\'' +
				", mainNetName='" + mainNetName + '\'' +
				", railwaysBureau='" + railwaysBureau + '\'' +
				", planExaminNum='" + planExaminNum + '\'' +
				", monthPlanExamin='" + monthPlanExamin + '\'' +
				", executionPlanNum='" + executionPlanNum + '\'' +
				", wait_examine=" + wait_examine +
				", wait_reply=" + wait_reply +
				", finish=" + finish +
				", unfinish=" + unfinish +
				", cancel=" + cancel +
				", skyLight='" + skyLight + '\'' +
				'}';
	}


}
