<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>信息发布-首页</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<link href="<%=contextPath%>/common/uploader/uploader.css" rel="stylesheet">
<style type="text/css">
 	#messageDialogId .bui-stdmod-body{
 		overflow-x : hidden;
 		overflow-y : auto
 	}
	#messageListId ul li{
 		padding:10px;
	}
	li:hover{
	    COLOR: red;
	    cursor:pointer;
	}
	a:hover{
	    cursor:pointer;
	}
</style>
</head>
<body>
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script>
	var contextPath = '<%=contextPath%>' + '/';
	var userId = '${sessionScope.user.id}';
	seajs.config({
		paths:{
			views: contextPath + 'views',
			common: contextPath + 'common',
			bui: contextPath + 'bui'
		}
	});
	seajs.use("views/hhkj/home/MessagePage",function(MessagePage){
		var message = new MessagePage({
			contextPath : contextPath,
			userId : userId
		});
		message.render();
	});
</script>
</body>
</html>