/**
* 模块：应急设备标准配置主页面
* 创建人：lism
* 创建时间：2017年10月12日
*/
define('views/basicConfig/deviceNormConfig/DeviceNormConfig',[
	'bui/common',
	'bui/data',
	'bui/grid',
	'common/grid/SearchGridContainer',
	'views/basicConfig/deviceNormConfig/DeviceNormConfigAdd',
	'views/basicConfig/deviceNormConfig/DeviceNormConfigUpdate',
	'common/data/PostLoad'
	],function(r){
	var SearchGridContainer = r('common/grid/SearchGridContainer'),
		BUI = r('bui/common'),
		Grid = r('bui/grid'),
		Data = r('bui/data'),
		DeviceNormConfigAdd = r('views/basicConfig/deviceNormConfig/DeviceNormConfigAdd'),
		DeviceNormConfigUpdate = r('views/basicConfig/deviceNormConfig/DeviceNormConfigUpdate'),
		PostLoad = r('common/data/PostLoad');
	var DeviceNormConfig = BUI.Component.Controller.extend({
		
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
			deviceNormConfig_type.listData("#deviceType");//加载查询区域设备类别下拉选数据
			$("#deviceType option[value='']").hide();
			$("#deviceName option[value='']").hide();
//			$('#deviceName').attr("disabled",true);//禁用设备名称下拉选
			_self._showDeviceName();//获取设备名称下拉选数据，并且数据与设备类别联动
		},
		
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
			var tbar = table.get('tbar');
			var store = _self.get('store');
			$('.form-actions .button[type="reset"]').click(function(e){//点击重置按钮：触发重置事件，并将设备名称设置成初始状态
				$("#deviceName option").remove();
				$("#deviceName").append("<option value=''>请选择设备类别</option>");
				$("#deviceName option[value='']").hide();
//				$('#deviceName').attr("disabled",true);
			});
			
			/**新增*/
			$('.addDNCBtn').on('click',function(e){
				var deviceNormConfigAddDialog = new DeviceNormConfigAdd({
					contextPath : contextPath
				});
				deviceNormConfigAddDialog.show();
				deviceNormConfigAddDialog.on('deviceNormConfigAddSave',function(e){
					deviceNormConfigAddDialog.close();
					store.load();
					tbar.msg(e.result);
				});
			});
			
			/**修改*/
			$('.updateDNCBtn').on('click',function(e){
				var selections = table.getSelection();
				if(selections.length == 1){
					var record = selections[0];
					console.log(record);
					var deviceNormConfigUpdateDialog = new DeviceNormConfigUpdate({//修改弹出窗
						contextPath : contextPath,
						selectId : record.id
					});
					deviceNormConfigUpdateDialog.show();
					deviceNormConfigUpdateDialog.on('deviceNormConfigUpdateSave',function(e){
						deviceNormConfigUpdateDialog.close();
						store.load();
						tbar.msg(e.result);
					});
				}else if(selections.length > 1){
					tbar.msg({msg:'不能选择多条数据进行修改!',status:'0'});
				}else{
					tbar.msg({msg:'请选择一条数据进行修改!',status:'0'});
				}
			});
			
			/**删除*/
			$('.delDNCBtn').on('click',function(e){
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
			    		url : contextPath + "deviceNormConfigAction/deleteDeviceNormConfigs.cn",
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
		 * 显示设备名称数据
		 */
		_showDeviceName : function(){
			var _self = this;
			$('#deviceType').change(function(e){
				if($('#deviceType').val()){
//					$('#deviceName').attr("disabled",false);
					var typeId = $('#deviceType').val();//设备类别选中项的值
					$("#deviceName option").remove();
					//通过设备类别查询设备名称
					var postLoad =new PostLoad({
			    		url : contextPath + "deviceNormConfigAction/getDeivceConfigByTypeId.cn",
					}); 
			    	var data = {
			    			typeId : typeId
			    	};
					postLoad.load(data,function(result){
						$("#deviceName").append("<option value=''>请选择</option>");
						$("#deviceName option[value='']").hide();
						for(var i = 0 ; i < result.length ; i++){
							var text = result[i].name;
							var value = result[i].id;
							$("#deviceName").append("<option value='"+value+"'>"+text+"</option>");
						}
					});
				}else{
					$("#deviceName option").remove();
					$("#deviceName").append("<option value=''>请选择设备类别</option>");
//					$('#deviceName').attr("disabled",true);
				}
			});
			
		},
		
		/**
		 * 上查询部分
		 */
		_initSearchForm : function(){
			return {
				items : [
					{label : '设备类别',item : '<select name="type" id="deviceType"><option value="">请选择</option></select>'},
					{label : '设备名称',item : '<select name="name" id="deviceName"><option value="">请选择设备类别</option></select>'},
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
					dataIndex:'deviceName',
					elCls : 'center',
					width:'25%',
					renderer: function(value) {
						return deviceConfig_type.typeName(value.deviceCategory);
					}
				},
				{
					title:'设备名称',
					dataIndex:'deviceName',
					elCls : 'center',
					width:'30%',
					renderer: function(value) {
						return value.name;
					}
				},
				{
					title:'指标值',
					dataIndex:'normValue',
					elCls : 'center',
					width:'15%',
				},
				{
					title:'备注',
					dataIndex:'remark',
					elCls : 'center',
					width:'30%',
					renderer: function(value) {
						return value==null ? "": value;
					}
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
				url : contextPath + "deviceNormConfigAction/getDeviceNormConfig.cn",
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
							btnCls : 'button button-small addDNCBtn',
							text : '<i class="icon-plus"></i>新增',
						},{
		                	xclass : 'bar-item-separator' // 竖线分隔符
		                },{
		                	id : 'update',
							btnCls : 'button button-small updateDNCBtn',
							text : '<i class="icon-edit"></i>修改',
						},{
							xclass : 'bar-item-separator' // 竖线分隔符
						},{
							id : 'del',
							btnCls : 'button button-small delDNCBtn',
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
	return DeviceNormConfig;
})