package com.enovell.yunwei.util;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 
 * 项目名称：yunwei
 * 类名称：CellUtil   
 * 类描述:  导入EXCEL数据校验工具栏
 * 创建人：lidt 
 * 创建时间：2017-5-5 下午12:50:09
 * 修改人：lidt 
 * 修改时间：2017-5-5 下午12:50:09   
 *
 */
public class CellUtil {

	/**
	 * 
	 * getCellValue 取单元格的数据
	 * @param cell
	 * @return
	 */
	public static String getCellValue(Cell cell) {
		if(cell == null)
			return null;
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_STRING:
			String result = cell.getStringCellValue();
			result = result.replaceAll(" ", "");
			result = result.replaceAll("　", "");
			result = result.replaceAll("\\s*", "");
			return result;
		case Cell.CELL_TYPE_NUMERIC:
			if (DateUtil.isCellDateFormatted(cell)) {
				return formatDate(cell.getDateCellValue());
			} else {
				double doubleVal = cell.getNumericCellValue();
				long longVal = Math.round(doubleVal);
				if (Double.parseDouble(longVal + ".0") == doubleVal)
					return String.valueOf(longVal);
				else
					return String.valueOf(doubleVal);
			}
		case Cell.CELL_TYPE_BLANK:
			return "";
		default: // 包括错误 Cell.CELL_TYPE_ERROR
			return null;
		}
	}
	
	/**如果行数全部为null的错误信息封装 TO-DO 改注释
	 * @param rowNum 行数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 */
	public static void rowNullMsg(int rowNum, String originFileName, List<ValidateMsg> msgs, String sheetName){
		ValidateMsg m = new ValidateMsg();
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setSheet(sheetName);
		m.setErrorMsg("此行单元格格式不符合规范要求，请为单元格设置有效值，如果为空行，请删除此行");
		msgs.add(m);
	}
	
	/**如果单元格为null的错误信息封装
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 */
	public static void cellNullMsg(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		m.setErrorMsg("单元格不能为空");
		msgs.add(m);
	}
	
	/**
	 * 
	 * dataNumberMsg 数字验证格式错误的封装
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void dataNumberMsg(int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】不是数字");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	
	/**
	 * 如果填报日期格式错误的封装(格式为是yyyy-MM-dd格式)
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void dateFormat(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】格式不符合规范或时间不对，"+
					"格式为是yyyy-MM-dd格式,例如2017-01-01");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	
	/**
	 * 检查日期格式是否为yyyy-MM-dd
	 * @param date
	 * @return true-日期正确，否则日期错误
	 */
	public static boolean checkDateIsFormat(String date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			dateFormat.setLenient(false);//严格限制日期转换
			dateFormat.parse(date);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	/**
	 * 如果填报时间格式错误的封装(格式为是yyyy-MM-dd HH:mm:ss格式)
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void timeFormat(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】格式不符合规范或时间不对，"+
					"格式为是yyyy-MM-dd HH:mm:ss格式,例如2017-01-01 10:10:10");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	
	/**
	 * 检查日期格式是否为yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return true-日期正确，否则日期错误
	 */
	public static boolean checkTimeIsFormat(String date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dateFormat.setLenient(false);//严格限制日期转换
			dateFormat.parse(date);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	/**
	 * 将时间格式标准化保存在数据库
	 * @param date
	 * @return
	 */
	public static String formatDate(String date){
		if(StringUtils.isBlank(date)){
			return "";
		}
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return dateFormate.format(dateFormate.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 将时间格式标准化保存在数据库(yyyy-MM-dd HH:mm:ss)
	 * @param date
	 * @return
	 */
	public static String formatTime(Date date){
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormate.format(date);
	}
	
	/**
	 * 将时间格式标准化保存在数据库(yyyy-MM-dd)
	 * @param date
	 * @return
	 */
	public static String formatDate(Date date){
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormate.format(date);
	}
	
	/**获取导入文件的正式标题（设备\线路\网管单项质量分析表）
	 * @param sheet
	 * @return
	 */
	public static String getTitle(Sheet sheet){
		int sheetMergeCount = sheet.getNumMergedRegions(); 
		for(int i = 0 ; i < sheetMergeCount ; i++){  
            CellRangeAddress ca = sheet.getMergedRegion(i);
            int firstRow = ca.getFirstRow();
            int firstColumn = ca.getFirstColumn();
            Cell mergeFirstCell = sheet.getRow(firstRow).getCell(firstColumn);
            String mergeCellValue = CellUtil.getCellValue(mergeFirstCell);
            if(mergeCellValue.contains("全部值班管理信息表")){
            	return mergeCellValue;
            }
		}
		return null;
	}
	public static String getTitle(Sheet sheet, String orgId){
		int sheetMergeCount = sheet.getNumMergedRegions(); 
		for(int i = 0 ; i < sheetMergeCount ; i++){  
			CellRangeAddress ca = sheet.getMergedRegion(i);
			int firstRow = ca.getFirstRow();
			int firstColumn = ca.getFirstColumn();
			Cell mergeFirstCell = sheet.getRow(firstRow).getCell(firstColumn);
			String mergeCellValue = CellUtil.getCellValue(mergeFirstCell);
			if(mergeCellValue.contains("部门值班管理信息表")&&orgId!=null){
				return mergeCellValue;
			}
		}
		return null;
	}
	
	/**
	 * 
	 * dataWorkshopMsg 如果所属车间错误的封装
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void dataWorkshopMsg(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】在系统中不存在");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	/**
	 * 
	 * checkDateAndWeek 验证日期和星期是否匹配（如：2017-01-01是星期天，若传入的星期是星期天返回true，若传入的星期不为星期天则返回false）
	 * @param ondutyDate 日期
	 * @param ondutyWeek 星期
	 * @return
	 */
	public static boolean checkDateAndWeek(String ondutyDate, String ondutyWeek)  {
		
		if(checkDateIsFormat(ondutyDate)){
			boolean flag = false;
			SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date date = formatDate.parse(ondutyDate);
				SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
				String week = sdf.format(date);
				if(week.equals(ondutyWeek)){
					flag = true;
				}
				return flag;
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return flag;
		}else{//若日期格式错误返回true不生成日期与星期不匹配的信息（因为会先生成日期格式错误的信息，所以返回true不做处理）
			return true;
		}
		
	}
	
	/******************************** 通信网停机要点开始 **********************************************************************************************/
	/**
	 * 
	 * stopRailLineMsg 线路错误的封装
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void stopRailLineMsg(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】在系统中不存在");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	
	/**
	 * 
	 * stopBelongCraftMsg 所属专业错误的封装
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void stopBelongCraftMsg(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】在系统中不存在");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	
	/**
	 * 
	 * stopExecutionTypeMsg 施工类别错误的封装
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void stopExecutionTypeMsg(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】在系统中不存在");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	
	/**
	 * 
	 * stopExecutionAttrMsg 施工属性错误的封装
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void stopExecutionAttrMsg(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】在系统中不存在");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	
	/**
	 * 
	 * stopWorkContentMsg 工作内错误的封装
	 * @param index 序号
	 * @param rowNum 行数
	 * @param columnIdx 列数
	 * @param originFileName 文件名
	 * @param msgs 错误信息结果集
	 * @param sheetName Sheet页名
	 * @param checkItem 错误信息
	 */
	public static void stopWorkContentMsg(String index, int rowNum, int columnIdx, String originFileName, List<ValidateMsg> msgs, String sheetName, String checkItem){
		ValidateMsg m = new ValidateMsg();
		m.setIndex(index);
		m.setFileName(originFileName);
		m.setRow(String.valueOf(rowNum));
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		m.setSheet(sheetName);
		m.setColumn(NumberUtil.columnNum2String(columnIdx));
		if (checkItem != null) {
			m.setErrorMsg("单元格的值【"+checkItem+"】在系统中不存在");
		} else {
			m.setErrorMsg("单元格的值不能为空");
		}
		msgs.add(m);
	}
	/*************************************** 通信网停机要点结束 **********************************************************************************************/
	
	
}
