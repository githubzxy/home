package com.enovell.yunwei.util.jsonInterface;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：MixInUser   
 * 类描述:  
 * 
 * @JsonIgnoreProperties
 *  java转换为json时需要忽略属性
 *  User忽略organization,position,roles
 *  
 * 创建人：张思红 
 * 创建时间：2014-9-25 下午4:46:07
 * 修改人：张思红 
 * 修改时间：2014-9-25 下午4:46:07
 */
@JsonIgnoreProperties({"position", "roles"})
public interface MixInUser {

}
