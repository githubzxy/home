<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通信网停机要点详情</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	} 
	.bui-stdmod-body{
		overflow-y:scroll;
	}
</style>
</head>
<body>
	<!-- 弹出编辑框 -->
	<div id="content"  style="overflow-x: hidden;">
		<form class="form-horizontal" id="detailForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th>线路</th>
		            	<td>
			            	<div>
			            		<input type="text" name="railLine" id="railLineDetail"  style="width:98%;height:30px" readonly>
			            	</div>
		            	</td>
		            	<th>计划开始时间</th>
	            		<td>
	            			<div>
								<input type="text" name="startDate" id="startDateDetail"  style="width:98%;height:30px" readonly>
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>所属局</th>
	            		<td>
	            			<div>
	            				<input type="text" name="belongOffice" id="belongOfficeDetail" style="width:98%;height:30px" readonly>
	            			</div>
		            	</td>
	           			<th>计划结束时间</th>
	            		<td>
	            			<div>
								<input type="text" name="endDate" id="endDateDetail"  style="width:98%;height:30px" readonly>
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th>工作内容</th>
		            	<td>
			            	<div>
			            		<input type="text" name="workContent" id="workContentDetail"  style="width:98%;height:30px" readonly>	
			            	</div>
		            	</td>
		            	<th>所属专业</th>
		            	<td>
			            	<div>
			            		<input type="text" name="belongCraft" id="belongCraftDetail"  style="width:98%;height:30px" readonly>	
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>施工类别</th>
	           			<td>
			            	<div>
			            		<input type="text" name="executionType" id="executionTypeDetail"  style="width:98%;height:30px" readonly>	
			            	</div>
		            	</td>
	           			<th>施工属性</th>
	           			<td>
			            	<div>
			            		<input type="text" name="executionAttr" id="executionAttrDetail"  style="width:98%;height:30px" readonly>	
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
		           		<th>施工地点</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="executionAddr" id="executionAddrDetail" style="width:98%;height:60px; line-height:60px;" readonly></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>涉及骨干网名称</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="mainNetName" id="mainNetNameDetail" style="width:98%;height:60px; line-height:60px;" readonly></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>涉及铁路局</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="railwaysBureau" id="railwaysBureauDetail" style="width:98%;height:60px; line-height:60px;" readonly></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>计划原因说明</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="planCaption" id="planCaptionDetail" style="width:98%;height:60px; line-height:60px;" readonly></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>附件</th>
	            		<td colspan="3" >
<!-- 	            			<textarea name="attachFile" id="attachFileDetail" style="width:98%;height:60px; line-height:60px;" readonly></textarea> -->
		            	<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true"/>
		            	</td>
	          		</tr>
					<tr class="thTdPadding">
						<th>是否天窗</th>
						<td colspan="3">
							<div id="skyLightDetail">
							</div>
						</td>
					</tr>
	          		<tr>
	          		<th>方案审批编号</th>
		            	<td style="padding:0 0;">
			            	<div>
			            		<input type="text" name="planExaminNum" id="planExaminNumDetail"  style="width:95%;height:50px" readonly>
			            	</div>
		            	</td>
		            	<th>月度计划<br>审批编号</th>
	            		<td style="padding:0 0;">
	            			<div>
								<input type="text" name="monthPlanExamin" id="monthPlanExaminDetail"  style="width:95%;height:50px" readonly>
							</div>
		            	</td>
		            </tr>
	          		<tr>
	          		<th>昆铁施工<br>台计划号</th>
		            	<td colspan="3" style="padding:0 0;">
			            	<div>
			            		<input type="text" name="executionPlanNum" id="executionPlanNumDetail"  style="width:98%;height:50px" readonly>
			            	</div>
		            	</td>
		            </tr>
	          		<tr class="thTdPadding">
	          			<th>批复附件</th>
	            		<td colspan="3" >
<!-- 	            			<textarea name="restoreFile" id="restoreFileDetail" style="width:98%;height:60px; line-height:60px;" readonly></textarea> -->
	            			<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true"/>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>完成情况</th>
	            		<td colspan="3" >
	            			<textarea name="situationCaption" id="situationCaptionDetail" style="width:98%;height:60px; line-height:60px;" readonly></textarea>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>回复附件</th>
	            		<td colspan="3" >
<!-- 	            			<textarea name="examinFile" id="examinFileDetail" style="width:98%;height:60px; line-height:60px;" readonly></textarea> -->
	            			<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true"/>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
var id= '<%=id%>';

//根据id查询对象
$.ajax({
	url:contextPath +  'commNetStopAction/getCommNetStopById.cn',
	type:'post',
	data:{id:id},
	dataType:'json',
	success:function(result){
		if(result.status==1){
			var recordCns=result.data;//停机要点记录
			setParamDetail(recordCns);
		}
	},
	error:function(){alert('加载数据异常！');}
});

/*初始化弹出框的参数*/
function setParamDetail(recordCns){
	$("#railLineDetail").val(recordCns.railLineName);
	$("#startDateDetail").val(recordCns.startDate);
	$("#belongOfficeDetail").val(recordCns.belongOffice);
	$("#endDateDetail").val(recordCns.endDate);
	$("#workContentDetail").val(commNetworkStop_workContent.typeName(recordCns.workContent));
	$("#belongCraftDetail").val(commNetworkStop_major.typeName(recordCns.belongCraft));
	$("#executionTypeDetail").val(commNetworkStop_constructionType.typeName(recordCns.executionType));
	$("#executionAttrDetail").val(commNetworkStop_constructionAttr.typeName(recordCns.executionAttr));
	$("#executionAddrDetail").val(recordCns.executionAddr);
	$("#mainNetNameDetail").val(recordCns.mainNetName);
	$("#railwaysBureauDetail").val(recordCns.railwaysBureau);
	$("#planCaptionDetail").val(recordCns.planCaption);
	$("#planExaminNumDetail").val(recordCns.planExaminNum);
	$("#monthPlanExaminDetail").val(recordCns.monthPlanExamin);
	$("#executionPlanNumDetail").val(recordCns.executionPlanNum);
	$("#situationCaptionDetail").val(recordCns.situationCaption);
	if(recordCns.attachFile != null){//上传附件
		setAttachFileId(recordCns.attachFile.id);
	}
	if(recordCns.examinFile != null){//审核附件
		setAttachFileId(recordCns.examinFile.id);
	}
	if(recordCns.restoreFile != null){//回复附件
		setAttachFileId(recordCns.restoreFile.id);
	}
    $("#skyLightDetail").html(recordCns.skyLight?"是":"否");
}	

</script>
</body>
</html>