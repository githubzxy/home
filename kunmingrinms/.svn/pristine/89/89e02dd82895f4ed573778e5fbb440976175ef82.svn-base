
/**   
 * 文件名：OnDutyDept.java    
 * 版本信息：RINMS2.0   
 * 日期：2013-12-25 上午10:27:49   
 * Copyright Enovell Corporation 2013    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.onduty.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**      
 * 项目名称：kunmingrinms
 * 类名称：OnDutyDept   
 * 类描述:  值班部门
 * 创建人：jiangming 
 * 创建时间：2013-12-25 上午10:27:49
 * 修改人：jiangming
 * 修改时间：2013-12-25 上午10:27:49   
 *    
 */
@Entity
@Table(name="ONDUTY_DEPT")
public class OnDutyDept implements Serializable {
	private static final long serialVersionUID = -6825426015013478979L;
	
	/**
	 * orgId
	 */
	private String orgId;
	
	/**   
	 * 取得的 orgId
	 * @return  the orgId    
	 */
	@Id
	@Column(name="ORG_ID_", length=32)
	public String getOrgId() {
		return orgId;
	}

	/**   
	 * @param orgId 要设置的 orgId
	 */
	
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	
	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof OnDutyDept)) {
            return false;
        }
		OnDutyDept other = (OnDutyDept) object;
		if(orgId != null && other.getOrgId() != null && orgId.equals(other.getOrgId())){
			return true;
		}
		return false;
	}

	@Override
	public int hashCode() {
        int hash = 0;
        hash += (orgId != null ? orgId.hashCode() : 0);
        return hash;
	}	
}
