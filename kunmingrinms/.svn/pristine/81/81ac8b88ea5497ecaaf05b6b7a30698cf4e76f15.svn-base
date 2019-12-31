<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enovell.system.common.domain.User,org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="com.zhuozhengsoft.pageoffice.*" %>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po" %>
<% 
	User user = (User)request.getSession().getAttribute("user");
	String userName = user.getName();//获取用户名
	String path = request.getParameter("filePath").replaceAll("/", "\\\\");//文件路径
	System.out.printf(path);
	if(path==null || path.trim().isEmpty()){
		return;
	}
	String str="";
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
	}else if(path1.endsWith(".vsd")||path1.endsWith(".vsdx")){
		openMode = OpenModeType.vsdNormalEdit;
	}else if(path1.endsWith(".ppt")||path1.endsWith(".pptx")){
		openMode = OpenModeType.pptReadOnly;
	}else if(path1.endsWith(".jpg")||path1.endsWith(".png")||path1.endsWith(".tif")){
		str="pic";
	    poCtrl.setVisible(false);//控件不可见	
	}else{
		return;
	}
	if(openMode!=null){
		str="mis";
		poCtrl.webOpen(path, openMode, userName);//打开文件
		
	}else{
		response.sendRedirect(path);
	}
	poCtrl.setTagId("PageOfficeCtrl");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
</head>
<body>
	<div id="pictur" style="text-align:center;flow-y:auto;display:none; " >
			   <img alt="图片"  src="<%=contextPath%>/PreviewServlet?filePath=<%=path%>" />
	</div>
	<div id="PageOffice" style="text-align:center;height:100%;width:100%;">
		<%=poCtrl.getHtmlCode("PageOfficeCtrl")%>
	</div>
	<script type="text/javascript">
			var str ='<%=str%>';
			if(str=='pic'){
				$('#pictur').css('display','inline-block');
				
			}
	</script>
</body>