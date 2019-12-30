/**
 * 系统主框架界面
 * @author RoySong
 * @date 171017 
 */
define('/frame/main',['bui/common',
	'/frame/TopContent',
	'/frame/MainContent'
	],function(r){
	var BUI = r('bui/common'),Component = BUI.Component,
	TopContent=r('/frame/TopContent'),
	MainContent = r('/frame/MainContent');
	var Main = Component.Controller.extend({
		initializer: function(){
			var _self = this,
			menuData = _self.get('menuData'),
			content = new MainContent({
				id:'mainContent',
				menuData : menuData,
				height : _self.get('height') - 78}),
			top = new TopContent({
				id:'topContent',
				userName : _self.get('userName'),
				userId : _self.get('userId'),
				encryptUserId : _self.get('encryptUserId'),
				userPhone : _self.get('userPhone'),
				menuData:menuData});
			_self.addChild(top);
			_self.addChild(content);
		},
		bindUI:function(){
			var _self=this,top=_self.getChild('topContent'),
				left = _self.getChild('leftNavigator',true),
				tab=_self.getChild('nav-tab',true),
				menuData=_self.get('menuData');
			top.on('firstFucClick',function(ev){
				var firstData = BUI.Array.find(menuData,function(val){return val.id == ev.firstFuc.id;});
				left.updateMenu(firstData.children);
			});
			left.on('leafMenuClick',function(e){
				tab.addOrActiveTab(e.item);
			});
			$(window).on('resize',function(){
				_self.set('height',$(window).height());
				var content = _self.getChild('mainContent');
				content.set('height',$(window).height() - 78);
			})
		},
	},{
	    ATTRS : {
			menuData:{},
			userName : {},
			userPhone : {},
			userId : {},
			encryptUserId : {},
			height : {value : $(window).height()}
	    }
	});
	return Main;
})