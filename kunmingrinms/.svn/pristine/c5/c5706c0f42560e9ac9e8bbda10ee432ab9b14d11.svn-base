
/**   
 * 文件名：poiExportExcel.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-2-27 下午4:19:51   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare;

import com.enovell.yunwei.attach.web.AttachFileAction;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**      
 * 项目名称：kunmingrinms
 * 类名称：poiExportExcel   
 * 类描述:  标题行固定列竖向单元格合并，动态列进行列分组，最后一列小计
 * 创建人：ltf 
 * 创建时间：2017-2-27 下午4:19:51
 * 修改人：ltf
 * 修改时间：2017-2-27 下午4:19:51   
 *    
 */

public class ExportExcel {
	
	/**    
	 * exportXls 日常备品，日常备品统计Excel导出
	 * @param fileName 文件名
	 * @param headerName	表头(可为null)
	 * @param colGroupName	列分组名称（动态列分组名称）
	 * @param fixedIdAndNames	固定列名称及id（id用于结果集Map中的key值）
	 * @param idAndNames 动态列名称及id（id用于结果集Map中的key值）
	 * @param dataList 表体数据
	 * @param request
	 * @param response
	 */
	public void exportXls(String fileName, 
										String headerName, 
										String colGroupName,
										List<String[]> fixedIdAndNames,
										List<List<String>> idAndNames,
										List<Map<String,Object>> dataList, 
										HttpServletRequest request,
										HttpServletResponse response) {
		
		HSSFWorkbook workbook = createWorkbook(headerName, colGroupName, fixedIdAndNames, idAndNames, dataList);
		outFile(fileName, workbook, request, response);
	}
	
	
	
	/**    
	 * createWorkbook 创建工作表
	 * @param headerName
	 * @param colGroupName
	 * @param fixedIdAndNames
	 * @param idAndNames
	 * @param dataList
	 * @return
	 */
	private  HSSFWorkbook createWorkbook(
														String headerName, 
														String colGroupName,
														List<String[]> fixedIdAndNames,
														List<List<String>> idAndNames,
														List<Map<String,Object>> dataList) {
    	HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();
		
		int rowNum = 0;
		int colLength=fixedIdAndNames.get(0).length+idAndNames.get(0).size();//表格总列数（序号列+固定列数+动态列数-1）
	
		// 创建excel表头
		if(StringUtils.isNotBlank(headerName)) {
			rowNum = createHeader(rowNum, workbook, sheet, headerName, colLength);
			rowNum++;
		}
		
		// 创建标题行
		String[] fixedHeadName=fixedIdAndNames.get(1);
		List<String> colNames=idAndNames.get(1);
		rowNum = createTableHeader(rowNum, workbook, sheet, colGroupName, fixedHeadName, colNames);
		
		//创建表体内容
		String[] fixedHeadId=fixedIdAndNames.get(0);
		List<String> ids=idAndNames.get(0);
		createTableData(rowNum, workbook, sheet, fixedHeadId, ids, dataList);
		
		return workbook;
	}
	
    
    /**    
     * createTableData 表体内容
     * @param rowNum
     * @param workbook
     * @param sheet
     * @param fixedHeadId
     * @param ids
     * @param dataList
     * @return
     */
    private  int createTableData(int rowNum, HSSFWorkbook workbook, HSSFSheet sheet, 
    							String[] fixedHeadId, List<String> ids,  List<Map<String,Object>> dataList){
    	HSSFCellStyle style = getCellStyle(workbook,false);
    	for(int i = 0; i < dataList.size(); i ++){
			Map<String,Object> data= dataList.get(i);
			rowNum ++;
			Row row = sheet.createRow(rowNum);
			row.setHeightInPoints(25);
			
			int colNum=0;
			// 设置序号单元格
			Cell cell = row.createCell(colNum);
			cell.setCellStyle(style);
			// 序号从1开始
			cell.setCellValue(i+1);
			
			//添加固定列
			colNum=addFixedColsData(sheet, row, style, data, fixedHeadId, colNum);
	        //添加动态列
			colNum=addDynamicColsData(sheet, row, style, ids, data, colNum);
    	}
        return rowNum;
	}
	
	
	/**    
	 * nullToString null转化为空字符串
	 * @param obj
	 * @return
	 */
	private String nullToString(Object obj){
		return obj==null?"":obj.toString();
	}
    
    /**添加固定列数据*/
    private int  addFixedColsData(HSSFSheet sheet, Row row, HSSFCellStyle style, Map<String,Object> data, String[] fixedHeadId, int colNum){
        for(int i = 0; i <fixedHeadId.length; i++) {// 从序号后添加单元格（固定列）
        	colNum++;
        	Cell cell = row.createCell(colNum);
            cell.setCellValue(nullToString(data.get(fixedHeadId[i])));
            cell.setCellStyle(style);
        }
        return colNum;
    }
    
    
    /**添加动态列数据*/
    private int addDynamicColsData(HSSFSheet sheet, Row row, HSSFCellStyle style, List<String> ids, Map<String,Object> data,  int colNum){
    	for(int i = 0; i <ids.size(); i++) {// 在固定列后添动态列
        	colNum++;
        	Cell cell = row.createCell(colNum);
            cell.setCellValue(nullToString(data.get(ids.get(i))));
            cell.setCellStyle(style);
        }
    	return colNum;
    }
	
	
	
	
    /**
     * 
     * createHeader 创建excel表头
     * @param rowNum
     * @param workbook
     * @param sheet
     * @param headerName
     * @param headerTableColumns
     * @return
     */
    private int createHeader(int rowNum, HSSFWorkbook workbook, HSSFSheet sheet, String headerName, int columnLength) {
    	
    	HSSFCellStyle style = getCellStyle(workbook,true);
        Row row = sheet.createRow(rowNum);
        row.setHeightInPoints(30);
        Cell cell = null;
        cell = row.createCell(0);
        cell.setCellValue(headerName);
        cell.setCellStyle(style);
        
        // 合并单元格
        manualMergerCell(sheet, 0, 0, 0, columnLength);
        
        return rowNum;
    }
	
