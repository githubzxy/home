/**
 * 全部值班管理模块
 */
define('views/onduty/OnDutyAllPage',
		['bui/common','bui/data','bui/grid','bui/select',
	   'bui/calendar','common/grid/SearchGridContainer','common/data/PostLoad',
	   'common/org/OrganizationPicker','views/onduty/OnDutyAllAdd',
	   'views/onduty/OnDutyAllUpdate','views/onduty/OnDutyDetail',
       'views/onduty/OnDutyAllConfig', 'views/onduty/OnDutyAllImport'],
	   function(require){
	var BUI = require('bui/common'),
	Data = require('bui/data'),
	Grid = require('bui/grid'),
	Select = require('bui/select'),	
	Calendar = require('bui/calendar'),	
	PostLoad = require('common/data/PostLoad'),
	OrganizationPicker = require('common/org/OrganizationPicker'),
	SearchGridContainer = require('common/grid/SearchGridContainer'),
	OnDutyAllAdd = require('views/onduty/OnDutyAllAdd'),
	OnDutyAllUpdate = require('views/onduty/OnDutyAllUpdate'),
	OnDutyDetail = require('views/onduty/OnDutyDetail'),
	OnDutyAllConfig = require('views/onduty/OnDutyAllConfig'),
	OnDutyAllImport = require('views/onduty/OnDutyAllImport');
	var OnDutyAllPage = BUI.Component.Controller.extend({
		initializer : function () {
			var _self = this;
			var searchGridContainer = new SearchGridContainer({
				searchForm : _self._initSearchForm(),
				columns : _self._initColumns(),				
				searchGrid : _self._initSearchGrid(),
				store : _self._initStore(),	
				isJSONParam :'true'
			});
			_self.addChild(searchGridContainer);
		},
		bindUI : function(){
			var _self = this,store = _self.get('store'),contextPath = _self.get('contextPath'),
			table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true),
			tbar = table.get('tbar'),orgId=_self.get('orgId');
			// 点击条件查询中的申请单位,弹出组织机构树
			var orgPicker = _self.get('orgPicker');			
			orgPicker.on('itemclick',function(e){				
				orgPicker.hide();
			});		
			orgPicker.on('orgSelected',function(e){				
				$('#orgVal').val(e.org.text);
				$('#orgSelectId').val(e.org.id);
			});		
		
			// 点击新增按钮弹出新增对话框
			$('.addBtn').click(function(){
				var addForm = new OnDutyAllAdd({contextPath : contextPath,orgId:orgId});
				addForm.show();
				addForm.on('completeAddSave',function(e){
					tbar.msg(e.result);
					addForm.close();
					store.load();
				});
				
			});
			
			// 点击修改按钮弹出修改对话框
			$('.updateBtn').click(function(){
				var selections = table.getSelection();
				if(selections.length == 1){
					var recordId = selections[0].id;//值班信息ID
					var updateForm = new OnDutyAllUpdate({contextPath : contextPath , id : recordId});
					updateForm.show();
					updateForm.on('completeSave',function(e){
						tbar.msg(e.result);
						updateForm.close();
						store.load();
					});					
				}else {
					tbar._fail('请选择一条数据进行修改！');
				}				
			});
			// 点击详情按钮弹出详情对话框
			$('.showBtn').click(function(){
				var selections = table.getSelection();
				if(selections.length == 1){
					var ondutyId = selections[0].id;//值班信息ID
					var detailForm = new OnDutyDetail({contextPath : contextPath , ondutyId : ondutyId});
					detailForm.show();									
				}else {
					tbar._fail('请选择一条数据进行查看详情！');
				}				
			});
			// 点击删除按钮，删除数据
			$('.delBtn').click(function (){
				var selections = table.getSelection();
				if(selections.length == 0){
					tbar._fail("请选择一条记录进行删除！");
					return;
				}
				var ids = "";
				for(var i in selections) {
					ids += "," + selections[i].id ;
				}
				ids = ids.substring(1);
				var msg = '确定要删除选中记录吗？<br/>';
				BUI.Message.Confirm(msg,
				function(){
					var postLoad =new PostLoad({
						url:contextPath +  'ondutyAction/delete.cn',
						el:'#ondutyAll',
						loadMsg:'删除中...'
					}); 			    	
					postLoad.load({ids:ids},function(data){
						if(data.status){//显示成功信息，并在5秒后消失
							commonSuccess();
						}else{
							commonFailure();
						}
						store.load();
					});
				},'question');
			});
			
			// 点配置值班部门按钮，弹出值班部门框
			$('.configBtn').click(function (){
				var configForm = new OnDutyAllConfig({contextPath : contextPath});
				configForm.show();
				configForm.on('completeSave',function(e){
					tbar.msg(e.result);
					configForm.close();
				});
			});
			
			// 点吉导入数据按钮，弹出导入数据框
			$('.importBtn').click(function (){
				var importForm = new OnDutyAllImport({contextPath : contextPath, perId : _self.get('perId')});
				importForm.show();			
				store.load();				
			});
			
		},
		renderUI : function () {
			var _self = this;
			//初始化下拉选，调用公共方法
			_self._initPage();
			var store = _self.get('store');
			store.load({'param':JSON.stringify(_self._getParams())});
			//初始化日期组件
			var datepicker = new Calendar.DatePicker({
				trigger : '.calendar',
				autoRender : true,
				dateMask : 'yyyy/mm/dd'
			});
			//初始化值班部门树
			var orgPicker = new OrganizationPicker({
		          trigger : '#orgVal',
		          rootOrgId : gztxd_id,//必填项
		          rootOrgText : gztxd_name,//必填项
		          delegateTrigger : true, 
		          url : contextPath + 'organization/getOrgChildrenById.cn',//必填项
		          autoHide : true,
		          align : {
		               points : ['bl','tl']
		          },
		          width : 195,
		          height : 200
		 	 });
			orgPicker.render();			 
			_self.set('orgPicker',orgPicker);
		},
		/**
		 * 查询表单
		 */
		_initSearchForm : function () {
			return {
				items : [				
					{
						label : '值班部门',
						item : '<input type="text" id="orgVal" style="width: 175px;" readOnly="readonly"/>'
							+ '<input type="text" name="orgId" id="orgSelectId" style="display:none;"/>'
					},
					{
						label : '值班人',
						item : '<input type="text" name="name"  id="dutyName" class="input-normal" style="width: 175px;" /> '
					},
					{
						label : '星期',
						item : '<select id="week" name = "week" style="width: 200px;"></select>'
					},
					{
						label : '值班日期',
						item : '<input type="text" name="startDate" id="startDate" class="calendar" style="width: 175px;" readOnly="readonly" />'
					},
					{
						label : '至',
						item : '<input type="text" name="endDate" id="endDate" class="calendar" style="width: 175px;" readOnly="readonly" />'
					},
					{
						label : '是否汇报',
						item : '<select id="status" name="status" style="width: 200px;"></select>'
					}
				]
			};
		},
		/**
		 * 表格
		 */
		_initSearchGrid : function(){
			var _self = this;
			var searchGrid = {
					tbarItems : [
						{
							id : 'add',
							btnCls : 'button button-small addBtn',
							text : '<i class="icon-plus"></i>新增'						
						},
						{
							xclass : 'bar-item-separator'    // 竖线分隔符
						}, {
							id : 'update',
							btnCls : 'button button-small updateBtn',
							text : '<i class="icon-edit"></i>修改',							
						},
						{
							xclass : 'bar-item-separator'   // 竖线分隔符
						}, {
							id : 'del',
							btnCls : 'button button-small delBtn',
							text : '<i class="icon-remove"></i>批量删除',
						},
						{
							xclass : 'bar-item-separator'   // 竖线分隔符
						}, {
							id : 'show',
							btnCls : 'button button-small showBtn',
							text : '<i class="icon-list-alt"></i>详情'						
						},
						{
							xclass : 'bar-item-separator'   // 竖线分隔符
						},
//						{
//							id : 'add',
//							btnCls : 'button button-small configBtn',
//							text : '<i class="icon-asterisk"></i>配置值班部门'							
//						},
//						{
//							xclass : 'bar-item-separator'  // 竖线分隔符
//						},
						{
							  id : 'import',
			                  btnCls : 'button button-small importBtn',
			                  text : '<i class="icon-upload"></i>导入数据'			                 
			            }
					],
					plugins : [
			        	Grid.Plugins.CheckSelection,//多选框插件
						Grid.Plugins.RowNumber//列序号插件
					],									
			        //按钮权限设置
//			        permissionStore :  _self._initPermissionStore()
			};
			return searchGrid;
		},
		
		/**
		 * 按钮权限设置
		 */
		_initPermissionStore : function() {
			var _self = this,contextPath = _self.get('contextPath');
			var permissionStore = new Data.Store({
				url : contextPath + 'permission/getBtnPers.cn',
				params : {
					perId : _self.get('perId')
				},
				proxy : {
					method : 'post',
					dataType : 'json'
			    }
			});
			return permissionStore;
		},
		
		/**
		 * 数据源
		 */
		_initStore : function(){
			var _self = this,contextPath = _self.get('contextPath');			
			var store = new Data.Store({
				url : contextPath+'ondutyAction/getOnDutyByDto.cn',
				pageSize : 10,
				proxy : {
					method : 'post',
					dataType : 'json'
				},
			});
			
			_self.set('store',store);			
			return store;
		},		
		_getParams : function () {
			var _self = this;
			
			return {
				orgId : $("#orgSelectId").val(),
				name : $("#dutyName").val(),
				week : $("#week").val(),
				startDate : $("#startDate").val(),
				endDate : $("#endDate").val(),
				status : $("#status").val(),
			};
		},
		/**
		 * 列表表头
		 */
		_initColumns : function() {	
			var columns = [{//TODO自己声明列表表头
				title : '值班日期',
				dataIndex : 'dutyDate',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '13%',
				
			},
			{
				title : '星期',
				dataIndex : 'week',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '9%',
				renderer: function(value) {
					return weekToChinese(value);
				}
			},{
				title : '值班部门',
				dataIndex : 'user',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '12%',
				renderer:function(value) {
					if(value != null && value.organization != null) {
						return value.organization.name;
					}
					return "";
				}
			},{
				title : '值班人',
				dataIndex : 'user',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '9%',
				renderer:function(value) {
					return value == null ? "" : value.name;
				}
			},{
				title : '固定电话',
				dataIndex : 'fixedNum',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '9%',	
				renderer:function(value,obj,index) {
					return value == null ? obj.user.telephoneNumber : value ;
				}
			},{
				title : '手机',
				dataIndex : 'cellPhoneNum',
				elCls : 'center',
				sortable : false,	
				width : '9%',	
				renderer:function(value,obj,index) {
					return value == null ? obj.user.phone : value;
				}
			},{
				title : '是否汇报',
				dataIndex : 'status',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '9%',
				renderer: function(value) {
					return statusToChinese(value);
				}
			}, {
				title : '情况汇报',
				dataIndex : 'situation',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '30%',
			}]
			return columns;
		},
		_initPage : function() {			
			initWeek("week");
			initStatus("status");
		}				
	},{
		ATTRS : {
			elAttrs : {value: {id:"ondutyAll"}},
			/**
			 * 当前页ID
			 */
			perId : {},
			orgId:{},
			/**
			 * 项目名
			 */
			contextPath : {}
		}
	});
	return OnDutyAllPage;
});