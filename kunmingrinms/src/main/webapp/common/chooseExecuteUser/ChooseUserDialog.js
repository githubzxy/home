define('common/chooseExecuteUser/ChooseUserDialog',['bui/common','bui/mask','bui/overlay','common/chooseExecuteUser/ChooseUserContainer'],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,Mask = require('bui/mask');
	var Overlay = require('bui/overlay');
	var CU = require('common/chooseExecuteUser/ChooseUserContainer');
	var ChooseUserDialog = Overlay.Dialog.extend({
		initializer:function(){
			var _self = this;
			_self.addChild(_self._initChooseUser());
		},
		bindUI : function () {
			var _self = this;
			var buttons = [
                {
                  text:'保存',
                  elCls : 'button',
                  handler : function(){
                	  var success = _self.get('success');
			            if(success){
			              success.call(_self);
			            }
                  }
                },{
                  text:'关闭',
                  elCls : 'button',
                  handler : function(){
                	  if(this.onCancel() !== false){
				        	this.close();
				        }
                  }
                }
              ];
			_self.set('buttons',buttons);
		},
		 /*
		  * 初始化人员选择组件
		  */
		 _initChooseUser:function(){
			 var _self = this;
			 var chooseUserContainer = new CU({
				 userIds:_self.get('userIds'),
				 contextPath:_self.get('contextPath'),
				 orgType:_self.get('orgType'),
				 selectType:_self.get('selectType'),
				 rightStoreUrl:_self.get('rightStoreUrl'),
				 leftStoreUrl:_self.get('leftStoreUrl'),
				 organizationTreeUrl:_self.get('organizationTreeUrl'),
				 rootOrgId:_self.get('rootOrgId'),
				 selectedWorkAreaUser:_self.get('selectedWorkAreaUser')
			 });
			 _self.set('chooseUser',chooseUserContainer.getChooseUser());
			 return chooseUserContainer;
		 }
		},
		{
		   ATTRS : {
			    closeAction : {
					value : 'destroy'
				},
				elCls : {value:'importDialog'},
				width:{value:870},
				height:{value:475},
				mask:{value:true},
				zIndex : {value:'1200'},
				buttons:{value:{
					
				}},
				title : {value : '人员选择'},
				success:{value:function(){
					var _self=this,chooseUser=_self.get('chooseUser'),data=chooseUser.getSelectUserData();
					//验证是否有人员导入
					if(data.length==0){
						Mask.maskElement('.importDialog');
						BUI.Message.Show({
							elCls : 'answerDiaInfo',
							closeable : false,
							msg : '请移入需要导入的人员！',
					        icon : 'info',
					        elStyle : {'z-index':2222},
					        buttons : [
					            {
					              text:'确认',
					              elCls : 'button button-primary',
					              handler : function(){
					                this.close();
					                Mask.unmaskElement('.importDialog');
					              }
					            },
					         ]
						});
          				return ;
					}
					_self.fire('sureBtn',{
						data:data
					});
				}},
				userIds:{value:""},
				contextPath : {},
				orgType:{},
				selectType:{},//选择人员的类型，选择的是派发人员，还是抄送人员,1-派发人员，2-抄送人员
				events:{
					value: {
		    			'sureBtn': true			
		    		}
				},
				rightStoreUrl:{value:"userAction/getGridUsersByIds.cn"},
				leftStoreUrl:{},
				organizationTreeUrl:{value:"/kunmingrinms/organization/getOrgAndFriend.cn"},
				rootOrgId:{value:"8affa073533aa3d601533bbef63e0010"},
				selectedWorkAreaUser:{value:"false"}//false_没有传递未选择的工区用户的默认值.车间可选择的工区执行人员
		   }
		}
		);
	return ChooseUserDialog;
});