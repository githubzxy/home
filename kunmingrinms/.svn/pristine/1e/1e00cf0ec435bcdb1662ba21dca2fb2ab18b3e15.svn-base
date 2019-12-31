define("views/technical/CompletionData",
		[
			'bui/data',
			'bui/common',
			'bui/grid',
			'bui/calendar',
			'bui/select',
			'common/grid/SearchGridContainer',
			'common/org/OrganizationPicker',
			'common/data/PostLoad',
			'views/technical/CompletionDataAdd',
			'views/technical/CompletionDataUpdate',
			'views/technical/CompletionDataDetails'
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
		      	CompletionDataAdd=require('views/technical/CompletionDataAdd');
		      	CompletionDataUpdate=require('views/technical/CompletionDataUpdate'),
		      	CompletionDataDetails=require('views/technical/CompletionDataDetails');
			var CompletionData = Component.Controller.extend({
				/**
				 * 初始化
				 */
				initializer:function(){
					var _self = this;
					_self.addChild(_self._initSearchGridForm());//初始化主页面
				},
				/**
				 * 渲染
				 */
				renderUI:function(){
					var _self = this;
					//初始化上查询的部门树、时间、资料类别
		    		_self._initDepartAndTime();
		    		_self._initDataType();
		    		_self._getRailName();
		    		var store = _self.get('dataStore');
		    		store.load();
				},
				/**
				 * 绑定事件
				 */
				bindUI:function(){
					var _self=this;
		    		var table=_self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
					var tbar = table.get('tbar');
					var contextPath=_self.get('contextPath');
					var store = _self.get('dataStore');
					// 点击条件查询中的所属部门框,弹出组织机构树
					var orgPicker = _self.get('orgPicker');			
					orgPicker.on('itemclick',function(e){				
						orgPicker.hide();
					});		
					orgPicker.on('orgSelected',function(e){				
						$('#orgVal').val(e.org.text);
						$('#orgSelectId').val(e.org.id);
					});
					//新增竣工资料
					tbar.getChild('addCData').on('click',function(){
						var completionAddDialog=new CompletionDataAdd({
							contextPath:contextPath
						});
						completionAddDialog.show();
						completionAddDialog.on('saveBtn',function(e){
							tbar.msg(e.result);
							completionAddDialog.close();
						});
						completionAddDialog.on('closing',function(){
							store.load();
						})
						
					});
					//修改竣工资料
					tbar.getChild('modifyCData').on('click',function(){
						var selections = table.getSelection();
						if(!selections.length||selections.length>1){
							tbar.msg({msg:"请选择一条数据进行操作！",status:'0'});
							return;
						}
						var completionDataUpdate= new CompletionDataUpdate({
							contextPath:contextPath,
							CDataId:selections[0].id
						});
						completionDataUpdate.show();
						completionDataUpdate.on('saveBtn',function(e){
							tbar.msg(e.result);
							completionDataUpdate.close();
						});
						completionDataUpdate.on('closing',function(e){
							store.load();
						});
					});
					//批量删除竣工资料
					tbar.getChild('removeMore').on('click',function(){
						var selections = table.getSelection();
						if(!selections.length){
							tbar.msg({msg:"请至少选择一条数据进行操作！",status:'0'});
							return;
						}
						var ids=selections.map(function(s){return s.id}).join();
						BUI.Message.Confirm('您确定要删除选中的数据吗?',function(){
							var postLoad = new PostLoad({
								url:contextPath+'completionAction/delCompletion.cn',
							});
							postLoad.load({jsonIds:ids},function(result){
								tbar.msg(result);
								store.load();
							});
						});
					});
					//竣工资料详情
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
						var CDataId = selections[0].id;
						var completionDataDetails=new CompletionDataDetails({
							contextPath:contextPath,
							CDataId:CDataId,
							perId:perId
						});
						completionDataDetails.show();
						completionDataDetails.on('closing',function(){
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
								+'"railLine":'+'"'+row.railLineName+'",'
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
				
				/**
				 * 初始化上查询的部门树、时间
				 */
				_initDepartAndTime:function(){
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
				 * 初始化资料类别
				 */
		    	 _initDataType:function(){
		    		 var _self=this;
		    		 technicalInfo_type.listData("#dataType");
		    	  },
		    	  /**
		    	   * 获取所有线别名称
		    	   */
		    	  _getRailName:function(){
		    		  var _self = this;
		    		  var postLoad = new PostLoad({
		    			  url:contextPath+'railLineAction/getRailLineNames.cn',
		    		  });
		    		  postLoad.load({},function(result){
		    			  _self._initRailLine(result);
		    		  });
		    	  },
		    	  /**
		    	   * 初始化线别名称
		    	   */
		    	  _initRailLine:function(result){
		    		  suggest = new Select.Suggest({
		  				  width : 201,
		  			      render : '#railName',
		  			      name:'railLine',
		  			      data : result,
		  			      autoRender : true
		  		  	});
		    	  },
				/**
				 * 初始化操作数据的功能按钮
				 */
				_initSearchGrid:function(){
					var _self=this;
	    			var searchGrid = {
						tbarItems:[{ id:'addCData',
							btnCls : 'button button-small addCData',
							text : '<i class="icon-plus"></i>新增',
							},{
							  xclass : 'bar-item-separator' // 竖线分隔符
							},{
							  id:'modifyCData',
			                  btnCls : 'button button-small modifyCData',
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
							},{
							  xclass : 'bar-item-separator'
							},{
								id:'export',
				                btnCls : 'button button-small TechnicalDrawingsExport',
				                text : '<i class="icon-download"></i>导出EXCEL',
							}],
						useEmptyCell : false,
				        plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber]
					};
					return searchGrid;
				},
				/**
				 * 初始化显示的数据
				 */
				_initDataStore:function(){
					var _self = this;
					var store = new Data.Store({
						url : contextPath + "completionAction/getAllCompletionInfos.cn",
						pageSize:10,
						params:{
							departId:'',
							name:'',
							railLine:'',
							technicalInfoType:'',
	    					createStartDate:'',
	    					createEndDate:'',
	    					start:0,
	    					limit:10,
						},
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
						title:'资料名称',
						dataIndex:'name',
						width:'55%'
					},{
						title:'所属部门',
						dataIndex:'depart',
						width:'15%',
						renderer: function(value) {
							return value.name;
						}
					},{
						title:'线别名称',
						dataIndex:'railLineName',
						width:'15%',
					},{
						title:'资料类别',
						dataIndex:'technicalInfoType',
						width:'15%',
						renderer: function(value) {
							return technicalInfo_type.typeName(value);
						}
					},{
						title:'创建时间',
						dataIndex:'createDate',
						width:'15%',
						renderer: Grid.Format.datetimeRenderer
					}];
				},
				/**
				 * 初始化上查询框
				 */
				_initSearchForm:function(){
					return{items:[{
						label:'所属部门',
						item:'<input type="text" id="orgVal" style="width: 175px;" readOnly="readonly"/>'
							+ '<input type="text" name="departId" id="orgSelectId" style="display:none;"/>'
					},{
		  				label:'资料名称',
		  				item:'<input type="text" id="dataName" name="name" style="width:175px;">'
		  				    
	  				},{
	  					label:'线别名称',
	  					item:'<div id="railName"></div>'
	  				},{
	  					label:'资料类别',
	  					item:'<select name="technicalInfoType" id="dataType" style="width: 201px;">'+
    							'<option value="">请选择</option>'+
    						 '</select>'
	  				},{
	  					label:'创建时间',
	  					item:'<input type="text" name="createStartDate" id="startDate" class="calendar" style="width: 175px;" readOnly="readonly" />'
	  				},{
	  					label:'至',
	  					item:'<input type="text" name="createEndDate" id="endDate" class="calendar" style="width: 175px;" readOnly="readonly" />'
	  				}]
						
					}
				},
				/**
				 * 初始化主页面
				 */
				_initSearchGridForm:function(){
					var _self = this;
					var searchGridContainer = new SearchGridContainer({
						searchForm:_self._initSearchForm(),//初始化上查询框
						columns:_self._initColumns(),//初始化数据显示表格的列名
						store:_self._initDataStore(),//初始化显示的数据
		    			searchGrid:_self._initSearchGrid()//初始化操作数据的功能按钮
					});
					return searchGridContainer;
				}
			},{
				ATTRS:{
					contextPath:{},
					perId:{}
				}
			});
			return CompletionData;
		})