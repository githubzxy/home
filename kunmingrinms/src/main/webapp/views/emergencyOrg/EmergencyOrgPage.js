/**
 * 机构管理主页
 */
define('views/emergencyOrg/EmergencyOrgPage',[
	'bui/common','bui/tree','bui/form','bui/grid','bui/data',
	'common/container/LeftRightContainer',
	'common/grid/SearchGridContainer',
	'views/emergencyOrg/LeftOrgTree',
	'views/emergencyOrg/EmerMemberAdd',
	'views/emergencyOrg/EmerMemberUpdate',
	'common/org/OrganizationPicker',
	'common/data/PostLoad',
	'common/chooseExecuteUser/ChooseUserDialog'
	],function(r){
		var BUI = r('bui/common'),
		LRC = r('common/container/LeftRightContainer'),
		LeftOrgTree = r('views/emergencyOrg/LeftOrgTree'),
		Grid = r('bui/grid'),
		Data = r('bui/data'),
		SearchGridContainer = r('common/grid/SearchGridContainer'),
		EmerMemberAdd = r('views/emergencyOrg/EmerMemberAdd'),
		EmerMemberUpdate = r('views/emergencyOrg/EmerMemberUpdate'),
		OrganizationPicker = r('common/org/OrganizationPicker'),
		PostLoad = r('common/data/PostLoad'),
		ChooseUserDialog = r('common/chooseExecuteUser/ChooseUserDialog');
		var LEFT_ORG_TREE_ID = 'leftOrgTreeId';//左边树组件的ID
		
		var EmergencyOrgPage = LRC.extend({
			initializer: function(){
				var _self = this,left = _self.get('leftChildren'),right = _self.get('rightChildren');
				var orgTree = _self._initLeftOrgTree();
				var searchGrid = _self._initSearchGridContainer();
				left.push(orgTree);
				right.push(searchGrid);
			},
			renderUI: function(){
				var _self = this;
				_self._showEmerMember('4028816038c12a4a0138c16b400b000a');
			},
			bindUI: function(){
				var _self = this,contextPath = _self.get('contextPath'),store = _self.get('store');
				var perId = _self.get('perId');
				var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
				var tbar = table.get('tbar');
				var orgType = table.get('orgType');
				
				var treeComponent = _self.getChild(LEFT_ORG_TREE_ID,true);//获取子组件(树)
				treeComponent.on('updateOrgName',function(e){
//					console.log(e.orgId);
					_self._showEmerMember(e.orgId);
				})
				
				var tree = _self.getChild('orgTree',true);//获取左部分TreeList，孙组件，并不是子组件(树)
				tree.on("itemclick", function(e){//定义单击选项事件
					$('#peopleName').val('');
//					console.log(e.item);
					var orgObj = e.item;
					if(orgObj.id == '4028816038c12a4a0138c16b400b000a'){
						$('#orgName').val('昆明通信段');
						$('#orgId').val('');
					}else{
						$('#orgName').val(orgObj.text);
						$('#orgId').val(orgObj.id);
					}
					_self._showEmerMember(orgObj.id);
				});
				
				//新增成员
				$('.addMemberBtn').on('click',function(e){
					if($("#orgName").val() !== '昆明通信段'){
						var emerMemberAddDialog = new EmerMemberAdd({
							orgId : $("#orgId").val(),
							contextPath : contextPath
						});
						emerMemberAddDialog.show();
						emerMemberAddDialog.on('emerMemberAddSave',function(e){
							tbar.msg(e.result);
							emerMemberAddDialog.close();
							store.load();
						});
					}else{
						tbar.msg({msg:'请选择一个应急机构！',status:'0'});
					}
				});
				//修改成员
				$('.updateMemberBtn').on('click',function(e){
					var selections = table.getSelection();
					if(selections.length == 1){
						var record = selections[0];
//						console.log(record);
						var emerMemberUpdateDialog = new EmerMemberUpdate({
							peopleId : record.id,
							orgId: $("#orgId").val(),
							contextPath : contextPath
						});
						emerMemberUpdateDialog.show();
						emerMemberUpdateDialog.on('emerMemberUpdateSave',function(e){
							tbar.msg(e.result);
							emerMemberUpdateDialog.close();
							store.load();
						});
					}else if(selections.length > 1){
						tbar.msg({msg:'不能选择多条数据进行修改!',status:'0'});
					}else{
						tbar.msg({msg:'请选择一条数据进行修改!',status:'0'});
					}
					
				});
				//批量删除
				$('.delMemberBtn').on('click',function(e){
					var selections = table.getSelection();
					if(selections.length){
						var ids = "";
			    		for(var i = 0;i < selections.length;i++){
			    			ids += selections[i].id +",";
						}
			    		ids =ids.substring(0,ids.length-1);
				    	var msg = '确定要删除选中记录吗？<br/>';
						BUI.Message.Confirm(msg,function(){
							//删除操作
							var postLoad =new PostLoad({
								url:contextPath + 'emergencyOrgAction/deleteOrgPeople.cn',
								loadMsg:''
							});
							data = {ids:ids};
							postLoad.load(data,function(result){
								tbar.msg(result);
								store.load();
							});
						});
					}else{
						tbar.msg({msg:'请选择要删除的应急人员!',status:'0'});
					}
				});
				//批量新增
				$('.batchAddBtn').on('click',function(e){
					if($("#orgName").val() !== '昆明通信段'){
						var memberImportDialog = new ChooseUserDialog({
							contextPath : contextPath,
							height : 525,
							orgType:orgType,
							leftStoreUrl:"userAction/getUsersByNameOrByOrgType.cn"
						});
						memberImportDialog.show();
						memberImportDialog.on('sureBtn',function(e){
							var postLoad =new PostLoad({
								url:contextPath +"emergencyOrgAction/importEmergencyUsers.cn",
								el:'#importDialog',
								loadMsg:'保存中...'
							}); 	
							postLoad.load({
								"selectUsers" : JSON.stringify(e.data),
								"orgId" : $("#orgId").val()
							},function(data){
								tbar.msg({msg:data.msg,status:'1'});
							});
							memberImportDialog.close();
							store.load();
						});
					}else{
						tbar.msg({msg:'请选择一个应急机构！',status:'0'});
					}
				});
			},
			/**
			 * 点击左部分树选项，右部分表格跟随显示数据
			 */
			_showEmerMember: function(orgId){
				var _self = this,store = _self.get('store');
				if(orgId=="4028816038c12a4a0138c16b400b000a"){
					store.load({
						start : 0, //从第一页开始
						peopleName : '',
						orgId : ''
					});
				}else{
					store.load({
						start : 0, //从第一页开始
						peopleName : '',
						orgId : orgId
					});
				}
			},
			/**
			 * 初始化左边组织机构树
			 */
			_initLeftOrgTree: function(){
				var _self = this;
				var leftOrgTree = new LeftOrgTree({
					id : LEFT_ORG_TREE_ID,//树控件ID
					contextPath: _self.get('contextPath'),
					perId: _self.get('perId')
				});
				return leftOrgTree;
			},
			/**
			 * 初始化右边上查询下列表
			 */
			_initSearchGridContainer: function(){
				var _self = this;
				var searchGridContainer = new SearchGridContainer({
					searchForm : _self._initSearchForm(),
					columns : _self._initColumns(),
					store : _self._initStore(),
					searchGrid : _self._initSearchGrid(),
				});
				return searchGridContainer;
			},
			/**
			 * 上查询
			 */
			_initSearchForm: function(){
				return {
					items: [
						{label: '机构名称',item: '<input type="text" value="昆明通信段" id="orgName" readOnly="readOnly" disabled="disabled"/>'+
							'<input id="orgId" name="orgId" style="display:none;"/>'+
							'<input id="defaultId" name="parentId" style="display:none;"/>'
						},
						{label: '姓名',item: '<input type="text" name="peopleName" id="peopleName"/>'}
					]};
			},
			/**
			 * 表格列名
			 */
			_initColumns: function(){
				var _self = this;
				var columns = [
					{
						title:'姓名',
						dataIndex:'name',
						elCls : 'left',
						width:'15%'	
					},{
						title:'应急部门',
						dataIndex:'emergencyOrg',
						elCls : 'left',
						width:'15%'
					},{
						title:'职务',
						dataIndex:'duty',
						elCls : 'left',
						width:'15%',
						renderer:function(value) {
							if(value==""){
								return "";
							}else{
								return emergencyOrg_dutyType.typeName(parseInt(value));
							}
						}
					},{
						title:'岗位',
						dataIndex:'position',
						elCls : 'left',
						width:'15%'
					},{
						title : '办公电话',
						dataIndex : 'officeTelephone',
						elCls : 'left',//居左显示
						width : '20%'
					},{
						title : '电话',
						dataIndex : 'mobileNumber',
						elCls : 'left',//居左显示
						width : '20%'
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
					url : contextPath + "emergencyOrgAction/getAllEmergencyUsers.cn",
//					autoLoad : true ,
					pageSize : 10,
					proxy : {
						method : 'post',
						dataType : 'json'
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
							id : 'add',
							btnCls : 'button button-small addMemberBtn',
							text : '<i class="icon-plus"></i>新增成员'
						},{
							xclass : 'bar-item-separator' // 竖线分隔符
						},{
							id : 'update',
							btnCls : 'button button-small updateMemberBtn',
							text : '<i class="icon-edit"></i>修改成员'
						},{
							xclass : 'bar-item-separator' // 竖线分隔符
						},{
							id : 'del',
							btnCls : 'button button-small delMemberBtn',
							text : '<i class="icon-remove"></i>批量删除'
						},{
							xclass : 'bar-item-separator' // 竖线分隔符
						},{
							id : 'batchAdd',
							btnCls : 'button button-small batchAddBtn',
							text : '<i class="icon-plus"></i>批量新增'
						}],
					plugins : [
						Grid.Plugins.CheckSelection,
						Grid.Plugins.RowNumber,
						],
//						permissionStore : _self._initPermissionStore()
				};
				return searchGrid;
			},
			/**
			 * 按钮权限设置
			 */
			_initPermissionStore: function(){
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
			}
		},{
			ATTRS:{
				leftSize : {value : 5},//总共24份，左边占5份
				contextPath: {},
				perId: {},
				orgType: {}
			}
		}); 
		return EmergencyOrgPage;
});