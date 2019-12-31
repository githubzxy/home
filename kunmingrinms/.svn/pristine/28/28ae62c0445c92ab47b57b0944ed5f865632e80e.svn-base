/**
 * 停机审核主页模块
 */
define('views/commNetStop/stopExamine/StopExaminePage',[
	                                               'bui/common','bui/data','bui/grid',
	                                               'common/grid/SearchGridContainer',
	                	                           'common/org/OrganizationPicker',
	                	                           'views/commNetStop/stopExamine/StopExamine',
	                	                           'views/commNetStop/stopExamine/StopUpdateAndExamine',
	                	                           'views/commNetStop/StopPlanShow'
	                                               ],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,
	Data = require('bui/data'),Grid = require('bui/grid'),
	OrganizationPicker = require('common/org/OrganizationPicker'),
	SearchGridContainer = require('common/grid/SearchGridContainer'),
	StopExamine = require('views/commNetStop/stopExamine/StopExamine'),
	StopUpdateAndExamine = require('views/commNetStop/stopExamine/StopUpdateAndExamine'),
	StopExamineShow = require('views/commNetStop/StopPlanShow');
	
	var StopExaminePage = Component.Controller.extend({
		/**
		 * 初始化主页
		 */
		initializer : function(){
			var _self = this;
			var searchGridContainer = new SearchGridContainer({
				/**
				 * 此下面四项为依赖查询列表的四个参数,详见'common/grid/SearchGridContainer'
				 */            
				searchForm : _self._initSearchForm(),
				columns : _self._initColumns(),
				store : _self._initStore(),
				searchGrid : _self._initSearchGrid()
			});
			_self.addChild(searchGridContainer);
		},
		/**
		 * 渲染主页控件
		 */
		renderUI : function(){
			//渲染申请单位-组织机构树控件
			var _self = this,contextPath = _self.get('contextPath');
			var orgPicker = new OrganizationPicker({
				trigger : '#orgSelectName',
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
		 * 绑定事件
		 */
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath'),
			store = _self.get('store'),
			grid = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true),
			tbar = grid.get('tbar');
			_self._initSearchFormAutoFilling();// 自动填充映射条件查询初始值
			
			// 点击条件查询中的申请单位,弹出组织机构树,选择值。
			var orgPicker = _self.get('orgPicker');
			orgPicker.on('orgSelected',function(e){
				$('#orgSelectName').val(e.org.text);
				$('#orgSelectId').val(e.org.id);
			});
			
			//点击审核按钮，弹出审核停机计划对话框
			$('.examineBtn').click(function(){
				var selections = grid.getSelection();
				if(selections.length == 1){
					var record = selections[0];
					if(record.state == commNetworkStop_old_status.wait_examine){
						var examineForm = new StopExamine({contextPath : contextPath,stopExamineId : record.id});
						examineForm.show();
						examineForm.on('examine',function(e){
							tbar.msg(e.result);
							examineForm.close();
							store.load();
						});
						examineForm.on('close',function(){
							examineForm.close();
						});
						
					}else{
						tbar._fail("只能审核状态为[待审核]的数据！");
					}
				}else{
					tbar._fail("请选择一条数据进行操作！");
				}
			});
			
			//点击修改审核按钮，弹出修改并审核对话框
			$('.updateAndExamineBtn').click(function(){
				var selections = grid.getSelection();
				if(selections.length == 1){
					var record = selections[0];
					if(record.state == commNetworkStop_old_status.wait_examine 
							|| record.state == commNetworkStop_old_status.wait_reply
							|| record.state == commNetworkStop_old_status.cancel){//待审核、待回复、已取消的数据能进行审核修改
						var updateAndExamineForm = new StopUpdateAndExamine({contextPath:contextPath,stopUpdateAndExamineId:record.id});
						updateAndExamineForm.show();
						updateAndExamineForm.on('updateAndExamine',function(e){
							updateAndExamineForm.close();
							store.load();
							tbar.msg(e.result);
						});
					}else{
						tbar._fail("只能审核并修改状态为[待审核]与[待回复]的数据！")
					}
				}else{
					tbar._fail("请选择一条数据进行操作!");
				}
			});
			
			//点击取消按钮，取消计划
			$('.cancelBtn').click(function(){
				var selections = grid.getSelection();
				if(selections.length == 1){
					var record = selections[0];
					if(record.state == commNetworkStop_old_status.wait_examine){
						var msg = '确定取消该计划吗？<br/>'
			    			+'<span style="font-size:10px; color:red">（取消的计划，车间不需要回复）</span>';
						BUI.Message.Confirm(msg,function(){
							$.post(contextPath+'commNetStopAction/cancelCommNetStop.cn',
									{id : record.id},function(result){
								tbar.msg(result);
						    	store.load();
							});
						},'question');
					}else{
						tbar._fail("只能取消状态为[待审核]的数据！")
					}
				}else{
					tbar._fail("请选择一条数据进行操作!");
				}
			});
			
			//点击详情按钮，弹出显示详情对话框
			$('.showBtn').click(function(){
				var selections = grid.getSelection();
				var record = selections[0];
				if(selections.length == 1){
					var showForm = new StopExamineShow({contextPath:contextPath,stopPlanId:record.id});
					showForm.show();
					showForm.on('close',function(e){
						showForm.close();
					});
				}else{
					tbar._fail("请选择一条数据进行操作!");
				}
			});	
			
			//点击导出EXCEL按钮，导出当前页面数据
			$('.downloadBtn').click(function(){
				var records = store.getResult();//获取当前缓存的纪录,返回一个集合
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
		 * 查询数据表单
		 */
		_initSearchForm : function(){
			return {
				items : [
					{
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
		  			}
				]
			};
		},
		/**
		 * 列表表格表头
		 */
		_initColumns : function(){
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
		_initStore : function(){
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
			_self.set('store',store);  //将数据源设置为查询列表属性
			return store;
		},
		/**
		 * 表格
		 */
		_initSearchGrid : function(){
			var _self = this;
			var searchGrid = {
					tbarItems : [{
							id : 'examine',
							btnCls : 'button button-small examineBtn',
							text : '<i class="icon-check"></i>审核'
				        },{
		                	xclass : 'bar-item-separator' // 竖线分隔符
		                },{
		                	id : 'updateAndExamine',
		                	btnCls : 'button button-small updateAndExamineBtn',
		                	text : '<i class="icon-edit"></i>修改并审核'
		                },{
		                	xclass : 'bar-item-separator' // 竖线分隔符
		                },{
		                	id : 'cancel',
		                	btnCls : 'button button-small cancelBtn',
		                	text : '<i class="icon-remove"></i>取消'
		                },{
		                	xclass : 'bar-item-separator' // 竖线分隔符
		                },{
		                	id : 'show',
		                	btnCls : 'button button-small showBtn',
		                	text : '<i class="icon-list-alt"></i>详情'
		                },{
		                	xclass : 'bar-item-separator' // 竖线分隔符
		                },{
		                	id : 'download',
		                	btnCls : 'button button-small downloadBtn',
		                	text : '<i class="icon-download"></i>导出EXCEL'
		            }],
		            plugins : [
		            	Grid.Plugins.RowNumber//列序号插件
		            ],
		            itemStatusFields : {
						daiShenHe : 'wait_examine', //不同状态，字体颜色不同，如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
						daiHuiFu : 'wait_reply',
						wanCheng : 'finish',
						weiWanCheng : 'unfinish',
						yiQuXiao : 'cancel'
					},
					permissionStore :  _self._initPermissionStore()
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
			//默认状态栏值为待审核
			$('#state').val(commNetworkStop_old_status.wait_examine);
		}
		
	},{
		//主页属性
		ATTRS : {
			/**
			 * 当前页ID
			 */
			perId : {},
			/**
			 * 项目名
			 */
			contextPath : {}
		}
	});
	return StopExaminePage;
});
