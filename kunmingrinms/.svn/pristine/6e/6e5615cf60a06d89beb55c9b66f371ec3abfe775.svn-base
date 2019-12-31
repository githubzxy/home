define('views/commonjs/TrainingAdd',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer',
		'common/data/PostLoad','bui/tree','bui/extensions/treepicker','bui/uploader',
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),
		FormContainer = require('common/form/FormContainer'),Tree=require('bui/tree'),
		TreePicker=require('bui/extensions/treepicker'),Uploader=require('bui/uploader'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay'),PostLoad=require('common/data/PostLoad');
	var UploadFileDto=function(name,path){
		this.name = name;
		this.path = path;
	};
	var AddTraining=Overlay.Dialog.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._initForm());
		},
		_initForm:function(){
			var _self=this;
			var form = new FormContainer({
				id:'addTrainingForm',
				colNum:2,
				formChildrens:[{
					label:'计划名称',
		    		redStarFlag : true,
		    		itemColspan : 2,
		    		item:'<input type="text" id="addProjectName" name="projectName"  style="width: 99.3%;" data-rules="{required:true,maxlength:100}"/>'
				},{
					label:'接收部门',
					redStarFlag : true,
		    		itemColspan : 2,
		    		item:'<textarea id="org" style="width: 99.3%;height: 80px; resize:none" placeholder="请选择接收部门" data-rules="{required:true}" readonly="readonly"></textarea>'+
		    			'<input type="hidden" name="orgIds" id="orgVal" />',
						
				},{
						label:'附件',
						redStarFlag : false,
			    		itemColspan : 2,
			    		item:'<div id="uploadDiv"  style="overflow-y: auto;overflow-x: hidden;width: 99.3%; height:60px;"></div><input type="hidden" name="uploadFileArr" id="addUploadFileArr" />',
				}]
			});
				return form;
		},
		renderUI:function(){
			var _self=this;
			var contextPath = _self.get('contextPath');
			_self._renderFileUpload(contextPath);
			_self._getDate();
			_self._setBtn();
		},
		_setBtn:function(){
			var _self=this;
			var buttons = [
				{
					text:'保存',
					elCls:'button  _saveData',
					handler : function(){
			            	var _self = this,
			            	success = _self.get('success');
				            if(success){
				              success.call(_self);
				            }
					}
				},
				{
					  text:'取消',
					  elCls : 'button ',
					  handler : function(dialog,btn){
					        if(this.onCancel() !== false){
					        	this.close();
					        }
					  }
				}
			];
			_self.set('buttons',buttons);
		},
		_renderFileUpload:function(contextPath){
			var _self=this;
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
			 var uploader = new Uploader.Uploader({
			        render: '#uploadDiv',
			        theme : 'uploadView', //使用自定义主题
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
			        },
			      });
			 _self.set('uploader',uploader);
			 uploader.render();
		},
