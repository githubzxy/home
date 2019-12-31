/**
 * 新增信息模块
 */
define('views/message/MessageAdd',[
	'bui/common',
	'common/form/FormContainer','bui/uploader',
	'common/data/PostLoad','bui/form'],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		UpdateUploader = r('common/uploader/UpdateUploader'),
		PostLoad = r('common/data/PostLoad');
	var MessageAdd = BUI.Overlay.Dialog.extend({
		initializer: function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
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
		renderUI: function(){
			var _self = this,contextPath = _self.get('contextPath');
			$('#formContainer #issueOrgName').val(_self.get('orgName'));
			console.log(_self.get('orgName'));
			_self._initUploader();
		},
		/**
		 * 初始化下拉框数据
		 */
		_selectAutoFilling:function(){
			message_type.listData("#typeAdd");
		},
		/**
		 * 初始化表单
		 */
		_initFormContainer: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var colNum = 2;
			var childs = [{
				label: '信息主题',
				redStarFlag: true,
				item: '<input type="text" name="theme" id="themeAdd" data-rules="{maxlength:250,required:true}" style="width:99%;height:30px"/>'
			},{
				label: '信息类别',
				redStarFlag: true,
				item: '<select name="type" id="typeAdd" style="width:100%;height:30px" data-rules="{required:true}"><option value=""></option></select>'
			},{
				label: '发布部门',
				redStarFlag: true,
				itemColspan: 2,
				item: '<input  type="text" name="issueOrgName" id="issueOrgName" style="width:99.5%;height:30px"  readOnly="readOnly""/>'
			},{
				label: '信息内容',
				redStarFlag: true,
				itemColspan: 2,
				item: '<textarea name="content" id="contentAdd" data-rules="{maxlength:250,required:true}" style="width:99.5%;height:65px;"></textarea>'
			},{
				label: '附件',
				itemColspan: 2,
				item: '<div name="attachFileId" id="uploadMessageAddDiv"></div>'
			}];
			var form = new FormContainer({
				id: 'messageFormAdd',
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
				render : '#uploadMessageAddDiv',
		        url : contextPath + 'attachFile/upload.cn',
		        isSuccess : function(result){
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
			id: {value : 'messageAddDialog'},
			elAttrs : {value : {id : 'messageAddDialog'}},
			title: {value : '添加发布信息'},
			width: {value:645},
			orgId: {},
	        orgName: {},
	        orgType: {},
	        height: {value:265},
	        contextPath: {},
	        closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
	        mask: {value: true},
	        success: {
	        	value: function(){
	        		var _self = this,contextPath = _self.get('contextPath');
	        		var formAdd = _self.getChild('messageFormAdd',true);
	        		//验证不通过
	        		if(!formAdd.isValid()){
	        			return;
	        		}
	        		var data = formAdd.serializeToObject();
//	        		data.append('orgType',_self.get('orgType'));
	        		//获取上传文件
	        		data.attachFileId = JSON.stringify(_self.getUploadFileData());
	        		data.orgId = _self.get('orgId');
	        		data.orgType = _self.get('orgType');
	        		console.log(data);
	        		//提交到数据库
	        		var postLoad = new PostLoad({
						url : contextPath + 'issueMessageAction/addIssueMessage.cn',
						el : '#messageAddDialog',
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
	return MessageAdd;
});