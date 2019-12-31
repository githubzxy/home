/**
 * 新增机构模块
 */
define('views/emergencyOrg/LeftOrgTreeAdd',[
	'bui/overlay','common/form/FormContainer','bui/form','common/data/PostLoad'
	],function(r){
	var Overlay=r('bui/overlay'),
	Form = r('bui/form'),
	FormContainer = r('common/form/FormContainer'),
	PostLoad = r('common/data/PostLoad');
	var LeftOrgTreeAdd = Overlay.Dialog.extend({
		initializer : function(){
			var _self=this;	
			_self.addChild(_self._getForm());
		},
		renderUI: function(){
			var _self = this;
			//自定义验证规则，限制字数
	        Form.Rules.add({
	            name : 'orgName',  //规则名称
	            msg : '字数不能超过10个',//默认显示的错误信息
	            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	              if(value.length>baseValue){
	                return formatMsg;
	              }
	            }
	        });
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
		_getForm: function(){
			var _self=this;
			var form = new FormContainer({
				id:'orgAddForm',
				colNum:2,
			    formChildrens:[
			    	{
				    	label:'机构名称',
			    		redStarFlag : true,
			    		itemColspan : 2,
			    		item:'<input type="text" name="orgNameAdd" id="orgNameAdd" data-rules="{required:true,orgName:10}" style="width:99.5%"/>'
			    	}
			    ]
			});
			return form;
		}
	},{
		ATTRS : {
			id: {value:'treeAddDialog'},
			title : '新增子机构',
			width : 300,
			height : 96,
			orgId:{},//选中节点的id
			contextPath:{},
			closeAction : {value : 'destroy'},//关闭时销毁加载到主页面的HTML对象
			mask : true,
			success: {
				value: function(){
					var _self=this,
					addOrgForm=_self.getChild('orgAddForm');
					// 表单验证
					if(!addOrgForm.isValid()) {
						return ;
					}
					var orgName = $("#orgNameAdd").val();
//					var orgName = addOrgForm.serializeToObject();
					var param = {
						name: orgName,
						orgId : _self.get('orgId')
					};
//					var postLoad = new PostLoad({
//						url : contextPath + 'emergencyOrgAction/addOrg.cn',
//						el : '#treeAddDialog',
//						loadMsg : '保存中...'
//					}); 
//					
//					postLoad.load(param, function(result){
//						if(result != null){
//							_self.fire("saveAddOrgBtn",{
//								result : result
//							});
//						}
//					});
					$.ajax({
						url : contextPath + 'emergencyOrgAction/addOrg.cn',
						type : "post",
						data: param,
						success : function(result,status){
							_self.fire("saveAddOrgBtn",{
								status : status})
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
					'saveAddOrgBtn' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
	    	}
		}
	});
	return LeftOrgTreeAdd;
});