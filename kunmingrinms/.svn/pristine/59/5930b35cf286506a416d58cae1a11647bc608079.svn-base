<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>工单回复页面</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body>
	<div id="replyDiv" style="height:100%;overflow-x: hidden;">
		<form id="replyForm" class="form-horizontal" >
			<table class="popUpTable">
				<tr class="thTdPadding" >
					<th>工单名称</th>
					<td colspan="3" id="orderName" style="height:30px">
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
				<tr class="thTdPadding" style="height: 33px">
					<th>附件</th>
					<td colspan="3">
						<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
								<jsp:param name="width"  value="100%" />
								<jsp:param name="height"  value="100%" />
						</jsp:include>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th>历史工单进度及完成情况</th>
					<td colspan="3"><div id="tempRemark"></div></td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>工单进度及完成情况</th>
					<td colspan="3">
						<div>
							<textarea id="responseContent" class="input-large" data-rules="{required:true,maxlength:500}"  style="width:98.3%;height:80px;"></textarea>
						</div>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th>回复附件上传</th>
					<td colspan="3">
							<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
	            				<jsp:param name="width"  value="100%" />
	            			</jsp:include>
					</td>
				</tr>
			</table>
			<div id = "info_showSegmentsGrid"></div>
		</form>
	</div>
</body>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var workOrderTransactorId = '${param.workOrderTransactorId}';
var replyWorkOrderTransactor = null;

$(document).ready(function () {
	
	initPage();
});

function initPage() {
	$.post(contextPath + 'workOrderTransactorAction/getById.cn',
			{
				workOrderTransactorId : workOrderTransactorId,
			},function(data,status){
				
				replyWorkOrderTransactor = data;
				var workOrder = replyWorkOrderTransactor.order;
				
				$("#replyDiv #orderName").html(workOrder.name);
				$("#replyDiv #orderType").html(workOrder_type.typeName(workOrder.orderType));
				$("#replyDiv #orderNum").html(workOrder.orderNum);
				$("#replyDiv #creatUser").html(workOrder.creatUser.name);
				$("#replyDiv #creatDate").html(workOrder.creatDate);
				$("#replyDiv #sendUser").html(workOrder.sendUser.name);
				$("#replyDiv #sendDate").html(workOrder.sendDate);
				$("#replyDiv #deadLine").html(workOrder.deadLine);
				$("#replyDiv #tempRemark").html(replyWorkOrderTransactor.responseContent);
				
				// 工单附件
				if(workOrder.orderAttachFile != null){
					setAttachFileId(workOrder.orderAttachFile.id);
				}
				
				// 回复附件
				if(replyWorkOrderTransactor.attachFile != null){
					setUploadAttachFileId(replyWorkOrderTransactor.attachFile.id);
				}
			}, 'json');
}

var replyForm;
var replyTips;
BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay'],
		function(Uploader, Calendar, Form, Tooltip, Grid, Data, Overlay){
	if(replyTips == undefined) {
		replyTips = new Tooltip.Tips({
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
</html>