    /**    
     * createTableHeader 创建表格标题行
     * @param rowNum 行号(已经创建完成的行号)
     * @param workbook 
     * @param sheet 
     * @param colNames 标题行动态列
     * @return 返回行号
     */
    private  int createTableHeader(int rowNum, HSSFWorkbook workbook, HSSFSheet sheet, 
    										String colGroupName, String[] fixedHeadName, List<String> colNames){
        HSSFCellStyle style = getCellStyle(workbook,true);
        //添加标题行-固定列
        rowNum=addFixedCols(rowNum, sheet, style, colGroupName, fixedHeadName, colNames);
        //添加标题行-动态列
        rowNum=addDynamicCols(rowNum, sheet, style, fixedHeadName, colNames);
        return rowNum;
	}
    
    /**    
     * addFixedCols 固定列标题行（包含列分组标题）创建
     * @param rowNum 当前行号
     * @param sheet
     * @param style
     * @param colGroupName 列分组名称
     * @param fixedHeadName 固定列标题
     * @param colNames 当前列号
     * @return
     */
    private int addFixedCols(int rowNum, HSSFSheet sheet, HSSFCellStyle style, 
    							String colGroupName, String[] fixedHeadName, List<String>colNames){
        Row row = sheet.createRow(rowNum);
        row.setHeightInPoints(20);
        int colLength=1+fixedHeadName.length+colNames.size();//表格总列数
        for(int i=0;i<colLength;i++){
			 Cell cell = row.createCell(i);
			 cell.setCellStyle(style);
			 if(i==0){
				 cell.setCellValue("序号");
				 sheet.setColumnWidth(i, 7*256);
			 }else if(i==colLength-1){
				 cell.setCellValue(colNames.get(colNames.size()-1));
				 sheet.setColumnWidth(i, 15*256);
			 }else if(i<1+fixedHeadName.length){
				 cell.setCellValue(fixedHeadName[i-1]);
				 sheet.setColumnWidth(i, 15*256);
			 }else{
				 cell.setCellValue(colGroupName);//列分组名称
				 sheet.setColumnWidth(i, 15*256);
			 }
        	 
        }
        manualMergerCell(sheet, rowNum, rowNum, 1+fixedHeadName.length, colLength-2);//固定列以后的所有列（即动态列）横向合并（最后“小计列”除外）
        return rowNum;
    }
    
    
    /**    
     * addDynamicCols 动态列标题行创建
     * @param rowNum 
     * @param sheet
     * @param style
     * @param colNames
     * @return
     */
    private int addDynamicCols(int rowNum, HSSFSheet sheet, HSSFCellStyle style,String[] fixedHeadName, List<String>colNames){
    	rowNum++;
        Row row = sheet.createRow(rowNum);
        row.setHeightInPoints(30);
        int colLength=1+fixedHeadName.length+colNames.size();//表格总列数
        for(int i=0;i<colLength;i++){
			 Cell cell = row.createCell(i);
			 cell.setCellStyle(style);
			 if(i<1+fixedHeadName.length||i==colLength-1){
				 cell.setCellValue("");
				 manualMergerCell(sheet, rowNum-1, rowNum, i, i);
			 }else{
				 cell.setCellValue(colNames.get(i-1-fixedHeadName.length));
				 sheet.setColumnWidth(i, 15*256);
			 }
        	 
        }
        return rowNum;
    }
    
	
	/**    
	 * getCellStyle 单元格样式
	 * @param workbook
	 * @param isHeader
	 * @return
	 */
	private HSSFCellStyle getCellStyle(HSSFWorkbook workbook, boolean isHeader){
        HSSFCellStyle style = workbook.createCellStyle();
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        // excel换行条件：1、cellStyle.setWrapText(true);2、在要换行处添加\n就可以换行了
        style.setWrapText(true);
		// 单元格平水和垂直对齐方式
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        if (isHeader) {
        	style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        	style.setFillForegroundColor(IndexedColors.LIGHT_TURQUOISE.getIndex());

            HSSFFont font = workbook.createFont();
            font.setColor(HSSFColor.BLACK.index);
            font.setFontHeightInPoints((short) 12);
            font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            style.setFont(font);
        }        
        return style;
    }
	
	/**
	 * 
	 * manualMergerCell 手动合并单元格
	 * @param sheet 
	 * @param firstRow 开始行
	 * @param lastRow 结束行
	 * @param firstColumn 开始列
	 * @param lastColumn 结束列
	 */
	private void manualMergerCell(Sheet sheet, int firstRow, int lastRow, int firstColumn, int lastColumn) {
		
		sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, firstColumn, lastColumn));
	}
	
	
	
	/**
	 * 
	 * outFile 输出文件
	 * @param fileName
	 * @param workbook
	 * @param request
	 * @param response
	 */
	private void outFile(String fileName, Workbook workbook, 
								HttpServletRequest request, HttpServletResponse response)  {
		ServletOutputStream out = null;
		try {
			SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			fileName = AttachFileAction.urlEncoder(request, fileName + formatDate.format(new Date()));
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.setContentType("binary/octet-stream");
			
			response.setHeader("Content-disposition", "attachment; fileName = " + fileName + ".xls");
			
			out = response.getOutputStream();
			workbook.write(out); 
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(out != null) {
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
