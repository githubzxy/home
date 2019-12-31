/**
 * 审核模块
 */
define('views/commNetStop/stopExamine/StopExamine',[
	                                   'bui/overlay','bui/uploader',
	                                   'common/form/FormContainer'],function(require){
	var Overlay = require('bui/overlay'),
	Uploader = require('bui/uploader'),
	FormContainer = require('common/form/FormContainer');
	var StopExamine = Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			var examineForm = _self._getForm();
			_self.addChild(examineForm);
		},
		//渲染弹框控件
		renderUI : function(){
			var _self = this;
			//设置表单id的值为选中项id
			$('#id').val(_self.get('stopExamineId'));
			//重置按钮
			var buttons = [
				{
					text:'审核',
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
			//渲染上传文件控件
			_self._initUploader();
		},
		//绑定事件
		bindUI : function(){
			
		},
		/**
		 * 上传文件控件
		 */
		_initUploader : function(){
			var _self = this,contextPath = _self.get('contextPath');
			Uploader.Theme.addTheme('uploadView', {//自定义附件组件的显示主题
				elCls: 'defaultTheme',
				queue:{
					//结果的模板，可以根据不同状态进进行设置
					resultTpl: {
						'default': '<div class="default">{name}</div>',
						'success': '<div class="success"><label class="fileLabel" href="#" title={name}>{name}</label></div>',
						'error': '<div class="error"><span title="{name}">上传失败,请确保文件是非空文件后，点击删除，再重新上传!</span><span class="uploader-error">{msg}</span></div>',
						'progress': '<div class="progress"><div class="bar" style="width:{loadedPercent}%"></div></div>'
					}
				}
			});
			// 上传附件
			var uploader = new Uploader.Uploader({
		        render : '#uploadDiv',
		        theme : 'uploadView', //使用自定义主题
		        url : contextPath + 'attachFile/upload.cn',
		        isSuccess : function(result){
					return true;
		        }
		    });
			uploader.render();
			_self.set('uploader',uploader);
		},
		/**
		 * 获取上传文件数据(上传的)
		 */
		_getUploadFileData : function(){
			var _self = this,uploader = _self.get('uploader');
			var arr = new Array(); //声明数组,存储数据发往后台
			//获取上传文件的对列
			var fileArray = uploader.get("queue").getItems();
		 	for(var i in fileArray){
		    	var dto = new _self.UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
				arr[i] = dto; // 向集合添加对象
			};
			return arr;
		 },
		 /**
		  * 声明上传文件对象
		  * @param name 上传文件名
		  * @param path 上传文件路径
		  */
		 UploadFileDto : function(name, path){
			 this.name = name;
			 this.path = path;
		 },
		/**
		 * 获取表单
		 */
		_getForm : function(){
			var form = new FormContainer({
				id : 'StopExamineId',
				colNum : 2,
				formChildrens : [
					{
						label : '方案审批编号',
						redStarFlag : true,
						itemColspan : 2,
						item : '<input type="text" name="planExaminNum" id="planExaminNumCheck" data-rules="{required:true,maxlength:50}"  style="width:99%;height:30px">'+
						       '<input type="hidden" name="id" id="id"/>'
					},
					{
						label : '月度计划审批编号',
						redStarFlag : true,
						itemColspan : 2,
						item : '<input type="text" name="monthPlanExamin" id="monthPlanExaminCheck" data-rules="{required:true,maxlength:50}"  style="width:99%;height:30px">'
					},
					{
						label : '昆铁施工台计划号',
						redStarFlag : true,
						itemColspan : 2,
						item : '<input type="text" name="executionPlanNum" id="executionPlanNumCheck"  data-rules="{required:true,maxlength:50}"  style="width:98%;height:30px">'
					},
					{
						label : '审核附件',
						redStarFlag : false,
						itemColspan : 2,
						item : '<div id="uploadDiv" style="width:100%;height:80px"></div>'
					}
				]
			});
			return form;
		}
		
	},{
		ATTRS : {
			title : {value : '停机要点计划审核'},
			width : {value : 620},
			heigth : {value : 241},
			closeAction : {value : 'destroy'},
			mask : {value : true},
			contextPath : {},
			stopExamineId : {},
			success : {value : function(){
				var _self = this,contextPath = _self.get('contextPath'),id = _self.get('stopExamineId');
				var form = _self.getChild('StopExamineId');
				//验证不通过
				if(!form.isValid()){
					return;
				}
				//序列化表单成对象，所有的键值都是字符串
		    	var data = form.serializeToObject();
		    	// 获取上传文件
		    	var uploadArr = _self._getUploadFileData();
		    	var param = {
		    			checkData : JSON.stringify(data),
		    			checkArr : JSON.stringify(uploadArr)
		    	};
		    	$.post(contextPath +'commNetStopAction/checkCommNetStop.cn',param,function(result){
		    		_self.fire("examine",{
		    			result : result
		    		});
		    	});
			}},
			cancel : {value : function(){
					var _self = this;
					_self.fire("close");
				}},
			events : {value : {
					'examine' : true,
					'close' : true
				}
			}
		}
	});
	return StopExamine;
});