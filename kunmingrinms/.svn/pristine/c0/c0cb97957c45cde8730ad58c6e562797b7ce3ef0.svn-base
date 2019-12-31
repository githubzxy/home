package com.enovell.yunwei.util;

import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.List;
import java.util.UUID;

public class CommonTools {

	/**
	 * 
	 * getUUID 获取UUID
	 * @return
	 */
	public static String getUUID() {
		
		String uuid = UUID.randomUUID().toString();
		
		return uuid.replace("-", "");
	}
	
	/**
	 * 
	 * 判断操作系统类型
	 * @return
	 */
	public static boolean isWindowsSystem() {
        String p = System.getProperty("os.name");
        return p.toLowerCase().indexOf("windows") >= 0 ? true : false;
    }
	
	/**
	 * 
	 * NullToEmpty obj为null返回""
	 * @param obj
	 * @return
	 */
	public static String NullToEmpty(Object obj) {
		
		if(obj == null) {
			return "";
		}
		return String.valueOf(obj);
	}
	
	/**
	 * 
	 * averageForList 求List<Double>的平均值(包括0的计算)
	 * @param list<Double>
	 * @return
	 */
	public static Double averageForList(List<Double> list) {
		
		if(list == null || list.size() ==0) {
			return 0.0;
		}
		// 平均值
		Double avg = 0.0;
		// 合计值
		Double sum = 0.0;
		for(Double value : list) {
			sum += value == null ? 0 : value;
		}
		// 保留2位小数
		DecimalFormat df = new DecimalFormat("#.00");
		// 四舍五入
		df.setRoundingMode(RoundingMode.HALF_UP);
		avg = sum / list.size();
		avg = Double.parseDouble(df.format(avg));
		return avg;
	}
	
	/**
	 * 
	 * averageForListNotZero 求List<Double>的平均值(不包括0的计算)
	 * @param list<Double>
	 * @return
	 */
	public static Double averageForListNotZero(List<Double> list) {
		
		if(list == null || list.size() ==0) {
			return 0.0;
		}
		// 平均值
		Double avg = 0.0;
		// 合计值
		Double sum = 0.0;
		// 总数量（不包括0）
		int count = 0;
		for(Double value : list) {
			if(value != null && value != 0) {
				sum += value;
				count ++;
			}
		}
		// 判断count
		if(count == 0) {
			return 0.0;
		}
		// 保留2位小数
		DecimalFormat df = new DecimalFormat("#.00");
		// 四舍五入
		df.setRoundingMode(RoundingMode.HALF_UP);
		avg = sum / count;
		avg = Double.parseDouble(df.format(avg));
		return avg;
	}
}
