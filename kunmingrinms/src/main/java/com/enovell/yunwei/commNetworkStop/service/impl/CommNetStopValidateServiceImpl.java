package com.enovell.yunwei.commNetworkStop.service.impl;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.commNetworkStop.domain.CommNetStop;
import com.enovell.yunwei.commNetworkStop.service.CommNetStopValidateService;
import com.enovell.yunwei.railLine.service.RailLineService;
import com.enovell.yunwei.util.*;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 
 * 项目名称：yunwei
 * 类名称：CommNetStopValidateServiceImpl   
 * 类描述:  停机要点导入数据实现
 * 创建人：lidt 
 * 创建时间：2017-5-8 下午5:12:22
 * 修改人：lidt 
 * 修改时间：2017-5-8 下午5:12:22   
 *
 */
@Service("commNetStopValidateService")
public class CommNetStopValidateServiceImpl implements CommNetStopValidateService {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Resource(name="railLineService")
    RailLineService railLineService;
	
	/**
	 * batchInsertCommNetStop 从EXCEL中批量停机计划数据
	 * @param wb
	 * @param user 登录用户
	 * @return
	 */
	private void batchInsertCommNetStop(Workbook wb, User user) {
		Sheet sheet = wb.getSheetAt(0);// 第一个Sheet页
		// 有效数据的第一行
		int rowNum = CommNetStop.START_ROW_NUM;// 直接从第2行开始读取
		// 有效数据的总行数
		int rowAll = sheet.getPhysicalNumberOfRows();
		
		List<CommNetStop> list = new ArrayList<CommNetStop>();
		while (rowNum < rowAll) {
			int column = 1;//定义列数(从0开始)
			Row stopPlanMainRow = sheet.getRow(rowNum++);

			// 开始时间在B列
			String startDate = stopPlanMainRow.getCell(column++).getStringCellValue();
			// 结束时间在C列
			String endtDate = stopPlanMainRow.getCell(column++).getStringCellValue();
			// 线路在D列
			String railLineName = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 所属局在E列
			String belongOffice = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 工作内容在F列
			String workContent = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 所属专业在G列
			String belongCraft = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 取施工类别在H列
			String executionType = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 施工属性在I列
			String executionAttr = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 施工地点在J列
			String executionAddr = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 涉及骨干网名称在K列
			String mainNetName = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 涉及铁路局在L列
			String railwaysBureau = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 计划原因说明M
			String planCaption = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 是否天窗N
			String skyLight = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			CommNetStop cs = new CommNetStop();
			cs.setId(JDBCUtil.getUUID32());
			cs.setStartDate(StringDateToDateUtil.getDate(startDate));
			cs.setEndDate(StringDateToDateUtil.getDate(endtDate));
			cs.setRailLineName(railLineName);
			cs.setBelongOffice(belongOffice);
			cs.setWorkContent(workContent);
			cs.setBelongCraft(getBelongCraft(belongCraft));
			cs.setExecutionType(getExecutionType(executionType));
			cs.setExecutionAttr(getExecutionAttr(executionAttr));
			cs.setExecutionAddr(executionAddr);
			cs.setMainNetName(mainNetName);
			cs.setRailwaysBureau(railwaysBureau);
			cs.setPlanCaption(planCaption);
			cs.setSkyLight("是".equals(skyLight)?true:false);
			// 默认保存
			cs.setCreateDate(new Date());// 创建时间
			cs.setApplyOrg(user.getOrganization());// 申请单位
			cs.setState(CommNetStop.WAIT_EXAMINE);// 状态，默认0-待审核
			cs.setExist(DataExistStatus.EXIST);// 是否存在，默认true-存在
			
			list.add(cs);
		}
		// 保存到数据库
		batchSaveCommNetStopTableItem(list);
		
	}

