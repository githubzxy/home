/**
* 模块：设备单位配置主页面
* 创建人：lism
* 创建时间：2017年10月13日
*/
define('views/basicConfig/deviceUnitConfig/DeviceUnitConfig',[
	'bui/common',
	'bui/data',
	'bui/grid',
	'common/grid/SearchGridContainer',
	'views/basicConfig/deviceUnitConfig/DeviceUnitConfigAdd',
	'common/data/PostLoad'
	],function(r){
	var SearchGridContainer = r('common/grid/SearchGridContainer'),
		BUI = r('bui/common'),
		Grid = r('bui/grid'),
		Data = r('bui/data'),
		DeviceUnitConfigAdd = r('views/basicConfig/deviceUnitConfig/DeviceUnitConfigAdd'),
		PostLoad = r('common/data/PostLoad');
	var DeviceUnitConfig = BUI.Component.Controller.extend({
		
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
		},
		
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
			var tbar = table.get('tbar');
			var store = _self.get('store');
			
			/**新增*/
			$('.addDUCBtn').on('click',function(e){
				var deviceUnitConfigAddDialog = new DeviceUnitConfigAdd({
					contextPath : contextPath
				});
				deviceUnitConfigAddDialog.show();
				deviceUnitConfigAddDialog.on('deviceUnitConfigAddSave',function(e){
					deviceUnitConfigAddDialog.close();
					store.load();
					tbar.msg(e.result);
				});
			});
			
			/**删除*/
			$('.delDUCBtn').on('click',function(e){
				var selections = table.getSelection();
				if(selections.length == 0){
					tbar.msg({msg:'请选择要删除的数据!',status:'0'});
					return;
				}
				var msg = '您确定要删除吗?<br/>';
	    		BUI.Message.Confirm(msg,function(){
	    			var ids = "";
	    			for(var i = 0;i < selections.length;i++){
	    				ids = ids + "," + selections[i].id;
	    			}
	    			//删除操作
	    			var postLoad =new PostLoad({
			    		url : contextPath + "deviceUnitConfigAction/deleteDeviceUnitConfigs.cn",
						el:_self.get('el'),
						loadMsg:'删除中...'
					}); 
			    	var data = {
			    			jsonIds : ids.substring(1, ids.length)
			    	};
					postLoad.load(data,function(result){
						store.load();
						tbar.msg(result);
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
					{label : '单位名称',item : '<input type="text" name="unit" id="unitName">'},
				]};
		},
		
		/**
		 * 表格列名
		 */
		_initColumns : function(){
			var _self = this;
			var columns = [
				{
					title:'单位名称',
					dataIndex:'unit',
					width:'100%',
				},
			];
			return columns;
		},
		
		/**
		 * 表格数据
		 */
		_initStore : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var store = new Data.Store({
				url : contextPath + "deviceUnitConfigAction/getDeviceUnitConfig.cn",
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
							btnCls : 'button button-small addDUCBtn',
							text : '<i class="icon-plus"></i>新增',
						},{
		                	xclass : 'bar-item-separator' // 竖线分隔符
		                },{
							id : 'del',
							btnCls : 'button button-small delDUCBtn',
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
	},{
		ATTRS : {
			contextPath : {},
			perId : {}
		}
	});
	return DeviceUnitConfig;
})