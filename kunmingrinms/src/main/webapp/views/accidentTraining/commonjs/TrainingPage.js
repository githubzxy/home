define('views/commonjs/TrainingPage',[
		'bui/common','bui/data','bui/grid','bui/select','bui/calendar',
		'common/grid/SearchGridContainer','common/data/PostLoad',
		'views/commonjs/TrainingAdd','views/commonjs/TrainingUpdate','views/commonjs/TrainingDetail',
		],function(require){
	var BUI =require('bui/common'),Component = BUI.Component,Data = require('bui/data'),
		Grid = require('bui/grid'),Select=require('bui/select'),Calendar=require('bui/calendar'),
		TrainingAdd = require('views/commonjs/TrainingAdd'),
		TrainingUpdate=require('views/commonjs/TrainingUpdate'),TrainingDetail=require('views/commonjs/TrainingDetail'),
		SearchGridContainer=require('common/grid/SearchGridContainer'),PostLoad=require('common/data/PostLoad');
	
	var TrainingPage = Component.Controller.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._getMainPage());
		},
//	 ***********页面初始化**************
		_getMainPage:function(){
			var _self = this;
			var searchGridContainer = new SearchGridContainer({
				searchForm : _self._initSearchForm(),
				columns : _self._initColumns(),
				store : _self._initStore(),
				searchGrid : _self._initSearchGrid(),
			});
			return searchGridContainer;
		},
		_initSearchForm:function(){
			return {items:[
				      		{label:'计划名称',item :'<input type="text" name="projectName" id="projectName"  style="width:171px;"/>'},
				          ]
			       };
		},
		_initColumns:function(){
			return [
					 {
						 	title:'计划名称',
							dataIndex:'name',
							elCls : 'center',//居中显示
							sortable : false,	// 表头不排序
							width:'35%'
					 },{
						 	title:'创建时间',
							dataIndex:'time',
							elCls : 'center',//居中显示
							sortable : false,	// 表头不排序
							width:'35%',
							renderer: Grid.Format.datetimeRenderer
					 },{
						 	title:'创建人',
							dataIndex:'user',
							elCls : 'center',//居中显示
							sortable : false,	// 表头不排序
							width:'30%',
					 }
			];
		},
		_initStore:function(){
			var _self = this;
			var contextPath=_self.get('contextPath');
			var pathForPage=_self.get('pathForPage');
			var store = new Data.Store({
				pageSize : 10,//每页数量
				proxy : {
					url : contextPath+pathForPage ,//TODO异步数据源请求
					method : 'post',
					dataType : 'json',
				},
			params:{
				projectName:'',
			}
			});
			_self.set('mainPageStore',store);
			return store;
		},
		_initSearchGrid:function(){
			var _self = this;
			var searchGrid = {
					tbarItems :  [{
							  id:'add',
			                  btnCls : 'button button-small trainingPageAdd',
			                  text : '<i class="icon-plus"></i>新增',
			        },{
	                	xclass : 'bar-item-separator' // 竖线分隔符
	                },{
							  id:'update',
			                  btnCls : 'button button-small trainingPageUpdate',
			                  text : '<i class="icon-edit"></i>修改',
			        },{
	                	xclass : 'bar-item-separator'
	                },{
							  id:'delete',
			                  btnCls : 'button button-small trainingPageDelete',
			                  text : '<i class="icon-remove"></i>批量删除',
			        },{
	                	xclass : 'bar-item-separator'
	                },{
							  id:'detail',
			                  btnCls : 'button button-small trainingPageDetail',
			                  text : '<i class="icon-list-alt"></i>详情',
			        }],
			        plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber],
//			        TODO
					//permissionStore : _self._initPermissionStore()  权限设置
				};
				return searchGrid;
		},
		//权限配置
		_initPermissionStore : function() {
			var _self = this;
			var perId = _self.get('perId'),contextPath = _self.get('contextPath');
			var permissionStore = new Data.Store({
				url : contextPath + 'permission/getBtnPers.cn',
				params : {perId : perId},
				proxy : {
					method : 'post'
			    },
			});
			return permissionStore;
		},
//	 ***********页面初始化结束************	
		renderUI:function(){
			var _self=this;
			 _self.get('mainPageStore').load();
		},
