<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>子工单回复详情</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body style="overflow: hidden;">
	<!-- 弹出编辑框 -->
	<div id="childDetail">
		<form class="form-horizontal" id="detailForm">
			<table class="popUpTable">
				<tbody>
		            <tr class="thTdPadding">
	           			<th>负责人</th>
	            		<td>
	            			<div>
	            				<input type="text" id="chargeUserDetail" style="width:96%;height:30px" readonly>
	            			</div>
		            	</td>
	           			<th>提交人</th>
	            		<td>
	            			<div>
								<input type="text" id="submitUserDetail"  style="width:96%;height:30px" readonly>
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th>受理时间</th>
		            	<td>
			            	<div>
			            		<input type="text"  id="acceptDate"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
						<th>回复时间</th>
		            	<td>
			            	<div>
			            		<input type="text"  id="responseDateDetail"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
	          		</tr>
		            <tr class="thTdPadding" style="height: 60px">
	          			<th>回复附件下载</th>
	            		<td colspan="3" >
	            			<div id="relUpload">
								<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
									<jsp:param name="width"  value="100%" />
									<jsp:param name="height"  value="100%" />
								</jsp:include>
							</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>完成情况</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea  id="responseContentDetail" style="width:98.3%;height:80px;" readonly="readonly"></textarea>
		            		</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
		
<script type="text/javascript">
var id= '${param.id}';

//根据id查询对象
$.ajax({
	url:contextPath +  'circuitWOAction/getCircuitWOById.cn',
	type:'post',
	data:{id:id},
	dataType:'json',
	success:function(result,status){
		if(status){
			setParamChildDetail(result);
		}
	},
	error:function(){alert('加载数据异常！');}
});

/*初始化弹出框的参数*/
function setParamChildDetail(data){
	if(data.chargeUser){//回复负责任
		$("#chargeUserDetail").val(data.chargeUser.name);
	}
	if(data.submitUser){//回复提交人
		$("#submitUserDetail").val(data.submitUser.name);
	}
	$("#acceptDate").val(data.acceptDate);
	$("#responseDateDetail").val(data.responseDate);
	$("#responseContentDetail").val(data.responseContent);
	if(data.responseAttachFile != null){//任务下载
		setAttachFileId(data.responseAttachFile.id,"#relUpload");
	}
}	
			

</script>
</body>
</html>