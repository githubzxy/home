define('views/commonjs/TrainingDetail',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer',
		'common/data/PostLoad','bui/uploader','common/grid/GridBtn','views/commonjs/DetailForDetailTraining','common/uploader/ViewUploader',
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),GridBtn= require('common/grid/GridBtn'),
		FormContainer = require('common/form/FormContainer'),Uploader=require('bui/uploader'),
		DetailForDetailTraining=require('views/commonjs/DetailForDetailTraining'),
		ViewUploader=require('common/uploader/ViewUploader'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay'),PostLoad=require('common/data/PostLoad');
	var DetailTraining=Overlay.Dialog.extend({
		initializer:function(){
		   var _self=this;
		   _self.addChild(_self._getForm());
		   _self.addChild(_self._getGrid());
		},
		
		_getForm:function(){
			var _self=this;
			var form = new FormContainer({
				id:'detailTrainingForm',
				colNum:2,
				formChildrens:[{
					label:'计划名称',
		    		redStarFlag : false,
		    		itemColspan : 2,
		    		item:'<input type="text" id="detailProjectName" readonly="readonly"  style="width: 99.3%;" />'
				},{
					label:'创建时间',
		    		redStarFlag : false,
		    		itemColspan : 1,
		    		item:'<input type="text" id="detailCreateTime"  style="width: 99.3%;" readonly="readonly" >',
				},{
					label:'创建人',
		    		redStarFlag : false,
		    		itemColspan : 1,
		    		item:'<input type="text" id="detailCreateUser" style="width: 99.3%;" readonly="readonly" >',
				},{
						label:'附件',
						redStarFlag : false,
			    		itemColspan : 2,
			    		item:'<div id="detailUploadDiv"  style="overflow-y: auto;overflow-x: hidden;width: 99.3%;height: 90px;">',
				}]
			});
				return form;
		},
		_getGrid:function(){
			var _self=this;
			var columns=_self._getGridColumns();
			var items=_self._getGridItems();
			var grid=new Grid.Grid({
				id:'detailTrainingGrid',
				tbar:{items:items},
				loadMask : true,
				idField : 'id',
				columns :columns,
				plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber],
	            store : _self._getStore(),
	            width : '100%',
	            height: 200,
	            elAttrs :{'id':'detailTrainingGrid'},
			});
			return grid;
		},
		_getStore:function(){
			var _self=this;
			var store=new Data.Store({
				pageSize : 100,
				url : _self.get('contextPath') +_self.get('getAllShop'),
				params : {         //设置请求时的参数
				      id : _self.get('detailTrainingId')
				},
				proxy : {
					method : 'post',
					dataType : 'json',
				},
				autoLoad:true,
			});
			_self.set('orgStore',store)
			return store;
		},
		_getGridItems:function(){
			var showErrorMsgHtml = '<div id="showErrorMsg" class="tips tips-small tips-warning" style="display:none">'+
	        '<span id="showErrorSpan" class="x-icon x-icon-small x-icon-error"><i class="icon icon-white icon-bell"/></span>'+
	        '<div id="showErrorResultMsg" class="tips-content" style="width:100%;"></div>'+
	        '</div>';
			return [{
                btnCls : 'button button-small detailFormGridBtnForDetail',
                text : '<i class="icon-list-alt "></i>详情',
              },
              {
                btnCls : 'button button-small detailFormGridBtnForDownLoad',
                text : '<i class="icon-download "></i>附件打包',
              },{
				xclass : 'bar-item-text',
				text : showErrorMsgHtml
		}];
		},
		_getGridColumns:function(){
			return [{
				title:'部门',
				dataIndex:'org',
				width:'157px',
				renderer:function(value){
					return value == null?"":value.name;
				}
			},
			{
				title:'汇报时间',
				dataIndex:'replyTime',
				width:'140px',
				renderer: Grid.Format.datetimeRenderer
			},
			{
				title:'汇报内容',
				dataIndex:'content',
				width:'235px'
			},];
		},
//		********初始化完成********
		renderUI:function(){
		   var _self=this;
		   _self.set('buttons',[]);
		   _self._getFormDate();
		},
		_getFormDate:function(){
			var _self=this;
			$('#detailTrainingGrid .bui-grid-body').css('overflow-y','auto');
			var contextPath=_self.get('contextPath');
			var pathForQueryById=_self.get('pathForQueryById');
			var postLoad =new PostLoad({
				url:contextPath +pathForQueryById,
				el:_self.get('el'),
				loadMsg:'获取中...'
			}); 
			postLoad.load({id:_self.get('detailTrainingId')},function(data){
				$("#detailProjectName").val(data.name);
				$("#detailCreateUser").val(data.user.name);
				$("#detailCreateTime").val(data.time);
				if(data.attachFile){
					_self._setAttachFileId(data.attachFile.id);
				}
			}); 
		},
		_setAttachFileId:function(attachFileIdParam){
			var _self=this;   
			_self._getFilesByAttachFileId(attachFileIdParam);
		},
//		利用公用组件展示文件
		_showByCommonController:function(result){
			var _self=this;
			var viewUploader = new ViewUploader({
				render:'#detailUploadDiv',
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
		
		
		
		_initFileFormatPath:function(){
			var _self=this; 
			$.ajax({
		        url: contextPath + "/configFile/url.xml",
		        type: 'GET',
		        dataType: 'xml',
		        async: false,
		        success: function(xml) {
		        	var fileFormatPath = $(xml).find("content").last().text();
		        	_self.set('fileFormatPath',fileFormatPath);
		        }
		    });
		},
		_initDownLoadFiles:function(downLoadFileId){
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
					
					var content = ""; 
					var fileFormatPath=_self.get('fileFormatPath');
					for(var i=0;i<result.length;i++){
						content += "<div><span>" + result[i].name + "</span>"
						+ "<span class='attachFileSpan'>";
						if(result[i].path.indexOf('1501217398126') != -1 
								|| result[i].path.indexOf('1501220842455') != -1
								|| result[i].path.indexOf('1501223958022') != -1
								|| result[i].path.indexOf('1501227005153') != -1
								|| result[i].path.indexOf('1501247125857') != -1
								|| result[i].path.indexOf('1501248032560') != -1
								|| result[i].path.indexOf('1501249761350') != -1){
						    content += "	<a href='/RINMS2MAIN/files/"+result[i].path+"' download='video'>下载</a>";
						}else{
							var name = (result[i].name).replace(new RegExp("#","gm"),"%23");
							name=encodeURI(encodeURI(name));
						    content += "	<a href='/RINMS2MAIN/DownloadFileServlet?fileName="+name+"&filePath="+result[i].path+"'>下载</a>";
						}
						// content += "<a href='/RINMS2MAIN/views/accidentTraining/commonjsp/accidentCommunicatePageOffice.jsp?filePath=" + result[i].path + "' target='_blank'>预览</a>"
                        content += "</span></div>";
							$("#detailUploadDiv").html(content);
					}
				});
		},
		bindUI:function(){
		   var _self=this;
		   var table=_self.getChild('detailTrainingGrid',true);
		   var contextPath = _self.get('contextPath');
		   $('.detailFormGridBtnForDetail').on('click',function(){
			   	var selections = table.getSelection();
				var selectionsLength=selections.length;
				if(!selectionsLength){
					_self._showCommonFailure('请选择一条记录查看');
					return;
				}
				if(selectionsLength>1){
					_self._showCommonFailure('只能选择一条记录查看');
					return;
				}
				_self.set('zIndex',1060);
				var detailForDetailTraining=new DetailForDetailTraining({
					contextPath:contextPath,
					title:dialogTitle+'汇报详情',
					detailForOrgId:selections[0].id,//查看的id
					trainingShopPath:_self.get('trainingShopPath'),
					zIndex:1070
				});
				detailForDetailTraining.show()
				detailForDetailTraining.on('closing',function(e){
					_self.set('zIndex',1070);
					_self.get('orgStore').load();
					
				});
				
		   });
		   $('.detailFormGridBtnForDownLoad').on('click',function(){
				var selections = table.getSelection();
				var selectionsLength=selections.length;
				var contextPath = _self.get('contextPath');
				var url=contextPath+_self.get('getZipFile');
				var shopStr=_self.get('shopStr');
				if(!selectionsLength){
					_self._showCommonFailure('请选择至少一条记录进行附件打包');
					return;
				}
				var postLoad =new PostLoad({
					url:url,
					el:_self.get('el'),
					loadMsg:'获取中...'
				}); 
				var data=_self._getData(shopStr,_self,selections);
				if(!data){
					return;
				}
				postLoad.load(data,function(result){
					if(result =='0'){
						_self._showCommonFailure("所选项里无附件打包！");
						return;
					}
					_self._packaging(result);
					
				});
		   });
		},
		 _getData:function(shopStr,_self,selections){
			  if(shopStr=='communicateShopStr'){
				  return {'communicateShopStr':JSON.stringify(selections)}; 
			  }else if(shopStr=='accidentShopStr'){
				 return {'accidentShopStr':JSON.stringify(selections)};
			  }else{
				  _self._showCommonFailure("下载数据错误");
				  return null;
			  } 
		   },
		 _packaging:function(url){
			 var _self=this;
			 	var title=_self.get('title').substr(2,4)+'回复附件_';
				var time = $('#fileDownTime').val();
				var title=encodeURI(encodeURI(title));
				window.location.href ='/kunmingrinms/DownloadFileServlet?fileName='+title+time+'.zip&filePath='+url;
		   },
		_showCommonFailure:function(msg){
			if(msg == null || msg.trim() == ''){
				msg = '系统繁忙请稍后重试';
			}
			$('#showErrorResultMsg').empty();
			$('#showErrorResultMsg').append(msg);
			$('#showErrorMsg').show();
			$('#showErrorMsg').fadeOut(1000);
		}
	},{ATTRS:{
		id:{value:'detailTraining'},
		title:{},
		detailTrainingId:{},//查看计划的id
		closeAction:{value:"destroy"},
		contextPath : {},
		orgId:{},
		getAllShop:{},
		trainingShopPath:{},//事件组织路局
		getZipFile:{},
		pathForQueryById:{},//根据id查询
		width:{value:650},
		shopStr:{},
		height:{value:470},
		mask:{value:true},
	}});
	return DetailTraining;
});