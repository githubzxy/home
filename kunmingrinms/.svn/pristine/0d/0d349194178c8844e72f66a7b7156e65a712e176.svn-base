/**
 * 转派公用组件
 */
define('common/multiSelectUser/MultiSelectUser',
		['bui/common','bui/overlay','bui/select','bui/picker','bui/form','common/form/FormContainer','common/multiSelectUser/SendUserPicker'],
		function(require){
	var BUI = require('bui/common');
	var Component = BUI.Component;
	var Data = require('bui/data');
	var Overlay = require('bui/overlay');
	var OrganizationPicker = require('common/multiSelectUser/SendUserPicker');
	var Form = require('bui/form');
	var FormContainer = require('common/form/FormContainer');
	var MULTI_SELECT_USER_ID = "multi_select_user";
	var MultiSelectUser = Overlay.Dialog.extend({
		initializer:function(){
			var _self = this;
			_self.addChild(_self._initForm());
			_self.addChild(_self._initPicker());
		},
		renderUI : function(){
			var _self = this;
		},
		bindUI : function(){
			var _self = this;
			var picker = _self._initPicker();
			
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
//							item : '<div id="dept" style="height:30px">'+_self.get('orgName')+'</div>'
							item : '<input type="text" id="dept" value="'+_self.get('orgName')+'" disabled="disabled"/>'
						}, {
							label : '接收人：',
							itemColspan : 2,
							item : '<input type="text" id="user" readonly value="" name="user"><input type="hidden" id="userId" value="" name="userId">'
						}
					]
			});
			_self.set('form',form);
			return form;
		},
		_initPicker:function(){
			var _self = this,orgId = _self.get('orgId');
			var userPicker = new OrganizationPicker({
				parentControllerId:MULTI_SELECT_USER_ID,
		         trigger :'#'+MULTI_SELECT_USER_ID+' #user',
		         orgId : orgId,
		         url : _self.get('getUserUrl'),//必填项
		         autoHide: true,
		         align : {
		             points:['bl','tl']
		           },
		         width:200,
		         height:200
			 });
			userPicker.render();
			_self.set('userPicker',userPicker);
			return userPicker;
		}
		
	},{
	    ATTRS : {
	    	getUserUrl:{},//获取选择用户弹出内容的用户获取地址
	    	title:{value:'转派'},
			width:{value:350},
			height:{value:150},
			mask:{value:true},
			orgId:{},//弹出组织机构树的组织机构id
			orgName:{},//接收部门名称
        	zIndex:{value:'1090'},
        	elAttrs:{value:{id:MULTI_SELECT_USER_ID}},
        	closeAction:{value:'destroy'},
        	success:{value:function(){
        		var _self = this;
        		_self.fire('success',{
        			data:_self.get('form').serializeToObject()
        		});
        		_self.close();
        	}},
        	events:{value:{success:true}}
		}
	}
	);
	return MultiSelectUser;
});