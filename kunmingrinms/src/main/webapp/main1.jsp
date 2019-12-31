<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>昆明铁路局通信安全生产调度指挥系统</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/layout-min.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/main.css" rel="stylesheet" />

<style type="text/css">
.firstFuncButton {
	background-color:transparent;
	display:inline-block;
	cursor:pointer;
	color:#424141;
	font-size:14px;
	font-weight:bold;
	padding:5.5px 5px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.firstFuncButton:hover {
 	background-color:#f6f6f6;
 	color:#00ADEE;
	text-decoration:none;
}




/*reset*/
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td { margin: 0; padding: 0; font-family:"微软雅黑"}
table { border-collapse: collapse; border-spacing: 0; }
fieldset, img { border: 0; }
address, caption, cite, code, dfn, em, strong, th, var { font-style: normal; font-weight: normal; }
ol, ul { list-style: none; }
caption, th { text-align: left; }
h1, h2, h3, h4, h5, h6 { font-size: 100%; font-weight: normal; }
q:before, q:after { content: ''; }
abbr, acronym { border: 0; font-variant: normal; }
sup { vertical-align: text-top; }
sub { vertical-align: text-bottom; }
input:focus, textarea:focus, select:focus { outline: none; }
select, input { vertical-align: middle; }
legend { color: #000; }
.clean:before, .clean:after, .clearfix:before, .clearfix:after { content: ""; display: table; }
.clean:after, .clearfix:after { clear: both; }
.clean, .clearfix { zoom: 1; }
.clear { clear: both; }
.fl { float: left; }
.fr { float: right; }
.break { word-wrap: break-word; width: inherit; }
.linkhidden { text-indent: -9999em; overflow: hidden; }
.hidden { display: none; }
a{ text-decoration:none;}
/*reset*/

/*主要样式*/
.subNavBox{width:200px;border:solid 1px #e5e3da;margin:100px auto;}
.subNav{border-bottom:solid 1px #e5e3da;cursor:pointer;font-weight:bold;font-size:14px;color:#424141;line-height:28px;padding-left:10px;background:url(<%=contextPath%>/resource/img/jiantou1.jpg) no-repeat;background-position:95% 50%}
.subNav:hover{color:#00ADEE;}
.currentDd{color:#00ADEE}
.currentDt{background-image:url(<%=contextPath%>/resource/img/jiantou2.jpg);}
.navContent{display: none;border-bottom:solid 1px #e5e3da;}
.navContent li a{display:block;width:200px;height:28px;text-align:center;font-size:14px;line-height:28px;color:#333}
.navContent li a:hover{color:#fff;background-color:#00ADEE}
</style>

</head>
<body>
	<div id="mainContent"> 
		<div id="top">
			<div id="topLeft" style="background: url(<%=contextPath%>/resource/img/top.jpg) no-repeat;">
				<div id="oneFunction"></div>
			</div>
			<div id="topRight" style="background: url(<%=contextPath%>/resource/img/top2.png) repeat-x;">
				<div class="user_msg_info">
					您好，<span id="loginName">${user.name}</span>&nbsp;&nbsp;欢迎回来！ 
					<a class="faction" href="javascript:void(0)" id = "updatePass">密码修改</a> |
<%-- 					<a class="faction" href="<%=contextPath%>/login/out.cn">退出</a>&nbsp;&nbsp; --%>
					<a class="faction" href="#" id="outSystem">退出</a>&nbsp;&nbsp;
				</div>
			</div>
		</div>
		
		<div id="content">
			<div id="leftNavigator"></div>
			<div id="mainContainer"></div>
			<div id="fullScreenDiv">
					<a href="javascript:void(0)" onclick="fullscreenTab()">
						<img id="fullscreenImg" src="<%=contextPath%>/resource/img/black_fullscreen.png" width="18" height="18" />查看全屏
					</a>
					<a href="javascript:void(0)" onclick="fullscreenExitTab()" style="display: none;">
						<img id="fullscreenExitImg" src="<%=contextPath%>/resource/img/black_fullscreen_exit.png" width="18" height="18" />退出全屏
					</a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery.messager.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript">
		var contextPath = '<%=contextPath%>' + '/';
		var loginUserId = '${user.id}';
		var loginUserName = '${user.name}';
		
		// 退出系统
		$('#outSystem').click(function(){
			$.post(contextPath + "login/outSystem.cn",function(data){
				window.location.href = contextPath + 'index.jsp';
			});
		});

	</script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/message/message.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/main.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/main2.js"></script>
</body>
</html>