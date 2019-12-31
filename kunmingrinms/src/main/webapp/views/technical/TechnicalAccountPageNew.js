/**
 * 文件管理主页面模块
 */
define('views/technical/TechnicalAccountPageNew',['bui/common',
	'bui/data','bui/grid','bui/calendar',
	'common/org/OrganizationPicker',
	'common/grid/SearchGridContainer',
	'common/data/PostLoad',
	'views/technical/TechnicalAccountPageNewAdd',
	'views/technical/TechnicalAccountPageNewUpdate',
	'views/technical/TechnicalAccountPageNewDetails'],function(require){
	var BUI = require('bui/common');
		Grid = require('bui/grid');
		Data = require('bui/data');
		Calendar = require('bui/calendar');
		PostLoad = require('common/data/PostLoad'),
		OrganizationPicker = require('common/org/OrganizationPicker'),
		SearchGridContainer = require('common/grid/SearchGridContainer'),
		TechnicalAccountPageNewAdd = require('views/technical/TechnicalAccountPageNewAdd'),
		TechnicalAccountPageNewUpdate = require('views/technical/TechnicalAccountPageNewUpdate'),
		TechnicalAccountPageNewDetails = require('views/technical/TechnicalAccountPageNewDetails');
		var TechnicalAccountPageNew = BUI.Component.Controller.extend({
			/**
			 * 初始化
			 */ 
			initializer: function(){
				var _self = this;
				_self.addChild(_self._initSearchGridContainer());
			},
			/**
			 * 绑定事件
			 */
			bindUI: function(){
				var _self = this,contextPath = _self.get('contextPath'),store = _self.get('store');
				var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
				var tbar = table.get('tbar');
				
				//点击条件查询中的所属部门，弹出组织机构树
				var orgPicker = _self.get('orgPicker'); 
				
				orgPicker.on('orgSelected',function(e){
					$('#orgVal').val(e.org.text);
					$('#orgSelectId').val(e.org.id);
				});
				
//				orgPicker.on('itemclick',function(e){
//					orgPicker.hide();
//				});
				
				//新增
				tbar.getChild('addBtn').on('click',function(){
					var addDialog = new TechnicalAccountPageNewAdd({contextPath: contextPath});
					addDialog.show();
					addDialog.on('completeAddSave',function(e){
						if(e.result == "0"){
							tbar.msg({msg:'新增成功',status:'1'});
							store.load();
						}else{
							tbar.msg({msg:'新增失败',status:'0'});
						}
						addDialog.close();
					});
				});
				//修改
				tbar.getChild('updateBtn').on('click',function(){
					var selections = table.getSelection();
					if(selections.length != 1){
						tbar.msg({msg:'请选择一条数据进行修改！',status:'0'});
						return;
					}
					var fileUpdateDialog = new TechnicalAccountPageNewUpdate({
						contextPath: contextPath,
						fileId: selections[0].id
					});
					fileUpdateDialog.show();
					fileUpdateDialog.on('completeUpdateSave',function(e){
						if(e.result == "0"){
							tbar.msg({msg:'修改成功',status:'1'});
						}else{
							tbar.msg({msg:'修改失败',status:'0'});
						}
						fileUpdateDialog.close();
					});
					fileUpdateDialog.on('closing',function(){
						store.load();
					});
				});
				//删除
				tbar.getChild('delBtn').on('click',function(){
					var selections = table.getSelection();
					if(selections.length == 0){
						tbar.msg({msg:'请选择要删除的数据！',status:'0'});
						return;
					}
					//弹出确认框
					BUI.Message.Confirm('确认要删除么？',function(){
						//将选中记录的id用,拼接
						var fileIds = selections.map(function(s){return s.id}).join();
						var pl = new PostLoad({
							url : contextPath + 'technicalAccountAction/delTechnicalAccountData.cn',
						});
						pl.load({jsonIds: fileIds},function(result){
							if(result == "0"){
								tbar.msg({msg:'删除成功',status:'1'});
								store.load();
							}else{
								tbar.msg({msg:'删除失败！',status:'0'});
							}
						});
					},'question');
				});
				//详情
				tbar.getChild('showBtn').on('click',function(){
					var selections = table.getSelection();
					if(selections.length != 1){
						tbar.msg({msg:'请选择一条数据查看详情！',status:'0'});
						return;
					}
					var fileId = selections[0].id;
					var technicalAccountPageNewDetails = new TechnicalAccountPageNewDetails({
						contextPath: contextPath,
						fileId: fileId
					});
					technicalAccountPageNewDetails.show();
					technicalAccountPageNewDetails.on('closing',function(){
						store.load();
					});
				});
				//导出Excel
				tbar.getChild('downloadBtn').on('click',function(){
					var records = store.getResult();
					if(records.length != 0){
						_self._exportXls(records);
					}else{
						tbar.msg({msg:'没有数据可以导出！',status:'0'});
					}
				});
			},
			/**
			 * 渲染
			 */
			renderUI: function(){
			var _self = this,contextPath = _self.get('contextPath');
			$('#dataType option[value=""]').hide();
			/**
			 * 日历选择器
			 */
			var datePicker = new Calendar.DatePicker({
				trigger :'.calendar',
				showTime:true,
				autoRender : true,
				width : '209px'
			});
			/**
			 * 初始化所属部门下拉框里的数据
			 */
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
						+'"type":'+'"'+technicalInfo_type.typeName(row.technicalInfoType)+'",'
						+'"createDate":'+'"'+Grid.Format.datetimeRenderer(row.createDate)+'"'
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
							label : '台账名称',
							item : '<input type="text" name="name" id="accountName" style="width: 175px;" class="input-normal"/>'
						},{
							label : '台账类别',
							item : '<select name="type" id="dataType" style="width: 201px;"><option value="">请选择</option></select>'
						},{
							label : '创建时间',
							item : '<input type="text" name="startDate" id="startDate" style="width: 175px;" class="calendar calendar-time"/>'
						},{
							label : '至',
							item : '<input type="text" name="endDate" id="endDate" class="calendar calendar-time" style="width: 175px;" />'
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
						title:'台账名称',
						dataIndex:'name',
						width:'65%'
					},           
					{
						title:'所属部门',
						dataIndex:'depart',
						width:'15%'
					},
					{
						title:'台账类别',
						dataIndex:'technicalInfoType',
						width:'15%',
						renderer: function(value) {
							return technicalInfo_type.typeName(value);
						}
					},
					{
						title:'创建时间',
						dataIndex:'createDate',
						width:'15%',
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
					url: contextPath + "technicalAccountAction/getAccountData.cn",
					autoLoad: true,
					pageSize: 10,
					proxy: {
						method: 'post',
						dataType: 'json'
					}
				});
				_self.set('store',store);
				return store;
			},
			
			/**
			 * 初始化表格
			 */
			_initSearchGrid: function(){
				var _self = this;
				var searchGrid = {
					tbarItems: [
						{
							id: 'addBtn',
							btnCls: 'button button-small addBtn',
							text: '<i class="icon-plus"></i>新增',
						},{
							xclass: 'bar-item-separator', 
						},{
							id: 'updateBtn',
							btnCls: 'button button-small updateBtn',
							text: '<i class="icon-edit"></i>修改',
						},{
							xclass: 'bar-item-separator', 
						},{
							id: 'delBtn',
							btnCls: 'button button-small delBtn',
							text: '<i class="icon-remove"></i>批量删除',
						},{
							xclass: 'bar-item-separator', 
						},{
							id: 'showBtn',
							btnCls: 'button button-small showBtn',
							text: '<i class="icon-list-alt"></i>详情',
						},{
							xclass: 'bar-item-separator', 
						},{
							id: 'downloadBtn',
							btnCls: 'button button-small downloadBtn',
							text: '<i class="icon-download"></i>导出EXCEL',
						}],
					plugins: [
						Grid.Plugins.CheckSelection,//选择框
						Grid.Plugins.RowNumber//序号
					],
//					permissionStore:_self._initPermissionStore()
				};
				return searchGrid;
			},
			/**
			 * 按钮权限设置
			 */
			_initPermissionStore: function(){
				var _self = this,contextPath = _self.get('contextPath');
				var permissionStore = new Data.Store({
					url: contextPath + '',
					param: {
						perId: _self.get('perId'),
					},
					proxy:{
						method: 'post',
						dataType: 'json'
					} 
				});
				return permissionStore;
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
		return TechnicalAccountPageNew;
});
