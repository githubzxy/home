/**
 * 停机计划详情模块
 */
define('views/commNetStop/StopPlanShow', [
												'bui/overlay',
												'common/uploader/ViewUploader',
												'common/form/FormContainer'
												], function(require) {
	var Overlay = require('bui/overlay'),
	ViewUploader = require('common/uploader/ViewUploader'),
	FormContainer = require('common/form/FormContainer');
	var StopPlanShow = Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			var showForm = _self._getForm();
			_self.addChild(showForm);
		},
		renderUI : function(){
			var _self = this;
			_self._initShowData();
			var buttons = [];// 没有按钮
			_self.set('buttons',buttons);
		},
		/**
		 * 初始化显示数据
		 */
		_initShowData : function(){
			var _self = this,contextPath = _self.get('contextPath'),stopPlanId = _self.get('stopPlanId');
			
			var files = "";// 附件
			var examinFiles = "";// 批复附件
			var restoreFiles = "";// 回复附件
			$.ajax({
				url : contextPath + 'commNetStopAction/getCommNetStopById.cn',
				data : {
					id : stopPlanId
				},
				type : 'POST',
				dataType : 'JSON',
				async : false,
				success : function(result){
					var data = result.data
					$('#railLineShow').val(data.railLineName);
					$('#startDateShow').val(data.startDate);
					$('#belongOfficeShow').val(data.belongOffice);
					$('#endDateShow').val(data.endDate);
					$('#workContentShow').val(commNetworkStop_workContent.typeName(data.workContent));
					$('#belongCraftShow').val(commNetworkStop_major.typeName(data.belongCraft));
					$('#executionTypeShow').val(commNetworkStop_constructionType.typeName(data.executionType));
					$('#executionAttrShow').val(commNetworkStop_constructionAttr.typeName(data.executionAttr));
					$('#executionAddrShow').val(data.executionAddr);
					$('#mainNetNameShow').val(data.mainNetName);
					$('#railwaysBureauShow').val(data.railwaysBureau);
					$('#planCaptionShow').val(data.planCaption);
					if(data.attachFile != null){//初始化上传附件
						var uploadFiles = _self._initUploadFiles(data.attachFile.id);
						files = uploadFiles;
					}
					$('#planExaminNumShow').val(data.planExaminNum);
					$('#monthPlanExaminShow').val(data.monthPlanExamin);
					$('#executionPlanNumShow').html(data.executionPlanNum);
					if(data.examinFile != null){//初始化批复附件
						var uploadFiles = _self._initUploadFiles(data.examinFile.id);
						examinFiles = uploadFiles;
					}
					$('#situationCaptionShow').val(data.situationCaption);
					if(data.restoreFile != null){//初始化回复附件
						var uploadFiles = _self._initUploadFiles(data.restoreFile.id);
						restoreFiles = uploadFiles;
					}
				}
			})
			
			var files = new ViewUploader({
				render: '#filesShow',
				alreadyItems : files
			});
			files.render();
			
			var examinFiles = new ViewUploader({
				render: '#examinFilesShow',
				alreadyItems : examinFiles
			});
			examinFiles.render();
			
			var restoreFiles = new ViewUploader({
				render: '#restoreFilesShow',
				alreadyItems : restoreFiles
			});
			restoreFiles.render();
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
		_getForm : function(){
			var form = new FormContainer({
				id : 'showForm',
				colNum : 2,
				formChildrens : 
					[
						{
							label : '线路',
							item : '<input type="text" id="railLineShow" style="width:99%;height:30px" readonly="readonly" />'
						}, {
							label : '计划开始时间',
							item : '<input type="text" id="startDateShow" style="width:99%;height:30px" readonly="readonly" />'
						}, {
							label : '所属局',
							item : '<input type="text" id="belongOfficeShow" style="width:99%;height:30px" readonly="readonly" />'
						}, {
							label : '计划结束时间',
							item : '<input type="text" id="endDateShow" style="width:99%;height:30px" readonly="readonly" />'
						}, {
							label : '工作内容',
							item : '<input type="text" id="workContentShow" style="width:99%;height:30px" readonly="readonly" />'
						}, {
							label : '所属专业',
							item : '<input type="text" id="belongCraftShow" style="width:99%;height:30px" readonly="readonly" />'
						}, {
							label : '施工类别',
							item : '<input type="text" id="executionTypeShow" style="width:99%;height:30px" readonly="readonly" />'
						}, {
							label : '施工属性',
							item : '<input type="text" id="executionAttrShow" style="width:99%;height:30px" readonly="readonly" />'
						}, {
							label : '施工地点',
							itemColspan : 2,
							item : '<textarea id="executionAddrShow" style="width:99%;height:30px;" readonly="readonly"></textarea>'
						}, {
							label : '涉及骨干网<br>名称',
							itemColspan : 2,
							item : '<textarea id="mainNetNameShow" style="width:99%;" readonly="readonly"></textarea>'
						}, {
							label : '涉及铁路局',
							itemColspan : 2,
							item : '<textarea id="railwaysBureauShow" style="width:99%;" readonly="readonly"></textarea>'
						}, {
							label : '计划原因<br>说明',
							itemColspan : 2,
							item : '<textarea id="planCaptionShow" style="width:99%;" readonly="readonly"></textarea>'
						}, {
							label : '附件',
							itemColspan : 2,
							item : '<div id="filesShow"></div>'
						}, {
							label : '方案审批编号',
							item : '<input type="text" id="planExaminNumShow" style="width:99%;height:37px;" readonly="readonly" />'
						}, {
							label : '月度计划<br>&nbsp;&nbsp审批编号',
							item : '<input type="text" id="monthPlanExaminShow" style="width:99%;height:37px;" readonly="readonly" />'
						}, {
							label : '昆铁施工<br>&nbsp;&nbsp台计划号',
							itemColspan : 2,
							item : '<div id="executionPlanNumShow" style="width:99%;height:30px;"></div>'
						}, {
							label : '批复附件',
							itemColspan : 2,
							item : '<div id="examinFilesShow"></div>'
						}, {
							label : '完成情况',
							itemColspan : 2,
							item : '<textarea id="situationCaptionShow" style="width:99%;" readonly="readonly"></textarea>'
						}, {
							label : '回复附件',
							itemColspan : 2,
							item : '<div id="restoreFilesShow"></div>'
						}
					]
			});
			return form;
		},
	}, {
		ATTRS : {
			title : {value : '停机计划详情'},
			width : {value : 700},
			height : {value : 540},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			stopPlanId : {},
			closeAction : {
				value : 'destroy'
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
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return StopPlanShow;
});