<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>审核任务</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />

</head>
<body>
	<div>
		<form class="form-horizontal" id="checkForm">
			<table class="popUpTable" id="checkFileTable">
				<tbody>
	          		<tr class="thTdPadding">
						<th><font color="red">*</font>审核附件<br>上传</th>
						<td colspan="3">
								<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
		            				<jsp:param name="width"  value="100%" />
									<jsp:param name="height"  value="90px" />
		            			</jsp:include>
						</td>
					</tr>
	          	</tbody>
			</table>
			<table class="popUpTable" id="checkMsgTable">
				<tbody>
					<tr class="thTdPadding">
		           		<th><font color="red">*</font>审核意见</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea  id="checkMsg"  data-rules="{required:true,maxlength:255}"  style="width:98.3%;height:90px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          	</tbody>
			</table>
		</form>
	</div>
		
<script type="text/javascript">

var handleStatus= '${param.handleStatus}';//处理状态（审核通过、审核不通过）

var checkForm; //弹出新增窗口
var checkTips;

//根据点击的按钮不同，显示或隐藏相应的内容
$(document).ready(function () {
	if(handleStatus==taskManage_status.shenHeTongGuo){//点击【审核通过】按钮
		$("#checkMsgTable").hide();
		checkDialog.set('title','审核通过');
	}
	if(handleStatus==taskManage_status.shenHeBuTongGuo){
		$("#checkFileTable").hide();
		checkDialog.set('title','审核不通过');
	}
});

BUI.use(['bui/uploader', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay'],
		function(Uploader, Form, Tooltip, Grid, Data, Overlay){
	
	//消息提示框
	if(checkTips == undefined) {
		checkTips = new Tooltip.Tips({
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
	checkForm = new Form.Form({
		srcNode : '#checkForm',
		errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
	}).render();
	
});


			

</script>
</body>
</html>