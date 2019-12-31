package com.enovell.yunwei.circuitWO.service;

import java.util.List;

import com.enovell.yunwei.circuitWO.domain.CircuitWO;
/**      
 * 项目名称：RINMS2MAIN
 * 类名称：CircuitWORootTreeService   
 * 类描述:  子调令树形列表数据 接口
 * 创建人：ltf 
 * 创建时间：2016-12-20 下午6:13:28
 * 修改人：ltf
 * 修改时间：2016-12-20 下午6:13:28   
 * 修改人：lilt
 * 修改时间：2018-11-01 3:48 PM    
 */
public interface CircuitWORootTreeService {

	/**    
	 * getTaskRootTreeList 子任务命令树结构
	 * @param panrent
	 * @return
	 */
	List<CircuitWO> getCircuitWOTreeList(CircuitWO parent,String id);
	/**    
	 * getTaskRootTreeList 子任务命令树结构，用于回复附件打包
	 * @param panrent
	 * @return
	 */
	List<CircuitWO> getTaskRootTreeListForZip(CircuitWO parent);
	/**
	 * addColorByStatus 根据不同的状态设置不同的颜色
	 * @param circuitWO 电路工单任务
	 */
	void addColorByStatus(CircuitWO circuitWO);

}
