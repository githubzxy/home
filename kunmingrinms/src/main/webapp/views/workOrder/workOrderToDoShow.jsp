<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>子工单详情</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
 	.bui-grid-width .bui-grid-body {
 		overflow-x: hidden;
 		overflow-y: scroll;
 	}
 	table { width:100%; table-layout:fixed;}
	div,td { word-wrap:break-word;}
</style>
</head>
<body>
	<div id="showSubDiv" style="height:100%;overflow-x: hidden;overflow-y:auto">
		<table class="popUpTable">
			<tr class="thTdPadding" style="height:33px">
				<th>工单名称</th>
				<td colspan="3" id="showOrderName" style="white-space: pre-wrap">
				</td>
			</tr>
			<tr class="thTdPadding" style="height:33px">
				<th>工单类型</th>
				<td id="showOrderType"></td>
				<th>工单号</th>
				<td id="showOrderNum"></td>
			</tr>
			<tr class="thTdPadding" >
				<th>下发时间</th>
				<td id="sendDate" style="height:30px"></td>
				<th>完成期限</th>
				<td id="deadLine"  style="height:30px"></td>
			</tr>
			<tr class="thTdPadding" style="height: 60px">
				<th>附件</th>
				<td colspan="3">
					<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
							<jsp:param name="width"  value="100%" />
							<jsp:param name="height"  value="100%" />
					</jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="height:40px;background-color: #EFF3FF;">
		<span style="float:left; width:75px;margin-left:10px;font-weight: bold;margin-top: 11px;">受理人信息</span>
		<hr style="float:left; width:570px;height:2px; background: #ccc;margin-top:8px;margin-top: 19px;"></hr>
	</div>
	<table class="popUpTable">
		<tbody>
			<tr class="thTdPadding" style="height:33px">
				<th>执行部门</th>
				<td id="transactorOrg"></td>
				<th>执行人</th>
				<td id="transactor"></td>
			</tr>
			<tr class="thTdPadding" style="height:33px">
				<th>受理时间</th>
				<td id="acceptDate"></td>
				<th>回复时间</th>
				<td id="replyDate"></td>
			</tr>
			<tr class="thTdPadding" style="height:60px">
				<th>工单进度及完成情况</th>
				<td colspan="3" id="responseContent" style="white-space: pre-wrap;" ></td>
			</tr>
			<tr class="thTdPadding" style="height: 60px">
				<th>回复附件</th>
				<td colspan="3">
					<jsp:include page="/views/workOrder/control/workOrderDownLoad.jsp" flush="true">
							<jsp:param name="width"  value="100%" />
							<jsp:param name="height" value="100%" />
					</jsp:include>
				</td>
			</tr>
		</table>
		<div id="show">
			<div id="miniSquareSpace">
				<span class="miniSquare" style="background-color: #FF5500"></span>待接收
				<span class="miniSquare" style="background-color: #00C5CD"></span>待回复
				<span class="miniSquare" style="background-color: #458B74"></span>待审批
				<span class="miniSquare" style="background-color: #8470FF"></span>待回答
				<span class="miniSquare" style="background-color: #483D8B"></span>已回答
				<span class="miniSquare" style="background-color: #1E90FF"></span>完成
				<span class="miniSquare" style="background-color: #0000FF"></span>已归档
				<span class="miniSquare" style="background-color: #FF77FF"></span>已分派
			</div>
			<div id = "todoShowGrid"></div>
		</div>
	
	</div>
	
</body>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var workOrderTransactorId = '${param.workOrderTransactorId}';
var workOrderTransactor = null;
var workOrder = null;

var showStore;
var todoShowGrid;

$(document).ready(function () {
	initPage();
	getAssignUserStore();
});
//查询分派接收人，回显再次分派弹出框
function getAssignUserStore(){
	$.ajax({
		url : contextPath + 'workOrderTransactorAction/assignBefore.cn',
		data : {
			workOrderTransactorId : workOrderTransactorId
		},
		type : 'post',
		dataType : 'json',
		success : function(data,status){
			showStore.setResult(data.receiveUsers);
		},
	});
}
function initPage() {
	$.post(contextPath + 'workOrderTransactorAction/getById.cn',
			{
				workOrderTransactorId : workOrderTransactorId,
			},function(data,status){
				
				workOrderTransactor = data;
				workOrder = workOrderTransactor.order;
				$("#showSubDiv #showOrderName").html(workOrder.name);
				$("#showSubDiv #showOrderType").html(workOrder_type.typeName(workOrder.orderType));
				$("#showSubDiv #showOrderNum").html(workOrder.orderNum);
				$("#showSubDiv #sendDate").html(workOrder.sendDate);
				$("#showSubDiv #deadLine").html(workOrder.deadLine);
				// 附件
				if(workOrder.orderAttachFile != null){
					setAttachFileId(workOrder.orderAttachFile.id,"#showSubDiv");
				}
				
				// 以下为受理人信息
				$("#showSubDiv #transactorOrg").html(workOrderTransactor.transactor.organization.name);
				$("#showSubDiv #transactor").html(workOrderTransactor.transactor.name);
				$("#showSubDiv #acceptDate").html(workOrderTransactor.acceptDate);
				$("#showSubDiv #replyDate").html(workOrderTransactor.responseDate);
				$("#showSubDiv #responseContent").html(workOrderTransactor.responseContent);
				// 回复附件
				if(workOrderTransactor.attachFile != null){
					setWorkOrderFileId(workOrderTransactor.attachFile.id,"#showSubDiv");
				}
			}, 'json');
}
BUI.use([ 'bui/grid', 'bui/data'],
		function(Grid, Data){
	
	showStore = new Data.TreeStore({
	 	autoLoad : true,
		params : {
			workOrderId : workOrderTransactorId
		},
		proxy : {
			url : contextPath + 'workOrderTreeListAction/getWorkOrderTreeListByParent.cn',
			method : 'post'
		},
	 });
	
	 var columns = [{
		 title : '姓名',
		 elCls : 'center',
		 dataIndex :'transactor',
		 width:'25%',
		 sortable : false,	// 表头不排序
		 renderer:function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		 }
	 },{
		 title : '部门',
		 elCls : 'center',
		 dataIndex :'transactor',
		 sortable : false,
		 width:'25%',
		 renderer:function(value) {
			if(value != null&&value.organization !=null) {
				return value.organization.name;
			}
			return "";
		 }
	 },{
		 title : '状态',
		 dataIndex :'status',
		 elCls : 'center',
		 sortable : false,
		 width:'25%',
		 renderer : function(value) {
				return subStatusToChinese(value);
		}
	 },{
		 title : '分派备注',
		 dataIndex :'assignRemark',
		 elCls : 'center',
		 sortable : false,
		 width:'25%'
	 }];

	 todoShowGrid = new Grid.Grid({
		 render : '#todoShowGrid',
		 columns : columns,
		 store : showStore,
		 width:'100%',
		 idField : 'id',
		 itemStatusFields : {
				daiJieShou : 'daiJieShou', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
				daiHuiFu : 'daiHuiFu',
				daiHuiDa : 'daiHuiDa',
				yiHuiDa : 'yiHuiDa',
				daiShenPi : 'daiShenPi',
				weiWanCheng : 'weiWanCheng',
				wanCheng : 'wanCheng',
				yiGuiDang : 'yiGuiDang',
				yiFenPai : 'yiFenPai'
			},
		 plugins : [Grid.Plugins.RowNumber],
	 });
	 todoShowGrid.render();
	 
	
});
</script>
</html>