package com.enovell.yunwei.util;

import com.enovell.system.common.domain.Permission;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.jsonInterface.MixInPermission;
import com.enovell.yunwei.util.jsonInterface.MixInUser;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate4.Hibernate4Module;
import com.fasterxml.jackson.datatype.hibernate4.Hibernate4Module.Feature;

import java.io.IOException;
import java.text.SimpleDateFormat;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：JsonUtil   
 * 类描述 : Json工具类 
 * 创建人：张思红 
 * 创建时间：2014-9-25 下午4:27:33
 * 修改人：张思红 
 * 修改时间：2014-9-25 下午4:27:33   
 *
 */
public class JsonUtil {

	/**
	 * yyyy-MM-dd HH:mm:ss  日期和时间
	 */
	public static final String DATE_AND_TIME = "yyyy-MM-dd HH:mm:ss";
	/**
	 * yyyy-MM-dd 日期
	 */
	public static final String DATE = "yyyy-MM-dd";
	
	public static String javaToJsonAsString(Object obj) {
		return javaToJsonAsString(obj, DATE_AND_TIME);
	}
	
	/**
	 * 
	 * javaToJsonAsString java对象转json对象（java数组、集合转json数组）
	 * @param obj 待转换java对象（待转换java数组、集合）
	 * @param DateFormate 日期格式
	 * @return json对象的字符串（json数组的字符串）
	 */
	public static String javaToJsonAsString(Object obj, String DateFormate) {
		
		String jsonAsString = "";
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			// 指定Organization对象通过MixInOrganization中的@JsonIgnoreProperties属性值进行过滤
			//objectMapper.addMixInAnnotations(Organization.class, MixInOrganization.class);
			// 指定User对象通过MixInUser中的@JsonIgnoreProperties属性值进行过滤
			objectMapper.addMixInAnnotations(User.class, MixInUser.class);
			// 指定Permission对象通过MixInPermission中的@JsonIgnoreProperties属性值进行过滤
			objectMapper.addMixInAnnotations(Permission.class, MixInPermission.class);
			// 格式化日期
			objectMapper.setDateFormat(new SimpleDateFormat(DateFormate));
			
			// 屏蔽hibernate懒加载对象，防止报异常JsonMappingException: could not initialize proxy - no Session
			Hibernate4Module hibernate4Module = new Hibernate4Module();
			hibernate4Module.disable(Feature.USE_TRANSIENT_ANNOTATION);// 防止@Transient被屏蔽
			objectMapper.registerModule(hibernate4Module);
			
			// 将java转换为json对象的字符串
			jsonAsString = objectMapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return jsonAsString;
	}
	
	
	public static <T>T jsonToJavaObj(String jsonStr, Class<T> classType) {
		
		return jsonToJavaObj(jsonStr, classType, DATE_AND_TIME);
	}
	/**
	 * 
	 * jsonToJavaObj json转java对象（json数组转java数组、集合）
	 * @param jsonStr json对象字符串（json数组字符串）
	 * @param classType 类的类型（需要转换的类）
	 * 	@param DateFormate 日期格式
	 * @return java对象（java数组、集合）<br />
	 * 	@see 例子：<br/>
	 * json对象转java对象<br/>
	 * 	String str = "{\"id\":\"1\",\"status\":41}";<br/>
	 * InnerRequestBase base = jsonToJavaObj(str, InnerRequestBase.class);<br/><br/>
	 * 
	 * json数组转java数组、集合<br/>
	 * String str = "[{\"id\":\"1\",\"status\":41},{\"id\":\"2\",\"status\":42}]";<br/>
	 * InnerRequestBase[] base = jsonToJavaObj(str, InnerRequestBase[].class);<br/>
	 */
	public static <T>T jsonToJavaObj(String jsonStr, Class<T> classType, String DateFormate) {
		
		ObjectMapper objectMapper = null;
		T obj = null;
		try {
			objectMapper = new ObjectMapper();
			// 允许特殊字符：如制表符，反斜杠等等
			objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
			objectMapper.setDateFormat(new SimpleDateFormat(DateFormate));
			obj = objectMapper.readValue(jsonStr, classType);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	public static void main(String[] args) {
		
//		String str = "{\"id\":\"1\",\"status\":41}";
//		InnerRequestBase base = jsonToJavaObj(str, InnerRequestBase.class);
//		System.out.println(base);
		
//		String str = "[{\"id\":\"1\",\"status\":41},{\"id\":\"2\",\"status\":42}]";
//		InnerRequestBase[] base = jsonToJavaObj(str, InnerRequestBase[].class);
//		System.out.println(base[0]);
//		System.out.println(base[1]);
	}
}
