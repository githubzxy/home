<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户管理</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css_framework/css_bui/layout-min.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<script src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script src="<%=contextPath%>/resource/js_framework/bui_framework/bui.js"></script>
<style>
#contentDiv {
	width:100%;
	margin:0;	
	overflow:hidden;
}

#leftDiv {
	float:left;
	width:250px;
	height:100%;
	border-right: 2px solid #3892d3;
}

#rightDiv {
	float:left;
	width:800px;
	height:100%;
	overflow:hidden;
}
.bui-tree-picker {
	overflow-y : auto;
}
.userMask {
	z-index: 1100 !important;
}
</style>
</head>
<body style="overflow: hidden;">
	<div id="contentDiv">
		<div id="leftDiv">
		</div>
		<div id="rightDiv" class="form-horizontal">
			<div id="detailDiv">
			<form action="#" class="form-horizontal" id="searchForm">
			<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			 <div class="row">
				<div class="control-group span10">
					<label class="control-label">用户名：</label>
					<div class="controls">
						<input type="text" name="userName" id="userName" class="input-normal" style="width: 170px;"/>
						<input type="hidden" name="userOrg" id="userOrg" class="control-text" />
						<input type="hidden" name="userOrgVal" id="userOrgVal"  />
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
			<legend>用户列表</legend>
			<div id="grid"></div>
		</fieldset>
	</div>
	</div>
	</div>
	</div>
<script src="<%=contextPath%>/resource/js/common.js"></script>
<script src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var perId = "<%=perId%>";
var grid;
var store;
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
function initPage() {
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	grid.set('height',windownHeight - searchHeight-45);
	store.load();
}
$("#btnSearch").click(function(){
	if(!$("#userOrg").val()){
		$("#userOrgVal").val('');
	}
	if(store){
		store.load({
			userName : $("#userName").val(),
			userOrg:$("#userOrgVal").val(),
			start : 0, //从第一页开始
			pageSize : 15
		});
	}
});

var orgTree;
var orgStore;

var parentOrgStore;

var addDialog;//新增用户弹出框
var editDialog;//修改用户弹出框

