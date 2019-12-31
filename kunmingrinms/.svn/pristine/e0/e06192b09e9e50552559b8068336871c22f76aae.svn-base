/**
 * 公用查询表单组件，用于上查询、下列表中的查询
 */
define('common/search/SearchForm',['bui/common','bui/layout','bui/form','common/container/LeftRightContainer'],function(r){
	var BUI = r('bui/common'),Component = BUI.Component,Layout = r('bui/layout'),Form = r('bui/form'),LRC = r('common/container/LeftRightContainer');
	var SearchForm = Form.HForm.extend({
		initializer:function(){
			var _self = this;
			var items = _self.get('items');
			var layout = new Layout.Flow();
			var formItems = [];
			BUI.Array.each(_self.get('items'),function(i){
				formItems.push(_self._geItem(i.label,i.item));
			});
			var lrc = new LRC({
				id : 'lrc',
				leftPlugin : [layout],
				leftSize : 21,
				leftStyle : {padding: '20px 0 0 0'},
				leftChildren : formItems,
				rightChildren : [_self._geButton()]
			});
			_self.addChild(lrc);
		},
		renderUI : function(){
			var _self = this,left = _self.getChild('lrc').getChild('left'),
			leftHeight = left.get('el').outerHeight(true),
			buttonHeight = $('.button').outerHeight(true);
			$('.form-actions').offset({top:leftHeight - buttonHeight});
		},
		bindUI : function(){
			var _self = this;
			_self.get('el').delegate('.button-primary','click',function(ev){
				ev.preventDefault();
				_self.fire('formSearch',{
					param : _self.serializeToObject(),
					domTarget: ev.domTarget,
			        domEvent: ev
				});
			});
		},
		_geItem:function(label,item){
			var _self = this;
			var i = new Component.Controller({
				elCls : 'control-group',	
				tpl:'<label class="control-label">'+label+'：</label>'+
					'<div class="controls">'+
					item +
					'</div>'
			});
			return i;
		},
		_geButton:function(){
			var _self = this;
			var content = "";
			if(_self.get('isHaveButton')){
				content = '<button type="button" class="button button-primary">查询</button>'+
	            '<button type="reset" class="button">重置</button>';
			}
			var b = new Component.Controller({
//				elCls : 'form-actions',
				elCls : _self.get('elcls'),
				elStyle : _self.get('elstyle'),
				content:content
			});
			return b;
		}
	},{
		ATTRS:{
			/**
			 * 修改人：luoyan 2017-7-25 button的elCls elStyle设为可配置
			 */
			elcls : {value:'form-actions'},
			elstyle : {},
			
			items : {value : []},
			events: {value: {'formSearch': true}},
			
			isHaveButton:{value:true}//是否显示“查询”和“重置”按钮，true:显示，false:不显示
		}
	});
	return SearchForm;
});
