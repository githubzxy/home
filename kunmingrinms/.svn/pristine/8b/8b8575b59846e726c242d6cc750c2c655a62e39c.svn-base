<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新增用户</title>
<style type="text/css">
s{
	color: red;
}
</style>
</head>
<body>
<div id="userUpdateContext">
	<div style="padding: 20px" id="userUpdateDiv">
	<form id="updateForm" class="form-horizontal">
		<div class="row">
        	<div class="control-group span16">
				<label class="control-label"><s>*</s>用户名：</label>
				<div class="controls">
					<input type="text" name="savaName" id="savaName" class="input-normal control-text"
	              	 data-rules="{maxlength:100,required : true}"/>
				</div>
			</div>
			<input type="hidden" name="saveId" id="saveId" value=""/>
			<div class="control-group span16">
			<label class="control-label"><s>*</s>组织机构：</label>
	            <div class="controls">
					<jsp:include page="/views/system/userOrgTree.jsp" flush="true" >
					<jsp:param name="org" value="saveOrg" />
					<jsp:param name="orgVal" value="saveOrgVal" />
					<jsp:param name="actionURL" value="organization/getOrgChildrenById.cn" />
					<jsp:param name="width" value="140px" />
					<jsp:param name="height" value="18px" />
					</jsp:include>
				</div>
			</div>
			<div class="control-group span16">
				<label class="control-label">固定电话：</label>
				<div class="controls">
					<input type="text" name="telephoneNumber" id="telephoneNumber" data-rules="{maxlength:20}"
	              	 class="input-normal control-text"/>
	            </div>
			</div>
			<div class="control-group span16">
				<label class="control-label">联系电话：</label>
				<div class="controls">
					<input type="text" name="phone" id="phone" data-rules="{maxlength:20}"
	              	 class="input-normal control-text"/>
	            </div>
			</div>
			<div class="control-group span16">
	            <label class="control-label">备注：</label>
	            <div class="controls">
	              <textarea name="remark" id="remark" class="input-large" data-rules="{maxlength:250}"></textarea>
            	</div>
			</div>
		</div>
	</form>
	</div>
</div>

<script type="text/javascript">
	
var contextPath = '<%=contextPath%>' + '/';
var id = '<%=request.getParameter("id")%>';
var updateForm; //弹出修改窗口
var addTips;

$(document).ready(function(){
	initPage();
});

function initPage() {
	$.post(contextPath + "userInfoAction/getUserById.cn",
		{
			id : id
		},function(item){
			$("#updateForm #saveId").val(item.id);
			$("#updateForm #savaName").val(item.name);
			$("#updateForm #saveOrg").val(item.organization.name);
			$("#updateForm #saveOrgVal").val(item.organization.id);
			$("#updateForm #telephoneNumber").val(item.telephoneNumber);
			$("#updateForm #phone").val(item.phone);
			$("#updateForm #remark").val(item.remark);
		},
		'json');
}

BUI.use(['bui/form', 'bui/tooltip'],
		function(Form, Tooltip){
	//消息提示框
	if(addTips == undefined) {
		addTips = new Tooltip.Tips({
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

</script>
</body>
</html>