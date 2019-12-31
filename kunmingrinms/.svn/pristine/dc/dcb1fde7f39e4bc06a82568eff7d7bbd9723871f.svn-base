<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退回工单详细信息</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />

</head>
<body>
	<!-- 弹出编辑框 -->
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
	            <tr class="thTdPadding">
          			<th>工单文件下载</th>
            		<td id="downloadFile" colspan="3" style="height: 33px">
							<div>
								<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
									<jsp:param name="width"  value="100%" />
								</jsp:include>
							</div>
						</td>
          		</tr>
          		<tr class="thTdPadding">
	           		<th>备注</th>
	            	<td colspan="3">
	            		<div>
	            			<textarea  id="remarkDetail" style="width:98.3%;height:60px;" readonly></textarea>
	            		</div>
	            	</td>
          		</tr>
          		<tr class="thTdPadding">
	           		<th>退回意见</th>
	            	<td colspan="3">
	            		<div>
	            			<textarea  id="sendBackRemarkDetail" style="width:98.3%;height:60px;" readonly></textarea>
	            		</div>
	            	</td>
          		</tr>
          	</tbody>
		</table>
	</div>
		
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var id= '${param.id}';

$(document).ready(function(){
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
		error:function(){alert('加载数据异常！');}
	});
}

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
		$("#sendDateDetail").val(root.sendDate);
		$("#limitTimeDetail").val(root.limitTime);
		if(root.taskAttachFile != null){//任务下载
			setAttachFileId(root.taskAttachFile.id);
		}
		$("#remarkDetail").val(root.remark);
		$("#sendBackRemarkDetail").val(data.sendBackRemark);
		
	}
}	
			
</script>
</body>
</html>