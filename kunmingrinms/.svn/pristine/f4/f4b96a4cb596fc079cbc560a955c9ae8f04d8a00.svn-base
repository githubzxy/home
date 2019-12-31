define('views/commonjs/DetailForDetailTraining',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer',
		'common/data/PostLoad','bui/uploader','common/grid/GridBtn','common/uploader/ViewUploader',
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),GridBtn= require('common/grid/GridBtn'),
		FormContainer = require('common/form/FormContainer'),Uploader=require('bui/uploader'),
		ViewUploader=require('common/uploader/ViewUploader'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay'),PostLoad=require('common/data/PostLoad');
	var DetailForDetailTraining=Overlay.Dialog.extend({
		initializer:function(){
			 var _self=this; 
			 _self.addChild(_self._getShopAnswerForm());
		},
		_getShopAnswerForm:function(){
			 var _self=this;
			 var form = new FormContainer({
				 id:'shopAnswerForm',
				 colNum:2,
				 formChildrens:[{
					 label:'部门',
			    	 redStarFlag : false,
			    	 itemColspan : 1, 
			    	 item:'<input type="text" id="reportOrg" readonly="readonly"  style="width: 99.3%;" />',
				 },{
					 label:'汇报时间',
			    	 redStarFlag : false,
			    	 itemColspan : 1, 
			    	 item:'<input type="text" id="reportReplyTime" readonly="readonly"  style="width: 99.3%;" />', 
				 },{
					 label:'内容',
			    	 redStarFlag : false,
			    	 itemColspan : 2, 
			    	 item:'<textarea id="reportContent" style="width: 99.3%;height: 80px;" readonly="readonly"></textarea>'
				 },{
					 label:'附件',
			    	 redStarFlag : false,
			    	 itemColspan : 2, 
			    	 item:'<div id="reportUploadDiv"  style="overflow-y: auto;overflow-x: hidden;width: 99.3%;height: 90px;">',
				 }],
			 });
			 return form;
		},
		renderUI:function(){
			 var _self=this;
			 _self.set('buttons',[]);
			 _self._getPageData();
		},
		_getPageData:function(){
			 var _self=this;
			var trainingShopPath=_self.get('trainingShopPath');
			var contextPath=_self.get('contextPath');
			var postLoad =new PostLoad({
				url:contextPath +trainingShopPath,
				el:_self.get('el'),
				loadMsg:'获取中...'
			}); 
			postLoad.load({id:_self.get('detailForOrgId')},function(data){
				var el=_self.getChild('shopAnswerForm',true).get('el');
				$("#reportOrg").val(data.org.name);
				$("#reportReplyTime").val(data.replyTime);
				$("#reportContent").val(data.content);
				if(data.attachFile){
				    _self._setAttachFileId(data.attachFile.id,el);
				}
			}); 
		},
		_setAttachFileId:function(attachFileIdParam,idChooser){
			var _self=this;   
			var downLoadFileId = attachFileIdParam;
//			   _self._initFileFormatPath();
			   _self._getFilesByAttachFileId(downLoadFileId);
		},
//		利用公用组件展示上传的文件
		_showByCommonController:function(result){
			var _self=this;
			var viewUploader = new ViewUploader({
				render:'#reportUploadDiv',
				servlet:'DownloadFileServlet',
				alreadyItems : result,
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
//		_initFileFormatPath:function(){
//			var _self=this; 
//			$.ajax({
//		        url: contextPath + "/configFile/url.xml",
//		        type: 'GET',
//		        dataType: 'xml',
//		        async: false,
//		        success: function(xml) {
//		        	var fileFormatPath = $(xml).find("content").last().text();
//		        	_self.set('fileFormatPath',fileFormatPath);
//		        }
//		    });
//		},
//		_initDownLoadFiles:function(downLoadFileId,idChooser){
//			var _self=this; 
//			var ids = downLoadFileId.split(',');
//			   var url;
//			   if(ids.length > 1){
//				   url = contextPath + 'attachFile/getFilesByAttachFileIds.cn';
//			   }else{
//				   url = contextPath + 'attachFile/getFilesByAttachFileId.cn';
//			   }
//			   var postLoad =new PostLoad({
//					url:url,
//					el:_self.get('el'),
//					loadMsg:'获取中...'
//				}); 
//				postLoad.load({attachFileId : downLoadFileId},function(result){
//					
//					var content = ""; 
//					var fileFormatPath=_self.get('fileFormatPath');
//					for(var i=0;i<result.length;i++){
//						content += "<div><span>" + result[i].name + "</span>"
//						+ "<span class='attachFileSpan'>";
//						if(result[i].path.indexOf('1501217398126') != -1 
//								|| result[i].path.indexOf('1501220842455') != -1
//								|| result[i].path.indexOf('1501223958022') != -1
//								|| result[i].path.indexOf('1501227005153') != -1
//								|| result[i].path.indexOf('1501247125857') != -1
//								|| result[i].path.indexOf('1501248032560') != -1
//								|| result[i].path.indexOf('1501249761350') != -1){
//						    content += "	<a href='/RINMS2MAIN/files/"+result[i].path+"' download='video'>下载</a>";
//						}else{
//							var name = (result[i].name).replace(new RegExp("#","gm"),"%23");
////							采用get请求，中文出现乱码，故需要在前端进行两次编码
//							name=encodeURI(encodeURI(name));//编码为iso8859-1:详情参考js encodeURI
//						    content += "	<a href='/RINMS2MAIN/DownloadFileServlet?fileName="+name+"&filePath="+result[i].path+"'>下载</a>";
//						}
//						content += "	<a href='"+ fileFormatPath +"?fileName=" + result[i].path + "' target='_blank'>预览</a>"
//										+ "</span>"
//										+ "</div><p></p>";
//							$("#reportUploadDiv").html(content);
//					}
//				});
//		},
		bindUI:function(){
			 var _self=this;
		},
	},{ATTRS:{
		id:{value:'detailForDetailTraining'},
		title:{},
		trainingShopPath:{},//演练组织工区
		detailForOrgId:{},
		closeAction:{value:"destroy"},
		contextPath : {},
		width:{value:625},
		height:{value:310},
		mask:{value:true},
	}});
	return DetailForDetailTraining;
});