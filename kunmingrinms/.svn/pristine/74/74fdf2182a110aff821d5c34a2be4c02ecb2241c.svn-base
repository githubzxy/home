 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.enovell.system.common.domain.*" %>
<%
	String contextPath = request.getContextPath();
    User loginUser = (User) request.getSession().getAttribute("user");
    Organization org = loginUser.getOrganization();
    String loginOrgId = org.getId();
    String loginOrgName=org.getName();
    Integer loginOrgType = org.getType();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>信息发布</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/uploader/uploader.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<style>
	.bui-stdmod-body{
		overflow-x : hidden;/* 产生垂直滚动条 */
		overflow-y : auto
	}
</style>	
</head>
<body style="overflow:hidden;">
	<form action="<%=contextPath%>/issueMessageAction/expIssueMessage.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script charset="utf-8" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script>
var contextPath = '<%=contextPath%>' + '/';
var perId = '<%=perId%>';
var loginOrgId = '<%=loginOrgId%>';
var loginOrgType = '<%=loginOrgType%>';
var loginOrgName = '<%=loginOrgName%>';
console.log("loginOrgId:"+loginOrgId);
console.log("loginOrgType:"+loginOrgType);
console.log("loginOrgName:"+loginOrgName);
seajs.config({
	paths:{
		views: contextPath + 'views',
		common: contextPath + 'common',
		bui: contextPath + 'bui'
	}
});
seajs.use("views/message/MessagePage",function(MessagePage){
	var messagePage = new MessagePage({
		contextPath : contextPath,
		perId : perId,
		orgId : loginOrgId,
		orgName : loginOrgName,
		orgType : loginOrgType,
		});
	messagePage.render();
});
</script>
</body>
</html>
