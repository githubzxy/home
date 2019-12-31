<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>工单分派</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable2.css" rel="stylesheet" />
<style type="text/css">
	.userMask {
		z-index: 1198 !important;
	}
 	.bui-grid-width .bui-grid-body {
 		overflow-x: hidden;
 		overflow-y: scroll;
 	}
</style>
</head>
<body>
	<div style="height:100%;overflow-x: hidden;" id="assignFrom">
		<table class="popUpTable">
			<tr class="thTdPadding" >
				<th style="width: 120px">分派说明</th>
				<td colspan="3"><textarea id="assignRemark" style="width: 98.3%; min-height: 30px;"></textarea></td>
			</tr>
			<tr class="thTdPadding">
				<th><font color="red">*</font>分派执行人员</th>
				<td colspan="3">
					<button type="button" id="assignUserBtn" class="button button-small" style="height: 30px;">新增执行人员</button>
				</td>
			</tr>
		</table>
		<div id = "assignGrid"></div>
		<input type="hidden" id="assignOrgId" value="${sessionScope.user.organization.id }" />
		<input type="hidden" id="assignOrgType" value="${sessionScope.user.organization.type }" />
	</div>
</body>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var id= '${param.id}';//当前工单的id

var assignStore;
var assignGrid;
var curOrgId = '${sessionScope.user.organization.id}';
var rootId = '<%=request.getParameter("rootId")%>';
var selectedWorkAreaUser;//车间派发选择执行人员时，可选择的工区用户

$(document).ready(function(){
	//如果登陆用户是车间用户，获得车间用户能选择的工区执行人员，因为如果该车间下的工区用户如果已在执行该任务，则不能再选择他们执行此任务
	if($("#assignOrgType").val()==ORG_TYPE_CJ){
		
		selectedWorkAreaUserFun();
	}
});


//根据车间id和任务根节点id查询该车间下的所有要执行该任务的工区用户
function selectedWorkAreaUserFun(){
	$.ajax({
		url:contextPath +  'workOrderAction/checkSelectedWorkAreaUser.cn',
		type:'post',
		data:{
			workShopId:$("#assignOrgId").val(),
			rootId:rootId
			},
		dataType:'json',
		success:function(result,status){
			if(status){
				selectedWorkAreaUser = result;
			}
		}
	});
}
//查询分派接收人，回显再次分派弹出框
function getAssignUserStore(id){
	$.ajax({
		url : contextPath + 'workOrderTransactorAction/assignBefore.cn',
		data : {
			workOrderTransactorId : id
		},
		type : 'post',
		dataType : 'json',
		success : function(data,status){
			assignStore.setResult(data.receiveUsers);
			$('#assignRemark').val(data.remarks);
		},
	});
}
BUI.use([ 'bui/grid', 'bui/data', 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Grid, Data, ChooseUserDialog){
	
	assignStore = new Data.Store({
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

	 assignGrid = new Grid.Grid({
		 render : '#assignGrid',
		 columns : columns,
		 store : assignStore,
		 idField : 'id',
		 plugins : [Grid.Plugins.RowNumber],
	 });
	 assignGrid.render();
	 getAssignUserStore(id);
	// 添加单元格点击事件
	assignGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		assignStore.remove(record);
    	}
	});
	
	// 绑定assignUserBtn的点击事件
	$("#assignUserBtn").on("click", function() {
		var selectUsers = assignStore.getResult();
  		var selectUserIds = "";
  		for(var i = 0; i < selectUsers.length; i ++) {
  			selectUserIds += "," + selectUsers[i].id;
  		}
   		selectUserIds = selectUserIds.substring(1);
		var chooseUser = new ChooseUserDialog({
			contextPath : contextPath,
			userIds : selectUserIds,
			orgType : $('#assignOrgType').val(),
			selectedWorkAreaUser:selectedWorkAreaUser
		});
		chooseUser.show();
		chooseUser.on('sureBtn',function(e){
			// 设置执行人员表格数据
			var selectUsers = e.data;
			assignStore.setResult(selectUsers);
			chooseUser.close();
		});
	});
	
});
</script>
</html>