<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改调度命令</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	}
</style>
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<form class="form-horizontal" id="editForm">
			<table class="popUpTable" >
				<tbody>
					<tr class="thTdPadding">
	           			<th style="width:90px"><s>*</s>命令号：</th>
	            		<td colspan="3">
	            			<div>
	            				<input type="text" name="number" id="number" data-rules="{maxlength:250,required:true}"
	            				 style="width:96%;height:30px">
	            				 <input type="hidden" id="numberId" />
	            			</div>
		            	</td>
		             </tr>
		            <tr class="thTdPadding">
		            	<th><s>*</s>完成期限</th>
						<td style="height:30px">
							<div>
								<input type="text" name="deadLine" id="deadLine" class="calendar calendar-time"
		            				 style="width:96%;" data-rules="{required:true}" readonly="readonly">
							</div>
						</td>
	           			<th style="width:90px"><s>*</s>日期：</th>
	            		<td>
	            			<div>
	            				<input type="text" name="nowTime" id="nowTime" data-rules="{required:true}"
	            				 style="width:96%;height:30px" readonly="readonly">
	            			</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th><s>*</s>受令单位：</th>
		            	<td>
			            	<div>
			            		<input type="text" name="organizations" id="organizations" data-rules="{required:true}"
	            				 style="width:96%;height:30px" placeholder="根据新增受理人，自动填充受理人所在部门" disabled="disabled">
			            	</div>
		            	</td>
		            	<th><s>*</s>值班调度：</th>
	            		<td>
	            			<div>
	            				<input type="text" name="dispatchUser" id="dispatchUser" data-rules="{maxlength:250,required:true}"
	            				 style="width:96%;height:30px">
	            			</div>
		            	</td>
	            	</tr>
	          		<tr class="thTdPadding" style="border-top: 1px solid red">
	           			<th><s>*</s>受理人：</th>
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
					<tr class="thTdPadding">
	           			<th style="width:90px">抄送人：</th>
	            		<td>
	            			<div>
			            		<button type="button" id="copyUser" class="button button-small" 
			            		style="height: 30px;">新增抄送人</button>
	            			</div>
		            	</td>
	          		</tr>
	          	</tbody>
			</table>
			<div id = "info_copyUserGrid"></div>
			<table class="popUpTable">
				<tbody>
	          		<tr class="thTdPadding">
	           			<th style="width:90px;"><s>*</s>命令内容：</th>
	            		<td colspan="3">
	            			<div>
			            		<textarea name="content" id="content" data-rules="{maxlength:900,required:true}" 
			            		data-messages="{required:'请输入命令内容'}" style="width:98%;height:90px;resize:none;">
			            		</textarea>
	            			</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>附件：</th>
	            		<td  colspan="5">
	            			<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true" >
		            			<jsp:param name="width"  value="100%" />
								<jsp:param name="height"  value="100%" />
	            			</jsp:include>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
						<th><s>*</s>命令签发者：</th>
		            	<td >
			            	<div>
			            		<input type="text" name="issueUser" id="issueUser" data-rules="{maxlength:250,required:true}"
	            				 style="width:96%;height:30px">
			            	</div>
		            	</td>
						<th style="width:90px"><s>*</s>发令者姓名：</th>
		            	<td>
			            	<div>
			            		<input type="text" name="sendUser" id="sendUser" data-rules="{required:true}"
	            				 style="width:96%;height:30px" value="${sessionScope.user.name}" disabled="disabled">
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
var editForm; //弹出新增窗口
var addTips;

var editAcceptUserStore; // 受理人
var editcceptUserGrid;
var editCopyUserStore; // 抄送人
var editCopyUserGrid;

$(document).ready(function () {
	
});

function initPage() {
	$.post(contextPath + "dispatchRootAction/getDispatchRootById.cn",
		{
			id : id
		},function(item){
			$("#editForm #numberId").val(item.id);
			$("#editForm #number").val(item.dispatchNum);
			$("#editForm #nowTime").val(item.createDate);
			$("#editForm #organizations").val(item.organization);
			$("#editForm #deadLine").val(item.deadLine);
			$("#editForm #dispatchUser").val(item.dispatchUser);
			$("#editForm #content").val(item.suggestion);
			$("#editForm #issueUser").val(item.issueUser);
			editAcceptUserStore.setResult(item.acceptUser);
			editCopyUserStore.setResult(item.copyUser);
			if(item.attachFile != null){
				setUploadAttachFileId(item.attachFile.id);
			}
		},
		'json');
}

BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'common/chooseExecuteUser/ChooseUserDialog'],
		function(Uploader, Calendar, Form, Tooltip, Grid, Data, ChooseUserDialog){
	var alert = BUI.Message.Alert;//使用bui的消息提示框
	//消息提示框
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
	editForm = new Form.Form({
		srcNode : '#editForm',
		errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
	}).render();
	
	//日历时间
	var datepickerStart = new Calendar.DatePicker({
		trigger : '#nowTime',
		showTime : true,
		autoRender : true
	});
	
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
	
	var columnsCopyUser = [{
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
		sortable : false,
		width : '160',
		renderer:function(value) {
			return '<span class="grid-command deleteBtn">删除</span>';
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
	initPage();
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
	
	//开始上传时
	uploader.on('start',function(e){
		$(".btn-save").attr("disabled","disabled");
		$(".btn-save-send").attr("disabled","disabled");
	});
	
	//上传成功时
	uploader.on('success',function(e){
		$(".btn-save").removeAttr("disabled");
		$(".btn-save-send").removeAttr("disabled","disabled");
	});
	
	//取消上传时
	uploader.on('cancel',function(e){
		$(".btn-save").removeAttr("disabled");
		$(".btn-save-send").removeAttr("disabled","disabled");
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