package com.enovell.yunwei.system.dto;

import java.io.Serializable;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：NameAndIdDTO   
 * 类描述:  用于存储select多选框需显示的数据
 * 创建人：yangsy
 * 创建时间：2017-5-17 下午4:06:39
 *
 */
public class NameAndIdDTO implements Serializable{
	 
	
	private static final long serialVersionUID = 62929994746301368L;

	/**
	 * 用户名称
	 */
	private String text;
	
	/**
	 * 用户id
	 */
	private String value;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
}
