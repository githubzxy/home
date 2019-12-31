<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>任务回复</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />

</head>
<body>
	<div>
		<form class="form-horizontal" id="replyForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
		           		<th><font color="red">*</font>完成时间</th>
		           		<td>
							<div>
								<input type="text" id="responseDate" class="calendar" 
								data-rules="{required:true}" style="width:96%;height:30px;" readonly="readonly"
								value="${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}" />
							</div>
						</td>
		            	<th><font color="red">*</font>负责人</th>
		            		<td>
		            			<div>
		            				<input type="text"  value="${sessionScope.user.name}" id="chargeUser"  style="width:96%;height:30px" disabled="disabled"/>
		            			</div>
			            	</td>
	          		</tr>
	          		<tr class="thTdPadding" >
						<th>回复附件</th>
						<td colspan="3">
								<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
		            				<jsp:param name="width"  value="100%" />
									<jsp:param name="height"  value="90px" />
		            			</jsp:include>
						</td>
					</tr>
	          		<tr class="thTdPadding">
		           		<th><font color="red">*</font>完成情况</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea  id="responseContent"  data-rules="{required:true,maxlength:200}" style="width:98.3%;height:90px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          	</tbody>
			</table>
		</form>
	</div>
		
<script type="text/javascript">

var replyForm;
var replyTips;

var id= '${param.id}';

//再次点击清空时间
$('#limitTimeAdd').on('click',(function(){
	$('#limitTimeAdd').val("");
}));

BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay'],
		function(Uploader, Calendar, Form, Tooltip, Grid, Data, Overlay){
	//日历
	var responseDate = new Calendar.DatePicker({
		trigger : '#responseDate',
		showTime : true,
		autoRender : true
	});
	
	//消息提示框
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
	
	//自定义验证规则，选择框必须选值
       Form.Rules.add({
           name : 'sele',  //规则名称
           msg : '请选择一个值',//默认显示的错误信息
           validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
             if(value==baseValue){
               return formatMsg;
             }
           }
       });
	
	
});


			

</script>
</body>
</html>