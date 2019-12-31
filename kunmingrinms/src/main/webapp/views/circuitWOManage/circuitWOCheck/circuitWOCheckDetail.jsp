<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>工单审核详情</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
	#childrenDetailGrid .bui-grid-header {
     	overflow-y: hidden;
	}
</style>
</head>
<body>
	<div id="toDoDetailAll">
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
						<th>送审时间</th>
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
	          		<tr class="thTdPadding" id="checkFileLineDetail" style="display: none;height: 33px;">
	          			<th>审核附件下载</th>
            			<td id="downloadCheckFile" colspan="3">
							<div>
								<jsp:include page="/views/circuitWOManage/checkFileDownLoad.jsp" flush="true">
									<jsp:param name="width"  value="100%" />
									<jsp:param name="height"  value="100%" />
								</jsp:include>
							</div>
						</td>
	          		</tr>
	          		<tr class="thTdPadding" id="checkMsgLineDetail" style="display: none;">
		           		<th>审核意见</th>
		            	<td colspan="3" style="height: 60px">
		            		<div id="checkMsgDetail">
<!-- 		            			<textarea  id="checkMsgDetail" style="width:98.3%;height:80px;" readonly></textarea> -->
		            		</div>
		            	</td>
	          		</tr>
		            <tr class="thTdPadding">
	          			<th>工单文件下载</th>
	            		<td id="downloadFile" colspan="3" style="height: 42px;">
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
		            	<td colspan="3" style="height: 91px">
		            		<!-- <div contenteditable="true" id="remarkDetail"> -->
		            		<div id="remarkDetail">
		            		</div>
		            	</td>
	          		</tr>
	          	</tbody>
			</table>
		</div>
	</div>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var id= '${param.id}';//当前任务的id
var taskStatus= '${param.taskStatus}';//当前任务状态（根据状态隐藏或显示按钮）

$(document).ready(function () {
	hideAndShowContentByStatus();
});

/**根据状态或组织机构隐藏或显示弹出框内容（隐藏或显示：子任务列表、按钮）**/

function hideAndShowContentByStatus(){
// 	var $btns=$(".btn-checkPass, .btn-checkNotPass, .btn-receive, .btn-reply, .btn-back, .btn-assign, .btn-turn, .btn-close");
	
	//隐藏该弹出框全部按钮
	$(".btn-handleToDo").hide();
	
	if(taskStatus==taskManage_status.daiShenHe){//待审核状态，只显示：审核通过、审核不通过、关闭
		$(".btn-checkPass, .btn-checkNotPass, .btn-close").show();
	}else if(taskStatus==taskManage_status.shenHeTongGuo){//审核通过，显示审核附件
		$("#checkFileLineDetail").show();
	}else if(taskStatus==taskManage_status.shenHeBuTongGuo){//审核不通过，显示审核意见
		$("#checkMsgLineDetail").show();
	}
}

/*初始化弹出框的参数*/
(function (){
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
})();

function setParamDetail(data){
	var root=data.root;
	if(root){
		$("#titleDetail").val(root.title);
		if(root.linkman){
			$("#linkmanDetail").val(root.linkman.name);
		}
		$("#taskTypeDetail").val(taskManage_orderType.typeName(root.taskType));
		if(root.sendUser){
			$("#sendUserDetail").val(root.sendUser.name);
		}
		$("#sendDateDetail").val(data.createTime);//送审时间（及子任务的创建时间）
		$("#limitTimeDetail").val(root.limitTime);
		
		if(data.checkAttachFile != null){//审核任务（审核通过状态才显示，其他状态隐藏）
			setCheckAttachFileId(data.checkAttachFile.id);
		}
		$("#checkMsgDetail").html(data.checkMsg);//审核意见（审核不通过状态的数据才显示，其他状态隐藏）
		
		if(root.taskAttachFile != null){//任务下载
			setAttachFileId(root.taskAttachFile.id);
		}
		$("#remarkDetail").html(root.remark);
		$("#assignRemarkDetail").val(data.assignRemark);
	}
}
</script>
</body>
</html>