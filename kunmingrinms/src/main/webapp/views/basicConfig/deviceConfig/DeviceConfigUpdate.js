/**
*模块：应急/日常设备配置修改弹出窗
*创建人：lism
*创建时间：2017年10月12日
*/
define('views/basicConfig/deviceConfig/DeviceConfigUpdate',[
	'bui/common',
	'common/form/FormContainer',
	'bui/form',
	'common/data/PostLoad'
],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Form = r('bui/form'),
		PostLoad = r('common/data/PostLoad');
	var DeviceConfigUpdate = BUI.Overlay.Dialog.extend({
		
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		
		renderUI : function(){
			var _self = this;
			deviceConfig_type.listData("#deviceTypeUpdate");//加载设备类别下拉选数据
			var units = getExistUnitData();//获取所有单位
			unit_.listData(units,"#unitUpdate");//加载单位下拉选数据
			_self._showData();//显示选中项的数据
			_self._setRules();//加载验证规则
		},
		
		bindUI : function(){
			var _self = this;
			var field = _self.getChild('deviceConfigUpdate',true).get('common-formcontainer').getField('name');
			var typefield = _self.getChild('deviceConfigUpdate',true).get('common-formcontainer').getField('type');
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
//			绑定下拉选change事件
			$('#deviceTypeUpdate').on('change',function(e){
				field.clearErrors(false);
			});
			//绑定文本框change事件
			$('#deviceNameUpdate').on('change',function(e){
				console.log(1);
				typefield.clearErrors(false);
			})
			
		},
		
		/**
		 * 定义验证规则
		 */
		_setRules : function(){
			
			//自定义验证规则，备注内容限制字数
		      Form.Rules.add({
		          name : 'deviceNumber',  //规则名称
		          msg : '字数不能大于100个',//默认显示的错误信息
		          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
		            if(value.length>baseValue){
		            console.log(formatMsg);
		              return formatMsg;
		            }
		          }
		      });
			
		      Form.Rules.add({
		          name : 'device',  //规则名称
		          msg : "该设备类别下的这个设备已存在！",
		          validator : function(value,baseValue,formatMsg){ 
		        	if($("#hiddenDCName").val()==$("#deviceNameUpdate").val()&&$("#hiddenDCType").val()==$("#deviceTypeUpdate").val()){
		        		return;
		        	}
		          	$.ajax({
		          		url:contextPath + 'deviceConfigAction/checkName.cn',
		          		data:{
		          			"name" : $("#deviceNameUpdate").val(),
		    				"type" : $("#deviceTypeUpdate").val()
		          		},
		          		type:'post',
		          		cache : false,
		          		async: false,
		          		success:function(data){
		          			if(data!=""){
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
		 * 从后端获取数据并显示出来
		 */
		_showData : function(){
			var _self = this,selecId = _self.get('selectId');
			var postLoad =new PostLoad({
	    		url : contextPath + "deviceConfigAction/getDeviceConfigById.cn",
				el:'#deviceConfigUpdateDialog',
				loadMsg:'读取中...'
			}); 
	    	var data = {
	    			id : selecId
	    	};
			postLoad.load(data,function(result){
				$("#deviceNameUpdate").val(result.name);
				$("#deviceTypeUpdate").val(result.deviceCategory);
				$("#unitUpdate").val(result.unit);
				$("#hiddenDCName").val(result.name);
				$("#hiddenDCType").val(result.deviceCategory);
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
					item : '<select style="width:99%" name="type" id="deviceTypeUpdate" '+
							'data-rules="{required:true,device:true}"></select>'+
							'<input type="hidden" id="hiddenDCType">'+
							'<input type="hidden" id="hiddenDCName">'
				},{
					label : '单位：',
					redStarFlag : true,
					itemColspan : 1,
					item : '<select style="width:99%" name="unit" id="unitUpdate"></select>'
				},{
					label : '设备名称：',
					redStarFlag : true,
					itemColspan : 2,
					item : '<input type="text" style="width:99%" name="name" id="deviceNameUpdate"'+
						'data-rules="{required:true,device:true,deviceNumber:100}">'
				}
			];
			var form = new FormContainer({
				id : 'deviceConfigUpdate',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		},
	},{
		ATTRS : {
			id : {value : 'deviceConfigUpdateDialog'},
			title:{value:'修改设备'},
			contextPath : {},
			selectId : {},
			closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
            success:{
            	value : function(){
            		var _self = this,contextPath = _self.get('contextPath'),selectId = _self.get('selectId');
					var formUpdate = _self.getChild('deviceConfigUpdate');
					// 验证不通过
			    	if(!formUpdate.isValid()) {
			    		return ;
			    	};
            		//执行提交到数据库的方法
			    	var postLoad =new PostLoad({
			    		url : contextPath + "deviceConfigAction/updateDeviceConfig.cn",
						el:'#deviceConfigUpdateDialog',
						loadMsg:'保存中...'
					}); 
//			    	var data = {
//			    			"id" : selectId,
//							"name" : $("#deviceNameUpdate").val(),
//							"type" : $("#deviceTypeUpdate").val(),
//							"unit" : $("#unitUpdate").val()
//			    	};
			    	var data = formUpdate.serializeToObject();
			    	data.id = selectId;
			    	data.deviceCategory = parseInt(data.type);
			    	data.unit = parseInt(data.unit);
					postLoad.load(data,function(result){
						_self.fire("deviceConfigUpdateSave",{
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
					'deviceConfigUpdateSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return DeviceConfigUpdate;
});