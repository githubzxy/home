/**
 * 技术规章详情模块
 */
define('views/technical/technicalRegularionDetails',
		['bui/overlay',
		 'common/data/PostLoad',
		 'common/uploader/ViewUploader',
		 'common/form/FormContainer'],
	function(require){
		var Overlay = require('bui/overlay');
		var	ViewUploader = require('common/uploader/ViewUploader');
		var	PostLoad = require('common/data/PostLoad');
		var	FormContainer = require('common/form/FormContainer');
		var TechnicalRegularionDetails = Overlay.Dialog.extend({
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
				//添加技术规章名称悬浮提示
	    		$('#regulationNameShow').on('mouseover',function(){
	    			var str=$('#regulationNameShow').val();
	    			$('#regulationNameShow').attr('title',str);
	    		});
	    		var buttons = [];// 没有按钮
	    		_self.set('buttons',buttons);
			},
			
			// 初始化显示数据
			_initShowData:function(){
				var _self = this,contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
				var postLoad=new PostLoad({
					url:contextPath + 'technicalRegulation/getTechnicalRegulationById.cn',
					el:_self.get('el')
				});
				postLoad.load({id:fileId},function(result){
					$('#regulationNameShow').val(result.name);
					$('#departShow').val(result.depart.name);
					var technicalInfoType = technicalInfo_type.typeName(result.technicalInfoType);
					$('#dataTypeShow').val(technicalInfoType);
					$('#createUserShow').val(result.createUser.name);
					$('#createTimeShow').val(result.createDate);
					$('#remarkShow').val(result.remark);
					if(result.attachFile != null){//初始化上传附件
						if(result.attachFile.files.length>1){
							$('#filesShow').css('height','auto');
						}
						_self._initUploadFiles(result.attachFile.id);
					}
				});
			},
				
			// 根据附件ID,获取上传文件
			_initUploadFiles : function(FileId){
				var _self = this,contextPath = _self.get('contextPath');
				var postLoad=new PostLoad({
					url:contextPath + 'attachFile/getFilesByAttachFileId.cn',
					el:_self.get('el')
				});
				postLoad.load({attachFileId : FileId},function(result){
					var files = new ViewUploader({
						render: '#filesShow',
						alreadyItems : result,
						previewUrl:contextPath + 'views/common_page/commonPreview.jsp',
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
							label: '规章名称：',
							itemColspan : 3, 
							item : '<input type="text" id="regulationNameShow" readOnly="readOnly"/>'
						},{
							label: '所属部门：',
							item: '<input type="text" id="departShow" readOnly="readOnly"/>'
						},{
							label: '资料类别：',
							item: '<input type="text" id="dataTypeShow" readOnly="readOnly"/>'
						},{
							label: '创建人：',
							item: '<input type="text" id="createUserShow" readOnly="readOnly"/>'
						},{
							label: '创建时间：',
							item: '<input type="text" id="createTimeShow" readOnly="readOnly"/>'
						},{
							label: '附件：',
							itemColspan: 3,
							item: '<div id="filesShow" style="height:30px;" readOnly="readOnly"/>'
						},{
							label: '备注：',
							itemColspan : 3,
							item :'<textarea id="remarkShow" style="width:98.5%;height:95px;" readOnly="readOnly"/>'
						}
					]
				});
				return form;
			}	
		},{
			ATTRS : {
				title : {value : '技术规章详细信息'},
				width : {value : 635},
				height : {value : 323},
				mask : {value : true},//非模态弹出框
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
						//绑定关闭按钮事件
						'close' : false
					}
				}
			}
		});
		return TechnicalRegularionDetails;
});