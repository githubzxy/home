<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<head>
<meta charset=UTF-8>
<title>机构管理</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
</head>
<body style="overflow:hidden;">
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script>
var contextPath = '<%=contextPath%>' + '/';
var perId = '<%=perId%>';
var orgType = '${sessionScope.user.organization.type}';
seajs.config({
	paths:{
		views: contextPath + 'views',
		common: contextPath + 'common',
		bui: contextPath + 'bui'
	}
});
seajs.use("views/emergencyOrg/EmergencyOrgPage",function(EmergencyOrgPage){
	var emergencyOrgPage = new EmergencyOrgPage({
		contextPath : contextPath,
		perId : perId,
		orgType: orgType
		});
	emergencyOrgPage.render();
});
</script>
</body>

