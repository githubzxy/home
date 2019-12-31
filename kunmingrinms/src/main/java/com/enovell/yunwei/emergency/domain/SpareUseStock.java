
/**   
 * 文件名：SpareUseStock.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 上午12:08:05   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.domain;

import com.enovell.system.common.domain.User;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareUseStock   
 * 类描述:  备品备件使用记录
 * 创建人：ltf 
 * 创建时间：2016-11-30 上午12:08:05
 * 修改人：ltf
 * 修改时间：2016-11-30 上午12:08:05   
 *    
 */

@Entity
@Table(name = "SPAREUSERSTOCK")
public class SpareUseStock implements Serializable {
	private static final long serialVersionUID = -8894124907740462054L;


	public final static String RUKU = "1";
	
	public  final static String CHUKU = "2";
	
	
	private String id;
	
	/**
	 * 使用数量
	 */
	private Double amount;
	
	/**
	 * 使用原因
	 */
	private String reason;
	
	/**
	 * 使用日期
	 */
	private Date date;
	
	/**
	 * 操作人
	 */
	private User user;
	
	/**
	 * 使用的备品备
	 */
	private SparePart sparePart;
	
	/**
	 * 状态 1-入库 2-出库
	 */
	private String state;

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


	@Column(name = "AMOUNT_",length = 8)
	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	@Column(name = "REASON_",length = 256)
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="UPDATEDATE_")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="USERID_")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="SPAREPARTID_")
	public SparePart getSparePart() {
		return sparePart;
	}

	public void setSparePart(SparePart sparePart) {
		this.sparePart = sparePart;
	}
	
	@Column(name = "STATE_")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof SpareUseStock)) {
            return false;
        }
		SpareUseStock other = (SpareUseStock) object;
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

	@Override
	public String toString() {
		return "SpareUseStock [id=" + id + ", amount=" + amount + ", reason="
				+ reason + ", date=" + date + ", user=" + user + ", sparePart="
				+ sparePart + ", state=" + state + "]";
	}
	
}













