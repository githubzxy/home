/**
 * 创建左中右构造器
 * @author qyy
 */
define('common/chooseExecuteUser/ChooseUserContainer',['bui/common','common/chooseExecuteUser/ChooseUser','common/chooseExecuteUser/OrganizationTree'],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,Form = require('bui/form');
	var CU = require('common/chooseExecuteUser/ChooseUser');
	var OrganizationTree = require('common/chooseExecuteUser/OrganizationTree');
	var ChooseUserContainer = Component.Controller.extend({
		initializer:function(){
			var _self = this,ls = _self.get('leftSize'),rs = _self.get('rightSize');
			var left = {xclass:'controller',elCls : 'span' + ls,children : _self._initLeftTree(),height : '100%'};
			var right = {xclass:'controller',elCls : 'span' + rs,children : _self._initRigthController() ,height : '100%'};
			
			_self.addChild(left);
			_self.addChild(right);
		},
		bindUI : function(){
			var _self = this,organizationTree = _self.get('organizationTree'),chooseUser = _self.get('chooseUser');
			var selectUserStore = chooseUser.getSelectUserStore();
			organizationTree.on('orgSelected',function(e){
				var param = {
						orgId: e.org.id	,
						name:null,
						orgType:null
				};
				 selectUserStore.load(param);
			 });
		},
		_initLeftTree:function(){
		var _self = this, leftController = [];
		var organizationTree = new OrganizationTree({
			 rootOrgId:_self.get('rootOrgId'),
			 url:_self.get('organizationTreeUrl'),
			 orgType:_self.get('orgType'),
	         autoHide: true,
	         align : {
	             points:['bl','tl']
	           },
	         width:210,
	         height:410
		});
		_self.set("organizationTree",organizationTree);
		leftController.push(organizationTree);
		return leftController;
	},
	_initRigthController:function(){
		 var _self = this,rightController = [];
		var chooseUser = new CU({
			 userIds:_self.get('userIds'),
			 contextPath:_self.get('contextPath'),
			 orgType:_self.get('orgType'),
			 selectType:_self.get('selectType'),
			 rightStoreUrl:_self.get('rightStoreUrl'),
			 leftStoreUrl:_self.get('leftStoreUrl'),
			 selectedWorkAreaUser:_self.get('selectedWorkAreaUser')
		});
		rightController.push(chooseUser);
		_self.set('chooseUser',chooseUser);
		return rightController;
	},
	getChooseUser:function(){
		var _self = this;
		return _self.get('chooseUser');
	},
	},{
		ATTRS:{
			elCls : {value : 'row-fluid'},
			leftSize : {value : 6},
			rightSize:{value : 18},
			userIds:{},
			contextPath : {},
			orgType:{},
			selectType:{},//选择人员的类型，选择的是派发人员，还是抄送人员,1-派发人员，2-抄送人员
			rightStoreUrl:{},
			leftStoreUrl:{},
			organizationTreeUrl:{},
			rootOrgId:{},
			selectedWorkAreaUser:{}
		}
	}
   );
	return ChooseUserContainer;
});