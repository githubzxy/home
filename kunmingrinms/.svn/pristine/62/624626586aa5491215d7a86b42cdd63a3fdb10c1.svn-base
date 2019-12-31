<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.enovell.yunwei.taskManage.domain.TaskRoot,com.enovell.yunwei.attach.dto.UploadFileDto,java.util.List"%>
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
<link href="<%=contextPath%>/resource/index/css/index-detail.css" rel="stylesheet" />
</head>
<body>
<!-- 本页面用于首页临时任务通知详情的展示 -->
<div class="main">
    <div class="banner">
		<div class="banner-title first">
			<span id="firstSlog">中国铁路昆明局集团有限公司</span>
		<span id="loginSpan">
			<a href="#" id="login">请登录</a>
		</span>
		<span id="userSpan">
			欢迎
			<label>${user.name}</label>
			<a href="#" id="inSystem">进入系统</a>
			<a href="#" id="outSystem">退出登录</a>
		</span>
		</div>
		<div class="banner-title second">昆明通信段 安全生产调度指挥系统</div>
		<div class="loginDiv">
			<form method="post" id="loginForm">
				<div class="userDiv">
					<span>用户名：</span><input id="userName" type="text" name="username" class="textStyle text" />
					<span id="userNameMsg" style="font-size: 12px;color:red;margin-left: 55px;display:block;"></span>
					<span id="lockMsg" style="font-size: 8px;color:red;margin-left: 10px;display:block;"></span>
				</div>
				<div class="passDiv">
					<span>密&emsp;码：</span><input id="kmPwEnovell" type="password" name="password" class="textStyle text" />
					<span id="passwordMsg" style="font-size: 12px;color:red;margin-left: 55px;display:block;"></span>
				</div>
			</form>
			<div class="loginBtnDiv" onclick="submitLogin()"  style="background-image:url('<%=contextPath%>/resource/images/custom/loginBtn.png');">
			</div>
		</div>
    </div>
    <div class="menu">
        <ul>
            <li><a class="menusys" href="<%=contextPath%>/login/toMain.cn?menuId=safeManage">安全管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="<%=contextPath%>/login/toMain.cn?menuId=produceManage">生产管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="<%=contextPath%>/login/toMain.cn?menuId=constructManage">施工维修管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="<%=contextPath%>/login/toMain.cn?menuId=technologyManage">技术管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="<%=contextPath%>/login/toMain.cn?menuId=integrateManage">综合管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="<%=contextPath%>/login/toMain.cn?menuId=machineInfoManage">机房信息管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys menuOther" href="<%=contextPath%>/login/toMain.cn?menuId=sceneManage">现场作业控制</a></li>
        </ul>
    </div>
    <div class="content" style="height:830px;width:1100px;">
        <div class="container small">
			<div class="top_info">
				<div class="module_title">
					&nbsp;置顶通知
				</div>
				<ul></ul>
			</div>
            <div class="linkmenu">
				<div class="module_title">
					&nbsp;系统链接
				</div>
                <ul>
                    <li class="linkmenuitem">
                        <a class="menusys" href="#" target="_blank"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline">&nbsp;综合网管</span></a>
                    </li>
                    <li class="linkmenuitem">
                        <a class="menusys" href="http://10.206.97.16:8090/recorder/recorder-web-1.0.0/main.html" target="_blank" ><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline">&nbsp;通信履历簿系统</span></a>
                    </li>
