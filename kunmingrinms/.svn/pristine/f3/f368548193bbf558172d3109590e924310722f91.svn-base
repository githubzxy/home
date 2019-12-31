<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>工单归档</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<table class="popUpTable">
			<tr class="thTdPadding" >
				<th>总结</th>
				<td colspan="3"><textarea id="summary" style="width: 98.3%; min-height: 80px;"></textarea></td>
			</tr>
			<tr class="thTdPadding" >
				<th>附件</th>
					<td colspan="3">
							<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
	            				<jsp:param name="width"  value="100%" />
								<jsp:param name="height"  value="100px" />
	            			</jsp:include>
					</td>
			</tr>
		</table>
		<div id = "assignGrid"></div>
	</div>
</body>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

</script>
</html>