/**
 * 批量导入停机要点计划模块
 */
define('views/commNetStop/stopPlan/StopPlanImport',[
											'bui/overlay',
											'common/form/FormContainer'
											],function(require){
	var Overlay = require('bui/overlay'),
	FormContainer = require('common/form/FormContainer');
	var StopPlanImport = Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			var stopForm = _self._getForm();
			_self.addChild(stopForm);
		},
        //绑定事件
		bindUI : function(){
			var _self = this;
			_self.downLoadTemplate();
		},
		renderUI : function(){
			var _self = this;
			var buttons = [
				{
					text:'保存',
					elCls:'button',
					handler : function(){
			            	var success = _self.get('success');
				            if(success){
				              success.call(_self);
				            }
					}
				},
				{
					  text:'取消',
					  elCls : 'button',
					  handler : function(dialog,btn){
					        if(this.onCancel() !== false){
					        	this.close();
					        }
					  }
				}
			];
			_self.set('buttons',buttons);
		},
		/**
		 * 获取表单数据
		 */
		_getForm : function(){
			var form = new FormContainer({
				id : 'stopPlanImportForm',
				colNum : 1,
				formChildrens : [  //表单元素
					{
						label : '标准模板',
						itemColspan : 1,
						item : '<input class="button button-small" id="downLoadTemplate" type="button" value="停机计划模板下载" style="width:50%;height:30px">'
							+ '<span style="color:red;width:50%;height:30px;text-align: center;float:right;line-height: 30px;" >注：请按停机计划模板导入</span>'
							+ '<input type="hidden" id="perId" name="perId"/>'
					},
					{
						label : '附件',
						redStarFlag : true,
						item : '<input type="file" id="importFile" name="myFile" style="height:60px;width:100%" />'
					},
				]
			});
			return form;
		},
		/**
		 * 下载模板方法
		 */
		downLoadTemplate : function(){
			var _self = this,contextPath = _self.get('contextPath');
			$("#downLoadTemplate").on('click',function(){
				window.location.href = contextPath + 'Template/stopPlanTemplate.xls';
			});
		},
		/**
         * 文件名验证
         */
        fileValidate : function(fileObj){ 
        	var flag = true;
        	// 上传文件不能为空，格式必须为xsl和xlsx
        	var filepath = fileObj.val(); 
        	//验证时否为空
        	if( filepath == undefined || $.trim(filepath) == "" ){
        		$(".bui-ext-mask").addClass("fileMask");// 添加遮罩层
        		BUI.Message.Alert('请选择文件进行上传！',function(){
        			$(".bui-ext-mask").removeClass("fileMask");// 移除遮罩层
        		});
        		flag = false; 
        	}else{ 
        		//验证最后一个后缀是否是Excel文件
        		var fileArr = filepath.split("\\"); 
        		var fileTArr = fileArr[fileArr.length-1].toLowerCase().split("."); 
        		var filetype = fileTArr[fileTArr.length-1]; 
        		if(filetype != "xls" && filetype != "xlsx"){
        			$(".bui-ext-mask").addClass("fileMask");// 添加遮罩层
        			BUI.Message.Alert('上传文件必须为Excel文件！',function(){
            			$(".bui-ext-mask").removeClass("fileMask");// 移除遮罩层
            		});
        			flag = false; 
        		}
        	}
        	//返回验证标记
        	return flag;
        }
	},{
		ATTRS : {//定义弹框属性
			title : {value : '导入停机要点计划'},
			width : {value : 650},
			height : {value : 160},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			perId : {},
			closeAction : {
				value : 'destroy'
			},
			success : {
				value : function(){
					var _self = this,contextPath = _self.get('contextPath'),perId = _self.get('perId');
					// 验证上传文件,通过则将form提交
					if(_self.fileValidate($('#importFile'))){
						// 设置Ation,提交路径
						$('#formContainer').attr('action', contextPath + 'commNetStopAction/importData.cn');
						// 设置method,提交方式
						$('#formContainer').attr('method', 'post');
						// 设置enctype,编码方式
						$('#formContainer').attr('enctype', 'multipart/form-data');
						
						$('#formContainer #perId').val(perId);
						$("#formContainer").submit();
					}
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
					'completeImport' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return StopPlanImport;
});