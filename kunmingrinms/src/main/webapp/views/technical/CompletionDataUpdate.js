/**
 * 文件修改模块
 */
define('views/technical/CompletionDataUpdate',[
	'bui/common',
	'common/form/FormContainer',
	'common/uploader/UpdateUploader',
	'common/data/PostLoad',
	'bui/select',
	'bui/calendar'],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		UpdateUploader = r('common/uploader/UpdateUploader'),
		PostLoad = r('common/data/PostLoad'),
		Select = r('bui/select'),
		Calendar = r('bui/calendar');
	var CompletionDataUpdate = BUI.Overlay.Dialog.extend({
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
			_self._initBtn();//初始化按钮
			_self._dataTypeAutoFilling();//初始化资料类别
			_self._showRailLineName();//初始化线别名称
			_self._initCompletionT();//初始化竣工时间
			_self._initUpdateData();//初始化要修改的数据(填充原始数据)
			//隐藏本页面单选框里的第一个空白框
			$(".bui-stdmod-body select option[value='']").hide();
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
		 * 初始化资料类别
		 */
		_dataTypeAutoFilling:function(){
			technicalInfo_type.listData("#technicalInfoTypeUpdate");
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
				  height:29,
			      render : '#railLineUpdate',
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
  				trigger : '#completionTimeUpdate',
  				showTime : true,
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
		//初始化要修改的数据(填充原始数据)
		_initUpdateData:function(){
			var _self = this,
			contextPath = _self.get('contextPath'),
			CDataId = _self.get('CDataId');
			/**
			 * 使用PostLoad发起请求
			 */
			var postLoad = new PostLoad({
				url:contextPath + 'completionAction/getCompletionById.cn',
				el:'#dataUpdateDialog'
			});
			postLoad.load({id:CDataId},function(result){
				var data = result;
				$("#nameUpdate").val(data.name);//填充图纸名称
				$("#railLineUpdate>div :input").val(data.railLineName);//填充线别名称
				$("#completionTimeUpdate").val(data.completionDate);//填充竣工时间
				$("#technicalInfoTypeUpdate").val(data.technicalInfoType);//填充资料类别
				$("#addressUpdate").val(data.address);//填充施工地址
				$("#remarkUpdate").val(data.remark);//填充备注
				if(data.attachFile != null){
					_self._initUploadFiles(data.attachFile.id);//获得附件
				}else{
					_self._initUploader('');
				}
			});
		},
		//根据附件ID,获取上传的附件
		 _initUploadFiles:function(attachFileId){
			 var _self = this,contextPath = _self.get('contextPath');
				var postLoad = new PostLoad({
					url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
					el : _self.get('el')
				});
				postLoad.load({attachFileId : attachFileId},function(result){
					//初始化上传附件
					_self._initUploader(result);
				});
		 },
		/**
		 * 初始化修改弹出框的表单
		 */
		_initFormContainer: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var colNum = 2;
			var childs = [{
				label: '资料名称：',
				redStarFlag: true,
				itemColspan: 2,
				item: '<input type="text" name="name" id="nameUpdate" data-rules="{required:true,maxlength:43}"/>'
			},{
				label: '线别名称：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<div id="railLineUpdate"></div>'
			},{
				label: '竣工时间：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<input type="text" name="completionTime" id="completionTimeUpdate" data-rules="{required:true}" readOnly="readOnly"/>'
			},{
				label: '资料类别：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="technicalInfoType" id="technicalInfoTypeUpdate" data-rules="{required:true}">'+
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
				item : '<input type="text"  name="address" id="addressUpdate" data-rules="{required:true,maxlength:43}">'
			},{
				label: '附件：',
				itemColspan : 2,
				item : '<div name="attachFileId" id="uploadFileUpdateDiv"></div>'
			},{
				label: '备注：',
				itemColspan : 2,
				item : 
					'<textarea name="remark" id="remarkUpdate" style="width:99.5%;height:95px;overflow-y :auto" maxlength="250" placeholder="最多输入250字"/>'
			}];
			var form = new FormContainer({
				id: 'dataFormUpdate',
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
    		var form = _self.getChild('dataFormUpdate',true);
    		//验证不通过
    		if(!form.isValid()){
    			return;
    		}
    		//序列化表单成对象，所有的键值都是字符串
    		var data = form.serializeToObject();
    		//获取上传文件
    		var uploadFileArr = _self.getUploadFileData();
    		data.id= _self.get('CDataId');//设置id属性
    		data.uploadFileArr=JSON.stringify(uploadFileArr);//设置uploadFileArr属性
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
	    		$(".bui-ext-mask").addClass("mask-z-index");//添加遮罩层
	    		_self._tooltip("线别名称不存在，请重新输入！");
	    		return;
	    	}
    		//提交到数据库
    		var postLoad = new PostLoad({
				url : contextPath + 'completionAction/updateCompletion.cn',
				el : '#dataUpdateDialog',
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
			id: {value : 'dataUpdateDialog'},
			title: {value:'修改竣工资料'},
			width: {value:635},
	        height: {value:375},
	        CDataId: {},
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
	return CompletionDataUpdate;
});
