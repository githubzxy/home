<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>调度命令分派</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	#assignForm .bui-grid-header {
     	overflow-y: hidden;
	}
</style>
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<form class="form-horizontal" id="assignForm">
			<table class="popUpTable">
				<tbody>
	          		<tr class="thTdPadding">
	           			<th style="width:110px">分派并签名：</th>
	            		<td colspan="3">
	            			<div>
			            		<textarea name="assignContent" id="assignContent" data-rules="{maxlength:1900}"
			            		style="width:98%;height:95px;resize:none;"></textarea>
	            			</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
	           			<th style="width:110px"><font style="color: red">*</font>分派执行人员：</th>
	            		<td>
	            			<div>
			            		<button type="button" id="assignUser" class="button button-small" 
			            		style="height: 30px;">新增执行人员</button>
	            			</div>
		            	</td>
	          		</tr>
	          	</tbody>
			</table>
			<div id = "assignGrid"></div>
			<input type="hidden" id="assignOrgId" value="${sessionScope.user.organization.id }" />
			<input type="hidden" id="assignOrgType" value="${sessionScope.user.organization.type }" />
		</form>
	</div>

<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var id = '<%=request.getParameter("id")%>';
var assignForm; //弹出分派窗口
var addTips;

var assignStore;
var assignGrid;
var selectedWorkAreaUser;
var rootId = null;
var orgId = $("#assignOrgId").val();
var assignUserDialog; // 执行人弹出框

$(document).ready(function () {
	initPageInfo(id);
});
function initPageInfo(id){
	$.post(contextPath + "dispatchRootAction/getDispatchRootById.cn",
			{
				id : id
			},function(item){
				$('#assignContent').val(item.assignRemark);
				rootId = item.parentDispath.id;
				if($("#assignOrgType").val()==ORG_TYPE_CJ){
					selectedWorkAreaUserFun();
				}
			},
			'json');
}
//分派前,查询之前分派的人员
function initPage(id) {
	$.post(contextPath + "dispatchRootAction/drAssignBefore.cn",
		{
			id : id
		},function(item){
			assignStore.setResult(item.acceptUser);
		},
		'json');
}

BUI.use(['bui/grid', 'bui/data', 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Grid, Data, ChooseUserDialog){
	
	assignStore = new Data.Store({
	       autoLoad : true,
		});
			
	var columns = [{
		title : '姓名',
		elCls : 'center',
		dataIndex :'name',
		width : '170',
		sortable : false,	// 表头不排序
	},{
		title : '单位',
		elCls : 'center',
		dataIndex :'organization',
		sortable : false,
		width : '244',
		renderer:function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		 }
	},{
		title : '操作',
		elCls : 'center',
		width : '180',
		sortable : false,
		renderer : function(value) {
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
	initPage(id);
	// 添加单元格点击事件
	assignGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget); //点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		assignStore.remove(record);
    	}
	});
	
	// 绑定assignUser的点击事件
	$("#assignUser").on("click", function() {
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
	
	 /**
	 * 关闭弹出框并解除引用
	 * param:d 待关闭的弹出框
	 */
	function dialogClose(d){
		d.close();
		d = null;
	}
/*BUI结束*/	
//console.log(store.__attrVals.data);
	
});

//根据车间id和任务根节点id查询该车间下的所有要执行该任务的工区用户
function selectedWorkAreaUserFun(){
	$.ajax({
		url:contextPath +  'dispatchRootAction/checkSelectedWorkAreaUser.cn',
		type:'post',
		data:{
			workShopId:orgId,
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
</script>
</body>
</html>