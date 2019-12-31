package com.enovell.yunwei.common;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * 数组排序
 * @author huanquan
 *
 */
@SuppressWarnings({"rawtypes",  "unchecked"})
public class ArraySort {

	
	/**
	 * 字符串 中文首字母排序
	 * @param datas
	 * @return
	 */
	public static String[] sortArrayByChina(String[] datas){
		Comparator cmp = Collator.getInstance(java.util.Locale.CHINA);
		Arrays.sort(datas, cmp);
		return datas;
	}
	
	/**
	 * 集合 中文首字母排序</BR>
	 * 使用方法：List userNames = ArraySort.sortArrayByChina(userNames,"getName");
	 * @param datas 数据集合
	 * @param methodName 方法名称
	 * @return
	 */
	public static <E>List<E> sortListByChina(List<E> datas,String methodName){
		List<E> newDatas = new ArrayList<E>();
		String[] nameArr = new String[datas.size()];
		Class cls = null;
		Method method = null;
		for(int i = 0; i < datas.size(); i++){
			if(cls == null || method == null){
				cls = datas.get(i).getClass();
				try {
					method = cls.getMethod(methodName);
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
				}
			}
			try {
				nameArr[i] = (String) method.invoke(datas.get(i));
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		nameArr = sortArrayByChina(nameArr);
		for(String s : nameArr){
			for(E data : datas){
				String name;
				try {
					name = (String) method.invoke(data);
					if(s == name){
						newDatas.add(data);
					}
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
			}
		}
		
		return newDatas;
	}
	
//	public static void main(String[] args) {
//		List<User> datas = new ArrayList();
//		User user2 = new User();
//		user2.setName("测试");
//		datas.add(user2);
//		User user3 = new User();
//		user3.setName("动漫社");
//		datas.add(user3);
//		User user = new User();
//		user.setName("A");
//		datas.add(user);
//		User user1 = new User();
//		user1.setName("B");
//		datas.add(user1);
//		for(User o : sortListByChina(datas, "getName")){
//			System.out.println(o.getName());
//		}
//	}
}
