/**
 * 文件修改模块
 */
define('views/fileSystem/FileManagementUpdate',
		['bui/common','common/form/FormContainer',
			'views/fileSystem/SelectSuggest','bui/mask',
		'common/uploader/UpdateUploader','common/data/PostLoad','bui/form'],function(r){
	var BUI = r('bui/common'),
	FormContainer = r('common/form/FormContainer'),
	UpdateUploader = r('common/uploader/UpdateUploader');
	PostLoad = r('common/data/PostLoad'),
	Mask = r('bui/mask'),
	SelectSuggest = r('views/fileSystem/SelectSuggest'),
	Form = r('bui/form');
	var FileManagementUpdate = BUI.Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		//绑定事件
		bindUI : function(){
			var _self = this;
			_self._selectAutoFilling();
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
			_self.set('zIndex',1056);
		},
		//渲染表单控件
		renderUI : function(){
			var _self = this;
			_self._initUpdateData();
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
					  text:'关闭',
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
		//初始化修改的数据
		_initUpdateData:function(){
			var _self = this;
			var contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
			var postLoad =new PostLoad({
				url:contextPath +  'fileSystemAction/getDataById.cn',
				el:'',
				loadMsg:''
			}); 
	    	var data = {fileId : fileId};
			postLoad.load(data,function(result){
				$('#fileNameUpdate').val(result.fileName);
				$('#fileTypeUpdate').val(result.fileType);
				$('#fileSuitableRangeUpdate').val(result.fileSuitableRange);
				$('#fileValidTimeUpdate').val(result.fileValidTime);
				$('#fileNameId').val(fileId);
				var isDetailing;
				if(!result.isDetailing){
					isDetailing = 0;
				}else{
					isDetailing = 1;
				}
				$('#isDetailingUpdate').val(isDetailing);
				$('#remarkUpdate').val(result.remark);
				if(result.attachFile != null){//存在附件
					var uploadFiles = _self._initUploadFiles(result.attachFile.id);
					//初始化上传附件
					_self._initUploader(uploadFiles);
				}else{
					_self._initUploader("");
				}
			});
		},
		//初始化上传文件控件
		_initUploader:function(uploadFiles){
			var _self = this,contextPath = _self.get('contextPath');
			var updateUploader = new UpdateUploader({
				render: '#uploadFileUpdateDiv',
				alreadyItems : uploadFiles,
				url: contextPath + 'attachFile/upload.cn',
				isSuccess : function(result){
					return true;
				}
			});
			updateUploader.render();
			_self.set('updateUploader',updateUploader);
		},
		//获取上传文件数据(上传的)
		_getUploadFileData:function(){
			var _self = this,uploader = _self.get('updateUploader');
			var arr = new Array(); //声明数组,存储数据发往后台
			//获取上传文件的对列
			var fileArray = uploader.getSucFiles();
		 	for(var i in fileArray){
		    	var dto = new _self._UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
				arr[i] = dto; // 向集合添加对象
			};
			return arr;
		},
		//上传文件对象
		_UploadFileDto:function(name, path){
			 this.name = name;
			 this.path = path;
		 },
		 //根据附件ID,获取上传文件
		 _initUploadFiles:function(attachFileId){
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
		//初始化表单
		_initFormContainer:function(){
			var form = new FormContainer({
				id : 'fileUpdateForm',
				colNum : 2,
				formChildrens : [
					{
						label : '作业指导书名称',
						redStarFlag : true,
						itemColspan : 2,
						item : '<input type="text" name="fileName" id="fileNameUpdate" data-rules="{required:true}"/>'+
						'<input type="hidden" name="id" id="fileNameId" />'
					},{
						label: '专业类别',
						redStarFlag: true,
						itemColspan: 2,
						item: '<select name="fileType" id="fileTypeUpdate" data-rules="{required:true}"/>'
//						item: '<div   id="fileTypeUpdate" ></div>'
					},
					{
						label: '附件：',
						itemColspan: 2,
						item: '<div name="attachFileId" id="uploadFileUpdateDiv" style="height:100px;overflow-y:auto"/>'
					},{
						label: '备注：',
						itemColspan : 2,
						item :'<textarea name="remark" id="remarkUpdate" style="width:99.5%;height:100px;" data-rules="{maxlength:250}" placeholder="最多输入250字"/>'
					}
				]
			});
			return form;
		},
		/**
		 * 渲染专业类别
		 */
//		_renderProType : function(){
//			var _self = this,contextPath = _self.get('contextPath');
//			var suggest = new SelectSuggest({
//				render : '#fileTypeUpdate',//<div name="emsName" id="emsName" style="width: 191px;"></div>
//				name : 'fileType',
//				width : 230
//			});
//			_self.set('suggest',suggest);
//			
//			var postLoad = new PostLoad({
//				url : contextPath + 'fileSystemAction/getDistinctProTypeList.cn',
//			}); 
//			postLoad.load({}, function(emsNameList){
//				suggest.set('data', emsNameList);
//				suggest.render();
//				_self.fire("loadEnd");
//			});
//		},
		//实例化下拉框值数据
		_selectAutoFilling:function(){
			//初始化专业类别
    		technicalInfo_type.listData("#fileTypeUpdate");
			fileSystem_fileSuitableRange.listData("#fileSuitableRangeUpdate");
			fileSystem_fileValidTime.listData("#fileValidTimeUpdate");
			fileSystem_isDetailing.listData("#isDetailingUpdate");
		}
	},{
		ATTRS : {
			elAttrs : {value: {id:"fileUpdateDialog"}},
			title : {value : '作业指导书'},
			width : {value : 635},
			height : {value : 370},
			contextPath : {},
			fileId: {},
			closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
	        mask: {value: true},//非模态弹出框
	        success : {
	        	value : function(){
	        		var _self = this,contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
	        		var formUpdate = _self.getChild('fileUpdateForm',true);
//	        		var fileType = $("input[name='fileType']").val();
//	        		var data = _self.get("suggest").get("data");
//	        		var typeState = false;//设置专业类别的状态
//	        		data.forEach(function(e){
//	        			if(e instanceof Object){
//	        				if(e.text==fileType) typeState=true;
//	        			}else{
//	        				if(e==fileType) typeState=true;
//	        			}
//	        		});
			    	//当专业类别不存在时，验证不通过
//	        		if(!typeState){
//	        			Mask.maskElement('#fileUpdateDialog');						
//          				BUI.Message.Alert('请选择正确的专业类别',function(){
//                			Mask.unmaskElement('#fileUpdateDialog');
//                		},"warning");	
//          				$('.bui-message .bui-ext-close').hide();
////	        			$("input[name='fileType']").val("");
//	        			return;
//	        		}
	        		 // 验证不通过
			    	 if(!formUpdate.isValid()) {
			    		 return;
			    	 }
					 var data = formUpdate.serializeToObject();
					 // 获取上传文件
					 data.uploadFileArr = JSON.stringify(_self._getUploadFileData());
				     //执行提交到数据库的方法
				     var postLoad = new PostLoad({
							url : contextPath + 'fileSystemAction/updateRecord.cn',
							el : '#fileUpdateDialog',
							loadMsg : '保存中...'
						}); 
						postLoad.load(data, function(result){
							if(result != null){
								_self.fire("completeUpdateSave",{
									result : result
								});
							}
						});
	        	}
	        },
	        cancel:{
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
					'completeUpdateSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
	        }
		}
	});
	return FileManagementUpdate;
});