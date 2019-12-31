/**
 * 文件修改模块
 */
define('views/technical/TechnicalAccountPageNewUpdate',
		['bui/common','common/form/FormContainer',
		'common/uploader/UpdateUploader','common/data/PostLoad','bui/form'],function(r){
	var BUI = r('bui/common'),
	FormContainer = r('common/form/FormContainer'),
	UpdateUploader = r('common/uploader/UpdateUploader');
	PostLoad = r('common/data/PostLoad'),
	Form = r('bui/form');
	var TechnicalAccountPageNewUpdate = BUI.Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		//渲染表单控件
		renderUI : function(){
			var _self = this;
			_self._initUpdateData();
			_self._selectAutoFilling();
			_self._initBtn();
		},
		//初始化保存关闭按钮
		_initBtn : function(){
			var _self = this;
			var buttons = [
				{
					text:'保存',
					elCls:'button',
					handler : function(){
						_self._saveData();
					}
				},
				{
					text:'关闭',
					elCls : 'button',
					handler : function(dialog,btn){
					    _self.close();
					}
				}
			];
			_self.set('buttons',buttons);
		},
		//初始化修改的数据
		_initUpdateData:function(){
			var _self = this,contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
			var postLoad = new PostLoad({
				url : contextPath + 'technicalAccountAction/getTechnicalAccountById.cn',
				el : '#fileUpdateDialog',
				loadMsg : '保存中...'
			}); 
			var data={id : fileId};
			postLoad.load(data, function(result){
				if(result != null){
					$('#accountNameUp').val(result.name);
					$('#dataTypeUp').val(result.type);
					$('#place').val(result.address);
					$('#remarkUpdate').val(result.remark);
					if(result.attachFile != null){//存在附件
						_self._initUploadFiles(result.attachFile.id);
					}else{
						_self._initUploader("");
					}
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
			var fileArray = uploader.get("queue").getItems();
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
			 var postLoad = new PostLoad({
				url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
				el : '#fileUpdateDialog',
				loadMsg : '获取中...',
			}); 
			var data={attachFileId : attachFileId};
			postLoad.load(data, function(result){
				if(result != null){
					_self._initUploader(result);
				}
			});
		 },
		//初始化表单
		_initFormContainer:function(){
			var form = new FormContainer({
				id : 'AccountUpdateForm',
				colNum : 2,
				formChildrens : [
					{
						label : '台账名称：',
						redStarFlag : true,
						itemColspan : 2,
						item :'<input type="text" name="name" id="accountNameUp" data-rules="{required:true,maxlength:40}" style="width:98%;height:30px">'
					},{
						label: '台账类型：',
						redStarFlag: true,
						itemColspan: 1,
						item: '<select name="type" id="dataTypeUp" style="width:100%;height:30px" data-rules="{required:true}"></select>'
					},{
						label: '施工地点：',
						redStarFlag: true,
						itemColspan: 1,
						item: '<input type="text" name="address" id="place" data-rules="{required:true,maxlength:40}" style="width:98%;height:30px">'
					},{
						label: '附件：',
						itemColspan: 2,
						item: '<div name="attachFileId" id="uploadFileUpdateDiv" />'
					},{
						label: '备注：',
						itemColspan : 2,
						item :'<textarea name="remark" id="remarkUpdate" style="width:99.5%;height:95px;" maxlength="250" placeholder="最多输入250字"/>'
					}
				]
			});
			return form;
		},
		//实例化下拉框值数据
		_selectAutoFilling:function(){
			technicalInfo_type.listData("#dataTypeUp");
		},
		//保存数据
		_saveData : function(){
    		var _self = this,contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
    		var form = _self.getChild('AccountUpdateForm',true);
			// 验证不通过
	    	 if(!form.isValid()) {
	    		 return;
	    	 }
	    	 var data = form.serializeToObject();
			 // 获取上传文件
		     var uploadFileArr = _self._getUploadFileData();
		     data.uploadFileArr=JSON.stringify(uploadFileArr);
		     data.id=fileId;
		     //执行提交到数据库的方法
		     var postLoad = new PostLoad({
					url : contextPath + 'technicalAccountAction/updateAccountData.cn',
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
	},{
		ATTRS : {
			title : {value : '修改文件'},
			width : {value : 635},
			height : {value : 315},
			contextPath : {},
			fileId: {},
			closeAction: {value: 'destroy'},
	        mask: {value: true},
	        events : {
	        	value : {
					/**
					 * 绑定保存按钮事件
					 */
					'completeUpdateSave' : true,
				}
	        }
		}
	});
	return TechnicalAccountPageNewUpdate;
});