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
<title>全部值班管理</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<style type="text/css">
	.mask {
		z-index: 1100 !important;
	}
	 .bui-stdmod-body{
		overflow-x : hidden;/* 产生垂直滚动条 */
		overflow-y : auto
	}
	.bui-select-list{
	   height : 210px;
	   overflow-y: auto;
  }
</style>
</head>
<body style="overflow: hidden;">	
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/onduty/ondutyCommon.js"></script>
<script>
var contextPath = '<%=contextPath%>' + '/';
var perId = '<%=perId%>';
var orgId = '${user.organization.id}';
seajs.config({
	paths:{
		views: contextPath + 'views',
		common: contextPath + 'common',
		bui: contextPath + 'bui'
	}
});
seajs.use("views/onduty/OnDutyAllPage",function(OnDutyAllPage){
	var ondutyAllPage = new OnDutyAllPage({
		contextPath : contextPath,
		perId : perId,
		orgId:orgId
		});
	ondutyAllPage.render();
});
</script>	
</body>
</html>