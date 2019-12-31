/**
 * 文件新增模块
 */
define('views/fileSystemNew/FileManagementAdd',['bui/common',
	'common/form/FormContainer','common/uploader/UpdateUploader',
	'common/data/PostLoad'],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		UpdateUploader = r('common/uploader/UpdateUploader')
		PostLoad = r('common/data/PostLoad');
	var FileManagementAdd = BUI.Overlay.Dialog.extend({
		/**
		 * 初始化
		 */
		initializer: function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		/**
		 * 绑定事件
		 */
		bindUI: function(){
			var _self = this;
			_self._selectAutoFilling();
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
			//定义按键
			var buttons = [
				{
					text: '保存',
					elCls: 'button',
					handler: function(){
						var success = _self.get('success');
						if(success){
							success.call(_self);
						}
					}
				},{
					text: '关闭',
					elCls: 'button',
					handler: function(){
						if(this.onCancel() !== false){
							this.close();
						}
					}
				}
			];
			_self.set('buttons',buttons);
		},
		/**
		 * 渲染
		 */
		renderUI: function(){
			var _self = this,contextPath = _self.get('contextPath');
			_self._initUploader();
		},
		/**
		 * 初始化下拉框数据
		 */
		_selectAutoFilling:function(){
			fileSystem_fileType.listData("#fileTypeAdd");
			fileSystem_fileSuitableRange.listData("#fileSuitableRangeAdd");
			fileSystem_fileValidTime.listData("#fileValidTimeAdd");
			fileSystem_isDetailing.listData("#isDetailingAdd");
		},
		/**
		 * 初始化表单
		 */
		_initFormContainer: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var colNum = 2;
			var childs = [{
				label: '规章制度名称',
				redStarFlag: true,
				itemColspan: 2,
				item: '<input type="text" name="fileName" id="fileNameAdd" data-rules="{required:true}"/>'
			},{
				label: '规章制度类型',
				redStarFlag: true,
				itemColspan: 2,
				item: '<select name="fileType" id="fileTypeAdd" data-rules="{required:true}"><option value=""></option></select>'
			},
//			{
//				label: '适用范围',
//				redStarFlag: true,
//				itemColspan: 1,
//				item: '<select name="fileSuitableRange" id="fileSuitableRangeAdd" data-rules="{required:true}"><option value=""></option></select>'
//			},{
//				label: '有效时间',
//				redStarFlag: true,
//				itemColspan: 1,
//				item: '<select name="fileValidTime" id="fileValidTimeAdd" data-rules="{required:true}"><option value=""></option></select>'
//			},{
//				label: '车间细化',
//				redStarFlag: true,
//				itemColspan: 1,
//				item: '<select name="isDetailing" id="isDetailingAdd" data-rules="{required:true}"><option value=""></option></select>'
//			},
			{
				label: '附件',
				itemColspan: 2,
				item: '<div name="attachFileId" id="uploadFileAddDiv" style="height:100px;overflow-y:auto"></div>'
			},{
				label: '备注',
				itemColspan : 2,
				item : '<textarea name="remark" id="remarkAdd" style="width:99.5%;height:100px;" data-rules="{maxlength:250}" placeholder="最多输入250字"/>'
			}];
			var form = new FormContainer({
				id: 'fileFormAdd',
				colNum: colNum,
				formChildrens: childs
			});
			return form;
		},
		/**
		 * 初始化上传文件
		 */
		_initUploader:function(){
			var _self = this,contextPath = _self.get('contextPath');
			//上传附件
			var uploader = new UpdateUploader({
				render: '#uploadFileAddDiv',
				url: contextPath + 'attachFile/upload.cn',
				isSuccess: function(result){
					return true;
				},
			});
			uploader.render();
			_self.set('uploader',uploader);
		},
		/**
		 * 获取上传文件数据(上传的)
		 */
		getUploadFileData:function(){
			var _self = this,uploader = _self.get('uploader');
			var arr = new Array();
			// 获取上传文件的对列
			var fileArray = uploader.getSucFiles();
			for(var i in fileArray){
		 		var dto = {name : fileArray[i].name,path : fileArray[i].path};
		 		arr.push(dto);
			};
			return arr;
		},
	},{
		ATTRS: {
			id: {value : 'fileAddDialog'},
			title: {value : '规章制度'},
			width: {value:650},
	        height: {value:370},
	        contextPath: {},
	        closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
	        mask: {value: true},
	        success: {
	        	value: function(){
	        		var _self = this,contextPath = _self.get('contextPath');
	        		var formAdd = _self.getChild('fileFormAdd',true);
	        		//验证不通过
	        		if(!formAdd.isValid()){
	        			return;
	        		}
	        		var data = formAdd.serializeToObject();
	        		//获取上传文件
	        		data.uploadFileArr = JSON.stringify(_self.getUploadFileData());
	        		//提交到数据库
	        		var postLoad = new PostLoad({
						url : contextPath + 'fileSystemNewAction/addInfor.cn',
						el : '#fileAddDialog',
						loadMsg : '保存中...'
					}); 
	        		
					postLoad.load(data, function(result){
						if(result != null){
							_self.fire("completeAddSave",{
								result : result
							});
						}
					});
	        	}
	        },
	        events: {
	        	value: {
	        		/**
	        		 * 绑定保存按钮事件
	        		 */
	        		'completeAddSave' : true,
	        	}
	        }
		}
	});
	return FileManagementAdd;
});
