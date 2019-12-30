/**
 * 主界面下方容器，包括左右两部分，左边是二、三级菜单项，右侧是带导航的TAB业务展示模块
 * @author RoySong
 * @date 171018
 */
define('/frame/MainContent',
		['bui/common',
		 'common/container/LeftRightContainer',
		 '/frame/LeftNav',
		 '/frame/RightNav'],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,
		LRC = require('common/container/LeftRightContainer'),
		LeftNav = require('/frame/LeftNav'),
		RightNav = require('/frame/RightNav');
	var MainContent = LRC.extend({
		initializer : function(){
			var _self=this,menuData = _self.get('menuData'),
				secMenuData=menuData[0].children,leafMenu=_self._getLeaf(menuData[0]);
			var left = new LeftNav({height:'100%',id:'leftNavigator'});
			left.set('children',left.createMenuItems(secMenuData));
			var href = leafMenu.href + "?threePerId=" + leafMenu.id;
			var tab = new RightNav({id:'nav-tab',width:'100%',height:_self.get('height'),
				children:[{title:leafMenu.text,id:leafMenu.id,actived:true,href:href}]});
			_self.get('leftChildren').push(left);
			_self.get('rightChildren').push(tab);
		},
		bindUI:function(){
			var _self = this,left = _self.getChild('leftNavigator',true),
				tab = _self.getChild('nav-tab',true);
			$(window).on('resize',function(){
				var height = $(window).height() - 78;
				left.set('height',height);
				tab.set('height',height);
			});
		},
		_getLeaf:function(data){
			var _self=this;
			if(data.children&&data.children.length>0){
				return _self._getLeaf(data.children[0]);
			}else{
				return data;
			}
		},
	},{
		ATTRS : {
			menuData : {},
		}
	});
	return MainContent;
});