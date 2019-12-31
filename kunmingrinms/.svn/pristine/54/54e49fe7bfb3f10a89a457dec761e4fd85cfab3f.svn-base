/**
*模块：应急/日常设备配置新增弹出窗
*创建人：lism
*创建时间：2017年10月11日
*/
define('views/basicConfig/deviceConfig/DeviceConfigAdd',[
	'bui/common',
	'common/form/FormContainer',
	'bui/form',
	'common/data/PostLoad',
],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Form = r('bui/form'),
		PostLoad = r('common/data/PostLoad');
	var DeviceConfigAdd = BUI.Overlay.Dialog.extend({
		
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		
		renderUI : function(){
			var _self = this;
			deviceConfig_type.listData("#deviceTypeAdd");//加载设备类别下拉选数据
			var units = getExistUnitData();//获取所有单位
			unit_.listData(units,"#unitAdd");//加载单位下拉选数据
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
		 * 定义验证规则
		 */
		_setRules : function(){
			//自定义验证规则，选择框必须选值
	        Form.Rules.add({
	            name : 'select1',  //规则名称
	            msg : '请选择一个设备类别',//默认显示的错误信息
	            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	              if(value==baseValue){
	                return formatMsg;
	              }
	            }
	        });
			//自定义验证规则，选择框必须选值
	        Form.Rules.add({
	            name : 'select2',  //规则名称
	            msg : '请选择',//默认显示的错误信息
	            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	              if(value==baseValue){
	                return formatMsg;
	              }
	            }
	        });
			
	      //自定义验证规则，备注内容限制字数
	      Form.Rules.add({
	          name : 'deviceNumber',  //规则名称
	          msg : '字数不能超过100个',//默认显示的错误信息
	          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	            if(value.length>baseValue){
	              return formatMsg;
	            }
	          }
	      });
	      
	      //重名验证规则
	      Form.Rules.add({
	          name : 'device',  //规则名称
	          validator : function(value,baseValue,formatMsg){ 
	          	$.ajax({
	          		url:contextPath + 'deviceConfigAction/checkName.cn',
	          		data:{
	          			"name" : $("#deviceNameAdd").val(),
	    				"type" : $("#deviceTypeAdd").val()
	          		},
	          		type:'post',
	          		cache : false,
	          		async: false,
	          		success:function(data){
	          			if(data){
	          				formatMsg = "该设备类别下的这个设备已存在！";
	          			}else{
	          				formatMsg= "";
	          			}
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
					item : '<select style="width:99%" name="type" id="deviceTypeAdd" data-rules="{required:true,device:true,select1:-1}"></select>'
				},{
					label : '单位：',
					itemColspan : 1,
					redStarFlag : true,
					item : '<select style="width:99%" name="unit" id="unitAdd" data-rules="{required:true,select2:-1}"><option value="-1"></option></select>'
				},{
					label : '设备名称：',
					itemColspan : 2,
					redStarFlag : true,
					item : '<input type="text" style="width:99%" name="name" id="deviceNameAdd" data-rules="{required:true,device:true,deviceNumber:100}">'
				}
			];
			var form = new FormContainer({
				id : 'deviceConfigAdd',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		},
	},{
		ATTRS : {
			id : {value : 'deviceConfigAddDialog'},
			title:{value:'新增设备'},
			contextPath : {},
			closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
            success:{
            	value : function(){
					var _self = this,contextPath = _self.get('contextPath');
					var formAdd = _self.getChild('deviceConfigAdd');
					// 验证不通过
			    	if(!formAdd.isValid()) {
			    		return ;
			    	};
			    	//执行提交到数据库的方法
			    	var postLoad =new PostLoad({
			    		url : contextPath + "deviceConfigAction/addDeviceConfig.cn",
						el:'#deviceConfigAddDialog',
						loadMsg:'保存中...'
					}); 
//			    	var data = {
//			    			"name" : $("#deviceNameAdd").val(),
//							"type" : $("#deviceTypeAdd").val(),
//							"unit" : $("#unitAdd").val()
//			    	};
			    	var data = formAdd.serializeToObject();
			    	data.deviceCategory = parseInt(data.type);
			    	data.unit = parseInt(data.unit);
					postLoad.load(data,function(result){
							_self.fire("deviceConfigAddSave",{
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
					'deviceConfigAddSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return DeviceConfigAdd;
});