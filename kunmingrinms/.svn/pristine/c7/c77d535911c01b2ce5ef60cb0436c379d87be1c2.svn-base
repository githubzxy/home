/**
 * 左边树结构模块
 */
define('views/emergencyOrg/LeftOrgTree',[
	'bui/common',
	'bui/data',
	'bui/toolbar',
	'bui/tree',
	'common/data/PostLoad',
	'views/emergencyOrg/LeftOrgTreeAdd',
	'views/emergencyOrg/LeftOrgTreeUpdate',
	'views/emergencyOrg/LeftOrgTreeSort',
	'common/org/OrganizationPicker'
	],function(r){
		var BUI = r('bui/common'),
		Toolbar = r('bui/toolbar'),
		Data = r('bui/data'),
		Tree = r('bui/tree'),
		PostLoad = r('common/data/PostLoad'),
		LeftOrgTreeAdd = r('views/emergencyOrg/LeftOrgTreeAdd'),
		LeftOrgTreeUpdate = r('views/emergencyOrg/LeftOrgTreeUpdate'),
		LeftOrgTreeSort = r('views/emergencyOrg/LeftOrgTreeSort'),
		OrganizationPicker = r('common/org/OrganizationPicker');
		var LeftOrgTree = BUI.Component.Controller.extend({
			initializer : function(){
				var _self=this;
				_self.addChild(_self._initButtons());//按键
				_self.addChild(_self._initTreeList());//应急机构树
			},
			/**
			 * 初始化按键
			 */
			_initButtons : function(){
				var _self = this;
				var buttonGroup = new Toolbar.Bar({
					id : 'buttons',
					width:'258px',
					height:'28px',
					elStyle : {'margin-top' : '2px'},
//					elCls : 'button-group',  //设置工具栏应用的样式
			        defaultChildCfg : {
			            elCls : 'button button-mini' //设置按钮样式
			          },
				    children : [
				    	  {content : '<i class="icon-plus"></i>新增',elStyle : {'margin-left' : '8px'},handler : function(){_self._addOrg()}},
				    	  {content : '<i class="icon-edit"></i>修改',elStyle : {'margin-left' : '5px'},handler : function(){_self._updateOrg()}},
				    	  {content : '<i class="icon-remove"></i>删除',elStyle : {'margin-left' : '5px'},handler : function(){_self._delOrg()}},
				    	  {content : '<i class="icon-retweet"></i>排序',elStyle : {'margin-left' : '5px'},handler : function(){_self._sortOrg()}}],
				    });
				return buttonGroup;
			},
			/**
			 * 初始化应急机构树
			 */
			_initTreeList : function(){
				var _self = this,contextPath = _self.get('contextPath');
				var orgStore = new Data.TreeStore({
					 map:{
						  'name' : 'text',	// 节点显示文本
						  'isLeaf' : 'leaf'	// 是否为叶子节点
					  },
					  root:{
						  text : "昆明通信段",
						  id : "4028816038c12a4a0138c16b400b000a"
					  },
					  pidField : "id", // 异步树必须设置该属性：标示父元素id的字段名称
					  proxy : {
				 			url : contextPath+'emergencyOrgAction/getOrgChildrenByPid.cn',
							method : 'post'
					  },
			          autoLoad : true
				});
				_self.set('orgStore',orgStore);
				var orgTree = new Tree.TreeList({
					id : 'orgTree',
					itemTpl : '<li id="{id}">{text}</li>', //列表项的模板
					height : _self.get('height')-28,
					store : orgStore,
					showLine : true ,//显示连接线				
					showRoot : true,
					elStyle:{'overflow-x':'hidden','overflow-y':'auto'},
				});
				_self.set('orgTree',orgTree);
				return orgTree;
			},
			/**
			 * 新增应急机构
			 */
			_addOrg: function(){
				var _self = this,orgTree = _self.get('orgTree'),orgObj = orgTree.getSelected();
				if(orgObj){
					var orgId = orgObj.id;//选中节点的id
					var leftOrgTreeAddDialog = new LeftOrgTreeAdd({
						orgId : orgId,
						contextPath : _self.get('contextPath')
					});
					leftOrgTreeAddDialog.show();
					leftOrgTreeAddDialog.on('saveAddOrgBtn',function(e){
//						console.log(e.status);
						leftOrgTreeAddDialog.close();
						if(e.status == 'success'){
							//刷新页面树数据
							_self.get('orgStore').load({id : orgId});
							BUI.Message.Alert("新增成功!");
						}else{
							BUI.Message.Alert("新增失败!");
						}
					});
				}else{
					BUI.Message.Alert("请选择为哪个机构新增子机构");
					return;
				}
			},
			/**
			 * 修改应急机构
			 */
			_updateOrg: function(){
				var _self = this,orgTree = _self.get('orgTree'),orgObj = orgTree.getSelected();
				if(orgObj){
					var orgId = orgObj.id;
					var parentId = "";
					if(orgId=="4028816038c12a4a0138c16b400b000a"){
						BUI.Message.Alert("根部门不能修改");
						return;
					}
					parentId = orgObj.parent.id;
					var leftOrgTreeUpdateDialog = new LeftOrgTreeUpdate({
						orgId : orgId,
						contextPath : _self.get('contextPath')
					});
					leftOrgTreeUpdateDialog.show();
					leftOrgTreeUpdateDialog.on('saveUpdateOrgBtn',function(e){
						leftOrgTreeUpdateDialog.close();
						if(e.status == 'success'){
							//刷新页面树数据
							_self.get('orgStore').load({id : parentId},function(){
								orgTree.setSelectedByField(orgId);
								var orgName = orgTree.getSelected().text;
								$('#orgName').val(orgName);
							});
							_self.fire("updateOrgName",{orgId : orgId});
							BUI.Message.Alert("修改成功!");
						}else{
							BUI.Message.Alert("修改失败!");
						}
					});
				}else{
					BUI.Message.Alert("请选择需要修改的机构");
					return;
				}
			},
			/**
			 * 删除应急机构
			 */
			_delOrg: function(){
				var _self = this,orgTree = _self.get('orgTree'),orgObj = orgTree.getSelected();
				if(orgObj==null){
					BUI.Message.Alert("请选择需要删除的机构");
					return;
				}else if(orgObj.id=="4028816038c12a4a0138c16b400b000a"){
					BUI.Message.Alert("根部门不能删除");
					return;
				}else{
					_self._deleteEmerOrg(orgObj);
				}
			},
			/**
			 * 应急机构排序
			 */
			_sortOrg: function(){
				var _self = this,orgTree = _self.get('orgTree'),orgObj = orgTree.getSelected();
				if(orgObj){
					var orgId = orgObj.id;//选中节点的id
					var leftOrgTreeSortDialog = new LeftOrgTreeSort({
						orgId : orgId,
						contextPath : _self.get('contextPath'),
					});
					leftOrgTreeSortDialog.show();
					leftOrgTreeSortDialog.on('sortSaveBtn',function(e){
						leftOrgTreeSortDialog.close();
						if(e.status == 'success'){
							//刷新树
							_self.get('orgStore').load({id : orgId},function(){
								orgTree.setSelectedByField(orgId);
							});
							BUI.Message.Alert("排序成功！");
						}else{
							BUI.Message.Alert("排序失败！");
						}
					});
				}else{
					BUI.Message.Alert("请选择需要排序的机构");
					return;
				}
			},
			/**
			 * 删除应急机构方法
			 */
			_deleteEmerOrg: function(orgObj){
				var _self = this,id = orgObj.id;
				var parentId = orgObj.parent.id;
				if(orgObj.parent.parent!=null){
					var gparentId = orgObj.parent.parent.id;
				}
				var postLoad =new PostLoad({
					url:contextPath +  'emergencyOrgAction/checkChildrenOrg.cn',
					loadMsg:'删除中...'
				}); 
				postLoad.load({id : id},function(data){
					if(data>0){//显示成功信息，并在5秒后消失
						BUI.Message.Alert("请先删除该机构的所有子机构!");
						return;
					}else{
						var msg = '确定要删除吗？<br/>';
						BUI.Message.Confirm(msg,
						function(){
							$.post(
								contextPath + "emergencyOrgAction/checkOrgPeople.cn",	
								{
									id : id
								},	
								function(data,status){
									if(data>0){//显示成功信息，并在5秒后消失
										BUI.Message.Alert('请先删除改该机构下的应急人员！');
									}else{
										$.post(
											contextPath + "emergencyOrgAction/deleteOrg.cn",	
											{
												id : id
											},
											function(data,status){
												if(status){
													//刷新页面树数据
													_self.get('orgStore').load({id : id});
													BUI.Message.Alert('删除成功！');
//													orgTree.setSelectedByField(parentId);//删除成功后选中父节点
													$('.button[type="reset"]').click();//触发重置按钮事件
												}else{
													BUI.Message.Alert('删除失败！');
												}
												//查询删除节点的父节点是否还有子节点
												$.post(
													contextPath + "emergencyOrgAction/checkChildrenOrg.cn",
													{
														id : parentId
													},
													function(data,status){
														if(data>0){//显示成功信息，并在5秒后消失
															//当所删除节点的父节点还有子节点时，重新加载父节点
															_self.get('orgStore').load({id : parentId});// 更新组织机构树
														}else{
															if(orgObj.parent.parent!=null){
																//当父节点不是根节点时
																//当所删除节点的父节点没有子节点时，重新加载父节点的父节点
																_self.get('orgStore').load({id : gparentId});// 更新组织机构树
															}else{
																//当父节点是根节点时
																_self.get('orgStore').load({id : parentId});// 更新组织机构树
															}
														}
													}
												);
											}
									   );
								   }	
							    }	
							);
						});
					}
				});
			}
		},{
			ATTRS : {
				id : {},
				elCls:{value:'leftOrgTree'},
				width:{value:'258px'},
				height : {value : $(window).height() - 30},
				elStyle:{value:{border:'1px solid #CDC9C9'}},
				perId:{},
				contextPath:{},
				events : {
					value : {
						'updateOrgName' : true,
					}
				}
			}
		});
		return LeftOrgTree;
});