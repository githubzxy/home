package com.enovell.yunwei.system.service.impl;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.system.domain.Menu;
import com.enovell.yunwei.system.service.MenuService;
import com.enovell.yunwei.system.service.OrganizationService;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**用户菜单权限业务逻辑实现类
 * @author roy
 * 2014年9月2日-下午6:43:24
 */
@Transactional(readOnly=true)
@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<Menu> getMenuByUser(User user) {
		Integer orgType = user.getOrganization().getType();
		if(orgType == null){//如果没有组织机构类型，则返回所有菜单
			return getAllMenus();
		}
		int typeIntValue = orgType.intValue();
		//不是段及科室、车间、工区则返回所有菜单
		if(typeIntValue != OrganizationService.ORG_TYPE_KS && typeIntValue != OrganizationService.ORG_TYPE_CJ && typeIntValue != OrganizationService.ORG_TYPE_GQ){
			return getAllMenus();
		}
		
		return getMenusByOrgType(orgType);
	}

	/**根据组织机构类型（段及科室、车间、工区）获取对应菜单
	 * @param type
	 * @return
	 */
	private List<Menu> getMenusByOrgType(Integer type) {
		Session session = sessionFactory.getCurrentSession();
		List<Menu> childrens = session.createCriteria(Menu.class)
				.add(Restrictions.eq("menuType",type))
				.setFetchMode("parent", FetchMode.JOIN)
				.list();
		session.flush();
		List<Menu> result = new ArrayList<Menu>();
		for(Menu child : childrens){
			Menu p = child.getParent();
			if(result.contains(p)){
				p = result.get(result.indexOf(p));
				p.getChildren().add(child);
			}else{
				List<Menu> c = new ArrayList<Menu>();
				c.add(child);
				p.setChildren(c);
				result.add(p);
			}
		}
		getInnerRequestMenus(result);
		return result;
	}

	/**获取所有菜单
	 * @return
	 */
	private List<Menu> getAllMenus() {
		Session session = sessionFactory.getCurrentSession();
		 List<Menu> result = session.createCriteria(Menu.class)
				.add(Restrictions.eq("menuType", 1))
				.list();
		for(Menu m : result){
			List<Menu> children = session.createCriteria(Menu.class)
					.add(Restrictions.eq("parent", m))
					.list();
			m.setChildren(children);
		}
		getInnerRequestMenus(result);
		return result;
	}
	
	private void getInnerRequestMenus(List<Menu> result){
		Menu root = new Menu();
		root.setMenuId("100");
		root.setMenuName("内部请示");
		root.setStatus(1);
		root.setMenuSn(100);
		List<Menu> children = new ArrayList<Menu>();
		Menu m1 = new Menu();
		m1.setMenuId("101");
		m1.setMenuName("车间请示");
		m1.setStatus(1);
		m1.setMenuIconAddr("img/leftNavigator/planToDo.png");
		m1.setMenuAccessAddr("innerRequest/workShopPage.jsp");
		m1.setMenuSn(101);
		m1.setChildren(new ArrayList<Menu>());
		children.add(m1);
		Menu m2 = new Menu();
		m2.setMenuId("102");
		m2.setMenuName("管理员处理");
		m2.setStatus(1);
		m2.setMenuIconAddr("img/leftNavigator/progress.png");
		m2.setMenuAccessAddr("innerRequest/managerPage.jsp");
		m2.setChildren(new ArrayList<Menu>());
		m2.setMenuSn(102);
		children.add(m2);
		Menu m3 = new Menu();
		m3.setMenuId("103");
		m3.setMenuName("领导批复");
		m3.setStatus(1);
		m3.setMenuIconAddr("img/leftNavigator/planDone.png");
		m3.setMenuAccessAddr("innerRequest/leaderPage.jsp");
		m3.setChildren(new ArrayList<Menu>());
		m3.setMenuSn(103);
		children.add(m3);
		Menu m4 = new Menu();
		m4.setMenuId("104");
		m4.setMenuName("科室答复");
		m4.setStatus(1);
		m4.setMenuIconAddr("img/leftNavigator/orderPersonalDone.png");
		m4.setMenuAccessAddr("innerRequest/segmentPage.jsp");
		m4.setChildren(new ArrayList<Menu>());
		m4.setMenuSn(104);
		children.add(m4);
		Menu m5 = new Menu();
		m5.setMenuId("105");
		m5.setMenuName("车间请示汇总");
		m5.setStatus(1);
		m5.setMenuIconAddr("img/leftNavigator/report.png");
		m5.setMenuAccessAddr("innerRequest/statisticalReportPage.jsp");
		m5.setChildren(new ArrayList<Menu>());
		m5.setMenuSn(105);
		children.add(m5);
		root.setChildren(children);
		result.add(root);
	}

	private Menu getWiredMenu() {
		return null;
//		Menu wiredRoot = new Menu();
//		wiredRoot.setMenuId(new Long(1));
//		wiredRoot.setMenuName("有线");
//		wiredRoot.setStatus(1);
//		List<Menu> wiredChildren = new ArrayList<Menu>();
//		
//		Menu tableHead = new Menu();
//		tableHead.setMenuId(new Long(2));
//		tableHead.setMenuName("表头调整");
//		tableHead.setStatus(1);
//		tableHead.setMenuIconAddr("img/leftNavigator/planToDo.png");
//		tableHead.setMenuAccessAddr("wired/tableHead.jsp");
//		wiredChildren.add(tableHead);
//		
//		Menu yearWorkItem = new Menu();
//		yearWorkItem.setMenuId(new Long(3));
//		yearWorkItem.setMenuName("年表工作项目");
//		yearWorkItem.setStatus(1);
//		yearWorkItem.setMenuIconAddr("img/leftNavigator/progress.png");
//		yearWorkItem.setMenuAccessAddr("wired/yearWorkItem.jsp");
//		wiredChildren.add(yearWorkItem);
//		
//		Menu monthWorkItem = new Menu();
//		monthWorkItem.setMenuId(new Long(43));
//		monthWorkItem.setMenuName("月表工作项目");
//		monthWorkItem.setStatus(1);
//		monthWorkItem.setMenuIconAddr("img/leftNavigator/progress.png");
//		monthWorkItem.setMenuAccessAddr("wired/monthWorkItem.jsp");
//		wiredChildren.add(monthWorkItem);
//		
//		//////////////////////////////////////////////////////////年表初步计划开始/////////////////////////////////////////////////
//		Menu initialPlan = new Menu();
//		initialPlan.setMenuId(new Long(10));
//		initialPlan.setMenuName("年表初步计划");
//		initialPlan.setStatus(1);
//		initialPlan.setMenuIconAddr("img/leftNavigator/orderToDo.png");
//		initialPlan.setMenuAccessAddr("wired/initialPlan.jsp");
//		wiredChildren.add(initialPlan);
//		//////////////////////////////////////////////////////////年表初步计划结束/////////////////////////////////////////////////
//		
//		//////////////////////////////////////////////////////////年表确认计划开始/////////////////////////////////////////////////
//		Menu confirmPlanWorkArea = new Menu();
//		confirmPlanWorkArea.setMenuId(new Long(20));
//		confirmPlanWorkArea.setMenuName("年表工区确认计划");
//		confirmPlanWorkArea.setStatus(1);
//		confirmPlanWorkArea.setMenuIconAddr("img/leftNavigator/orderDone.png");
//		confirmPlanWorkArea.setMenuAccessAddr("wired/confirmPlanWorkArea.jsp");
//		wiredChildren.add(confirmPlanWorkArea);
//		
//		Menu confirmPlanWorkshop = new Menu();
//		confirmPlanWorkshop.setMenuId(new Long(21));
//		confirmPlanWorkshop.setMenuName("年表车间确认计划");
//		confirmPlanWorkshop.setStatus(1);
//		confirmPlanWorkshop.setMenuIconAddr("img/leftNavigator/orderDone.png");
//		confirmPlanWorkshop.setMenuAccessAddr("wired/confirmPlanWorkshop.jsp");
//		wiredChildren.add(confirmPlanWorkshop);
//		
//		Menu confirmPlanSegment = new Menu();
//		confirmPlanSegment.setMenuId(new Long(22));
//		confirmPlanSegment.setMenuName("年表段确认计划");
//		confirmPlanSegment.setStatus(1);
//		confirmPlanSegment.setMenuIconAddr("img/leftNavigator/orderDone.png");
//		confirmPlanSegment.setMenuAccessAddr("wired/confirmPlanSegment.jsp");
//		wiredChildren.add(confirmPlanSegment);
//		//////////////////////////////////////////////////////////年表确认计划结束/////////////////////////////////////////////////
//		
//		//////////////////////////////////////////////////////////年表完成计划结束/////////////////////////////////////////////////
//		Menu finishPlanWorkArea = new Menu();
//		finishPlanWorkArea.setMenuId(new Long(30));
//		finishPlanWorkArea.setMenuName("年表工区完成计划");
//		finishPlanWorkArea.setStatus(1);
//		finishPlanWorkArea.setMenuIconAddr("img/leftNavigator/config_image.png");
//		finishPlanWorkArea.setMenuAccessAddr("wired/finishPlanWorkArea.jsp");
//		wiredChildren.add(finishPlanWorkArea);
//
//		Menu finishPlanWorkShop = new Menu();
//		finishPlanWorkShop.setMenuId(new Long(31));
//		finishPlanWorkShop.setMenuName("年表车间完成计划");
//		finishPlanWorkShop.setStatus(1);
//		finishPlanWorkShop.setMenuIconAddr("img/leftNavigator/config_image.png");
//		finishPlanWorkShop.setMenuAccessAddr("wired/finishPlan.jsp");
//		wiredChildren.add(finishPlanWorkShop);
//		
//		Menu finishPlanSegment = new Menu();
//		finishPlanSegment.setMenuId(new Long(30));
//		finishPlanSegment.setMenuName("年表段完成计划");
//		finishPlanSegment.setStatus(1);
//		finishPlanSegment.setMenuIconAddr("img/leftNavigator/config_image.png");
//		finishPlanSegment.setMenuAccessAddr("wired/finishPlan.jsp");
//		wiredChildren.add(finishPlanSegment);
//		//////////////////////////////////////////////////////////年表完成计划结束/////////////////////////////////////////////////
//		wiredRoot.setChildren(wiredChildren);
//		return wiredRoot;
	}

}
