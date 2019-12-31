<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>编辑数据</title>
<style type="text/css">
/*
* 为表单验证“！”悬浮到表单控件上提供绝对定位
* 使用方式：
* <div>
*	  <input type="text" id="replyDate" data-rules="{required:true}" style="width:96%;height:30px;" />
* </div>
*/
table td div {
	position:relative;
}

/*
* 表单验证“！”悬浮到表单控件上（水平居右，垂直居中）
*/
.x-icon-error {
	position: absolute;
	right:0px;
	top: 50%;
	margin-top:-7px;
}
</style>
</head>
<div id="updateDiv">
	<form id="updateForm">
		<table  width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td width="20%" align="right">备注：</td>
						<td height="100" colspan="3" style="padding:10px 0 0 0">
						<div>
						  <textarea id="remark" style="width:480px;height:118px;" data-rules="{maxlength:180}"></textarea>
						 </div>
						</td>
					</tr>
				  </table>
	</form>
</div>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	
	// 接收url中ID参数
	var deviceId = '${param.deviceId}';
	var remark = unescape('${param.remark}');
	
	var updateForm;
	var tips;

	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		if(tips == undefined) {
			tips = new Tooltip.Tips({
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
		updateForm = new Form.Form({
			srcNode : '#updateForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
	});
	
	$(document).ready(function() {
		$("#remark").val(remark);
	});
</script>
</body>
</html>