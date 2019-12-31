/**
 * 产品说明书修改模块
 */
define('views/technical/productInstructionUpdate',
		['bui/common',
		'common/form/FormContainer',
		'common/uploader/UpdateUploader',
		'common/data/PostLoad',
		'bui/form'],
	function(require){
		var BUI = require('bui/common');
		var	FormContainer = require('common/form/FormContainer');
		var	UpdateUploader = require('common/uploader/UpdateUploader');
		var	PostLoad = require('common/data/PostLoad');
		var	Form = require('bui/form');
			
		var ProductInstructionUpdate = BUI.Overlay.Dialog.extend({
			//初始化弹框控件
			initializer : function(){
				var _self = this;
				_self.addChild(_self._initFormContainer());
			},
			
			//渲染表单控件
			renderUI : function(){
				var _self = this;
				_self._initUpdateData();   //初始化修改的数据
				_self._selectAutoFilling();//初始化资料类别
			},
			
			//绑定事件
			bindUI : function(){
				var _self = this;
				//隐藏本页面单选框里的第一个空白框
				$(".bui-stdmod-body select option[value='']").hide();
				//添加产品说明书名称悬浮提示
	    		$('#instructionNameUpdate').on('mouseover',function(){
	    			var str=$('#instructionNameUpdate').val();
	    			$('#instructionNameUpdate').attr('title',str);
	    		});
	    		var buttons = [{
	    			text:'保存',
	    			elCls:'button',
	    			handler : function(){
	    				_self._saveData();
	    			}
	    		},{
	    			text:'关闭',
	    			elCls : 'button',
	    			handler : function(){
	    				_self.close();
	    			}
	    		}];
				_self.set('buttons',buttons);
			},
			
			//初始化修改的数据
			_initUpdateData:function(){
				var _self = this,contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
				var postLoad=new PostLoad({
					url:contextPath + 'productInstruction/getProductInstructionById.cn',
					el:_self.get('el')
				});
				postLoad.load({id : fileId},function(result){
					$('#instructionNameUpdate').val(result.name);
					$('#technicalInfoTypeUpdate').val(result.technicalInfoType);
					$('#remarkUpdate').val(result.remark);
					if(result.attachFile != null){//存在附件
						_self._initUploadFiles(result.attachFile.id);
					}else{
						_self._initUploader("");
					}
				});
			},
			
			//初始化上传文件控件
			_initUploader:function(uploadFiles){
				var _self = this,contextPath = _self.get('contextPath');
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
				var _self = this,uploader = _self.get('updateUploader');
				var arr = new Array(); //声明数组,存储数据发往后台
				//获取上传文件的对列
				var fileArray = uploader.getSucFiles();
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
				 var _self = this,contextPath = _self.get('contextPath');
				 var postLoad=new PostLoad({
						url:contextPath + 'attachFile/getFilesByAttachFileId.cn',
						el:_self.get('el')
					});
				 postLoad.load({attachFileId : FileId},function(result){
					//初始化上传附件
					_self._initUploader(result);
				 });
			 },
			 
			//初始化表单
			_initFormContainer:function(){
				var form = new FormContainer({
					id : 'instructionUpdateForm',
					colNum : 2,
					formChildrens : [{
						label: '产品说明书:',
						redStarFlag: true,
						itemColspan: 2,
						item: '<input type="text" name="name" id="instructionNameUpdate" data-rules="{required:true}"/>'
					},{
						label: '资料类别:',
						redStarFlag: true,
						itemColspan: 2,
						item: '<select name="technicalInfoType" id="technicalInfoTypeUpdate" data-rules="{required:true}"><option value=""></option></select>'
					},{
						label: '附件:',
						itemColspan: 2,
						item: '<div name="uploadFileArr" id="uploadFileUpdateDiv" style="height:100px;overflow-y:auto"></div>'
					},{
						label: '备注:',
						itemColspan : 2,
						item :'<textarea name="remark" id="remarkUpdate" style="width:99.5%;height:100px;overflow-y :auto" maxlength="250" placeholder="最多输入250字"/>'
					}]
				});
				return form;
			},
			
			//初始化资料类别下拉框值数据
			_selectAutoFilling:function(){
				technicalInfo_type.listData("#technicalInfoTypeUpdate");
			},
			
			//保存修改数据
			_saveData:function(){
				var _self = this,contextPath = _self.get('contextPath'),fileId = _self.get('fileId');
        		var form = _self.getChild('instructionUpdateForm');
				// 验证不通过
		    	if(!form.isValid()) {
		    		 return;
		    	}
		    	var data=form.serializeToObject();
				// 获取上传文件
			    var uploadFileArr = _self._getUploadFileData();
			    var param = {
					    id:fileId,
					    name:data.name,
					    technicalInfoType:data.technicalInfoType,
						remark:data.remark,
						uploadFileArr:JSON.stringify(uploadFileArr)
		        };
			    //执行提交到数据库的方法
			    var postLoad = new PostLoad({
						url : contextPath + 'productInstruction/updateProductInstruction.cn',
						el : _self.get('el'),
						loadMsg : '保存中...'
				}); 
				postLoad.load(param, function(result){
					if(result != null){
						_self.fire("completeUpdateSave",{
							result : result
						});
					}
				});
			}
		},{
			ATTRS : {
				id:{value:'productInstructionUpdate'},
				title : {value : '修改产品说明书'},
				width : {value : 635},
				height : {value : 370},
				contextPath : {},
				fileId: {},
				closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
		        mask: {value: true},
		        events : {
		        	value : {
						// 绑定保存按钮事件
						'completeUpdateSave' : true,
					}
		        }
			}
		});
		return ProductInstructionUpdate;
});