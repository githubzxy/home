/**
 * 文件管理主页面模块
 */
define('views/safeSystem/FileManagement',['bui/common',
	'bui/data','bui/grid','bui/calendar',
	'common/org/OrganizationPicker',
	'common/grid/SearchGridContainer',
	'common/data/PostLoad',
	'views/safeSystem/FileManagementAdd',
	'views/safeSystem/FileManagementUpdate',
	'views/safeSystem/FileManagementDetails'],function(require){
	var BUI = require('bui/common'),
		Grid = require('bui/grid'),
		Data = require('bui/data'),
		Calendar = require('bui/calendar'),
		PostLoad = require('common/data/PostLoad'),
		OrganizationPicker = require('common/org/OrganizationPicker'),
		SearchGridContainer = require('common/grid/SearchGridContainer'),
		FileManagementAdd = require('views/safeSystem/FileManagementAdd'),
		FileManagementUpdate = require('views/safeSystem/FileManagementUpdate'),
		FileManagementDetails = require('views/safeSystem/FileManagementDetails');
	var SEARCH_FORM_ID = 'searchForm';
	var FileManagement = BUI.Component.Controller.extend({
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
					console.log(e.org.id);
					$('#orgVal').val(e.org.text);
					$('#orgSelectId').val(e.org.id);
				});
				
				//新增
				$('.addBtn').on('click',function(e){
					var fileAddDialog = new FileManagementAdd({contextPath: contextPath});
					fileAddDialog.show();
					fileAddDialog.on('completeAddSave',function(e){
//						console.log(e);
						tbar.msg(e.result);
						fileAddDialog.close();
						store.load();
					});
				});
				//修改
				$('.updateBtn').on('click',function(e){
					var selections = table.getSelection();
					if(selections.length == 1){
//						console.log(selections);
						var fileId = selections[0].id;
//						console.log(fileId);
						var fileUpdateDialog = new FileManagementUpdate({
							contextPath: contextPath,
							fileId: fileId
						});
						fileUpdateDialog.show();
						fileUpdateDialog.on('completeUpdateSave',function(e){
							tbar.msg(e.result);
							fileUpdateDialog.close();
							store.load();
						});
					}else if(selections.length > 1){
						tbar.msg({msg:'不能选择多条数据进行修改！',status:'0'});
					}else{
						tbar.msg({msg:'请选择一条数据进行修改！',status:'0'});
					}
				});
				//删除
				$('.delBtn').on('click',function(e){
					var selections = table.getSelection();
					if(selections.length != 0){
						//将选中记录的id用,拼接
						var fileIds = "";
						for(var i = 0;i < selections.length;i++){
							fileIds += selections[i].id + ',';
						}
						fileIds = fileIds.substring(0, fileIds.length - 1);
						//弹出确认框
						BUI.Message.Confirm('确认要删除么？',function(){
							var postLoad =new PostLoad({
								url:contextPath + 'safeSystemAction/delRecord.cn',
								loadMsg:''
							});
							data = {ids: fileIds};
							postLoad.load(data,function(result){
								tbar.msg(result);
								store.load();
							});
						},'question');
					}else{
						tbar.msg({msg:'请选择要删除的数据！',status:'0'});
					}
				});
				//详情
				$('.showBtn').on('click',function(e){
					var selections = table.getSelection();
					if(selections.length == 1){
						var fileId = selections[0].id;
						var fileDetailsDialog = new FileManagementDetails(
								{contextPath: contextPath,fileId: fileId});
						fileDetailsDialog.show();
					}else if(selections.length == 0){
						tbar.msg({msg:'请选择一条数据！',status:'0'});
					}else{
						tbar.msg({msg:'不能选择多条数据！',status:'0'});
					}
				});
				//导出Excel
				$('.downloadBtn').on('click',function(e){
					var records = store.getResult();
					if(records.length != 0){
						_self._exportXls();
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
				rootOrgId: gtjt_id,//昆明铁路局id
				rootOrgText: gtjt_name,
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
			
			_self._initFileType();
			},
			/**
			 * 查询表单对象
			 */
			_getFormObject: function(){
				/*return {
					organization : $('#orgSelectId').val(),
					fileName : $('#fileName').val(),
					fileType : $('#fileType').val(),
					startDate : $('#startDate').val(),
					endDate : $('#endDate').val()
				};*/
				var _self = this;
				var form = _self.getChild(SEARCH_FORM_ID,true);
				var data = form.serializeToObject();
//				console.log(data);
				return data;
			},
			/**
			 * 导出本页数据
			 */
			_exportXls:function(){
				var _self = this;
				$("#exportXlsJson").val("");//清空值
				$("#exportXlsJson").val(JSON.stringify(_self._getFormObject()));
				$("#exportForm").submit();
			},
			/*_exportXls:function(){
				var _self = this;
				var data = _self._getFormObject();
				var postLoad = new PostLoad({
					url : contextPath + 'safeSystemAction/exportXls.cn',
					el : '#fileManage',
					loadMsg : '导出中...'
				}); 
        		data.startDate = BUI.Date.parse(data.startDate,"yyyy-MM-dd");
        		data.endDate = BUI.Date.parse(data.startDate,"yyyy-MM-dd");
				postLoad.load(data, function(result){
					console.log("导出成功");
				});
			},*/
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
							item : '<input type="text" id="orgVal" style="width: 160px;" readonly="readonly"/>'
								+ '<input type="text" name="organization" id="orgSelectId" style="display:none;"/>'
						},{
							label : '规章制度名称',
							item : '<input type="text" style="width: 160px;" name="fileName" id="fileName"/>'
						},{
							label : '规章制度类型',
							item : '<select name="fileType" id="fileType" style="width: 186px;"><option value="">请选择</option></select>'
						},
						{
							label : '上传时间',
							item : '<input type="text" class="calendar" name="startDate" id="startDate" style="width: 160px;">'
						},{
							label : '至',
							item : '<input type="text" class="calendar" name="endDate" id="endDate" style="width: 160px;">'
						}
					]};
			},
			/**
			 * 获取规章制度类型数据
			 */
			_initFileType:function(){
				$("#fileType").append("<option value='3110109' >安全规章</option>");
			},
			/**
			 * 表格列名
			 */
			_initColumns: function(){
				var _self = this;
				var columns = [
					{
						title:'规章制度名称',
						dataIndex:'fileName',
						elCls : 'center',
						width:'40%',
					},{
						title:'规章制度类型',
						dataIndex:'fileType',
						elCls : 'center',
						width:'20%',
						renderer:function(value,obj) {
							if(value=="3110109") return "安全规章";
						}
					},
					{
						title:'所属部门',
						dataIndex:'organization',
						elCls : 'center',
						width:'20%'
					},{
						title:'上传时间',
						dataIndex:'createStartDate',
						elCls: 'center',
						width:'20%'
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
					url: contextPath + 'safeSystemAction/getData.cn',
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
							id: 'add',
							btnCls: 'button button-small addBtn',
							text: '<i class="icon-plus"></i>新增',
						},{
							xclass: 'bar-item-separator', //竖线分隔符
						},{
							id: 'update',
							btnCls: 'button button-small updateBtn',
							text: '<i class="icon-edit"></i>修改',
						},{
							xclass: 'bar-item-separator', //竖线分隔符
						},{
							id: 'del',
							btnCls: 'button button-small delBtn',
							text: '<i class="icon-remove"></i>批量删除',
						},{
							xclass: 'bar-item-separator', //竖线分隔符
						},{
							id: 'show',
							btnCls: 'button button-small showBtn',
							text: '<i class="icon-list-alt"></i>详情',
						},{
							xclass: 'bar-item-separator', //竖线分隔符
						},{
							id: 'download',
							btnCls: 'button button-small downloadBtn',
							text: '<i class="icon-download"></i>导出EXCEL',
						}],
					plugins: [
						Grid.Plugins.CheckSelection,
						Grid.Plugins.RowNumber
					],
					permissionStore:_self._initPermissionStore()
				};
				return searchGrid;
			},
			/**
			 * 按钮权限设置
			 */
			_initPermissionStore: function(){
				var _self = this,contextPath = _self.get('contextPath');
				var permissionStore = new Data.Store({
					url: contextPath + 'permission/getBtnPers.cn',
					params: {
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
				id : {value:"fileManage"},
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
		return FileManagement;
});
