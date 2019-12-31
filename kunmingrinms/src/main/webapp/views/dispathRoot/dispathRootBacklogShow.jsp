<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待办调令处理</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<style type="text/css">
	#showrAcceptUserGrid .bui-grid-header {
    	overflow-y: hidden;
	}
	.bui-grid-row-darkOrange{
	    color: #333333;/* 橙色  待接收 */
	 }
	.bui-grid-row-Turquoise2{
	    color: #00C5CD; /* 蓝绿色  待回复*/
	 }
	.bui-grid-row-green{
	    color: #55BB00; /* 绿色 已回复*/
	 }
	.bui-grid-row-blue{
	    color: #0000FF;/* 蓝色   已归档*/
	 }
	.bui-grid-row-lavender{
	    color: #FF77FF;/* 淡紫色   已分派*/
	 }
	 .bui-grid-row-red{
	    color: #ff0099;/* 红色   处理中 */
	 }
	#showrAcceptUserGrid .bui-grid-hd{
	 	text-align : center;
	 }
	#showErrorSpan {
	 	position: inherit;
		right:inherit;
		top: inherit;
		margin-top:inherit;
 	}
 	td{
		word-break:break-all;
	}
</style>
<body>
	<div class="demo-content" style="height: 100%; overflow-x: hidden;">
		<div id="showInfo">
			<form class="form-horizontal" id="showForm">
				<table class="popUpTable">
					<tbody>
						<tr>
							<th>命令号：</th>
							<td id="dispatchNum"></td>
							<th>日期：</th>
							<td id="sendDate"></td>
						</tr>
						<tr>
							<th>发令单位：</th>
							<td id="organization"></td>
							<th>值班调度：</th>
							<td id="dispatchUser"></td>
						</tr>
						<tr>
							<th>命令内容：</th>
							<td id="suggestion" colspan="3" style="word-break:break-all;"></td>
						</tr>
						<tr style="height: 60px">
							<th>附件：</th>
							<td id="downloadFile" colspan="3">
								<div>
									<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
										<jsp:param name="width"  value="100%" />
										<jsp:param name="height"  value="100%" />
									</jsp:include>
								</div>
							</td>
						</tr>
						<tr>
							<th style="padding: 0px;">命令签发者：</th>
							<td id="issueUser"></td>
							<th style="padding: 0px;">发令者姓名：</th>
							<td id="sendUser"></td>
						</tr>
						<tr>
							<th>分派并签名：</th>
							<td id="remark"  style="white-space: pre-wrap;">
							</td>
							<th>完成期限：</th>
							<td id="limitTime"  style="white-space: pre-wrap;">
							</td>
						</tr>
					</tbody>
				</table>
				<div style="height:40px;background-color: #EFF3FF;">
					<span style="float:left; width:82px;margin-left:18px;font-weight: bold;margin-top: 11px;">受理人信息</span>
					<hr style="float:left; width:550px;height:2px; background: #ccc;margin-top:8px;margin-top: 19px;"></hr>
				</div>
				<table class="popUpTable">
					<tbody>
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
							<th>回复内容：</th>
							<td id="replyContent" colspan="3" style="word-break:break-all;"></td>
						</tr>
						<tr style="height: 60px">
							<th>回复附件：</th>
							<td id="replyFile" colspan="3">
								<div>
									<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
										<jsp:param name="width"  value="100%" />
										<jsp:param name="height" value="100%" />
									</jsp:include>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div id="childShow">
			<div class="search-grid-container">
				<div id="miniSquareSpace">
					<span class="miniSquare" style="background-color: #333333"></span>待接收
					<span class="miniSquare" style="background-color: #00C5CD"></span>已接收(待回复)
					<%--<span class="miniSquare" style="background-color: #00C5CD"></span>待回复--%>
					<span class="miniSquare" style="background-color: #55BB00"></span>已回复
					<span class="miniSquare" style="background-color: #0000FF"></span>已归档
					<span class="miniSquare" style="background-color: #FF77FF"></span>已分派
					<span class="miniSquare" style="background-color: #ff0099"></span>处理中
				</div>
				<div id = "showrAcceptUserGrid"></div>
				<input type="hidden" id="orgType" value="${sessionScope.user.organization.type }" />
			</div>
		</div>
	</div>
	
<script type="text/javascript">
//失败提示信息
var showErrorMsgHtml = '<div id="showErrorMsg" class="tips tips-small tips-warning" style="display:none">'+
        '<span id="showErrorSpan" class="x-icon x-icon-small x-icon-error"><i class="icon icon-white icon-bell"/></span>'+
        '<div id="showErrorResultMsg" class="tips-content" style="width:100%;"></div>'+
        '</div>';
//成功提示信息
var showSucMsgHtml = '<div id="showSucMsg" class="tips tips-small  tips-success" style="display:none">'+
	    '<span class="x-icon x-icon-small x-icon-success"><i class="icon icon-white icon-ok"/></span>'+
	    '<div id="showSucResultMsg" class="tips-content" style="width:100%;"></div>'+
	    '</div>';

/**
 * 失败信息提示
 */
