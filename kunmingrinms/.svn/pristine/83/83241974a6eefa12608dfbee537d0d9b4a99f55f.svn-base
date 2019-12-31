package com.enovell.yunwei.circuitWO.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.circuitWO.domain.CircuitWO;
import com.enovell.yunwei.circuitWO.dto.CircuitWOShowDto;
import com.enovell.yunwei.util.DataExistStatus;

@Transactional(readOnly = true)
@Service("circuitRootTreeService")
public class CircuitWORootTreeServiceImpl implements CircuitWORootTreeService {
	
	@Autowired
	private SessionFactory sessionFactory;
	@Resource(name="circuitWOService")
	private CircuitWOService circuitWOService;
	@SuppressWarnings("unchecked")
	@Override
	public List<CircuitWO> getCircuitWOTreeList(CircuitWO parent,String id) {
		String hql = " FROM CircuitWO t "
				+ " LEFT JOIN FETCH t.owner u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH t.responseAttachFile "
				+ " WHERE  t.panrentTask = :panrentTask"
				+ " and t.status != :auditNotStatus "
				+ " and t.status != :backStatus "
				+ " and t.status != :awaitStatus "
				+ " and t.exist =:exist "
				+ " order by t.status ";// 审核通过的排在最前面
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", parent);
		query.setParameter("auditNotStatus", CircuitWO.SHEN_HE_BU_TONG_GUO);
		query.setParameter("backStatus", CircuitWO.YI_TUI_HUI);
		query.setParameter("awaitStatus", CircuitWO.DAI_SHEN_HE);
		query.setParameter("exist", DataExistStatus.EXIST);
		List<CircuitWO> list = query.list();
		CircuitWO circuitWO=circuitWOService.getById(id);
		for (CircuitWO tempChild : list) {
			
			tempChild.setAssignRemark(circuitWO.getAssignRemark());
			
			//设置该任务的颜色属性
			addColorByStatus(tempChild);
			//递归查询子任务
			recursionQueryChildren(tempChild);
			tempChild.setReceiveUsers(null);
		}
		return list;
	}

	private void recursionQueryChildren(CircuitWO parent) {
		parent.setPanrentTask(null);  
		CircuitWO parentWO = new CircuitWO();
		parentWO.setId(parent.getId());
		Set<CircuitWO> treeListDTOs = getAllChildren(parentWO);
		parent.setChildren(treeListDTOs);
		if (treeListDTOs != null && treeListDTOs.size() > 0) {
			for (CircuitWO tempChild : treeListDTOs) {
				//设置该任务的颜色属性
				addColorByStatus(tempChild);
				//递归查询子任务
				recursionQueryChildren(tempChild);
			}
		}
	}

	/**
	 * 
	 * getAllChildren 查询所有的子任务
	 * @param parent 根任务
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private Set<CircuitWO> getAllChildren(CircuitWO parent) {
		String hql = " FROM CircuitWO t "
				+ " LEFT JOIN FETCH t.owner u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH t.responseAttachFile "
				+ " WHERE  t.panrentTask = :panrentTask"
				+ " and t.status != :backStatus "
				+ " AND t.exist = :exist ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", parent);
		query.setParameter("backStatus", CircuitWO.YI_TUI_HUI);
		query.setParameter("exist", DataExistStatus.EXIST);
		List<CircuitWO> list = query.list();
		if (list != null && list.size() > 0) {
			return new HashSet<CircuitWO>(list);
		}
		return null;
	}

	@Override
	public void addColorByStatus(CircuitWO taskRoot) {
		switch (Integer.valueOf(taskRoot.getStatus())) {
		case CircuitWOShowDto.CAO_GAO:
			taskRoot.setCaoGao(true);
			return;
		case CircuitWOShowDto.DAI_SHEN_HE:
			taskRoot.setDaiShenHe(true);
			return;
		case CircuitWOShowDto.SHEN_HE_TONG_GUO:
			taskRoot.setShenHeTongGuo(true);
			return;
		case CircuitWOShowDto.SHEN_HE_BU_TONG_GUO:
			taskRoot.setShenHeBuTongGuo(true);
			return;
		case CircuitWOShowDto.YI_TUI_HUI:
			taskRoot.setYiTuiHui(true);
			return;
		case CircuitWOShowDto.DAI_JIE_SHOU:
			taskRoot.setDaiJieShou(true);
			return;
		case CircuitWOShowDto.YI_FEN_PAI:
			taskRoot.setYiFenPai(true);
			return;
		case CircuitWOShowDto.CHU_LI_ZHONG:
			taskRoot.setChuLiZhong(true);
			return;
		case CircuitWOShowDto.DAI_HUI_FU:
			taskRoot.setDaiHuiFu(true);
			return;
		case CircuitWOShowDto.YI_HUI_FU:
			taskRoot.setYiHuiFu(true);
			return;
		case CircuitWOShowDto.YI_GUI_DANG:
			taskRoot.setYiGuiDang(true);
			return;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CircuitWO> getTaskRootTreeListForZip(CircuitWO parent) {
		String hql = " FROM CircuitWO t "
				+ " LEFT JOIN FETCH t.owner u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH t.responseAttachFile "
				+ " LEFT JOIN FETCH t.responseAttachFile.files "
				+ " WHERE  t.panrentTask = :panrentTask"
				+ " and t.status != :auditNotStatus "
				+ " and t.status != :backStatus "
				+ " and t.status != :awaitStatus "
				+ " and t.exist =:exist "
				+ " order by t.status ";// 审核通过的排在最前面
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", parent);
		query.setParameter("auditNotStatus", CircuitWO.SHEN_HE_BU_TONG_GUO);
		query.setParameter("backStatus", CircuitWO.YI_TUI_HUI);
		query.setParameter("awaitStatus", CircuitWO.DAI_SHEN_HE);
		query.setParameter("exist", DataExistStatus.EXIST);
		List<CircuitWO> list = query.list();
		for (CircuitWO tempChild : list) {
			//设置该任务的颜色属性
			addColorByStatus(tempChild);
			//递归查询子任务
			recursionQueryChildren(tempChild);
		}
		return list;
	}

}
