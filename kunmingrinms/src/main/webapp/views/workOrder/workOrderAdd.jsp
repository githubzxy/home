<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新增工单</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
	.userMask {
		z-index: 1100 !important;
	}
 	.bui-grid-width .bui-grid-body {
 		overflow-x: hidden;
 		overflow-y: scroll;
 	}
</style>
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<form id="addForm" class="form-horizontal" >
			<table class="popUpTable">
				<tr class="thTdPadding" >
					<th><font color="red">*</font>工单名称</th>
					<td colspan="3">
						<div>
							<input type="text" id="addOrderName"  style="width:98.3%;height:30px" data-rules="{required:true,maxlength:500}"/>
						</div>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>工单类型</th>
					<td><select id="addOrderType"  style="width:100%;height:30px" ></select></td>
					<th><font color="red">*</font>工单号</th>
					<td>
					<div>
						<input type="text" id="addOrderNum"  style="width:97%;height:30px" data-rules="{maxlength:50}"/>
					</div>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>完成期限</th>
					<td style="height:30px">
						<div>
							<input type="text" name="deadLine" id="deadLine" class="calendar"
	            				 style="width:96%;" data-rules="{required:true}" readonly="readonly">
						</div>
					</td>
					<th style="background-color: GhostWhite;border-right: none;"></th>
		            <td style="background-color: GhostWhite;border-left:none;"></td>
				</tr>
				<tr class="thTdPadding" >
					<th>附件</th>
					<td colspan="3">
							<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
	            				<jsp:param name="width"  value="100%" />
								<jsp:param name="height"  value="80px" />
	            			</jsp:include>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>执行人员</th>
					<td colspan="3">
						<button type="button" id="addUserBtn" class="button button-small" style="height: 30px;">新增执行人员</button>
					</td>
				</tr>
			</table>
			<div id = "info_showSegmentsGrid"></div>
		</form>
	</div>
</body>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var selectUserDialog;

var addForm;
var addTips;
var addStore;
var addGrid;

BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay', 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Uploader, Calendar, Form, Tooltip, Grid, Data, Overlay, ChooseUserDialog){
	if(addTips == undefined) {
		addTips = new Tooltip.Tips({
	        tip : {
	          trigger : '.x-icon-error', //出现此样式的元素显示tip
	          alignType : 'right', //默认方向
	          elCls : 'tips tips-warning tips-no-icon tip1',
	          zIndex : '2000',
	          offset : 10 //距离左边的距离
	        }
	      }).render();
	}
	
	// 渲染BUIForm，用于表单元素验证
	addForm = new Form.Form({
		srcNode : '#addForm',
		errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
	}).render();
	
	addStore = new Data.Store({
        autoLoad:true,
    });
	
	 var columns = [{
		 title : '姓名',
		 elCls : 'center',
		 dataIndex :'name',
		 width:'153',
		 sortable : false,	// 表头不排序
	 },{
		 title : '部门',
		 elCls : 'center',
		 dataIndex :'organization',
		 sortable : false,
		 width:'337',
		 renderer:function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		 }
	 },{
		 title : '操作',
		 elCls : 'center',
		 sortable : false,
		 width:'122',
		 renderer:function(value) {
			return '<span class="grid-command deleteBtn">删除</span>';
		 }
	 }];

	 addGrid = new Grid.Grid({
		 render : '#info_showSegmentsGrid',
		 columns : columns,
		 store : addStore,
		 idField : 'id',
		 plugins : [Grid.Plugins.RowNumber],
	 });
	 addGrid.render();
	
	 
	// 添加单元格点击事件
	addGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		addStore.remove(record);
    	}
	});
	
//	// 绑定addUserBtn的点击事件
// 	$("#addUserBtn").on("click", function() {
// 		var selectUserDialog = selectUserDialogCreate();
// 		selectUserDialog.show();
// 		selectUserDialog.get('loader').load();
		
// 		// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
// 		$(".bui-ext-mask").addClass("userMask");
// 	});
	
//  	/**
// 	* 人员选择弹出框
// 	*/
// 	function selectUserDialogCreate() {

//  		var selectUsers = addStore.getResult();
// 		var selectUserIds = "";
// 		for(var i = 0; i < selectUsers.length; i ++) {
// 			selectUserIds += "," + selectUsers[i].id;
// 		}
// 		selectUserIds = selectUserIds.substring(1);
 		
// 		selectUserDialog = new Overlay.Dialog({
// 			title : '人员选择',
// 			width : 560,
// 			height : 475,
// 			zIndex : '1111',
// 			mask : false,
// 			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
// 			bodyStyle : {padding : 0},
// 			listeners : {
// 				closing : function(){//关闭窗口时刷新列表
// 					// 去除一级弹出框遮罩层
// 					$(".bui-ext-mask").removeClass("userMask");
// 				}
// 			},
// 			buttons : [ {
// 				text : '保存',
// 				elCls : 'button',
// 				handler :function(){
// 					// 设置执行人员表格数据
// 					var selectUsers = selectedUsersList.getItems();
// 					addStore.setResult(selectUsers);
// 					dialogClose(selectUserDialog);
// 				}
// 			}, {
// 				text : '关闭',
// 				elCls : 'button',
// 				handler : function() {
// 					var selectUsers = selectedUsersList.getItems();
// 					addStore.setResult(selectUsers);
// 					dialogClose(selectUserDialog);
// 				}
// 			}],
// 			loader : {
// 				url : contextPath + 'views/common_page/UserChooser.jsp?selectUserIds='+selectUserIds,//弹出框加载的JSP页面
// 				autoLoad : false,//不在弹出框组件初始化时自动加裁
// 				lazyLoad : false,//不进行延迟加裁
// 				dataType : 'html'//加载内容类型
// 			}
// 		});
// 		return selectUserDialog;
//  	}
 	
// 	function dialogClose(d){
// 		d.close();
// 		d = null;
// 	}

	// 绑定addUserBtn的点击事件
	$("#addUserBtn").on("click", function() {
		var selectUsers = addStore.getResult();
  		var selectUserIds = "";
  		for(var i = 0; i < selectUsers.length; i ++) {
  			selectUserIds += "," + selectUsers[i].id;
  		}
   		selectUserIds = selectUserIds.substring(1);
		var chooseUser = new ChooseUserDialog({
			contextPath : contextPath,
			userIds : selectUserIds,
			orgType : '${sessionScope.user.organization.type}',
		});
		chooseUser.show();
		chooseUser.on('sureBtn',function(e){
			// 设置执行人员表格数据
			var selectUsers = e.data;
			addStore.setResult(selectUsers);
			chooseUser.close();
		});
	});
});

$(document).ready(function () {
	
	workOrder_type.listData("#addOrderType");
	initBindEvent();
});

function initBindEvent() {
	
	$("#addOrderType").change(function() {
		initOrderNum("addOrderNum", $("#addOrderType").val());
	});
	// 初始化的触发change事件
	$("#addOrderType").change();
}

</script>
</html>