function showCommonFailure(msg){
	if(msg == null || msg.trim() == ''){
		msg = '保存数据失败，请联系管理员！';
	}
	$('#showErrorResultMsg').empty();
	$('#showErrorResultMsg').append(msg);
	$('#showErrorMsg').show();
	$('#showErrorMsg').fadeOut(5000);
}


	var contextPath = '<%=contextPath%>' + '/';
	var id = '<%=request.getParameter("id")%>';
	var status = '${param.status}';
	
	var showStore;
	var showGrid;

	$(document).ready(function() {
		showBtnByStatus();
		showData();
	});
	
	// 根据不同的状态显示不同的按钮
	function showBtnByStatus(){
		if(status == 3){ // 状态：待接收
			$('#showInfo .btn-reply').css('display','none');
		}
		if(status == 5){ // 状态：待回复
 			$('#showInfo .btn-receive').css('display','none');
 			$('#showInfo .btn-assign').css('display','none');
			// $('.btn-dispatch').css('display','none');
 			
 			$('#showInfo #childShow').css('display','none');
		}
		if(status == 6 || status == 8 || status == 4){ // 状态：已回复、已归档、处理中
			$('#showInfo .btn-receive').css('display','none');
 			$('#showInfo .btn-assign').css('display','none');
 			$('#showInfo .btn-dispatch').css('display','none');
 			$('#showInfo .btn-reply').css('display','none');
 			$('#showInfo .btn-close').css('display','none');
		}
		if(status == 7){ // 状态：已分派
			$('#showInfo .btn-receive').css('display','none');
 			$('#showInfo .btn-dispatch').css('display','none');
 			$('#showInfo .btn-reply').css('display','none');
		}
		
		if($('#orgType').val() == ORG_TYPE_GQ ){ // 登录的用户组织机构为车间
			$('#showInfo .btn-assign').css('display','none');
		}
	}
	
	// 查询显示数据
 	function showData() {
 		// 执行提交到数据库的方法
		$.ajax({
			url : contextPath + "dispatchRootAction/getDispatchRootById.cn",
			type : "post",
			data : {
				id : id
				},
			dataType : "json",
			success : function(result){
				var item = result.root;
				$("#showForm #dispatchNum").html(item.dispatchNum);
				if(item.sendDate != null){
					$("#showForm #sendDate").html(item.sendDate);
				}
				$("#showForm #organization").html(item.sendUser.organization.name);
				$("#showForm #dispatchUser").html(item.dispatchUser);
				$("#showForm #suggestion").html(item.suggestion);
				$("#showForm #issueUser").html(item.issueUser);
				$("#showForm #sendUser").html(item.sendUser.name);
 				$("#showForm #remark").html(result.tempAssignRemark);
				if(item.attachFile != null){
					setAttachFileId(item.attachFile.id,"#downloadFile");
				}
				// 以下为受理人信息
				$("#showForm #acceptUser").html(result.user.name);
				$("#showForm #acceptDate").html(result.acceptDate);
				$("#showForm #replyUser").html(result.user.name);
				$("#showForm #replyDate").html(result.replyDate);
				$("#showForm #replyContent").html(result.replyContent);
				$("#showForm #limitTime").html(result.deadLine);
				if(result.replyAttachFile != null){
					setAttachFileId(result.replyAttachFile.id,"#replyFile");
				}
			}
		});
 	};
 	
 	BUI.use(['bui/grid', 'bui/data', 'bui/extensions/treegrid'],
 			function(Grid, Data, TreeGrid){
 		
 		 var columns = [{
 			 title : '部门',
 			 dataIndex :'user',
 			 width:'30%',
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
 			 dataIndex :'user',
 			 sortable : false,
 			 width:'15%',
 			 renderer : function(value) {
				if(value != null) {
					return value.name;
				}
				return "";
 			}
 		 },{
 			 title : '受理时间',
 			 elCls : 'center',
 			 dataIndex :'acceptDate',
 			 sortable : false,
 			 width:'75px',
 			 renderer : Grid.Format.datetimeRenderer
 		 },{
 			 title : '状态',
 			 dataIndex :'status',
 			 elCls : 'center',
 			 sortable : false,
 			 width:'10%',
 			 renderer : function(value) {
 				 return dispathBacklog_status.statusName(Number(value));
 			}
 		 },{
 			 title : '分派并签名',
 			 dataIndex :'assignRemark',
 			 elCls : 'center',
 			 sortable : false,
 			 width:'30%',
 		 }];

 		showStore = new Data.TreeStore({
 		 	autoLoad : true,
			root : {
		      id : id
		    },
 			proxy : {
 				url : contextPath + 'dispatchRootAction/getDispathRootTreeList.cn',
 				method : 'post'
 			},
 		 });
 		showGrid = new TreeGrid({
 			 render : '#showrAcceptUserGrid',
 			 columns : columns,
 			 store : showStore,
 			 idField : 'id',
 			 itemStatusFields : {
 				darkOrange : 'daijieshou', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
 				Turquoise2 : 'daihuifu',
 				green : 'yihuifu',
				blue : 'yiguidang',
				lavender : 'yifenpai',
				red : 'chulizhong',
			},
			tbar : {
				items : [{
					xclass : 'bar-item-text',
					text : showErrorMsgHtml + showSucMsgHtml
				}]
			},
 		 });
 		showGrid.render();
 		
 		function dialogClose(d){
 			d.close();
 			d = null;
 		}
 	});

</script>
</body>
</html>