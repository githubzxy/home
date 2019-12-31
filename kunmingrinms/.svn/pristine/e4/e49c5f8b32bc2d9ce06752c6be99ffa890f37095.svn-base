<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>竣工资料</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/common/uploader/uploader.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<style type="text/css">
	.mask-z-index {/*遮罩层*/
		z-index: 1080;
	}
	.bui-message {/*将线别名称验证弹出框提到遮罩层外  */ 
		z-index: 1100;
	}
	.bui-stdmod-body {
		overflow-x : hidden;/* 产生垂直滚动条 */
		overflow-y : auto
	}
	#railLineAdd .bui-suggest {
		border: 0px;
	} 
	#railLineUpdate .bui-suggest{
		border: 0px;
	} 
	/* 设置线别名称下拉列表的滚动条 */
	.bui-select-list {
		overflow: auto;
    	overflow-x: hidden; /* 隐藏超出部分 */
    	max-height: 118px;
    	_height : 118px;  /*什么意思？？？  */
	}
</style>
</head>
<body>
<form action="<%=contextPath%>/completionAction/expCompletion.cn" id="exportForm" method="post">
	<input type="hidden" id="exportXlsJson" name="exportXlsJson">
</form>
<!-- 存放从后台set的用于查询的权限的id -->
<input type="hidden" id = "permissionId" name="perId" value="${requestScope.perId}">
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>'+'/';
	var perId = '<%=perId%>';
	if(perId=='null'){
		perId = $("#permissionId").val();
	}
	seajs.config({
		paths:{
			views : contextPath + 'views',
			common : contextPath + 'common',
			bui : contextPath + 'bui'
		}
	});
	seajs.use("views/technical/CompletionData",function(CompletionData){
		var completionData = new CompletionData({
			contextPath : contextPath,
			perId : perId
		});
		completionData.render();
	})
</script>
</body>
</html>