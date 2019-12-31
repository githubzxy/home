define("views/technical/TechnicalDrawings",
	['bui/data',
	 'bui/common',
	 'bui/grid',
	 'bui/calendar',
	 'common/grid/SearchGridContainer',
	 'common/org/OrganizationPicker',
	 'common/data/PostLoad',
	 "views/technical/TechnicalDrawingsAdd",
	 "views/technical/TechnicalDrawingsUpdate",
	 "views/technical/TechnicalDrawingsDetails"
	 ],
	function(require){
      var Data=require('bui/data'),
	      BUI=require('bui/common'),
	      Component = BUI.Component,
	      Calendar=require('bui/calendar'),
	      Grid=require('bui/grid'),
	      OrganizationPicker = require('common/org/OrganizationPicker'),
	      SearchGridContainer=require('common/grid/SearchGridContainer'),
	      PostLoad=require('common/data/PostLoad');
      	  TechnicalDrawingsAdd=require("views/technical/TechnicalDrawingsAdd"),
      	  TechnicalDrawingsUpdate=require("views/technical/TechnicalDrawingsUpdate"),
      	  TechnicalDrawingsDetails=require("views/technical/TechnicalDrawingsDetails")
      var TechnicalDrawings=Component.Controller.extend({
    	  /**
    	   * 初始化
    	   */
    	  initializer:function(){
    		  var _self=this;
    		  _self.addChild(_self._initSearchGridForm());
    	  },
    	  /**
    	   * 渲染
    	   */
    	  renderUI:function(){
    		  var _self=this;
    		  //初始化上查询的部门树、时间、资料类别
    		  _self._initDateSerch();
    		  _self._initDataType();
    		  var store = _self.get('DrawDataStore');
			  store.load();
    	  },
    	  //初始化资料类别
    	  _initDataType:function(){
    		  var _self=this;
    		  //初始化资料类别
    		  technicalInfo_type.listData("#dataType");
    	  },
    	  bindUI:function(){
    		var _self=this;
    		var table=_self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
			var tbar = table.get('tbar');
			var contextPath=_self.get('contextPath');
			var store = _self.get('DrawDataStore');
			// 点击条件查询中的所属部门框,弹出组织机构树
			var orgPicker = _self.get('orgPicker');			
			orgPicker.on('itemclick',function(e){				
				orgPicker.hide();
			});		
			orgPicker.on('orgSelected',function(e){				
				$('#orgVal').val(e.org.text);
				$('#orgSelectId').val(e.org.id);
			});
			//新增技术图纸
			tbar.getChild('addDraw').on('click',function(){
				var technicalDrawingsAddDialog=new TechnicalDrawingsAdd({
					contextPath:contextPath
				});
				technicalDrawingsAddDialog.show();
				technicalDrawingsAddDialog.on('saveBtn',function(e){
					tbar.msg(e.result);
					technicalDrawingsAddDialog.close();
				});
				technicalDrawingsAddDialog.on('closing',function(){
					store.load();
				});
			});
			//修改技术图纸
			tbar.getChild('modifyDraw').on('click',function(){
				var selections = table.getSelection();
				if(!selections.length||selections.length>1){
					tbar.msg({msg:"请选择一条数据进行操作！",status:'0'});
					return;
				}
				var technicalDrawingsUpdate= new TechnicalDrawingsUpdate({
					contextPath:contextPath,
					drawId:selections[0].id
				});
				technicalDrawingsUpdate.show();
				technicalDrawingsUpdate.on('saveBtn',function(e){
					tbar.msg(e.result);
					technicalDrawingsUpdate.close();
				});
				technicalDrawingsUpdate.on('closing',function(e){
					store.load();
				});
			});
			//批量删除技术图纸
			tbar.getChild('removeMore').on('click',function(){
				var selections = table.getSelection();
				if(!selections.length){
					tbar.msg({msg:"请至少选择一条数据进行操作！",status:'0'});
					return;
				}
				var ids=selections.map(function(s){return s.id}).join();
				//拼装选中的记录的id
				BUI.Message.Confirm('您确定要删除选中的数据吗?',function(){
					var postLoad = new PostLoad({
						url:contextPath+'technical/delTechnical.cn',
					});
					postLoad.load({jsonIds:ids},function(result){
						tbar.msg(result);
						store.load();
					});
				});
			});
			//技术图纸详情
			tbar.getChild('detail').on('click',function(){
				var perId=_self.get('perId');
				var selections = table.getSelection();
				if(!selections.length){
					tbar.msg({msg:"请选择一条数据进行操作！",status:'0'});
					return;
				}
				if(selections.length>1){
					tbar.msg({msg:"请只选择一条数据进行操作！",status:'0'});
					return;
				}
				var drawId = selections[0].id;
				var technicalDrawingsDetails=new TechnicalDrawingsDetails({
					contextPath:contextPath,
					drawId:drawId,
					perId:perId
				});
				technicalDrawingsDetails.show();
				technicalDrawingsDetails.on("closing",function(){
					store.load();
				});
			});
			// 导出本页数据
			tbar.getChild('export').on('click',function(){
				var records = store.getResult();
				$("#exportXlsJson").val('');
	 			var json = '[';
				for(var i = 0 ; i < records.length ; i++){
					var row = records[i];
					json += '{'
						+'"name":'+'"'+row.name+'",'
						+'"depart":'+'"'+row.depart.name+'",'
						+'"technicalInfoType":'+'"'+technicalInfo_type.typeName(row.technicalInfoType)+'",'
						+'"createStartDate":'+'"'+Grid.Format.datetimeRenderer(row.createDate)+'"'
						+'},';
				}
				json = json.substring(0, json.length - 1);
				json += ']';
				$("#exportXlsJson").val(json);
				if(json != ']'){
					$("#exportForm").submit();
				}else{
					tbar.msg({msg:"导出失败！",status:'0'});
				}
			});
    	  },
//    	  /**
//    	   * 导出本页数据
//    	   */
//    	  _exportXls:function(){
//			var _self = this;
//			$("#exportXlsJson").val("");//清空值
//			$("#exportXlsJson").val(JSON.stringify(_self._getSearchFormObj()));
//			$("#exportForm").submit();
//    	  },
//    	  /**
//    	   * 查询表单对象(查询条件)
//    	   */
//    	  _getSearchFormObj:function(){
//    		  return {
//    			depart:$("#orgSelectId").val(),
//				name:$("#drawings").val(),
//				technicalInfoType:$("#dataType").val(),
//				createStartDate:$("#startDate").val(),
//				createEndDate:$("#endDate").val()
//    		  };
//    	  },
    	  /**
    	   * 初始化查询时间和查询部门树
    	   */
    	  _initDateSerch:function(){
    		var _self=this;
  			//初始化日期组件
  			var datepickerStart = new Calendar.DatePicker({
  				trigger : '#startDate',
  				showTime : true,
  				autoRender : true
  			});
  			var datepickerEnd = new Calendar.DatePicker({
  				trigger : '#endDate',
  				showTime : true,
  				autoRender : true
  			});
  			//设置默认时间
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
  			//初始化所属部门树
  			var orgPicker = new OrganizationPicker({
  		          trigger : '#orgVal',
  		          rootOrgId : gztxd_id,
  		          rootOrgText : gztxd_name,
  		          delegateTrigger : true, 
  		          url : contextPath + 'organization/getOrgChildrenById.cn',
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
    	   * 初始化上查询
    	   */
    	  _initSearchForm:function(){
    		  return {items:[{
    		  					label:'所属部门',
    		  					item:'<input type="text" id="orgVal" style="width: 175px;" readOnly="readonly"/>'
    								+ '<input type="text" name="depart" id="orgSelectId" style="display:none;"/>'
    		  				},{
    			  				label:'图纸名称',
    			  				item:'<input type="text" id="drawings" name="name" style="width:175px;">'
    			  				    
    		  				},{
    		  					label:'资料类别',
    		  					item:'<select name="technicalInfoType" id="dataType" style="width: 200px;">'+
		    							'<option value="">请选择</option>'+
		    						 '</select>'
    		  				},{
    		  					label:'创建时间',
    		  					item:'<input type="text" name="createStartDate" id="startDate" class="calendar" style="width: 175px;" readOnly="readonly" />'
    		  				},{
    		  					label:'至',
    		  					item:'<input type="text" name="createEndDate" id="endDate" class="calendar" style="width: 175px;" readOnly="readonly" />'
    		  				}]
    		  			};},
    	 /**
    	  * 初始化下列表
    	  */
    	_initColumns:function(){
    		return [{
	        			title:'图纸名称',
	    				dataIndex:'name',
	    				elCls : 'center',
	    				width:'30%'
    				},{
    					title:'所属部门',
    					dataIndex:'depart',
    					elCls : 'center',
    					width:'20%',
    					renderer: function(value) {
    						return value.name;
    					}
    				},{
    					title:'资料类别',
    					dataIndex:'technicalInfoType',
    					elCls : 'center',
    					width:'20%',
    					renderer: function(value) {
    						return technicalInfo_type.typeName(value);
    					}
    				},{
    					title:'创建时间',
    					dataIndex:'createDate',
    					elCls : 'center',
    					width:'30%',
    					renderer: Grid.Format.datetimeRenderer
    				}];
    	},
    	  /**
    	   * 初始化数据(全部记录)
    	   */
    		_initDataStore:function(){
    			var _self=this;
    			var store=new Data.Store({
    				url:_self.get('contextPath')+'technical/technicalList.cn',
    				pageSize:10,
    				params:{
    					depart:'',
    					name:'',
    					technicalInfoType:'',
    					createStartDate:'',
    					createEndDate:'',
    					start:0,
    					limit:10,
    				},
    				proxy:{
    					  method : 'post',
    				      dataType : 'json'
    				}
    			});
    			_self.set('DrawDataStore',store);
    			return store;
    		},
    	  /**
    	   * 初始化下显示列表框
    	   */
    		_initSearchGrid:function(){
    			var _self=this;
    			var searchGrid = {
					tbarItems:[{ id:'addDraw',
								btnCls : 'button button-small addDraw',
								text : '<i class="icon-plus"></i>新增',
								},{
								  xclass : 'bar-item-separator' // 竖线分隔符
								},{
								  id:'modifyDraw',
				                  btnCls : 'button button-small modifyDraw',
				                  text : '<i class="icon-edit"></i>修改',
								},{
								  xclass : 'bar-item-separator'
								},{
								  id:'removeMore',
				                  btnCls : 'button button-small removeMore',
				                  text : '<i class="icon-remove"></i>批量删除',
								},{
								  xclass : 'bar-item-separator'
								},{
								  id:'detail',
				                  btnCls : 'button button-small detail',
				                  text : '<i class="icon-list-alt"></i>详情',
								},
//								{
//								  xclass : 'bar-item-separator'
//								},{
//									id:'export',
//					                btnCls : 'button button-small TechnicalDrawingsExport',
//					                text : '<i class="icon-download"></i>导出EXCEL',
//								}
								],
					useEmptyCell : false,
					permissionStore: _self._initPermissionStore(),
			        plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber],
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
    	  /**
    	   * 初始化主页面
    	   */
    	  _initSearchGridForm:function(){
    		  var _self=this;
    		  var searchGridContainer=new SearchGridContainer({
    			  searchForm:_self._initSearchForm(),
    			  columns:_self._initColumns(),
    			  store:_self._initDataStore(),
    			  searchGrid:_self._initSearchGrid()
    		  });
    		  return searchGridContainer;
    	  }
      },{
    	  ATTRS:{
    		  contextPath:{},
      		  perId:{},
    	  }
      });
	return TechnicalDrawings;
});