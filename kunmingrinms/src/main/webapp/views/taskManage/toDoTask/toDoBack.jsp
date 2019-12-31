<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待办任务退回</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />

</head>
<body>
	<!-- 弹出编辑框 -->
	<div>
		<form class="form-horizontal" id="backForm">
			<table class="popUpTable">
				<tbody>
	          		<tr class="thTdPadding">
		           		<th><font color="red">*</font>退回意见</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea  id="sendBackRemark"  data-rules="{required:true,maxlength:200}"  style="width:98.3%;height:90px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          	</tbody>
			</table>
		</form>
	</div>
		
<script type="text/javascript">
var backForm;
var backTips;

BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay'],
		function(Uploader, Calendar, Form, Tooltip, Grid, Data, Overlay){
	//消息提示框
	if(backTips == undefined) {
		backTips = new Tooltip.Tips({
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
	backForm = new Form.Form({
		srcNode : '#backForm',
		errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
	}).render();
	
});
</script>
</body>
</html>