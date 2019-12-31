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
<link href="<%=contextPath%>/resource/index/css/index.css" rel="stylesheet" />
</head>
<body>
<div class="main">
    <div class="logo">
        <span style="padding-right:400px">
			<img src="<%=contextPath%>/resource/index/img/logo.png" >
		</span>
		<span id="loginSpan" style="display:none;float: right;margin-top: 30px;">
			<a href="#" id="login">请登录</a>
		</span>
		<span id="userSpan" style="display:none;float: right;margin-top: 30px;">
			欢迎
			<label>${user.name}</label>
			<a href="#" id="inSystem">进入系统</a>
			<a href="#" id="outSystem">退出登录</a>
		</span>
		<div class="loginDiv">
			<form method="post" id="loginForm">
				<div class="userDiv">
					<span>用户名：</span><input id="userName" type="text" name="username" class="textStyle text" />
					<span id="userNameMsg" style="font-size: 12px;color:red;margin-left: 55px;display:block;"></span>
				</div>
				<div class="passDiv">
					<span>密&emsp;码：</span><input id="password" type="password" name="password" class="textStyle text" />
					<span id="passwordMsg" style="font-size: 12px;color:red;margin-left: 55px;display:block;"></span>
				</div>
			</form>
			<div class="loginBtnDiv" onclick="submitLogin()"  style="background-image:url('<%=contextPath%>/resource/images/custom/loginBtn.png');">
			</div>
		</div>
    </div>
    <div class="banner">
	
    </div>
    <div class="menu">
        <ul>
            <li><a class="menusys" href="">安全管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="">生产管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="">施工维修管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="">技术管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="">综合管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys" href="">机房信息管理</a><img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" ></li>
            <li><a class="menusys menuOther" href="">现场作业控制</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="container small">
            <div class="linkmenu">
                <ul>
                    <li class="linkmenuitem">
                        <a class="menusys" href="#"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline"></span>综合网管</a>
                    </li>
                    <li class="linkmenuitem">
                        <a class="menusys" href="http://10.206.97.16:8090/recorder/recorder-web-1.0.0/main.html" target="_blank"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline"></span>通信履历薄系统</a>
                    </li>
                    <li class="linkmenuitem">
                        <a class="menusys" href="#"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline"></span>业务系统3</a>
                    </li>
                    <li class="linkmenuitem">
                        <a class="menusys" href="#"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline"></span>业务系统4</a>
                    </li>
                </ul>
            </div>
            <div class="safeday">
                <div class="module_title">
                    <img src="<%=contextPath%>/resource/index/img/safe.png" align="texttop" style="padding-left: 15px;">&nbsp;安全生产<label style="font-size: 20px;color: red;">365</label>天
				</div>
				<div id="calendar"></div>
            </div>
		</div>
        <div class="container big">
            <div class="module_title">
                <span><img src="<%=contextPath%>/resource/index/img/notify.png" align="texttop">&nbsp;最新通知</span>
                <span></span>
            </div>
			<div class="module_content" id="message">
			</div>
        </div>
        <div class="container big">
            <div class="module_title">
                <span><img src="<%=contextPath%>/resource/index/img/news.png" align="texttop">&nbsp;新闻</span>
                <span></span>
            </div>
			<div class="module_content" id="news">
			</div>
        </div>
        <div class="container big">
            <div class="module_title">
                <span><img src="<%=contextPath%>/resource/index/img/proclamation.png" align="texttop">&nbsp;公示公告</span>
                <span></span>
            </div>
			<div class="module_content" id="notice">
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
$('#login').mouseover(function(){
	 $('.loginDiv').fadeIn(500);
});
// 点击登录悬浮窗以外的地方,隐藏悬浮窗
$('.logo').bind('click',function(e){
	var flag = $('.loginDiv').is(':visible');
	e.stopPropagation();
	$(document).bind('click',function(ev){
		if(flag){
 			$('.loginDiv').fadeOut(500);
 		}
	});
})

$(document).ready(function() {
	if('${user.name}'){
		$('#userSpan').hide();
		$('#userSpan').show();
	}else{
		$('#loginSpan').show();
		$('#userSpan').hide();
	}
});
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
	if(event.keyCode ==13){
		submitLogin();
	}
});
//登录系统
function submitLogin(){
	var userName = $.trim($('#userName').val()),
	password = $("#password").val(),
	userName = encodeURIComponent(userName);
	$.post(contextPath + "login/inSystem.cn",{userName : userName,password:password},
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
				}
				return;
			}
	});
}

BUI.use(['bui/calendar','bui/data','bui/list'],function(Calendar,Data,List){
	// 渲染日历
	var calendar = new Calendar.Calendar({
		render:'#calendar'
	});
	calendar.render();
	// 隐藏日历按钮
	calendar.get('el').find('ul').hide();
	
	// 最新通知数据源
	var messageStore = new Data.Store({
		url : contextPath + 'homeAction/getHomeMessage.cn',
		autoLoad : true,
		proxy : {
			method : 'post'
		}
	});
	// 最新通知列表
	var messageList = new List.SimpleList({
	    render : '#message',
		store : messageStore,
		itemTplRender : function(item){	
			 return '<li><a href="'+contextPath + 'homeAction/showMessage.cn?id='+item.id+'&title=最新通知" target="_blank">' + item.theme + '</a></li>';
		},
	});
	messageList.render();
	
	
	
	// 新闻数据源
	var newsStore = new Data.Store({
		url : contextPath + 'homeAction/getHomeNews.cn',
		autoLoad : true,
		proxy : {
			method : 'post'
		}
	});
	// 新闻列表
	var newsList = new List.SimpleList({
	    render : '#news',
		store : newsStore,
		itemTplRender : function(item){	
			 return '<li><a href="'+contextPath + 'homeAction/showMessage.cn?id='+item.id+'&title=新闻" target="_blank">' + item.theme + '</a></li>';
		},
	});
	newsList.render();
	
	var noticeStore = new Data.Store({
		url : contextPath + 'homeAction/getHomeNotice.cn',
		autoLoad : true,
		proxy : {
			method : 'post'
		}
	});
	// 公示公告列表
	var noticeList = new List.SimpleList({
	    render : '#notice',
		store : noticeStore,
		itemTplRender : function(item){	
			 return '<li><a href="'+contextPath + 'homeAction/showMessage.cn?id='+item.id+'&title=公示公告" target="_blank">' + item.theme + '</a></li>';
		},
	});
	noticeList.render();
	
	
});
</script>
</html>