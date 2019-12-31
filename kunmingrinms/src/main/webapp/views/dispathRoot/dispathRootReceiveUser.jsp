<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>调度命令变更执行人</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<form class="form-horizontal" id="receiveUserForm">
			<table class="popUpTable" >
				<tbody>
					<tr class="thTdPadding">
	           			<th style="width:90px">命令号：</th>
	            		<td>
	            			<div>
	            				<input type="text" name="number" id="number"
	            				 style="width:96%;height:30px" readonly="readonly">
	            				 <input type="hidden" id="numberId" />
	            			</div>
		            	</td>
	           			<th style="width:90px">日期：</th>
	            		<td>
	            			<div>
	            				<input type="text" name="nowTime" id="nowTime"
	            				 style="width:96%;height:30px" readonly="readonly">
	            			</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th>受令单位：</th>
		            	<td>
			            	<div>
			            		<input type="text" name="organizations" id="organizations" readonly="readonly"
	            				 style="width:96%;height:30px" placeholder="根据新增受理人，自动填充受理人所在部门" >
			            	</div>
		            	</td>
		            	<th>值班调度：</th>
	            		<td>
	            			<div>
	            				<input type="text" name="dispatchUser" id="dispatchUser"
	            				 style="width:96%;height:30px" readonly="readonly">
	            			</div>
		            	</td>
	            	</tr>
	          		<tr class="thTdPadding" style="border-top: 1px solid red">
	           			<th><font style="color: red">*</font>受理人：</th>
	            		<td colspan="3">
	            			<div>
			            		<button type="button" id="acceptUser" class="button button-small" 
			            		style="height: 30px;">新增受理人</button>
	            			</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
			<div id = "info_acceptUserGrid"></div>
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding" style="height: 30px">
	           			<th style="width:90px">抄送人列表：</th>
	           			<td></td>
	          		</tr>
	          	</tbody>
			</table>
			<div id = "info_copyUserGrid"></div>
			<table class="popUpTable">
				<tbody>
	          		<tr class="thTdPadding">
	           			<th style="width:60px;">命令内容：</th>
	            		<td colspan="3">
	            			<div>
			            		<textarea name="content" id="content" readonly="readonly"
			            		style="width:98%;height:60px;resize:none;">
			            		</textarea>
	            			</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding" style="height: 60px">
	          			<th>附件：</th>
	            		<td colspan="5">
	            			<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
								<jsp:param name="width" value="100%" />
								<jsp:param name="height" value="100%" />
							</jsp:include>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
						<th>命令签发者：</th>
		            	<td >
			            	<div>
			            		<input type="text" name="issueUser" id="issueUser" readonly="readonly"
	            				 style="width:96%;height:30px">
			            	</div>
		            	</td>
						<th style="width:90px">发令者姓名：</th>
		            	<td>
			            	<div>
			            		<input type="text" name="sendUser" id="sendUser"
	            				 style="width:96%;height:30px" value="${sessionScope.user.name}" readonly="readonly">
			            	</div>
		            	</td>
	            	</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">

var contextPath = '<%=contextPath%>' + '/';
var id = '<%=request.getParameter("id")%>';

var editAcceptUserStore; // 受理人
var editcceptUserGrid;
var editCopyUserStore; // 抄送人
var editCopyUserGrid;

function initPage() {
	$.post(contextPath + "dispatchRootAction/getDispatchRootById.cn",
		{
			id : id
		},function(item){
			//console.log(item);
			$("#receiveUserForm #numberId").val(item.id);
			$("#receiveUserForm #number").val(item.dispatchNum);
			$("#receiveUserForm #nowTime").val(item.createDate);
			$("#receiveUserForm #organizations").val(item.organization);
			$("#receiveUserForm #dispatchUser").val(item.dispatchUser);
			editAcceptUserStore.setResult(item.acceptUser);
			editCopyUserStore.setResult(item.copyUser);
			$("#receiveUserForm #content").val(item.suggestion);
			$("#receiveUserForm #issueUser").val(item.issueUser);
			if(item.attachFile != null){
				setAttachFileId(item.attachFile.id);
			}
		},
		'json');
}

