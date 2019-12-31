/**
*模块：应急设备标准配置修改弹出窗
*创建人：lism
*创建时间：2017年10月13日
*/
define('views/basicConfig/deviceNormConfig/DeviceNormConfigUpdate',[
	'bui/common',
	'common/form/FormContainer',
	'bui/form',
	'common/data/PostLoad',
],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Form = r('bui/form'),
		PostLoad = r('common/data/PostLoad');
	var DeviceNormConfigUpdate = BUI.Overlay.Dialog.extend({
		
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		
		renderUI : function(){
			var _self = this;
			_self._showData();//显示数据
			_self._setRules();//加载验证规则
		},
		
		bindUI : function(){
			var _self = this;
			//定义按键
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
		 * 显示数据
		 */
		_showData : function(){
			var _self = this,contextPath = _self.get('contextPath'),selectId = _self.get('selectId');
			var postLoad =new PostLoad({
	    		url : contextPath + "deviceNormConfigAction/getDeviceNormConfigById.cn",
				el:'#deviceNormConfigUpdateDialog',
				loadMsg:'读取中...'
			}); 
	    	var data = {
	    			id : selectId
	    	};
			postLoad.load(data,function(result){
				$("#deviceNameUpdate").val(result.deviceName.name);
				$("#deviceTypeUpdate").val( deviceConfig_type.typeName(result.deviceName.deviceCategory));
				$("#normValueUpdate").val(result.normValue);
				$("#remarkUpdate").val(result.remark);
			});
		},
		
		/**
		 * 定义验证规则
		 */
		_setRules : function(){
			var _self = this,contextPath = _self.get('contextPath');
			
	      //自定义验证规则，备注内容限制字数
	      Form.Rules.add({
	          name : 'remark',  //规则名称
	          msg : '字数不能超过150个',//默认显示的错误信息
	          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	            if(value.length>baseValue){
	              return formatMsg;
	            }
	          }
	      });
	      
	      Form.Rules.add({
	          name : 'num',  //规则名称
	          msg : '输入数超出范围',//默认显示的错误信息
	          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	            if(value.length>baseValue){
	              return formatMsg;
	            }
	          }
	      });
	    
		},
		
		/**
		 * 初始化子控件FormContainer
		 */
		_initFormContainer : function(){
			var _self = this;
			var colNum = 2;
			var childs = [
				{
					label : '设备类别：',
					itemColspan : 1,
					item : '<input type="text" name="" id="deviceTypeUpdate" readOnly="readOnly" disabled="disabled">'
				},{
					label : '设备名称：',
					itemColspan : 1,
					item : '<input type="text" name="" id="deviceNameUpdate" readOnly="readOnly" disabled="disabled">'
				},{
					label : '指标值：',
					itemColspan : 2,
					redStarFlag : true,
					item : '<input type="text" style="width:99%" name="normValue" id="normValueUpdate" '+
							'data-rules="{required:true,number:true,num:20}">'
				},{
					label : '备注：',
					itemColspan : 2,
					item : '<textarea style="width:99%" name="remark" id="remarkUpdate" '+
							'placeholder="最多输入150字" data-rules="{remark:150}"></textarea>'
				}
			];
			var form = new FormContainer({
				id : 'deviceNormConfigUpdate',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		},
	},{
		ATTRS : {
			id : {value : 'deviceNormConfigUpdateDialog'},
			title:{value:'修改应急备品指标'},
			width : {value:625},
			contextPath : {},
			selectId : {},
			closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
            success:{
            	value : function(){
					var _self = this,contextPath = _self.get('contextPath'),selectId = _self.get('selectId');
					var updateForm = _self.getChild('deviceNormConfigUpdate');
					// 验证不通过
			    	if(!updateForm.isValid()) {
			    		return ;
			    	};
			    	//执行提交到数据库的方法
			    	var postLoad =new PostLoad({
			    		url : contextPath + "deviceNormConfigAction/updateDeviceNormConfig.cn",
						el:_self.get('el'),
						loadMsg:'保存中...'
					}); 
//			    	var data = {
//			    			"id" : selectId,
//							"normValue" : $("#normValueUpdate").val(),
//							"remark" : $("#remarkUpdate").val()
//			    	};
			    	var data = updateForm.serializeToObject();
			    	data.normValue = parseFloat(data.normValue);
			    	data.id = selectId;
					postLoad.load(data,function(result){
							_self.fire("deviceNormConfigUpdateSave",{
								result : result
						})
					});
			    }
            },
            cancel : {
				value : function(){
					var _self = this;
					_self.fire("close");
				}
			},
			events : {
				value : {
					/**
					 * 绑定保存按钮事件
					 */
					'deviceNormConfigUpdateSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return DeviceNormConfigUpdate;
});