	/**
	 * batchSaveCommNetStopTableItem 数据入库
	 * @param commNetStops 数据集合
	 */
	private void batchSaveCommNetStopTableItem(final List<CommNetStop> commNetStops) {
		String sql = "INSERT INTO MAINSTOP_ ("
					+ " ID_, "
					+ " START_DATE_, "
					+ " END_DATE_, "
					+ " RAIL_LINE_NAME_, "
					+ " BELONG_OFFICE_, "
					+ " WORK_CONTENT_, "
					+ " BELONG_CRAFT_, "
					+ " EXECUTION_TYPE_, "
					+ " EXECUTION_ATTR_, "
					+ " EXECUTION_ADDR_, "
					+ " MAIN_NET_NAME_, "
					+ " RAILWAYS_BUREAU_, "
					+ " CREATE_DATE_, "
					+ " APPLY_ORG_, "
					+ " STATE_, "
					+ " EXIST_," +
				      "SKY_LIGHT_) "
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setString(1, commNetStops.get(i).getId());
				ps.setTimestamp(2, Timestamp.valueOf(StringDateToDateUtil.getDateString(commNetStops.get(i).getStartDate())));
				ps.setTimestamp(3, Timestamp.valueOf(StringDateToDateUtil.getDateString(commNetStops.get(i).getEndDate())));
				ps.setString(4, commNetStops.get(i).getRailLineName());
				ps.setString(5, commNetStops.get(i).getBelongOffice());
				ps.setString(6, commNetStops.get(i).getWorkContent());
				ps.setInt(7, commNetStops.get(i).getBelongCraft());
				ps.setInt(8, commNetStops.get(i).getExecutionType());
				ps.setInt(9, commNetStops.get(i).getExecutionAttr());
				ps.setString(10, commNetStops.get(i).getExecutionAddr());
				ps.setString(11, commNetStops.get(i).getMainNetName());
				ps.setString(12, commNetStops.get(i).getRailwaysBureau());
				ps.setTimestamp(13, Timestamp.valueOf(StringDateToDateUtil.getDateString(commNetStops.get(i).getCreateDate())));
				ps.setString(14, commNetStops.get(i).getApplyOrg().getId());
				ps.setInt(15, commNetStops.get(i).getState());
				ps.setBoolean(16, commNetStops.get(i).getExist());
				ps.setBoolean(17,commNetStops.get(i).getSkyLight());
			}
		 
