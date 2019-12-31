<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String contextPath=request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>技术台账</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/uploader/uploader.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<style>
	.bui-message .bui-ext-close{
		display:none !important;
	}
	.bui-message{
		z-index:1080;
	}
	.bui-stdmod-body{
		overflow-x : hidden;/* 产生垂直滚动条 */
		overflow-y : auto
	}
	/* .defaultTheme .bui-uploader-button-wrap:link, .defaultTheme .bui-uploader-button-wrap:visited {
	color: #404040;
	}
	.defaultTheme .bui-uploader-button-wrap {
	display: inline-block;
	padding: 0 5px;
	height: 24px;
	overflow: hidden;
	line-height: 24px;
	position: relative;
	z-index: 500;
	margin-right: 10px;
	text-decoration: none;
	font-size: 12px;
	text-align: center;
	border: 1px solid #000000;
	background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#FFFFFF));
	} */
</style>
</head>
<body style="overflow:hidden;">
	<form action="<%=contextPath%>/technicalAccountAction/exportXls.cn" id="exportForm" method="post">
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
		views: contextPath + 'views',
		common: contextPath + 'common',
		bui: contextPath + 'bui'
	}
});
seajs.use('views/technical/TechnicalAccountPageNew',function(TechnicalAccountPageNew){
	var TechnicalAccountPageNew = new TechnicalAccountPageNew({
		contextPath : contextPath,
		perId : perId
	});
	TechnicalAccountPageNew.render();
});
</script>
</body>
</html>