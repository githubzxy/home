
/**   
 * 文件名：SparePartModel.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 上午12:12:28   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SparePartModel   
 * 类描述:  器材型号-实体
 * 创建人：ltf 
 * 创建时间：2016-11-30 上午12:12:28
 * 修改人：ltf
 * 修改时间：2016-11-30 上午12:12:28   
 *    
 */

@Entity
@Table(name="DAILY_SPAREPARTMODEL_")
public class DailySparePartModel implements Serializable {
	
	private static final long serialVersionUID = 3551446034874165860L;

	private String id;
	
	/**
	 * 型号名称
	 */
	private String name;
	
	/**
	 * 所属器材
	 */
	private DailyDeviceName dailyDeviceName;

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

	@Column(name = "NAME_",length = 128)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="DEVICENAMEID_")
	public DailyDeviceName getDailyDeviceName() {
		return dailyDeviceName;
	}

	public void setDailyDeviceName(DailyDeviceName dailyDeviceName) {
		this.dailyDeviceName = dailyDeviceName;
	}

	
	@Override
	public boolean equals(Object object) {
		if (object == this) {
			return true;
		}
		if (!(object instanceof DailySparePartModel)) {
            return false;
        }
		DailySparePartModel other = (DailySparePartModel) object;
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
		return "SparePartModel [id=" + id + ", name=" + name + ", deviceName="
				+ dailyDeviceName + "]";
	}
	
}












