package com.enovell.yunwei.commNetworkStop.dto;

/**      
 * 项目名称：tldw
 * 类名称：CommNetStopDto
 * 类描述:  停机要点dto 用于查询条件
 * 创建人：ltf
 * 创建时间：2016年11月18日 上午11:20:18
 * 修改人：ltf
 * 修改时间：2016年11月18日 上午11:20:18
 */
public class CommNetStopDto {

	/**
	 * 线路名称
	 */
	private String railLineName;
	
	/**
	 * 所属专业
	 */
	private Integer belongCraft;
	
	/**
	 * 施工类别
	 */
	private Integer executionType;
	
	/**
	 * 施工属性 
	 */
	private Integer executionAttr;
	
	/**
	 * 工作内容
	 */
	private String workContent;
	
	/**
	 * 涉及骨干网名称
	 */
	private String mainNetName;
	
	/**
	 * 组织机构
	 */
	private String org;
	
	/**
	 * 查询状态
	 */
	private Integer state;

	private Boolean skyLight;
	
	public String getRailLineName() {
		return railLineName;
	}

	public void setRailLineName(String railLineName) {
		this.railLineName = railLineName;
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

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Boolean getSkyLight() {
		return skyLight;
	}

	public void setSkyLight(Boolean skyLight) {
		this.skyLight = skyLight;
	}

	@Override
	public String toString() {
		return "CommNetStopDto{" +
				"railLineName='" + railLineName + '\'' +
				", belongCraft=" + belongCraft +
				", executionType=" + executionType +
				", executionAttr=" + executionAttr +
				", workContent=" + workContent +
				", mainNetName='" + mainNetName + '\'' +
				", org='" + org + '\'' +
				", state=" + state +
				", skyLight=" + skyLight +
				'}';
	}
}
