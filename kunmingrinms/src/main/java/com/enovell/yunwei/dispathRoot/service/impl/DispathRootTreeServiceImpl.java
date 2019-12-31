package com.enovell.yunwei.dispathRoot.service.impl;

import com.enovell.yunwei.dispathRoot.domain.DispathRoot;
import com.enovell.yunwei.dispathRoot.dto.DispatchShowDTO;
import com.enovell.yunwei.dispathRoot.service.DispathRootTreeService;
import com.enovell.yunwei.util.DataExistStatus;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：DispathRootTreeServiceImpl 
 * 类描述: 子调令树形列表数据实现 
 * 创建人：lidt
 * 创建时间：2016-12-16 上午10:33:25 
 * 修改人：lidt 
 * 修改时间：2016-12-16 上午10:33:25
 * 
 */
@SuppressWarnings("unchecked")
@Service("DispathRootTreeService")
public class DispathRootTreeServiceImpl implements DispathRootTreeService {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional(readOnly = true)
	public List<DispathRoot> getDispathRootTreeList(DispathRoot dr) {
		String hql = " FROM DispathRoot dr "
				+ " LEFT JOIN FETCH dr.user u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH dr.replyAttachFile "
				+ " WHERE dr.parentDispath = :parentDispath "
				+ " AND dr.exist =:exist ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("parentDispath", dr);
		query.setParameter("exist", DataExistStatus.EXIST);
		List<DispathRoot> childList = query.list();

		for (DispathRoot child : childList) {
			addStatusTreeColor(child);// 设置颜色
			recursionQueryChildren(child);// 递归设置子调度
		}
		return childList;
	}

	/**
	 * 
	 * recursionQueryChildren 递归设置子调度
	 * 
	 * @param dr
	 */
	@Transactional(readOnly = true)
	public void recursionQueryChildren(DispathRoot dr) {
		dr.setParentDispath(null);
		Set<DispathRoot> treeListDTOs = getAllChildren(dr);
		dr.setChildren(treeListDTOs);
		if (treeListDTOs != null && treeListDTOs.size() > 0) {
			for (DispathRoot w : treeListDTOs) {
				addStatusTreeColor(w);// 设置颜色
				recursionQueryChildren(w);// 递归设置子调度
			}
		}
	}

	/**
	 * 
	 * getAllChildren 得到所有子调令
	 * 
	 * @param dr
	 * @return 子调令的数据
	 */
	@Transactional(readOnly = true)
	private Set<DispathRoot> getAllChildren(DispathRoot dr) {
		String eql = " FROM DispathRoot d "
				+ " LEFT JOIN FETCH d.user du "
				+ " LEFT JOIN FETCH du.organization "
				+ " LEFT JOIN FETCH d.replyAttachFile "
				+ " WHERE d.parentDispath = :parentDispath"
				+ " AND d.exist = :exist";
		Query query = sessionFactory.getCurrentSession().createQuery(eql);
		query.setParameter("parentDispath", dr);
		query.setParameter("exist", DataExistStatus.EXIST);
		List<DispathRoot> list = query.list();
		if (list != null && list.size() > 0) {
			return new HashSet<DispathRoot>(list);
		}
		return null;
	}

	@Override
	public void addStatusTreeColor(DispathRoot child) {
		switch (Integer.valueOf(child.getStatus())) {
		case DispatchShowDTO.CAO_GAO:
			child.setCaogao(true);
			return;
		case DispatchShowDTO.DAI_JIE_SHOU:
			child.setDaijieshou(true);
			return;
		case DispatchShowDTO.DAI_HUI_FU:
			child.setDaihuifu(true);
			return;
		case DispatchShowDTO.YI_HUI_FU:
			child.setYihuifu(true);
			return;
		case DispatchShowDTO.YI_GUI_DANG:
			child.setYiguidang(true);
			return;
		case DispatchShowDTO.YI_FEN_PAI:
			child.setYifenpai(true);
			return;
		case DispatchShowDTO.CHU_LI_ZHONG:
			child.setChulizhong(true);
			return;
		}
	}

}
