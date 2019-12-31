/**
 * 竣工资料新增模块
 */
define('views/technical/CompletionDataAdd',[
	'bui/common',
	'common/form/FormContainer','bui/uploader',
	'common/data/PostLoad',
	'bui/select',
	'bui/calendar'],
	function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Uploader = r('bui/uploader'),
		PostLoad = r('common/data/PostLoad'),
		Select = r('bui/select'),
		Calendar = r('bui/calendar');
	var CompletionDataAdd = BUI.Overlay.Dialog.extend({
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
			_self._initBtn();
			_self._dataTypeAutoFilling();
			_self._showRailLineName();
			_self._initCompletionT();
			_self._initUploader();
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
		},
		/**
		 * 初始化按钮
		 */
		_initBtn : function() {
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
		 * 初始化资料类别
		 */
		_dataTypeAutoFilling:function(){
			technicalInfo_type.listData("#technicalInfoTypeAdd");
		},
		/**
		 * 初始化线别名称
		 */
		_showRailLineName:function(){
			var _self = this;
  		  var postLoad = new PostLoad({
  			  url:contextPath+'railLineAction/getRailLineNames.cn',
  		  });
  		  postLoad.load({},function(result){
  			 suggest = new Select.Suggest({
				  width : 226,
				  height: 29,
			      render : '#railLineAdd',
			      name:'railLine',
			      data : result,
			      autoRender : true
		  	 });
  		  });
  	    },
  	    /**
  	     * 初始化竣工时间
  	     */
  	    _initCompletionT:function(){
  	    	var _self=this;
  			//初始化日期组件
  			var datepickerCT = new Calendar.DatePicker({
  				trigger : '#completionTimeAdd',//id属性值
  				showTime : true,//显示当前时间
  				autoRender : true
  			});
  			//设置默认时间
  			datepickerCT.on('show',function(){
  				var c = datepickerCT.get('calendar');
  				c.set('hour',10);
  				c.set('minute',0);
  				c.set('second',0);
  			});
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
		 * 初始化表单
		 */
		_initFormContainer: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var colNum = 2;
			var childs = [{
				label: '资料名称：',
				redStarFlag: true,
				itemColspan: 2,
				item: '<input type="text" name="name" id="nameAdd" data-rules="{required:true,maxlength:43}"/>'
			},{
				label: '线别名称：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<div id="railLineAdd"></div>'
			},{
				label: '竣工时间：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<input type="text" name="completionTime" id="completionTimeAdd" data-rules="{required:true}" readOnly="readOnly"/>'
			},{
				label: '资料类别：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="technicalInfoType" id="technicalInfoTypeAdd" data-rules="{required:true}">'+
						'<option value="">请选择</option>'+
					  '</select>'
			},{
				label: '',
				itemColspan: 1,
				item: ''
			},{
				label: '施工地点：',
				redStarFlag: true,
				itemColspan : 2,
				item : '<input type="text"  name="address" id="addressAdd" data-rules="{required:true,maxlength:43}">'
			},{
				label: '附件：',
				itemColspan : 2,
				item : '<div name="attachFileId" id="uploadFileAddDiv"></div>'
			},{
				label: '备注：',
				itemColspan : 2,
				item : 
					'<textarea name="remark" id="remarkAdd" style="width:99.5%;height:95px;overflow-y :auto" maxlength="250" placeholder="最多输入250字"/>'
			}];
			var form = new FormContainer({
				id: 'dataFormAdd',
				colNum: colNum,
				formChildrens: childs
			});
			_self.set('formContainer',form);
			return form;
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
		/**
		 * 保存数据
		 */
		_saveData:function(){
			var _self = this,contextPath = _self.get('contextPath');
    		var form = _self.getChild('dataFormAdd',true);
    		//验证不通过
    		if(!form.isValid()){
    			return;
    		}
    		//序列化表单成对象，所有的键值都是字符串
	    	var data = form.serializeToObject();
    		//获取上传文件
    		var uploadFileArr = _self.getUploadFileData();
    		data.uploadFileArr = JSON.stringify(uploadFileArr);
    		//判断是否填写了线别名称
    		var railLine = data.railLine;
    		if(_self._cleanTrim(data.railLine,'g')==""){
    			$(".bui-ext-mask").addClass("mask-z-index");//添加遮罩层
    			_self._tooltip("请输入线别名称！");
	    		return;
	    	};
	    	//验证输入的填入的线别名称是否存在
	    	var isExists = _self._isExistsRailLineName(railLine);
	    	console.log(isExists);
	    	if(!isExists){
	    		$(".bui-ext-mask").addClass("mask-z-index");
	    		_self._tooltip("线别名称不存在，请重新输入！");
	    		return;
	    	}
    		//提交到数据库
    		var postLoad = new PostLoad({
				url : contextPath + 'completionAction/addCompletionInfo.cn',
				el : '#dataAddDialog',
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
		/**
		 * 清除字符串的空格
		 */
		_cleanTrim:function(str,is_global){
	        var result;
	        result = str.replace(/(^\s+)|(\s+$)/g,"");
	        if(is_global.toLowerCase()=="g")
	        {
	            result = result.replace(/\s/g,"");
	         }
	        return result;
		},
		/**
		 * 验证输入的线别名称是否存在
		 */
		_isExistsRailLineName:function(railLine){
        	var name = null;
        	$.ajax({
				url : contextPath + "railLineAction/isExistsRailLineName.cn",
				type : "post",
				async : false,
				data:{
					railLineName : railLine
				},
				success : function(result,status){
					if(status){
						name = result;
					}
				}
			});
        	return name;
        },
        /**
         * 定义线别名称验证提示
         */
        _tooltip : function(msg) {
        	var msg = msg;
        	BUI.Message.Show({
        		msg : msg,
        		closeable : false,
        		buttons : [{
        			text : '确定',
        			elCls : 'button button-primary',
        			handler : function(){
        				$(".bui-ext-mask").removeClass("mask-z-index");//移除遮罩层
        				this.close();
        			}
        		}]
        	});
        },
	},{
		ATTRS: {
			id: {value : 'dataAddDialog'},
			title: {value:'添加竣工资料'},
			width: {value:635},
	        height: {value:375},
	        contextPath: {},
	        closeAction: {value: 'destroy'},
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
	return CompletionDataAdd;
});
