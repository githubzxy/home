<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>调度命令详细信息</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<style type="text/css">
.copyToTable{
		width : 100%
	}
	.copyToTable th{
		text-align:center;
 		vertical-align:middle;
 		width : 33%;
 		height: 20px;
 		min-width : 181px;
	}
	.copyToTable td{
		text-align:center;
 		vertical-align:middle;
 		width : 33%;
 		height: 20px;
 		min-width : 181px;
	}
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
	td{
		word-break:break-all;
	}
</style>
<body>
	<div class="demo-content" style="height: 100%;overflow-x: hidden;">
		<div id="showInfo">
			<form class="form-horizontal" id="showForm">
				<table class="popUpTable">
					<tbody>
						<tr>
							<th>命令号：</th>
							<td id="dispatchNum" colspan="3"></td>
						</tr>
						<tr>
							<th>完成期限：</th>
							<td id="deadLine"></td>
							<th>日期：</th>
							<td id="sendDate"></td>
						</tr>
						<tr>
							<th>受令单位：</th>
							<td id="organization" ></td>
							<th>值班调度：</th>
							<td id="dispatchUser"></td>
						</tr>
						<tr>
							<th>命令内容：</th>
							<td id="suggestion" colspan="3"></td>
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
							<td id="issueUser" ></td>
							<th style="padding: 0px;">发令者姓名：</th>
							<td id="sendUser"></td>
						</tr>
						<!-- 抄送列表开始 -->
	          		<tr class="thTdPadding" style="height: 30px;">
	          			<th>抄送列表：</th>
	          			<td colspan="3">
	          				<table class="copyToTable">
	          					<thead>
	          						<tr>
	          							<th style="height: 30px">姓名</th>
	          							<th style="height: 30px">单位</th>
	          						</tr>
	          					</thead>
	          					<tbody id="copyToGrid">
	          					
	          					</tbody>
	          				</table>
	          			</td>
	          		</tr>
					<!-- 抄送列表结束 -->
					</tbody>
				</table>
			</form>
		</div>
		<div id="show">
			<div id="miniSquareSpace">
				<span class="miniSquare" style="background-color: #333333"></span>待接收
				<span class="miniSquare" style="background-color: #00C5CD"></span>已接收（待回复）
				<span class="miniSquare" style="background-color: #55BB00"></span>已回复
				<span class="miniSquare" style="background-color: #0000FF"></span>已归档
				<span class="miniSquare" style="background-color: #FF77FF"></span>已分派
				<span class="miniSquare" style="background-color: #ff0099"></span>处理中
			</div>
			<div id = "showrAcceptUserGrid"></div>
		</div>
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
// 				console.log(item);
				$("#showForm #dispatchNum").html(item.dispatchNum);
				$("#showForm #sendDate").html(item.sendDate);
				$("#showForm #organization").html(item.organization);
				$("#showForm #dispatchUser").html(item.dispatchUser);
				$("#showForm #suggestion").html(item.suggestion);
				$("#showForm #issueUser").html(item.issueUser);
				$("#showForm #deadLine").html(item.deadLine);
				if(item.sendUser != null){
					$("#showForm #sendUser").html(item.sendUser.name);
				}
				if(item.attachFile != null){
					setAttachFileId(item.attachFile.id,"#showForm");
				}
				
				if(item.copyUser!=null){
					$.each(item.copyUser,function(i,v){
						var o = v.organization?v.organization.name:'';
						var n = v.name?v.name:'';
						$('#showForm #copyToGrid').append('<tr><td>'+n+'</td><td>'+o+'</td></tr>');
					});
				}
			}
		});
 	};
 	
 	BUI.use(['bui/grid','bui/data', 'bui/extensions/treegrid'],
 			function(Grid,Data, TreeGrid){
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
 			},
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
 			 width : '100%',
 			 itemStatusFields : {
 				darkOrange : 'daijieshou', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
 				Turquoise2 : 'daihuifu',
 				green : 'yihuifu',
				blue : 'yiguidang',
				lavender : 'yifenpai',
				red : 'chulizhong',
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