<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>工单处理</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
	#childrenDetailGrid .bui-grid-header {
     	overflow-y: hidden;
	}
	#childrenDetailGrid .bui-grid-hd{
	 	text-align : center;
	 }
	#toDoDetailAll table { width:100%; table-layout:fixed;}
	#toDoDetailAll div,td { word-wrap:break-word;}
</style>
</head>
<body>
	<!-- 弹出编辑框 -->
	<div id="toDoDetailAll">
		<input type="hidden" id="rootId">
		<div>
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th>工单主题</th>
		            	<td colspan="3">
			            	<div>
			            		<input type="text" id="titleDetail"  style="width:98.3%;height:30px" readonly>
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
			            <th>联系人</th>
	            		<td>
	            			<div>
								<input type="text" id="linkmanDetail"  style="width:96%;height:30px" readonly>
							</div>
		            	</td>
	           			<th>工单类型</th>
	            		<td>
	            			<div>
	            				<input type="text" id="taskTypeDetail" style="width:96%;height:30px" readonly>
	            			</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>派发人</th>
	            		<td>
	            			<div>
	            				<input type="text" id="sendUserDetail" style="width:96%;height:30px" readonly>
	            			</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th>派发时间</th>
		            	<td>
			            	<div>
			            		<input type="text"  id="sendDateDetail"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
		            	<th>完成期限</th>
		            	<td>
			            	<div>
			            		<input type="text"  id="limitTimeDetail"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
	          		</tr>
	          		<%-- <tr class="thTdPadding" id="checkFileLineDetail" style="display: none;">
	          			<th>审核附件下载</th>
            			<td id="downloadCheckFile" colspan="3">
							<div>
								<jsp:include page="/views/circuitWOManage/checkFileDownLoad.jsp" flush="true">
									<jsp:param name="width"  value="100%" />
								</jsp:include>
							</div>
						</td>
	          		</tr>
	          		<tr class="thTdPadding" id="checkMsgLineDetail" style="display: none;">
		           		<th>审核意见</th>
		            	<td colspan="3" style="height: 33px">
		            		<div id="checkMsgDetail">
<!-- 		            			<textarea  id="checkMsgDetail" style="width:98.3%;height:80px;" readonly></textarea> -->
		            		</div>
		            	</td>
	          		</tr> --%>
		            <tr class="thTdPadding" style="height: 33px">
	          			<th>工单文件下载</th>
	            		<td id="downloadFile" colspan="3">
								<div>
									<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
										<jsp:param name="width"  value="100%" />
										<jsp:param name="height"  value="100%" />
									</jsp:include>
								</div>
							</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3" style="height: 33px">
		            		<div id="remarkDetail" style="white-space: pre-wrap;">
		            			<!-- <textarea  id="remarkDetail" style="width:98.3%;height:85px;" readonly></textarea> -->
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>分派说明</th>
		            	<td colspan="3" style="height: 33px">
		            		<div id="assignRemarkDetail" style="white-space: pre-wrap;">
		            			<!-- <textarea  id="assignRemarkDetail" style="width:98.3%;height:88px;" readonly></textarea> -->
		            		</div>
		            	</td>
	          		</tr>
          		</tbody>
			</table>
			<div style="height:40px;background-color: #EFF3FF;">
				<span style="float:left; width:74px;margin-left:10px;font-weight: bold;margin-top: 11px;">受理人信息</span>
				<hr style="float:left; width:547px;height:2px; background: #ccc;margin-top:8px;margin-top: 19px;"></hr>
			</div>
			<table class="popUpTable">
				<tbody>
	          		<tr class="thTdPadding">
						<th>受理时间</th>
		            	<td>
			            	<div>
			            		<input type="text"  id="acceptDate"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
						<th>完成时间</th>
		            	<td>
			            	<div>
			            		<input type="text"  id="responseDateDetail"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>完成情况</th>
		            	<td colspan="3" style="height: 33px">
		            		<div id="responseContentDetail">
<!-- 		            			<textarea  id="responseContentDetail" style="width:98.3%;height:80px;" readonly="readonly"></textarea> -->
		            		</div>
		            	</td>
	          		</tr>
		            <tr class="thTdPadding">
	          			<th>回复附件下载</th>
	            		<td colspan="3" style="height: 33px">
	            			<div id="replyFile">
								<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
									<jsp:param name="width"  value="100%" />
									<jsp:param name="height" value="100%" />
								</jsp:include>
							</div>
		            	</td>
	          		</tr>
	          	</tbody>
			</table>
		</div>
		<!-- 子任务列表 -->
		<div id="showChildrenTask" style="display: none;">
			<div id ="childrenDetailGrid"></div>	
		</div>
	</div>
		
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var id= '${param.id}';//当前任务的id
var taskStatus= '${param.taskStatus}';//当前任务状态（根据状态隐藏或显示弹出子任务列表和按钮）
var orgType='${sessionScope.user.organization.type}';//当前用户所属组织机构的类型（判断是否是工区，工区弹出框中无分派功能）
//子任务树列表
var childrenDetailGrid;
var childrenDetailStore;


$(document).ready(function () {
	hideAndShowContentByStatus();
});

/**根据状态或组织机构隐藏或显示弹出框内容（隐藏或显示：子任务列表、按钮）**/

