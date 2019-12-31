<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建任务</title>
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
		<form class="form-horizontal" id="addForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th><font color="red">*</font>任务标题</th>
		            	<td colspan="3">
						<div>
							<input type="text" id="titleAdd"  style="width:98.3%;height:30px" data-rules="{required:true,maxlength:80}"/>
						</div>
						</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th><font color="red">*</font>联系人</th>
	            		<td>
	            			<div>
	            				<input type="text"  value="${sessionScope.user.name}" id="linkmanAdd"  style="width:98.3%;height:30px" disabled="disabled"/>
	            			</div>
		            	</td>
		            	<th><font color="red">*</font>完成期限</th>
		           		<td>
							<div>
								<input type="text" id="limitTimeAdd" class="calendar" data-rules="{required:true}"
								 style="width:96%;" readonly="readonly"/>
							</div>
						</td>
		            </tr>
		            <tr class="thTdPadding">
						<th><font color="red">*</font>接收人员</th>
		            	<td colspan="3">
			            	<div>
			            		<button type="button" id="receiveUsersAdd" class="button button-small" style="height: 30px;">添加接收人员</button>
			            	</div>
		            	</td>
	          		</tr>
	          	</tbody>	
	        </table>
	        
	        <div id="receiveUsersAddGrid"></div>   		
	        
          	<table class="popUpTable">
				<tbody>	
		            <tr class="thTdPadding">
						<th><font color="red">*</font>任务类别</th>
		            	<td>
							<div>
								<select  id="taskTypeAdd" style="width:100%;height:30px" data-rules="{sele:''}">
			            			<option value="">请选择</option>
			            		</select>
							</div>
						</td>
		           		<th><font color="red">*</font>紧急程度</th>
		           		<td>
							<div>
								<select  id="taskLevelAdd" style="width:100%;height:30px" data-rules="{sele:''}">
			            			<option value="">请选择</option>
			            		</select>
							</div>
						</td>
	          		</tr>
	          		<tr class="thTdPadding" >
						<th>任务方案</th>
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
		            			<textarea id="remarkAdd" style="width:98%;height:60px;" data-rules="{maxlength:500}"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
						<th>抄送</th>
		            	<td colspan="3">
			            	<div>
			            		<button type="button" id="carbonCopyAddBtn" class="button button-small" style="height: 30px;">添加抄送人员</button>
			            	</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
			<div id="carbonCopyAddGrid" ></div>
		</form>
	</div>
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var addForm; //弹出新增窗口
	var addTips;
	
	var addReceiveStore;//接收人员store
	var addReceiveGrid;
	
	var addCopyStore;//抄送人员store
	var addCopyGrid;
	
	var chooseUser;//人员选择公用主键
	
	//再次点击清空时间
// 	$('#limitTimeAdd').on('click',(function(){
// 		$('#limitTimeAdd').val("");
// 	}));
	
	//获取对象参数（文本框和下拉选中的参数）
	function getParamAdd(){
		return {
			title : $("#titleAdd").val(),
// 			linkman : $("#linkmanAdd_hidden").val(),
			limitTime : $("#limitTimeAdd").val(),
			taskType : $("#taskTypeAdd").val(),
			taskLevel : $("#taskLevelAdd").val(),
			remark : $("#remarkAdd").val()
		};
	}
	
	BUI.use(['bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'common/chooseExecuteUser/ChooseUserDialog'],
			function(Form, Tooltip, Grid, Data, ChooseUserDialog){
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
	addForm = new Form.Form({
		srcNode : '#addForm',
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
	
     var addReceiveColumns = [{
  		 title : '姓名',
  		 elCls : 'center',
  		 dataIndex :'name',
  		 width:'200',
  		 sortable : false// 表头不排序
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
     addReceiveStore = new Data.Store({
         autoLoad:true
     });
     
  	 addReceiveGrid = new Grid.Grid({
  		 render : '#receiveUsersAddGrid',
  		 columns : addReceiveColumns,
  		 store : addReceiveStore,
  		 idField : 'id',
  		 plugins : [Grid.Plugins.RowNumber]
  	 });
  	 addReceiveGrid.render();
  	 
  // 添加单元格点击事件
 	addReceiveGrid.on('cellclick',function(ev) {
 		target = $(ev.domTarget);		//点击的元素
 		var record = ev.record;	//点击行的记录
     	if(target.hasClass('deleteBtn')) {
     		addReceiveStore.remove(record);
     	}
 	});
  	 
   	 // 绑定receiveUsersAdd的点击事件
   	$("#receiveUsersAdd").on("click", function() {
   		chooseUserDailog(addReceiveStore,"1");
		chooseUser.on('sureBtn',function(e){
			// 设置执行人员表格数据
			var selectUsers = e.data;
			addReceiveStore.setResult(selectUsers);
			chooseUser.close();
		});
   	});
   	/**接收人表格结束*/
   	 
   	
   	/**抄送人表格开始*/
   	 var addCopyColumns = [{
  		 title : '姓名',
  		 elCls : 'center',
  		 dataIndex :'name',
  		 width:'200',
  		 sortable : false// 表头不排序
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
   	
    addCopyStore = new Data.Store({
        autoLoad:true
    });
    
 	 addCopyGrid = new Grid.Grid({
 		 render : '#carbonCopyAddGrid',
 		 columns : addCopyColumns,
 		 store : addCopyStore,
 		 idField : 'id',
 		 plugins : [Grid.Plugins.RowNumber]
 	 });
 	 addCopyGrid.render();
 	 
 // 添加单元格点击事件
	addCopyGrid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('deleteBtn')) {
    		addCopyStore.remove(record);
    	}
	});
 	 
    // 绑定carbonCopyAddBtn的点击事件
   	$("#carbonCopyAddBtn").on("click", function() {
   		chooseUserDailog(addCopyStore,"2");
		chooseUser.on('sureBtn',function(e){
			// 设置抄送人员表格数据
			var selectUsers = e.data;
			addCopyStore.setResult(selectUsers);
			chooseUser.close();
		});
   	});
   	/**抄送人表格结束*/	
		
   	function dialogClose(d){
		d.close();
		d = null;
	}
   	
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
			selectType:selectType
		});
		chooseUser.show();
    }
   	
	//BUI结束
	});
	
	$(document).ready(function () {
		/**初始化下拉选*/	
		taskManage_taskType.listData("#taskTypeAdd");//初始化任务类别下拉选
		taskManage_taskLevel.listData("#taskLevelAdd");//初始化紧急程度下拉选
		//隐藏本页面单选框里的第一个空白框
		$("#addForm select option[value='']").hide();
	});
	
</script>
</body>
</html>