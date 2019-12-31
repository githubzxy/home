<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新增子机构</title>
</head>
<div id="addDiv">
	<form class="form-horizontal" id="addForm">
		<div class="row" style="padding-top: 20px;">
				<div class="control-group span8">
					<label class="control-label"><font color="red">*</font>机构名称：</label>
					<div class="controls">
							<input class="input-normal control-text" type="text"  id="orgNameAdd" data-rules="{required:true, maxlength: 15}"/>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><font color="red">*</font>上级机构：</label>
					<div class="controls">
						<input class="input-normal control-text" type="text"  id="parentOrgAdd"  disabled="disabled"/>
						<input type="hidden" id="parentOrgIdAdd"  />
					</div>
				</div>
		</div>
		<div class="row">
				<div class="control-group span8">
					<label class="control-label"><font color="red">*</font>机构类型：</label>
					<div class="controls">
						<select id="orgTypeAdd" data-rules="{required:true}" ></select>
					</div>
				</div>
		</div>
		<div class="row">
			<div class="control-group span16">
					<label class="control-label">机构描述：</label>
					<div class="controls">
						<input class="input-large control-text" type="text"  id="orgDescAdd" style="width: 460px;" data-rules="{maxlength: 30}"/>
					</div>
				</div>
		</div>
	</form>
</div>
<script type="text/javascript">

	var addForm;
	var addTips;
	
	$(document).ready(function () {
		
		organization_type.listData("#orgTypeAdd");
		
		var orgObj = orgTree.getSelected();
		$("#parentOrgAdd").val(orgObj.text);
		$("#parentOrgIdAdd").val(orgObj.id);
	});

	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		if(addTips == undefined) {
			addTips = new Tooltip.Tips({
		        tip : {
		          trigger : '.x-icon-error', //出现此样式的元素显示tip
		          alignType : 'right', //默认方向
		          elCls : 'tips tips-warning tips-no-icon tip',
		          elStyle : {display: 'none'},
		          listeners : {
		        	  triggerchange : function() {
		        		  $(".bui-tooltip").show();
		        	  }  
		          },
		          zIndex : '2000',
		          offset : 10 //距离左边的距离
		        }
		      }).render();
			
			var tip = addTips.get('tip');
			tip.set('elStyle', {left : '0px', top : '0px'});
		}
     	
		// 渲染BUIForm，用于表单元素验证
		addForm = new Form.Form({
			srcNode : '#addForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
	});
</script>
</body>
</html>