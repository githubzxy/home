/**
 * 停机计划回复
 */
define('views/commNetStop/stopPlan/StopPlanReply',//定义依赖关系
		['bui/overlay','common/form/FormContainer',
			'common/uploader/UpdateUploader','common/uploader/ViewUploader'],
		function(require){
	var Overlay = require('bui/overlay'),
	FormContainer = require('common/form/FormContainer'),
	UpdateUploader = require('common/uploader/UpdateUploader');
	ViewUploader = require('common/uploader/ViewUploader');
	var StopPlanReply = Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			var replyForm = _self._getForm();
			_self.addChild(replyForm);
		},
		//绑定弹框事件
		bindUI : function(){
			
		},
		//渲染弹框
		renderUI : function(){
			var _self = this;
			var buttons=[
					{
						text : '完成',
						elCls : 'button btn-finish',
						handler : function(){
							var _self = this;
							success = _self.get('successFinish');
				            if(success){
				            	success.call(_self);
				            }
						}
					},
					{
						text : '未完成',
						elCls : 'button btn-unfinish',
						handler : function(){
							var _self = this;
							success = _self.get('successUnfinish');
				            if(success){
				            	success.call(_self);
				            }
						}
					},
					{
						text : '取消',
						elCls : 'button ',
						handler : function(){
							_self.close();
						}
					}
				];
			//将buttons设置为表单属性，以此覆盖原来的buttons属性
			_self.set('buttons',buttons);
			//渲染表单的上传文件控件
			_self._initReplyUploader();
			//回显批复附件详情
			_self._initShowData();
			
		}, 
		/**
		 * 获取上传文件数据(上传的)
		 */
		getUploadFileData : function(){
			var _self = this,uploader = _self.get('replyUploader');
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
		//获取上传文件数据(上传的)
		_initShowData : function(){
			var _self = this,contextPath = _self.get('contextPath'),stopPlanId = _self.get('stopPlanId');
			var examinFiles = "";// 批复附件
			$.ajax({
				url : contextPath + 'commNetStopAction/getCommNetStopById.cn',
				data : {
					id : stopPlanId
				},
				type : 'POST',
				dataType : 'JSON',
				async : false,
				success : function(result){
					var data = result.data;
					if(data.examinFile != null){//初始化批复附件
						var uploadFiles = _self._initUploadFiles(data.examinFile.id);
						examinFiles = uploadFiles;
					}
				}
				
			});
			var examinFiles = new ViewUploader({
				render: '#examinFilesShow',
				alreadyItems : examinFiles
			});
			examinFiles.render();
		},
		/**
		 * 根据附件ID,获取上传文件
		 * @param attachFileId 附件ID
		 */
		_initUploadFiles : function(attachFileId){
			var _self = this,contextPath = _self.get('contextPath');
			var uploadFiles = ""; 
			$.ajax({
				url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
				type : 'POST',
				dataType : 'JSON',
				async : false,
				data : {
					 attachFileId : attachFileId
				},
				success : function(data){
					uploadFiles = data;
				}
		   });
		   return uploadFiles;
		},
		/**
		 * 初始化上传文件控件。
		 */
		_initReplyUploader : function(uploadFiles){
			var _self = this,contextPath = _self.get('contextPath');
			var replyUploader = new UpdateUploader({
				render : '#replyUploader',
				alreadyItems : uploadFiles,
				url : contextPath + 'attachFile/upload.cn',
				isSuccess : function(result){
					return true;
				}
			});
			replyUploader.render();
			//将replyUploader设置为表单属性
			_self.set('replyUploader',replyUploader);
		},   
		_getForm : function(){
			var form = new FormContainer({
				id : 'stopPlanReplyForm',
				formChildrens : [
					{
						label : '批复附件',
						item : '<div id="examinFilesShow" style="height:60px;width:100%;"></div>'
					},
					{
						label : '完成情况',
						redStarFlag : true,
						item : '<input type="text" id="situationCaptionReply" style="height:60px;width:99%;" data-rules="{required : true}" ></input>'
					},
					{
						label : '回复附件',
						item : '<div id="replyUploader" style="height:60px;width:100%;"></div>'
					}
				]
			});
			return form;
		},
		_postMethod : function(status){
			console.log(status);
			var _self = this;
			var form = _self.getChild('stopPlanReplyForm');
			if(!form.isValid()) {//表单验证
				return ;
			}							
			var arr=_self.getUploadFileData();//获取回复附件信息
			var paramReply={//获取参数
				id:_self.get('stopPlanId'),
				situationCaption:$("#situationCaptionReply").val(),
				state:status
				};
			_self
			$.post(contextPath + 'commNetStopAction/replyCommNetStop.cn', 
					{ 
						paramReply: JSON.stringify(paramReply),
						replyArr:JSON.stringify(arr)
					},
					function(result){
						if(result!=null){
							_self.fire("replyBtn",{
								result : result
							});
						}
					});
		}		
	},{
		//设置弹框属性
		ATTRS : {
			title : {value : '停机要点计划回复'},
			width : {value : 650},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			stopPlanId : {},
			closeAction : {
				value : 'destroy'
			},
			events : {
				value : {
					'replyBtn':true
				}
			},
			successFinish:{
				value:function(){
					var _self=this;
					var status = commNetworkStop_old_status.finish;//点击完成按钮，状态设置为：完成
					_self._postMethod(status);
				}
			},
			//点击未完成按钮的事件方法
			successUnfinish:{
				value:function(){
					var _self=this;
					var status = commNetworkStop_old_status.unfinish;//点击未完成按钮，状态设置为：未完成
					_self._postMethod(status);
				}
			}
			
		}
	});
	return StopPlanReply;
})