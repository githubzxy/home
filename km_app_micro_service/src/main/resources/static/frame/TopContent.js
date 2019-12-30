/**
 * 主界面上方导航栏模块,分为左右两部分,左侧包含logo图标和一级菜单项,右侧包含欢迎辞、修改密码功能和退出按钮
 */
define('/frame/TopContent',['bui/common','/frame/ChangeProfile'],function(r){
	var BUI = r('bui/common'),Component = BUI.Component,CP = r('/frame/ChangeProfile');
	var TopContent = Component.Controller.extend({
		initializer:function(){
			var _self = this;
			var topLeft = {elCls :'topLeft',defaultChildClass:'controller',children:[
				{elCls :'oneFunction',defaultChildClass:'controller',children:_self._createFirstMenu()}
				]};
			var topRight = {elCls :'topRight',defaultChildClass:'controller',children:[
				{elCls :'user_msg_info',defaultChildClass:'controller',children:[
					{elCls :'loginName',elTagName:'span',content:'您好，'+ _self.get('userName') +'&nbsp;&nbsp;欢迎回来！'},
					{elCls :'changePsw faction',elTagName:'a',content:'修改个人资料&nbsp;&nbsp;',elAttrs :{href: '#'}},
					{elCls :'faction',elTagName:'a',content:'退出&nbsp;&nbsp;',elAttrs :{href:'/logout'}}
				]}
			]};
			_self.addChild(topLeft);
			_self.addChild(topRight);
		},
		bindUI:function(){
			var _self=this,menuData=_self.get('menuData');
			_self.get('el').delegate('.changePsw','click',function(ev){
				ev.preventDefault();
				var profile = new CP({userPhone : _self.get('userPhone')});
				profile.show();
			}).delegate('.firstFuncButton','click',function(ev){
				ev.preventDefault();
				if(ev.target !== _self){
					$('.firstFuncButton').removeClass('firstFuncButtonAction');
					$(ev.currentTarget).addClass('firstFuncButtonAction');
					_self.fire('firstFucClick',{
						firstFuc : ev.currentTarget,
						domTarget: ev.domTarget,
				        domEvent: ev
					});
				}
			});
		},
		_createFirstMenu:function(){
			var _self=this,menuData=_self.get('menuData'),firstMenus=[],userId=_self.get('userId'),encryptUserId=_self.get('encryptUserId');
			BUI.Array.each(menuData,function(data){
				var menu = {elCls:'firstFuncButton',elTagName:'a',content:data.text,elAttrs:{id:data.id}};
				firstMenus.push(menu);
			});
//			var jump = [{elCls:'jumpButton',elTagName:'a',content:'电务调度指挥中心系统'
//				,elAttrs:{href:'http://10.167.74.201/sczh/Private/remoteLogin.jsp?sid='+ encryptUserId,target:'_blank'}},//无辉煌系统，未测试
//			{elCls:'jumpButton',elTagName:'a',content:'安全生产调度指挥系统'
//				,elAttrs:{href:'http://10.160.94.86/RINMS2MAIN/RINMS2MAIN-debug/wgUserLogin.jsp?userId='+userId,target:'_blank'}}];
//			return firstMenus.concat(jump);
			return firstMenus;
		}
	},{
		ATTRS : {
			menuData:{},
			userName : {},
			userPhone : {},
			userId : {},
			encryptUserId : {},
			defaultChildClass:{value:'controller'},
			elCls:{value:'top'},
			events: {value: {'firstFucClick': true}}
	    }
	});
	return TopContent;
});