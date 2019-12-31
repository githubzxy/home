/**
 * 新增停机要点计划表单
 */
define('views/commNetStop/stopPlan/StopPlanAdd',[
											'bui/overlay','bui/uploader',
											'common/form/FormContainer'
											],function(require){
	var Overlay = require('bui/overlay'),
	Uploader = require('bui/uploader'),
	FormContainer = require('common/form/FormContainer');
	var StopPlanAdd = Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			var stopForm = _self._getForm();
			_self.addChild(stopForm);
		},
        //绑定事件
		bindUI : function(){
			var _self = this;
			_self._selectAutoFilling();
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
		},
		renderUI : function(){
			var _self = this;
			_self._initUploader();
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
		 * 初始化上传文件控件
		 */
		_initUploader : function(){
			var _self = this,contextPath = _self.get('contextPath');
			Uploader.Theme.addTheme('uploadView', {//自定义附件组件的显示主题
				elCls: 'defaultTheme',
				queue:{
					//结果的模板，可以根据不同状态进进行设置
					resultTpl: {
						'default': '<div class="default">{name}</div>',
						'success': '<div class="success"><label class="fileLabel" href="#" title={name}>{name}</label></div>',
						'error': '<div class="error"><span title="{name}">上传失败,请确保文件是非空文件后，点击删除，再重新上传!</span><span class="uploader-error">{msg}</span></div>',
						'progress': '<div class="progress"><div class="bar" style="width:{loadedPercent}%"></div></div>'
					}
				}
			});
			// 上传附件
			var uploader = new Uploader.Uploader({
		        render : '#uploadDiv',
		        theme : 'uploadView', //使用自定义主题
		        url : contextPath + 'attachFile/upload.cn',
		        isSuccess : function(result){
					return true;
		        }
		    });
			uploader.render();
			_self.set('uploader',uploader);
		},
		/**
		 * 初始化下拉框数据
		 */
		_selectAutoFilling : function(){
			commNetworkStop_rainLine.listData("#rainLineAdd");
			commNetworkStop_workContent.listData("#workContentAdd");
			commNetworkStop_major.listData("#majorAdd");
			commNetworkStop_constructionType.listData("#constructionTypeAdd");
			commNetworkStop_constructionAttr.listData("#constructionPropertyAdd");
		},
		/**
		 * 获取上传文件数据(上传的)
		 */
		getUploadFileData : function(){
			var _self = this,uploader = _self.get('uploader');
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
		 * 获取表单数据
		 */
		_getForm : function(){
			var form = new FormContainer({
				id : 'stopPlanAddForm',
				colNum : 2,
				formChildrens : [  //表单元素
					{
						label : '线路',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="railLineName" id="rainLineAdd" style="width:100%;height:27px;" data-rules="{required : true}"/>'
					},
					{
						label : '计划开始时间',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" name="startDate" id="startDate" class="calendar calendar-time" style="width:99%;height:27px" data-rules="{required : true}" readonly="readonly"/>'
					},
					{
						label : '所属局',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" name="belongOffice" id="railwayAdd" data-rules="{required:true,maxlength:50}" style="width:99%;height:25px" value="昆铁" />'
					},
					{
						label : '计划结束时间',
						redStarFlag : true,
						itemColspan : 1,
						item : '<input type="text" id="endDate" name="endDate" class="calendar calendar-time" style="width:99%;height:25px" data-rules="{required : true}" readonly="readonly"/>'
					},
					{
						label : '工作内容',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="workContent" id="workContentAdd" style="width:100%;height:25px;" data-messages="{regexp:"请选择"}" data-rules="{required : true}"/>'
					},
					{
						label : '所属专业',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="belongCraft" id="majorAdd" style="width:100%;height:25px;" data-messages="{regexp:"请选择"}" data-rules="{required : true}"/>'
					},
					{
						label : '施工类别',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="executionType" id="constructionTypeAdd" style="width:100%;height:25px;" data-messages="{regexp:"请选择"}" data-rules="{required : true}"/>'
					},
					{
						label : '施工属性',
						redStarFlag : true,
						itemColspan : 1,
						item : '<select name="executionAttr" id="constructionPropertyAdd" style="width:100%;height:25px;" data-messages="{regexp:"请选择"}" data-rules="{required : true}"/>'
					},
					{
						label : '施工地点',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="executionAddr" id="constructionAddressAdd" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},
					{
						label : '涉及骨干网<br>名称',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="mainNetName" id="BackboneNetworkAdd" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},
					{
						label : '涉及铁路局',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="railwaysBureau" id="relevantRailwayStationAdd" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},
					{
						label : '计划原因<br>说明',
						redStarFlag : true,
						itemColspan : 2,
						item : '<textarea name="planCaption" id="planAndReasonAdd" data-rules="{required:true,maxlength:80}" style="width:99%;height:50px;"></textarea>'
					},
					{
						label : '附件',
						itemColspan : 2,
						item : '<div id="uploadDiv"></div>'
					}
				]
			});
			return form;
		},
	},{
		ATTRS : {//定义弹框属性
			title : {value : '新增停机要点计划'},
			width : {value : 650},
			height : {value : 477},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			closeAction : {
				value : 'destroy'
			},
			success : {
				value : function(){
					var _self = this,contextPath = _self.get('contextPath');
					var form = _self.getChild('stopPlanAddForm');
					// 验证不通过
			    	 if(!form.isValid()) {
			    		 return ;
			    	 }
			    	//序列化表单成对象，所有的键值都是字符串
			    	var data = form.serializeToObject();
			    	// 获取上传文件
			    	var uploadArr = _self.getUploadFileData();
			    	var param = {
			    			paramAdd : JSON.stringify(data),
			    			uploadArr : JSON.stringify(uploadArr)
			    	};
			    	$.post(contextPath + 'commNetStopAction/addCommNetStop.cn', param, function(result){
			    			//触发事件
			    		    _self.fire("completeSave",{
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
					'completeSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return StopPlanAdd;
});