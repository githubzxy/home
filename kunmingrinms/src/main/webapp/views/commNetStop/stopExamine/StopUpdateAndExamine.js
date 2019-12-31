/**
 * 修改并审核停机计划模块
 */
define('views/commNetStop/stopExamine/StopUpdateAndExamine',
		['bui/overlay','common/uploader/UpdateUploader',
		 'common/form/FormContainer',
		 'common/uploader/ViewUploader'],function(require){
	var Overlay = require('bui/overlay'),
	UpdateUploader = require('common/uploader/UpdateUploader'),
	FormContainer = require('common/form/FormContainer'),
	ViewUploader = require('common/uploader/ViewUploader');
	var StopUpdateAndExamine = Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			var updateAndExamineForm = _self._getForm();
			_self.addChild(updateAndExamineForm);
		},
		//渲染弹框控件
		renderUI : function(){
			var _self = this;
			//设置表单id的值为选中项id
			$('#id').val(_self.get('stopUpdateAndExamineId'));
			//初始化弹框数据
			_self._initUpdateAndExamineData();
			var buttons = [
				{
					text:'修改并审核',
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
		//绑定事件
		bindUI : function(){
			var _self = this;
			//加载下拉框值函数
			_self._selectAutoFilling();
		},
		/**
		 * 实例化下拉框值函数
		 */
		_selectAutoFilling : function(){
			commNetworkStop_rainLine.listData("#rainLineEdit");
			commNetworkStop_workContent.listData("#workContentEdit");
			commNetworkStop_major.listData("#belongCraftEdit");
			commNetworkStop_constructionType.listData("#executionTypeEdit");
			commNetworkStop_constructionAttr.listData("#executionAttrEdit");
		},
	    /**
	     * 初始化表单数据
	     */
		_initUpdateAndExamineData : function(){
			var _self = this,contextPath = _self.get('contextPath'),
			stopUpdateAndExamineId = _self.get('stopUpdateAndExamineId');
			$('stopUpdateAndExamineId').val(stopUpdateAndExamineId);
			$.ajax({
				url : contextPath + 'commNetStopAction/getCommNetStopById.cn',
				type : 'POST',
				dataType : 'JSON',
				data : {
					id : stopUpdateAndExamineId
				},
				success : function(result){
					var recordCns = result.data;
					_self._setParamEdit(recordCns);
				}
			});
		},
		/**
		 * 设置弹出框参数方法
		 */
		_setParamEdit : function(recordCns){
			var _self = this;
			$("#rainLineEdit").val(recordCns.railLineName);
			$("#startDateEdit").val(recordCns.startDate);
			$("#belongOfficeEdit").val(recordCns.belongOffice);
			$("#endDateEdit").val(recordCns.endDate);
			$("#workContentEdit").val(recordCns.workContent);
			$("#belongCraftEdit").val(recordCns.belongCraft);
			$("#executionTypeEdit").val(recordCns.executionType);
			$("#executionAttrEdit").val(recordCns.executionAttr);
			$("#executionAddrEdit").val(recordCns.executionAddr);
			$("#mainNetNameEdit").val(recordCns.mainNetName);
			$("#railwaysBureauEdit").val(recordCns.railwaysBureau);
			$("#planCaptionEdit").val(recordCns.planCaption);
			$("#planExaminNumEdit").val(recordCns.planExaminNum);
			$("#monthPlanExaminEdit").val(recordCns.monthPlanExamin);
			$("#executionPlanNumEdit").val(recordCns.executionPlanNum);
			//初始化上传附件
			if(recordCns.attachFile){
				var uploadFiles = _self._initUploadFiles(recordCns.attachFile.id);
				_self._initUpdateUploader(uploadFiles);
			}else{
				_self._initUpdateUploader("");
			}	
			//初始化审核附件
			if(recordCns.examinFile){
				var uploadFiles = _self._initUploadFiles(recordCns.examinFile.id);	
				_self._initCheckUploader(uploadFiles);
			}else{
				_self._initCheckUploader("");
			}						
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
		 * 初始化附件上传文件控件
		 * @param uploadFiles 上传文件集合
		 */
		_initUpdateUploader : function(uploadFiles){
			var _self = this,contextPath = _self.get('contextPath');
			var updateUploader = new UpdateUploader({
				render: '#filesLoaderUpdate',
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
		 * 初始化批复附件上传文件控件
		 * @param uploadFiles 上传文件集合
		 */
		_initCheckUploader : function(uploadFiles){
			var _self = this,contextPath = _self.get('contextPath');
			var checkUploader = new UpdateUploader({
				render: '#filesLoaderCheck',
				alreadyItems : uploadFiles,
				url : contextPath + 'attachFile/upload.cn',
				isSuccess : function(result){
					return true;
				}
			});
			checkUploader.render();
			_self.set('checkUploader',checkUploader);		
		},
		/**
		 * 获取上传文件数据(上传的)
		 */
		getUploadFileData : function(uploader){
			var _self = this;
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
		 * 获取表单
		 */
		_getForm : function(){
			var form = new FormContainer({
				id : 'stopUpdateAndExamineId',
				colNum : 2,
				formChildrens : [
					{
						label : '线路',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="railLineName" id="rainLineEdit" style="width:100%;height:27px;" data-rules="{required : true}"/><input type="hidden" name="id" id="id"/>'						
					},{
						label : '计划开始时间',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" name="startDate" id="startDateEdit" class="calendar calendar-time" style="width:99%;height:27px" data-rules="{required : true}" readonly="readonly"/>'
					},{
						label : '所属局',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" name="belongOffice" id="belongOfficeEdit" data-rules="{required:true,maxlength:50}" style="width:99%;height:25px" />'
					},{
						label : '计划结束时间',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" id="endDateEdit" name="endDate" class="calendar calendar-time" style="width:99%;height:25px" data-rules="{required : true}" readonly="readonly"/>'
					},{
						label : '工作内容',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="workContent" id="workContentEdit" style="width:100%;height:25px;" data-rules="{required : true}"/>'
					},{
						label : '所属专业',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="belongCraft" id="belongCraftEdit" style="width:100%;height:25px;" value="" data-rules="{required : true}"/>'
					},{
						label : '施工类别',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="executionType" id="executionTypeEdit" style="width:100%;height:25px;" data-rules="{required : true}"/>'
					},{
						label : '施工属性',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="executionAttr" id="executionAttrEdit" style="width:100%;height:25px;" data-rules="{required : true}"/>'
					},{
						label : '施工地点',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="executionAddr" id="executionAddrEdit" data-rules="{required:true,maxlength:80}"  style="width:99%;height:50px;"></textarea>'
					},{
						label : '涉及骨干网<br>名称',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="mainNetName" id="mainNetNameEdit" data-rules="{required:true,maxlength:80}"  style="width:99%;height:50px;"></textarea>'
					},{
						label : '涉及铁路局',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="railwaysBureau" id="railwaysBureauEdit" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},{
						label : '计划原因<br>说明',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="planCaption" id="planCaptionEdit" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},{
						label : '附件',
						itemColspan : 2,
						item : '<div id="filesLoaderUpdate"></div>'
					},{
						label : '方案审批<br>编号',
						redStarFlag : true,
						itemColspan : 2,
						item : '<input type="text" name="planExaminNum" id="planExaminNumEdit"  data-rules="{required:true,maxlength:50}"  style="width:98%;height:50px">'
					},{
						label : '月度计划<br>审批编号',
						redStarFlag : true,
						itemColspan : 2,
						item : '<input type="text" name="monthPlanExamin" id="monthPlanExaminEdit"  data-rules="{required:true,maxlength:50}"  style="width:98%;height:50px">'
					},{
						label : '昆铁施工<br>台计划号',
						redStarFlag : true,
						itemColspan : 2,
						item : '<input type="text" name="executionPlanNum" id="executionPlanNumEdit"  data-rules="{required:true,maxlength:50}"  style="width:98%;height:50px">'
					},{
						label : '回复附件',
						itemColspan : 2,
						item : '<div id="filesLoaderCheck"></div>'
					}
				]
			});
			return form;
		}
	},{
		//弹框属性
		ATTRS : {
			title : {value : '停机要点计划修改并审核'},
			width : {value : 650},
			height : {value : 500},
			closeAction : {value : 'destroy'},
			mask : {value : true},
			contextPath : {},
			stopUpdateAndExamineId : {},
			success : {
				value : function(){
					var _self = this,contextPath = _self.get('contextPath');
					var form = _self.getChild('stopUpdateAndExamineId');
					//表单验证不通过
					if(!form.isValid()){
						return;
					}
					//序列化表单成对象，所有的键值都是字符串
			    	var data = form.serializeToObject();
			    	//获取上传附件数和批复附件数
			    	var updateUploader = _self.get('updateUploader');
			    	var checkUploader = _self.get('checkUploader');
			    	var updateArr = _self.getUploadFileData(updateUploader);
			    	var checkArr = _self.getUploadFileData(checkUploader);
			    	//上传参数
			    	var param = {
			    			paramEdit : JSON.stringify(data),
							arrUpload : JSON.stringify(updateArr),
							arrCheck : JSON.stringify(checkArr),	
			    	};
			    	console.log(param);
			    	$.post(contextPath + 'commNetStopAction/updateAndCheckCommNetStop.cn',param,function(result){
			    		//触发事件
			    		_self.fire("updateAndExamine",{result:result});
			    	},'json');
				}
			},
			events : {value : {
				'updateAndExamine' : true,
			}
		}
		}
	});
	return StopUpdateAndExamine;
});