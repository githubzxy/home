/**
 * 停机计划主页模块
 */
define('views/commNetStop/stopPlan/StopPlanPage',[
											'bui/common','bui/data','bui/grid',
											'common/grid/SearchGridContainer',
											'common/org/OrganizationPicker',
											'views/commNetStop/stopPlan/StopPlanAdd',
											'views/commNetStop/stopPlan/StopPlanUpdate',
											'views/commNetStop/stopPlan/StopPlanReply',
											'views/commNetStop/StopPlanShow',
											'views/commNetStop/stopPlan/StopPlanImport'
											],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,
	Data = require('bui/data'),Grid = require('bui/grid'),
	OrganizationPicker = require('common/org/OrganizationPicker'),
	SearchGridContainer = require('common/grid/SearchGridContainer'),
	StopPlanAdd = require('views/commNetStop/stopPlan/StopPlanAdd'),
	StopPlanUpdate = require('views/commNetStop/stopPlan/StopPlanUpdate'),
	StopPlanReply = require('views/commNetStop/stopPlan/StopPlanReply'),
	StopPlanShow = require('views/commNetStop/StopPlanShow'),
	StopPlanImport = require('views/commNetStop/stopPlan/StopPlanImport');
	
	var StopPlan = Component.Controller.extend({
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
			var _self = this,contextPath = _self.get('contextPath');
			var orgPicker = new OrganizationPicker({
		          trigger : '#orgSelectName',
		          rootOrgId : hhkj_hydwd_id,//必填项
		          rootOrgText : hhkj_hydwd_name,//必填项
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
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath'),
			store = _self.get('store'),
			table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true),
			tbar = table.get('tbar');
			
			//			table.set('width','1720px');// 设置列表宽度
			
			_self._initSearchFormAutoFilling();// 自动填充映射条件查询初始值
			
			// 点击条件查询中的申请单位,弹出组织机构树
			var orgPicker = _self.get('orgPicker');
			orgPicker.on('orgSelected',function(e){
				 $('#orgSelectName').val(e.org.text);
				 $('#orgSelectId').val(e.org.id);
			});
			
			// 点击新增按钮弹出新增对话框
			$('.addBtn').click(function(){
				var addForm = new StopPlanAdd({contextPath : contextPath});
				addForm.show();
				addForm.on('completeSave',function(e){
					tbar.msg(e.result);
					addForm.close();
					store.load();
				});
				addForm.on('close',function(e){
					store.load();
				});
			});
			// 点击修改按钮,弹出修改对话框
			$('.updateBtn').click(function(){
				var selections = table.getSelection();
				if(selections.length == 1){
					var record = selections[0];
					if(record.state == commNetworkStop_old_status.wait_examine){
						var updateForm = new StopPlanUpdate({contextPath : contextPath,stopPlanUpdateId : record.id});
						updateForm.show();
						updateForm.on('completeUpdate',function(e){
							tbar.msg(e.result);
							updateForm.close();
							store.load();
						});
						updateForm.on('close',function(e){
							store.load();
						});
					}else{
						tbar._fail("只能修改状态为[待审核]的数据！");
					}
				}else{
					tbar._fail('请选择一条数据进行查看！');
				}
			});
			// 点击删除,删除已勾选的数据
			$('.delBtn').click(function(){
				var selections = table.getSelection();
				if(selections.length != 0){
					BUI.Message.Confirm('您确定要删除选中的数据吗?<br/>',function(){
						var ids = "";
		    			for(var i = 0;i < selections.length;i++){
		    				ids += selections[i].id + ',';
		    			}
		    			ids = ids.substring(0, ids.length - 1);
						$.post(contextPath + 'commNetStopAction/deleteCommNetStop.cn',{ids : ids},function(result){
					    	tbar.msg(result);
					    	store.load();
					    });
					},'question');
				}else{
					tbar._fail('请选择要删除的数据！');
				}
			});
			// 点击回复按钮,弹出回复对话框
			$('.replyBtn').click(function(){
				var selections = table.getSelection();
				if(selections.length==1){
					var record = selections[0];
					if(record.state == commNetworkStop_old_status.wait_reply){//待回复的数据才能回复
						var replyForm = new StopPlanReply({contextPath : contextPath, stopPlanId : record.id});
						replyForm.show();
						replyForm.on('replyBtn',function(e){
							replyForm.close();
							tbar.msg(e.result);
							store.load();
						});
					}else{
						tbar._fail("只能回复状态为[待回复]的数据！");
					}
				}else{
					if(selections.length==0){
						tbar._fail('请选择需要回复的数据');
					}else{
						tbar._fail('请勾选一条数据');
					}
				}				
			});
			// 点击详情按钮,弹出详情对话框
			$('.showBtn').click(function(){
				var selections = table.getSelection();
				if(selections.length == 1){
					var record = selections[0];
					var showForm = new StopPlanShow({contextPath : contextPath, stopPlanId : record.id});
					showForm.show();
					showForm.on('close',function(e){
						store.load();
					});
				}else{
					tbar._fail('请选择一条数据进行查看！');
				}
			});
			// 点击导入数据按钮,弹出导入数据对话框
			$('.importBtn').click(function(){
				var importForm = new StopPlanImport({contextPath : contextPath, perId : _self.get('perId')});
				importForm.show();
				importForm.on('completeImport',function(e){
					tbar.msg(e.result);
					importForm.close();
					store.load();
				});
				importForm.on('close',function(e){
					store.load();
				});
			});
			// 点击导出EXCEL按钮,导出当前页数据
			$('.downloadBtn').click(function(){
				var records = store.getResult();
				if(records.length != 0){
					_self._exportXls(records);
				}else{
					tbar._fail('没有数据可以导出！');
				}
			});
		},
		/**
		 * 导出本页数据
		 */
		_exportXls : function(records){
			$("#exportXlsJson").val("");//清空值
			// 拼接导出数据的JSON字符串
			var json = '[';
			for(var i = 0 ; i < records.length ; i++){
				var row = records[i];
				json += '{'
					+'"state":'+'"'+commNetworkStop_old_status.typeName(row.state)+'",'
					+'"startDate":'+'"'+Grid.Format.datetimeRenderer(row.startDate)+'",'
					+'"endDate":'+'"'+Grid.Format.datetimeRenderer(row.endDate)+'",'
					+'"railLineName":'+'"'+row.railLineName+'",'
					+'"applyOrgName":'+'"'+row.applyOrgName+'",'
					+'"executionAddr":'+'"'+row.executionAddr+'",'
					+'"belongCraft":'+'"'+commNetworkStop_major.typeName(row.belongCraft)+'",'
					+'"executionType":'+'"'+commNetworkStop_constructionType.typeName(row.executionType)+'",'
					+'"executionAttr":'+'"'+commNetworkStop_constructionAttr.typeName(row.executionAttr)+'",'
					+'"workContent":'+'"'+commNetworkStop_workContent.typeName(row.workContent)+'",'
					+'"mainNetName":'+'"'+row.mainNetName+'",'
					+'"railwaysBureau":'+'"'+row.railwaysBureau+'",'
					+'"planExaminNum":'+'"'+(row.planExaminNum?row.planExaminNum:'')+'",'
					+'"monthPlanExamin":'+'"'+(row.monthPlanExamin?row.monthPlanExamin:'')+'",'
					+'"executionPlanNum":'+'"'+(row.executionPlanNum?row.executionPlanNum:'')+'"'
					+'},';
			}
			json = json.substring(0, json.length - 1);
			json += ']';
			$("#exportXlsJson").val(json);
			$("#exportForm").submit();
		},
		/**
		 * 查询条件表单
		 */
		_initSearchForm : function() {
  			return { 
  				items : [{
	  				label : '线路',
	  				item : '<select name="railLineName" id="railLineName" style="width: 181px;"></select>'
	  			},{
	  				label : '申请单位',
	  				item : '<input id="orgSelectName" style="width: 177px;" />'
	  					+ '<input type="text" name="org" id="orgSelectId" style="display:none;"/>'
	  			},{
	  				label : '所属专业',
	  				item : '<select name="belongCraft" id="belongCraft" style="width: 181px;"></select>'
	  			},{
	  				label : '施工类别',
	  				item : '<select name="executionType" id="executionType" style="width: 181px;"></select>'
	  			},{
	  				label : '施工属性',
	  				item : '<select name="executionAttr" id="executionAttr" style="width: 181px;"></select>'
	  			},{
	  				label : '工作内容',
	  				item : '<select name="workContent" id="workContent" style="width: 181px;"></select>'
	  			},{
	  				label : '涉及骨干网',
	  				item : '<input type="text" name="mainNetName" id="mainNetName" style="width: 171px;" />'
	  			},{
	  				label : '状态',
	  				item : '<select name="state" id="state" style="width: 181px;"></select>'
	  			},{
  					label:'是否天窗',
					item:'<select name="skyLight" id="selectSkyLight" style="width:181px;">' +
						'<option value=" ">全部</option>'+
						'<option value="false">否</option>'+
						'<option value="true">是</option>'+
						'</select>'
				}]
  			};
		},
		/**
		 * 自动填充映射条件查询初始值
		 */
		_initSearchFormAutoFilling : function(){
			commNetworkStop_rainLine.listData("#railLineName");// 线路
			commNetworkStop_major.listData("#belongCraft");// 所属专业
			commNetworkStop_constructionType.listData("#executionType");// 施工类别
			commNetworkStop_constructionAttr.listData("#executionAttr");// 施工属性
			commNetworkStop_workContent.listData("#workContent");// 工作内容
			commNetworkStop_old_status.listData("#state");// 状态
		},
		/**
		 * 列表表格表头
		 */
		_initColumns : function() {
			/*表格列设置*/
			var columns = [{
					title : '状态',
					dataIndex : 'state',
					elCls : 'center',
					width :'7%',
					renderer : function(value){
						return commNetworkStop_old_status.typeName(value);
					}
				},{
					title : '开始时间',
					dataIndex : 'startDate',
					elCls : 'center',
					width : '75px',
					renderer : Grid.Format.datetimeRenderer
				},{
					title : '结束时间',
					dataIndex : 'endDate',
					elCls : 'center',
					width : '75px',
					renderer : Grid.Format.datetimeRenderer
				},{
					title : '线路',
					dataIndex :'railLineName',
					elCls : 'center',
					width : '7%'
				},{
					title : '申请单位',
					dataIndex : 'applyOrgName',
					elCls : 'center',
					width : '10%'
				},{
					title : '施工地点',
					dataIndex : 'executionAddr',
					elCls : 'center',
					width :'10%'
				},{
					title : '所属专业',
					dataIndex : 'belongCraft',
					elCls : 'center',
					width : '10%',
					renderer : function(value){
						return commNetworkStop_major.typeName(value);
					}
				},{
					title : '施工类别',
					dataIndex : 'executionType',
					elCls : 'center',
					width : '10%',
					renderer : function(value){
						return commNetworkStop_constructionType.typeName(value);
					}
				},{
					title : '施工属性',
					dataIndex : 'executionAttr',
					elCls : 'center',
					width : '10%',
					renderer : function(value){
						return commNetworkStop_constructionAttr.typeName(value);
					}
				},{
					title : '工作内容',
					dataIndex : 'workContent',
					elCls : 'center',
					width : '10%',
					renderer : function(value){
						return commNetworkStop_workContent.typeName(value);
					}
				},{
					title : '涉及骨干网',
					dataIndex : 'mainNetName',
					elCls : 'center',
					width : '10%'
				},{
					title : '涉及铁路局',
					dataIndex : 'railwaysBureau',
					elCls : 'center',
					width : '10%'
				},{
					title : '方案审批编号',
					dataIndex : 'planExaminNum',
					elCls : 'center',
					width : '10%'
				},{
					title : '月度计划审批编号',
					dataIndex : 'monthPlanExamin',
					elCls : 'center',
					width : '10%'
				},{
					title : '昆铁施工台计划号',
					dataIndex : 'executionPlanNum',
					elCls : 'center',
					width : '10%'
				}];
			return columns;
		},
		/**
		 * 数据源
		 */
		_initStore : function() {
			var _self = this,contextPath = _self.get('contextPath');
			var store = new Data.Store({
				url : contextPath + 'commNetStopAction/getCommNetworkStopByDto.cn',
				pageSize : 10,
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				autoLoad :true
			});
			_self.set('store', store);
			return store;
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
		 * 表格
		 */
		_initSearchGrid : function() {
			var _self = this;
			var searchGrid = {
				tbarItems :  [{
					id : 'add',
					btnCls : 'button button-small addBtn',
					text : '<i class="icon-plus"></i>新增',
		        },{
                	xclass : 'bar-item-separator' // 竖线分隔符
                },{
					id : 'update',
					btnCls : 'button button-small updateBtn',
					text : '<i class="icon-edit"></i>修改',
		        },{
                	xclass : 'bar-item-separator' // 竖线分隔符
                },{
					id : 'del',
					btnCls : 'button button-small delBtn',
					text : '<i class="icon-remove"></i>批量删除',
		        },{
                	xclass : 'bar-item-separator' // 竖线分隔符
                },{
					id : 'reply',
					btnCls : 'button button-small replyBtn',
					text : '<i class="icon-envelope"></i>回复',
		        },{
                	xclass : 'bar-item-separator' // 竖线分隔符
                },{
					id : 'show',
					btnCls : 'button button-small showBtn',
					text : '<i class="icon-list-alt"></i>详情',
		        },{
                	xclass : 'bar-item-separator' // 竖线分隔符
                },{
					id : 'import',
					btnCls : 'button button-small importBtn',
					text : '<i class="icon-upload"></i>导入数据',
		        },{
                	xclass : 'bar-item-separator' // 竖线分隔符
                },{
					id : 'download',
					btnCls : 'button button-small downloadBtn',
					text : '<i class="icon-download"></i>导出EXCEL',
		        }],
		        itemStatusFields : {
					daiShenHe : 'wait_examine', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
					daiHuiFu : 'wait_reply',
					wanCheng : 'finish',
					weiWanCheng : 'unfinish',
					yiQuXiao : 'cancel'
				},
		        plugins : [
		        	Grid.Plugins.CheckSelection,//多选框插件
					Grid.Plugins.RowNumber//列序号插件
				],
				permissionStore :  _self._initPermissionStore()
			};
			return searchGrid;
		}
	},{
		ATTRS:{
			/**
			 * 当前页ID
			 */
			perId : {},
			/**
			 * 项目名
			 */
			contextPath : {},

		}
	});
	
	return StopPlan;
});