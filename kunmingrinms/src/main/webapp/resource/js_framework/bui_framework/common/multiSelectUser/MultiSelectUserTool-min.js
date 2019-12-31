/**
 * 转派公用组件
 */
define('common/multiSelectUser/MultiSelectUserTool',
		['bui/common','bui/overlay','bui/select','bui/form','bui/data','common/form/FormContainer'],
		function(require){
	var BUI = require('bui/common');
	var Component = BUI.Component;
	var Overlay = require('bui/overlay');
	var Select = require('bui/select');
	var Form = require('bui/form');
	var Data =  BUI.Data;
	var FormContainer = require('common/form/FormContainer');
	var MultiSelectUserTool = Overlay.Dialog.extend({
		initializer:function(){
			var _self = this;
			_self.addChild(_self._initForm());
		},
		renderUI : function(){
			var _self = this,orgId = _self.get('orgId'),id = _self.get('id'),contextPath = _self.get('contextPath');
			var store = new Data.Store({
				url: contextPath,
				params : {orgId : orgId , id : id},
				autoLoad : true,
				proxy : {
					method : 'post',
					datatype: 'json'
				}
			});
			var select = new Select.Select({
				render:'#sele',
		        valueField:'#user',
		        multipleSelect: true,
		        width:215,
		        height:30,
		        store:store
			});
			select.render();
			_self.set('mySelect',select);
		},
		bindUI : function(){
			//设置下拉框弹出的picker的高度
			var _self = this;
			var select = _self.get('mySelect');
			select.get('picker').set('elCls', 'multiSelect');
			$(".multiSelect .bui-select-list").height(200);
			select.on('change', function(ev){
			    $("#user").val(ev.value);
			    _self.set('data',ev.value);
			});
		},
		_initForm:function(){
			var _self = this;
			var form = new FormContainer({
				render : 'body',
				colNum : 2,
				formChildrens : 
					[
						{
							label : '接收部门：',
							itemColspan : 2,
							item : '<input type="text" id="dept" value="'+_self.get('orgName')+'" disabled="disabled"/>'
						}, {
							label : '接收人：',
							itemColspan : 2,
							item : '<div id="sele"><input type="hidden" id="user" name="user"></div>'
						}
					]
			});
			return form;
		},
	},{
	    ATTRS : {
	    	title:{value:'转派'},
			width:{value:350},
			height:{value:150},
			mask:{value:true},
			zIndex:{value:'1090'},
			contextPath:{},
			id:{},
			orgId:{},
			orgName:{},
			success:{value:function(){
				var _self=this,data=_self.get('data');
				_self.fire('sureBtn',{
					data:data
				});
			}},
			events:{
				value: {
	    			'sureBtn': true
	    		}
			},
			closeAction:{value:'destroy'}
	    }
	});
	return MultiSelectUserTool;
});