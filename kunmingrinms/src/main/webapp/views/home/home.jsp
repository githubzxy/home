<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%             
	String contextPath = request.getContextPath(); 
    String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页展示</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/bui/css/layout.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/common/uploader/uploader.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet">
<style type="text/css">
  .x-layout-item-flow{
    float: left;
/*     overflow: hidden; */
    padding: 0px;
    margin-top : 5px;
  }
  .ext-border-layout{
  	width:1210px;
  	height:575px;
	padding: 0px;
	background-color: #3892d3;
  }
  .bui-stdmod-body{
		overflow-x : hidden;/* 产生垂直滚动条 */
		overflow-y : auto
	}
  .bui-grid-body{
  	height:450px;
  }
  .bui-grid-row-checked{
    color: #1E90FF;
  }
  .bui-grid-row-nosituation{
    color: #FF0000;
  }
 .bui-simple-list ul li{
  
    margin:10px;
    padding:0px;
     
     
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
	<script >
	var contextPath = '<%=contextPath%>' + '/';
	var perId = '<%=perId%>';
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
	seajs.use("views/home/Home",function(Home){
		var home = new Home({
			contextPath : contextPath,
			perId : perId,
			userId : userId,
			tomcatSeverTime : tomcatSeverTime
			});
		home.render();
	});
	</script>	
</body>
</html>