<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改设备</title>
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
			<input type="hidden" id="hiddenType">
			<input type="hidden" id="hiddenName">
			<table class="popUpTable">
				<tr class="thTdPadding" >
					<th style="width: 120px"><font color="red">*</font>设备类别：</th>
					<td>
						<div>
							<select name="deviceType" id="deviceType"  style="width:100%;height:30px" data-rules="{required:true,device:true}">
									
							</select>
						</div>
					</td>
					<th><font color="red">*</font>单位：</th>
					<td>
						<select id="unit"  style="width:100%;height:30px">
						
						</select>
					</td>
				</tr>
				<tr class="thTdPadding" >
					<th><font color="red">*</font>设备名称：</th>
					<td colspan="3">
						<div>
							<input name="deviceName" type="text" id="deviceName"  style="width:98.2% ; height:30px" data-rules="{required:true,device:true,deviceNumber:100}"/>
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
	
	initPage(id);
	
	$(document).ready(function () {
		initSelect();
	});
	
	function initSelect() {
		initDeviceType();
		initUnit();
	}
	function initDeviceType() {
		deviceConfig_type.listData("#updateForm #deviceType");
	}
	function initUnit() {
		//获取单位表中所有单位
		var units = getExistUnitData();
		unit_.listData(units,"#updateForm #unit");
// 		unit_type.listData("#updateForm #unit");
	}
	
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
	          name : 'deviceNumber',  //规则名称
	          msg : '字数不能大于100个',//默认显示的错误信息
	          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
	            if(value.length>baseValue){
	              return formatMsg;
	            }
	          }
	      });
		
	      Form.Rules.add({
	          name : 'device',  //规则名称
	          validator : function(value,baseValue,formatMsg){ 
	        	if($("#updateForm #hiddenName").val()==$("#updateForm #deviceName").val()&&$("#updateForm #hiddenType").val()==$("#updateForm #deviceType").val()){
	        		return;
	        	}
// 	        	  updateForm.clearErrors(false);
				updateForm.getField("deviceName").clearErrors(false);
				updateForm.getField("deviceType").clearErrors(false);
	        	
	          	$.ajax({
	          		url:contextPath + 'deviceConfigAction/checkName.cn',
	          		data:{
	          			"name" : $("#updateForm #deviceName").val(),
	    				"type" : $("#updateForm #deviceType").val()
	          		},
	          		type:'post',
	          		cache : false,
	          		async: false,
	          		success:function(data){
	          			if(data!=""){
	          				formatMsg = "该设备类别下的这个设备已存在！";
	          			}else{
	          				formatMsg= "";
	          			}
	          		}
	          	});
	          	return formatMsg;
	          }
	        });
		
	});
	
	function initPage(id) {
		$.post(contextPath + "deviceConfigAction/getDeviceConfigById.cn",
			{
				id : id
			},function(data){
				$("#updateForm #deviceName").val(data.name);
				$("#updateForm #hiddenName").val(data.name);
				$("#updateForm #deviceType").val(data.deviceCategory);
				$("#updateForm #hiddenType").val(data.deviceCategory);
				$("#updateForm #unit").val(data.unit);
			},
			'json');
	}
</script>
</body>
</html>