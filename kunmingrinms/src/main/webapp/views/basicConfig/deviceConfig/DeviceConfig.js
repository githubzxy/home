/**
* 模块：应急/日常设备配置主页面
* 创建人：lism
* 创建时间：2017年10月11日
*/
define('views/basicConfig/deviceConfig/DeviceConfig',[
	'bui/common',
	'bui/data',
	'bui/grid',
	'common/grid/SearchGridContainer',
	'views/basicConfig/deviceConfig/DeviceConfigAdd',
	'views/basicConfig/deviceConfig/DeviceConfigUpdate',
	'common/data/PostLoad'
	],function(r){
	var SearchGridContainer = r('common/grid/SearchGridContainer'),
		BUI = r('bui/common'),
		Grid = r('bui/grid'),
		Data = r('bui/data'),
		DeviceConfigAdd = r('views/basicConfig/deviceConfig/DeviceConfigAdd'),
		DeviceConfigUpdate = r('views/basicConfig/deviceConfig/DeviceConfigUpdate'),
		PostLoad = r('common/data/PostLoad');
	var DeviceConfig = BUI.Component.Controller.extend({
		
		initializer : function(){
			var _self = this;
			var searchGridContainer = new SearchGridContainer({
				searchForm : _self._initSearchForm(),
				columns : _self._initColumns(),
				store : _self._initStore(),
				searchGrid : _self._initSearchGrid(),
			});
			_self.addChild(searchGridContainer);
		},
		
		renderUI : function(){
			var _self = this;
			deviceConfig_type.listData("#deviceType");//加载查询区域下拉选数据
			$("#deviceType option[value='']").hide();
		},
		
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
			var tbar = table.get('tbar');
			var store = _self.get('store');
			
			/**新增*/
			$('.addDCBtn').on('click',function(e){
				var deviceConfigAddDialog = new DeviceConfigAdd({
					contextPath : contextPath
				});
				deviceConfigAddDialog.show();
				deviceConfigAddDialog.on('deviceConfigAddSave',function(e){
					deviceConfigAddDialog.close();
					store.load();
					tbar.msg(e.result);
				});
			});
			
			/**修改*/
			$('.updateDCBtn').on('click',function(e){
				var selections = table.getSelection();//选中项
				if(selections.length == 1){
					var record = selections[0];
					var deviceConfigUpdateDialog = new DeviceConfigUpdate({//修改弹出窗
						contextPath : contextPath,
						selectId : record.ID_
					});
					deviceConfigUpdateDialog.show();
					deviceConfigUpdateDialog.on('deviceConfigUpdateSave',function(e){
						deviceConfigUpdateDialog.close();
						store.load();
						tbar.msg(e.result);
					});
				}else if(selections.length > 1){
					tbar.msg({msg:'不能选择多条数据进行修改',status:'0'});
				}else{
					tbar.msg({msg:'请选择一条数据进行修改',status:'0'});
				}
			});
			
			/**删除*/
			$('.delDCBtn').on('click',function(e){
				var selections = table.getSelection();
				if(selections.length == 0){
					tbar.msg({msg:'请选择要删除的数据',status:'0'});
					return;
				}
				var msg = '您确定要删除吗?<br/>';
	    		BUI.Message.Confirm(msg,function(){
	    			var ids = "";
	    			for(var i = 0;i < selections.length;i++){
	    				ids = ids + "," + selections[i].ID_;
	    			}
	    			//删除操作
	    			var postLoad =new PostLoad({
			    		url : contextPath + "deviceConfigAction/deleteDeviceConfigs.cn",
			    		el : _self.get('el'),
			    		loadMsg : '删除中...'
					}); 
			    	var data = {
			    			jsonIds : ids.substring(1, ids.length)
			    	};
					postLoad.load(data,function(result){
						tbar.msg(result);
						store.load();
					});
	    		},
	    		'question');
			});
		},
		
		/**
		 * 上查询部分
		 */
		_initSearchForm : function(){
			return {
				items : [
					{label : '设备类别',item : '<select type="text" name="type" id="deviceType"><option value="">请选择</option></select>'},
					{label : '设备名称',item : '<input type="text" name="name" id="deviceName">'},
				]};
		},
		
		/**
		 * 表格列名
		 */
		_initColumns : function(){
			var _self = this;
			var columns = [
				{
					title:'设备类别',
					dataIndex:'DEVICECATEGORYID_',
					elCls : 'center',
					width:'25%',
					renderer: function(value) {
						return deviceConfig_type.typeName(value);
					}
				},
				{
					title:'设备名称',
					dataIndex:'NAME_',
					elCls : 'center',
					width:'30%',
				},
				{
					title:'单位',
					dataIndex:'UNIT_',
					elCls : 'center',
					width:'15%',
//					renderer: function(value) {
//						return unit_type.typeName(value);
//					}
				},
				{
					title:'创建时间',
					dataIndex:'CREATE_TIME_',
					elCls : 'center',
					width:'30%',
					renderer: Grid.Format.datetimeRenderer
				}
			];
			return columns;
		},
		
		/**
		 * 表格数据
		 */
		_initStore : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var store = new Data.Store({
				url : contextPath + "deviceConfigAction/getDeviceConfig.cn",
				autoLoad : true ,
				pageSize : 10,
				proxy : {
					method : 'post',
					dataType : 'json'
				}
			});
			_self.set('store',store);
			return store;
		},
		
		/**
		 * 初始化表格
		 */
		_initSearchGrid : function(){
			var _self = this;
			var searchGrid = {
					elCls : 'searchGrid',
					tbarItems :  [
						{
							id : 'add',
							btnCls : 'button button-small addDCBtn',
							text : '<i class="icon-plus"></i>新增',
						},{
		                	xclass : 'bar-item-separator' // 竖线分隔符
		                },{
		                	id : 'update',
							btnCls : 'button button-small updateDCBtn',
							text : '<i class="icon-edit"></i>修改',
						},{
							xclass : 'bar-item-separator' // 竖线分隔符
						},{
							id : 'del',
							btnCls : 'button button-small delDCBtn',
							text : '<i class="icon-remove"></i>批量删除',
						}],
					plugins : [
						Grid.Plugins.CheckSelection,
						Grid.Plugins.RowNumber,
						],
//			        permissionStore : _self._initPermissionStore()
			};
			return searchGrid;
		},
		
		/**
		 * 按钮权限设置
		 */
		_initPermissionStore : function(){
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
	},{
		ATTRS : {
			contextPath : {},
			perId : {}
		}
	});
	return DeviceConfig;
})