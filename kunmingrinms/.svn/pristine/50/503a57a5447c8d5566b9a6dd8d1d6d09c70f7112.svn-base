<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新增单位</title>
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
		<form id="addForm" class="form-horizontal" >
			<table class="popUpTable">
				<tr class="thTdPadding" >
					<th><font color="red">*</font>单位名称：</th>
					<td>
						<div>
							<input name="unit" type="text" id="unit"  style="width:95.5% ; height:30px" data-rules="{required:true,unit:10}"/>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>

<script type="text/javascript">

	var contextPath = '<%=contextPath%>' + '/';
	var addForm;
	var addTips;

BUI.use(['bui/uploader','bui/grid', 'bui/data', 'bui/form', 'bui/tooltip', 'bui/tree', 'bui/extensions/treepicker'],
	function(Uploader,Grid, Data, Form, Tooltip, Tree, TreePicker){
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
		addForm = new Form.Form({
			srcNode : '#addForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
      //自定义验证规则，备注内容限制字数
      Form.Rules.add({
          name : 'unit',  //规则名称
          msg : '字数不能超过10个',//默认显示的错误信息
          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
            if(value.length>baseValue){
              return formatMsg;
            }
          }
      });
		
});
</script>
</body>
</html>