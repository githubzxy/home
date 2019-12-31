/**
*模块：应急设备标准配置新增弹出窗
*创建人：lism
*创建时间：2017年10月12日
*/
define('views/basicConfig/deviceNormConfig/DeviceNormConfigAdd',[
	'bui/common',
	'common/form/FormContainer',
	'bui/form',
	'common/data/PostLoad',
],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Form = r('bui/form'),
		PostLoad = r('common/data/PostLoad');
	var DeviceNormConfigAdd = BUI.Overlay.Dialog.extend({
		
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		
		renderUI : function(){
			var _self = this;
			deviceNormConfig_type.listData("#deviceTypeAdd");//加载设备类别下拉选数据
			_self._showDeviceName();//获取设备名称下拉选数据，并且数据与设备类别联动
			//隐藏单选框里的第一个空白框
			$("select option[value='-1']").hide();
			_self._setRules();//加载验证规则
		},
		
		bindUI : function(){
			var _self = this;
			//定义按键
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
		
		/**
		 * 选择设备类别后加载设备名称
		 */
		_showDeviceName : function(){
			var _self = this;
			$('#deviceTypeAdd').change(function(e){
				if($('#deviceTypeAdd').val()){
					var typeId = $('#deviceTypeAdd').val();//设备类别选中项的值
					$("#deviceNameAdd option").remove();
					//通过设备类别查询设备名称
					var postLoad =new PostLoad({
			    		url : contextPath + "deviceNormConfigAction/getDeivceConfigByTypeId.cn",
					}); 
			    	var data = {
			    			typeId : typeId
			    	};
					postLoad.load(data,function(result){
						$("#deviceNameAdd").append("<option value='-1'></option>");
						$("#deviceNameAdd option[value='-1']").hide();
						for(var i = 0 ; i < result.length ; i++){
							var text = result[i].name;
							var value = result[i].id;
							$("#deviceNameAdd").append("<option value='"+value+"'>"+text+"</option>");
						}
					});
				}else{
					$("#deviceNameAdd option").remove();
					$("#deviceNameAdd").append("<option value='-1'></option>");
					$("#deviceNameAdd option[value='-1']").hide();
				}
			});
		},
		
		/**
		 * 定义验证规则
		 */
		_setRules : function(){
			var _self = this,contextPath = _self.get('contextPath');
			//自定义验证规则，选择框必须选值
	        Form.Rules.add({
	            name : 'select',  //规则名称
	            msg : '请选择',//默认显示的错误信息
	            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	              if(value==baseValue){
	                return formatMsg;
	              }
	            }
	        });
			
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
	    
	      Form.Rules.add({
	          name : 'norm',  //规则名称
	          validator : function(value,baseValue,formatMsg){ 
	          	$.ajax({
	          		url:contextPath + 'deviceNormConfigAction/checkNorm.cn',
	          		data:{
	          			"name": value
	          		},
	          		type:'post',
	          		cache : false,
	          		async: false,
	          		success:function(data){
	          			formatMsg = data;
	          		}
	          	});
	          	return formatMsg;
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
					redStarFlag : true,
					itemColspan : 1,
					item : '<select name="type" id="deviceTypeAdd" '+
							'data-rules="{select:-1}"><option value="-1"></option></select>'
				},{
					label : '设备名称：',
					itemColspan : 1,
					redStarFlag : true,
					item : '<select name="name" id="deviceNameAdd" style="width:208px"'+
							'data-rules="{required:true,norm:true,select:-1}"></select>'
				},{
					label : '指标值：',
					itemColspan : 2,
					redStarFlag : true,
					item : '<input type="text" style="width:99%" name="normValue" id="normValue" '+
							'data-rules="{required:true,number:true,num:20}">'
				},{
					label : '备注：',
					itemColspan : 2,
					item : '<textarea style="width:99%" name="remark" id="remarkAdd" '+
							'placeholder="最多输入150字" data-rules="{remark:150}"></textarea>'
				}
			];
			var form = new FormContainer({
				id : 'deviceNormConfigAdd',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		},
	},{
		ATTRS : {
			id : {value : 'deviceNormConfigAddDialog'},
			title:{value:'新增应急备品指标'},
			width : {value:625},
			contextPath : {},
			closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
            success:{
            	value : function(){
					var _self = this,contextPath = _self.get('contextPath');
					var formAdd = _self.getChild('deviceNormConfigAdd');
					// 验证不通过
			    	if(!formAdd.isValid()) {
			    		return ;
			    	};
			    	//执行提交到数据库的方法
			    	var postLoad =new PostLoad({
			    		url : contextPath + "deviceNormConfigAction/addDeviceNormConfig.cn",
						el:_self.get('el'),
						loadMsg:'保存中...'
					}); 
//			    	var data = {
//			    			"name" : $("#deviceNameAdd").val(),
//							"type" : $("#deviceTypeAdd").val(),
//							"normValue" : $("#normValue").val(),
//							"remark" : $("#remarkAdd").val()
//			    	};
			    	var data = formAdd.serializeToObject();
			    	data.normValue = parseFloat(data.normValue);
					postLoad.load(data,function(result){
							_self.fire("deviceNormConfigAddSave",{
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
					'deviceNormConfigAddSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return DeviceNormConfigAdd;
});