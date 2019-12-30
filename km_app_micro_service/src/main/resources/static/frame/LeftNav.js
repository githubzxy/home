/**
 * 主界面左侧导航模块,分为两个层次,第一层是according容器，放置二级菜单项;第二层是树形菜单,支持多级菜单,点击菜单项后在主界面右侧打开tab页
 */
define('/frame/LeftNav',['bui/common','bui/layout','bui/tree'],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,Layout = require('bui/layout'),Tree = require('bui/tree');
	var LeftNav = Component.Controller.extend({
		updateMenu:function(newMenuData){
			var _self = this,oldChildren = _self.get('children'),newChildren=_self.createMenuItems(newMenuData);
			if(oldChildren&&oldChildren.length>0){
				var oldIds=[];
				BUI.Array.each(oldChildren,function(o){oldIds.push(o.get('id'));});
				BUI.Array.each(newChildren,function(c){_self.addChild(c);});
				BUI.Array.each(oldIds,function(cid){
					var old = _self.getChild(cid);
					if(old){
						_self.removeChild(old);
					}
				});
			}else{
				BUI.Array.each(newChildren,function(c){_self.addChild(c);});
			}
		},
		createMenuItems:function(secMenuData){
			var _self=this,result=[];
			BUI.Array.each(secMenuData,function(data){
				var menu = {layout:{title:data.text},xclass:'tree-menu',id:data.id,nodes:data.children,elCls:'bui-side-menu',idField:'id',
				        dirTpl : '<li class="menu-second"><div class="bui-menu-title"><s></s><span class="bui-menu-title-text">{text}</span></div></li>',
				        leafTpl : '<li class="menu-leaf"><a href="#"><em>{text}</em></a></li>',itemCls : 'bui-menu-item',
				        listeners :{itemclick:function(ev){_self._throwLeafMenuClick(ev.item)}}};
				result.push(menu);
			});
			return result;
		},
		_throwLeafMenuClick:function(data){
			var _self=this;
			_self.fire('leafMenuClick',{
				item : data
			});
		}
	},{
		ATTRS : {
			defaultChildClass:{value:'controller'},
			plugins:{value:[Layout.Accordion]},
			elCls:{value:'leftNavigator'},
			events: {value: {'leafMenuClick': true}}
		}
	});
	return LeftNav;
});