/**
*值班情况汇报弹出窗模块
*/
define('views/home/DutyReturn',['bui/common',
	'common/data/PostLoad','bui/form','common/form/FormContainer',
	'bui/data',],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		PostLoad = r('common/data/PostLoad'),
		Form = r('bui/form'),
		Data = r('bui/data');
	var DutyReturn = BUI.Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI : function(){
			var _self = this,contextPath = _self.get('contextPath');
			//回显数据
			_self._initData();			
		},
		bindUI : function(){
			var _self = this;
			//定义按键
			var buttons = [{
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
              }];
			_self.set('buttons',buttons);
		},	
		/**
		 * 回显数据
		 */
		_initData : function () {
			var _self = this,param = _self.get('params');
			$("#dutyDepart").val(param.dutyDepart);
	    	$("#dutyUser").val(param.dutyUser);
	    	$("#ondutyDate").val(param.dutyDate);
	    	$("#dutyday").val(param.dutyDay);
		},		
		/**
		 * 初始化表单容器FormContainer
		 */
		_initFormContainer : function(){
			var _self = this;
			var colNum = 2;
			var childs = [
				{
					label : '所属部门：',
					itemColspan : 1,
					item : '<input id="dutyDepart" type="text" disabled="disabled" />'
				},{
					label : '值班人：',
					itemColspan : 1,
					item : '<input id="dutyUser" type="text"   disabled="disabled"/>'
				},{
					label : '值班日期：',
					itemColspan : 1,
					item : '<input id="ondutyDate" type="text" disabled="disabled" />'
				},{
					label : '星期：',
					itemColspan : 1,
					item : '<input id="dutyday" type="text"  disabled="disabled"/>'
				},{
					label : '汇报内容：',
					redStarFlag : true,
					itemColspan : 2,
					item : '<textarea  id="dutyContent" style="width:99%;height:100px;" data-rules="{required : true}"></textarea>'
				}
			];
			var form = new FormContainer({
				id : 'dutyReturn',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		},
	},{
		ATTRS : {
			id : {value : 'dutyDialog'},
			title:{value:'值班情况汇报'},
            width:{value:620},
            height:{value:268},
            contextPath : {},
            params :{},
            closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
            success:{
            	value : function(){
            		var _self = this,contextPath = _self.get('contextPath');
					var form = _self.getChild('dutyReturn');
					if(!form.isValid()) {
						return ;
					}
				    var dutyId = _self.get('params').dutyId;
       				var content = $("#dutyContent").val();
       				var postLoad =new PostLoad({
						url:contextPath +  'homeAction/updateOnDuty.cn',
						el:'#dutyDialog',
						loadMsg:'保存中...'
					}); 			    	
					postLoad.load({dutyId : dutyId , content : content},function(result){
							_self.fire("dutyReturnSave",{
								result : result
						})
					});
			    }
            },
			events : {
				value : {
					'dutyReturnSave' : true
				}
			}
		}
	});
	return DutyReturn;
});