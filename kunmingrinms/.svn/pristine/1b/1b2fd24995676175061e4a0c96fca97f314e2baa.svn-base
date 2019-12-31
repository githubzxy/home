<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>停机要点计划审核</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	} 

</style>
</head>
<body style="overflow: hidden;">
	<!-- 弹出编辑框 -->
	<div id="content">
		<form class="form-horizontal" id="checkForm">
			<table class="popUpTable">
				<tbody>
		            <tr class="thTdPadding">
		           		<th style="width:120px;"><s>*</s>方案审批编号</th>
	            		<td>
	            			<div>
	            				<input type="text" name="planExaminNum" id="planExaminNumCheck" data-rules="{required:true,maxlength:50}"  style="width:98%;height:30px">
	            			</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th style="width:120px;"><s>*</s>月度计划审批编号</th>
	            		<td>
	            			<div>
	            				<input type="text" name="monthPlanExamin" id="monthPlanExaminCheck" data-rules="{required:true,maxlength:50}"  style="width:98%;height:30px">
	            			</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th style="width:120px;"><s>*</s>昆铁施工台计划号</th>
	            		<td>
	            			<div>
	            				<input type="text" name="executionPlanNum" id="executionPlanNumCheck"  data-rules="{required:true,maxlength:50}"  style="width:98%;height:30px">
	            			</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th style="width:120px;">审核附件</th>
	            		<td colspan="3" >
	            			<div>
								<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
	            				<jsp:param name="width"  value="100%" />
								<jsp:param name="height"  value="80px" />
		            		</jsp:include>
							</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	var checkForm; //弹出新增窗口
	var checkTips;
	
	var id= '${param.id}';
	
	//遍历对象，并填充至相应的位置
// 	$.each(recordSelected,function(key,val){
// 		$("#"+key+"Edit").val(val);
// // 		$("#"+key+"Edit").find("option[value='1']").attr("selected",true);
// 	});
	
	//隐藏单选框里的第一个空白框
	$("checkForm select option[value='']").hide();
	
	BUI.use(['bui/form', 'bui/tooltip'],
			function( Form, Tooltip){
		//消息提示框
		if(checkTips == undefined) {
			checkTips = new Tooltip.Tips({
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
		checkForm = new Form.Form({
			srcNode : '#checkForm',
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
	
	function getParamCheck(){
		return {
			id:id,
			planExaminNum : $("#planExaminNumCheck").val(),
			monthPlanExamin:$("#monthPlanExaminCheck").val(),
			executionPlanNum:$("#executionPlanNumCheck").val()
		};
	}
	
</script>
</body>
</html>