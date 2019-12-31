<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>报表基本信息填写</title>
<style type="text/css">
/*
* 为表单验证“！”悬浮到表单控件上提供绝对定位
* 使用方式：
* <div>
*	  <input type="text" id="replyDate" data-rules="{required:true}" style="width:96%;height:30px;" />
* </div>
*/
table td div {
	position:relative;
}

/*
* 表单验证“！”悬浮到表单控件上（水平居右，垂直居中）
*/
.x-icon-error {
	position: absolute;
	right:0px;
	top: 50%;
	margin-top:-7px;
}
</style>
</head>
<!---------------------- 表基本信息填写框 ------------------->
<div id="baseDiv">
	<form id="baseForm">
	 <fieldset>
		<legend>报表基本信息填写</legend>
		  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
			<tr>
				<td width="20%" align="right">填报单位：</td>
				<td width="20%"><span id="base_fill_org">${sessionScope.user.organization.name}</span></td>
				<td width="20%" height="30" align="right">年度：</td>
				<td width="20%"><span  id="base_year"></span></td>
			</tr>
			<tr>
				<td width="20%" align="right">填报人：</td>
				<td width="20%"><span id="base_fill_user">${sessionScope.user.name}</span></td>
				<td width="20%" height="30" align="right">填报时间：</td>
				<td width="20%"><span id="base_fill_date"><jsp:include page="../common_page/ServerDate.jsp" flush="true"/></span></td>
			</tr>
			<tr>
				<td width="20%" align="right">单位负责人：</td>
				<td width="20%">
					<div>
						<input id="base_duty_user"  type="text"  data-rules="{maxlength:100}" class="inputTextRequired"/>
					</div>
				</td>
			</tr>
		  </table>
		</fieldset>
	</form>
</div>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	
	// 接收url中ID参数
	var orgId = '${sessionScope.user.organization.id}';
	var year = "${param.year}";

	var baseForm;
	var tips;

	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		if(tips == undefined) {
			tips = new Tooltip.Tips({
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
		baseForm = new Form.Form({
			srcNode : '#baseForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
	});

	
	$(document).ready(function() {
		initBasePage();
	});
	
	//初始化表的基础信息	
	function initBasePage(){
		$.ajax({
			type : "POST",
			url : "/kunmingrinms/QualityImproveSummaryForDuan",
			dataType : "json",
			data : {
				"method" : "getBaseInfo",
				"orgId" :  orgId,
				"year" :  year
			},
			success : function(response) {
				if (response.result != 1) {
					alertWarn(response.message);
				} else {
					var data = response.data;
					$("#base_year").html(year);
					$("#base_duty_user").val(data.ORG_DUTY_USER_);
				}
			},
			failure : function(res) {
				alert(res);
			}
		});
	}
</script>
</body>
</html>