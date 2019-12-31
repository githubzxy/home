/**
 * 备品审核主页模块
 */
define('views/dailySpare/SpareAuditPage',[
								'bui/common','bui/data','bui/grid',
								'common/grid/SearchGridContainer',
								'common/org/OrgTreePicker',
								'views/dailySpare/SpareUserSituation',
								],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,
	Data = require('bui/data'),Grid = require('bui/grid'),
	OrganizationPicker = require('common/org/OrgTreePicker'),
	SearchGridContainer = require('common/grid/SearchGridContainer'),
	SpareUserSituation = require('views/dailySpare/SpareUserSituation'),
	Calendar=require('bui/calendar');
	var SpareAuditPage = Component.Controller.extend({
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
			_self.get('store').load();
			var orgPicker = new OrganizationPicker({
				trigger : '#workShopNameId',
				valueField  : '#workShopSelectId',//用于装选中的id的隐藏域，每次修改都会更新这个隐藏域的值
				rootOrgId : gztxd_id,//必填项
				rootOrgText : gztxd_name,//必填项
				map : {
					  'id' : 'id',      // 节点ID
					  'name' : 'text'	// 节点显示文本
				},
				checkType : 'onlyLeaf',
				url : contextPath + 'organization/getAllWorkshop.cn',//必填项
				align : {
				       points : ['bl','tl']
				},
				width : 195,
				height : 200,
			});
			orgPicker.render();
			_self.set('orgPicker',orgPicker);
			_self.getChild();
			_self._setGridHeight();
			var datepicker = new Calendar.DatePicker({
	            trigger:'.calendar',
	            showTime : true,
				autoRender : true
	          });
		},
		_setGridHeight:function(){
			var _self = this,grid = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
			var search = _self.getChild(SearchGridContainer.SEARCH_FORM_ID,true);
			var windowHeight = $(window).height();
			var searchHeight = search.get('el').height();
			grid.set('height',windowHeight-searchHeight-88);
			$(".bui-grid-height .bui-grid-body").css("height",windowHeight-searchHeight-175);
		},
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath'),
			store = _self.get('store'),
			table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true),
			tbar = table.get('tbar');
			$(window).on('resize',function(){_self._setGridHeight();});
			_self._initSearchFormAutoFilling();// 自动填充映射条件查询初始值
			
			// 设备类别值改变，触发加载设备名称下拉列表
			$("#speciality").on("change",function(){
				if($('#speciality').val()){
					$('#deviceNameId').attr("disabled",false);
				}else{
					$('#deviceNameId').attr("disabled",true);
				}
				$("#deviceNameId").find("option[value!='']").remove(); //设备类别值变化，就清除设备名称select的所有option（第一个保留）
				var speciality = $("#speciality").find("option:selected").val();
				if(speciality != ""){
					_self._getSparePartNameBySpeciality(speciality);
				}
			});
			
			// 点击条件查询中的所属车间,弹出车间组织机构树
			var orgPicker = _self.get('orgPicker');
			
			orgPicker.getChild(ORGTREE_ID).on('checkedchange',function(e){
		 		var w = $('#workShopSelectId').val().split(",");
				var value = $('#workShopSelectId').val();
				
				if(w.length == 1 && value != ""){
					_self._getWorkAreasByParentId(w[0]);
				}else{
					$("#workAreaId").find("option[value!='']").remove();
					$('#workAreaId').attr("disabled",true);
				}
			});
			
			// 点击审核按钮,弹出审核对话框
			$('.auditBtn').on('click',function(){
				var selections = table.getSelection();
				if(selections.length != 0){
					var ids = "";
	      			for(var i = 0;i < selections.length;i++){
	      				ids += selections[i].id+',';
	      			}
	      			ids=ids.substring(0,ids.length-1);
					new BUI.Message.Show({
				          title : '备品审核',
				          msg : '是否全部审核通过?',
				          icon : 'question',
				          width : 300,
				          bodyStyle : {padding:'15px 50px'},
				          buttons : [
				            {
				              text:'通过',
				              elCls : 'button button-primary',
				              handler : function(){
				            	
				      			$.post(contextPath + 'dailySpare/sparePartAction/auditSparePass.cn',
				  						{
				  							ids : ids
				  						},
				  						function(result,status){
				  		    				if(status){//成功
				  		    					if(status){//提示成功
				  		    						tbar._suc('审核成功！');
				  								}else{
				  									tbar._fail('审核失败！');
				  								}
				  							}
				  		    				store.load();
				  					},'json');
				                this.close();
				              }
				            },
				            {
				              text:'不通过',
				              elCls : 'button',
				              handler : function(){

					      			$.post(contextPath + 'dailySpare/sparePartAction/auditSpareNoPass.cn',
					  						{
					  							ids : ids
					  						},
					  						function(result,status){
					  		    				if(status){//成功
					  		    					if(status){//提示成功
					  		    						tbar._suc('审核成功！');
					  								}else{
					  									tbar._fail('审核失败！');
					  								}
					  							}
					  		    				store.load();
					  					},'json');
					                this.close();
				              }
				            }
				 
				          ]
				     });
				}else{
					tbar._fail('请选择需要审核的数据！');
				}
			});
			// 点击使用情况按钮,显示使用情况记录
			$('.detailBtn').on('click',function(){
				var selections = table.getSelection();
				if(selections.length == 1){
					var sus = new SpareUserSituation({sparePartId:selections[0].id,contextPath:contextPath});
					sus.show();
				}else{
					tbar._fail('请选择一条数据进行操作！');
				}
				
			});
		},
		
		
		/**
		 * 查询条件表单
		 */
		_initSearchForm : function() {
  			return {
  				items : [{
	  				label : '设备类别',
	  				item : '<select name="speciality" id="speciality" style="width: 181px;">' +
	  							'<option value="">请选择</option>' + 
	  						'</select>'
	  			},{
	  				label : '设备名称',
	  				item : '<select name="deviceNameId" id="deviceNameId" style="width: 181px;" disabled="disabled">' +
	  							'<option value="">请选择</option>' + 
	  						'</select>'
	  			},{
	  				label : '规格型号',
	  				item : '<input type="text" name="sparePartModel" id="sparePartModel" style="width: 171px;" />'
	  			},{
	  				label : '所属车间',
	  				item : '<input type="text" id="workShopNameId" style="width: 171px;" />'
	  					+ '<input type="text" name="workShopId" id="workShopSelectId" style="display:none;"/>'
	  			},{
	  				label : '所属工区',
	  				item : '<select name="workAreaId" id="workAreaId" style="width: 181px;" disabled="disabled">' +
	  							'<option value="">请选择</option>' + 
	  						'</select>'
	  			},{
	  				label : '设备属性',
	  				item : '<select name="deviceProperties" id="deviceProperties" style="width: 181px;">' +
	  							'<option value="">请选择</option>' + 
	  						'</select>'
	  			},{
	  				label : '入库时间',
	  				item : '<input type="text" id="putInStartTime" name="putInStartTime" class="calendar calendar-time" style="width: 171px;" />' 
	  			},{
	  				label : '至',
	  				item : '<input type="text" id="putInEndTime" name="putInEndTime" class="calendar calendar-time" style="width: 171px;" />'
	  			}]
  			};
		},
		/**
		 * 自动填充映射条件查询初始值
		 */
		_initSearchFormAutoFilling : function(){
			var _self = this,units = getUnitData();// 获取所有单位
			dailySpare_speciality.listData("#speciality");// 设备类别
			daily_attribute.listData("#deviceProperties");// 设备属性
			_self.set('units',units);// 初始化单位映射
		},
		/**
		 * 根据设备类别,查询设备名称并初始化下拉列表
		 * @param speciality 设备类别
		 */
		_getSparePartNameBySpeciality : function(speciality){
			var _self = this,contextPath = _self.get('contextPath');
		 	$.post(contextPath + 'dailySpare/deviceNameAction/getDeviceNamesByDeviceCategory.cn',
				{deviceCategory : speciality},
				function(result,status){
					if(status){// 成功
						for(var i in result){
							// 初始化设备名称下拉选
							$("#deviceNameId").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");
						}
					}
				},'json');
		},
		/**
		 * 根据所属车间,查询工区名称并初始化下拉列表
		 * @param id 所属车间ID
		 */
		_getWorkAreasByParentId : function(id){
			var _self = this,contextPath = _self.get('contextPath');
			$.post(contextPath + 'organization/getOrgChildrenById.cn', 
				{id : id},
				function(result,status){
					if(status){// 成功
						for(var i in result){
							$('#workAreaId').attr("disabled",false);
							// 初始化工区下拉选
							$("#workAreaId").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");
						}
					}
				},'json');
		},
		/**
		 * 列表表格表头
		 */
		_initColumns : function() {
			var _self = this;
			/*表格列设置*/
			var columns = [{
				title : '审核状态',
				dataIndex : 'checkStatus',
				elCls : 'center',
				width : 100,
				renderer : function(value){
					switch(value){
					case '1':
						return '待审核'
					case '2':
						return '审核通过'
					case '3':
						return '审核不通过'
					}
				}
			},{
				title : '审核人',
				dataIndex : 'checkUser',
				elCls : 'center',
				width : 150,
				renderer : function(value){
					return value?value.name:'';
				}
			},{
				title : '审核时间',
				dataIndex : 'checkDate',
				elCls : 'center',
				width : 75
			},{
					title : '设备类别',
					dataIndex : 'speciality',
					elCls : 'center',
					width : 150,
					renderer : function(value){
						return dailySpare_speciality.typeName(value);
					}
				},{
					title : '设备名称',
					dataIndex : 'sparePartName',
					elCls : 'center',
					width : 150
				},{
					title : '规格型号',
					dataIndex : 'sparePartModel',
					elCls : 'center',
					width : 150
				},{
					title : '单位',
					dataIndex : 'unit',
					elCls : 'center',
					width : 50,
					renderer : function(value){
						return unit_.unitName(_self.get('units'),value);
					}
				},{
					title : '数量',
					dataIndex : 'amount',
					elCls : 'center',
					width : 50
				},{
					title:'购置时间',
					dataIndex:'buyDate',
					elCls : 'center',
					width:75
				},{
					title:'购置原因',
					dataIndex:'buyReason',
					elCls : 'center',
					width:150
				},{
					title:'入库时间',
					dataIndex:'inDate',
					elCls : 'center',
					width:75
				},{
					title:'软件版本',
					dataIndex:'softwareEdition',
					elCls : 'center',
					width:100
				},{
					title : '所属车间',
					dataIndex : 'workShop',
					elCls : 'center',
					width : 150
				},{
					title : '所属工区',
					dataIndex : 'workArea',
					elCls : 'center',
					width : 150
				},{
					title : '厂家',
					dataIndex : 'factory',
					elCls : 'center',
					width : 150
				},{
					title : '设备属性',
					dataIndex : 'deviceProperties',
					elCls : 'center',
					width : 150
				},{
					title : '存放地',
					dataIndex : 'depositLocation',
					elCls : 'center',
					width : 150
				},{
					title : '备注',
					dataIndex : 'comment',
					elCls : 'center',
					width : 150
				}];
			return columns;
		},
		/**
		 * 数据源
		 */
		_initStore : function() {
			var _self = this,contextPath = _self.get('contextPath');
			var store = new Data.Store({
				url : contextPath + 'dailySpare/sparePartAction/getSparePartsByDto.cn',
				pageSize : 10,
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				params : {checkStatus : '1'}  //只查询审核状态为待审核的数据
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
					id : 'audit',
					btnCls : 'button button-small auditBtn',
					text : '<i class="icon-check"></i>审核',
		        },{
                	xclass : 'bar-item-separator' // 竖线分隔符
                },{
					id : 'download',
					btnCls : 'button button-small detailBtn',
					text : '<i class="icon-list-alt"></i>使用情况',
		        }],
		        plugins : [
		        	Grid.Plugins.CheckSelection,//多选框插件
					Grid.Plugins.RowNumber//列序号插件
				],
				permissionStore : null
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
	
	return SpareAuditPage;
});