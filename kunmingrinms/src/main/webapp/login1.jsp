<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
	<head>
		<title>昆明铁路局通信安全生产调度指挥系统</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/login.css">
	</head>

<body bgcolor="#dcf2fa">
		<div class="loginBackground" style="background-image:url('<%=contextPath%>/resource/images/custom/loginBackgroundyunwei.jpg');">
			<div class="loginImage" style="background-image:url('<%=contextPath%>/resource/images/custom/loginImage.png');">
			<form method="post" id="loginForm">
				<div class="userDiv">
					<input id="userName" type="text"  name="username" class="textStyle text" />
					<a id="userNameMsg" style="font-size: 12px;color:red;"></a>
				</div>
				<div class="passDiv">
					<input id="password" type="password" name="password" class="textStyle text" />
					<a id="passwordMsg" style="font-size: 12px;color:red;"></a>
				</div>
			</form>
				<div class="checkboxDiv">
					<input type="checkbox" class="checkboxStyle"/>
				</div>
				<div class="loginBtnDiv" onclick="submitLogin()" style="background-image:url('<%=contextPath%>/resource/images/custom/loginBtn.png');"></div>
			</div>
			<div class="download">
	            <img src="<%=contextPath%>/resource/images/custom/smalllogo.png"  title="谷歌下载(注：请先卸载本地谷歌浏览器，再进行安装)" onClick="chromeDownload('<%=contextPath%>/Browser/Chrome.zip')"/>
	        </div>
			<div class="chromeDownload" onClick="chromeDownload()"></div>
		</div>
</body>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if(!validateChrome()){
			alert("请您使用谷歌浏览器登录本系统！");
		}
	});
	
	function validateChrome(){
		//判断当前浏览器是否是Chrome
		var userAgent = navigator.userAgent; 
		if (userAgent.indexOf("Chrome") > -1){
			return true;
		}
		return false;
	}

	function chromeDownload(url) {
		window.location.href = url;
	}
	
	$(document).keyup(function(event){
		$("#userNameMsg").text("");
		$("#passwordMsg").text("");
		  if(event.keyCode ==13){
			  submitLogin();
		  }
	});
	
	function submitLogin(){
		if(!validateChrome()){
			alert("请您使用谷歌浏览器登录本系统！");
			return;
		}
		var userName = $.trim($('#userName').val()),
			password = $("#password").val();
		userName = encodeURIComponent(userName);
		$.ajax({
			url : "<%=contextPath%>/login/in.cn",
			async : false,
			data : {userName : userName,password:password},
			dataType : 'jsonp',
			jsonp: 'jsoncallback',
			success : function(data){
				if(data.status == '1'){
					window.location = '<%=contextPath%>/login/main.cn';
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
			}
		});
	}
</script>
</html>