/**
 * 按比例分配宽度的左右布局容器，初始左侧容器的宽度为4/24
 */
define('common/container/LeftRightContainer',['bui/common'],function(r){
	var BUI = r('bui/common'),Component = BUI.Component;
	var LeftRightContainer = Component.Controller.extend({
		initializer:function(){
			var _self = this,ls = _self.get('leftSize'),rs = 24 - ls;
			var left = {
					id : 'left',
					xclass:'controller',
					elCls : 'span' + ls,
					children : _self.get('leftChildren'),
					height : '100%',
					elStyle : _self.get('leftStyle'),
					plugins : _self.get('leftPlugin')};
			var right = {
					id : 'right',
					xclass:'controller',
					elCls : 'span' + rs,
					children : _self.get('rightChildren'),
					height : '100%',
					elStyle :  _self.get('rightStyle'),
					plugins : _self.get('rightPlugin')};
			_self.addChild(left);
			_self.addChild(right);
		}
	},{
		ATTRS:{
			elCls : {value : 'row-fluid'},
			leftChildren : {value : []},
			leftPlugin : {value : []},
			leftStyle : {},
			rightChildren : {value : []},
			rightPlugin : {value : []},
			rightStyle : {value : {margin: '0 0 0 0.6%'}},
			leftSize : {value : 4}
		}
	});
	return LeftRightContainer;
});