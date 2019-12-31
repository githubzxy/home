define('views/technical/TechnicalAccountPageNewDetails',[
		'bui/overlay','common/uploader/ViewUploader',
		'common/form/FormContainer',
		'common/data/PostLoad'],function(r){
	var Overlay = r('bui/overlay'),
	ViewUploader = r('common/uploader/ViewUploader'),
	PostLoad = r('common/data/PostLoad'),
	FormContainer = r('common/form/FormContainer');
	var TechnicalAccountPageNewDetails = Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI : function(){
			var _self = this;
			_self._initShowData();
			_self.set('buttons',[]);
		},
		/**
		 * 初始化显示数据
		 */
		_initShowData:function(){
			var _self = this,contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
			var files = "";// 附件
			var pl = new PostLoad({
				url : contextPath + 'technicalAccountAction/getTechnicalAccountById.cn',
				el : '#detailDialog'
			});
			pl.load({id:fileId},function(result){
				$("#accountNameShow").val(result.name);
				$("#departShow").val(result.depart.name);
				$("#dataTypeShow").val(technicalInfo_type.typeName(result.type));
				$("#placeShow").val(result.address);
				$("#createUser").val(result.createUser.name);
				$("#createTime").val(result.createDate);
				$("#remarkShow").val(result.remark);
				if(result.attachFile != null){//初始化上传附件
					if(result.attachFile.files.length>1)
						$('#filesShow').css('height','auto');
					_self._initUploadFiles(result.attachFile.id);
				}
			});
		},
		/**
		 * 根据附件ID,获取上传文件
		 * @param attachFileId 附件ID
		 */
		_initUploadFiles : function(attachFileId){
			var _self = this,contextPath = _self.get('contextPath');
			var pl = new PostLoad({
				url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
				el : _self.get('el')
			});
			pl.load({attachFileId : attachFileId},function(result){
				var files = new ViewUploader({
					render: '#filesShow',
					alreadyItems : result,
					previewUrl:'/kunmingrinms/views/common_page/commonPreview.jsp',
					servlet : "DownloadFileServlet"
				});
				files.render();
			});
		},
		_initFormContainer:function(){
			var form = new FormContainer({
				id: 'fileShowForm',
				colNum: 2,
				formChildrens:[
					{
						label: '台账名称：',
						itemColspan : 2, 
						item : '<input type="text" id="accountNameShow" readOnly="readOnly"/>'
					},{
						label: '所属部门：',
						item: '<input type="text" id="departShow" readOnly="readOnly"/>'
					},{
						label: '台账类别：',
						item: '<input type="text" id="dataTypeShow" readOnly="readOnly"/>'
					},{
						label: '施工地点：',
						itemColspan: 2,
						item: '<input type="text" id="placeShow" readOnly="readOnly"/>'
					},{
						label: '创建人：',
						item: '<input type="text" id="createUser" readOnly="readOnly"/>'
					},{
						label: '创建时间：',
						item: '<input type="text" id="createTime" readOnly="readOnly"/>'
					},{
						label: '附件：',
						itemColspan: 2,
						item: '<div id="filesShow" style="height: 30px;" readOnly="readOnly"/>'
					},{
						label: '备注：',
						itemColspan : 2,
						item :'<textarea name="remarkShow" id="remarkShow" style="width:99.5%;height:95px;" readOnly="readOnly"/>'
					}
				]
			});
			return form;
		}	
	},{
		ATTRS : {
			id: {value : 'detailDialog'},
			title : {value : '详细信息'},
			width : {value : 635},
			height : {value : 357},
			mask : {value : true},
			contextPath : {},
			fileId : {},
			closeAction : {value : 'destroy'}
		}
	});
	return TechnicalAccountPageNewDetails;
});