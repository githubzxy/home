<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新增应急备品指标</title>
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
					<th><font color="red">*</font>设备类别：</th>
					<td>
						<div>
							<select name="type" id="type" style="width:100%;height:30px" data-rules="{select:-1}">
								<option value="-1"></option>
							</select>
						</div>
					</td>
					<th><font color="red">*</font>设备名称：</th>
					<td>
						<div>
							<select name="name" id="name" style="width:100%;height:30px" data-rules="{required:true,norm:true,select:-1}" >
								<option value="-1"></option>
							</select>
							<input type = "hidden" id="flag">
						</div>
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
							<textarea id="remark" class="input-large"  style="width:98.5%;height:50px; resize:none" placeholder="最多输入150字" data-rules="{remark:150}"></textarea>
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
	var addStore,addGrid;// 列表及数据源声明
	
	$("select option[value='-1']").hide();
	
	$(document).ready(function () {
		initSelect();
	});
	
	function initSelect() {
		initDeviceType();
	}
	function initDeviceType() {
        deviceConfig_type.listData("#addForm #type");
	}
	var selectType = document.getElementById('type');
	//为option设置点击事件
	selectType.onchange = function(){
			
		if($("#type").val()==""){
			
			var selectName= document.getElementById('name');
			selectName.setAttribute("disabled", true);
			selectName.options[0].selected = true;
			return;
			
		}else if($("#type").val()!=""){
			
			var selectName = document.getElementById('name');
			selectName.removeAttribute("disabled");
			//将select中的option全部清除
			$("#name option[value!='-1']").remove();
			var typeId = $("#type").val();
			//通过设备类别查询设备
			$.post(contextPath + 'deviceNormConfigAction/getDeivceConfigByTypeId.cn',
					{
						typeId : typeId
					},
					function(data,status){
				
						if(status){
							
							var selectName = document.getElementById('name');
							
							for(var i = 0 ; i < data.length ; i++){
							
								var s = data[i].name;
								
								var id = data[i].id;
								
								selectName.options[i+1] = new Option(s,id);
								
							}
							
						}else{
// 							console.log("error");
						}
					},'json');
			
		}
		
	};

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
		
		//自定义验证规则，选择框必须选值
        Form.Rules.add({
            name : 'select',  //规则名称
            msg : '请选择',//默认显示的错误信息
            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
              if(value==baseValue){
                return formatMsg;
              }
            }
        });
		
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
      
      Form.Rules.add({
          name : 'num',  //规则名称
          msg : '输入数超出范围',//默认显示的错误信息
          validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
            if(value.length>baseValue){
              return formatMsg;
            }
          }
      });
    
      Form.Rules.add({
          name : 'norm',  //规则名称
          validator : function(value,baseValue,formatMsg){ 
          	$.ajax({
          		url:contextPath + 'deviceNormConfigAction/checkNorm.cn',
          		data:{
          			"name": value
          		},
          		type:'post',
          		cache : false,
          		async: false,
          		success:function(data){
//           			console.log(data);
          			if(data){
          				formatMsg = "该设备已配置";
          			}else{
          				formatMsg= "";
          			}
          		}
          	});
          	return formatMsg;
          }
        });
		
});
</script>
</body>
</html>