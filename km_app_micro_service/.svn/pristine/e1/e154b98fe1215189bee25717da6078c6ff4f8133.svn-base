/**
 * 统一登录界面模块
 * @author RoySong
 * @date 171016
 */
define('/login/login',['bui/common','bui/overlay','common/data/PostLoad'],function(r){
	var BUI = r('bui/common'),Component = BUI.Component,
		Overlay = r('bui/overlay'),PL = r('common/data/PostLoad');
	var LOGIN_BUTTON_ID = 'loginButton';
	var Login = Component.Controller.extend({
		initializer : function(){
			var _self = this;
			var loginForm = _self._initLoginForm();
			var downloadBrowserButton = _self._initDownLoadButton();
			_self.addChild(loginForm);
			_self.addChild(downloadBrowserButton);
		},
		renderUI : function(){
			var _self = this;
			_self._initRange();
		},
		bindUI : function(){
			var _self = this;
			$(window).on('resize',function(){
				_self._initRange();
			})
			var loginButton = _self.getChild(LOGIN_BUTTON_ID,true);
			loginButton.on('click',_self._login);
			$('#password').keyup(function(e){
				e.keyCode == 13?_self._login():null;
			})
			
			// 谷歌浏览器下载
			$('.downloadButton').on('click',function(){
				window.location.href="/browser/Chrome.zip";
			});
		},
		_login : function(){
			var userName = $('#userName').val(),
			password = $("#password").val();
			if(userName && password){
				var pl = new PL({
					url : '/login'
				})
				pl.load({userName : userName,password : password},function(r){
					console.log(r);
					if(r && r.status == '1'){
						window.location = '/';
					}else{
						var msg = r && r.status == '2'? r.msg : '网络连接不稳定，请检查网络！';
						BUI.Message.Alert(msg);
					}
				})
			}else{
				BUI.Message.Alert('用户名或密码不能为空，请检查后重新输入！');
				return;
			}
		},
		_initLoginForm : function(){
			var loginForm = new Component.Controller({
				elCls : 'loginForm',
				width : 240,
				height : 230,
			});
			var userName = new Component.Controller({
				elCls : 'userDiv',
				content : '<input id="userName" type="text"  name="username" class="textStyle text" />'
			});
			loginForm.addChild(userName);
			var password = new Component.Controller({
				elCls : 'passwordDiv',
				content : '<input id="password" type="password"  name="password" class="textStyle text" />'
			})
			loginForm.addChild(password)
			var checkbox = new Component.Controller({
				elCls : 'checkboxDiv',
				content : '<input type="checkbox" name="remember" class="checkboxStyle"/>'
			})
			loginForm.addChild(checkbox);
			var loginButton = new Component.Controller({
				id : LOGIN_BUTTON_ID,
				elCls : 'loginButton',
				width : 85,
				height : 33,
			})
			loginForm.addChild(loginButton)
			return loginForm;
		},
		_initDownLoadButton : function(){
			var button = new Component.Controller({
				elCls : 'downloadButton',
				width : 50,
				height : 50,
			})
			return button;
		},
		/**
		 * 根据浏览器的大小决定登录页面容器的大小
		 */
		_initRange : function(){
			var _self = this,
			winHeight = $(window).height(),
			winWidth = $(window).width(),
			width = winHeight * 5 / 3,//背景图片的宽高比是5:3，按照此比例来制定容器的宽高
			height = winWidth * 3 / 5,
			width = width > winWidth ? winWidth : width,
			height = width > winWidth ? height : winHeight;
			_self.set('height',height);
			_self.set('width',width);
		}
	},{
		ATTRS : {
			elCls : {value : 'loginMain'}
		}
	});
	return Login;
})