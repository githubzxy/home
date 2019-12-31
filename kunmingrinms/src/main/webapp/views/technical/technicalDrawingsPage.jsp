<%@page pageEncoding="UTF-8"  language="java" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" >
<title>技术图纸</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/uploader/uploader.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<style type="text/css">
.bui-stdmod-body{
		overflow-x : hidden;/* 产生垂直滚动条 */
		overflow-y : auto
}
</style>
</head>
<body>
<form action="<%=contextPath%>/technical/expTechnical.cn" id="exportForm" method="post">
	<input type="hidden" id="exportXlsJson" name="exportXlsJson"/>
</form>
<!-- 存放从后台set的用于查询的权限的id -->
<input type="hidden" id = "permissionId" name="perId" value="${requestScope.perId}">
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var perId = '<%=perId%>';
if(perId=='null'){
	perId = $("#permissionId").val();
}
	seajs.config({
		paths:{
			views : contextPath + 'views',
			common : contextPath + 'common',
			bui : contextPath + 'bui'
		}
	});	
	seajs.use("views/technical/TechnicalDrawings",function(TechnicalDrawings){
		var technicalDrawings=new TechnicalDrawings({
			contextPath:contextPath,
			perId:perId,
		});
		technicalDrawings.render(); 
	});
</script>
</body>
</html>