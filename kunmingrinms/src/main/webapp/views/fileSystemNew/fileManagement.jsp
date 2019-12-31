<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String contextPath=request.getContextPath();
	String userId=request.getSession().getAttribute("userId").toString();
	String perId = request.getParameter("threePerId");
	String orgId = request.getParameter("orgId");
	String orgName = request.getParameter("orgName");
	String parentId = request.getParameter("parentId");
// 	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String orgType = request.getParameter("orgType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>技术规章管理</title>
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
	<form action="<%=contextPath%>/fileSystemNewAction/exportXls.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script>
var contextPath = '<%=contextPath%>' + '/';
var perId = '<%=perId%>';
var orgId = '<%=orgId%>';
var orgName = '<%=orgName%>';
var parentId = '<%=parentId%>';
var userId = '<%=userId%>';
var userName = '<%=userName%>';
var orgType = '<%=orgType%>';
console.log(perId);
console.log(contextPath);
console.log(userId);
seajs.config({
	paths:{
		views: contextPath + 'views',
		common: contextPath + 'common',
		bui: contextPath + 'bui'
	}
});
seajs.use('views/fileSystemNew/FileManagement',function(FileManagement){
	var fileManagement = new FileManagement({
		contextPath : contextPath,
		perId : perId,
		orgId : orgId,//登陆用户组织机构ID
    	orgName : orgName,//登陆用户组织机构名称
    	parentId : parentId,//登陆用户的上级机构ID
    	userId : userId,//登陆用户ID
    	userName : userName,//登陆用户名称
    	orgType : orgType,//登陆用户组织机构类别（1503：工区，1502：车间，1501：科室，1500：昆明铁路局）
	});
	fileManagement.render();
});
</script>
</body>
</html>