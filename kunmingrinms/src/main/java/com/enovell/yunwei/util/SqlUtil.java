package com.enovell.yunwei.util;

import java.util.Map;

/**
 * @ClassName: SqlUtil
 * @Description: sql处理工具 
 * @author luoyan
 * @date 2018年1月17日 上午10:19:24 
 */
public class SqlUtil {
	
	/**
	 * 封装分页查询时的分页sql
	 * @Title: buildPagingSql 
	 * @param sql	查询的sql
	 * @param paramMap	参数map
	 * @param start  分页查询的起始值，从0开始
	 * @param limit	   每页数据条数
	 * @return String	返回拼接好的分页sql
	 * @author luoyan
	 */
	public static String buildPagingSql(String sql,Map<String, Object> paramMap,int start,int limit) {  
		StringBuilder pageSql = new StringBuilder();
        pageSql.append(" SELECT * FROM ( SELECT PAGINGSQLPAGETEMP.*, ROWNUM PAGINGSQLROWID FROM ( ")
        .append(sql)
        .append(" ) PAGINGSQLPAGETEMP WHERE ROWNUM <= :pagingSqlPageEnd ")
        .append(" ) WHERE PAGINGSQLROWID > :pagingSqlPageStart "); 
        paramMap.put("pagingSqlPageEnd", start+limit);
        paramMap.put("pagingSqlPageStart", start); 
        return pageSql.toString();    
    }    
	
//	public static void main(String[] args) {
//		
//		String sql = "select y.* from YEAR_MONTH_WRITE_GQ  y ";
//		Map<String, Object> paramMap = new HashMap<>();
//		sql = buildPagingSql(sql,paramMap, 0, 20);
//		
//		System.out.println(sql);
//	}

}
