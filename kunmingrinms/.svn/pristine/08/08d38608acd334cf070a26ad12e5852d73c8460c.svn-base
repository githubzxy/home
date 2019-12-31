define('common/chooseUser/ChooseUserDialog',['bui/common','bui/overlay','common/chooseUser/ChooseUser'],function(require){
	var BUI = require('bui/common'),Component = BUI.Component;
	var Overlay = require('bui/overlay');
	var CU = require('common/chooseUser/ChooseUser');
	var ChooseUserDialog = Overlay.Dialog.extend({
		initializer:function(){
			var _self = this;
			_self.addChild(_self._initChooseUser());
		},
		 /*
		  * 初始化人员选择组件
		  */
		 _initChooseUser:function(){
			 var _self = this;
			 var chooseUser = new CU({
				 userIds:_self.get('userIds'),
				 contextPath:_self.get('contextPath'),
				 orgType:_self.get('orgType'),
				 selectType:_self.get('selectType')
			 });
			 _self.set('chooseUser',chooseUser);
			 return chooseUser;
		 }
		},
		{
		   ATTRS : {
			    closeAction : {
					value : 'destroy'
				},
				width:{value:860},
				height:{value:475},
				mask:{value:true},
				zIndex : {value:'1200'},
				buttons:{value:{
					
				}},
				title : {value : '人员选择'},
				success:{value:function(){
					var _self=this,chooseUser=_self.get('chooseUser'),data=chooseUser.getSelectUserData();
					_self.fire('sureBtn',{
						data:data
					});
				}},
				userIds:{},
				contextPath : {},
				orgType:{},
				selectType:{},//选择人员的类型，选择的是派发人员，还是抄送人员,1-派发人员，2-抄送人员
				events:{
					value: {
		    			'sureBtn': true			
		    		}
				}
		   }
		}
		);
	return ChooseUserDialog;
});