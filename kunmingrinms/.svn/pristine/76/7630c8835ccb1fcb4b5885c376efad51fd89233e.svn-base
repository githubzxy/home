<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enovell.system.common.domain.User,org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="com.zhuozhengsoft.pageoffice.*" %>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po" %>
<% 
	User user = (User)request.getSession().getAttribute("user");
	String userName = user.getName();//获取用户名
	String path = request.getParameter("filePath").replaceAll("/", "\\\\");//文件路径
	if(path==null || path.trim().isEmpty()){
		return;
	}
	String contextPath = request.getContextPath();//业务路径
	PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
	poCtrl.setServerPage(contextPath+"/poserver.zz");
	poCtrl.setCustomToolbar(false);
	poCtrl.setOfficeToolbars(false);
	poCtrl.setMenubar(false);
	poCtrl.setTitlebar(false);//控件标题栏不可见
	OpenModeType openMode=null;
	String path1 =path.toLowerCase();
	if(path1.endsWith(".xlsx")||path1.endsWith(".xls")){
		openMode = OpenModeType.xlsReadOnly;
	}else if(path1.endsWith(".doc")||path1.endsWith(".docx")){
		openMode = OpenModeType.docReadOnly;
	}else if(path1.endsWith(".vsd")){
		openMode = OpenModeType.vsdNormalEdit;
	}else{
		return;
	}
	poCtrl.webOpen(path, openMode, userName);//打开文件
	poCtrl.setTagId("PageOfficeCtrl");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="PageOffice" style="text-align:center;height:100%;width:100%;">
		<%=poCtrl.getHtmlCode("PageOfficeCtrl")%>
	</div>
</body>