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
<title>停机审核</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/tableLayout.css" rel="stylesheet" />
<style type="text/css">
	.fileMask {
		z-index: 1100 !important;
	}
	.bui-message .bui-ext-close{
		display:none;
	} 
	.bui-stdmod-body{
		overflow-x : hidden;
		overflow-y : auto
	}
	.bui-grid-row-daiShenHe{
	    color: #458B74;
	}
	.bui-grid-row-daiHuiFu{
 	    color:#00C5CD;
	}
	.bui-grid-row-wanCheng{
	    color: #1E90FF;
	}
	.bui-grid-row-weiWanCheng{
	    color:#5CACEE;
	}
	.bui-grid-row-yiQuXiao{
		color:#828282;
	}
	.x-grid-rownumber{
		color:black;/* 序号，全为黑色 */
	}
</style>
</head>
<body style="overflow: hidden;">
	<form action="<%=contextPath%>/commNetStopAction/expCommNetStop.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
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
seajs.use("views/commNetStop/stopExamine/StopExaminePage",function(StopExamine){
	var StopExamine = new StopExamine({
		contextPath : contextPath,
		perId : '4028811c41fd03940141fd2cc06500f1'
			     
	})
	StopExamine.render();
});
</script>
</body>
</html>