BUI.use(["bui/grid","bui/data",'bui/tree', 'bui/extensions/treepicker', 'bui/form','bui/overlay','mod/GridBtn'],
			function(Grid,Data ,Tree, TreePicker, Form,Overlay,GB){

	orgStore = new Data.TreeStore({
		  map:{
			  'name' : 'text',	// 节点显示文本
			  'isdept' : 'leaf'	// 是否为叶子节点
		  },
		  root:{
			  text : gtjt_name,
			  id : gtjt_id
		  },
		  pidField : "id", // 异步树必须设置该属性：标示父元素id的字段名称
		  proxy : {
	 			url : contextPath+'organization/getOrgChildrenById.cn',
				method : 'post',
				dataType : 'json'
		  },
		  map : {	// 节点映射
				'name' : 'text',	// 节点显示文本
				'isdept' : 'leaf'	// 是否为叶子节点
			},
          autoLoad : true
      });
	
	orgTree = new Tree.TreeList({
		render : '#leftDiv',
		store : orgStore,				
		showLine : true ,//显示连接线				
		showRoot : true
	});
	orgTree.render();
	orgStore.load({id : gztxd_id});// 默认展开广州通信
	orgTree.on("itemclick", function(ev) {
		
		var orgObj = ev.item;
		$("#userOrg").val(orgObj.text);
		$("#userOrgVal").val(orgObj.id);
		if(store){
			store.load({
				userName : $("#userName").val(),
				userOrg:$("#userOrgVal").val(),
				start : 0, //从第一页开始
				pageSize : 15
			});
		}
		
	});
	var columns = [{
		title:'用户名',
		dataIndex:'userName',
		elCls : 'center',
		width:'25%'
	},{
		title:'组织机构',
		dataIndex:'orgName',
		elCls : 'center',
		width:'25%',
	},{
		title:'角色',
		dataIndex:'roleName',
		elCls : 'center',
		width:'25%',
	},{
		title:'固定电话',
		dataIndex:'telephoneNumber',
		elCls : 'center',
		width:'25%'
	},{
		title:'联系电话',
		dataIndex:'phone',
		elCls : 'center',
		width:'25%'
	},{
		title:'操作',
		elCls : 'center',
		width:'25%',
		renderer:function(){
			 return '<span class="grid-command resetBtn">重置密码</span>&nbsp;'+
			 '<span class="grid-command updateBtn">修改</span>&nbsp;'+
			 '<span class="grid-command deleteBtn">删除</span>';
		}
	}];
	store = new Data.Store({
		url : contextPath+'userAction/getAllUser.cn',
		pageSize : 15,
		proxy : {
			method : 'post',
			dataType : 'json'
		}
	});
		
	/*表格设置*/
	grid = new GB({
		render : '#grid',
		perId : perId,
		contextPath : contextPath,
		width : '100%',//如果表格使用百分比，这个属性一定要设置
		columns : columns,
		idField : 'id',
		tbar : {
			items : [{
                  btnCls : 'button button-small',
                  text : '<i class="icon-plus"></i>新增用户',
                  listeners : {'click' : function(){
                	  if($('#userOrgVal').val()!=''){
						addDialog = addDialogCreate($('#userOrgVal').val());
              		}else{
              			addDialog = addDialogCreate('');
                    }
                     	addDialog.show();
                  	    addDialog.get('loader').load();
                  }
                 }
                },{
					xclass : 'bar-item-text',
					text : errorMsgHtml + sucMsgHtml
			}]
		},
		bbar : {pagingBar : true},
		plugins : [
		           Grid.Plugins.RowNumber//列序号插件
		          ],
		store : store
	});

	grid.render();
	
	initPage();
	
	//添加用户
    function addDialogCreate(orgId){
 	   addDialog = new Overlay.Dialog({
 		   title : '新增用户',
			   width : 560,
			   height : 380,
			   closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			   mask : true,//非模态弹出框
			   bodyStyle : {padding : 0},
			   listeners : {
				   closing : function(){//关闭窗口时刷新列表
				        store.load();
				   }
			   },
				buttons : [ {
					text : '保存',
					elCls : 'button btn-save',
					handler :function(){
						if(!addForm.isValid()) {
							return ;
						}
						// 执行提交到数据库的方法
						$.ajax({
							url : contextPath + 'userAction/saveUser.cn',
							type : "post",
							data:{
								savaName : $("#addForm #savaName").val(),
								saveOrgVal : $("#addForm #saveOrgVal").val(),
								saveTelephoneNumber : $("#addForm #telephoneNumber").val(),
								savePhone : $("#addForm #phone").val(),
								saveComment : $("#addForm #remark").val()
							},
							success : function(data,status){
								if(status){
									commonSuccess("添加成功！");
								}else{
									commonFailure("添加失败！");
								}
								store.load();
							}
						});
						dialogClose(addDialog);
					}
				}, {
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(addDialog);
				}
			}],
			loader : {
				url : contextPath + 'views/system/userAdd.jsp?id=' + orgId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
 	   });
 	   return addDialog;
	}
		
	grid.on('cellclick',function  (ev) {
		var record = ev.record;//点击行的记录
		var target = $(ev.domTarget); //点击的元素
		
		if(target.hasClass('resetBtn')){
			BUI.Message.Confirm('确认要将【' + record.userName + '】的密码重置为888888吗？',function(){
				$.post(
						contextPath + 'userAction/resetUser.cn',
						{password : '888888',userId : record.userId},
						function(d){
							commonSuccess('用户密码重置成功！');
							store.load();
						}
				);
			},'question');
		}
		if(target.hasClass('updateBtn')){
			editDialog = editDialogCreate(record.userId);
			editDialog.show();
			editDialog.get('loader').load();
		}
		if(target.hasClass('deleteBtn')){
			BUI.Message.Confirm('确认要删除【' + record.userName + '】用户吗？',function(){
				$.post(
						contextPath + 'userAction/deleteUser.cn',
						{userId : record.userId},
						function(d){
							commonSuccess('用户删除成功！');
							store.load();
						}
				);
			},'question');
		}
    });
	
	//添加用户
    function editDialogCreate(id){
    	editDialog = new Overlay.Dialog({
 		   title : '修改用户',
			   width : 560,
			   height : 380,
			   closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			   mask : true,//非模态弹出框
			   bodyStyle : {padding : 0},
			   listeners : {
				   closing : function(){//关闭窗口时刷新列表
				        store.load();
				   }
			   },
				buttons : [ {
					text : '保存',
					elCls : 'button btn-save',
					handler :function(){
						if(!updateForm.isValid()) {
							return ;
						}
						// 执行提交到数据库的方法
						$.ajax({
							url : contextPath + 'userAction/saveUser.cn',
							type : "post",
							data:{
								saveId : id,
								savaName : $("#updateForm #savaName").val(),
								saveOrgVal : $("#updateForm #saveOrgVal").val(),
								saveTelephoneNumber : $("#updateForm #telephoneNumber").val(),
								savePhone : $("#updateForm #phone").val(),
								saveComment : $("#updateForm #remark").val()
							},
							success : function(data,status){
								if(status){
									commonSuccess("修改成功！");
								}else{
									commonFailure("修改失败！");
								}
								store.load();
							}
						});
						dialogClose(editDialog);
					}
				}, {
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(editDialog);
				}
			}],
			loader : {
				url : contextPath + 'views/system/userUpdate.jsp?id=' + id,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
 	   });
 	   return editDialog;
	}
		
	//  弹出框提示
	function tooltip(msg){
		var msg = msg;
		BUI.Message.Show({
			msg : msg,
			closeable : false,
			icon : 'info',
			buttons : [{
  	            text : '确定',
  	            elCls : 'button',
  	            handler : function(){
  	            	$(".bui-ext-mask").removeClass("userMask");
						this.close();
					}
  	       }]
  	    });
  	}
	initPageLayout();
	function initPageLayout() {
		var winHeight = $(window).height();
		$("#contentDiv").height(winHeight);
		
		var winWidth = $(window).width();
		$("#rightDiv").width(winWidth - $("#leftDiv").width() - 10);
		
		// 设置树的高度
		orgTree.set('height',winHeight - 10);
		// 设置表格高度
		var detailDiv = $('#detailDiv').height();
		grid.set('height',winHeight - detailDiv - 45);
	}
	initPage();
	
	/**
	 * 关闭弹出框并解除引用
	 * param:d 待关闭的弹出框
	 */
	function dialogClose(d){
		d.close();
		d = null;
	}
	
});
</script>

</body>
</html>