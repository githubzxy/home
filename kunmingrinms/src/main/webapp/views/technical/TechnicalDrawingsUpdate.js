/**
 * 文件新增模块
 */
define('views/technical/TechnicalDrawingsUpdate',['bui/common',
	'common/form/FormContainer','bui/uploader',
	'common/uploader/UpdateUploader','common/data/PostLoad','bui/form'],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Uploader = r('bui/uploader'),
		UpdateUploader = r('common/uploader/UpdateUploader'),
		PostLoad = r('common/data/PostLoad'),
		Form = r('bui/form');
	var TechnicalDrawingsUpdate = BUI.Overlay.Dialog.extend({
		/**
		 * 初始化
		 */
		initializer: function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());	
		},
		/**
		 * 渲染
		 */
		renderUI: function(){
			var _self = this,contextPath = _self.get('contextPath');
			_self._initUpdateData();//初始化要修改的数据(填充原始数据)
			_self._initBtn();
			_self._selectAutoFilling();
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
		},
		/**
		 * 绑定事件
		 */
		bindUI: function(){
			var _self = this;
//			//图纸名称悬浮提示
//			$('#drawingsUpdate').on('mouseover',function(){
//    			var str=$('#drawingsUpdate').val();
//    			$('#drawingsUpdate').attr('title',str);
//    		});
		},
		/**
		 * 初始化按键
		 */
		_initBtn : function(){
			var _self = this;
			//定义按键
			var buttons = [
				{
					text: '保存',
					elCls: 'button',
					handler: function(){
						_self._saveData();
					}
				},{
					text: '关闭',
					elCls: 'button',
					handler: function(){
						_self.close();
					}
				}
			];
			_self.set('buttons',buttons);
		},
		//初始化要修改的数据(填充原始数据)
		_initUpdateData:function(){
			var _self = this,
			contextPath = _self.get('contextPath'),
			drawId = _self.get('drawId');//获取被选中的图纸的id
			/**
			 * 使用PostLoad发起请求
			 */
			var postLoad = new PostLoad({
				url:contextPath + 'technical/getTechnicalById.cn',
				el:'#drawUpdateDialog'
			});
			postLoad.load({id:drawId},function(result){
//				var data =JSON.parse( result.data);
				var data = result;
				$('#drawingsUpdate').val(data.name);//填充图纸名称
				$('#technicalInfoTypeUpdate').val(data.technicalInfoType);//填充资料类别
				$('#addressUpdate').val(data.address);//填充施工地址
				$('#remarkUpdate').val(data.remark);//填充备注
				if(data.attachFile != null){//存在附件
					_self._initUploadFiles(data.attachFile.id);//获得附件
				}else{
					_self._initUploader("");
				}
			});
		},
		//根据附件ID,获取上传的附件
		 _initUploadFiles:function(attachFileId){
			 var _self = this,contextPath = _self.get('contextPath');
			 var pl = new PostLoad({
				url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
				el : _self.get('el')
			 });
			 pl.load({attachFileId:attachFileId},function(result){
				//初始化上传附件
				_self._initUploader(result);
			 });
			
		 },
		
		
		/**
		 * 初始化下拉框数据(资料类别)
		 */
		_selectAutoFilling:function(){
			technicalInfo_type.listData("#technicalInfoTypeUpdate");
		},
		/**
		 * 初始化修改弹出框的表单
		 */
		_initFormContainer: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var colNum = 2;
			var childs = [{
				label: '图纸名称：',
				redStarFlag: true,
				itemColspan: 2,
				item: '<input type="text" name="name" id="drawingsUpdate" data-rules="{required:true,maxlength:43}"/>'
			},{
				label: '资料类别：',
				redStarFlag: true,
				itemColspan: 2,
				item: '<select name="technicalInfoType" id="technicalInfoTypeUpdate" data-rules="{required:true}"><option value=""></option></select>'
			},{
				label: '处所：',
				itemColspan: 2,
				item: '<input type="text" name="address" id="addressUpdate" data-rules="{required:maxlength:43}"/>'
			},{
				label: '附件：',
				itemColspan: 2,
				item: '<div name="attachFileId" id="uploadFileUpdateDiv" style="height:100px;overflow-y:auto"></div>'
			},{
				label: '备注：',
				itemColspan : 2,
				item : 
				'<textarea name="remark" id="remarkUpdate" style="width:99.5%;height:100px;overflow-y :auto" maxlength="250" placeholder="最多输入250字"/>'
			}];
			var form = new FormContainer({
				id: 'drawFormUpdate',
				colNum: colNum,
				formChildrens: childs
			});
			_self.set('formContainer',form);
			return form;
		},
		/**
		 * 初始化上传附件控件
		 */
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
		/**
		 * 获取上传文件数据(上传的)
		 */
		getUploadFileData:function(){
			var _self = this,uploader = _self.get('updateUploader');
			var arr = new Array(); //声明数组,存储数据发往后台
			//获取上传文件的队列
			var fileArray = uploader.getSucFiles();
			for(var i in fileArray){
		    	var dto = new _self.UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象(上传的附件)
				arr[i] = dto; // 向集合添加对象
			};
			return arr;
		},
		/**
		  * 声明上传文件对象
		  * @param name 上传文件名
		  * @param path 上传文件路径
		  */
		UploadFileDto: function(name,path){
			this.name = name;
			this.path = path;
		},
		//保存数据
		_saveData:function(){
			var _self = this,contextPath = _self.get('contextPath');
    		var form = _self.getChild('drawFormUpdate',true);
    		//验证不通过
    		if(!form.isValid()){
    			return;
    		}
    		//序列化表单成对象，所有的键值都是字符串
	    	var data = form.serializeToObject();
    		//获取上传文件
    		var uploadFileArr = _self.getUploadFileData();
    		data.uploadFileArr = JSON.stringify(uploadFileArr);
    		data.id = _self.get('drawId');
    		//提交到数据库
    		var postLoad = new PostLoad({
				url : contextPath + 'technical/updateTechnical.cn',
				el : '#drawUpdateDialog',
				loadMsg : '保存中...'
			}); 
    		
			postLoad.load(data, function(result){
				if(result != null){
					_self.fire("saveBtn",{
						result : result
					});
				}
			});
		},
	},{
		ATTRS: {
			id: {value : 'drawUpdateDialog'},
			title: {value:'修改系统网络图'},
			width: {value:635},
	        height: {value:400},
	        drawId: {},
	        contextPath: {},
	        closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
	        mask: {value: true},
	        events: {
	        	value: {
	        		/**
	        		 * 绑定保存按钮事件
	        		 */
	        		'saveBtn' : true,
	        	}
	        }
		}
	});
	return TechnicalDrawingsUpdate;
});