function hideAndShowContentByStatus(){
// 	var $btns=$(".btn-checkPass, .btn-checkNotPass, .btn-receive, .btn-reply, .btn-back, .btn-assign, .btn-turn, .btn-close");
	
	//隐藏该弹出框全部按钮
	$(".btn-handleToDo").hide();
	
	if(taskStatus==taskManage_status.daiJieShou){//待接收状态，显示：待接收、退回、分派、转派、关闭
		$(".btn-receive, .btn-back, .btn-assign, .btn-turn, .btn-close").show();
		$("#showChildrenTask").show();//显示子任务
	}else if(taskStatus==taskManage_status.daiShenHe){//待审核状态，只显示：审核通过、审核不通过、关闭
		$(".btn-checkPass, .btn-checkNotPass, .btn-close").show();
	}else if(taskStatus==taskManage_status.shenHeTongGuo){//审核通过，显示审核附件
		$("#checkFileLineDetail").show();
	}else if(taskStatus==taskManage_status.shenHeBuTongGuo){//审核不通过，显示审核意见
		$("#checkMsgLineDetail").show();
	}else if(taskStatus==taskManage_status.yiTuiHui){//已退回
		handleDialog.set('height','405');
	}else if(taskStatus==taskManage_status.daiHuiFu){//待回复状态，只显示：回复、关闭
		$(".btn-reply, .btn-close, .btn-turn").show();
		handleDialog.set('height','432');
	}else if(taskStatus==taskManage_status.yiHuiFu
			||taskStatus==taskManage_status.yiGuiDang){//已回复、已归档
		$("#showChildrenTask").show();//显示子任务
	}else if(taskStatus==taskManage_status.yiFenPai){//已分派，显示分派按钮、子任务
		$(".btn-assign, .btn-close").show();
		$("#showChildrenTask").show();//显示子任务
	}else {
		$("#showChildrenTask").show();
	}
	if(orgType==ORG_TYPE_KS){//若当前用户所属机构为科室（组织机构类型为3），则隐藏弹出框的“退回”按钮
		$('.btn-back').hide();
	}
	//若当前用户所属机构为工区（组织机构类型为5），则隐藏弹出框的“分派,退回”按钮
	if(orgType==ORG_TYPE_GQ){
		$(".btn-assign,.btn-back").hide();
	}
	
}


BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/extensions/treegrid'],
		function(Grid,Data,Calendar, Form,Overlay,TreeGrid){
	//子任务树
	var childrenDetailColumns = [{
		 title : '部门',
		 dataIndex :'owner',
		 width:'25%',
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
		 dataIndex :'owner',
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
			 return taskManage_status.typeName(value);
		}
	 },{
		 title : '分派备注',
		 dataIndex :'assignRemark',
		 elCls : 'center',
		 sortable : false,
		 width:'35%'
	 }];

	childrenDetailStore = new Data.TreeStore({
 		 	autoLoad : true,
			root : {
		      id : id
		    },
 			proxy : {
 				url : contextPath + 'circuitWOAction/getCircuitWOTreeList.cn',
 				method : 'post'
 			},
 		 });
	
	childrenDetailGrid = new TreeGrid({
		 render : '#childrenDetailGrid',
		 columns : childrenDetailColumns,
		 store : childrenDetailStore,
		 idField : 'id',
		 itemStatusFields : {
			daiJieShou : 'daiJieShou',
			daiHuiFu : 'daiHuiFu',
			yiHuiFu : 'yiHuiFu',
			yiGuiDang : 'yiGuiDang',
			yiTuiHui : 'yiTuiHui',
			yiFenPai : 'yiFenPai'
		}
	 });
	childrenDetailGrid.render();
	
	//初始化弹出框
	initDetailDialog();
});

	/*初始化弹出框的参数*/
	function initDetailDialog(){
		$.ajax({
			url:contextPath +  'circuitWOAction/getCircuitWOById.cn',
			type:'post',
			data:{id:id},
			dataType:'json',
			success:function(result,status){
				if(status){
					setParamDetail(result);
				}
			},
			error:function(){alert('初始化数据异常！');}
		});
	}
	
	function setParamDetail(data){
		var root=data.root;
		if(root){
			$("#rootId").val(root.id);
			$("#titleDetail").val(root.title);
			if(root.linkman){
				$("#linkmanDetail").val(root.linkman.name);
			}
			$("#taskTypeDetail").val(taskManage_orderType.typeName(root.taskType));
			if(root.sendUser){
				$("#sendUserDetail").val(root.sendUser.name);
			}
			$("#sendDateDetail").val(root.sendDate);
			$("#limitTimeDetail").val(root.limitTime);
			
			if(data.checkAttachFile != null){//审核任务（审核通过状态才显示，其他状态隐藏）
				setCheckAttachFileId(data.checkAttachFile.id);
			}
			$("#checkMsgDetail").html(data.checkMsg);//审核意见（审核不通过状态的数据才显示，其他状态隐藏）
			
			if(root.taskAttachFile != null){//任务下载
				setAttachFileId(root.taskAttachFile.id,"#downloadFile");
			}
			$("#remarkDetail").html(root.remark);
			
			// 以下为受理人信息
// 			console.log(data);
			$("#acceptDate").val(data.acceptDate);
			$("#responseDateDetail").val(data.responseDate);
			$("#responseContentDetail").html(data.responseContent);
			if(data.responseAttachFile != null){
				setAttachFileId(data.responseAttachFile.id,"#replyFile");
			}
		}
	}
</script>
</body>
</html>