package com.enovell.yunwei.system.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *左侧菜单DTO
 *2014年8月5日-下午2:36:00 @author roy
 */

/**
 * @author roy
 * 2014年9月2日-下午6:26:58
 */
@Entity
@Table(name = "YEAR_MONTH_MENU_")
public class Menu {

	/**
	 * 菜单ID
	 */
	private String menuId;
	/**
	 * 菜单名称
	 */
	private String menuName;
	/**
	 * 上级菜单
	 */
	@JsonIgnore
	private Menu parent;
	/**
	 * 菜单编号
	 */
	private Integer menuSn;
	/**
	 * 访问路径
	 */
	private String menuAccessAddr;
	/**
	 * 菜单图标
	 */
	private String menuIconAddr;
	/**
	 * 菜单类型(1:一级菜单 3-段及科室 4-车间 5-工区)
	 */
	private Integer menuType;
	
	/**
	 * 状态（0：停用，1：启用）
	 */
	private Integer status;

	/**
	 * 下级子菜单
	 */
	private List<Menu> children;
	
	@ManyToOne
	@JoinColumn(name = "PARENT_ID_")
	public Menu getParent() {
		return parent;
	}
	public void setParent(Menu parent) {
		this.parent = parent;
	}
	@Transient
	public List<Menu> getChildren() {
		if(children != null && !children.isEmpty()){
			Collections.sort(children, new Comparator<Menu>() {
				@Override
				public int compare(Menu o1, Menu o2) {
					if(o1.getMenuSn().intValue() == o2.getMenuSn().intValue())
						return 0;
					else if(o1.getMenuSn().intValue() > o2.getMenuSn().intValue())
						return 1;
					else
						return -1;
				}
			});
		}
		return children;
	}
	public void setChildren(List<Menu> children) {
		this.children = children;
	}
	@Id
	@GenericGenerator(name="UUID-generator",strategy="uuid")
	@GeneratedValue(generator="UUID-generator")
	@Column(name="ID_")
	public String getMenuId() {
		return menuId;
	}
	@Column(name="MENUNAME_")
	public String getMenuName() {
		return menuName;
	}
	@Column(name="MENUSN_")
	public Integer getMenuSn() {
		return menuSn;
	}
	@Column(name="MENUACCESSADDR_")
	public String getMenuAccessAddr() {
		return menuAccessAddr;
	}
	@Column(name="MENUICONADDR_")
	public String getMenuIconAddr() {
		return menuIconAddr;
	}
	@Column(name="MENUTYPE_")
	public Integer getMenuType() {
		return menuType;
	}
	@Column(name="STATUS_")
	public Integer getStatus() {
		return status;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public void setMenuSn(Integer menuSn) {
		this.menuSn = menuSn;
	}
	public void setMenuAccessAddr(String menuAccessAddr) {
		this.menuAccessAddr = menuAccessAddr;
	}
	public void setMenuIconAddr(String menuIconAddr) {
		this.menuIconAddr = menuIconAddr;
	}
	public void setMenuType(Integer menuType) {
		this.menuType = menuType;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((menuId == null) ? 0 : menuId.hashCode());
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
		Menu other = (Menu) obj;
		if (menuId == null) {
			if (other.menuId != null)
				return false;
		} else if (!menuId.equals(other.menuId))
			return false;
		return true;
	}
	
}
