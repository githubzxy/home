<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>子调度命令详细信息</title>
<style type="text/css">
td{
	word-break:break-all;
}
</style>
</head>
<body>
	<div id="showFormChild" style="height: 100%; overflow-x: hidden;">
		<form class="form-horizontal" id="showFormChild">
			<table class="popUpTable">
				<tbody>
					<tr>
						<th>命令号：</th>
						<td id="dispatchNum"></td>
						<th>创建时间：</th>
						<td id="createDate"></td>
					</tr>
					<tr>
						<th>受理人：</th>
						<td id="acceptUser"></td>
						<th>受理时间：</th>
						<td id="acceptDate"></td>
					</tr>
					<tr>
						<th>回复人：</th>
						<td id="replyUser"></td>
						<th>回复时间：</th>
						<td id="replyDate"></td>
					</tr>
					<tr>
						<th style="height: 56px">回复内容：</th>
						<td id="replyContent" colspan="3" style="word-break:break-all;"></td>
					</tr>
					<tr style="height: 60px">
						<th>回复附件：</th>
						<td id="downloadFile" colspan="3">
							<div>
								<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
									<jsp:param name="width"  value="100%" />
									<jsp:param name="height"  value="100%" />
								</jsp:include>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	var id = '<%=request.getParameter("id")%>';
	
	var showStore;
	var showGrid;

	$(document).ready(function() {
		showData();
	});

 	function showData() {
 		// 执行提交到数据库的方法
		$.ajax({
			url : contextPath + "dispatchRootAction/getDispatchRootById.cn",
			type : "post",
			data : {
				id : id
				},
			dataType : "json",
			success : function(item){
				//console.log(item);
				$("#showFormChild #dispatchNum").html(item.dispatchNum);
				$("#showFormChild #createDate").html(item.createDate);
				$("#showFormChild #acceptUser").html(item.user.name);
				$("#showFormChild #acceptDate").html(item.acceptDate);
				$("#showFormChild #replyUser").html(item.user.name);
				$("#showFormChild #replyDate").html(item.replyDate);
				$("#showFormChild #replyContent").html(item.replyContent);
				if(item.replyAttachFile != null){
					setAttachFileId(item.replyAttachFile.id,"#showFormChild");
				}
			}
		});
 	};
 	
</script>
</body>
</html>