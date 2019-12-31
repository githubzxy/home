<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>备品审核</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
.bui-dialog .bui-stdmod-body {
    padding: 10px 0;
}
.bui-calendar-panel td a{
	padding:0px;
}
</style>
</head>
<body style="overflow: hidden;">
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/unit.js"></script>
<script>
var contextPath = '<%=contextPath%>' + '/';
var perId = '<%=perId%>';
seajs.config({
	paths:{
		views : contextPath + 'views',
		common : contextPath + 'common',
		bui : contextPath + 'bui'
	}
});
seajs.use("views/dailySpare/SpareAuditPage",function(SpareAuditPage){
	var spareAuditPage = new SpareAuditPage({
		contextPath : contextPath,
		perId : perId
	})
	spareAuditPage.render();
});
</script>
</body>
</html>