define('views/onduty/OnDutyPage',
		['bui/common','bui/data','bui/grid','bui/select','bui/calendar','common/data/PostLoad',
		 'common/grid/SearchGridContainer','views/onduty/OnDutyAdd','views/onduty/OnDutyUpdate',
		 'views/onduty/OnDutyDetail','views/onduty/OnDutyReportForm','views/onduty/OnDutyImportForm'],
		function(require){
	var BUI =require('bui/common'),Component = BUI.Component,Data = require('bui/data'),
	    Grid = require('bui/grid'),Select=require('bui/select'),Calendar=require('bui/calendar'),
	    SearchGridContainer=require('common/grid/SearchGridContainer'),
	    PostLoad = require('common/data/PostLoad'),
	    OnDutyUpdate=require('views/onduty/OnDutyUpdate'),
	    OnDutyDetail=require('views/onduty/OnDutyDetail'),
	    OnDutyReportForm=require('views/onduty/OnDutyReportForm'),
	    OnDutyImportForm=require('views/onduty/OnDutyImportForm'),
	    OnDutyAdd = require('views/onduty/OnDutyAdd');
	var OnDutyPage= Component.Controller.extend({
		//页面dom渲染区
		initializer:function(){
			var _self = this;
			_self.addChild(_self._getsearchGridContainer());
		},
//	************DOM渲染***************
		_getsearchGridContainer:function(){
			var _self = this;
			var searchGridContainer = new SearchGridContainer({
				searchForm : _self._initSearchForm(),
				columns : _self._initColumns(),
				store : _self._initStore(),
				searchGrid : _self._initSearchGrid(),
				isJSONParam:'true',
			});
			return searchGridContainer;
		},
		_initSearchForm:function(){
			return {items:[
				      {label:'值班人',item :'<input type="text" name="name" id="dutyName"  style="width:171px;"/>'},
				      {label:'星期',item:'<select name="week" id="weekCbo" style="width: 197px;"></select>'},
				      {label:'是否汇报',item:'<select name="status" id="status" style="width: 197px;"></select>'},
				      {label:'值班日期',item:'<input name="startDate" id="startDate" type="text" style="width: 171px;" class="calendar" readOnly="readonly"/>'},
				      {label:'至',item:'<input name="endDate" id="endDate" type="text" style="width: 171px;" class="calendar" readOnly="readonly"/><input type="hidden" name="orgId" id="orgId"/>'},
				      ]};
		},
		_initColumns:function(){
			return [{//TODO自己声明列表表头
				title : '值班日期',
				dataIndex : 'dutyDate',
				elCls : 'center',//居中显示
				sortable : false,	// 表头不排序
				width : '140px',
				renderer:Grid.Format.dateRenderer
			}, {
				title : '星期',
				dataIndex : 'week',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '65px',
				renderer: function(value) {
					return weekToChinese(value);
				}
			},{
				title : '值班部门',
				dataIndex : 'user',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '10%',
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
				width : '8%',
				renderer:function(value) {
					return value == null ? "" : value.name;
				}
			},{
				title : '固定电话',
				dataIndex : 'fixedNum',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '10%',	
				renderer:function(value,obj,index) {
					return value == null ? obj.user.telephoneNumber : value ;
				}
			},{
				title : '手机',
				dataIndex : 'cellPhoneNum',
				elCls : 'center',
				sortable : false,	
				width : '10%',	
				renderer:function(value,obj,index) {
					return value == null ? obj.user.phone : value;
				}
			},{
				title : '是否汇报',
				dataIndex : 'status',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '80px',
				renderer: function(value) {
					return statusToChinese(value);
				}
			}, {
				title : '情况汇报',
				dataIndex : 'situation',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '45%'
			}];
		},
		_initStore:function(){
			var _self=this;
			var param ={
					name : '',
					orgId : _self.get('orgId'),
					week : '',
					startDate:'',
					endDate:'',
					status:'',
			};
			var store = new Data.Store({
				pageSize : 10,//每页数量
				proxy : {
					url : contextPath + "ondutyNewAction/getOnDutyByDto.cn",//TODO异步数据源请求
					method : 'post'
				},
			params:{
				param:JSON.stringify(param),
			}
			});
		    this.set('ondutyPageStore',store);
			return store;
		},
		_initSearchGrid:function(){
			var _self = this;
			var searchGrid = {
				tbarItems :  [{
						  id:'add',
		                  btnCls : 'button button-small onDutyAdd',
		                  text : '<i class="icon-plus"></i>新增',
		        },{
                	xclass : 'bar-item-separator' // 竖线分隔符
                },{
						  id:'update',
		                  btnCls : 'button button-small onDutyUpdate',
		                  text : '<i class="icon-edit"></i>修改',
		        },{
                	xclass : 'bar-item-separator'
                },{
						  id:'delete',
		                  btnCls : 'button button-small onDutyDelete',
		                  text : '<i class="icon-remove"></i>批量删除',
		        },{
                	xclass : 'bar-item-separator'
                },{
						  id:'detail',
		                  btnCls : 'button button-small onDutyDetail',
		                  text : '<i class="icon-list-alt"></i>详情',
		        },{
                	xclass : 'bar-item-separator'
                },{
						  id:'debriefing',
		                  btnCls : 'button button-small onDutyDebriefing',
		                  text : '<i class="icon-asterisk"></i>情况汇报',
		        },{
                	xclass : 'bar-item-separator'
                },{
						  id:'import',
		                  btnCls : 'button button-small onDutyImport',
		                  text : '<i class="icon-upload"></i>导入数据',
		        },],
		        plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber],
				permissionStore : _self._initPermissionStore()
			};
			return searchGrid;
		},
		//权限配置
		_initPermissionStore : function() {
			var _self = this;
			var perId = _self.get('perId'),contextPath = _self.get('contextPath');
			var permissionStore = new Data.Store({
				url : contextPath + 'permission/getBtnPers.cn',
				params : {perId : perId},
				proxy : {
					method : 'post'
			    },
			});
			return permissionStore;
		},
//  ************DOM渲染完********************		
		//页面数据渲染区
		renderUI:function(){
			var _self = this;
			_self._initSelect();
			_self._initCalendar();
			_self._initSearchDate();
			_self._initGridDate();
		},
//  ****************数据渲染区***********************
		_initSelect:function(){
			initWeek('weekCbo');
			initStatus('status');
		},
		_initCalendar:function(){
			var datepicker = new Calendar.DatePicker({
	            trigger:'.calendar',
	            autoRender : true,
	            dateMask : 'yyyy/mm/dd'
	          });
		},
		_initSearchDate:function(){
			$('#orgId').val(this.get('orgId'));
		},
		_initGridDate:function(){
			var _self=this;
			var ondutyPageStore = _self.get('ondutyPageStore');
			ondutyPageStore.load();
		},
		//获取查询页面数据
		_getParams:function(_self){
			var searchForm = _self.getChild(SearchGridContainer.SEARCH_FORM_ID, true);
			var data = searchForm.serializeToObject();
			return JSON.stringify(data);
		},
//	****************数据渲染区完**********************	
		//页面事件绑定区
		bindUI:function(){
			var _self = this,contextPath = _self.get('contextPath'),
			table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true),
			tbar = table.get('tbar'),orgId=_self.get('orgId');
			var ondutyPageStore = _self.get('ondutyPageStore');
			_self._bindGridBarBth(_self,contextPath,tbar,ondutyPageStore,orgId,table);
		},
//		刷新页面
		_refreshPage:function(ondutyPageStore,_self){
			ondutyPageStore.load({'param':_self._getParams(_self)});
		},	
//	****************绑定页面事件**********************
	    //页面按钮事件
		_bindGridBarBth:function(_self,contextPath,tbar,ondutyPageStore,orgId,table){
//			新增
			$('.onDutyAdd').click(function(){
				var onDutyAdd=new OnDutyAdd({
					orgId:orgId,
					contextPath:contextPath
				});
				onDutyAdd.show();
				onDutyAdd.on('saveBtn',function(e){
					tbar.msg(e.result);
					onDutyAdd.close();
					
				});
				onDutyAdd.on('closing',function(e){
					_self._refreshPage(ondutyPageStore,_self);
				});
			});
//			修改
			$('.onDutyUpdate').click(function(){
				var selections = table.getSelection();
				var selectionsLength=selections.length;
				
				if(!selectionsLength){
					commonFailure('请选择一条记录进行修改');
					return;
				}
				if(selectionsLength>1){
					commonFailure('只能选择一条记录进行修改');
					return;
				}
				var onDutyUpdate=new OnDutyUpdate({
					orgId:orgId,
					contextPath:contextPath,
					ondutyId:selections[0].id,
				});
				onDutyUpdate.show();
				onDutyUpdate.on('saveBtn',function(e){
					tbar.msg(e.result);
					onDutyUpdate.close();});
				onDutyUpdate.on('closing',function(e){
					_self._refreshPage(ondutyPageStore,_self);
				});
			});
//			批量删除
			$('.onDutyDelete').click(function(){
				var selections = table.getSelection();
				var selectionsLength=selections.length;
				if(!selectionsLength){
					commonFailure('请选择至少一条记录进行删除');
					return;
				}
				BUI.Message.Confirm('确定要删除选中记录吗？<br/>',function(){
					var ids = "";
					for(var i = 0; i < selectionsLength; i ++) {
						ids += "," + selections[i].id ;
					}
					ids = ids.substring(1);
					_self._delRecords(ids,contextPath,_self,ondutyPageStore);
				},'question');
			});
//			详情
			$('.onDutyDetail').click(function(){
				var selections = table.getSelection();
				var selectionsLength=selections.length;
				if(!selectionsLength){
					commonFailure('请选择一条记录进行修改');
					return;
				}
				if(selectionsLength>1){
					commonFailure('只能选择一条记录进行修改');
					return;
				}
				var onDutyDetail=new OnDutyDetail({
					contextPath:contextPath,
					ondutyId:selections[0].id,
				});
				onDutyDetail.show();
				onDutyDetail.on('closing',function(e){
					_self._refreshPage(ondutyPageStore,_self);
				});
			});
//			情况汇报
			$('.onDutyDebriefing').click(function(){
//				检查登录用户是否值班
				_self._checkPersonOnduty(_self,ondutyPageStore,tbar);
			
			});
//			导入数据
			$('.onDutyImport').click(function(){
				var onDutyImportForm=new OnDutyImportForm({
					contextPath:contextPath,
					perId:_self.get('perId'),
				});
				onDutyImportForm.show();
				onDutyImportForm.on('importBtn',function(e){
					//tbar.msg(e.result);
					onDutyImportForm.close();
				});
				//onDutyImportForm.on('closing',function(e){_self._refreshPage(ondutyPageStore,_self);});
			});
		},
		_checkPersonOnduty:function(_self,ondutyPageStore,tbar){
			var userId=_self.get('userId');
			var contextPath=_self.get('contextPath');
			$.ajax({
				url:contextPath+'ondutyNewAction/getTodayUserDuty.cn',
				type:'post',
				dataType:'json',
				data:{'userId':userId},
				async:false,
				success:function(data, textStatus, jqXHR){
					var flag=false;
						flag=_self._getTodayUserDutySuccess(data,_self,userId);
						if(flag){
//							弹出汇报窗口
							var onDutyReportForm=new OnDutyReportForm({
								curDate:_self.get('curDate'),
								contextPath:contextPath,
								userId:userId,
							});
							onDutyReportForm.show();
							onDutyReportForm.on('saveBtn',function(e){
								tbar.msg(e.result);
								onDutyReportForm.close();
							});
							onDutyReportForm.on('closing',function(e){
								_self._refreshPage(ondutyPageStore,_self);
							});
						}
					},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					BUI.Message.Alert(textStatus)},
			});
		},
		_getTodayUserDutySuccess:function(data,_self,userId){
			if(jQuery.isEmptyObject(data)){
				commonFailure("当前登录人当天没有值班信息，不必填写情况汇报!");
				return;
			}
				if(data.status==2){
					commonFailure("该用户当天值班信息已经汇报，不可进行汇报!");
					return;
				}
				if(data.user.id != userId){
					commonFailure("该记录值班人不是当前系统登录人员，不可进行汇报!");
					return;
				}
				var curOrgName=_self.get('curOrgName');
				if(!curOrgName.length){
					commonFailure("该人员没有部门，请设置部门后在进行情况汇报!");
					return;
				}
				var checkArr = curOrgName.split("车间");
				if(checkArr.length <= 1){
					commonFailure("非车间用户不必填写汇报!");
					return;
				}
				var curHour=_self.get('curHour');
				if(curHour<17 || curHour>=20){
					commonFailure("应在17:00-20:00填写!");
					return;
				}
				return true;
		},
		_delRecords:function(ids,contextPath,_self,ondutyPageStore){
			var postLoad = new PostLoad({
				url:contextPath +  'ondutyNewAction/delete.cn',
				el:'#onduty',
				loadMsg:'删除中...'
			}); 			    	
			postLoad.load({ids:ids},function(data){
				if(data.status){//显示成功信息，并在5秒后消失
					commonSuccess();
				}else{
					commonFailure();
				}
				_self._refreshPage(ondutyPageStore,_self);
			});
		},
//	****************绑定页面事件完*********************
	},{ATTRS:{
		elAttrs:{value: {id:"onduty"}},
		perId:{},
		contextPath : {},
		orgId:{},
		userId:{},
		curOrgName:{},
		curUser:{},
		curHour:{},
		curDate:{},
	}});
	
	return OnDutyPage;
});