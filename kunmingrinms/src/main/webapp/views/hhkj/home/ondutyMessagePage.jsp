<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>值班信息-首页</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/layout.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<style type="text/css">
  .bui-grid-body{
   	height:800px;
  }
  .bui-grid-row-checked{
    color: #1E90FF;
  }
  .bui-grid-row-nosituation{
    color: #FF0000;
  }
</style>
</head>
<body>
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script>
	var contextPath = '<%=contextPath%>' + '/';
	var userId = "${sessionScope.user.id}";
	var tomcatSeverTime = new Date();
	tomcatSeverTime.setTime("${pageScope.now.time}");
	seajs.config({
		paths:{
			views: contextPath + 'views',
			common: contextPath + 'common',
			bui: contextPath + 'bui'
		}
	});
	seajs.use("views/hhkj/home/OndutyMessagePage",function(OndutyMessagePage){
		var ondutyMessage = new OndutyMessagePage({
			contextPath : contextPath,
			userId : userId,
			tomcatSeverTime : tomcatSeverTime
		});
		ondutyMessage.render();
	});
</script>	
</body>
</html>