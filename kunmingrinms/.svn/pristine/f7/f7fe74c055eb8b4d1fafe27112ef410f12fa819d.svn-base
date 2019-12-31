/**
 * 专家组管理主页模块
 */
define('views/home/Home',[
	'bui/common','bui/tree','bui/form','bui/grid','bui/calendar','bui/data','bui/list',
	'common/data/PostLoad','bui/layout','bui/mask',
	'views/home/MessageDetail',	
	'views/home/DutyReturn',	
	],function(r){
	var BUI = r('bui/common'),
	    Grid = r('bui/grid'),
	    Layout = r('bui/layout'),
    	Data = r('bui/data'),
    	Mask = r('bui/mask'),
    	Calendar = r('bui/calendar'),
    	List = r('bui/list'),
    	PostLoad = r('common/data/PostLoad'),
    	MessageDetail = r('views/home/MessageDetail'),
    	DutyReturn = r('views/home/DutyReturn');
	var Home = BUI.Component.Controller.extend({
		initializer : function(){
			var _self = this;
			var container = new Layout.Viewport({
				elCls : 'ext-border-layout',
				plugins : [Layout.Border]
			});
			var messageList = _self._initMessageList();
			var ondutyinfo = _self._initOndutyColumns();
			container.addChild(messageList);
			container.addChild(ondutyinfo);
			_self.addChild(container);
		},
		renderUI : function(){
			var _self = this;
			//渲染时间控件
			var datepicker = new Calendar.DatePicker({
				trigger:'.calendar',
				autoRender : true
			});
			$('#btnSearch').after(errorMsgHtml + sucMsgHtml);
		},
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var messageList = _self.get('messageList');
			var ondutyGrid = _self.getChild('ondutyGrid', true);
			//定义信心列表点击事件
			messageList.on("itemclick", function(ev) {				
				var messageId = ev.item.id;
				var messageDialog = new MessageDetail({
					id : messageId,
					contextPath : contextPath
				});
				messageDialog.show();
			});
			//定义信息发布更多点击事件
			$("#more").on('click',function(){
//				var threePerName="信息发布";
//				var threeModulePath="../views/message/messagePage.jsp";
//				var threePerId="4028811c41a001630141a13812120539";
//				window.open('messagePage.jsp?threePerName='+threePerName+'&threeModulePath='+threeModulePath+'&threePerId='+threePerId);
				
				var threePerName="信息发布";
//				var threeModulePath="../views/message/messagePage.jsp";
				var threeModulePath="../views/messageNew/messagePage.jsp";
				var threePerId="4028811c41a001630141a13812120539";
				
				var mainContainer = window.parent;	
				mainContainer.menuClick(threePerName,threeModulePath,threePerId);	
			})
			//定义按时间查询当天值班人列表事件
			$("#btnQuery").on('click',function(){
				var dutyDate =$("#dutyDate").val(),ondutyStore = _self.get('ondutyStore');
				ondutyStore.load({'dutyDate' : dutyDate});
			})
			//定义个人情况汇报填写事件
			$("#btnSearch").on('click',function(){
				_self._writeDuty();
			})
			
			ondutyStore.on('load',function(){
				var data = ondutyStore.getResult();
				_self.addColour(data);
				ondutyGrid.showData(data);
			})
		},
		/**
		 * 个人情况汇报填写事件
		 */
		_writeDuty : function () {
			var _self = this,user = _self.get('userId'),contextPath = _self.get('contextPath');
			var ondutyStore = _self.get('ondutyStore');
			var severtime = _self.get('tomcatSeverTime');
			var postLoad = new PostLoad({
				url : contextPath + 'homeAction/getTodayOndutyByUser.cn',
				el : '#searchGridContainer',
				loadMsg : '查询中...'
			}); 
			postLoad.load({"userId" : userId}, function(response){
				if (response.length == 0) {
					commonFailure('当前用户当天没有值班信息，不必填写情况汇报！');
					return;
				}
			    if(response.length ==1){
				 //已汇报不能再汇报
					if(response[0].status == "2"){
						commonFailure('当前用户当天值班信息汇报已填写！');
						return;
					}
					var org = response[0].user.organization;
					if(org.name.length == 0){
						commonFailure('当前用户组织机构为空，请设置组织机构后再进行情况汇报！');
						return;
					}
					if(org.type != 4){
						commonFailure('只有车间用户可以填写值班情况汇报！');
						return;
					}
					var dutyDate = new Date(response[0].dutyDate);				
					var reportStartDate = new Date(dutyDate.getFullYear(),dutyDate.getMonth(),dutyDate.getDate(),17);
					var reportEndDate = new Date(dutyDate.getFullYear(),dutyDate.getMonth(),dutyDate.getDate(),20);
					if(severtime < reportStartDate ||  severtime > reportEndDate){
						commonFailure('应在17:00-20:00填写!');
					}else{
                         var params={
								"dutyDepart":response[0].user.organization.name,
								"dutyUser":response[0].user.name,
								"dutyDate":returnFormatDate(response[0].dutyDate,"yyyy-MM-dd"),
								"dutyDay":returnDay(response[0].week),
								"dutyId":response[0].id
						};
						var dutyDialog = new DutyReturn({
							params : params,
							contextPath : contextPath
						});
						dutyDialog.show();
						dutyDialog.on('dutyReturnSave',function(e){
							if(e.result.status == 1){
								commonSuccess(e.result.msg);
							} else {
								commonFailure(e.result.msg);
							}
		           			dutyDialog.close();
		           			ondutyStore.load();
						});						
					}
			   }else{
				   commonFailure('当前值班人当天有多条值班信息，请删除至只剩一条后进行情况汇报填写!');
				   return;
			   }				
			});
		},
		/**
		 * 右边查询列表
		 */
		_initOndutyColumns : function () {
			var _self = this;
			//右侧值班信息3列流布局
			var flowLayout = new Layout.Flow({
			      columns : 3
			});
			//右侧值班信息列表表头定义 
			var ondutyColumns = _self._initColumns();
			var ondutyStore = _self._initStore();			
			//右铡值班信息
			var ondutyinfo = new BUI.Component.Controller({
				render : '#ondutyinfo', 
				layout : {
			    	title : '值班信息',
					region : 'center',
					fit : 'both'
				},
				width : '100%',
				height:20,
				children :[
				    	   {
				    		   layout : {
				                   width : '35%',
				                   height:30
				                	   
				               },
				               xclass : 'controller',
				               content : '&nbsp<button type="button" id="btnSearch" class="button button" >个人情况汇报填写</button>'
				    	   },
				    	   {
				    		   layout : {
				                   width :'15%',
				                   height:30
				               },
				               xclass : 'controller',
				               content : '<input value="值班日期：" readonly="readonly"  style="width:80%;text-align:right;border: 0px solid;"></input>'
				    	   },
				    	   {
				    		   layout : {
				                   width :'30%',
				                   height:30
				               },
				               xclass : 'controller',
				              content : '<input id="dutyDate" type="text" class="calendar" style="width: 190px;" readOnly="readonly"/>'
				    	   },
				    	   {
				    		   layout : {
				                   width :'20%',
				                   height:30
				               },
				               xclass : 'controller',
				              content : '<button id="btnQuery" class="button button" >查询</button>'
				    	   },
				    	   {
				    		 layout : {
				    			 width : '100%',
				    			 height:20
				    				 
				    		 },
				    		 xclass : 'controller',
				    		 content : '<div style="float:left;">&nbsp当天值班人列表</div><div style="float:left;width:30px;height:6px;"/><div style="float:left;padding-top:5.5px;"><div style="float:left;width:6px;height:6px;background-color:#1E90FF;border:1px solid #1E90FF;"/></div><div style="float:left;">&nbsp未设置值班人</div><div style="float:left;width:10px;height:6px;"/><div style="float:left;padding-top:5.5px;"><div style="float:left;width:6px;height:6px;background-color:red;border:1px solid red;"/></div><div style="float:left;">&nbsp未值班</div>' //TODO 添加HTML代码加上样式和刷新按钮
				    	   },		    	   
				    	   {
				    		  layout : {
				    			  width : '100%',
				    				  height : '100%'
				    		  },
				    		  xclass : 'grid',
				    		  id : 'ondutyGrid',
				    		  columns : ondutyColumns,
//				    		  store : ondutyStore,
				    		  itemStatusFields : {
				    			checked : 'checked',
				    			nosituation : 'nosituation'
				    		  },
				    		  loadMask : true,
				    		  width : '100%',
				    		  height: $(window).height()-90
				    	   }
				    	],
				    	plugins : [flowLayout]
				    });
			return ondutyinfo;
		},
		/**
		 * 左边信息列
		 */
		_initMessageList : function () {
			var _self = this;
			//左侧信息发布数据源
			var messageStore = new Data.Store({
				url : contextPath + 'homeAction/getHomeMessage.cn',
				autoLoad : true,
				proxy : {
					method : 'post'
				}
			});
			var messageList = new List.SimpleList({
				id : 'messageList',
			    layout : {
					title : '信息发布',
					region : 'west',
					fit : 'both',
					collapsable : true,
					width : 450
				},
				idField : 'id',
				itemTplRender : function(item){	
					return '<li id="{id}"><b>['+message_type.typeName(item.type)+']</b>    ' + item.theme + '    ' + item.createTime + '</li>';
				},
				store : messageStore,
				children:[{
					xclass : 'controller',
					content:'<div id="more" style="margin:10px;padding-right:50px;float:right;"><a  href="javascript:;">......更多>>></a></div>'
				}]

			});
			_self.set('messageList',messageList);
			return messageList;
		},	
		
		/**
		 * 表格列
		 */
		_initColumns : function () {
			var columns = [
				{
					title : '所属部门',
					dataIndex : 'orgName',
					elCls : 'center',
					sortable : false,	// 表头不排序
					width : '14%'
				},{
					title : '值班人',
					dataIndex : 'user',
					elCls : 'center',
					sortable : false,	// 表头不排序
					width : '14%',
				},{
					title : '值班日期',
					dataIndex : 'dutyDate',
					elCls : 'center',
					sortable : false,	// 表头不排序
					width : '14%',
				},{
					title : '星期',
					dataIndex : 'week',
					elCls : 'center',
					sortable : false,	// 表头不排序
					width : '14%',
					renderer:function(value) {
						return returnDay(value);
						}
				},{
					title : '固定电话',
					dataIndex : 'fixedNum',
					elCls : 'center',
					sortable : false,	// 表头不排序
					width : '14%'
				},{
					title : '手机',
					dataIndex : 'cellPhoneNum',
					elCls : 'center',
					sortable : false,	// 表头不排序
					width : '14%'
				},{
					title : '值班情况汇报',
					dataIndex : 'situation',
					elCls : 'center',
					sortable : false,	// 表头不排序
					width : '16%'
				}
			];
			return columns;
		},
		/**
		 * 数据源
		 */
		_initStore : function () {
			var _self = this;
			ondutyStore = new Data.Store({
				url : contextPath + 'homeAction/getOnduty.cn',
				proxy : {
					method : 'post'
				},
				params : {'dutyDate' : ''},
		        autoLoad:true
			 });
			_self.set('ondutyStore',ondutyStore);
			return ondutyStore;
		},
		/**
		 * 未设置值班人和未值班的颜色设置
		 * @param data 值班信息数据
		 */
		addColour : function(data){
			for(var i = 0;i < data.length;i++){
				var m = data[i];
				//如果没指定值班人，用颜色标识
				if(m.user == null){
					m['checked'] = true;
				}//如果当天晚上8点后未填写值班日志，则用颜色标识
				else if(m.situation == null || m.situation == ''){
					  var severtime = tomcatSeverTime;
					  var dutyDate = new Date(m.dutyDate);				
					  var reportEndDate = new Date(dutyDate.getFullYear(),dutyDate.getMonth(),dutyDate.getDate(),20);
					  if(severtime < reportEndDate){
						  m['nosituation'] = false;
					  }else{
						  m['nosituation'] = true;
					  }
				}else{
					m['nosituation'] = false;
					m['checked'] = false;
				}
			}
		},
		
	},{
		ATTRS : {
			elAttrs : {value: {id:"searchGridContainer"}},
			contextPath : {},
			userId : {},
			perId : {},
			tomcatSeverTime : {}
		}
	});
	return Home;
});
