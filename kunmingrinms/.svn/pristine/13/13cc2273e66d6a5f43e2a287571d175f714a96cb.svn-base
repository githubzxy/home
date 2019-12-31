<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待办工单分派</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body>
	<!-- 弹出框 -->
	<div>
		<form class="form-horizontal" id="assignForm">
		<table class="popUpTable">
			<tbody>
          		<tr class="thTdPadding">
	           		<th style="width: 120px">分派说明</th>
	            	<td colspan="3">
	            		<div>
	            			<textarea  id="assignRemark" style="width:98.3%;height:60px;" data-rules="{maxlength:120}"></textarea>
	            		</div>
	            	</td>
          		<tr class="thTdPadding">
	           		<th><font color="red">*</font>分派执行人员</th>
	            	<td colspan="3">
	            		<div>
	            			<button type="button" id="assignUsersBtn" class="button button-small" style="height: 30px;">添加执行人员</button>
	            		</div>
	            	</td>
          		</tr>
          	</tbody>
		</table>
		<!-- 执行人员列表 -->
		<div id="assignUserGrid"></div>
		</form>
	</div>
		
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var assignForm;
var assignTips;

var selectedWorkAreaUser;
var rootId = null;

var assignUserStore;
var assignUserGrid;
var orgId = '${sessionScope.user.organization.id}';//当前用户组织机构id
var assinsOrgType = '${sessionScope.user.organization.type}';//当前用户组织机构id
var id= '${param.id}';//当前任务的id

BUI.use(["bui/grid", "bui/data", 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Grid, Data, ChooseUserDialog){
	
	var assignUserColumns = [{
 		 title : '姓名',
 		 elCls : 'center',
 		 dataIndex :'name',
 		 width:'175',
 		 sortable : false// 表头不排序
 	 },{
 		 title : '单位',
 		 elCls : 'center',
 		 dataIndex :'organization',
 		 sortable : false,
 		 width:'240',
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
 		 width:'175',
 		 renderer:function(value) {
 			return '<span class="grid-command deleteBtn">删除</span>';
 		 }
 	 }];
	
    
    assignUserStore = new Data.Store({
    	 autoLoad:true
    });
    
 	 assignUserGrid = new Grid.Grid({
 		 render : '#assignUserGrid',
 		 columns : assignUserColumns,
 		 store : assignUserStore,
 		 idField : 'id'
 	 });
 	 assignUserGrid.render();
 	 
 	// 添加单元格点击事件
	assignUserGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		assignUserStore.remove(record);
    	}
	});
 	 
  	 // 绑定assignUsersBtn的点击事件
  	$("#assignUsersBtn").on("click", function() {
  		
  		var selectUsers = assignUserStore.getResult();
  		var selectUserIds = "";
  		for(var i = 0; i < selectUsers.length; i ++) {
  			selectUserIds += "," + selectUsers[i].id;
  		}
  		selectUserIds = selectUserIds.substring(1);
		var chooseUser = new ChooseUserDialog({
			contextPath:contextPath,
			userIds:selectUserIds,
			orgType:'${sessionScope.user.organization.type}',
			selectType:"1",//选择人员的类型，选择的是派发人员，还是抄送人员,1-派发人员，2-抄送人员
			selectedWorkAreaUser:selectedWorkAreaUser
		});
		chooseUser.show();
		chooseUser.on('sureBtn',function(e){
			// 设置派发人员表格数据
			var selectUsers = e.data;
			assignUserStore.setResult(selectUsers);
			chooseUser.close();
		});
  	});
  	 
  	function dialogClose(d){
		d.close();
		d = null;
	}
  	
  //查询分派接收人，回显再次分派弹出框
	function getAssignUserStore(id){
		$.ajax({
			url:contextPath + 'circuitWOAction/getCircuitWOById.cn',
			data:{id:id},
			type:'post',
			dataType:'json',
			async:false,
			success:function(data,status){
				assignUserStore.setResult(data.receiveUsers);
				$('#assignRemark').val(data.assignRemark);
				rootId = data.panrentTask.id;
				if(assinsOrgType == ORG_TYPE_CJ){//如果登录的是车间用户，则执行此方法
					selectedWorkAreaUserFun();
				}
			},
			error:function(){
				alert("加载分派接收人异常！");
			}
		});
	}
	
	//根据车间id和任务根节点id查询该车间下的所有要执行该任务的工区用户
	function selectedWorkAreaUserFun(){
		$.ajax({
			url:contextPath +  'toDoCircuitWOAction/checkSelectedWorkAreaUser.cn',
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
	getAssignUserStore(id);
  
});
	
</script>
</body>
</html>