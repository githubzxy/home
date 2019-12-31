define('views/commonjs/TrainingUpdate',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer',
		'common/data/PostLoad','bui/uploader','common/uploader/UpdateUploader',
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),
		FormContainer = require('common/form/FormContainer'),Uploader=require('bui/uploader'),
		Calendar=require('bui/calendar'),UpdateUploader=require('common/uploader/UpdateUploader'),Overlay=require('bui/overlay'),PostLoad=require('common/data/PostLoad');
	var UploadFileDto=function(name,path){
		this.name = name;
		this.path = path;
	};
	var UpdateTraining =Overlay.Dialog.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._getForm());
			
		},
		_getForm:function(){
			var _self=this;
			var form = new FormContainer({
				id:'updateTrainingForm',
				colNum:2,
				formChildrens:[{
					label:'计划名称',
		    		redStarFlag : true,
		    		itemColspan : 2,
		    		item:'<input type="text" id="updateProjectName" name="name" style="width: 99.3%;" data-rules="{required:true,maxlength:100}"/><input type="hidden" name="id" id="updateProjectId"/>'
				},{
						label:'附件',
						redStarFlag : false,
			    		itemColspan : 2,
			    		item:'<div id="updateUploadDiv"  style="overflow-y: hidden;overflow-x: hidden;width: 99.3%;"></div><input type="hidden" name="uploadFileArr" id="updateUploadFileArr" />',
				}]
			});
				return form;
		},
		_initStore:function(){
			var _self=this;
			var contextPath=_self.get('contextPath');
			var pathForQueryById=_self.get('pathForQueryById');
			var store=new Data.Store({
				 url:contextPath+pathForQueryById,
				 proxy : {
				      method : 'post',
				      dataType : 'json'
				    },
			});
			_self.set('updateStore',store);
		},
		renderUI:function(){
			var _self=this;
			var contextPath = _self.get('contextPath');
			_self._setBtn();
			_self._setPageData();
		},
		_setPageData:function(){
			var _self=this;
			var contextPath=_self.get('contextPath');
			var pathForQueryById=_self.get('pathForQueryById');
			var postLoad =new PostLoad({
				url:contextPath +pathForQueryById,
				el:_self.get('el'),
				loadMsg:'获取中...'
			}); 
			postLoad.load({id:_self.get('updateTrainingId')},function(data){
				$("#updateProjectId").val(data.id);
				$("#updateProjectName").val(data.name);
				if(data.attachFile != null){
					_self._initUploadFiles(data.attachFile.id);
				}else{
					_self._initUploader('');
				}
			}); 
		},
//		初始化上传控件和加载以上传的文件
		_initUploader:function(uploadFiles){
			var _self = this,contextPath = _self.get('contextPath');
			var updateUploader = new UpdateUploader({
				render: '#updateUploadDiv',
				alreadyItems : uploadFiles,
				url: contextPath + 'attachFile/upload.cn',
				isSuccess : function(result){
					return true;
				}
			});
			updateUploader.render();
			_self.set('uploader',updateUploader);
		},
//		获取上传的文件
		_initUploadFiles:function(attachFileIdParam){
			var _self=this;
			var postLoad =new PostLoad({
				url:contextPath +'attachFile/getFilesByAttachFileId.cn',
				el:_self.get('el'),
				loadMsg:'获取中...'
			}); 
			postLoad.load({"attachFileId":attachFileIdParam},function(data){
					var fileList=_self._getQueueList(data);
					_self._initUploader(fileList);
			}); 
		},
//		获取上传队列item
		_getQueueList:function(files){
			var fileList=[];
			for(var i=0;i<files.length;i++){
				var dto=new UploadFileDto(files[i].name,files[i].path)
				fileList.push(dto);
			}
			return fileList;
		},
//		设置dailog按钮
		_setBtn:function(){
			var _self=this;
			var buttons = [
				{
					text:'保存',
					elCls:'button  _saveData',
					handler : function(){
			            	var _self = this,
			            	success = _self.get('success');
				            if(success){
				              success.call(_self);
				            }
					}
				},
				{
					  text:'取消',
					  elCls : 'button ',
					  handler : function(dialog,btn){
					        if(this.onCancel() !== false){
					        	this.close();
					        }
					  }
				}
			];
			_self.set('buttons',buttons);
		},
		bindUI:function(){
			var _self=this;
		},
//		保存页面数据
		_saveData:function(){
			var _self=this;
			var pathForModify = _self.get('pathForModify');
			var contextPath = _self.get('contextPath');
//			验证
			var form = _self.getChild('updateTrainingForm',true);
			if(!form.isValid()){
				return;
			}
			var data = _self._getData(_self,form);
			var postLoad =new PostLoad({
				url:contextPath +pathForModify,
				el:_self.get('el'),
				loadMsg:'保存中...'
			}); 
			postLoad.load(data,function(result){
				_self.fire("saveBtn",{
					result : result,
				});
			});
		},
		//获取页面数据
		_getData:function(_self,form){
			var data=form.serializeToObject();
			var uploader=_self.get('uploader');
			var arr = new Array();
			var fileArray = uploader.getSucFiles();
			for(var i in fileArray){
		    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
				arr[i] = dto; // 向集合添加对象
			};
			data.uploadFileArr=JSON.stringify(arr);
			return data;
		}
	},{ATTRS:{
		id:{value:'updateTraining'},
		title:{},
		updateTrainingId:{},//修改计划的id
		closeAction:{value:"destroy"},
		contextPath : {},
		orgId:{},
		pathForQueryById:{},//根据id查询
		pathForModify:{},//修改路径
		width:{value:500},
		height:{value:200},
		mask:{value:true},
		success:{
			value:function(){
				var _self=this;
				_self._saveData();
			}
		},
		events:{
			value: {'saveBtn': true}
		}
	}});
	return UpdateTraining;
});