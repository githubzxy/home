define("views/technical/productInstructionPage",
			['bui/data','bui/common','bui/grid','bui/calendar',
			 'common/grid/SearchGridContainer',
			 'common/data/PostLoad',
			 'common/org/OrganizationPicker',
			 'views/technical/productInstructionAdd',
			 'views/technical/productInstructionUpdate',
			 'views/technical/productInstructionDetails'
			],
		function(require){
          var Data=require('bui/data');
          var BUI=require('bui/common'),Component = BUI.Component;
          var Calendar=require('bui/calendar');
          var Grid=require('bui/grid');
          var SearchGridContainer=require('common/grid/SearchGridContainer');
          var PostLoad=require('common/data/PostLoad');
          var OrganizationPicker=require('common/org/OrganizationPicker');
          var ProductInstructionAdd=require('views/technical/productInstructionAdd');
          var ProductInstructionUpdate=require('views/technical/productInstructionUpdate');
          var ProductInstructionDetails=require('views/technical/productInstructionDetails');
          
          var ProductInstructionPage=Component.Controller.extend({
        	  initializer:function(){
        		  var _self=this;
        		  _self.addChild(_self._initSearchGridForm());
        	  },
        	  
        	  renderUI:function(){
        		  var _self=this;
        		  _self._initOrgPickerSerch(); //初始化组织机构树
        		  _self._initDataType();       //初始化资料类别
        		  _self._initDate();           //初始化日历
        	  },
        	  
        	  bindUI:function(){
        		var _self=this;
        		var table=_self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
  				var tbar = table.get('tbar');
  				var contextPath=_self.get('contextPath');
  				
  				//点击条件查询中的所属部门,弹出组织机构树
  				var orgPicker=_self.get('orgPicker');
  				orgPicker.on('orgSelected',function(e){
   				   $('#orgSelectName').val(e.org.text);
   				   $('#orgSelectId').val(e.org.id);
      		    });
  				
  				//新增文件
  				tbar.getChild('addInstruction').on('click',function(){
  					var productInstructionAdd=new ProductInstructionAdd({
  						contextPath:contextPath
  					});
  					productInstructionAdd.show();
  					productInstructionAdd.on('completeAddSave',function(e){
  						tbar.msg(e.result);
  						productInstructionAdd.close();
  						_self._refreshPage();
  					});
  				});
  				
  				//修改
  				tbar.getChild('modifyInstruction').on('click',function(){
  					var selections = table.getSelection();
  					if(!selections.length||selections.length>1){
  						tbar.msg({msg:'请选择一条数据进行操作！',status:'0'});
  						return;
  					}
  					var productInstructionUpdate= new ProductInstructionUpdate({
  						contextPath:contextPath,
  						fileId:selections[0].id
  					});
  					productInstructionUpdate.show();
  					productInstructionUpdate.on('completeUpdateSave',function(e){
  						tbar.msg(e.result);
  						productInstructionUpdate.close();
  						_self._refreshPage();
  					});
  					productInstructionUpdate.on('close',function(e){
  						_self._refreshPage();
  					});
  				});
  				
  			    //批量删除
  				tbar.getChild('removeMore').on('click',function(){
  					var selections = table.getSelection();
  					if(!selections.length){
  						tbar.msg({msg:'至少选择一条数据进行操作！',status:'0'});
  						return;
  					}
  					var ids=selections.map(function(s){return s.id}).join();
  					BUI.Message.Confirm('您确定要删除选中的数据吗?',function(){
  						var postLoad=new PostLoad({
  							url:contextPath+'productInstruction/delProductInstruction.cn'
  						});
  						postLoad.load({jsonIds:ids},function(data){
  							tbar.msg(data);
  							_self._refreshPage();
  						});
  					});
  				});
  				
  				//详情
  				tbar.getChild('detailInstruction').on('click',function(){
					var selections = table.getSelection();
					if(selections.length == 1){
						var fileId = selections[0].id;
						var productInstructionDetails = new ProductInstructionDetails(
								{contextPath: contextPath,fileId: fileId});
						productInstructionDetails.show();
					}else if(selections.length == 0){
						tbar.msg({msg:'请选择一条数据！',status:'0'});
					}else{
						tbar.msg({msg:'不能选择多条数据！',status:'0'})
					}
				});
				
				//导出
  				tbar.getChild('exportInstruction').on('click',function(){
  					var store=_self.get('instructionDataStore');
  					var records = store.getResult();
					if(records.length != 0){
						_self._exportXls(records);
					}else{
						tbar.msg({msg:'没有数据可以导出！',status:'0'});
					}
  				});
        	  },
        	  
        	  //导出本页数据
	  		  _exportXls:function(records){
  				  $('#exportXlsJson').val('');//清空值
  				  // 拼接导出数据的JSON字符串
  				  var json = '[';
  				  for(var i = 0 ; i < records.length ; i++){
  					  var row = records[i];
  					  json += '{'
  						  +'"name":'+'"'+row.name+'",'
  						  +'"depart":'+'"'+row.depart.name+'",'
  						  +'"technicalInfoType":'+'"'+technicalInfo_type.typeName(row.technicalInfoType)+'",'
  						  +'"createStartDate":'+'"'+row.createDate+'"'
  						  +'},';
  				  }
  				  json = json.substring(0, json.length - 1);
  				  json += ']';
  				  $('#exportXlsJson').val(json);
  				  $('#exportForm').submit();
	  		  },
	  		  
        	  _refreshPage:function(){
        		var _self=this;
        		var seachForm=_self.getChild(SearchGridContainer.SEARCH_FORM_ID,true);
      			var store=_self.get('instructionDataStore');
      			store.load(seachForm.serializeToObject());
        	  },
        	  
        	  //初始化组织机构树
        	  _initOrgPickerSerch:function(){
        		  var _self=this;
        		  var contextPath = _self.get('contextPath');
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
        	  
        	  //初始化资料类别
        	  _initDataType:function(){
        		technicalInfo_type.listData("#dataType"); 
        	  },
        	  
        	  //初始化日历
        	  _initDate:function(){
    			var datepickerStart = new Calendar.DatePicker({
    				trigger : '#startTime',
    				showTime : true,
    				autoRender : true
    			});
    			var datepickerEnd = new Calendar.DatePicker({
    				trigger : '#endTime',
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
        	  }, 
        	  
        	  //初始化上查询框
        	  _initSearchForm:function(){
        		  return {
        			  items:[{
        				  label:'所属部门',
        				  item:'<input type="text" id="orgSelectName" style="width: 175px;" />'
        					 + '<input type="text" name="depart" id="orgSelectId" style="display:none;"/>'
        			  },{
        				  label:'产品说明书',
        				  item:'<input type="text" name="name" id="product" style="width: 175px;">'
        			  },{
        				  label:'资料类别',
        				  item:'<select name="technicalInfoType" id="dataType" style="width: 200px;"><option value="">请选择</option></select>'
        			  },{
        				  label:'创建时间',
        				  item:'<input type="text" name="createStartDate" id="startTime" class="calendar calendar-time" style="width: 175px;"/>',
        			  },{
        				  label:'至',
        				  item:'<input type="text" name="createEndDate" id="endTime" class="calendar calendar-time" style="width: 175px;"/>',
        			  }]
        		  };
        	 },
        	 //初始化下列表
//        	_initColumns:function(){
//        		var alWidth = (window.innerWidth-145)/4;//均分到每个单元格的宽度
//        		return [
//        			{title:'产品说明书',dataIndex:'name',elCls : 'center',width:alWidth+300},           
//		    		{title:'所属部门',dataIndex:'depart',elCls : 'center',width:alWidth-100,renderer: function(value) {return value.name;}},
//		    		{title:'资料类别',dataIndex:'technicalInfoType',elCls : 'center',width:alWidth-100,renderer: function(value) {return technicalInfo_type.typeName(value);}},
//		    		{title:'创建时间',dataIndex:'createDate',elCls : 'center',width:alWidth-100,renderer: Grid.Format.datetimeRenderer}
//		    	];
//        	},
//        	_initColumns:function(){
//        		var alWidth = (window.innerWidth-145)/4;//均分到每个单元格的宽度
//        		return [
//        		        {title:'产品说明书',dataIndex:'name',elCls : 'center',width:alWidth+300},           
//        		        {title:'所属部门',dataIndex:'depart',elCls : 'center',width:alWidth-100,renderer: function(value) {return value.name;}},
//        		        {title:'资料类别',dataIndex:'technicalInfoType',elCls : 'center',width:alWidth-100,renderer: function(value) {return technicalInfo_type.typeName(value);}},
//        		        {title:'创建时间',dataIndex:'createDate',elCls : 'center',width:alWidth-100,renderer: Grid.Format.datetimeRenderer}
//        		        ];
//        	},
        	_initColumns:function(){
        		return [{
    	        			title:'产品说明书',
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
        	//初始化数据
        	_initDataStore:function(){
        		var _self=this;
    			var store=new Data.Store({
    				url:_self.get('contextPath')+'productInstruction/list.cn',
    				pageSize:10,
    				 proxy:{
    					  method : 'post',
    				      dataType : 'json'
    				 },
    				 autoLoad :true
    			});
    			_self.set('instructionDataStore',store);
    			return store;
    		},
        	//初始化下下显示列表框
    		_initSearchGrid:function(){
    			var _self=this;
    			var searchGrid = {
    					tbarItems:[{
    						id:'addInstruction',
    						btnCls : 'button button-small addInstruction',
    						text : '<i class="icon-plus"></i>新增',
    					},{
    						xclass : 'bar-item-separator'
    					},{
    						id:'modifyInstruction',
    						btnCls : 'button button-small modifyInstruction',
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
							id:'detailInstruction',
							btnCls : 'button button-small detailInstruction',
							text : '<i class="icon-list-alt"></i>详情',
						},
//						{
//							xclass : 'bar-item-separator'
//						},{
//							id:'exportInstruction',
//							btnCls : 'button button-small exportInstruction',
//							text : '<i class="icon-download"></i>导出EXCEL',
//						}
						],
						useEmptyCell : false,
						permissionStore: _self._initPermissionStore(),
						plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber],
    			};
    			return searchGrid;
    		},
    		
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
        		
    		//初始化页面内容
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
        		  perId:{}
        	  }
          });
     return ProductInstructionPage;
	}
);