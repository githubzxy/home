package com.enovell.yunwei.util;

/**
 * 验证结果错误信息模型
 * @author roy
 * 2014年8月12日-上午10:02:34
 */
public class ValidateMsg {

	/**
	 * 文件名称
	 */
	private String fileName;
	/**
	 * 所属页签
	 */
	private String sheet;
	/**
	 * 错误信息
	 */
	private String errorMsg;
	/**
	 * 序号
	 */
	private String index;
	/**
	 * 行
	 */
	private String row;
	/**
	 * 列
	 */
	private String column;
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSheet() {
		return sheet;
	}
	public void setSheet(String sheet) {
		this.sheet = sheet;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getRow() {
		return row;
	}
	public void setRow(String row) {
		this.row = row;
	}
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	@Override
	public String toString() {
		return "ValidateMsg [fileName=" + fileName + ", sheet=" + sheet
				+ ", errorMsg=" + errorMsg + ", index=" + index + ", row="
				+ row + ", column=" + column + "]";
	}
	
}
