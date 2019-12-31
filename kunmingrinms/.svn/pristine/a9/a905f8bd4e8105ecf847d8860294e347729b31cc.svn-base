package com.enovell.yunwei.onduty.service;

import java.util.List;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import com.enovell.yunwei.util.ValidateMsg;

/**  
* 创建时间：2017年7月7日 下午1:45:09  
* 项目名称：kunmingrinms  
* 文件名称：ImportResultMsg.java  
* 类说明：导入数据相关处理工具
* @author luoyan    
*/
public class ImportDataUtil {
	
	
	/**
	 * 响应错误信息
	 * writeErrorMsgToResponse 
	 * @param results
	 * @return
	 * @author luoyan
	 */
	public static Workbook writeErrorMsgToResponse(List<ValidateMsg> results) {
		
		Workbook wb  = new HSSFWorkbook();
		Sheet sheet = wb.createSheet();
		wb.setSheetName(0, "错误描述");
		Row row1 = sheet.createRow(0);
		Cell row1Cell1 = row1.createCell(0);
		row1Cell1.setCellValue("文件名称");
		Cell row1Cell2 = row1.createCell(1);
		row1Cell2.setCellValue("所属页签");
		Cell row1Cell3 = row1.createCell(2);
		row1Cell3.setCellValue("错误描述");
		Cell row1Cell4 = row1.createCell(3);
		row1Cell4.setCellValue("序号");
		Cell row1Cell5 = row1.createCell(4);
		row1Cell5.setCellValue("行");
		Cell row1Cell6 = row1.createCell(5);
		row1Cell6.setCellValue("列");
		CellStyle cs = wb.createCellStyle();
		cs.setWrapText(true);//设置自动换行
		sheet.setColumnWidth(0, 18*256);//文件名称18个字的宽度
		sheet.setColumnWidth(2, 50*256);//错误描述50个字的宽度
		for(int i = 1;i <= results.size();i++){
			ValidateMsg m = results.get(i-1);
			Row r = sheet.createRow(i);
			Cell c1 = r.createCell(0);
			Cell c2 = r.createCell(1);
			Cell c3 = r.createCell(2);
			Cell c4 = r.createCell(3);
			Cell c5 = r.createCell(4);
			Cell c6 = r.createCell(5);
			c1.setCellValue(m.getFileName());
			c2.setCellValue(m.getSheet());
			c3.setCellValue(m.getErrorMsg());
			c3.setCellStyle(cs);
			c4.setCellValue(m.getIndex());
			c5.setCellValue(m.getRow());
			c6.setCellValue(m.getColumn());
		}
		return wb;
	}
	
	
	/**返回结果HTML
	 * @param string
	 * @return
	 */
	public static String getResultHTML(String msg) {
		String html = "<head>" +
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />" +
				"<style>"+
				"body{text-align:center}"+
				"div {margin:0 auto; width:400px; height:200px; border:1px solid #F00;valign:center;align:center;line-height:100px}"+
				"</style>"+
				"</head>" +
				"<body onLoad=\"setTimeout(window.close, 5000)\">" +
				"<div> " +
				msg + "<br/>" +
				"本页面5秒后自动关闭，或者也可以点击<a href=\"#\" onclick=\"window.close()\">关闭</a>" +
				"</div>" +
				"</body>";
		return html;
	}
	
	
	
}
