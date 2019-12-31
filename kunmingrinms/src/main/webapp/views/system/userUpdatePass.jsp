<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
<style type="text/css">
s{
	color: red;
}
</style>
</head>
<body>
<div style="padding: 20px">
	<form id="updatePassForm" class="form-horizontal">
		<div class="row">
        	<div class="control-group span8">
				<label class="control-label"><s>*</s>新密码：</label>
				<div class="controls">
					<input type="password" id="password" class="input-normal control-text"
	              	 data-rules="{maxlength:100,required : true}"/>
				</div>
			</div>
				<div class="control-group span8">
				<label class="control-label"><s>*</s>确认新密码：</label>
				<div class="controls">
					<input type="password" id="newPassword" class="input-normal control-text"
	              	 data-rules="{required : true, equalTo:'#password'}"/>
				</div>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript">
	
var contextPath = '<%=contextPath%>' + '/';
var id = '<%=request.getParameter("id")%>';
var updatePassForm; //弹出新增窗口
var updatePassTips;

BUI.use(['bui/form', 'bui/tooltip'], function(Form, Tooltip){
	//消息提示框
	if(updatePassTips == undefined) {
		updatePassTips = new Tooltip.Tips({
	        tip : {
	          trigger : '.x-icon-error', //出现此样式的元素显示tip
	          alignType : 'right', //默认方向
	          elCls : 'tips tips-warning tips-no-icon tip1',
	          elStyle : {
	        	  display : 'none'
	          },
	          zIndex : '2000',
	          offset : 10 //距离左边的距离
	        }
	      }).render();
		
		var tip = updatePassTips.get('tip');
		tip.set('elStyle', {left : '0px', top : '0px'});
	}
	
	// 渲染BUIForm，用于表单元素验证
	updatePassForm = new Form.Form({
		srcNode : '#updatePassForm',
		errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
	}).render();
	
});

</script>
</body>
</html>