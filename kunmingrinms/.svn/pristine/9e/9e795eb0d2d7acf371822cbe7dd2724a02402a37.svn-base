/**
 * 信息发布主页
 */
define('views/message/MessagePage',[
	'bui/common','bui/data','bui/grid','bui/calendar',
	'common/grid/SearchGridContainer',
	'views/message/MessageAdd',
	'views/message/MessageUpdate',
	'views/message/MessageShow'
	],function(r){
	var BUI = r('bui/common');
		Grid = r('bui/grid');
		Data = r('bui/data');
		Calendar = r('bui/calendar');
		SearchGridContainer = r('common/grid/SearchGridContainer'),
		MessageAdd = r('views/message/MessageAdd'),
		MessageUpdate = r('views/message/MessageUpdate'),
		MessageShow = r('views/message/MessageShow');
	var SEARCH_FORM_ID = 'searchForm';
	var MessagePage = BUI.Component.Controller.extend({
		/**
		 * 初始化
		 */
		initializer: function(){
			var _self = this;
			console.log(_self.get('contextPath'));
			_self.addChild(_self._initSearchGridContainer());
		},
		/**
		 * 绑定事件
		 */
		bindUI: function(){
			var _self = this,store = _self.get('store'),contextPath = _self.get('contextPath'),
			orgId = _self.get('orgId'),orgName = _self.get('orgName'),orgType = _self.get('orgType');
			var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
			var tbar = table.get('tbar');
			//按钮权限控制
			if(orgType==1502){
				$('.topBtn').hide();
				$('.cancelBtn').hide();
			}
			if(orgType==1503){
				$('.topBtn').hide();
				$('.cancelBtn').hide();
				$('.addBtn').hide();
				$('.updateBtn').hide();
				$('.delBtn').hide();
			}
			
			//新增
			$('.addBtn').on('click',function(e){
				var messageAddDialog = new MessageAdd({contextPath: contextPath,orgName:orgName,orgId:orgId,orgType:orgType});
				messageAddDialog.show();
				messageAddDialog.on('completeAddSave',function(e){
					tbar.msg(e.result);
					messageAddDialog.close();
					store.load();
				});
				messageAddDialog.on('closing',function(e){
					store.load();
				});
			});
			
			//修改
			$('.updateBtn').on('click',function(e){
				var selections = table.getSelection();
				if(selections.length == 1){
					var messageId = selections[0].id;
					var messageUpdateDialog = new MessageUpdate({
						contextPath: contextPath,
						messageId: messageId
					});
					messageUpdateDialog.show();
					messageUpdateDialog.on('completeUpdateSave',function(e){
						tbar.msg(e.result);
						messageUpdateDialog.close();
						store.load();
					});
					messageUpdateDialog.on('closing',function(e){
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
					var messageIds = selections.map(function(e){
						return e.id;
					}).join();
					//弹出确认框
					BUI.Message.Confirm('您确定要删除数据吗?',function(){
		    			var postLoad =new PostLoad({
							url:contextPath + 'issueMessageAction/delIssueMessage.cn',
							el : '#messagePageId',
							loadMsg:'删除中'
						});
						postLoad.load({jsonIds: messageIds},function(result){
							tbar.msg(result);
							store.load();
						});
					});
				}else{
					tbar.msg({msg:'请选择要删除的数据！',status:'0'});
				}
			});
			//置顶
			$('.topBtn').on('click',function(e){
				var selections = table.getSelection();
				if(selections.length != 0){
					//将选中记录的id用,拼接
					var messageIds = selections.map(function(e){
						return e.id;
					}).join();
					//弹出确认框
					BUI.Message.Confirm('您确定要置顶数据吗?',function(){
		    			var postLoad =new PostLoad({
							url:contextPath + 'issueMessageAction/topIssueMessage.cn',
							el : '#messagePageId',
							loadMsg:'置顶中'
						});
						postLoad.load({jsonIds: messageIds},function(result){
							tbar.msg(result);
							store.load();
						});
					});
				}else{
					tbar.msg({msg:'请选择要置顶的数据！',status:'0'});
				}
			});
			//取消置顶
			$('.cancelBtn').on('click',function(e){
				var selections = table.getSelection();
				if(selections.length != 0){
					//将选中记录的id用,拼接
					var messageIds = selections.map(function(e){
						return e.id;
					}).join();
					//弹出确认框
					BUI.Message.Confirm('您确定要取消置顶数据吗?',function(){
		    			var postLoad =new PostLoad({
							url:contextPath + 'issueMessageAction/cancelIssueMessage.cn',
							el : '#messagePageId',
							loadMsg:'取消中'
						});
						postLoad.load({jsonIds: messageIds},function(result){
							tbar.msg(result);
							store.load();
						});
					});
				}else{
					tbar.msg({msg:'请选择要取消置顶的数据！',status:'0'});
				}
			});
			//详情
			$('.showBtn').on('click',function(e){
				var selections = table.getSelection();
				if(selections.length == 1){
					var messageId = selections[0].id;
					var messageShowDialog = new MessageShow(
							{contextPath: contextPath,messageId: messageId});
					messageShowDialog.show();
					messageShowDialog.on('closing',function(e){
						store.load();
					});
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
					var form = _self.getChild(SEARCH_FORM_ID,true);
					$("#exportXlsJson").val("");//清空值
					$("#exportXlsJson").val(JSON.stringify(form.serializeToObject()));
					$("#exportForm").submit();
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
			   _self._initOrgNameDatas();
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
         * 初始化部门下拉选查询框
         */
        _initOrgNameDatas:function(){
        	var _self=this;
        	$.ajax({
        		url:contextPath + 'issueMessageAction/getIssueOrgName.cn',
        		type:'post',
        		dataType:"json",
        		success:function(res){
        			$("#issueOrgName").append("<option  value=''>请选择</option>");
        			for(var i=0;i<res.length;i++){
        				$("#issueOrgName").append("<option  value="+res[i].text+">"+res[i].text+"</option>");
        			}
        		}
        	})
        },
		/**
		 * 初始化上部查询
		 */
		_initSearchForm: function(){
			return {
				items: [
					{
						label : '主题',
						item : '<input type="text" name="theme" id="theme" class="input-normal" style="width: 171px;"/>'
					},{
						label : '部门',
						item : '<select  name="issueOrgName" id="issueOrgName" class="input-normal" style="width: 171px;"></select>'
					},{
						label : '发布时间',
						item : '<input type="text" name="startTime" id="startTime" class="calendar" style="width: 171px;"/>'
					},{
						label : '至',
						item : '<input type="text" name="endTime" id="endTime" class="calendar" style="width: 171px;"/>'
					}
			]};
		},
		/**
		 * 表格列名
		 */
		_initColumns: function(){
			var _self = this;
			var columns = [
				{
					title:'信息主题',
					dataIndex:'theme',
					width:'20%',
					elCls : 'center',
				},
				{
					title:'是否置顶',
					dataIndex:'topStatus',
					width:'8%',
					elCls : 'center',
				},
				{
					title:'发布部门',
					dataIndex:'issueOrgName',
					width:'15%',
					elCls : 'center',
				},{
					title:'发布时间',
					dataIndex:'issueTime',
					width:'18%',
					elCls : 'center',
				},{
					title:'信息类别',
					dataIndex:'type',
					width:'15%',
					elCls : 'center',
					renderer: function(value) {
						return message_type.typeName(value);
					}
				},{
					title:'信息内容',
					dataIndex:'content',
					elCls : 'center',
					width:'50%',
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
				url: contextPath + 'issueMessageAction/getIssueMessageList.cn',
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
					},{
						xclass: 'bar-item-separator', //竖线分隔符
					},{
						id: 'top',
						btnCls: 'button button-small topBtn',
						text: '<i class="icon-chevron-up"></i>置顶',
					},{
						xclass: 'bar-item-separator', //竖线分隔符
					},{
						id: 'cancel',
						btnCls: 'button button-small cancelBtn',
						text: '<i class="icon-remove-sign"></i>取消置顶',
					}
				],
				plugins: [
					Grid.Plugins.CheckSelection,
					Grid.Plugins.RowNumber
				],
//				permissionStore:_self._initPermissionStore()
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
		}
	},{
		ATTRS:{
			elAttrs : {value : {id : 'messagePageId'}},
			/**
			 * 当前页ID
			 */
			perId: {},
			orgId: {},//组织机构id
			orgType: {},//组织类型
			orgName: {},//组织名称
			/**
			 * 项目名
			 */
			contextPath: {},
		}
	});
	return MessagePage;
});