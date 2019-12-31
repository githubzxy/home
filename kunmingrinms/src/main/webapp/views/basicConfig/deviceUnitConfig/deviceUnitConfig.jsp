<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String contextPath=request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>设备单位配置</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
</head>
<body style="overflow:hidden;">
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/unit.js"></script>
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
seajs.use("views/basicConfig/deviceUnitConfig/DeviceUnitConfig",function(DeviceUnitConfig){
	var deviceUnitConfig = new DeviceUnitConfig({
		contextPath : contextPath,
		perId : perId
		});
	deviceUnitConfig.render();
});
</script>
</body>
</html>