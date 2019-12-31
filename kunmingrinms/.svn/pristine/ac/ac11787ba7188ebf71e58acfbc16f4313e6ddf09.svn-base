<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待办调令回复</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<form class="form-horizontal" id="replyForm">
			<table class="popUpTable">
				<tbody>
	          		<tr class="thTdPadding">
	          			<th>附件：</th>
	            		<td>
	            			<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true" >
		            			<jsp:param name="width"  value="100%" />
								<jsp:param name="height"  value="80px" />
	            			</jsp:include>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	           			<th><font style="color: red">*</font>回复内容：</th>
	            		<td>
	            			<div>
			            		<textarea name="replyContent" id="replyContent" data-rules="{maxlength:900,required:true}" 
			            		data-messages="{required:'请输入回复内容'}" style="width:97%;height:80px;resize:none;"></textarea>
	            			</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">

	var contextPath = '<%=contextPath%>' + '/';
	var replyForm; //弹出回复窗口
	var addTips;

	BUI.use(['bui/uploader', 'bui/form', 'bui/tooltip'],
			function(Uploader, Form, Tooltip){
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
		replyForm = new Form.Form({
			srcNode : '#replyForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
	});
</script>
</body>
</html>