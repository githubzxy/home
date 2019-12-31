/**
*模块：应急设备标准配置新增弹出窗
*创建人：lism
*创建时间：2017年10月12日
*/
define('views/basicConfig/deviceUnitConfig/DeviceUnitConfigAdd',[
	'bui/common',
	'common/form/FormContainer',
	'bui/form',
	'common/data/PostLoad',
],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Form = r('bui/form'),
		PostLoad = r('common/data/PostLoad');
	var DeviceUnitConfigAdd = BUI.Overlay.Dialog.extend({
		
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		
		renderUI : function(){
			var _self = this;
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
			var _self = this;
			//自定义验证规则，备注内容限制字数
		      Form.Rules.add({
		          name : 'unit',  //规则名称
		          msg : '字数不能超过10个',//默认显示的错误信息
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
			var colNum = 1;
			var childs = [
				{
					label : '单位名称：',
					redStarFlag : true,
					itemColspan : 1,
					item : '<input name="unit" type="text" id="unit" style="width:99%" data-rules="{required:true,unit:10}"/>'
				}
			];
			var form = new FormContainer({
				id : 'deviceUnitConfigAdd',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		},
	},{
		ATTRS : {
			id : {value : 'deviceUnitConfigAddDialog'},
			title:{value:'新增应急备品单位'},
			width : {value:400},
			contextPath : {},
			closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
            success:{
            	value : function(){
					var _self = this,contextPath = _self.get('contextPath');
					var formAdd = _self.getChild('deviceUnitConfigAdd');
					// 验证不通过
			    	if(!formAdd.isValid()) {
			    		return ;
			    	};
			    	//执行提交到数据库的方法
			    	var postLoad =new PostLoad({
			    		url : contextPath + "deviceUnitConfigAction/addDeviceUnitConfig.cn",
						el:_self.get('el'),
						loadMsg:'保存中...'
					}); 
//			    	var data = {
//			    			"unit" : $("#unit").val(),
//			    	};
			    	var data = formAdd.serializeToObject();
					postLoad.load(data,function(result){
							_self.fire("deviceUnitConfigAddSave",{
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
					'deviceUnitConfigAddSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return DeviceUnitConfigAdd;
});