/**
 * 值班信息-首页模块
 */
define('views/hhkj/home/OndutyMessagePage',[
									'bui/common','bui/form','bui/grid','bui/calendar','bui/data',
									'common/data/PostLoad','bui/layout','bui/mask',
									'views/hhkj/home/OndutyReturn'
									],function(r){
	var BUI = r('bui/common'), Grid = r('bui/grid'), Layout = r('bui/layout'),
    	Data = r('bui/data'), Mask = r('bui/mask'), Calendar = r('bui/calendar'),
    	PostLoad = r('common/data/PostLoad'),
    	DutyReturn = r('views/hhkj/home/OndutyReturn');
	var OndutyMessagePage = BUI.Component.Controller.extend({
		initializer : function(){
			var _self = this;
			var container = new Layout.Viewport({
				plugins : [Layout.Border]
			});
			var ondutyinfo = _self._initOndutyColumns();
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
			var _self = this,contextPath = _self.get('contextPath'),ondutyStore = _self.get('ondutyStore');
			var ondutyGrid = _self.getChild('ondutyGrid', true);
			//定义按时间查询当天值班人列表事件
			$("#btnQuery").on('click',function(){
				var dutyDate =$("#dutyDate").val();
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
						commonFailure('当前用户当天值班信息汇报已填写!');
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
						});
						var ondutyStore = _self.get('ondutyStore');
						ondutyStore.load({'dutyDate' : ''});
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
			var ondutyStore = _self._initStore('');			
			//右铡值班信息
			var ondutyinfo = new BUI.Component.Controller({
				render : '#ondutyinfo', 
				layout : {
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
				    			 height:26
				    				 
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
				    		  height: '100%'
				    	   }
				    	],
				    	plugins : [flowLayout]
				    });
			return ondutyinfo;
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
		_initStore : function (dutyDate) {
			var _self = this,contextPath = _self.get('contextPath');
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
			tomcatSeverTime : {}
		}
	});
	return OndutyMessagePage;
});
