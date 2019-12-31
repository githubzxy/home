<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
	String perId = request.getParameter("threePerId");
%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>部门值班管理</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet" />
<style type="text/css">
	.mask {
		z-index: 1100 !important;
	}
</style>
</head>
<body style="overflow: hidden;">
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/onduty/ondutyCommon.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script>
var contextPath = '<%=contextPath%>' + '/';
var perId = '<%=perId%>';
console.log(perId);
var orgId = '${user.organization.id}';
var curUserId = '${sessionScope.user.id}';//汇报时使用
var curOrgName = '${sessionScope.user.organization.name}';//汇报时使用
var curHour= '${pageScope.now.hours}';
var curUser='${sessionScope.user}';
var curDate= '${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}'; 
seajs.config({
	paths:{
		views: contextPath + 'views',
		common: contextPath + 'common',
		bui: contextPath + 'bui'
	}
});
seajs.use("views/onduty/OnDutyPage",function(OnDutyPage){
	var ondutyPage = new OnDutyPage({
		contextPath : contextPath,
		//perId : perId,
		perId:'4028811c41a001630141a137ee25022d',
		orgId:orgId,
		userId:curUserId,
		curOrgName:curOrgName,
		curHour:curHour,
		curUser:curUser,
		curDate:curDate,
		});
	ondutyPage.render();
});
</script>	
</body>
</html>