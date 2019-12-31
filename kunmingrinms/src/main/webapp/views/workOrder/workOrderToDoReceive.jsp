<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>工单处理页面</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable2.css" rel="stylesheet" />
<style>
	td{
		word-break:break-all;
	}
</style>
</head>
<body>
	<div id="receiveDiv" style="height:100%;overflow-x: hidden;">
			<table class="popUpTable">
				<tr class="thTdPadding" >
					<th>工单名称</th>
					<td colspan="3" id="orderName" style="height:30px;">
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th>工单类型</th>
					<td id="orderType" style="height:30px"></td>
					<th>工单号</th>
					<td id="orderNum"  style="height:30px"></td>
				</tr>
				<tr class="thTdPadding" >
					<th>创建人</th>
					<td id="creatUser" style="height:30px"></td>
					<th>下发人</th>
					<td id="sendUser" style="height:30px"></td>
				</tr>
				<tr class="thTdPadding" >
					<th>创建时间</th>
					<td id="creatDate"  style="height:30px"></td>
					<th>下发时间</th>
					<td id="sendDate"  style="height:30px"></td>
				</tr>
				<tr class="thTdPadding" >
					<th>完成期限</th>
					<td id="deadLine"  style="height:30px"></td>
					<th style="background-color: GhostWhite;border-right: none;"></th>
		            <td style="background-color: GhostWhite;border-left:none;"></td>
				</tr>
				<tr class="thTdPadding" style="height: 80px">
					<th>附件</th>
					<td colspan="3">
						<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
								<jsp:param name="width"  value="100%" />
								<jsp:param name="height"  value="100%" />
						</jsp:include>
					</td>
				</tr>
				<tr class="thTdPadding" style="height:30px">
					<th>分派说明</th>
					<td colspan="3"><div id="assignRemark" style="white-space: pre-wrap;"></div></td>
				</tr>
			</table>
			<div id = "info_showSegmentsGrid"></div>
	</div>
</body>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var workOrderTransactorId = '${param.workOrderTransactorId}';
var receiveWorkOrderTransactor = null;

$(document).ready(function () {
	
	initPage();
});

function initPage() {
	$.post(contextPath + 'workOrderTransactorAction/getById.cn',
			{
				workOrderTransactorId : workOrderTransactorId,
			},function(data,status){
				
				receiveWorkOrderTransactor = data;
				var workOrder = receiveWorkOrderTransactor.order;
				
				$("#receiveDiv #orderName").html(workOrder.name);
				$("#receiveDiv #orderType").html(workOrder_type.typeName(workOrder.orderType));
				$("#receiveDiv #orderNum").html(workOrder.orderNum);
				$("#receiveDiv #creatUser").html(workOrder.creatUser.name);
				$("#receiveDiv #creatDate").html(workOrder.creatDate);
				$("#receiveDiv #sendUser").html(workOrder.sendUser.name);
				$("#receiveDiv #sendDate").html(workOrder.sendDate);
				$("#receiveDiv #deadLine").html(workOrder.deadLine);
				$("#receiveDiv #assignRemark").html(receiveWorkOrderTransactor.tempRemark);
				
				if(workOrder.orderAttachFile != null){
					setAttachFileId(workOrder.orderAttachFile.id);
				}
			}, 'json');
}

</script>
</html>