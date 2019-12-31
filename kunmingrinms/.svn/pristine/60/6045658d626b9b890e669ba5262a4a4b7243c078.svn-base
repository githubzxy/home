define('views/technical/TechnicalDocumentPageNewDetails',
		['bui/overlay',
		 'common/data/PostLoad',
		 'common/uploader/ViewUploader',
		 'common/form/FormContainer'],function(r){
	var Overlay = r('bui/overlay');
	var PostLoad = r('common/data/PostLoad');
	var ViewUploader = r('common/uploader/ViewUploader');
	var FormContainer = r('common/form/FormContainer');
	var TechnicalDocumentPageNewDetails = Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI : function(){
			var _self = this;
			_self._initShowData();
		},
		
		bindUI : function(){
			var _self = this;
			//添加资料名称悬浮提示
    		$('#accountNameShow').on('mouseover',function(){
    			var str=$('#accountNameShow').val();
    			$('#accountNameShow').attr('title',str);
    		});
    		//添加施工地点悬浮提示
    		$('#placeShow').on('mouseover',function(){
    			var str=$('#placeShow').val();
    			$('#placeShow').attr('title',str);
    		});
    		var buttons = [];// 没有按钮
			_self.set('buttons',buttons);
		},
		
		/**
		 * 初始化显示数据
		 */
		_initShowData:function(){
			var _self = this;
			var contextPath = _self.get('contextPath');
			var fileId = _self.get('fileId');
			var pl=new PostLoad({
				url:contextPath + 'technicalDocument/getTechnicalById.cn',
				el:_self.get('el')
			});
			pl.load({id : fileId},function(result){
				$("#accountNameShow").val(result.name);
				$("#departShow").val(result.depart.name);
				$("#dataTypeShow").val(technicalInfo_type.typeName(result.technicalInfoType));
				$("#placeShow").val(result.address);
				$("#createUser").val(result.createUser.name);
				$("#createTime").val(result.createDate);
				$("#remarkShow").val(result.remark);
				if(result.attachFile != null){//初始化上传附件
					if(result.attachFile.files.length>1){
						$('#filesShow').css('height','auto');
					}
					_self._initUploadFiles(result.attachFile.id);
				}
			});
		},
		/**
		 * 根据附件ID,获取上传文件
		 * @param attachFileId 附件ID
		 */
		_initUploadFiles : function(FileId){
			var _self = this;
			var contextPath = _self.get('contextPath');
			var pl=new PostLoad({
				url:contextPath + 'attachFile/getFilesByAttachFileId.cn',
				el:_self.get('el')
			});
			pl.load({attachFileId : FileId},function(result){
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
						label: '资料名称：',
						itemColspan : 2, 
						item : '<input type="text" id="accountNameShow" readOnly="readOnly"/>'
					},{
						label: '所属部门：',
						itemColspan: 1,
						item: '<input type="text" id="departShow" readOnly="readOnly"/>'
					}
//					,{
//						label: '资料类别：',
//						itemColspan: 1,
//						item: '<input type="text" id="dataTypeShow" readOnly="readOnly"/>'
//					}
					,{
						label: '处所：',
						itemColspan: 2,
						item: '<input type="text" id="placeShow" readOnly="readOnly"/>'
					},{
						label: '创建人：',
						itemColspan: 1,
						item: '<input type="text" id="createUser" readOnly="readOnly"/>'
					},{
						label: '创建时间：',
						itemColspan: 1,
						item: '<input type="text" id="createTime" readOnly="readOnly"/>'
					},{
						label: '附件：',
						itemColspan: 2,
						item: '<div id="filesShow" style="height:30px;" readOnly="readOnly"/>'
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
			title : {value : '详细信息'},
			width : {value : 625},
			height : {value : 320},
			mask : {value : true},
			contextPath : {},
			fileId : {},
			closeAction : {
				value : 'destroy'
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
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return TechnicalDocumentPageNewDetails;
});