/**
 * 信息详情模块
 */
define('views/message/MessageShow',[
	'common/uploader/ViewUploader',
	'common/form/FormContainer'],function(r){
	var ViewUploader = r('common/uploader/ViewUploader'),
		FormContainer = r('common/form/FormContainer');
	var MessageShow = BUI.Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI : function(){
			var _self = this;
			_self._initMessage();
			var buttons = [];// 没有按钮
			_self.set('buttons',buttons);
		},
		/**
		 * 初始化显示数据
		 */
		_initMessage: function(){
			var _self = this,contextPath = _self.get('contextPath'),messageId = _self.get('messageId');
			var postLoad =new PostLoad({
				url:contextPath +  'issueMessageAction/getIssueMessageById.cn',
				el:'#messageShowDialog',
				loadMsg:'查询中'
			}); 
	    	var data = {id : messageId};
			postLoad.load(data,function(result){
				$('#themeShow').val(result.theme);
				$('#typeShow').val(message_type.typeName(result.type));
				$('#contentShow').val(result.content);
				$('#formContainer #issueOrgName').val(result.issueOrgName);
				if(result.uploadFileArr.length != 0){// 上传附件
					$('#messageShow').css('height', '');
					var files = new ViewUploader({
						render: '#messageShow',
						alreadyItems : result.uploadFileArr,
						previewUrl:'/kunmingrinms/views/common_page/commonPreview.jsp',
						servlet : "DownloadFileServlet"
					});
					files.render();
				}
			});
		},
		_initFormContainer:function(){
			var form = new FormContainer({
				id: 'messageShowForm',
				colNum: 2,
				formChildrens:[
					{
						label: '信息主题',
						item: '<input type="text" id="themeShow" style="width:99%;height:30px" readOnly="readOnly"/>'
					},{
						label: '信息类别',
						item: '<input type="text" id="typeShow" style="width:99%;height:30px" readOnly="readOnly"/>'
					},{
						label: '发布部门',
						itemColspan: 2,
						item: '<input  type="text" name="issueOrgName" id="issueOrgName" style="width:99.5%;height:30px"  readOnly="readOnly""/>'
					},{
						label: '信息内容',
						itemColspan: 2,
						item: '<textarea id="contentShow" style="width:99.5%;height:65px;" readOnly="readOnly"/>'
					},{
						label: '附件',
						itemColspan: 2,
						item: '<div id="messageShow" style="height:30px"></div>'
					}
				]
			});
			return form;
		},
	},{
		ATTRS : {
			id : {value : 'messageShowDialog'},
			elAttrs : {value : {id : 'messageShowDialog'}},
			title : {value : '查看发布信息'},
			width : {value : 635},
			height : {value : 265},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			messageId : {},
			closeAction : {value : 'destroy'},
		}
	});
	return MessageShow;
});