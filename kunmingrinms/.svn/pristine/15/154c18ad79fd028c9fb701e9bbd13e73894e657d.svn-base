<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>任务变更执行人</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body>
	<!-- 弹出框 -->
	<div id="content">
		<form class="form-horizontal" id="receiveUserForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th>任务标题</th>
		            	<td colspan="3">
						<div>
							<input type="text" id="titleEdit" style="height:30px" readonly="readonly"/>
						</div>
						</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>联系人</th>
	            		<td>
	            			<div>
	            				<input type="text" value="${sessionScope.user.name}" style="height:30px"
	            				 readonly="readonly"/>
	            			</div>
		            	</td>
		            	<th>完成期限</th>
		           		<td>
							<div>
								<input type="text" id="limitTimeEdit" style="height:30px;" readonly="readonly"/>
							</div>
						</td>
		            </tr>
		            <tr class="thTdPadding">
						<th><font color="red">*</font>接收人员</th>
		            	<td colspan="3">
			            	<div>
			            		<button type="button" id="receiveUsersEdit" class="button button-small"
			            		 style="height: 30px;">添加接收人员</button>
			            	</div>
		            	</td>
	          		</tr>
	          	</tbody>	
	        </table>
	        <div id="receiveUsersEditGrid"></div>   		
          	<table class="popUpTable">
				<tbody>	
		            <tr class="thTdPadding">
						<th>任务类别</th>
		            	<td>
							<div>
			            		<input type="text" id="taskTypeEdit" style="width:100%;height:30px"
			            		 readonly="readonly"/>
							</div>
						</td>
		           		<th>紧急程度</th>
		           		<td>
							<div>
			            		<input type="text" id="taskLevelEdit" style="width:100%;height:30px"
			            		 readonly="readonly"/>
							</div>
						</td>
	          		</tr>
	          		<tr class="thTdPadding"  style="height: 60px">
						<th>任务方案</th>
						<td colspan="3">
							<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
								<jsp:param name="width" value="100%" />
								<jsp:param name="height" value="100%" />
							</jsp:include>
						</td>
					</tr>
					<tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea id="remarkEdit" style="width:98%;height:60px;resize:none;"
		            			 readonly="readonly"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
						<th>抄送列表</th>
		            	<td colspan="3" style="height: 30px"></td>
	          		</tr>
				</tbody>
			</table>
			<div id="carbonCopyEditGrid" ></div>
		</form>
	</div>
	
<script type="text/javascript">

var contextPath = '<%=contextPath%>' + '/';
var editForm; //弹出新增窗口
var editTips;
var id = '${param.id}';

var editReceiveStore;//接收人员store
var editReceiveGrid;

var editCopyStore;//抄送人员store
var editCopyGrid;
var chooseUser;//人员选择公用主键

//根据id获取当前选择任务并初始化
function initEditDialog(id){
	$.ajax({
		url:contextPath + 'taskRootAction/getTaskById.cn',
		data:{id:id},
		type:'post',
		dataType:'json',
		async:false,
		success:function(data,status){
// 			console.log(data);
			$("#titleEdit").val(data.title);
			editReceiveStore.setResult(data.receiveUsers);
			$("#limitTimeEdit").val(data.limitTime);
			$("#taskTypeEdit").val(taskManage_taskType.typeName(data.taskType));
			$("#taskLevelEdit").val(taskManage_taskLevel.typeName(data.taskLevel));
			if(data.taskAttachFile != null){
				setAttachFileId(data.taskAttachFile.id);
			}
			$("#remarkEdit").val(data.remark);
			editCopyStore.setResult(data.carbonCopyUser);
		},
		error:function(){}
	});
}

//获取对象参数（文本框和下拉选中的参数）
function getParamAdd(){
	return {
		id:id,
		title : $("#titleEdit").val(),
		limitTime : $("#limitTimeEdit").val(),
		taskType : $("#taskTypeEdit").val(),
		taskLevel : $("#taskLevelEdit").val(),
		remark : $("#remarkEdit").val()
	};
}

BUI.use(['bui/grid', 'bui/data', 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Grid, Data, ChooseUserDialog){

    var editReceiveColumns = [{
 		 title : '姓名',
 		 elCls : 'center',
 		 dataIndex :'name',
 		 width:'200',
 		 sortable : false	// 表头不排序
 	 },{
 		 title : '单位',
 		 elCls : 'center',
 		 dataIndex :'organization',
 		 sortable : false,
 		 width:'200',
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
 		 width:'176',
 		 renderer:function(value,obj) {
	 		return '<span class="grid-command deleteBtn">删除</span>';
 		 }
 	 }];

    /**接收人表格开始*/
    editReceiveStore = new Data.Store({
        autoLoad:true
    });
     
 	 editReceiveGrid = new Grid.Grid({
 		 render : '#receiveUsersEditGrid',
 		 columns : editReceiveColumns,
 		 store : editReceiveStore,
 		 idField : 'id',
 		 plugins : [Grid.Plugins.RowNumber]
 	 });
 	 editReceiveGrid.render();
 	
	 // 添加单元格点击事件
	editReceiveGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		editReceiveStore.remove(record);
    	}
	});
 	 
  	 // 绑定点击事件
  	$("#receiveUsersEdit").on("click", function() {
	chooseUserDailog(editReceiveStore,"1");
  		chooseUser.on('sureBtn',function(e){
		// 设置派发人员表格数据
		var selectUsers = e.data;
		editReceiveStore.setResult(selectUsers);
		chooseUser.close();
	});
  	});
  	/**接收人表格结束*/
  	
  	/**抄送人表格开始*/
  	 var editCopyColumns = [{
 		 title : '姓名',
 		 elCls : 'center',
 		 dataIndex :'name',
 		 width:'250',
 		 sortable : false	// 表头不排序
 	 },{
 		 title : '单位',
 		 elCls : 'center',
 		 dataIndex :'organization',
 		 sortable : false,
 		 width:'330',
 			renderer:function(value) {
 				if(value != null) {
 					return value.name;
 				}
 				return "";
 			 }
 	 }];
  	
   editCopyStore = new Data.Store({
       autoLoad:true
   });
   
	 editCopyGrid = new Grid.Grid({
		 render : '#carbonCopyEditGrid',
		 columns : editCopyColumns,
		 store : editCopyStore,
		 idField : 'id',
		 plugins : [Grid.Plugins.RowNumber]
	 });
	 editCopyGrid.render();
	 
   //人员选择弹出框的创建
   function chooseUserDailog(userStore,selectType){
   	var selectUsers = userStore.getResult();
  		var selectUserIds = "";
  		for(var i = 0; i < selectUsers.length; i ++) {
  			selectUserIds += "," + selectUsers[i].id;
  		}
  		selectUserIds = selectUserIds.substring(1);
	chooseUser = new ChooseUserDialog({
		contextPath:contextPath,
		userIds:selectUserIds,
		orgType:'${sessionScope.user.organization.type}',
		selectType:selectType//选择人员的类型，选择的是派发人员，还是抄送人员,1-派发人员，2-抄送人员
	});
	chooseUser.show();
   }
  	/**抄送人表格结束*/	
	
  	function dialogClose(d){
	d.close();
	d = null;
}
  	
  	initEditDialog(id);
  	
//BUI结束
});

</script>
</body>
</html>