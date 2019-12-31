define('views/commonjs/ReportPage',[
		'bui/common','bui/data','bui/grid','bui/select','bui/calendar',
		'common/grid/SearchGridContainer','common/data/PostLoad','views/commonjs/ReportPlan',
		],function(require){
	var BUI =require('bui/common'),Component = BUI.Component,Data = require('bui/data'),
		Grid = require('bui/grid'),Select=require('bui/select'),Calendar=require('bui/calendar'),
		ReportPlan=require('views/commonjs/ReportPlan'),
		SearchGridContainer=require('common/grid/SearchGridContainer'),PostLoad=require('common/data/PostLoad');
	var ReportPage = Component.Controller.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._getMainPage());
		},
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
						    id:'reportBtn',
						 	btnCls : 'button button-small reportBtn',
		                    text : '<i class="icon-list-alt"></i>汇报',
						}],
					plugins : [Grid.Plugins.RowNumber],
//		        TODO
				//permissionStore : _self._initPermissionStore()  权限设置
					}
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
		renderUI:function(){
			var _self=this;
			_self.get('mainPageStore').load();
		},
		bindUI:function(){
			var _self=this,mainPageStore = _self.get('mainPageStore'),
				contextPath = _self.get('contextPath'),table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true),
				tbar = table.get('tbar'),dialogTitle=_self.get('dialogTitle');
			$('.reportBtn').click(function(){
				var selections = table.getSelection();
				var selectionsLength=selections.length;
				if(!selectionsLength){
					commonFailure('请选择一条计划汇报');
					return;
				}
				if(selectionsLength>1){
					commonFailure('只能选择一条计划汇报');
					return;
				} 
				var reportPlan=new ReportPlan({
					title:'汇报'+dialogTitle,
					contextPath:contextPath,
					pathForQueryPlan:_self.get('pathForQueryPlan'),
					reportPlanId:selections[0].id,
					pathForQueryReport:_self.get('pathForQueryReport'),
					pathForSaveReportPlan:_self.get('pathForSaveReportPlan'),
				});
					reportPlan.show();
					reportPlan.on('saveBtn',function(e){
						tbar.msg(e.result);
						reportPlan.close();
					});
					reportPlan.on('closing',function(e){
						_self._refreshPage(mainPageStore,_self);
					});
			});
		},
		_refreshPage:function(mainPageStore,_self){
			mainPageStore.load({'projectName':$('#projectName').val()});
		}
	},{ATTRS:{
		id:{value:'reportPage'},
		perId : {},
		pathForQueryPlan:{},
		pathForQueryReport:{},
		contextPath : {},//业务路径
		pathForPage:{},//主页路径
		dialogTitle:{},
		pathForSaveReportPlan:{},//汇报保存
	}});
	return ReportPage;
});