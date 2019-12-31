/**
 * 文件管理主页面模块
 */
define('views/technical/TechnicalDocumentPageNew',['bui/common',
	'bui/data','bui/grid','bui/calendar',
	'common/org/OrganizationPicker',
	'common/grid/SearchGridContainer',
	'common/data/PostLoad',
	'views/technical/TechnicalDocumentPageNewAdd',
	'views/technical/TechnicalDocumentPageNewUpdate',
	'views/technical/TechnicalDocumentPageNewDetails'],function(require){
	var BUI = require('bui/common');
	var Grid = require('bui/grid');
	var	Data = require('bui/data');
	var	Calendar = require('bui/calendar');
	var	PostLoad=require('common/data/PostLoad');
	var	OrganizationPicker = require('common/org/OrganizationPicker');
	var	SearchGridContainer = require('common/grid/SearchGridContainer');
	var	TechnicalDocumentPageNewAdd = require('views/technical/TechnicalDocumentPageNewAdd');
	var	TechnicalDocumentPageNewUpdate = require('views/technical/TechnicalDocumentPageNewUpdate');
	var	TechnicalDocumentPageNewDetails = require('views/technical/TechnicalDocumentPageNewDetails');
		var TechnicalDocumentPageNew = BUI.Component.Controller.extend({
			/**
			 * 初始化
			 */ 
			initializer: function(){
				var _self = this;
				_self.addChild(_self._initSearchGridContainer());
			},
			
			/**
			 * 渲染
			 */
			renderUI: function(){
				var _self = this;
				var contextPath = _self.get('contextPath');
				// 日历选择器
				var datePicker = new Calendar.DatePicker({
					trigger :'.calendar',
					showTime:true,
					autoRender : true,
					width : '209px'
				});
				// 初始化所属部门下拉框里的数据
				var orgPicker = new OrganizationPicker({
					trigger: '#orgVal',
					rootOrgId: gztxd_id,//昆明铁路局id
					rootOrgText: gztxd_name,
					delegateTrigger: true,
					url:contextPath + 'organization/getOrgChildrenById.cn',//必填项
					autoHide: true,
					align: {//设置对齐属性
						points: ['bl','tl'],
					},
					width: 195,
					height: 200
				});
				orgPicker.render();
				_self.set('orgPicker',orgPicker);
				
				_self.initDateType();
			},
			
			/**
			 * 绑定事件
			 */
			bindUI: function(){
				var _self = this;
				var contextPath = _self.get('contextPath');
				var store = _self.get('store');
				var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
				var tbar = table.get('tbar');
				
				//点击条件查询中的所属部门，弹出组织机构树
				var orgPicker = _self.get('orgPicker'); 
				orgPicker.on('orgSelected',function(e){
					$('#orgVal').val(e.org.text);
					$('#orgSelectId').val(e.org.id);
				});
				
				//新增
				tbar.getChild('add').on('click',function(){
					var addDialog = new TechnicalDocumentPageNewAdd({
						contextPath:contextPath
					});
					addDialog.show();
					addDialog.on('completeAddSave',function(e){
						tbar.msg(e.result);
						addDialog.close();
						_self._refreshPage();
					});
				});
				
				//修改
				tbar.getChild('update').on('click',function(){
					var selections = table.getSelection();
					if(!selections.length||selections.length>1){
  						tbar.msg({msg:'请选择一条数据进行操作！',status:'0'});
  						return;
  					}
					var fileUpdateDialog = new TechnicalDocumentPageNewUpdate({
						contextPath: contextPath,
						fileId: selections[0].id
					});
					fileUpdateDialog.show();
					fileUpdateDialog.on('completeUpdateSave',function(e){
						tbar.msg(e.result);
						fileUpdateDialog.close();
						_self._refreshPage();
					});
					fileUpdateDialog.on('close',function(e){
  						_self._refreshPage();
  					});
				});
				
				//删除
				tbar.getChild('del').on('click',function(){
					var selections = table.getSelection();
					if(!selections.length){
  						tbar.msg({msg:'至少选择一条数据进行操作！',status:'0'});
  						return;
  					}
					var fileIds=selections.map(function(s){return s.id}).join();
					BUI.Message.Confirm('确认要删除么？',function(){
						var pl=new PostLoad({
							url:contextPath + 'technicalDocument/delTechnical.cn',
							el:_self.get('el')
						});
						pl.load({jsonIds: fileIds},function(result){
							tbar.msg(result);
							_self._refreshPage();
						});
					});
				});
				
				//详情
				tbar.getChild('show').on('click',function(){
					var selections = table.getSelection();
					if(selections.length == 1){
						var fileId = selections[0].id;
						var technicalDocumentPageNewDetails = new TechnicalDocumentPageNewDetails(
								{contextPath: contextPath,fileId: fileId});
						technicalDocumentPageNewDetails.show();
					}else if(selections.length == 0){
						tbar.msg({msg:'请选择一条数据！',status:'0'});
					}else{
						tbar.msg({msg:'不能选择多条数据！',status:'0'});
					}
				});
				
				//导出Excel
				tbar.getChild('download').on('click',function(){
					var records = store.getResult();
					if(records.length != 0){
						_self._exportXls(records);
					}else{
						tbar.msg({msg:'没有数据可以导出！',status:'0'});
					}
				});
			},
			
			/**
			 * 导出本页数据
			 */
			_exportXls:function(records){
				$('#exportXlsJson').val('');//清空值
				// 拼接导出数据的JSON字符串
				var json = '[';
				for(var i = 0 ; i < records.length ; i++){
					var row = records[i];
					json += '{'
						+'"name":'+'"'+row.name+'",'
						+'"depart":'+'"'+row.depart+'",'
						+'"technicalInfoType":'+'"'+technicalInfo_type.typeName(row.technicalInfoType)+'",'
						+'"createStartDate":'+'"'+Grid.Format.datetimeRenderer(row.createDate)+'"'
						+'},';
				}
				json = json.substring(0, json.length - 1);
				json += ']';
				$('#exportXlsJson').val(json);
				$('#exportForm').submit();
			},
			/**
			 * 初始化SearchGridContainer
			 */
			_initSearchGridContainer: function(){
				var _self = this;
				var searchGridContainer = new SearchGridContainer({
					searchForm: _self._initSearchForm(),
					columns: _self._initColumns(),
					store: _self._initStore(),
					searchGrid: _self._initSearchGrid()
				});
				return searchGridContainer;
			},
			
			/**
			 * 初始化上部查询
			 */
			_initSearchForm: function(){
				return {
					items: [
						{
							label : '所属部门',
							item : '<input type="text" id="orgVal" style="width: 175px;" readonly="readonly"/>'
								+ '<input type="text" name="depart" id="orgSelectId" style="display:none;"/>'
						},{
							label : '资料名称',
							item : '<input type="text" name="name" id="accountName" style="width: 175px;" class="input-normal"/>'
						}
//						,{
//							label : '资料类别',
//							item : '<select name="technicalInfoType" id="dataType" style="width: 201px;"><option value="">请选择</option></select>'
//						}
						,{
							label : '创建时间',
							item : '<input type="text" name="createStartDate" id="startDate" style="width: 175px;" class="calendar calendar-time"/>'
						},{
							label : '至',
							item : '<input type="text" name="createEndDate" id="endDate" class="calendar calendar-time" style="width: 175px;" />'
						}
					]};
			},
			/**
			 * 获取文件类型数据
			 */
			initDateType:function(){
				technicalInfo_type.listData("#dataType");
			},
			/**
			 * 表格列名
			 */
			_initColumns: function(){
				var _self = this;
				var columns = [
					{
						title:'资料名称',
						dataIndex:'name',
						elCls:'center',
						width:'30%'
					},           
					{
						title:'所属部门',
						dataIndex:'depart',
						elCls:'center',
						width:'30%'
					}
//					,
//					{
//						title:'资料类别',
//						dataIndex:'technicalInfoType',
//						elCls:'center',
//						width:'15%',
//						renderer: function(value) {
//							return technicalInfo_type.typeName(value);
//						}
//					}
					,
					{
						title:'创建时间',
						dataIndex:'createDate',
						elCls:'center',
						width:'30%',
						renderer: Grid.Format.datetimeRenderer
					}
				];
				return columns;
			},
			
			/**
			 * 表格数据
			 */
			_initStore: function(){
				var _self = this,contextPath = _self.get('contextPath');
				var store = new Data.Store({
					url: contextPath + "technicalDocument/technicalList.cn",
					autoLoad: true,
					pageSize: 10,
					proxy: {
						method: 'post',
						dataType: 'json'
					},
				});
				_self.set('store',store);
				return store;
			},
			
			_refreshPage:function(){
        		var _self=this;
        		var seachForm=_self.getChild(SearchGridContainer.SEARCH_FORM_ID,true);
      			var store=_self.get('store');
      			store.load(seachForm.serializeToObject());
        	  },
        	  
			
			/**
			 * 初始化表格
			 */
			_initSearchGrid: function(){
				var _self = this;
				var searchGrid = {
					tbarItems: [
						{
							id: 'add',
							btnCls: 'button button-small addBtn',
							text: '<i class="icon-plus"></i>新增',
						},{
							xclass: 'bar-item-separator',
						},{
							id: 'update',
							btnCls: 'button button-small updateBtn',
							text: '<i class="icon-edit"></i>修改',
						},{
							xclass: 'bar-item-separator',
						},{
							id: 'del',
							btnCls: 'button button-small delBtn',
							text: '<i class="icon-remove"></i>批量删除',
						},{
							xclass: 'bar-item-separator',
						},{
							id: 'show',
							btnCls: 'button button-small showBtn',
							text: '<i class="icon-list-alt"></i>详情',
						},{
							xclass: 'bar-item-separator', 
						},{
							id: 'download',
							btnCls: 'button button-small downloadBtn',
							text: '<i class="icon-download"></i>导出EXCEL',
						}],
					plugins: [
						Grid.Plugins.CheckSelection,
						Grid.Plugins.RowNumber
					],
				};
				return searchGrid;
			},
		},{
			ATTRS:{
				/**
				 * 当前页ID
				 */
				perId: {},
				/**
				 * 项目名
				 */
				contextPath: {},
			}
		});
		return TechnicalDocumentPageNew;
});
