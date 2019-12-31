define('views/commonjs/ReportPlan',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer','common/uploader/UpdateUploader',
		'common/data/PostLoad','bui/tree','bui/extensions/treepicker','bui/uploader','common/uploader/ViewUploader',
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),
		FormContainer = require('common/form/FormContainer'),Tree=require('bui/tree'),
		ViewUploader=require('common/uploader/ViewUploader'),UpdateUploader=require('common/uploader/UpdateUploader'),
		TreePicker=require('bui/extensions/treepicker'),Uploader=require('bui/uploader'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay'),PostLoad=require('common/data/PostLoad');
	var UploadFileDto=function(name,path){
		this.name = name;
		this.path = path;
	};
	var ReportPlan=Overlay.Dialog.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._initForm());
		},
		_initForm:function(){
			var _self=this;
			var form = new FormContainer({
				id:'reportPlanForm',
				colNum:2,
				formChildrens:[{
					label:'计划名称',
		    		redStarFlag :false,
		    		itemColspan : 2,
		    		item:'<input type="text" id="reportProjectName" readonly="readonly"  style="width: 99.3%;">',
				},{
					label:'创建时间',
					redStarFlag : false,
		    		itemColspan : 1,
		    		item:'<input type="text" id="reportCreateTime" readonly="readonly"  style="width: 99%;">',
				},{
					label:'创建人',
					redStarFlag : false,
		    		itemColspan : 1,
		    		item:'<input type="text" id="reportCreateUser" readonly="readonly"  style="width: 99%;">',
				},{
					label:'计划附件',
					redStarFlag : false,
		    		itemColspan : 2,
		    		item:'<div id="reportDownloadDiv"  style="overflow-y: auto;overflow-x: hidden;width: 99.3%;height: 60px;">',
				},{
					label:'汇报内容',
					redStarFlag : true,
		    		itemColspan : 2,
		    		item:'<textarea name="content" id="reportContent" data-rules="{required:true,maxlength:100}" style="width:98.2%;height:70px;resize:none" ></textarea>'
				},{
					label:'汇报附件',
					redStarFlag : false,
		    		itemColspan : 2,
		    		item:'<div id="reportUploadDiv"  style="overflow-y: auto;overflow-x: hidden;width: 99.3%;height:80px;"><input type="hidden"  name="id" id="contentId"/>'+
		    			'<input type="hidden" name="uploadFileArr" id="reportUploadFileArr" />'
				}],
				
			});
			return form;
		},
		renderUI:function(){
			var _self=this;
			_self._getBtns();
			_self._getPageData();
		},
//	   获取回报计划的数据
		_getPageData:function(){
			var _self=this;
			var postLoad =new PostLoad({
				url:_self.get('contextPath') +_self.get('pathForQueryPlan'),
				el:_self.get('el'),
				loadMsg:'获取中...'
			}); 
			postLoad.load({'id':_self.get('reportPlanId')},function(item){
				$("#reportProjectName").val(item.name);
				$("#reportCreateTime").val(item.time);
				$("#reportCreateUser").val(item.user.name);
				if(item.attachFile){
					_self._setAttachFileId(item.attachFile.id);
				}
			});
			_self._getReportData();
		},
		_setAttachFileId:function(attachFileIdParam){
			var _self=this;
			_self._getFilesByAttachFileId(attachFileIdParam);
		},
		_showByCommonController:function(result){
			var _self=this;
			var viewUploader = new ViewUploader({
				render:'#reportDownloadDiv',
				alreadyItems : result,
				servlet:'DownloadFileServlet',
				previewUrl:'/RINMS2MAIN/views/accidentTraining/commonjsp/accidentCommunicatePageOffice.jsp'
			}); 
			viewUploader.render();
		},
		_getFilesByAttachFileId:function(downLoadFileId){
			var _self=this; 
			var ids = downLoadFileId.split(',');
			   var url;
			   if(ids.length > 1){
				   url = contextPath + 'attachFile/getFilesByAttachFileIds.cn';
			   }else{
				   url = contextPath + 'attachFile/getFilesByAttachFileId.cn';
			   }
			   var postLoad =new PostLoad({
					url:url,
					el:_self.get('el'),
					loadMsg:'获取中...'
				});
			   postLoad.load({attachFileId : downLoadFileId},function(result){
				   var arr=new Array();
				   for(var i=0;i<result.length;i++){
					   arr.push(result[i]);
				   }
				   _self._showByCommonController(arr);
			   });
		},
//		获取已汇报的数据
		_getReportData:function(){
			var _self=this;
			var postLoad =new PostLoad({
				url:_self.get('contextPath') +_self.get('pathForQueryReport'),
				el:_self.get('el'),
				loadMsg:'获取中...'
			}); 
			postLoad.load({'id':_self.get('reportPlanId')},function(data){
				var uploader = _self.get('uploader');
				$("#reportContent").val(data.content);
				if(data.attachFile){
					_self._setUploadAttachFileId(data.attachFile.id);
				}else{
					_self._initUploader('');
				}
			});
		},
//		获取附件id
		_setUploadAttachFileId:function(attachFileIdParam){
			var _self=this;
			var uploadFileId = attachFileIdParam;
			_self._initUploadFiles(attachFileIdParam);
		},
//		获取已上传的附件
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
//		初始化上傳控件
		_initUploader:function(uploadFiles){
			var _self = this,contextPath = _self.get('contextPath');
			var updateUploader = new UpdateUploader({
				render: '#reportUploadDiv',
				alreadyItems : uploadFiles,
				url: contextPath + 'attachFile/upload.cn',
				isSuccess : function(result){
					return true;
				}
			});
			updateUploader.render();
			_self.set('uploader',updateUploader);
		},
//		附件序列化
		_getQueueList:function(files){
			var fileList=[];
			for(var i=0;i<files.length;i++){
				var dto=new UploadFileDto(files[i].name,files[i].path)
				fileList.push(dto);
			}
			return fileList;
		},
		_getBtns:function(){
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
		_saveDate:function(){
			var _self=this;
			var pathForSaveReportPlan = _self.get('pathForSaveReportPlan');
			var contextPath = _self.get('contextPath');
//			验证
			var form = _self.getChild('reportPlanForm',true);
			if(!form.isValid()){
				return;
			}
			var data=_self._getFileData(form,_self);
			var postLoad =new PostLoad({
				url:contextPath +pathForSaveReportPlan,
				el:_self.get('el'),
				loadMsg:'保存中...'
			}); 
			postLoad.load(data,function(result){
				_self.fire("saveBtn",{
					result : result,
				});
			});
		},
		_getFileData:function(form,_self){
			var data=form.serializeToObject();
			var uploader=_self.get('uploader');
			data.id=_self.get('reportPlanId');
			var arr = new Array();
			var fileArray = uploader.getSucFiles();
			for(var i in fileArray){
		    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
				arr[i] = dto; // 向集合添加对象
			};
			data.uploadFileArr=JSON.stringify(arr);
			return data;
		},
	},{ATTRS:{
		id:{value:'reprotPlanForm'},
		title:{},
		closeAction:{value:"destroy"},
		contextPath : {},
		pathForQueryPlan:{},
		reportPlanId:{},
		width:{value:600},
		height:{value:380},
		pathForQueryReport:{},
		pathForSaveReportPlan:{},
		mask:{value:true},
		events:{
    		value: {'saveBtn': true}
    	},
    	success:{
    		value:function(){
    		   this._saveDate();
    		},
    	},
	}});
	return ReportPlan;
});