			@Override
			public int getBatchSize() {
				return commNetStops.size();
			}
		});
	}
	
	/**
	 * 
	 * validate 停机要点文件导入信息验证
	 * @param uploadName 上传文件名
	 * @param msgs 错误信息结果集
	 * @param wb
	 * @return
	 */
	public List<ValidateMsg> validate(String uploadName, List<ValidateMsg> msgs, Workbook wb) {
		Sheet sheet = wb.getSheetAt(0);// 第一个Sheet页
		// 第一行(不包含表头)
		int rowNum = CommNetStop.START_ROW_NUM;// 直接从第2行开始读取
		// 总行数(不包含表头)
		int rowAll = sheet.getPhysicalNumberOfRows();
		String sheetName = sheet.getSheetName(); // Sheet页名称
		while (rowNum < rowAll) {
			int column = 0;//定义列数(从0开始)
			Row stopPlanMainRow = sheet.getRow(rowNum++);

			// 1.取序号，对应A列
			String index = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 2.取开始时间，对应B列
			String startDate = stopPlanMainRow.getCell(column++).getStringCellValue();
			// 3.取结束时间，对应C列
			String endtDate = stopPlanMainRow.getCell(column++).getStringCellValue();
			// 4.取线路，对应D列
			String railLineName = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 5.取所属局，对应E列
			String belongOffice = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 6.取工作内容，对应F列
			String workContent = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 7.取所属专业，对应G列
			String belongCraft = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 8.取施工类别，对应H列
			String executionType = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 9.取施工属性，对应I列
			String executionAttr = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 10.取施工地点，对应J列
			String executionAddr = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 11.取涉及骨干网名称，对应K列
			String mainNetName = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 12.取涉及铁路局，对应L列
			String railwaysBureau = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 13.计划原因说明M
			String planCaption = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 14.是否天窗
			String skyLight = CellUtil.getCellValue(stopPlanMainRow.getCell(column++));
			// 如果一行数据全部为空，则提示删除该行，并跳出本次循环
			if (StringUtils.isBlank(index)
					&& StringUtils.isBlank(startDate)
					&& StringUtils.isBlank(endtDate)
					&& StringUtils.isBlank(railLineName)
					&& StringUtils.isBlank(belongOffice)
					&& StringUtils.isBlank(workContent)
					&& StringUtils.isBlank(belongCraft)
					&& StringUtils.isBlank(executionType)
					&& StringUtils.isBlank(executionAttr)
					&& StringUtils.isBlank(executionAddr)
					&& StringUtils.isBlank(mainNetName)
					&& StringUtils.isBlank(railwaysBureau)
					&& StringUtils.isBlank(planCaption)
					&& StringUtils.isBlank(skyLight)
					) {
				CellUtil.rowNullMsg(rowNum, uploadName, msgs, sheetName);
				continue;
			}
			
			// 1.如果序号列为空或者不是数字(默认第1列)
			if (StringUtils.isBlank(index) || !NumberUtil.isNumeric(index)) {
				CellUtil.dataNumberMsg(rowNum, 1, uploadName, msgs, sheetName, index);
			}
			// 2.如果开始时间列为空或者格式错误
			if (StringUtils.isBlank(startDate) || !CellUtil.checkTimeIsFormat(startDate)) {
				CellUtil.timeFormat(index, rowNum, 2, uploadName, msgs, sheetName, startDate);
			}
			// 3.如果结束时间列为空或者格式错误
			if (StringUtils.isBlank(endtDate) || !CellUtil.checkTimeIsFormat(endtDate)) {
				CellUtil.timeFormat(index, rowNum, 3, uploadName, msgs, sheetName ,startDate);
			}
			// 4.如果线路列为空或者不在系统里
			if (StringUtils.isBlank(railLineName) || !railLineService.isExistsRailLineName(railLineName)) {
				CellUtil.stopRailLineMsg(index, rowNum, 4, uploadName, msgs, sheetName, railLineName);
			}
			// 5.如果所属局列为空
			if (StringUtils.isBlank(belongOffice)) {
				CellUtil.cellNullMsg(index, rowNum, 5, uploadName, msgs, sheetName);
			}
			// 6.如果工作内容列为空或者不在系统里
			if (StringUtils.isBlank(workContent) || getWorkContent(workContent) == null) {
				CellUtil.stopWorkContentMsg(index, rowNum, 6, uploadName, msgs, sheetName, workContent);
			}
			// 7.如果所属专业列为空或者不在系统里
			if (StringUtils.isBlank(belongCraft) || getBelongCraft(belongCraft) == null) {
				CellUtil.stopBelongCraftMsg(index, rowNum, 7, uploadName, msgs, sheetName, belongCraft);
			}
			// 8.如果施工类别列为空或者不在系统里
			if (StringUtils.isBlank(executionType) || getExecutionType(executionType) == null) {
				CellUtil.stopExecutionTypeMsg(index, rowNum, 8, uploadName, msgs, sheetName, executionType);
			}
			// 9.如果施工属性列为空或者不在系统里
			if (StringUtils.isBlank(executionAttr) || getExecutionAttr(executionAttr) == null) {
				CellUtil.stopExecutionAttrMsg(index, rowNum, 9, uploadName, msgs, sheetName, executionAttr);
			}
			// 10.如果施工地点列为空
			if (StringUtils.isBlank(executionAddr)) {
				CellUtil.cellNullMsg(index, rowNum, 10, uploadName, msgs, sheetName);
			}
			// 11.如果涉及骨干网名称列为空
			if (StringUtils.isBlank(mainNetName)) {
				CellUtil.cellNullMsg(index, rowNum, 11, uploadName, msgs, sheetName);
			}
			// 12.如果涉及铁路局列为空
			if (StringUtils.isBlank(railwaysBureau)) {
				CellUtil.cellNullMsg(index, rowNum, 12, uploadName, msgs, sheetName);
			}
			// 13.计划原因说明
			if(StringUtils.isBlank(planCaption)){
				CellUtil.cellNullMsg(index, rowNum, 13, uploadName, msgs, sheetName);
			}
			// 14.是否天窗为空
			if(StringUtils.isBlank(skyLight)){
				CellUtil.cellNullMsg(index,rowNum,14,uploadName,msgs,sheetName);
			}
		}

		return msgs;
	}
	
	@Transactional
	@Override
	public List<ValidateMsg> getValidateMsg(Workbook workbook, String uploadName, User user) {
		List<ValidateMsg> results = null;
		try {
			List<ValidateMsg> msgs = new ArrayList<ValidateMsg>();
			results = validate(uploadName, msgs, workbook);// 对文件进行验证
			if (results.isEmpty()) {// 无任何错误信息
				// 批量插入数据入库
				batchInsertCommNetStop(workbook, user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return results;
	}
	
	/**
	 * 
	 * getWorkContent 获取工作内容的值
	 * @param workContent
	 * @return
	 */
	private Integer getWorkContent(String workContent){
		if ("电路调整".equals(workContent)) {
			return CommNetStop.CIRCUITADJUSTMENT;
		}
		if ("光缆割接".equals(workContent)) {
			return CommNetStop.CABLE_CUTOVER;
		}
		if ("光缆接头盒".equals(workContent)) {
			return CommNetStop.CABLE_JOINTBOX;
		}
		if ("接头割接".equals(workContent)) {
			return CommNetStop.JOINT_CUTOVER;
		}
		if ("开盒确认故障点".equals(workContent)) {
			return CommNetStop.BOX_FAULT;
		}
		if ("设备计表".equals(workContent)) {
			return CommNetStop.EQUIPMENT;
		}
		if ("设备尾纤更换".equals(workContent)) {
			return CommNetStop.EQUIPMENT_FIBER_REPLACE;
		}
		return null;
	}
	
	/**
	 * 
	 * getBelongCraft 获取所属专业的值
	 * @param belongCraft
	 * @return
	 */
	private Integer getBelongCraft(String belongCraft){
		if ("GSM-R".equals(belongCraft)) {
			return CommNetStop.GSM_R;
		}
		if ("传输网（设备）".equals(belongCraft)) {
			return CommNetStop.TRANSNETWORK_EQUIPMENT;
		}
		if ("传输网（线路）".equals(belongCraft)) {
			return CommNetStop.TRANSNETWORK_LINE;
		}
		if ("隐患属性".equals(belongCraft)) {
			return CommNetStop.DANGER_ATTR;
		}
		return null;
	}
	
	/**
	 * 
	 * getExecutionType 获取施工类别的值
	 * @param executionType
	 * @return
	 */
	private Integer getExecutionType(String executionType){
		if ("施工Ⅰ级".equals(executionType)) {
			return CommNetStop.CONST_ONE;
		}
		if ("施工Ⅱ级".equals(executionType)) {
			return CommNetStop.CONST_TWO;
		}
		if ("施工Ⅲ级（一般）".equals(executionType)) {
			return CommNetStop.CONST_THREE_GENERAL;
		}
		if ("施工Ⅲ级（重点）".equals(executionType)) {
			return CommNetStop.CONST_THREE_IMPORTANT;
		}
		if ("维修Ⅰ级".equals(executionType)) {
			return CommNetStop.REPAIR_ONE;
		}
		if ("维修Ⅱ级".equals(executionType)) {
			return CommNetStop.REPAIR_TWO;
		}
		return null;
	}
	
	/**
	 * 
	 * getExecutionAttr 获取施工属性的值
	 * @param executionAttr
	 * @return
	 */
	private Integer getExecutionAttr(String executionAttr){
		if ("电路调整".equals(executionAttr)) {
			return CommNetStop.CIRCUIT_ADJUSTMENT;
		}
		if ("机房标准化建设".equals(executionAttr)) {
			return CommNetStop.STANDARD_CONST;
		}
		if ("设备计表测试".equals(executionAttr)) {
			return CommNetStop.EQUIPMENT_TEST;
		}
		if ("市政改迁".equals(executionAttr)) {
			return CommNetStop.MUNICIPAL_CHANGE;
		}
		if ("铁路迁改".equals(executionAttr)) {
			return CommNetStop.RAILWAY_CHANGE;
		}
		if ("线路故障处理".equals(executionAttr)) {
			return CommNetStop.LINE_FAULT_HANDLING;
		}
		if ("隐患环网".equals(executionAttr)) {
			return CommNetStop.DANGER_RING_NETWORK;
		}
		return null;
	}
	
}
