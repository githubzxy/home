/**
   * 停机计划修改模块
 */
define('views/commNetStop/stopPlan/StopPlanUpdate',[
											'bui/overlay',
											'common/form/FormContainer',
											'common/uploader/UpdateUploader'
											],function(require){
	var Overlay = require('bui/overlay'),
	FormContainer = require('common/form/FormContainer'),
	UpdateUploader = require('common/uploader/UpdateUploader');
	var StopPlanUpdate = Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			var updateForm = _self._getForm();
			_self.addChild(updateForm); 
		},
		//绑定事件
		bindUI : function(){
			var _self = this;
			//加载下拉框值函数
			_self._selectAutoFilling();
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
		},
		//渲染表单控件
		renderUI : function(){
			var _self = this;
			_self._initUpdateData();
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
					  text:'取消',
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
		/**
		 * 初始化修改的数据
		 */
		_initUpdateData : function(){
			var _self = this,contextPath = _self.get('contextPath'),stopPlanUpdateId = _self.get('stopPlanUpdateId');
			$('#stopPlanUpdateId').val(stopPlanUpdateId);
			$.ajax({
				url : contextPath + 'commNetStopAction/getCommNetStopById.cn',
				type : 'POST',
				dataType : 'JSON',
				data : {
					id : stopPlanUpdateId
				},
				success : function(result){
					var data = result.data;
					$('#rainLineUpdate').val(data.railLineName);
					$('#startDateUpdate').val(data.startDate);
					$('#railwayUpdate').val(data.belongOffice);
					$('#endDateUpdate').val(data.endDate);
					$('#workContentUpdate').val(data.workContent);
					$('#majorUpdate').val(data.belongCraft);
					$('#constructionTypeUpdate').val(data.executionType);
					$('#constructionPropertyUpdate').val(data.executionAttr);
					$('#constructionAddressUpdate').val(data.executionAddr);
					$('#backboneNetworkUpdate').val(data.mainNetName);
					$('#relevantRailwayStationUpdate').val(data.railwaysBureau);
					$('#planAndReasonUpdate').val(data.planCaption);
					if(data.attachFile != null){//初始化上传附件
						var uploadFiles = _self._initUploadFiles(data.attachFile.id);
						_self._initUploader(uploadFiles);
					}else{
						_self._initUploader("");
					}
				}
			});
		},
		/**
		 * 初始化上传文件控件
		 * @param uploadFiles 上传文件集合
		 */
		_initUploader : function(uploadFiles){
			var _self = this,contextPath = _self.get('contextPath');
			var updateUploader = new UpdateUploader({
				render: '#filesUpdate',
				alreadyItems : uploadFiles,
				url : contextPath + 'attachFile/upload.cn',
				isSuccess : function(result){
					return true;
				}
			});
			updateUploader.render();
			_self.set('updateUploader',updateUploader);
		},
		/**
		 * 获取上传文件数据(上传的)
		 */
		getUploadFileData : function(){
			var _self = this,uploader = _self.get('updateUploader');
			var arr = new Array(); //声明数组,存储数据发往后台
			//获取上传文件的对列
			var fileArray = uploader.get("queue").getItems();
		 	for(var i in fileArray){
		    	var dto = new _self.UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
				arr[i] = dto; // 向集合添加对象
			};
			return arr;
		 },
		 /**
		  * 声明上传文件对象
		  * @param name 上传文件名
		  * @param path 上传文件路径
		  */
		 UploadFileDto : function(name, path){
			 this.name = name;
			 this.path = path;
		 },
		/**
		 * 根据附件ID,获取上传文件
		 * @param attachFileId 附件ID
		 */
		_initUploadFiles : function(attachFileId){
			var _self = this,contextPath = _self.get('contextPath');
			var uploadFiles = ""; 
			$.ajax({
				url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
				type : 'POST',
				dataType : 'JSON',
				async : false,
				data : {
					 attachFileId : attachFileId
				},
				success : function(data){
					uploadFiles = data;
				}
		   });
		   return uploadFiles;
		},
		/**
		 * 获取表单
		 */
		_getForm : function(){
			var form = new FormContainer({
				id : 'stopPlanUpdateForm',
				colNum : 2,
				formChildrens : [  //表单元素
					{
						label : '线路',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="railLineName" id="rainLineUpdate" style="width:100%;height:27px;" data-rules="{required : true}"/><input type="hidden" name="id" id="stopPlanUpdateId"/>'
					},
					{
						label : '计划开始时间',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" name="startDate" id="startDateUpdate" class="calendar calendar-time" style="width:99%;height:27px" data-rules="{required : true}" readonly="readonly"/>'
					},
					{
						label : '所属局',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" name="belongOffice" id="railwayUpdate" data-rules="{required:true,maxlength:50}" style="width:99%;height:25px" />'
					},
					{
						label : '计划结束时间',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" id="endDateUpdate" name="endDate" class="calendar calendar-time" style="width:99%;height:25px" data-rules="{required : true}" readonly="readonly"/>'
					},
					{
						label : '工作内容',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="workContent" id="workContentUpdate" style="width:100%;height:25px;" data-rules="{required : true}"/>'
					},
					{
						label : '所属专业',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="belongCraft" id="majorUpdate" style="width:100%;height:25px;" value="" data-rules="{required : true}"/>'
					},
					{
						label : '施工类别',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="executionType" id="constructionTypeUpdate" style="width:100%;height:25px;" data-rules="{required : true}"/>'
					},
					{
						label : '施工属性',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="executionAttr" id="constructionPropertyUpdate" style="width:100%;height:25px;" data-rules="{required : true}"/>'
					},
					{
						label : '施工地点',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="executionAddr" id="constructionAddressUpdate" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},
					{
						label : '涉及骨干网<br>名称',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="mainNetName" id="backboneNetworkUpdate"  data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},
					{
						label : '涉及铁路局',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="railwaysBureau" id="relevantRailwayStationUpdate" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},
					{
						label : '计划原因<br>说明',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="planCaption" id="planAndReasonUpdate" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},
					{
						label : '附件',
						itemColspan : 2,
						item : '<div id="filesUpdate"></div>'
					}
				]
			});
			return form;
		},
		/**
		 * 实例化下拉框值函数
		 */
		_selectAutoFilling : function(){
			commNetworkStop_rainLine.listData("#rainLineUpdate");
			commNetworkStop_workContent.listData("#workContentUpdate");
			commNetworkStop_major.listData("#majorUpdate");
			commNetworkStop_constructionType.listData("#constructionTypeUpdate");
			commNetworkStop_constructionAttr.listData("#constructionPropertyUpdate");
		},			
	},{
		//定义弹框属性
		ATTRS : {
			title : {value : '停机要点计划修改'},
			width : {value : 650},
			height : {value : 477},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			stopPlanUpdateId : {},
			closeAction : {
				value : 'destroy'
			},
			success : {
				value : function(){
					var _self = this,contextPath = _self.get('contextPath');
					var form = _self.getChild('stopPlanUpdateForm');
					// 验证不通过
			    	 if(!form.isValid()) {
			    		 return ;
			    	 }
			    	//序列化表单成对象，所有的键值都是字符串
			    	var data = form.serializeToObject();
			    	// 获取上传文件
			    	var uploadArr = _self.getUploadFileData();
			    	var param = {
			    			paramEdit : JSON.stringify(data),
							uploadArrEidt : JSON.stringify(uploadArr)
			    	};
			    	$.post(contextPath + 'commNetStopAction/updateCommNetStop.cn', param, function(result){
			    			//触发事件
			    		    _self.fire("completeUpdate",{
							result : result
		    	      });
			    	});
			    }
			},
			cancel : {
				value : function(){
					var _self = this;
					_self.fire("close");
				}
			},
			events : {
				value : {
					/**
					 * 绑定保存按钮事件
					 */
					'completeUpdate' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return StopPlanUpdate;
});