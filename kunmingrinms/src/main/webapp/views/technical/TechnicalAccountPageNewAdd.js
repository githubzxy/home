/**
 * 文件新增模块
 */
define('views/technical/TechnicalAccountPageNewAdd',['bui/common',
	'common/form/FormContainer','bui/uploader',
	'common/data/PostLoad','bui/form'],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Uploader = r('bui/uploader'),
		PostLoad = r('common/data/PostLoad'),
		Form = r('bui/form');
	var TechnicalAccountPageNewAdd = BUI.Overlay.Dialog.extend({
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
			_self._initUploader();
			_self._selectAutoFilling();
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
			_self._initBtn();
		},
		/**
		 * 初始化按钮
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
		/**
		 * 初始化下拉框数据
		 */
		_selectAutoFilling:function(){
			technicalInfo_type.listData("#dataTypeAdd");
		},
		/**
		 * 初始化表单
		 */
		_initFormContainer: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var colNum = 2;
			var childs = [{
				label: '台账名称：',
				redStarFlag: true,
				itemColspan: 2,
				item: '<input type="text" name="name" id="accountNameAdd" data-rules="{required:true,maxlength:40}"/>'
			},{
				label: '台账类别：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="type" id="dataTypeAdd" style="width:100%;height:30px" data-rules="{required:true}">'+
						'<option value="">请选择</option></select>'
			},{
				label: '施工地点：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<input type="text" name="address" id="place" data-rules="{required:true,maxlength:40}" style="width:98%;height:30px">'
			},{
				label: '附件：',
				itemColspan: 2,
				item: '<div name="attachFileId" id="uploadFileAddDiv"></div>'
			},{
				label: '备注：',
				itemColspan : 2,
				item : '<textarea name="remark" id="remarkAdd" style="width:99.5%;height:95px;" maxlength="250" placeholder="最多输入250字"/>'
			}];
			var form = new FormContainer({
				id: 'fileFormAdd',
				colNum: colNum,
				formChildrens: childs
			});
			_self.set('formContainer',form);
			return form;
		},
		/**
		 * 初始化上传文件
		 */
		_initUploader:function(){
			var _self = this,contextPath = _self.get('contextPath');
			Uploader.Theme.addTheme('uploadView', {//自定义附件组件的显示主题
				elCls: 'defaultTheme',
				queue:{
					//结果的模板，可以根据不同状态进进行设置
					resultTpl: {
						'default': '<div class="default">{name}</div>',
						'success': '<div class="success"><label class="fileLabel" href="#" title={name}>{name}</label></div>',
						'error': '<div class="error"><span title="{name}"></span><span class="uploader-error">{msg}</span></div>',
						'progress': '<div class="progress"><div class="bar" style="width:{loadedPercent}%"></div></div>'
					}
				}
			});
			//上传附件
			var uploader = new Uploader.Uploader({
				render: '#uploadFileAddDiv',
				theme: 'uploadView',//使用自定义主题
				url: contextPath + 'attachFile/upload.cn',
				isSuccess: function(result){
					return true;
				},
				rules: {
		            //文的类型
		            ext: ['.doc,.docx,.xls,.xlsx,.ppt,.pptx,.vsd,.pdf,.jpg,.tif,.dwg','文件类型只能为{0}'],
		            //文件大小的最小值,这个单位是kb
		            minSize: [0, '文件的大小不能小于{0}KB'],
		            //文件大小的最大值,单位也是kb
		            maxSize: [1024 * 1024, '文件大小不能大于1G']
				}
			});
			uploader.render();
			_self.set('uploader',uploader);
		},
		/**
		 * 获取上传文件数据(上传的)
		 */
		getUploadFileData:function(){
			var _self = this,uploader = _self.get('uploader');
			var arr = new Array(); //声明数组,存储数据发往后台
			//获取上传文件的队列
			var fileArray = uploader.get("queue").getItemsByStatus('success');
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
		UploadFileDto: function(name,path){
			this.name = name;
			this.path = path;
		},
		_saveData : function(){
    		var _self = this,contextPath = _self.get('contextPath');
    		var form = _self.getChild('fileFormAdd',true);
    		//验证不通过
    		if(!form.isValid()){
    			return;
    		}
    		var data = form.serializeToObject();
    		//获取上传文件
    		var uploadFileArr = _self.getUploadFileData();
    		data.uploadFileArr=JSON.stringify(uploadFileArr);
    		//提交到数据库
    		var postLoad = new PostLoad({
				url : contextPath + 'technicalAccountAction/addAccountData.cn',
				el : '#fileAddDialog',
				loadMsg : '保存中...'
			}); 
    		
			postLoad.load(data, function(result){
				if(result != null){
					_self.fire("completeAddSave",{
						result : result
					});
				}
			});
    	}
	},{
		ATTRS: {
			id: {value : 'fileAddDialog'},
			title: {value:'新增文件'},
			width: {value:635},
	        height: {value:315},
	        contextPath: {},
	        closeAction: {value: 'destroy'},
	        mask: {value: true},
	        events: {
	        	value: {
	        		/**
	        		 * 绑定保存按钮事件
	        		 */
	        		'completeAddSave' : true,
	        	}
	        }
		}
	});
	return TechnicalAccountPageNewAdd;
});
