package com.enovell.yunwei.onduty.service.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.onduty.domain.OnDuty;
import com.enovell.yunwei.onduty.service.OndutyInsertService;
import com.enovell.yunwei.onduty.service.OndutyService;
import com.enovell.yunwei.util.CellUtil;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.JDBCUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：OndutyInsertServiceImpl   
 * 类描述:  
 * 创建人：lidt 
 * 创建时间：2017-5-8 下午12:45:15
 * 修改人：lidt 
 * 修改时间：2017-5-8 下午12:45:15   
 *
 */
@Transactional
@Service("ondutyInsertService")
public class OndutyInsertServiceImpl implements OndutyInsertService{
	
	@Resource(name = "ondutyService")
	private OndutyService ondutyService;
	
	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	SimpleDateFormat sdfToDate = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat sdfToStr = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public void batchInsertDeviceAnalyse(Workbook wb, User cerateUser) {
		Sheet sheet = wb.getSheetAt(0);
		int rowNum = sheet.getPhysicalNumberOfRows();
	    List<OnDuty> onDutys = new ArrayList<OnDuty>();
		for (int i = 2; i < rowNum; i++) {
	    	Row row = sheet.getRow(i);
	    	
	    	String dutyDate = CellUtil.getCellValue(row.getCell(1));
    		String week = CellUtil.getCellValue(row.getCell(2));
    		String orgName = CellUtil.getCellValue(row.getCell(3));
    		String userName = CellUtil.getCellValue(row.getCell(4));
    		User user = ondutyService.getDeptAndPeople(orgName, userName);
    		String fixedNum = CellUtil.getCellValue(row.getCell(5));
    		String cellPhoneNum = CellUtil.getCellValue(row.getCell(6));
    		
    		
    		OnDuty onDuty = new OnDuty();
    		onDuty.setId(JDBCUtil.getUUID32());
    		try {
    			dutyDate = sdfToStr.format(sdfToDate.parse(dutyDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
    		onDuty.setDutyDate(StringDateToDateUtil.getDate(dutyDate + " 00:00:00"));
    		onDuty.setWeek(week);
    		onDuty.setUser(user);
    		onDuty.setFixedNum(fixedNum);
    		onDuty.setCellPhoneNum(cellPhoneNum);
    		// 默认保存
    		onDuty.setStatus("1");
    		onDuty.setCreatDate(new Date());
    		onDuty.setCreatUser(cerateUser);
    		
    		onDutys.add(onDuty);
		}
		batchSaveOnDutyTableItem(onDutys);

	}

	/**
	 * batchSaveOnDutyTableItem 数据入库
	 * @param workshopProblems 数据集合
	 */
	private void batchSaveOnDutyTableItem(final List<OnDuty> onDutys) {
		String sql = "INSERT INTO ONDUTY ("
				+ " ID_, "
				+ " DUTYDATE_, "
				+ " WEEK_, "
				+  "USERID_, "
				+ " FIXEDNUM_, "
				+ " CELLPHONENUM_, "
				+ " STATUS_, "
				+ " CREATDATE_, "
				+ " CREATUSERID_, "
				+ " EXIST_) "
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setString(1, onDutys.get(i).getId());
				ps.setTimestamp(2, Timestamp.valueOf(StringDateToDateUtil.getDateString(onDutys.get(i).getDutyDate())));
				ps.setString(3, weekToNumber(onDutys.get(i).getWeek()));
				ps.setString(4, onDutys.get(i).getUser().getId());
				ps.setString(5, onDutys.get(i).getFixedNum());
				ps.setString(6,onDutys.get(i).getCellPhoneNum());
				ps.setString(7, onDutys.get(i).getStatus());
				ps.setTimestamp(8, Timestamp.valueOf(StringDateToDateUtil.getDateString(onDutys.get(i).getCreatDate())));
				ps.setString(9, onDutys.get(i).getCreatUser().getId());
				ps.setBoolean(10, DataExistStatus.EXIST);
			}
		 
			@Override
			public int getBatchSize() {
				return onDutys.size();
			}
		});
	}
	
	/**
	 * 
	 * weekToNumber 星期转数字
	 * @param week
	 * @return
	 */
	private String weekToNumber(String week) {
		if (week.equals("星期日")) {
			return "0";
		}
		if (week.equals("星期一")) {
			return "1";
		}
		if (week.equals("星期二")) {
			return "2";
		}
		if (week.equals("星期三")) {
			return "3";
		}
		if (week.equals("星期四")) {
			return "4";
		}
		if (week.equals("星期五")) {
			return "5";
		}
		if (week.equals("星期六")) {
			return "6";
		}
		return week;
	}

}
