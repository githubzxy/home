
/**   
 * 文件名：getRootPathUtil.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-10-17 下午03:27:39   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.util;


/**
 * 类名称：getRootPathUtil   
 * 类描述: 得到根目录—工具类//todo
 * 创建人：qyy 
 * 创建时间：2016-10-17 下午03:27:39   
 */

public class GetRootPathUtil {
	
	public static boolean isWindowsSystem() {
        String p = System.getProperty("os.name");
        return p.toLowerCase().indexOf("windows") >= 0 ? true : false;
    }
	
	public static String getRootPath(){
		
		String path = null;
		String folderPath = GetRootPathUtil.class.getProtectionDomain().getCodeSource().getLocation().getPath();
		if (folderPath.indexOf("WEB-INF") > 0) {
			path = folderPath.substring(0,folderPath.lastIndexOf("kunmingrinms") - 1);
		}
		
		// 如果是windows
		if(isWindowsSystem()) {
			
			return path.substring(1, path.length());
		}
		// 如果是linux
		return path;
 	}

	public static void main(String[] args) {
		System.out.println(getRootPath());
	}
}
