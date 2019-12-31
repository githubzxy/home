package com.enovell.yunwei.common.dto;

import com.enovell.yunwei.util.JsonUtil;
import org.apache.commons.lang.StringUtils;

/**反馈信息模型
 * @author roy
 * 2014年9月26日-上午9:29:08
 */
public class ResultMsg {

	public static final String SUC_STATUS = "1";
	public static final String FAIL_STATUS = "2";
	
	/**
	 * 返回状态 1-成功 2-失败
	 */
	private String status;
	/**
	 * 返回的提示信息
	 */
	private String msg;
	/**
	 * 返回的数据，任意类型
	 */
	private Object data;
	
	public static ResultMsg getSuccess(String msg,Object data){
		ResultMsg result = new ResultMsg();
		if(StringUtils.isBlank(msg)){
			msg = "操作成功！";
		}
		result.msg = msg;
		if(data != null){
			result.data = data;
		}
		result.status = SUC_STATUS;
		return result;
	}
	
	public static ResultMsg getFailure(String msg,Object data){
		ResultMsg result = new ResultMsg();
		if(StringUtils.isBlank(msg)){
			msg = "操作失败！";
		}
		result.msg = msg;
		if(data != null){
			result.data = data;
		}
		result.status = FAIL_STATUS;
		return result;
	}
	
	public static String getSuccessJson(String msg,Object data){
		ResultMsg result = getSuccess(msg, data);
		return JsonUtil.javaToJsonAsString(result);
	}
	
	public static String getFailureJson(String msg,Object data){
		ResultMsg result = getFailure(msg, data);
		return JsonUtil.javaToJsonAsString(result);
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
