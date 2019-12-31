
/**   
 * 文件名：TaskRootTreeServiceImpl.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-20 下午6:15:15   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.taskManage.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.taskManage.domain.TaskRoot;
import com.enovell.yunwei.taskManage.dto.TaskShowDto;
import com.enovell.yunwei.taskManage.service.TaskRootTreeService;
import com.enovell.yunwei.util.DataExistStatus;

/**      
 * 项目名称：RINMS2MAIN
 * 类名称：TaskRootTreeServiceImpl   
 * 类描述:  子调令树形列表数据 接口实现类
 * 创建人：ltf 
 * 创建时间：2016-12-20 下午6:15:15
 * 修改人：ltf
 * 修改时间：2016-12-20 下午6:15:15   
 *    
 */
@SuppressWarnings("unchecked")
@Transactional(readOnly = true)
@Service("taskRootTreeService")
public class TaskRootTreeServiceImpl implements TaskRootTreeService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TaskRoot> getTaskRootTreeList(TaskRoot panrent) {
		String hql = " FROM TaskRoot t " 
						+ " LEFT JOIN FETCH t.owner u "
						+ " LEFT JOIN FETCH u.organization "
						+ " LEFT JOIN FETCH t.responseAttachFile "
//						+ " LEFT JOIN FETCH t.responseAttachFile.files "  quyy 2017/10/25改 如果不去掉，当受理人回复，上传多个附件时，会出现重复数据
						+ " WHERE  t.panrentTask = :panrentTask"
//						+ " and t.status != :auditStatus "		//子任务列表中【审核不通过】【已退回】【待审核】的数据不展示，【审核通过】状态的子任务仍显示
						+ " and t.status != :auditNotStatus "
						+ " and t.status != :backStatus "
						+ " and t.status != :awaitStatus "
						+ " and t.exist =:exist "
						+ " order by t.status ";// 审核通过的排在最前面
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", panrent);
//		query.setParameter("auditStatus", TaskRoot.SHEN_HE_TONG_GUO);
		query.setParameter("auditNotStatus", TaskRoot.SHEN_HE_BU_TONG_GUO);
		query.setParameter("backStatus", TaskRoot.YI_TUI_HUI);
		query.setParameter("awaitStatus", TaskRoot.DAI_SHEN_HE);
		query.setParameter("exist", DataExistStatus.EXIST);
		List<TaskRoot> list = query.list();
		for (TaskRoot tempChild : list) {
			//设置该任务的颜色属性
			addColorByStatus(tempChild);
			//递归查询子任务
			recursionQueryChildren(tempChild);
		}
		return list;
	}
	
	/**
	 * recursionQueryChildren 递归设置子任务
	 * @param parent
	 */
	private void recursionQueryChildren(TaskRoot parent) {
		parent.setPanrentTask(null);
		Set<TaskRoot> treeListDTOs = getAllChildren(parent);
		parent.setChildren(treeListDTOs);
		if (treeListDTOs != null && treeListDTOs.size() > 0) {
			for (TaskRoot tempChild : treeListDTOs) {
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
	 *
	 * @param panrent
	 * @return
	 */
	private Set<TaskRoot> getAllChildren(TaskRoot panrent) {
		String hql = " FROM TaskRoot t " 
						+ " LEFT JOIN FETCH t.owner u "
						+ " LEFT JOIN FETCH u.organization "
						+ " LEFT JOIN FETCH t.responseAttachFile "
						+ " WHERE  t.panrentTask = :panrentTask"
						+ " and t.status != :backStatus "
						+ " AND t.exist = :exist ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", panrent);
		query.setParameter("backStatus", TaskRoot.YI_TUI_HUI);
		query.setParameter("exist", DataExistStatus.EXIST);
		List<TaskRoot> list = query.list();
		if (list != null && list.size() > 0) {
			return new HashSet<TaskRoot>(list);
		}
		return null;
	}

	@Override
	public void addColorByStatus(TaskRoot taskRoot) {
		switch (Integer.valueOf(taskRoot.getStatus())) {
		case TaskShowDto.CAO_GAO:
			taskRoot.setCaoGao(true);
			return;
		case TaskShowDto.DAI_SHEN_HE:
			taskRoot.setDaiShenHe(true);
			return;
		case TaskShowDto.SHEN_HE_TONG_GUO:
			taskRoot.setShenHeTongGuo(true);
			return;
		case TaskShowDto.SHEN_HE_BU_TONG_GUO:
			taskRoot.setShenHeBuTongGuo(true);
			return;
		case TaskShowDto.YI_TUI_HUI:
			taskRoot.setYiTuiHui(true);
			return;
		case TaskShowDto.DAI_JIE_SHOU:
			taskRoot.setDaiJieShou(true);
			return;
		case TaskShowDto.YI_FEN_PAI:
			taskRoot.setYiFenPai(true);
			return;
		case TaskShowDto.CHU_LI_ZHONG:
			taskRoot.setChuLiZhong(true);
			return;
		case TaskShowDto.DAI_HUI_FU:
			taskRoot.setDaiHuiFu(true);
			return;
		case TaskShowDto.YI_HUI_FU:
			taskRoot.setYiHuiFu(true);
			return;
		case TaskShowDto.YI_GUI_DANG:
			taskRoot.setYiGuiDang(true);
			return;
		}
	}

	@Override
	public List<TaskRoot> getTaskRootTreeListForZip(TaskRoot panrent) {
		String hql = " FROM TaskRoot t " 
				+ " LEFT JOIN FETCH t.owner u "
				+ " LEFT JOIN FETCH u.organization "
				+ " LEFT JOIN FETCH t.responseAttachFile "
				+ " LEFT JOIN FETCH t.responseAttachFile.files "
				+ " WHERE  t.panrentTask = :panrentTask"
//				+ " and t.status != :auditStatus "		//子任务列表中【审核不通过】【已退回】【待审核】的数据不展示，【审核通过】状态的子任务仍显示
				+ " and t.status != :auditNotStatus "
				+ " and t.status != :backStatus "
				+ " and t.status != :awaitStatus "
				+ " and t.exist =:exist "
				+ " order by t.status ";// 审核通过的排在最前面
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("panrentTask", panrent);
		//query.setParameter("auditStatus", TaskRoot.SHEN_HE_TONG_GUO);
		query.setParameter("auditNotStatus", TaskRoot.SHEN_HE_BU_TONG_GUO);
		query.setParameter("backStatus", TaskRoot.YI_TUI_HUI);
		query.setParameter("awaitStatus", TaskRoot.DAI_SHEN_HE);
		query.setParameter("exist", DataExistStatus.EXIST);
		List<TaskRoot> list = query.list();
		for (TaskRoot tempChild : list) {
			//设置该任务的颜色属性
			addColorByStatus(tempChild);
			//递归查询子任务
			recursionQueryChildren(tempChild);
		}
		return list;
	}
	
}
