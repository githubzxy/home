/**
 * 修改机构模块
 */
define('views/emergencyOrg/LeftOrgTreeUpdate',[
	'bui/overlay','common/form/FormContainer',
	'bui/form','common/data/PostLoad'],function(r){
	var Overlay=r('bui/overlay'),
	Form = r('bui/form'),
	PostLoad = r('common/data/PostLoad'),
	FormContainer = r('common/form/FormContainer');
	var LeftOrgTreeUpdate = Overlay.Dialog.extend({
		initializer : function(){
			var _self=this;	
			_self.addChild(_self._getForm());
		},
		renderUI: function(){
			var _self=this;
			_self._initUpdateData();
			//自定义验证规则，限制字数
	        Form.Rules.add({
	            name : 'newName',  //规则名称
	            msg : '字数不能超过10个',//默认显示的错误信息
	            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	              if(value.length>baseValue){
	                return formatMsg;
	              }
	            }
	        });
		},
		bindUI: function(){
			var _self=this;
			var buttons = [
				 {
	                  text:'修改',
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
		/**
		 * 初始化修改的数据
		 */
		_initUpdateData: function(){
			var _self = this,contextPath = _self.get('contextPath'),orgId = _self.get('orgId');
			var postLoad =new PostLoad({
				url:contextPath + 'emergencyOrgAction/getOrgDataById.cn',
				el:'#treeUpdateDialog',
			}); 
	    	var data = {id : orgId};
	    	postLoad.load(data,function(result){
	    		$('#orgNameUpdate').val(result.name);
	    	});
		},
		_getForm : function(){
			var _self=this;
			var form = new FormContainer({
				id:'orgUpdateForm',
				colNum:2,
			    formChildrens:[
			    	{
				    	label:'机构名称',
			    		redStarFlag : true,
			    		itemColspan : 2,
			    		item:'<input type="text" name="orgNameUpdate" id="orgNameUpdate" data-rules="{required:true,newName:10}" style="width:99.5%"/>'
			    	}
			    ]
			});
			return form;
		}
	},{
		ATTRS : {
			id: {value:'treeUpdateDialog'},
			title : '修改机构名称',
			width : 300,
			height : 96,
			orgId:{},//选中节点的id
			contextPath:{},
			closeAction : {value : 'destroy'},//关闭时销毁加载到主页面的HTML对象
			mask : true,
			success: {
				value: function(){
					var _self=this,
					updateOrgForm=_self.getChild('orgUpdateForm');
					// 表单验证
					if(!updateOrgForm.isValid()) {
						return;
					}
					var orgName = $('#orgNameUpdate').val();
//					var orgName = updateOrgForm.serializeToObject();
					var param = {
						name : orgName,
						orgId : _self.get('orgId')
					};
					$.ajax({
						url : contextPath + 'emergencyOrgAction/updateOrg.cn',
						type : 'post',
						data: param,
						success : function(result,status){
							_self.fire("saveUpdateOrgBtn",{status : status})
						}
					});
				}
			},
			cancel: {
	        	value: function(){
	        		var _self = this;
	        		_self.fire('close');
	        	}
	        },
	        events:{
				value : {
					/**
					 * 绑定保存按钮事件
					 */
					'saveUpdateOrgBtn' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
	    	}
		}
	});
	return LeftOrgTreeUpdate;
});