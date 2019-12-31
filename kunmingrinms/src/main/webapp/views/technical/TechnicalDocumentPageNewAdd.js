/**
 * 文件新增模块
 */
define('views/technical/TechnicalDocumentPageNewAdd',
		['bui/common',
		 'common/form/FormContainer',
		 'bui/uploader',
		 'common/data/PostLoad',
		 ],function(r){
	var BUI = r('bui/common');
	var	FormContainer = r('common/form/FormContainer');
	var	Uploader = r('bui/uploader');
	var	PostLoad = r('common/data/PostLoad');
	var TechnicalDocumentPageNewAdd = BUI.Overlay.Dialog.extend({
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
			var _self = this;
			_self._initUploader();
			_self._selectAutoFilling();
		},

		/**
		 * 绑定事件
		 */
		bindUI: function(){
			var _self = this;
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
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
			//添加资料名称悬浮提示
    		$('#accountNameAdd').on('mouseover',function(){
    			var str=$('#accountNameAdd').val();
    			$('#accountNameAdd').attr('title',str);
    		});
    		//添加施工地点悬浮提示
    		$('#place').on('mouseover',function(){
    			var str=$('#place').val();
    			$('#place').attr('title',str);
    		});
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
			var form = new FormContainer({
				id: 'fileFormAdd',
				colNum: 1,
				formChildrens:[{
					label: '资料名称：',
					redStarFlag: true,
					itemColspan: 1,
					item: '<input type="text" name="name" id="accountNameAdd" data-rules="{required:true,maxlength:200}"/>'
				}
//				,{
//					label: '资料类别：',
//					redStarFlag: true,
//					itemColspan: 1,
//					item: '<select name="technicalInfoType" id="dataTypeAdd" data-rules="{required:true}"><option value=""></option></select>'
//				}
				,{
					label: '处所：',
					redStarFlag: true,
					itemColspan: 1,
					item: '<input type="text" name="address" id="place" data-rules="{required:true,maxlength:200}">'
				},{
					label: '附件：',
					itemColspan: 1,
					item: '<div name="uploadFileArr" id="uploadFileAddDiv"></div>'
				},{
					label: '备注：',
					itemColspan : 1,
					item:'<textarea name="remark" id="remarkAdd" style="width:99.5%;height:95px;overflow-y :auto" maxlength="250" placeholder="最多输入250字"/>'
				}] 
			});
			return form;
		},
		/**
		 * 初始化上传文件
		 */
		_initUploader:function(){
			var _self = this;
			var contextPath = _self.get('contextPath');
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
		UploadFileDto: function(name,path){
			this.name = name;
			this.path = path;
		},
		
		//保存数据
		_saveData:function(){
			var _self = this;
			var contextPath = _self.get('contextPath');
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
				url : contextPath + 'technicalDocument/addTechnical.cn',
				el : _self.get('el'),
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
			title: {value : '新增资料'},
			width: {value:575},
	        height: {value:290},
	        contextPath: {},
	        closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
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
	return TechnicalDocumentPageNewAdd;
});
