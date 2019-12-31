/**
 * 文件修改模块
 */
define('views/technical/TechnicalDocumentPageNewUpdate',
		['bui/common',
		 'common/form/FormContainer',
		 'common/uploader/UpdateUploader',
		 'common/data/PostLoad',
		 ],function(r){
	var BUI = r('bui/common');
	var FormContainer = r('common/form/FormContainer');
	var UpdateUploader = r('common/uploader/UpdateUploader');
	var PostLoad = r('common/data/PostLoad');
	var TechnicalDocumentPageNewUpdate = BUI.Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		
		//渲染表单控件
		renderUI : function(){
			var _self = this;
			_self._initUpdateData();
			_self._selectAutoFilling();
		},
		
		//绑定事件
		bindUI : function(){
			var _self = this;
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
			var buttons = [
				{
					text:'保存',
					elCls:'button',
					handler : function(){
						_self._saveData();
					}
				},
				{
					text:'关闭',
					elCls : 'button',
					handler : function(){
						_self.close();
					}
				}
			];
			_self.set('buttons',buttons);
			//添加资料名称悬浮提示
    		$('#accountNameUp').on('mouseover',function(){
    			var str=$('#accountNameUp').val();
    			$('#accountNameUp').attr('title',str);
    		});
    		//添加施工地点悬浮提示
    		$('#place').on('mouseover',function(){
    			var str=$('#place').val();
    			$('#place').attr('title',str);
    		});
		},
		
		//初始化修改的数据
		_initUpdateData:function(){
			var _self = this;
			var contextPath = _self.get('contextPath');
			var fileId = _self.get('fileId');
			var postLoad = new PostLoad({
				url : contextPath + 'technicalDocument/getTechnicalById.cn',
				el : _self.get('el'),
				loadMsg : '获取文件中...'
			}); 
			postLoad.load({id:fileId}, function(result){
				if(result != null){
					$('#accountNameUp').val(result.name);
					$('#dataTypeUp').val(result.technicalInfoType);
					$('#place').val(result.address);
					$('#remarkUpdate').val(result.remark);
					if(result.attachFile != null){//存在附件
						_self._initUploadFiles(result.attachFile.id);
					}else{
						_self._initUploader("");
					}
				}
			});
		},
		
		//初始化上传文件控件
		_initUploader:function(uploadFiles){
			var _self = this;
			var contextPath = _self.get('contextPath');
			var updateUploader = new UpdateUploader({
				render: '#uploadFileUpdateDiv',
				alreadyItems : uploadFiles,
				url: contextPath + 'attachFile/upload.cn',
				isSuccess : function(result){
					return true;
				}
			});
			updateUploader.render();
			_self.set('updateUploader',updateUploader);
		},
		
		//获取上传文件数据(上传的)
		_getUploadFileData:function(){
			var _self = this;
			var uploader = _self.get('updateUploader');
			var arr = new Array(); //声明数组,存储数据发往后台
			//获取上传文件的对列
			var fileArray = uploader.get("queue").getItems();
		 	for(var i in fileArray){
		    	var dto = new _self._UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
				arr[i] = dto; // 向集合添加对象
			};
			return arr;
		},
		
		//上传文件对象
		_UploadFileDto:function(name, path){
			 this.name = name;
			 this.path = path;
		 },
		 
		 //根据附件ID,获取上传文件
		 _initUploadFiles:function(FileId){
			 var _self = this;
			 var contextPath = _self.get('contextPath');
			 var postLoad=new PostLoad({
					url:contextPath + 'attachFile/getFilesByAttachFileId.cn',
					el:_self.get('el')
				});
			 postLoad.load({attachFileId:FileId},function(result){
				//初始化上传附件
				_self._initUploader(result);
			 });
		 },
		 
		//初始化表单
		_initFormContainer:function(){
			var form = new FormContainer({
				id : 'AccountUpdateForm',
				colNum : 1,
				formChildrens : [
					{
						label : '资料名称：',
						redStarFlag : true,
						itemColspan : 1,
						item :'<input type="text" name="name" id="accountNameUp" data-rules="{required:true,maxlength:200}">'
					}
//					,{
//						label: '资料类型：',
//						redStarFlag: true,
//						itemColspan: 1,
//						item: '<select name="technicalInfoType" id="dataTypeUp" data-rules="{required:true}"></select>'
//					}
					,{
						label: '处所：',
						redStarFlag: true,
						itemColspan: 1,
						item: '<input type="text" name="address" id="place" data-rules="{required:true,maxlength:200}">'
					},{
						label: '附件：',
						itemColspan: 1,
						item: '<div name="attachFileId" id="uploadFileUpdateDiv"/>'
					},{
						label: '备注：',
						itemColspan : 1,
						item :'<textarea name="remark" id="remarkUpdate" style="width:99.5%;height:95px;overflow-y :auto" maxlength="250" placeholder="最多输入250字"/>'
					}
				]
			});
			return form;
		},
		//实例化下拉框值数据
		_selectAutoFilling:function(){
			technicalInfo_type.listData("#dataTypeUp");
		},
		
		//保存数据
		_saveData:function(){
			var _self = this;
			var contextPath = _self.get('contextPath');
			var fileId = _self.get('fileId');
    		var form = _self.getChild('AccountUpdateForm',true);
			// 验证不通过
	    	 if(!form.isValid()) {
	    		 return; 
	    	 }
	    	 var data = form.serializeToObject();
			 // 获取上传文件
		     var uploadFileArr = _self._getUploadFileData();
		     data.uploadFileArr=JSON.stringify(uploadFileArr);
		     data.id=fileId;
		     //执行提交到数据库的方法
		     var postLoad = new PostLoad({
					url : contextPath + 'technicalDocument/updateTechnical.cn',
					el : _self.get('el'),
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
	},{
		ATTRS : {
			title : {value : '修改资料'},
			width : {value : 575},
			height : {value : 310},
			contextPath : {},
			fileId: {},
			closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
	        mask: {value: true},//非模态弹出框
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
	return TechnicalDocumentPageNewUpdate;
});