/**
*信息发布详细信息弹出窗模块
*/
define('views/hhkj/home/MessageDetail',['bui/common',
	'common/data/PostLoad','bui/form','common/form/FormContainer',
	'common/uploader/ViewUploader','bui/data','bui/tree'],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		PostLoad = r('common/data/PostLoad'),
		Form = r('bui/form'),
		Data = r('bui/data'),
		ViewUploader = r('common/uploader/ViewUploader');
	var MessageDetail = BUI.Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI : function(){
			var _self = this,contextPath = _self.get('contextPath');
			//回显数据
			_self._initData();			
		},
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath');
			//定义按键
			var buttons = [];
			_self.set('buttons',buttons);
		},	
		/**
		 * 回显数据
		 */
		_initData : function () {
			var _self = this,contextPath = _self.get('contextPath'),id = _self.get('id');
			var files = "";// 附件
			var postLoad = new PostLoad({
				url : contextPath + 'homeAction/getHomeMessageById.cn',
				el : '#messageDialog',
				loadMsg : '查询中...'
			}); 
			postLoad.load({id : id}, function(data){	
				$("#title").val(data.theme);
				$("#type").val(message_type.typeName(data.type));
				$("#content").val(data.content);
				if(data.attachFile != null){//初始化上传附件
					$('#downloadFile').css('height', '');
					_self._initUploadFiles(data.attachFile.id);
				}				
			});
		},
		/**
		 * 根据附件ID,获取上传文件
		 * @param attachFileId 附件ID
		 */
		_initUploadFiles : function(attachFileId){
			var _self = this,contextPath = _self.get('contextPath');
			var postLoad = new PostLoad({
				url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
				loadMsg : '查询中...'
			}); 
			postLoad.load({attachFileId : attachFileId}, function(data){	
				var previewUrl = '/kunmingrinms/views/common_page/commonPreview.jsp';
				var viewUploader = new ViewUploader({
					servlet:'DownloadFileServlet',
					previewUrl:previewUrl,
					render: '#downloadFile',
					alreadyItems : data,
				});
				viewUploader.render();
			});		
		},
		/**
		 * 初始化表单容器FormContainer
		 */
		_initFormContainer : function(){
			var _self = this;
			var colNum = 2;
			var childs = [
				{
					label : '信息主题：',
					itemColspan : 2,
					item : '<input type="text" id="title"  style="height:40px" readOnly="readOnly"/>'
				},{
					label : '信息类别：',
					itemColspan : 2,
					item : '<input type="text"  id="type" style="height:40px" readOnly="readOnly">'
				},{
					label : '信息内容：',
					itemColspan : 2,
					item : '<textarea  type="text" id="content"  style="height:100px;" readOnly="readOnly"/>'
				},{
					label : '附件：',
					itemColspan : 2,
					item : '<div type="text" id="downloadFile"  style="height:60px"></div>'
				}
			];
			var form = new FormContainer({
				id : 'expertAdd',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		},
	},{
		ATTRS : {
			elAttrs : {value: {id:"messageDialogId"}},
			id : {value : 'messageDialog'},
			title:{value:'信息发布详细信息'},
            width:{value:600},
            height:{value:345},
            contextPath : {},
            id :{},
            closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
		}
	});
	return MessageDetail;
});