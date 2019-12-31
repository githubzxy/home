<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>角色管理</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/layout-min.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet">
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<style type="text/css">
.configMask {
	z-index: 1115 !important;
}
#grid .bui-grid-row{
	height: 29px;
}
/* #roleForm{ */
/* 	margin-left:-20px; */
/* 	margin-right:-20px; */
/* 	margin-top:-20px; */
/* } */
</style>
</head>
<body>
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">角色信息查询</legend>
			 <div class="row">
				<div class="control-group span8">
					<label class="control-label">角色名称：</label>
					<div class="controls">
						<input type="text" name="roleName" id="roleName"  class="input-normal"  style="width: 170px; "/>
					</div>
				</div>				
				<div style="float:right;margin-right: 100px">
					<button type="button" id="btnSearch" class="button button-primary">查询</button>
				</div>
			</div>
		</fieldset>
	</form>
	<div class="search-grid-container">
		<fieldset>
			<legend>角色信息列表</legend>
			<div id="grid"></div>
		</fieldset>
	</div>
<!-- 	<div id="roleDetail" class="hide"> -->
<!-- 		<form id="roleForm" class="form-horizontal"> -->
<!-- 		     <table class="table table-bordered"> -->
<!-- 		       <tr> -->
<!-- 		           <th class="thTdPadding"><label style="color: red">*</label>角色名:</th> -->
<!-- 		           <td> -->
<!-- 			           <div> -->
<!-- 			           	 <input type="text" name="saveName" id="savaName" style="width: 97%; height:30px;" class="input-normal control-text" data-rules="{required : true}"/> -->
<!-- 			          	 <input type="hidden" name="saveId" id="saveId" value=""/> -->
<!-- 			           </div> -->
<!-- 		           </td> -->
<!-- 		       </tr> -->
<!-- 		       <tr> -->
<!-- 		           <th class="thTdPadding">角色描述:</th> -->
<!-- 		           <td> -->
<!-- 		          		 <textarea name="saveDesc" id="saveDesc" style="width: 97%;height: 60px;" class="input-large"></textarea> -->
<!-- 		           </td> -->
<!-- 		       </tr> -->
<!-- 		       <tr> -->
<!-- 			       <th class="thTdPadding"><label style="color: red">*</label>所属权限:</th> -->
<!-- 			       <td>  -->
<!-- 			      		<div id="permissionTree" style="height: 200px;width: 100%;overflow-y:scroll"></div> -->
<!-- 			       </td> -->
<!-- 		       </tr> -->
<!-- 		     </table> -->
<!-- 		</form> -->
<!-- 	</div> -->
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	var perId = "<%=perId%>";
	var pageNum = 0;
	var store,grid;
	/**
	 * 查询栏点击触发收起和展开
	 */
	function hiddenSearch() {
		$('#searchForm .row').toggle('slow',function(){
			var searchHeight = $('#searchForm').height();
			if(searchHeight < 50){//TODO自己根据条件判断收起和展开的条件及具体高度（即下面的44那个值）
				grid.set('height',grid.get('height') + 44);
			}else{
				grid.set('height',grid.get('height') - 44);
			}
		});
	}
	//进行高度计算
	function readyInit(){
		var windownHeight = $(window).height();
		var searchHeight = $('#searchForm').height();
		grid.set('height',windownHeight - searchHeight-45);
		store.load();
	}
	$("#btnSearch").click(function(){		
		if(store){
			store.load({
				roleName : $("#roleName").val(),
				start : pageNum, //从第一页开始
				pageSize : 15
			});
		}
	});
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select','bui/tree','mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,Select,Tree,GB){
// 		var tree;
// 		var permissionStore = new Data.TreeStore({
// 			  map:{
// 				  'permissionDesc' : 'text'// 节点显示文本
// 			  },		
// 			  proxy : {
// 		 			url : contextPath+'permission/getAllPers.cn',
// 					method : 'post',
// 			  },
// 	          autoLoad : true
// 	     });
		var columns = [{
			title:'角色名',
			dataIndex:'name',
			elCls : 'center',
			width:'30%'
		},{
			title:'创建时间',
			dataIndex:'createTime',
			elCls : 'center',
			width:'30%'			
		},{
			title:'角色描述',
			dataIndex:'desc',
			elCls : 'center',
			width:'30%'
		},{
			title:'操作',
			elCls : 'center',
			width:'15%',
			renderer:function(){
				 return '<span class="grid-command assignBtn">角色分配</span>&nbsp;'+
				 '<span class="grid-command updateBtn">修改</span>&nbsp;'+
				 '<span class="grid-command deleteBtn">删除</span>';
			}
		}];
	
	store = new Data.Store({
		url : contextPath+'roleAction/getAllRole.cn',
		pageSize : 15,
		proxy : {
			method : 'post',
			dataType : 'json'
		}
	});
	
// 	function saveDialog(title){
// 		 var form = new Form.Form({
//  	        srcNode : '#roleForm'
//        });
//  	  var dialog = new Overlay.Dialog({
//  		  title : title,
//  		  width : 560,
// 		  height : 378,
// 		  effect : 'fade',
// 		  contentId : 'roleDetail',
// 		  closeAction : 'destroy',
// 		  listeners : {
// 			  closing : function(){
// 				store.load();
// 			  }
// 		  },
// 			buttons : [{
// 					text : '保存',
// 					elCls : 'button',
// 					handler : function() {
// 						if(!$('#savaName').val()){
// // 							BUI.Message.Alert('角色名不能为空！');
// 							$(".bui-ext-mask").addClass("configMask");
// 							tooltip('角色名不能为空！');
// 							return;
// 						}						
// 						var dialog = this;
						
// 						var checkedNodes = tree.getCheckedNodes();
// 				        var str = '';
// 				        BUI.each(checkedNodes,function(node){
// 				          str += node.id + ',';
// 				        });
// 				        str = str.substring(0, str.length-1);
// 				        if(!str){
// 				        	$(".bui-ext-mask").addClass("configMask");
// 							tooltip('请勾选所属权限！');
// 				        	return;
// 				        }
// 						$.post(
// 							contextPath + 'roleAction/saveRole.cn',
// 							{
// 								roleName:$('#savaName').val(),
// 								roleId:$('#saveId').val(),
// 								desc:$('#saveDesc').val(),
// 								perIds:str
// 							},
// 							function(d){
//  								$('#savaName').val('');
//  								$('#saveId').val('');
//  								$('#saveDesc').val('');
// 								tree.clearAllChecked();
// 								commonSuccess('角色保存成功！');
// 								dialog.close();
// 							}
// 						);
// 					}},
// 				{
// 					text : '取消',
// 					elCls : 'button',
// 					handler : function() {
// 						this.close();
// 					}
// 				}]
//  	  });
//  	  dialog.show();
// 	}
	function addRoleDialog(title){
		 
 	  var dialog = new Overlay.Dialog({
 		  title : title,
 		  width : 560,
		  height : 414,
		  closeAction : 'destroy',
		  mask : true,
		  bodyStyle : {padding : 0},
		  listeners : {
			  closing : function(){
				store.load();
			  }
		  },
			buttons : [{
					text : '保存',
					elCls : 'button',
					handler : function() {
						if(!$('#addRole #saveName').val()){
// 							BUI.Message.Alert('角色名不能为空！');
							$(".bui-ext-mask").addClass("configMask");
							tooltip('角色名不能为空！');
							return;
						}						
						var dialog = this;
						
						var checkedNodes = addTree.getCheckedNodes();
				       var perIds=[];
				        var str = '';
				        BUI.each(checkedNodes,function(node){
				        	perIds.push(node.id);
				          str += node.id + ',';
				           while(node.parent.level !=0){
				        	  if($.inArray(node.parent.id,perIds) ==-1){
				        		  
					        	  str += node.parent.id+',';
					        	  perIds.push(node.parent.id);
				        	  }
				        	  node = node.parent;
				           }
				        });
				        str = str.substring(0, str.length-1);	
				        if(!str){
				        	$(".bui-ext-mask").addClass("configMask");
							tooltip('请勾选所属权限！');
				        	return;
				        }
						$.post(
							contextPath + 'roleAction/saveRole.cn',
							{
								roleName:$('#addRole #saveName').val(),
								roleId:$('#addRole #saveId').val(),
								desc:$('#addRole #saveDesc').val(),
								perIds:str
							},
							function(d){
 								$('#addRole #saveName').val('');
 								$('#addRole #saveId').val('');
 								$('#addRole #saveDesc').val('');
 								addTree.clearAllChecked();
								commonSuccess('角色保存成功！');
								dialog.close();
							}
						);
					}},
				{
					text : '取消',
					elCls : 'button',
					handler : function() {
						this.close();
					}
				}],
				loader : {
					url : contextPath + 'views/system/roleAdd.jsp',//弹出框加载的JSP页面
					autoLoad : true,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
 	  });
 	  dialog.show();
//  	  $(".bui-tree-picker").css(top,'-999px');
	}
	function updateRoleDialog(title,roleId){
		 
 	  var dialog = new Overlay.Dialog({
 		  title : title,
 		  width : 560,
		  height : 414,
		  closeAction : 'destroy',
		  mask : true,
		  bodyStyle : {padding : 0},
		  listeners : {
			  closing : function(){
				store.load();
			  }
		  },
			buttons : [{
					text : '保存',
					elCls : 'button',
					handler : function() {
						if(!$('#updateRole #saveName').val()){
							$(".bui-ext-mask").addClass("configMask");
							tooltip('角色名不能为空！');
							return;
						}						
						var dialog = this;
						
						var checkedNodes = updateTree.getCheckedNodes();
				       var perIds=[];
				        var str = '';
				        BUI.each(checkedNodes,function(node){
				        	perIds.push(node.id);
				          str += node.id + ',';
				           while(node.parent.level !=0){
				        	  if($.inArray(node.parent.id,perIds) ==-1){
				        		  
					        	  str += node.parent.id+',';
					        	  perIds.push(node.parent.id);
				        	  }
				        	  node = node.parent;
				           }
				        });
				        str = str.substring(0, str.length-1);	
				        if(!str){
				        	$(".bui-ext-mask").addClass("configMask");
							tooltip('请勾选所属权限！');
				        	return;
				        }
						$.post(
							contextPath + 'roleAction/saveRole.cn',
							{
								roleName:$('#updateRole #saveName').val(),
								roleId:$('#updateRole #saveId').val(),
								desc:$('#updateRole #saveDesc').val(),
								perIds:str
							},
							function(d){
 								$('#updateRole #saveName').val('');
 								$('#updateRole #saveId').val('');
 								$('#updateRole #saveDesc').val('');
 								updateTree.clearAllChecked();
								commonSuccess('角色保存成功！');
								dialog.close();
							}
						);
					}},
				{
					text : '取消',
					elCls : 'button',
					handler : function() {
						this.close();
					}
				}],
				loader : {
					url : contextPath + 'views/system/roleUpdate.jsp?roleId='+roleId,//弹出框加载的JSP页面
					autoLoad : true,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
 	  });
 	  dialog.show();
//  	  $(".bui-tree-picker").css(top,'-999px');
	}
	function roleAssignToUserDialog(title,roleId){
		 
 	  var dialog = new Overlay.Dialog({
 		  title : title,
 		  width : 700,
		  height : 550,
		  closeAction : 'destroy',
		  mask : true,
		  bodyStyle : {padding : 0},
		  listeners : {
			  closing : function(){
				store.load();
			  }
		  },
			buttons : [{
					text : '保存',
					elCls : 'button',
					handler : function() {
						var orgId = $("#rightDiv #orgId").val();
						if(orgId==""){
							$(".bui-ext-mask").addClass("configMask");
							tooltip('无法保存！');
							return;
						}
						var records = rugrid.getSelection();
						var str = '';
				        BUI.each(records,function(record){
				          str += record.userId + ',';
				        });
				        str = str.substring(0, str.length-1);	
				        $.post(
								contextPath + 'roleAction/assignToUser.cn',
								{
									orgId:orgId,
									roleId:roleId,
									userIds:str	
								},
								function(d){
									$(".bui-ext-mask").addClass("configMask");
									tooltip('配置保存成功！');
								}
							);
						
					}},
				{
					text : '取消',
					elCls : 'button',
					handler : function() {
						this.close();
					}
				}],
				loader : {
					url : contextPath + 'views/system/roleAssignToUserPage.jsp?roleId='+roleId,//弹出框加载的JSP页面
					autoLoad : true,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
 	  });
 	  dialog.show();
 	  $(".bui-tree-picker").css(top,'-999px');
	}
		
	/*表格设置*/
	grid = new GB({
		render : '#grid',
		perId : perId,
		contextPath : contextPath,
		width : '100%',//如果表格使用百分比，这个属性一定要设置
		columns : columns,
		idField : 'id',
		tbar : {
			items : [
			         {
		                  btnCls : 'button button-small',
		                  text : '<i class="icon-plus"></i>新增角色',
		                  listeners : {'click' : function(){
		                	  // 新增角色前,清空表单所有内容
// 		                	  $('#savaName').val('');
// 		                	  $('#saveDesc').val('');
// 		                	  tree.clearAllChecked();
// 		                	  permissionStore.load();
		                	  addRoleDialog('新增角色');
		                    }
		                  }
                	},
	                {
						xclass : 'bar-item-text',
						text : errorMsgHtml + sucMsgHtml
					}
                	]
		},
		bbar : {pagingBar : true},
		plugins : [
		           Grid.Plugins.RowNumber//列序号插件
		          ],
		store : store
	});
	grid.render();
	
	readyInit();
	
	grid.on('cellclick',function  (ev) {
		var record = ev.record;//点击行的记录
		var target = $(ev.domTarget); //点击的元素
		if(target.hasClass('updateBtn')){
			updateRoleDialog('修改角色',record.id);
		}
		if(target.hasClass('deleteBtn')){
			BUI.Message.Confirm('确认要删除' + record.name + '角色吗？',function(){
				$.post(
						contextPath + 'roleAction/deleteRole.cn',
						{roleId : record.id},
						function(d){
							commonSuccess('角色删除成功！');
							store.load();
						}
				);
			},'question');
		}
		if(target.hasClass('assignBtn')){
			roleAssignToUserDialog("角色分配（当前角色："+record.name+"）",record.id);
		}
    });
	
// 	tree = new Tree.TreeList({
//         render : '#permissionTree',
//         store : permissionStore,
//         idField:"id",
//         async : true,
//         checkType: 'all', //checkType:勾选模式，提供了4中，all,onlyLeaf,none,custom
//         showLine : true //显示连接线
//       });
//     tree.render();
	
	//  弹出框提示
	function tooltip(msg){
		var msg = msg;
		BUI.Message.Show({
			msg : msg,
			closeable : false,
			buttons : [{
  	            text : '确定',
  	            elCls : 'button',
  	            handler : function(){
  	            	$(".bui-ext-mask").removeClass("configMask");
						this.close();
					}
  	       }]
  	    });
  	}
	
});
</script>
</body>
</html>