<!--                     <li class="linkmenuitem"> -->
<%--                         <a class="menusys" href="http://10.206.97.32/djxt/" target="_blank" ><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline">&nbsp;党建系统</span></a> --%>
<!--                     </li> -->
<!--                     <li class="linkmenuitem"> -->
<%-- 						<a class="menusys" href="http://10.206.97.29/" target="_blank"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline">&nbsp;党的群众路线教育实践活动专题网站</span></a> --%>
<!--                     </li> -->
<!--                     <li class="linkmenuitem"> -->
<%--                         <a class="menusys" href="http://10.206.97.28/" target="_blank"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline">&nbsp;昆通党建网</span></a> --%>
<!--                     </li> -->
<!--                     <li class="linkmenuitem"> -->
<%--                         <a class="menusys" href="ftp://10.206.97.33/" target="_blank"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline">&nbsp;FTP服务器</span></a> --%>
<!--                     </li> -->
                    <li class="linkmenuitem">
                        <a class="menusys" href="http://10.206.97.38/ktaj_srmis/" target="_blank"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline">&nbsp;安全风险管理信息系统</span></a>
                    </li>
                    <li class="linkmenuitem">
                        <a class="menusys" ><span class="linkmenuitemimg"></span></a>
                    </li>
                    <li class="linkmenuitem">
                        <a class="menusys" ><span class="linkmenuitemimg"></span></a>
                    </li>
                </ul>
            </div>
            <div class="safeday">
                <div class="module_title">
                    &nbsp;安全生产<label id="dayNum" style="font-size: 20px;color: red;"></label>天
				</div>
				<div id="calendar"></div>
            </div>
		</div>
        <div class="container detailDiv">
            <div class="module_title">
                <span>&nbsp;<a href="<%=contextPath%>/index.jsp">首页</a>/<a href="javascript:history.back(-1)">返回</a>/临时任务详情</span>
                <span></span>
            </div>
			<div class="detailDiv_basic_content">
				<h1>${messageData.taskName}</h1>
			</div>
			<div class="detailDiv_basic_content">
				<p class="info">
					<small>发布时间:${messageData.createDate}</small>&nbsp;&nbsp;&nbsp;&nbsp; 
					<small>发布部门:技术科</small>
				</p>
			</div>
			<div class="detailDiv_file">
			<%
				Map m = (Map)request.getAttribute("messageData");
				if(m.get("uploadFileArr") != null){
					List<Map> files = (List<Map>)m.get("uploadFileArr");
					for(Map f : files){
			%>
				<div class="file_show"><a href="<%=contextPath%>/homeAction/download.cn?path=<%=f.get("path").toString()%>&fileName=<%=f.get("name").toString()%>" title="<%=f.get("name").toString()%>"><%=f.get("name").toString()%></a><div/> 
			<%
				}}
			%>
			</div>
			<div class="detailDiv_basic_content mainContent">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${messageData.remark}
			</div>
			
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
// 鼠标移到“请登录”,显示登录悬浮窗
$('#login').click(function(){
	 $('.loginDiv').fadeIn(500);
});
// 鼠标移出登录悬浮窗时，悬浮窗自动消失
// $('.loginDiv').mouseleave(function(){
// 	$(this).fadeOut(500);
// });
// 进入系统
$('#inSystem').click(function(){
	window.location = contextPath + 'login/main.cn';
});
// 退出系统
$('#outSystem').click(function(){
	$.post(contextPath + "login/outSystem.cn",function(data){
		window.location.reload();
	});
});
// 按下回车键,进行登录
$(document).keyup(function(event){
	$("#userNameMsg").text("");
	$("#passwordMsg").text("");
	$("#lockMsg").text("");
	if(event.keyCode ==13){
		submitLogin();
	}
});
//登录系统
function submitLogin(){
	var userName = $.trim($('#userName').val()),
	kmPwEnovell = $("#kmPwEnovell").val(),
	kmPwEnovell = encrypt(kmPwEnovell);
	userName = encodeURIComponent(userName);
	$.post(contextPath + "login/inSystem.cn",{userName : userName,kmPwEnovell:kmPwEnovell},
		function(data){
			if(data.status == '1'){
				window.location.reload();
			}else{
				var msg = '系统错误，请联系管理员';
				if(data.msg == 'user'){
					msg = '用户名错误！';
					$("#userNameMsg").html(msg);
				}else if(data.msg == 'password'){
					msg = '密码错误！';
					$("#passwordMsg").html(msg);
				}else if(data.msg == 'lock'){
					msg = data.data;
					$("#lockMsg").html(msg);
					$("#passwordMsg").html('密码错误！');
				}
				return;
			}
	});
}

/**
 * 监听是否有相同用户登录系统，如果有，则自动下线。
 * @returns
 */
function onIsSameUserLogin(loginUserId){
	var webSocket = new WebSocket('ws://'+ window.location.hostname+":8080/kunmingrinms/websocket/offlineManageSocket/"+loginUserId);
// 	var webSocket = new WebSocket('ws://'+ window.location.hostname+":8008/kunmingrinms/websocket/offlineManageSocket/"+loginUserId);
	webSocket.onmessage = function (e) {
		var msg = e.data;
		if(msg=="true"){
			alert("当前账号正在其他终端上登录，您即将被迫下线！");
			setTimeout(function(){
				window.location = contextPath+"login/outSystem.cn";//返回首页
			},5000);
		}
	}
}
$(document).ready(function() {
	if('${user.name}'){
		var loginUserId = '${user.id}';
		$('#userSpan').hide();
		$('#userSpan').show();
		//onIsSameUserLogin(loginUserId);//用户登录后会监听 是否有相同用户。
	}else{
		$('#loginSpan').show();
		$('#userSpan').hide();
	}
	calContentSize();
});
$(window).on('resize',function(){
	calContentSize();
});
function calContentSize(){
	var rightWidth = $(window).width() - $('div.container.small').width() - 70;
	$('div.container.big').width(rightWidth / 3);
	$('div.container.detailDiv').width(rightWidth+40);
}
//获取最新5条置顶的发布消息
$.post(contextPath + 'homeAction/getTop.cn',function(data){
	data.forEach(function(d){
		$('.top_info ul').append(generateTopByData(d));
	})
})
function generateTopByData(m){
	var result = '<li>';
	result += '<a href="'+contextPath+'homeAction/showMessage.cn?id='+m.id+'">';
	result += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+m.theme;//加六个空格实现首行空两字符效果
	result += '</a></li>';
	return result;
}

//获取最新生产天数
$.post(contextPath + 'homeAction/findNum.cn',function(data){
		$('#dayNum').empty();
		$('#dayNum').html(data);

})

BUI.use(['bui/calendar'],function(Calendar){
	// 渲染日历
	var calendar = new Calendar.Calendar({
		width: 218,
		height: 212,
		render:'#calendar'
	});
	calendar.render();
	// 隐藏日历按钮
	calendar.get('el').find('ul').hide();
});
</script>
</html>