<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改工单</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
	.userMask {
		z-index: 1100 !important;
	}
</style>
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<form id="updateForm" class="form-horizontal" >
			<table class="popUpTable">
				<tr class="thTdPadding" >
					<th><font color="red">*</font>工单名称</th>
					<td colspan="3">
						<div>
							<input type="text" id="updateOrderName"  style="width:98.3%;height:30px" data-rules="{required:true,maxlength:500}"/>
						</div>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>工单类型</th>
					<td><select id="updateOrderType"  style="width:100%;height:30px" ></select></td>
					<th><font color="red">*</font>工单号</th>
					<td>
					<div>
						<input type="text" id="updateOrderNum"  style="width:97%;height:30px" data-rules="{maxlength:100}"/>
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
								<jsp:param name="height"  value="100%" />
	            			</jsp:include>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>执行人员</th>
					<td colspan="3">
						<button type="button" id="updateUserBtn" class="button button-small" style="height: 30px;">新增执行人员</button>
					</td>
				</tr>
			</table>
			<div id = "info_showSegmentsGrid"></div>
		</form>
	</div>
</body>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var workOrderId = '${param.workOrderId}';
var workOrder = null;

var selectUserDialog;

var updateForm;
var updateTips;
var updateStore;
var updateGrid;

BUI.use(['bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay', 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Calendar, Form, Tooltip, Grid, Data, Overlay, ChooseUserDialog){
	if(updateTips == undefined) {
		updateTips = new Tooltip.Tips({
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
	updateForm = new Form.Form({
		srcNode : '#updateForm',
		errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
	}).render();
	
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

	 updateStore = new Data.Store({
	 	autoLoad:false
	 });
	 updateGrid = new Grid.Grid({
		 render : '#info_showSegmentsGrid',
		 columns : columns,
		 store: updateStore,
		 idField : 'id',
		 plugins : [Grid.Plugins.RowNumber],
	 });
	 updateGrid.render();
	 initPage();
	// 添加单元格点击事件
	updateGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		updateStore.remove(record);
    	}
	});
	
	// 绑定updateUserBtn的点击事件
	$("#updateUserBtn").on("click", function() {
		var selectUsers = updateStore.getResult();
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
			updateStore.setResult(selectUsers);
			chooseUser.close();
		});
	});
 	
});

$(document).ready(function () {
	
	workOrder_type.listData("#updateOrderType");
	initBindEvent();
});

function initBindEvent() {
	
	$("#updateOrderType").change(function() {
		initOrderNum("updateOrderNum", $("#updateOrderType").val());
	});
	// 初始化的触发change事件
	$("#updateOrderType").change();
}

function initPage() {
	$.post(contextPath + 'workOrderAction/getById.cn',
			{
				workOrderId : workOrderId,
			},function(data,status){
				
				workOrder = data;
				
				$("#updateOrderName").val(workOrder.name);
				$("#updateOrderType option[value='" + workOrder.orderType +  "']").attr("selected", "selected");
				$("#updateOrderNum").val(workOrder.orderNum);
				$("#updateOrderNum").attr("data-seq", workOrder.orderSeq);
				$("#deadLine").val(workOrder.deadLine);
				
				if(workOrder.orderAttachFile != null){
					setUploadAttachFileId(workOrder.orderAttachFile.id);
				}
				
				updateStore.setResult(workOrder.receiveUsers);
			}, 'json');
}

</script>
</html>