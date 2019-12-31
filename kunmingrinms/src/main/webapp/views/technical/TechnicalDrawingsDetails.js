define('views/technical/TechnicalDrawingsDetails',[
		'bui/overlay','common/uploader/ViewUploader',
		'common/data/PostLoad',
		'common/form/FormContainer'],function(r){
	var Overlay = r('bui/overlay'),
	ViewUploader = r('common/uploader/ViewUploader'),
	FormContainer = r('common/form/FormContainer'),
	PostLoad = r('common/data/PostLoad');
	var TechnicalDrawingsDetails = Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI : function(){
			var _self = this;
			_self._initShowData();
			var buttons = [];// 详情没有按钮
			_self.set('buttons',buttons);
		},
//		bindUI : function(){
//			$('#drawNameShow').on('mouseover',function(){
//    			var str=$('#drawNameShow').val();
//    			$('#drawNameShow').attr('title',str);
//    		});
//		},
		/**
		 * 初始化显示数据(填充数据)
		 */
		_initShowData:function(){
			var _self = this,contextPath = _self.get('contextPath'),
			drawId = _self.get('drawId');
			var files = "";// 附件
			var postLoad = new PostLoad({
				url : contextPath + 'technical/getTechnicalById.cn',
				el : '#DetailDialog'
			});
			postLoad.load({id : drawId},function(result){
//				var data = JSON.parse(result.data);
				var data = result;
				$('#drawNameShow').val(data.name);
				$('#departShow').val(data.depart.name);
				var technicalInfoType = technicalInfo_type.typeName(data.technicalInfoType);
				$('#technicalInfoTypeShow').val(technicalInfoType);
				$('#addressShow').val(data.address);
				$('#createrShow').val(data.createUser.name);
				$('#createDateShow').val(data.createDate);
				$('#remarkShow').val(data.remark);
				if(data.attachFile != null){//初始化上传附件
//					if(data.attachFile.files.length>1){
//						$("#filesShow").css("height","auto");
//					}
					_self._initUploadFiles(data.attachFile.id);
				}
			});
		},
		/**
		 * 根据附件ID,获取上传的附件
		 * @param attachFileId 附件ID
		 */
		_initUploadFiles : function(attachFileId){
			var _self = this,contextPath = _self.get('contextPath');
			var pl = new PostLoad({
				url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
				el : _self.get('el')
			});
			pl.load({attachFileId:attachFileId},function(result){
				var files = new ViewUploader({
					render: '#filesShow',
					alreadyItems : result,
					previewUrl:contextPath+'views/common_page/commonPreview.jsp',
					servlet : "DownloadFileServlet"
				});
				files.render();
			});
		},
		/**
		 * 初始化页面表单
		 */
		_initFormContainer:function(){
			var form = new FormContainer({
				id: 'drawShowForm',
				colNum: 2,
				formChildrens:[
					{
						label: '图纸名称：',
						itemColspan : 2, 
						item : '<input type="text" id="drawNameShow" readOnly="readOnly"/>'
					},{
						label: '所属部门：',
						itemColspan : 2, 
						item: '<input type="text" id="departShow" readOnly="readOnly"/>'
					},{
						label: '资料类别：',
						itemColspan : 2, 
						item: '<input type="text" id="technicalInfoTypeShow" readOnly="readOnly"/>'
					},{
						label: '处所：',
						itemColspan : 2,
						item: '<input type="text" id="addressShow" readOnly="readOnly"/>'
					},{
						label: '创建人：',
						itemColspan : 1, 
						item: '<input type="text" id="createrShow" readOnly="readOnly"/>'
					},{
						label: '创建时间：',
						itemColspan : 1, 
						item: '<input type="text" id="createDateShow" readOnly="readOnly"/>'
					},{
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
			id: {value : 'DetailDialog'},
			title : {value : '查看系统网络图'},
			width : {value : 635},
			height : {value : 465},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			drawId : {},
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
	return TechnicalDrawingsDetails;
});