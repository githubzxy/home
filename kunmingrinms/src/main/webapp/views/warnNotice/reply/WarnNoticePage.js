define("views/warnNotice/reply/WarnNoticePage",
		[
			'bui/data',
			'bui/common',
			'bui/grid',
			'bui/calendar',
			'bui/select',
			'common/grid/SearchGridContainer',
			'common/org/OrganizationPicker',
			'common/data/PostLoad',
			'views/warnNotice/reply/ReplyWarnNotice',
			"views/warnNotice/entering/WarnNoticeDetail",
		],
		function(require){
			var Data = require('bui/data'),
				BUI = require('bui/common'),
				Component = BUI.Component,
				Calendar=require('bui/calendar'),
				Select=require('bui/select'),
			    Grid=require('bui/grid'),
			    OrganizationPicker = require('common/org/OrganizationPicker'),
			    SearchGridContainer=require('common/grid/SearchGridContainer'),
			    PostLoad=require('common/data/PostLoad'),
			    ReplyWarnNotice=require('views/warnNotice/reply/ReplyWarnNotice');
			    NoticeDetail = require('views/warnNotice/entering/WarnNoticeDetail');
			var WarnNoticePage = Component.Controller.extend({
				initializer:function(){
					var _self = this;
					_self.addChild(_self._initSearchGridForm());
				},
				renderUI:function(){
					var _self = this;
					$('.bui-grid-body').css('overflow-x','auto');
					var store = _self.get('dataStore');
					//初始化上查询的查询类型和状态
					warnNotice_warnType.listData("#warnType");
					warnNotice_status.listDataReply("#status");
		    		_self._initDepartAndTime();
	      			store.load();
				},
				/**
				 * 绑定事件
				 */
				bindUI:function(){
					var _self=this;
		    		var table=_self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
		    		var form=_self.getChild(SearchGridContainer.SEARCH_FORM_ID,true);
					var tbar = table.get('tbar');
					var contextPath=_self.get('contextPath');
					var store = _self.get('dataStore');
					
					//回复告警通知单
					tbar.getChild('replyWarnNotice').on('click',function(){
						var selections = table.getSelection();
						if(selections.length == 1&&selections[0].status==warnNotice_status.send){
							var warnId = selections[0].id;
							var replyWarnNotice=new ReplyWarnNotice({
								contextPath:contextPath,
								id : warnId,
							});
							replyWarnNotice.show();
							replyWarnNotice.on('saveBtn',function(e){
								tbar.msg(e.result);
								replyWarnNotice.close();
								store.load();
							});
						}else{
							tbar.msg({msg:'请选择一条已下发状态的数据进行回复！',status:'0'});
						}
					});
						
					//告警通知单详情
					tbar.getChild('detail').on('click',function(){
						var selections = table.getSelection();
						if(selections.length == 1){
							var warnId = selections[0].id;
							var noticeDetailDialog = new NoticeDetail({
								contextPath: contextPath,
								warnId: warnId
							});
							noticeDetailDialog.show();
						}else{
							tbar.msg({msg:'请选择一条数据进行查看！',status:'0'});
						}
					});
					
					//导出Excel
					tbar.getChild('export').on('click',function(){
						$("#exportXlsJson").val("");//清空值
						$("#exportXlsJson").val(JSON.stringify(form.serializeToObject()));
						$("#exportForm").submit();
					});
				
		    	},
				
				/**
				 * 初始化上查询的时间
				 */
				_initDepartAndTime:function(){
					var _self=this;
		  			var datepickerStart = new Calendar.DatePicker({
		  				trigger : '#reportTimeStart',
		  				showTime : true,
		  				autoRender : true
		  			});
		  			var datepickerEnd = new Calendar.DatePicker({
		  				trigger : '#reportTimeEnd',
		  				showTime : true,
		  				autoRender : true
		  			});
		  			
		  			datepickerStart.on('show',function(){
		  				var c = datepickerStart.get('calendar');
		  				c.set('hour',0);
		  				c.set('minute',0);
		  				c.set('second',0);
		  			});
		  			datepickerEnd.on('show',function(){
		  				var c = datepickerEnd.get('calendar');
		  				c.set('hour',23);
		  				c.set('minute',59);
		  				c.set('second',59);
		  			});
				},
				/**
				 * 初始化操作数据的功能按钮
				 */
				_initSearchGrid:function(){
					var _self=this;
	    			var searchGrid = {
						tbarItems:[{ id:'replyWarnNotice',
							btnCls : 'button button-small replyWarnNotice',
							text : '<i class="icon-edit"></i>回复',
							},{
							  xclass : 'bar-item-separator'
							},{
								id : 'detail',
								btnCls : 'button button-small detail',
								text : '<i class="icon-list-alt"></i>详情',
			                },{
							  xclass : 'bar-item-separator'
							},{
								id:'export',
				                btnCls : 'button button-small export',
				                text : '<i class="icon-download"></i>汇总导出'
					                +'<form action="/kunmingrinms/warnNoticeAction/exportWarnNoticeDept.cn" id="exportForm" method="post">'
					                +'<input type="hidden" id="exportXlsJson" name="exportXlsJson">'+
									   '</form>'
							}],
						useEmptyCell : false,
				        plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber],
				        permissionStore:_self._initPermissionStore()
					};
					return searchGrid;
				},
				_initPermissionStore : function(){
					var _self = this,perId=_self.get("perId");
					var permissionStore = new Data.Store({
						url : contextPath + 'permission/getBtnPers.cn',
						params : {perId : perId},
						proxy : {
					      method : 'post',
					      dataType : 'json'
					    }
					});
					_self.set('permissionStore',permissionStore);
					return permissionStore;
				},
				/**
				 * 初始化显示的数据
				 */
				_initDataStore:function(){
					var _self = this;
					var store = new Data.Store({
						url : contextPath + "warnNoticeAction/getWarnNotice.cn ",
						pageSize : 10,
						proxy:{
							method:'post',
							dataType:'json'
						}
					});
					_self.set('dataStore',store)
					return store;
				},
				/**
				 * 初始化数据显示表格的列名
				 */
				_initColumns:function(){
					return [{
						title:'告警编号',
						dataIndex:'number',
						elCls : 'center',
						width:150
					},{
						title:'状态',
						elCls : 'center',
						dataIndex:'status',
						width:80,
						renderer: function(value){
							return warnNotice_status.typeNameReply(value);
						}
					},{
						title:'网络类别',
						dataIndex:'networkType',
						elCls : 'center',
						width:100,
						renderer: function(value){
							return warnNotice_networkType.typeName(value);
						}
					},{
						title:'填报时间',
						dataIndex:'reportTime',
						elCls : 'center',
						width:80,
						renderer: Grid.Format.datetimeRenderer
					},{
						title:'发生时间',
						dataIndex:'happenTime',
						elCls : 'center',
						width:80,
						renderer: Grid.Format.datetimeRenderer
					},{
						title:'恢复时间',
						dataIndex:'recoverTime',
						elCls : 'center',
						width:80,
						renderer: Grid.Format.datetimeRenderer
					},{
						title:'告警类型',
						elCls : 'center',
						dataIndex:'warnType',
						width:100,
						renderer: function(value){
							return warnNotice_warnType.typeName(value);
						}
					},{
						title:'是否影响业务',
						elCls : 'center',
						dataIndex:'isAffectBusiness',
						width:100,
						renderer: function(value){
							return value?"是":"否";
						}
					},{
						title:'系统名称',
						elCls : 'center',
						dataIndex:'systemName',
						width:150,
					},{
						title:'告警区段',
						elCls : 'center',
						dataIndex:'warnZone',
						width:100,
					},{
						title:'填报单位',
						elCls : 'center',
						dataIndex:'reportOrgName',
						width:150,
					},{
						title:'填报人',
						elCls : 'center',
						dataIndex:'reportUserName',
						width:150,
					},{
						title:'接收单位',
						elCls : 'center',
						dataIndex:'acceptOrgName',
						width:150,
					},{
						title:'告警现象描述',
						elCls : 'center',
						dataIndex:'warnDescription',
						width:200,
					},{
						title:'处理过程',
						elCls : 'center',
						dataIndex:'dealProcess',
						width:200,
					},{
						title:'处理结果',
						elCls : 'center',
						dataIndex:'dealResult',
						width:200,
					},{
						title:'是否处理完毕',
						elCls : 'center',
						dataIndex:'isFinished',
						width:100,
						renderer: function(value){
							return value==null?"":(value?"是":"否");
						}
					},{
						title:'回单人',
						elCls : 'center',
						dataIndex:'replyUserName',
						width:150,
					},{
						title:'备注',
						elCls : 'center',
						dataIndex:'remark',
						width:100,
						renderer: function(value){
							return value=="1"?"高速铁路":(value=="2"?"普速铁路":"");
						}
					}
					];
				},
				/**
				 * 初始化上查询框
				 */
				_initSearchForm:function(){
					var _self=this;
					var searchForm = {
						elAttrs :{id : 'searchForm'},
						items:[{
							label:'告警编号',
							item:'<input type="text" name="number" id="number" />'
						},{
			  				label:'填报时间',
			  				item:'<input type="text" name="reportTimeStart" id="reportTimeStart"  style="width: 140px;" class="calendar"  readOnly="readonly" />'
			  				    
		  				},{
		  					label:'至',
		  					item:'<input type="text" name="reportTimeEnd" id="reportTimeEnd"  style="width: 140px;" class="calendar" readOnly="readonly" />'
		  				},{
		  					label:'告警类型',
		  					item:'<select name="warnType" id="warnType" >'+
		  							'<option value="">请选择</option>'+
		  						 '</select>'
		  				},{
		  					label:'是否影响业务',
		  					item:'<select name="isAffectBusiness" id="isAffectBusiness" >'+
	    							'<option value="">请选择</option>'+
	    							'<option value=true>是</option>'+
	    							'<option value=false>否</option>'+
	    						 '</select>'
		  				},{
		  					label:'状态',
		  					item:'<select name="status" id="status" >'+
	    							'<option value="">请选择</option>'+
	    						 '</select>'
		  				},{
		  					label:'是否处理完毕',
		  					item:'<select name="isFinished" id="isFinished">'+
	    							'<option value="">请选择</option>'+
	    							'<option value=true>是</option>'+
	    							'<option value=false>否</option>'+
	    						 '</select>'
		  				},{
		  					label:'备注',
		  					item:'<select name="remark" id="remark">'+
	    							'<option value="">请选择</option>'+
	    							'<option value="1">高速铁路</option>'+
	    							'<option value="2">普速铁路</option>'+
	    						 '</select>'
		  				}]
						
					}
					return searchForm;
				},
				/**
				 * 初始化主页面
				 */
				_initSearchGridForm:function(){
					var _self = this;
					var searchGridContainer = new SearchGridContainer({
						searchForm:_self._initSearchForm(),
						columns:_self._initColumns(),
						store:_self._initDataStore(),
		    			searchGrid:_self._initSearchGrid(),
					});
					return searchGridContainer;
				}
			},{
				ATTRS:{
					contextPath:{},
					perId:{},
					orgName:{},
					orgId:{},
				}
			});
			return WarnNoticePage;
		})