<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改应急备品指标</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
/*
* 为表单验证“！”悬浮到表单控件上提供绝对定位
* 使用方式：
* <div>
*	  <input type="text" id="replyDate" data-rules="{required:true}" style="width:96%;height:30px;" />
* </div>
*/
.controls {
	position:relative;
}
/*
* 表单验证“！”悬浮到表单控件上（水平居右，垂直居中）
*/
.controls .x-icon-error {
	position: absolute;
	right:0px;
	top: 50%;
	margin-top:-17px;
}
</style>
</head>
<body>
	<div style="height:100%;overflow-x: hidden;">
		<form id="updateForm" class="form-horizontal" >
			<table class="popUpTable">
				<tr class="thTdPadding" >
					<th>设备类别：</th>
					<td id="type" style="height:30px;background-color: #f0f0f0;">
					</td>
					<th>设备名称：</th>
					<td id="name" style="height:30px;background-color: #f0f0f0;">
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>指标值：</th>
					<td colspan="3">
						<div>
							<input type="text" id="normValue"  style="width:98.2% ; height:30px" data-rules="{required:true,number:true,num:20}"/>
						</div>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th>备注：</th>
					<td colspan="3">
						<div>
							<textarea id="remark" class="input-large"  style="width:98.5%;height:50px; resize:none" data-rules="{remark:150}"></textarea>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	var id = '<%=request.getParameter("id")%>';
	var updateForm;
	var updateTips;
	
	$(document).ready(function () {
		initPage(id);
	});
	
	BUI.use(['bui/uploader', 'bui/grid', 'bui/data', 'bui/form', 'bui/tooltip'],
			function(Uploader, Grid, Data, Form, Tooltip){
		if(updateTips == undefined) {
			updateTips = new Tooltip.Tips({
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
		updateForm = new Form.Form({
			srcNode : '#updateForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
		//自定义验证规则，备注内容限制字数
	      Form.Rules.add({
	          name : 'remark',  //规则名称
	          msg : '字数不能超过150个',//默认显示的错误信息
	          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	            if(value.length>baseValue){
	              return formatMsg;
	            }
	          }
	      });
		
		//自定义验证规则，备注内容限制字数
	      Form.Rules.add({
	          name : 'num',  //规则名称
	          msg : '输入数超出范围',//默认显示的错误信息
	          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	            if(value.length>baseValue){
	              return formatMsg;
	            }
	          }
	      });
		
	});
	
	function initPage(id) {
		$.post(contextPath + "deviceNormConfigAction/getDeviceNormConfigById.cn",
			{
				id : id
			},function(data){
				$("#updateForm #name").html(data.deviceName.name);
				$("#updateForm #type").html( deviceConfig_type.typeName(data.deviceName.deviceCategory));
				$("#updateForm #normValue").val(data.normValue);
				$("#updateForm #remark").val(data.remark);
			},
			'json');
	}
</script>
</body>
</html>