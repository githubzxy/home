package com.enovell.yunwei.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * 数字工具类
 * 
 * @author roy 2014年8月12日-下午2:41:50
 */
public class NumberUtil {

	/**
	 * 判断一个字符串是否是浮点数
	 * @param str
	 * @return
	 */
	public static boolean isFloat(String str) {
		try {
			Double.parseDouble(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
	
	/**判断是否小数点后保留3位
	 * @param num
	 * @return
	 */
	public static boolean is3Float(String num){
		if(!isFloat(num)){
			return false;
		}
		BigDecimal n = new BigDecimal(num);
		DecimalFormat df = new DecimalFormat("#.###"); 
		String result = df.format(n.doubleValue());
		if((new BigDecimal(result)).doubleValue() == n.doubleValue()){
			return true;
		}
		return false;
	}
	
	/**将数字转换成小数点后保留3位，注意，必须要进行数字格式验证后的数字才能调用此方法
	 * @param num
	 * @return
	 */
	public static String to3Float(String num){
		BigDecimal n = new BigDecimal(num);
		DecimalFormat df = new DecimalFormat("#.###"); 
		String result = df.format(n.doubleValue());
		return result;
	}

	/**
	 * 判断字符串是否是数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str) {
		for (int i = str.length(); --i >= 0;) {
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 将列的数字转换成ABCD...字符串
	 * 
	 * @param i
	 * @return
	 */
	public static String columnNum2String(int i) {
		char begin = 'A';
		int result = begin + i - 1;
		return String.valueOf((char) result);
	}

	/**
	 * 转换百分比数字工具方法
	 * 
	 * @param numerator
	 *            分子
	 * @param denominator
	 *            分母
	 * @return
	 */
	public static Double change2BitPercent(double numerator, double denominator) {
		BigDecimal n = new BigDecimal(numerator);
		BigDecimal d = new BigDecimal(denominator);
		if(denominator == 0){
			return 0.00;
		}else{
			double result = n.divide(d,4,BigDecimal.ROUND_HALF_EVEN).multiply(new BigDecimal(100)).doubleValue();
			return result;
		}
	}
	
	/**
	 * 判断传入字符串是否为空字符串，是则返回字符串0的，否则返回原字符串，用于单元格为空则视为数值0处理
	 * @param str
	 * @return
	 */
	public static String nullString2Zero(String str){
		if(str != null && str.trim().length() == 0){
			str = "0" ;
		}
		return str;
	}
	
}
