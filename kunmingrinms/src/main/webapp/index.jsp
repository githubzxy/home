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
		<div class="container big" style="width:270px;">
            <div class="module_title">
                <span class="onduty">&nbsp;值班情况</span>
                <span class="onduty" style="font-size: 12px;padding-top: 3px;">更多...</span>
            </div>
			<div class="module_content" id="onduty">
				<ul></ul>
			</div>
        </div>
        <div class="container big" style="width:270px;">
            <div class="module_title">
                <span class="new_message">&nbsp;临时任务通知</span>
                <span class="new_message" style="font-size: 12px;padding-top: 3px;">更多...</span>
            </div>
			<div class="module_content" id="message">
				<ul>
				</ul>
			</div>
        </div>
        
        <div class="container big" style="width:270px;">
            <div class="module_title">
                <span class="notice">&nbsp;电路工单</span>
                <span class="notice" style="font-size: 12px;padding-top: 3px;">更多...</span>
            </div>
			<div class="module_content" id="notice">
				<ul></ul>
			</div>
        </div>
        <div class="container big" style="width:270px;">
            <div class="module_title">
                <span class="saferule">&nbsp;安全规章</span>
                <span class="saferule" style="font-size: 12px;padding-top: 3px;">更多...</span>
            </div>
			<div class="module_content" id="saferule">
				<ul></ul>
			</div>
        </div>
        <div class="container big" style="width:270px;">
            <div class="module_title">
                <span class="tecrule">&nbsp;技术规章</span>
                <span class="tecrule" style="font-size: 12px;padding-top: 3px;">更多...</span>
            </div>
			<div class="module_content" id="tecrule">
				<ul></ul>
			</div>
        </div>
        <div class="container big" style="width:270px; !important">
            <div class="module_title">
                <span class="workrule">&nbsp;施工协议</span>
                <span class="workrule" style="font-size: 12px;padding-top: 3px;">更多...</span>
            </div>
			<div class="module_content" id="workrule">
				<ul></ul>
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
	var rowCount = 2,colCount = 3;
	if($(window).width() < 1025){
		rowCount = 3;
		colCount = 2;
	}
// 	var actualHeight = rowCount * ($('div.container.big').height() + 10);
// 	$('div.content').height(actualHeight + 10);
// 	$('div.container.small').height(actualHeight);
// 	var rightWidth = $(window).width() - $('div.container.small').width() - 50;
// 	$('div.container.big').width(rightWidth / colCount);
}
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

//获取最新生产天数
$.post(contextPath + 'homeAction/findNum.cn',function(data){
		$('#dayNum').empty();
		$('#dayNum').html(data);

})
// 获取最新10条临时任务通知数据
$.post(contextPath + 'homeAction/getHomeTask.cn',function(data){
	data.forEach(function(d){
		$('#message ul').append(generateMessageByData(d));
	})
})
function generateMessageByData(m){
	var result = '<li>';
	result += '['+m.createDate+']';
	result += '<a href="'+contextPath+'homeAction/showMessageOfTask.cn?id='+m.docId+'">';
	result += '&nbsp;&nbsp;' + m.taskName;
	result += '</a></li>';
	return result;
}

//获取最新10条电路工单数据
$.post(contextPath + 'homeAction/getIndexCircuitWorkOrder.cn',function(data){
	data.forEach(function(d){
		$('#notice ul').append(generateCircuitWorkOrderByData(d));
	})
})
function generateCircuitWorkOrderByData(m){
	var result = '<li>';
	result += '['+m.createDate+']';
	result += '<a href="'+contextPath+'homeAction/showIndexCircuitWorkOrder.cn?id='+m.docId+'">';
	result += '&nbsp;&nbsp;' + m.workOrderName;
	result += '</a></li>';
	return result;
}

//获取最新10条安全规章数据
$.post(contextPath + 'homeAction/getHomeSaferule.cn',function(data){
	data.forEach(function(d){
		$('#saferule ul').append(generateSaferuleByData(d));
	})
})
function generateSaferuleByData(m){
	var result = '<li>';
	result += '['+m.createStartDate+']';
	result += '<a href="'+contextPath+'homeAction/showSaferule.cn?id='+m.id+'">';
	result += '&nbsp;&nbsp;' + m.fileName;
	result += '</a></li>';
	return result;
}

//获取最新10条技术规章数据
$.post(contextPath + 'homeAction/getHomeTecrule.cn',function(data){
	data.forEach(function(d){
		$('#tecrule ul').append(generateTecruleByData(d));
	})
})
function generateTecruleByData(m){
	var result = '<li>';
	result += '['+m.createStartDate+']';
	result += '<a href="'+contextPath+'homeAction/showTecrule.cn?id='+m.id+'">';
	result += '&nbsp;&nbsp;' + m.fileName;
	result += '</a></li>';
	return result;
}

//获取最新10条施工配合协议数据，此处直接调用服务器上微服务的restful接口获取数据
$.post(contextPath + 'homeAction/getHomeWorkrule.cn',function(data){
	data.forEach(function(d){
		$('#workrule ul').append(generateWorkruleByData(d));
	})
})
function generateWorkruleByData(m){
	var result = '<li>';
	result += '['+m.createDate+']';
	result += '<a href="'+contextPath+'homeAction/showWorkcrule.cn?id='+m.docId+'">';
	result += '&nbsp;&nbsp;' + m.proName;
	result += '</a></li>';
	return result;
}

//获取当天值班信息
$.post(contextPath + 'homeAction/getOnduty.cn',function(data){
	var result = generateDutyByData('值班日期：'+data.today);
	if(data.leader)
		result += generateDutyByData('值班领导：'+data.leader);
	else
		result += generateDutyByData('值班领导：暂无数据');
	if(data.depart)
		result += generateDutyByData('值班干部：'+data.depart);
	else
		result += generateDutyByData('值班干部：暂无数据');
	if(data.dispatch)
		result += generateDutyByData('值班调度：'+ data.dispatch);
	else
		result += generateDutyByData('值班调度：暂无数据');
	$('#onduty ul').append(result);
})
function generateDutyByData(d){
	var result = '<li>'; 
	result += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>'+d;
	result += '</a></li>';
	return result;
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

//点击值班标题进入通知值班界面
$('div.module_title span.onduty').click(function(){
	window.location = contextPath + 'views/index/indexOnduty.jsp';
});
//点击通知标题进入通知首页列表界面
$('div.module_title span.new_message').click(function(){
	window.location = contextPath + 'views/index/indexTask.jsp';
});
//点击电路工单标题进入电路工单首页列表界面
$('div.module_title span.notice').click(function(){
	window.location = contextPath + 'views/index/indexCircuitWorkOrder.jsp';
});
//点击安全规章标题进入安全规章首页列表界面
$('div.module_title span.saferule').click(function(){
	window.location = contextPath + 'views/index/indexSaferule.jsp';
});
//点击技术规章标题进入技术规章首页列表界面
$('div.module_title span.tecrule').click(function(){
	window.location = contextPath + 'views/index/indexTecrule.jsp';
});
//点击施工协议标题进入施工协议首页列表界面
$('div.module_title span.workrule').click(function(){
	window.location = contextPath + 'views/index/indexWorkrule.jsp';
});
</script>
</html>