//		***********绑定页面事件************
		bindUI:function(){
			var _self = this,
			contextPath = _self.get('contextPath'),
			table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true),
			tbar = table.get('tbar'),orgId=_self.get('orgId'),
			mainPageStore = _self.get('mainPageStore'),
			dialogTitle=_self.get('dialogTitle'),
			orgPath=_self.get('orgPath');
//			增加
			$('.trainingPageAdd').click(function(){
				var trainingAdd=new TrainingAdd({
					orgId:orgId,
					contextPath:contextPath,
					title:'新增'+dialogTitle,
					orgPath:orgPath,
					pathForAdd:pathForAdd,
				});
				trainingAdd.show();
				trainingAdd.on('saveBtn',function(e){
					tbar.msg(e.result);
					trainingAdd.close();
				});
				trainingAdd.on('closing',function(e){
					_self._refreshPage(mainPageStore,_self);
				});
			});
//			修改
			$('.trainingPageUpdate').click(function(){
				var selections = table.getSelection();
				var selectionsLength=selections.length;
				if(!selectionsLength){
					commonFailure('请选择一条需修改的计划');
					return;
				}
				if(selectionsLength>1){
					commonFailure('只能选择一条需修改的计划');
					return;
				}
				var trainingUpdate=new TrainingUpdate({
					orgId:orgId,
					contextPath:contextPath,
					pathForQueryById:_self.get('pathForQueryById'),
					updateTrainingId:selections[0].id,
					title:'修改'+dialogTitle,
					pathForModify:_self.get('pathForModify'),
				});
				trainingUpdate.show();
				trainingUpdate.on('saveBtn',function(e){
					tbar.msg(e.result);
					trainingUpdate.close();});
//				刷新页面
				trainingUpdate.on('closing',function(e){
					_self._refreshPage(mainPageStore,_self);
				});
			});
//			删除
			$('.trainingPageDelete').click(function(){
				var selections = table.getSelection();
				var selectionsLength=selections.length;
				if(!selectionsLength){
					commonFailure('请选择至少一条需删除的计划');
					return;
				}
				var msg='您确定要删除所选计划吗?<br/>';
				BUI.Message.Confirm(msg,function(){
		   			var ids = "";
		   			for(var i = 0;i < selections.length;i++){
		   				ids = ids + "," + selections[i].id;
		   			}
		   			var postLoad =new PostLoad({
						url:contextPath +_self.get('pathForDel'),
						el:table.get('el'),
						loadMsg:'删除中...'
					}); 
					postLoad.load({jsonIds : ids.substring(1, ids.length)},function(result){
						tbar.msg(result);
						_self._refreshPage(mainPageStore,_self);
					});
				});
			});
//			详情
			$('.trainingPageDetail').click(function(){
				var selections = table.getSelection();
				var selectionsLength=selections.length;
				if(!selectionsLength){
					commonFailure('请选择一条计划查看');
					return;
				}
				if(selectionsLength>1){
					commonFailure('只能选择一条计划查看');
					return;
				}
				var trainingDetail=new TrainingDetail({
					orgId:orgId,
					contextPath:contextPath,
					title:'查看'+dialogTitle,
					getAllShop:_self.get('getAllShop'),
					pathForQueryById:_self.get('pathForQueryById'),
					detailTrainingId:selections[0].id,//查看的id
					trainingShopPath:_self.get('trainingShopPath'),
					getZipFile:_self.get('getZipFile'),
					shopStr:_self.get('shopStr'),
				});
				trainingDetail.show();
				trainingDetail.on('closing',function(e){
						_self._refreshPage(mainPageStore,_self);
					});
			});
		},
//	   ***********绑定页面事件结束**********
//		刷新页面
		_refreshPage:function(mainPageStore,_self){
			mainPageStore.load({'projectName':$('#projectName').val()});
		},	
	},{ATTRS:{
		id:{value:'trainingPage'},
		perId : {},
		getAllShop:{},
		pathForQueryById:{},//根据id查询
		orgPath:{},//组织结构路径
		contextPath : {},//业务路径
		pathForPage:{},//主页路径
		pathForAdd:{},//新增路径
		pathForModify:{},//修改路径
		pathForDel:{},//删除路径
		pathForDetails:{},//详情路径
		pathForSave:{},//保存路径
		dialogTitle:{},//弹出窗标题
		trainingShopPath:{},
		getZipFile:{},
		shopStr:{},
	}});
	return TrainingPage;
});