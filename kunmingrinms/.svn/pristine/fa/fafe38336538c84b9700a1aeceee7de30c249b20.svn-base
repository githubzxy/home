<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>导入停机计划</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body style="overflow: hidden;">
	<div id="content">
		<form class="form-horizontal" id="importForm" action="<%=contextPath%>/commNetStopAction/importData.cn" method="post" enctype="multipart/form-data" >
			<input type="hidden" id="perId" name="perId"/>
			<table class="popUpTable">
				<tbody>
		            <tr class="thTdPadding">
						<th>标准模板：</th>
		            	<td>
	            			<div>
	            				<input class="button button-small" id="downLoad" type="button" value="停机计划模板下载" style="width:100%;height:30px">
	            			</div>
		            	</td>
		            	<td colspan="2">
	            			<div>
	            				<input id="infor" type="text" value="注：请按维修计划模板导入"
	            				style="color:red;width:96.8%;height:30px;text-align: center;" readonly>
	            			</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding" style="height: 100px">
	          			<th><span style="color: red">*</span>附件：</th>
	            		<td colspan="3">
	            			<input type="file" id="importFile" name="myFile"  style="width:100%" />
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>

<script type="text/javascript">
	
var contextPath = '<%=contextPath%>' + '/';

$("#downLoad").on('click',function(){
	window.location.href = contextPath+'Template/stopPlanTemplate.xls';
});
	
</script>
</body>
</html>