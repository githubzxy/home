<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>工单详情</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
  	#showSegmentsGrid .bui-grid-header {
     	overflow-y: hidden;
 	}
 	#showSegmentsGrid .bui-grid-hd{
	 	text-align : center;
	 }
 	table { width:100%; table-layout:fixed;}
	div,td { word-wrap:break-word;}
	
	.bui-grid-row-daiJieShou{
	    color: #FF5500;
	 }
	.bui-grid-row-daiHuiFu{
	    color: #00C5CD;
	 }
	 .bui-grid-row-daiHuiDa{
	    color: #8470FF;
	 }
	  .bui-grid-row-yiHuiDa{
	    color: #483D8B;
	 }
	  .bui-grid-row-daiShenPi{
	    color: #458B74;
	 }	 
	  .bui-grid-row-weiWanCheng{
	    color: #5CACEE;
	 }
	 .bui-grid-row-wanCheng{
	    color: #1E90FF;
	 }
	 .bui-grid-row-yiGuiDang{
	    color: #0000FF;
	 }
	 .bui-grid-row-yiFenPai{
	    color: #FF77FF;
	 }	
</style>
</head>
<body>
	<div id="showDiv" style="height:100%;overflow-x: hidden;">
		<table class="popUpTable">
			<tr class="thTdPadding" >
				<th>工单名称</th>
				<td colspan="3" id="showOrderName" style="height:30px;white-space: pre-wrap">
				</td>
			</tr>
			<tr class="thTdPadding" >
				<th>工单类型</th>
				<td id="showOrderType" style="height:30px"></td>
				<th>工单号</th>
				<td id="showOrderNum"  style="height:30px"></td>
			</tr>
			<tr class="thTdPadding" >
				<th>下发时间</th>
				<td id="sendDate" style="height:30px"></td>
				<th>完成期限</th>
				<td id="deadLine"  style="height:30px"></td>
			</tr>
			<tr class="thTdPadding"  style="height: 60px">
				<th>附件</th>
				<td colspan="3">
					<div>
						<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
							<jsp:param name="width"  value="100%" />
							<jsp:param name="height" value="100%" />
						</jsp:include>
					</div>
				</td>
			</tr>
			<tr class="thTdPadding" >
				<th>总结</th>
				<td colspan="3" id="showSummary"  style="height: 50px;white-space: pre-wrap"></td>
			</tr>
			<tr class="thTdPadding" style="height: 60px">
				<th>总结附件</th>
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
			<div id = "showSegmentsGrid"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var workOrderId = '${param.workOrderId}';
var workOrder = null;

var selectUserDialog;

var showStore;
var showGrid;

BUI.use(['bui/data', 'bui/extensions/treegrid'],
		function(Data, TreeGrid){
	
	 var columns = [{
		 title : '部门',
		 dataIndex :'transactor',
		 width:'35%',
		 sortable : false,	// 表头不排序
		 renderer : function(value) {
				if(value != null && value.organization != null) {
					return value.organization.name;
				}
				return "";
		}
	 },{
		 title : '执行人',
		 elCls : 'center',
		 dataIndex :'transactor',
		 sortable : false,
		 width:'20%',
		 renderer : function(value) {
				if(value != null) {
					return value.name;
				}
				return "";
		}
	 },{
		 title : '状态',
		 dataIndex :'status',
		 elCls : 'center',
		 sortable : false,
		 width:'20%',
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

	showStore = new Data.TreeStore({
	 	autoLoad : true,
		params : {
			workOrderId : workOrderId
		},
		proxy : {
			url : contextPath + 'workOrderTreeListAction/getWorkOrderTreeList.cn',
			method : 'post'
		},
	 });
	showGrid = new TreeGrid({
		 render : '#showSegmentsGrid',
		 columns : columns,
		 store : showStore,
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
			}
	 });
	showGrid.render();
	
	function dialogClose(d){
		d.close();
		d = null;
	}
});

$(document).ready(function () {
	
	initPage();
});

function initPage() {
	$.post(contextPath + 'workOrderAction/getById.cn',
			{
				workOrderId : workOrderId,
			},function(data,status){
				
				workOrder = data;
				
				$("#showDiv #showOrderName").html(workOrder.name);
				$("#showDiv #showOrderType").html(workOrder_type.typeName(workOrder.orderType));
				$("#showDiv #showOrderNum").html(workOrder.orderNum);
				$("#showDiv #showSummary").html(workOrder.summary);
				$("#showDiv #sendDate").html(workOrder.sendDate);
				$("#showDiv #deadLine").html(workOrder.deadLine);
				
				// 附件
				if(workOrder.orderAttachFile != null){
					setAttachFileId(workOrder.orderAttachFile.id,"#showDiv");
				}
				
				// 总结附件
				if(workOrder.summaryAttachFile != null){
					setWorkOrderFileId(workOrder.summaryAttachFile.id,"#showDiv");
				}
			}, 'json');
}

</script>
</html>