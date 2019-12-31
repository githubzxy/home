<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>工单变更执行人</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<form id="receiveUserForm" class="form-horizontal" >
			<table class="popUpTable">
				<tr class="thTdPadding" >
					<th>工单名称</th>
					<td colspan="3">
						<div>
							<input type="text" id="updateOrderName" readonly="readonly"
							 style="width:98.3%;height:30px" />
						</div>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th>工单类型</th>
					<td>
						<div>
							<input type="text" id="updateOrderType" readonly="readonly"
							style="width:97%;height:30px" />
						</div>
					</td>
					<th>工单号</th>
					<td>
						<div>
							<input type="text" id="updateOrderNum" readonly="readonly"
							style="width:97%;height:30px" />
						</div>
					</td>
				</tr>
				<tr class="thTdPadding" style="height: 60px">
					<th>附件</th>
					<td colspan="3">
						<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
							<jsp:param name="width" value="100%" />
							<jsp:param name="height" value="100%" />
						</jsp:include>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>执行人员</th>
					<td colspan="3">
						<button type="button" id="updateUserBtn" class="button button-small" 
						style="height: 30px;">新增执行人员</button>
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

var updateStore;
var updateGrid;

BUI.use(['bui/grid', 'bui/data', 'bui/overlay', 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Grid, Data, Overlay, ChooseUserDialog){
	
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
		 width:'320',
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
	
	// 添加单元格点击事件
	updateGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		updateStore.remove(record);
    	}
	});
	initPage();
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
	
});

function initPage() {
	$.post(contextPath + 'workOrderAction/getById.cn',
			{
				workOrderId : workOrderId,
			},function(data,status){
				workOrder = data;
				
				$("#updateOrderName").val(workOrder.name);
				$("#updateOrderType").val(workOrder_type.typeName(workOrder.orderType));
				$("#updateOrderNum").val(workOrder.orderNum);
				$("#updateOrderNum").attr("data-seq", workOrder.orderSeq);
				
				if(workOrder.orderAttachFile != null){
					setAttachFileId(workOrder.orderAttachFile.id);
				}
				
				updateStore.setResult(workOrder.receiveUsers);
			}, 'json');
}

</script>
</html>