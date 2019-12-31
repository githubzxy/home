<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/index/css/index-notify.css" rel="stylesheet" />
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
            <li>
            	<a class="menusys" href="">安全管理</a>
            	<img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" >
            </li>
            <li>
            	<a class="menusys" href="">生产管理</a>
            	<img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" >
            </li>
            <li>
            	<a class="menusys" href="">施工维修管理</a>
            	<img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" >
            </li>
            <li>
            	<a class="menusys" href="">技术管理</a>
            	<img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" >
            </li>
            <li>
            	<a class="menusys" href="">综合管理</a>
            	<img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" >
            </li>
            <li>
            	<a class="menusys" href="">机房信息管理</a>
            	<img class="menusplit" src="<%=contextPath%>/resource/index/img/split.png" >
            </li>
            <li>
            	<a class="menusys menuOther" href="">现场作业控制</a>
            </li>
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
                        <a class="menusys" href="http://10.206.97.16:8090/recorder/recorder-web-1.0.0/main.html"><span class="linkmenuitemimg"><img src="<%=contextPath%>/resource/index/img/linkmenuimg.png" align="baseline"></span>通信履历薄系统</a>
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
        <div class="container detail">
        	<div class = "message_Detail">
        		<div class = "message_show">
	        		<div class="message_left">
	            		<label>信息主题：</label><input id="themeShow" readonly value=""/>
	          		</div>
	         		<div class="message_right">
	            		<label>信息类别：</label><input id="typeShow" readonly value=""/>
	          		</div>
          		</div>
          		<div class = "message_info">
	            	<label class = "infoData">信息内容：</label><textarea id="contentShow"  value="" readonly></textarea>
          		</div>
          		<div class="message_accessory">
            		<label>附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：</label><div id="messageShow" style="height:50px;" class="accessoryBag"></div>
          		</div>
        	</div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script charset="utf-8" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
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
	var result = ${messageData};
	$('#themeShow').val(result.theme);
	$('#typeShow').val(message_type.typeName(result.type));
	$('#contentShow').val(result.content);

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

seajs.config({
	paths:{
		views: contextPath + 'views',
		common: contextPath + 'common',
		bui: contextPath + 'bui'
	}
});
seajs.use(['bui/calendar',"common/uploader/ViewUploader"],function(Calendar,ViewUploader){
	// 渲染日历
	var calendar = new Calendar.Calendar({
		render:'#calendar'
	});
	calendar.render();
	// 隐藏日历按钮
	calendar.get('el').find('ul').hide();
	
	
	var result = ${messageData};
	var files = new ViewUploader({
		render: '#messageShow',
		alreadyItems : result.uploadFileArr,
		previewUrl:'/kunmingrinms/views/common_page/commonPreview.jsp',
		servlet : "DownloadFileServlet"
	});
	files.render();
});

</script>

</html>