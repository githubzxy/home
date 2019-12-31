<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改工单</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	.userMask {
			z-index: 1100 !important;
	}
</style>
</head>
<body>
	<!-- 弹出框 -->
	<div id="content">
		<form class="form-horizontal" id="editForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th><font color="red">*</font>工单主题</th>
		            	<td colspan="3">
						<div>
							<input type="text" id="titleEdit"  style="width:98.3%;height:30px" data-rules="{required:true,maxlength:80}"/>
						</div>
						</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th><font color="red">*</font>联系人</th>
	            		<td>
	            			<div>
	            				<input type="text"  value="${sessionScope.user.name}" id="linkmanEdit"  style="width:98.3%;height:30px" disabled="disabled"/>
	            			</div>
		            	</td>
		            	<th><font color="red">*</font>完成期限</th>
		           		<td>
							<div>
								<input type="text" id="limitTimeEdit" class="calendar" data-rules="{required:true}" 
								style="width:96%;" readonly="readonly"/>
							</div>
						</td>
		            </tr>
		            <tr class="thTdPadding">
						<th><font color="red">*</font>执行人员</th>
		            	<td colspan="3">
			            	<div>
			            		<button type="button" id="receiveUsersEdit" class="button button-small" style="height: 30px;">添加接收人员</button>
			            	</div>
		            	</td>
	          		</tr>
	          	</tbody>	
	        </table>
	        
	        <div id="receiveUsersEditGrid" ></div>   		
	        
          	<table class="popUpTable">
				<tbody>	
		            <tr class="thTdPadding">
						<th><font color="red">*</font>工单类型</th>
		            	<td>
							<div>
								<select  id="taskTypeEdit" style="width:100%;height:30px" data-rules="{sele:''}">
			            			<option value="">请选择</option>
			            		</select>
							</div>
						</td>
	          		</tr>
	          		<tr class="thTdPadding" >
						<th>工单文件</th>
						<td colspan="3">
								<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
		            				<jsp:param name="width"  value="100%" />
		            			</jsp:include>
						</td>
					</tr>
					<tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea id="remarkEdit" style="width:98%;height:60px;" data-rules="{maxlength:500}"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
						<th>抄送</th>
		            	<td colspan="3">
			            	<div>
			            		<button type="button" id="carbonCopyEditBtn" class="button button-small" style="height: 30px;">添加抄送人员</button>
			            	</div>
		            	</td>
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
	var id= '${param.id}';
	
	var editReceiveStore;//接收人员store
	var editReceiveGrid;
	
	var editCopyStore;//抄送人员store
	var editCopyGrid;
	var chooseUser;//人员选择公用主键
	
	$(document).ready(function () {
		/**初始化下拉选*/	
		taskManage_orderType.listData("#taskTypeEdit");//初始化任务类别下拉选
		/**初始化弹出框*/
		
		//隐藏本页面单选框里的第一个空白框
		$("#editForm select option[value='']").hide();
	});
	
	//根据id获取当前选择任务并初始化
	function initEditDialog(id){
		$.ajax({
			url:contextPath + 'circuitWOAction/getCircuitWOById.cn',
			data:{id:id},
			type:'post',
			dataType:'json',
			async:false,
			success:function(data,status){
// 				console.log(data);
				$("#titleEdit").val(data.title);
				editReceiveStore.setResult(data.receiveUsers);
				$("#limitTimeEdit").val(data.limitTime);
				$("#taskTypeEdit").val(data.taskType);
				if(data.taskAttachFile != null){
					setUploadAttachFileId(data.taskAttachFile.id);
				}
				$("#remarkEdit").val(data.remark);
				editCopyStore.setResult(data.carbonCopyUser);
			},
			error:function(){}
		});
	}
	
	//再次点击清空时间
// 	$('#limitTimeEdit').on('click',(function(){
// 		$('#limitTimeEdit').val("");
// 	}));
	
	//获取对象参数（文本框和下拉选中的参数）
	function getParamAdd(){
		return {
			id:id,
			title : $("#titleEdit").val(),
			limitTime : $("#limitTimeEdit").val(),
			taskType : $("#taskTypeEdit").val(),
			remark : $("#remarkEdit").val()
		};
	}
	
	BUI.use(['bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'common/chooseExecuteUser/ChooseUserDialog'],
			function(Form, Tooltip, Grid, Data, ChooseUserDialog){
	//消息提示框
	if(editTips == undefined) {
		editTips = new Tooltip.Tips({
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
	
	//自定义验证规则，选择框必须选值
       Form.Rules.add({
           name : 'sele',  //规则名称
           msg : '请选择一个值',//默认显示的错误信息
           validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
             if(value==baseValue){
               return formatMsg;
             }
           }
       });
		
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
  		 renderer:function(value) {
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
  		 renderer:function(value) {
  			return '<span class="grid-command deleteBtn">删除</span>';
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
 	 
 // 添加单元格点击事件
	editCopyGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		editCopyStore.remove(record);
    	}
	});
 	 
    // 绑定点击事件
   	$("#carbonCopyEditBtn").on("click", function() {
		chooseUserDailog(editCopyStore,"2");
   		chooseUser.on('sureBtn',function(e){
			// 设置抄送人员表格数据
			var selectUsers = e.data;
			editCopyStore.setResult(selectUsers);
			chooseUser.close();
		});
   	});
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