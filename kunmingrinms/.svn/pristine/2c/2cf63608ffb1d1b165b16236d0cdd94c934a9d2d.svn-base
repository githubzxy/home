<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>编辑数据</title>
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
.bui-calendar-panel td a{
	padding:0px;
}
</style>
</head>
<div id="updateDiv" style="height:340px; overflow:scroll;overflow-x:hidden">
	<form id="updateForm">
	 <fieldset>
		<legend>通信设备（线路）质量提高计划汇总表（明细）</legend>
		  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
			<tr>
				<td width="20%" align="right">序号：</td>
				<td width="20%"><span id="seq"></span></td>
				<td width="20%" height="30" align="right">设备名称：</td>
				<td width="20%"><span  id="device_name"></span></td>
			</tr>
			<tr>
				<td width="20%" align="right">计量单位：</td>
				<td width="20%"><span id="unit"></span></td>
				<td width="20%" height="30" align="right">总数量：</td>
				<td width="20%"><span  id="total"></span></td>
			</tr>
			<tr>
				<td width="20%" align="right">不合格数量：</td>
				<td width="20%"><span  id="no_fit_num"></span></td>
			</tr>
			<tr>
				<td width="20%" align="right"><font color="red">*</font>不合格质量状况：</td>
				<td height="120" colspan="3" style="padding:10px 0 0 0">
					<div>
						<textarea id="no_fit_content" style="width:448px; height:115px;" data-rules="{required : true, maxlength:180}" ></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td width="20%" align="right"><font color="red">*</font>采取措施：</td>
				<td height="120" colspan="3" style="padding:10px 0 0 0">
					<div>
						<textarea id="take_step" style="width:448px; height:115px;" data-rules="{required : true, maxlength:180}" ></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td width="20%" align="right"><font color="red">*</font>责任单位：</td>
				<td width="20%">
					<div>
						<input id="duty_org" type="text"   data-rules="{required : true, maxlength:100}" />
					</div>
				</td>
				<td width="20%" height="30" align="right"><font color="red">*</font>责任人：</td>
				<td width="20%">
					<div>
						<input id="duty_people" type="text" data-rules="{required : true, maxlength:100}" />
					</div>
				</td>
			</tr>
			<tr>
				<td width="20%" align="right"><font color="red">*</font>协作人：</td>
				<td width="20%">
					<div>
						<input id="team_people" type="text"   data-rules="{required : true, maxlength:100}" />
					</div>
				</td>
				<td width="20%" height="30" align="right"><font color="red">*</font>完成日期：</td>
				<td width="20%">
					<div>
						<input id="finish_date"  type="text" class="calendar" data-rules="{required : true, maxlength:100}"  style="width:140px;"/>
					</div>
				</td>
			</tr>
			<tr>
				<td width="20%" align="right">备注：</td>
				<td height="120" colspan="3" style="padding:10px 0 0 0">
				  <div>
				  	<textarea id="remark" style="width:448px; height:115px;" data-rules="{maxlength:180}" ></textarea>
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
	var suID = "${param.suID}";
	
	var updateForm;
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
		updateForm = new Form.Form({
			srcNode : '#updateForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
	});

	
	$(document).ready(function() {
		initPage();
	});
	
	//初始化表
	function initPage(){
		$.ajax({
			type : "POST",
			url : "/kunmingrinms/QualityImproveSummary?method=getById",
			dataType : "json",
			data : {
				"suID" :  suID
			},
			success : function(response) {
				if (response.result != 1) {
					alertWarn(response.message);
				} else {
					sourceObj = response.data;
					//设置表单数据
					$("#updateDiv #seq").html(sourceObj[0].SEQ_);
					$("#updateDiv #device_name").html(sourceObj[0].DEVICE_NAME_);
					$("#updateDiv #unit").html(sourceObj[0].UNIT_);
					$("#updateDiv #total").html(sourceObj[0].TEST_IDENTIFY_NUM_);
					$("#updateDiv #no_fit_num").html(sourceObj[0].NO_FIT_NUM_);
					
					$("#updateDiv #no_fit_content").val(sourceObj[0].NO_FIT_CONTENT_);
					$("#updateDiv #take_step").val(sourceObj[0].TAKE_STEP_);
					$("#updateDiv #duty_org").val(sourceObj[0].DUTY_ORG_);
					$("#updateDiv #duty_people").val(sourceObj[0].DUTY_PEOPLE_);
					$("#updateDiv #team_people").val(sourceObj[0].TEAM_PEOPLE_);
					$("#updateDiv #finish_date").val(sourceObj[0].FINISH_DATE_);
					$("#updateDiv #remark").val(sourceObj[0].REMARK_);
				}
			}
		});
	}
</script>
</body>
</html>