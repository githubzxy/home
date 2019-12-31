define('views/fileSystem/FileManagementDetails',[
		'bui/overlay','common/uploader/ViewUploader',
		'common/form/FormContainer'],function(r){
	var Overlay = r('bui/overlay'),
	ViewUploader = r('common/uploader/ViewUploader'),
	FormContainer = r('common/form/FormContainer');
	var FileManagementDetails = Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI : function(){
			var _self = this;
			_self._initShowData();
			var buttons = [];// 没有按钮
			_self.set('buttons',buttons);
		},
		/**
		 * 初始化显示数据
		 */
		_initShowData:function(){
			var _self = this,contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
			var files = "";// 附件
			$.ajax({
				url : contextPath + 'fileSystemAction/getDataById.cn',
				data : {
					fileId : fileId
				},
				type : 'POST',
				dataType : 'JSON',
				async : false,
				success : function(result){
					$('#fileNameShow').val(result.fileName);
					$('#fileTypeShow').val(technicalInfo_type.typeName(parseInt(result.fileType)));
					var fileSuitableRange = fileSystem_fileSuitableRange.typeName(result.fileSuitableRange);
					$('#fileSuitableRangeShow').val(fileSuitableRange);
					var fileValidTime = fileSystem_fileValidTime.typeName(result.fileValidTime);
					$('#fileValidTimeShow').val(fileValidTime);
					var isDetailing;
					if(!result.isDetailing){
						isDetailing = "否";
					}else{
						isDetailing = "是";
					}
					$('#isDetailingShow').val(isDetailing);
					$('#remarkShow').val(result.remark);
					if(result.attachFile != null){//初始化上传附件
						var uploadFiles = _self._initUploadFiles(result.attachFile.id);
						/*uploadFiles.map(function(item){
							item.path = contextPath + 'DownloadFileServlet?fileName=' + item.name + '&filePath=' + item.path;
						});*/
						files = uploadFiles;
						var files = new ViewUploader({
							render: '#filesShow',
							alreadyItems : files,
							previewUrl:'/kunmingrinms/views/common_page/commonPreview.jsp',
							servlet : "DownloadFileServlet"
						});
						files.render();
					}
				}
			});
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
		
		_initFormContainer:function(){
			var form = new FormContainer({
				id: 'fileShowForm',
				colNum: 2,
				formChildrens:[
					{
						label: '作业指导书名称',
						itemColspan : 2, 
						item : '<input type="text" id="fileNameShow" readOnly="readOnly"/>'
					},{
						label: '专业类别',
						itemColspan : 2, 
						item: '<input type="text" id="fileTypeShow" style="width:99%;" readOnly="readOnly"/>'
					},
					{
						label: '附件：',
						itemColspan: 2,
						item: '<div id="filesShow" readOnly="readOnly" style="height:100px;overflow-y:auto"/>'
					},{
						label: '备注：',
						itemColspan : 2,
						item :'<textarea name="remarkShow" id="remarkShow" style="width:99.5%;height:100px;" readOnly="readOnly"/>'
					}
				]
			});
			return form;
		}	
	},{
		ATTRS : {
			title : {value : '作业指导书'},
			width : {value : 635},
			height : {value : 370},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			fileId : {},
			closeAction : {value : 'destroy'},
		}
	});
	return FileManagementDetails;
});