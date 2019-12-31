<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
	contextPath = contextPath.substring(0,contextPath.indexOf("kunmingrinms") - 1)+"/kunmingrinms";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>错误页面</title>


</head>
<body>
	
	<div style="margin-top:220px;width:60%;height:200px;text-align: left;float:right">
	
	<div style="font-family:'微软雅黑';height:50px;font-size: 30px;font-weight:bold;color:#0066cc ">很抱歉!</div>
	<div style="font-family:'微软雅黑';height:70px;font-size: 15px;">您所访问的页面出错了，请联系管理员。</div>
	<span style="font-family:'微软雅黑'" id="show"></span>&nbsp;&nbsp;<a style="font-family:'微软雅黑'" href = "javascript:;" onclick = "top.location.href='<%=contextPath%>/main.jsp'">返回首页>></a>
	</div>
	<script> 
	var t=5;//设定跳转的时间 
	setInterval("refer()",1000); //启动1秒定时 
	function refer(){ 
		if(t==0){ 
			top.location.href="<%=contextPath%>/main.jsp"; //#设定跳转的链接地址 
		} 
		document.getElementById('show').innerHTML="本页<span style='color:red;'>"+t+"</span>秒后自动跳转到首页"; // 显示倒计时 
		t--; // 计数器递减 
	} 
</script> 
</body>
</html>