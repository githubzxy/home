<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String contextPath=request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>技术资料</title>
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
	.defaultTheme .bui-uploader-button-wrap:link, .defaultTheme .bui-uploader-button-wrap:visited {
	color: #404040;
	}
	
</style>
</head>
<body style="overflow:hidden;">
	<form action="<%=contextPath%>/technicalDocument/exportXls.cn" id="exportForm" method="post">
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
seajs.use('views/technical/TechnicalDocumentPageNew',function(TechnicalDocumentPageNew){
	var TechnicalDocumentPageNew = new TechnicalDocumentPageNew({
		contextPath : contextPath,
		perId : perId
	});
	TechnicalDocumentPageNew.render();
});
</script>
</body>
</html>