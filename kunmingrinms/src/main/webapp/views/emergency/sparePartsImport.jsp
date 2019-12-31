<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>导入应急备品管理</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	}
</style>
</head>
<body style="overflow: hidden;">
	<div id="content">
		<form class="form-horizontal" id="uploadForm"action="/kunmingrinms/sparePartAction/importData.cn" method="post" enctype="multipart/form-data">
			<table class="popUpTable">
				<tbody>
		            <tr class="thTdPadding">
						<th>标准模板：</th>
		            	<td colspan="3">
	            			<div>
	            				<input id="downLoad" type = "button"  value="模板下载" style="width:20%;height:30px"/>
	            				<span id="infor"><s>注：请按应急备品管理模板导入,只能导入excel文件</s></span>
	            			</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th><s>*</s>附件：</th>
	            		<td colspan="3" id="uploadData" style="height:100px;">
							<input type="file" name="file" value="上传"/>
							<input type="hidden" name="threePerId" id="threePerId"/>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>

<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var uploadForm; //弹出新增窗口
	var addTips;
	$("#threePerId").val(perId);
	$("#downLoad").on('click',function(){
		window.location.href = contextPath+'Template/spareParts/sparePartsEmergency_Template_1.xls';
	});
	
</script>
</body>
</html>