<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.enovell.system.common.domain.User"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
	User user = (User)request.getSession().getAttribute("user");
	String orgName = user.getOrganization().getName();
	String orgId = user.getOrganization().getId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>回复告警通知单</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/uploader/uploader.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<style type="text/css">
</style>
</head>
<body>
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>'+'/';
	var perId = '<%=perId%>';
	var orgName = '<%=orgName%>';
	var orgId = '<%=orgId%>';
	
	seajs.config({
		paths:{
			views : contextPath + 'views',
			common : contextPath + 'common',
			bui : contextPath + 'bui'
		}
	});
	seajs.use("views/warnNotice/reply/WarnNoticePage",function(WarnNoticePage){
		var warnNoticePage = new WarnNoticePage({
			contextPath : contextPath,
			perId : perId,
			orgName : orgName,
			orgId : orgId
		});
		warnNoticePage.render();
	})
</script>
</body>
</html>