//		获取组织树
		_getDate:function(){
			var _self=this;
			var orgPath=_self.get('orgPath');
			var contextPath=_self.get('contextPath');
			var treeStore = new Data.TreeStore({
				 url:contextPath+orgPath,
				 proxy : {
						method : 'post',
						dataType : 'json'
					},
					 map : {
						 	isdept : 'leaf',
				            name : 'text'
				          },
			});
			treeStore.load({id : gztxd_id});
			var tree = new Tree.TreeList({
				idField : 'id',
				store : treeStore,
				checkType : 'all',
				showLine : true,	//显示连接线
				cascadeCheckd : false, //不级联勾选
				width : 250, 
				height : 300,
				listeners : {
					itemclick : function(e) {
						var item = e.item;
						// 点击展开和收缩 + -  不能勾选
						if($(e.domTarget).hasClass('x-tree-elbow-expander')) {
							return ;
						}
						// 点击昆明通信段和好友组，但是没有点击昆明通信段和好友组Checkbox  不能勾选
						if(item.id == gztxd_id && !$(e.domTarget).hasClass('x-tree-icon-checkbox')) {
							return ;
						}
						// 点击昆明通信段和好友组，并且点击昆明通信段和好友组Checkbox  不能勾选
						if(item.id == gztxd_id && $(e.domTarget).hasClass('x-tree-icon-checkbox')) {
							var flag = !tree.isChecked(item);
							tree.setNodeChecked(item, flag);
							return ;
						}
						// 如果点击checkbox，则直接打√
						if($(e.domTarget).hasClass('x-tree-icon-checkbox')) {
							return ;
						}
						// ------------单击 li 在当前行的checkbox打√-------------
						// 取反  勾选Checkbox
						var flag = !tree.isChecked(item);
						tree.setNodeChecked(item, flag);
					}
				}
			});
			_self.set('tree',tree);
			var treePicker = new TreePicker({
				trigger : "#org",
				valueField : "#orgVal", //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
				selectStatus : 'checked',//设置勾选作为状态改变的事件
				autoRender : true,
				children : [
					tree,
					{
						content :  '<center>'
									+	'<button type="button" class="button button-small addWorkshopBtn"  >全部车间</button>&nbsp;&nbsp;'
									+	'<button type="button" class="button button-small addSure" >&nbsp;&nbsp;确&nbsp;&nbsp;认&nbsp;&nbsp;</button>'
									+	'</center>'
					}
				] //配置picker内的列表
			});
			_self.set('treePicker',treePicker);
		},
		bindUI:function(){
			var _self=this;
			var workshopFlag = true;
			var uploader = _self.get('uploader');
			var tree = _self.get('tree');
			//开始上传时
			uploader.on('start',function(e){
				$("._saveData").attr("disabled","disabled");
			});
			
			//上传成功时
			uploader.on('success',function(e){
				$("._saveData").removeAttr("disabled");
			});
			
			//取消上传时
			uploader.on('cancel',function(e){
				$("._saveData").removeAttr("disabled");
			});
			$('.addWorkshopBtn:last').click(function(){
				if(workshopFlag) {
					/*$.post(contextPath + 'organization/getAllWorkshop.cn',
							{
							},function(data,status){
								if(status){
									var node;
									for(var i = 0; i < data.length; i++) {
										node = tree.findNode(data[i].id);
										tree.setNodeChecked(node, true);
									}
									$(".addWorkshopBtn:last").text("重置");
									workshopFlag = false;
								}else{
									alert("查询所有车间数据失败");
								}
							}, 'json');*/
					var postLoad =new PostLoad({
						url:contextPath + 'organization/getAllWorkshop.cn',
						el:_self.get('el'),
						loadMsg:'加载中...'
					}); 
					var data='';
					postLoad.load(data,function(result){
						var node;
						for(var i = 0; i < result.length; i++) {
							node = tree.findNode(result[i].id);
							tree.setNodeChecked(node, true);
						}
						$(".addWorkshopBtn:last").text("重置");
						workshopFlag = false;
					});
				} else {
					tree.clearAllChecked();
					$(".addWorkshopBtn:last").text("全部车间");
					workshopFlag = true;
				}
			});
			$('.addSure:last').click(function(){
				_self.get('treePicker').hide();
			});
		},
		_saveDate:function(){
			var _self=this;
			var pathForAdd = _self.get('pathForAdd');
			var contextPath = _self.get('contextPath');
//			验证
			var form = _self.getChild('addTrainingForm',true);
			if(!form.isValid()){
				return;
			}
//			获取页面数据
			var data = _self._getData(_self,form);
			var postLoad =new PostLoad({
				url:contextPath +pathForAdd,
				el:_self.get('el'),
				loadMsg:'保存中...'
			}); 
			postLoad.load(data,function(result){
				_self.fire("saveBtn",{
					result : result,
				});
			});
		},
//		获取页面数据
		_getData:function(_self,form){
			var data=form.serializeToObject();
			var uploader=_self.get('uploader');
			var arr = new Array();
			var fileArray = uploader.get("queue").getItemsByStatus('success');
			for(var i in fileArray){
		    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
				arr[i] = dto; // 向集合添加对象
			};
			data.uploadFileArr=JSON.stringify(arr);
			return data;
		}
	},{ATTRS:{
		id:{value:'addTraining'},
		title:{},
		orgPath:{},
		pathForAdd:{},
		closeAction:{value:"destroy"},
		contextPath : {},
		orgId:{},
		width:{value:500},
		height:{value:280},
		mask:{value:true},
		events:{
    		value: {'saveBtn': true}
    	},
    	success:{
    		value:function(){
    		   this._saveDate();
    		},
    	},
	}});
	return AddTraining;
});