BUI.use(['bui/grid', 'bui/data', 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Grid, Data, ChooseUserDialog){
	
	editAcceptUserStore = new Data.Store({
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
		width : '227',
		renderer:function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		 }
	},{
		title : '操作',
		elCls : 'center',
		width : '160',
		sortable : false,
		renderer : function(value) {
			return '<span class="grid-command delBtn">删除</span>';
		}
	}];
		 
	editAcceptUserGrid = new Grid.Grid({
		render : '#info_acceptUserGrid',
		columns : columns,
		store : editAcceptUserStore,
		idField : 'id',
		plugins : [Grid.Plugins.RowNumber],
	});
	editAcceptUserGrid.render();
	
	// 添加单元格点击事件
	editAcceptUserGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget); //点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('delBtn')) {
    		// 移除该行
    		editAcceptUserStore.remove(record);
    		// 获取剩余的受令单位
    		var selectUsers = editAcceptUserStore.getResult();
    		getOrganizations(selectUsers);
    	}
	});
	
	editCopyUserStore = new Data.Store({
		autoLoad : true,
    });
	
	initPage();
	var columnsCopyUser = [{
		title : '姓名',
		elCls : 'center',
		dataIndex :'name',
		width : '250',
		sortable : false,	// 表头不排序
	},{
		title : '单位',
		elCls : 'center',
		dataIndex :'organization',
		sortable : false,
		width : '330',
		renderer:function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		 }
	}];
	 
	editCopyUserGrid = new Grid.Grid({
		render : '#info_copyUserGrid',
		columns : columnsCopyUser,
		store : editCopyUserStore,
		idField : 'id',
		plugins : [Grid.Plugins.RowNumber],
	});
	editCopyUserGrid.render();
	
	// 添加单元格点击事件
	editCopyUserGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget); //点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		editCopyUserStore.remove(record);
    	}
	});
	
	// 绑定acceptUser的点击事件
	$("#acceptUser").on("click", function() {
		var selectUsers = editAcceptUserStore.getResult();
  		var selectUserIds = "";
  		for(var i = 0; i < selectUsers.length; i ++) {
  			selectUserIds += "," + selectUsers[i].id;
  		}
   		selectUserIds = selectUserIds.substring(1);
		var chooseUser = new ChooseUserDialog({
			contextPath : contextPath,
			userIds : selectUserIds,
			orgType : '${sessionScope.user.organization.type}'
		});
		chooseUser.show();
		chooseUser.on('sureBtn',function(e){
			// 设置执行人员表格数据
			var selectUsers = e.data;
			editAcceptUserStore.setResult(selectUsers);
			getOrganizations(selectUsers);
			chooseUser.close();
		});
	});
	
	// 获取受令单位
	function getOrganizations(selectUsers){
		var strArr = new Array();
		for(var i = 0;i < selectUsers.length;i++){
			strArr.push(selectUsers[i].organization.name);
		}
		strArr.sort();
		var organization = "";
		var tempStr = "";
		for(var i=0;i<strArr.length;i++){
			if(strArr[i] != tempStr){
				tempStr = strArr[i];
				organization += "," + tempStr;
			}
		}
		$('#organizations').val(organization.substring(1));
	}
	
	// 绑定copyUser的点击事件
	$("#copyUser").on("click", function() {
		var selectUsers = editCopyUserStore.getResult();
  		var selectUserIds = "";
  		for(var i = 0; i < selectUsers.length; i ++) {
  			selectUserIds += "," + selectUsers[i].id;
  		}
   		selectUserIds = selectUserIds.substring(1);
		var chooseUser = new ChooseUserDialog({
			contextPath : contextPath,
			userIds : selectUserIds,
			orgType : '${sessionScope.user.organization.type}',
			selectType : '2'
		});
		chooseUser.show();
		chooseUser.on('sureBtn',function(e){
			// 设置执行人员表格数据
			var selectUsers = e.data;
			editCopyUserStore.setResult(selectUsers);
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

</script>
</body>
</html>