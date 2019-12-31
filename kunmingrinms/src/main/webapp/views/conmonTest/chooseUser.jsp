<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<title>人员选择测试</title>
<head>
<link rel="stylesheet" type="text/css" href="../../resource/css_framework/css_bui/bui.css"/>
<link rel="stylesheet" type="text/css" href="../../resource/css_framework/css_bui/dpl.css"/>
</head>
<style>
	.btnDiv{
		margin:12px;
	} 
</style>
<body>
<script type="text/javascript" src="../../resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var userId = '${user.id}';

BUI.use(['common/chooseUser/ChooseUser'],function(CU){
	var cu = new CU({
		contextPath : contextPath,
	});
	cu.render();
});
</script>
</body>
</html>