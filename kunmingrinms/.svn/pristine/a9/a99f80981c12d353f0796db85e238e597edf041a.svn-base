package com.enovell.yunwei.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * 项目名称：kunmingrinms 
 * 类名称：StringDateToDateUtil 
 * 类描述: 时间字符串转时间工具类 
 * 创建人：lidt
 * 创建时间：2016-11-16 下午2:06:47 
 * 修改人：lidt 
 * 修改时间：2016-11-16 下午2:06:47
 * 
 */
public class StringDateToDateUtil {

	/**
	 * 
	 * getDate 字符串转日期时间
	 * 
	 * @param strDate
	 *            字符串 (yyyy-MM-dd HH:mm:ss)
	 * @return 日期时间格式
	 */
	public static Date getDate(String strDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = df.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 
	 * getDateString 日期转字符串
	 * 
	 * @param date
	 *            日期
	 * @return
	 */
	public static String getDateString(Date date) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = df.format(date);
		return dateString;
	}
	
	public static String getYHDDateString(Date date){
		DateFormat df = new SimpleDateFormat("yyyy年MM月dd日");
		String dateString = df.format(date);
		return dateString;
	}

	/**
	 * 
	 * getTimeString 时间转字符串
	 * 
	 * @param date
	 *            时间
	 * @return
	 */
	public static String getTimeString(Date date) {
		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		String dateString = df.format(date);
		return dateString;
	}

	/**
	 * 
	 * getDateAndTime 字符串日期转日期格式
	 * 
	 * @param sendDate
	 *            发令时间(字符串格式)
	 *            1.sendDate(yyyy-MM-dd),系统自动生成当前时间进行拼接,再转日期时间格式
	 *            2.sendDate(yyyy-MM-dd HH:mm:ss),直接转日期时间格式
	 * @return 发令时间(日期时间格式)
	 */
	public static Date getDateAndTime(String sendDate) {
		if (sendDate.length() < 11) {
			Date date = new Date();
			String tempTime = getTimeString(date);
			return getDate(sendDate + " " + tempTime);
		} else {
			return getDate(sendDate);
		}
	}
	
	/**
	 * 
	 * formatDate 字符串转日期
	 * @param strDate 字符串(yyyy-MM-dd)
	 * @return
	 */
	public static Date formatDate(String strDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = df.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * 
	 * getDateStringNotTime 日期转字符串（没有时分秒）
	 * 
	 * @param date
	 *            日期
	 * @return
	 */
	public static String getDateStringNotTime(Date date) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = df.format(date);
		return dateString;
	}
	
	/**
	 * 格式化查询日期，如果是开始日期的话就将日期格式为当天0点，如果是结束日期的话就将日期格式为当天23.59分
	 * 
	 * @param sourceDate
	 * @param mark
	 *            日期标识，开始日期：start,结束日期:end
	 * @return
	 */
	public static Date formatDate(Date sourceDate, String mark) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date tempDate = null;
		if (mark.equals("start")) {
			try {
				tempDate = sdf.parse(sdf.format(sourceDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else if (mark.equals("end")) {
			try {
				tempDate = sdf.parse(sdf.format(sourceDate));
				Calendar cal = Calendar.getInstance();
				cal.setTime(tempDate);
				cal.add(Calendar.SECOND, 60 * 60 * 24 - 1);
				tempDate = cal.getTime();
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return tempDate;
	}

}
