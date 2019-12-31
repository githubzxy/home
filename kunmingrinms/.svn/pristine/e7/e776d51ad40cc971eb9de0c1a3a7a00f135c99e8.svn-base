/**
 * 修改信息模块
 */
define('views/message/MessageUpdate',[
	'bui/common','common/form/FormContainer',
	'common/uploader/UpdateUploader',
	'common/data/PostLoad'],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Uploader = r('common/uploader/UpdateUploader');
		PostLoad = r('common/data/PostLoad');
	var MessageUpdate = BUI.Overlay.Dialog.extend({
		initializer: function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		bindUI : function(){
			var _self = this;
			_self._selectAutoFilling();
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
			//定义按键
			var buttons = [
				{
					text:'保存',
					elCls:'button',
					handler : function(){
			            	var success = _self.get('success');
				            if(success){
				              success.call(_self);
				            }
					}
				},
				{
					  text:'关闭',
					  elCls : 'button',
					  handler : function(dialog,btn){
					        if(this.onCancel() !== false){
					        	this.close();
					        }
					  }
				}
			];
			_self.set('buttons',buttons);
		},
		//渲染表单控件
		renderUI : function(){
			var _self = this;
			_self._initMessage();
		},
		//实例化下拉框值数据
		_selectAutoFilling:function(){
			message_type.listData("#typeUpdate");
		},
		//初始化修改的数据
		_initMessage: function(){
			var _self = this,contextPath = _self.get('contextPath'),messageId = _self.get('messageId');
			var postLoad =new PostLoad({
				url:contextPath +  'issueMessageAction/getIssueMessageById.cn',
				el:'#messageUpdateDialog',
				loadMsg:'查询中'
			}); 
			postLoad.load({id : messageId},function(result){
				console.log(result);
				$('#themeUpdate').val(result.theme);
				$('#typeUpdate').val(result.type);
				$('#contentUpdate').val(result.content);
				$('#formContainer #issueOrgName').val(result.issueOrgName);
				console.log(result.issueOrgName);
					//初始化上传附件
				_self._initUploader(result.uploadFileArr);
			});
		},
		//初始化上传文件控件
		_initUploader:function(uploadFiles){
			var _self = this,contextPath = _self.get('contextPath');
			//上传附件
			var uploader = new Uploader({
				render: '#uploadMessageUpdateDiv',
				alreadyItems : uploadFiles,
				url: contextPath + 'attachFile/upload.cn',
				isSuccess : function(result){
					return true;
				}
			});
			uploader.render();
			_self.set('uploader',uploader);
		},
		//获取上传文件数据(上传的)
		_getUploadFileData:function(){
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
		//初始化表单
		_initFormContainer:function(){
			var form = new FormContainer({
				id : 'messageUpdateForm',
				colNum : 2,
				formChildrens : [
					{
						label: '信息主题',
						redStarFlag: true,
						item: '<input type="text" name="theme" id="themeUpdate" data-rules="{maxlength:250,required:true}" style="width:99%;height:30px"/>'
					},{
						label: '信息类别',
						redStarFlag: true,
						item: '<select name="type" id="typeUpdate" style="width:100%;height:30px" data-rules="{required:true}"><option value=""></option></select>'
					},{
						label: '发布部门',
						itemColspan: 2,
						item: '<input  type="text" name="issueOrgName" id="issueOrgName" style="width:99.5%;height:30px"  readOnly="readOnly""/>'
					},{
						label: '信息内容',
						redStarFlag: true,
						itemColspan: 2,
						item: '<textarea name="content" id="contentUpdate" data-rules="{maxlength:250,required:true}" style="width:99.5%;height:65px;"></textarea>'
					},{
						label: '附件',
						itemColspan: 2,
						item: '<div name="attachFileId" id="uploadMessageUpdateDiv"></div>'
					}
				]
			});
			return form;
		}
	},{
		ATTRS : {
			id : {value : 'messageUpdateDialog'},
			elAttrs : {value : {id : 'messageUpdateDialog'}},
			title : {value : '修改发布信息'},
			width : {value : 635},
			height : {value : 265},
			contextPath : {},
			messageId: {},
			closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
	        mask: {value: true},//非模态弹出框
	        success : {
	        	value : function(){
	        		var _self = this,contextPath = _self.get('contextPath'),messageId = _self.get('messageId');
	        		var formUpdate = _self.getChild('messageUpdateForm',true);
					// 验证不通过
			    	 if(!formUpdate.isValid()) {
			    		 return;
			    	 }
			    	 var data = formUpdate.serializeToObject();
			    	 data.id = messageId;
			    	 // 获取上传文件
			    	 data.attachFileId = JSON.stringify(_self._getUploadFileData());
			    	 
				    //执行提交到数据库的方法
				    var postLoad = new PostLoad({
						url : contextPath + 'issueMessageAction/updateIssueMessage.cn',
						el : '#messageUpdateDialog',
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
	        },
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
	return MessageUpdate;
});