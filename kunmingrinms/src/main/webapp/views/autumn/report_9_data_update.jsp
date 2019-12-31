<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<body>

<div id="dataDiv" style="width:650;height:380px;overflow:hidden;overflow-y:auto">
			<form id="dataForm">
			 <fieldset>
				<legend>通信设备年度质量分析汇总表</legend>
				  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td width="20%" align="right"><font color="red">*</font>第一季度：</td>
						<td width="20%">
							<div>
								<input id="firstQuarter" type="text"  data-rules="{required : true, regexp:[/^\d{1,9}$|^\d{1,9}[.]\d{1,3}$/,'请输入正实数，整数位小于9位，小数位1-3位']}"  />
							</div>
						</td>
						<td width="20%" align="right"><font color="red">*</font>第二季度：</td>
						<td width="20%">
							<div>
								<input id="secondQuarter" type="text"  data-rules="{required : true, regexp:[/^\d{1,9}$|^\d{1,9}[.]\d{1,3}$/,'请输入正实数，整数位小于9位，小数位1-3位']}"/>
							</div>	
						</td>
					</tr>
					<tr>
						<td width="20%" align="right"><font color="red">*</font>第三季度：</td>
						<td width="20%">
							<div>
								<input id="thirdQuarter" type="text"  data-rules="{required : true, regexp:[/^\d{1,9}$|^\d{1,9}[.]\d{1,3}$/,'请输入正实数，整数位小于9位，小数位1-3位']}"/>
							</div>
						</td>
						<td width="20%" align="right"><font color="red">*</font>第四季度：</td>
						<td width="20%">
							<div>
								<input id="fourthQuarter" type="text"  data-rules="{required : true, regexp:[/^\d{1,9}$|^\d{1,9}[.]\d{1,3}$/,'请输入正实数，整数位小于9位，小数位1-3位']}"/>
							</div>
						</td>
					</tr>
					<tr>
						<td width="20%" align="right"><font color="red">*</font>采取措施：</td>
						<td height="100" colspan="3" style="padding:10px 0 0 0">
							<div>
						  		<textarea  id="measure" style="width:435px; height:110px;" data-rules="{required : true,maxlength:180}"></textarea>
						  	</div>
						</td>
					</tr>
					<tr>
						<td width="20%" align="right"><font color="red">*</font>未完成情况说明：</td>
						<td height="100" colspan="3" style="padding:10px 0 0 0">
						  <div>
						  	<textarea  id="unfinishedExplain" style="width:435px; height:110px;" data-rules="{required : true,maxlength:180}"></textarea>
						  </div>
						</td>
					</tr>
					<tr>
						<td width="20%" align="right">备注：</td>
						<td height="100" colspan="3"style="padding:10px 0 0 0">
							<div>
								<textarea id="remark" style="width:435px;height:110px;" data-rules="{maxlength:180}"></textarea>
							</div>
						</td>
					</tr>
				  </table>
			  </fieldset>
			</form>
		</div>

</body>
<script type="text/javascript">

var deviceId = "${param.deviceId}";
var year = "${param.year}";
var orgId = "${param.orgId}";

var dataForm;
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
	dataForm = new Form.Form({
		srcNode : '#dataForm',
		errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
	}).render();
});

$(document).ready(function () {

	initPage();
});

function initPage(){
	
	 $.ajax({
		 type: "POST",
		 url: "/kunmingrinms/LineImproveCollection?method=getCheck",
		 dataType: "json",
		 data: {
			 "deviceId":deviceId,
			 "year":year,
			 "orgId":orgId
		},
		 success: function(response){
			 if(response.result!=1){
				 alertWarn(response.message);
			 }else{
				 var data=response.data;
				 if(data!=null){
					 $("#firstQuarter").val(data[0]);
					 $("#secondQuarter").val(data[1]);
					 $("#thirdQuarter").val(data[2]);
					 $("#fourthQuarter").val(data[3]);
					 $("#measure").val(formatNullData(data[4]));
					 $("#unfinishedExplain").val(formatNullData(data[5]));
					 $("#remark").val(formatNullData(data[6]));
				 }else{
					 $("#firstQuarter").val(0);
					 $("#secondQuarter").val(0);
					 $("#thirdQuarter").val(0);
					 $("#fourthQuarter").val(0);
					 $("#measure").val("-");
					 $("#unfinishedExplain").val("-");
					 $("#remark").val("-");
				 }
			 }
		 }
	});
}




</script>
</html>