<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>提问回答页面</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<div id="answerQuestionDiv">
	<div class="row" style="padding-top: 10px;">
		<div class="control-group span24">
			<label class="control-label">历史问答：</label>
			<div class="controls">
				<textarea id="answerQuestion" class="input-large" style="width:500px;height:200px;" disabled="disabled"></textarea>
			</div>
		</div>
	</div>
	
	<div class="row" style="padding-top: 10px;">
		<div class="control-group span24">
			<label class="control-label">内容输入框：</label>
			<div class="controls">
				<textarea id="problem" class="input-large" maxlength="250" style="width:500px;height:100px;"></textarea>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var workOrderTransactorId = '${param.workOrderTransactorId}';

$(document).ready(function () {
	
	initPage();
});

function initPage() {
	$.post(contextPath + 'workOrderTransactorAction/getById.cn',
			{
				workOrderTransactorId : workOrderTransactorId,
			},function(data,status){
				
				$("#answerQuestionDiv #answerQuestion").html(data.problem);
				// textarea的滚动条始终保持在最下方
				var scrollHeight = $("#answerQuestionDiv #answerQuestion")[0].scrollHeight;  
                   $("#answerQuestionDiv #answerQuestion").scrollTop(scrollHeight);
			}, 'json');
}

</script>
</body>
</html>