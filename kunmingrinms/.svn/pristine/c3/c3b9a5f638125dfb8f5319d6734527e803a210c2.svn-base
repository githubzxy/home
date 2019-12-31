
/**   
 * 文件名：SpareUseStockDto.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-1 下午1:19:45   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.dto;

import java.io.Serializable;
import java.util.Date;

/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareUseStockDto   
 * 类描述:  备品使用记录Dto--用于前端展示使用详情
 * 创建人：ltf 
 * 创建时间：2016-12-1 下午1:19:45
 * 修改人：ltf
 * 修改时间：2016-12-1 下午1:19:45   
 *    
 */

public class SpareUseStockDto implements Serializable{

	private static final long serialVersionUID = -6267957092654687591L;

	/**
	 * 操作人
	 */
	private String user;
	
	/**
	 * 使用日期
	 */
	private Date date;
	
	/**
	 * 使用数量
	 */
	private Double amount;
	
	/**
	 * 使用原因（详情）
	 */
	private String reason;
	
	/**
	 * 状态 1-入库 2-出库
	 */
	private String state;

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "SpareUseStockDto [user=" + user + ", date=" + date
				+ ", amount=" + amount + ", reason=" + reason + ", state="
				+ state + "]";
	}

}
