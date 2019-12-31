/*
 * 页面遮罩层
 */
define('common/bodyLoadMask/BodyLoadMask',['bui/common','bui/mask'],function(r){
	var BUI = r('bui/common'),Component = BUI.Component,Mask = r('bui/mask');
	var BodyLoadMask = Component.Controller.extend({
		initializer:function(){
			var _self=this;
			_self._initLoadMask();
		},
		_initLoadMask:function(){
			var _self=this;
			var mask = new Mask.LoadMask({
				el:_self.get('el'),
				msg:'<img id="my_mask_img" style="display:inline-block;margin-left:-30px;margin-top:-30px;" width="60" height="60" src="'+_self.get('contextPath')+'/resource/js_framework/bui_framework/common/bodyLoadMask/load.gif">'
			});
			_self.set('mask',mask);
			return mask;
		},
		show:function(){
			this.get('mask').show();

		},
		hide:function(){
			this.get('mask').hide();
		}
	},{
		ATTRS:{
			elStyle:{value:{background:'none',border:'none'}},
			el:{},
			contextPath:{}
		}
	});
	return BodyLoadMask;
});