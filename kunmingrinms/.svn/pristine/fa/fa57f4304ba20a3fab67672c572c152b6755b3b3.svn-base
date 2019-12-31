package com.enovell.yunwei.common.dto;

import java.util.List;

/**列表组件数据DTO
 * @author roy
 * 2014年9月10日-上午8:48:09
 */
public class GridDto<E> {

	/**
	 * 数据集合
	 */
	private List<E> rows;
	/**
	 * 记录总数
	 */
	private Long results;
	/**
	 * 是否存在错误
	 */
	private Boolean hasError = false;
	/**
	 * 仅在 hasError : true 时使用,错误信息
	 */
	private String error;
	
	public List<E> getRows() {
		return rows;
	}
	public Long getResults() {
		return results;
	}
	public Boolean getHasError() {
		return hasError;
	}
	public String getError() {
		return error;
	}
	public void setRows(List<E> rows) {
		this.rows = rows;
	}
	public void setResults(Long results) {
		this.results = results;
	}
	public void setHasError(Boolean hasError) {
		this.hasError = hasError;
	}
	public void setError(String error) {
		this.error = error;
	}
}
