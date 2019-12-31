<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发送审核</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
	 .bui-select-list{
	    overflow: auto;
	    overflow-x: hidden;
	    height: 250px;
  }
  .bui-select .bui-select-input{
  	width:175px;
  	height:30px;
  }
</style>
</head>
<body>
	<!-- 弹出编辑框 -->
	<div id="content">
		<form class="form-horizontal" id="checkForm">
			<table class="popUpTable">
				<tbody>
	          		<tr class="thTdPadding">
		           		<th><font color="red">*</font>组织机构</th>
	            		<td>
	            			<div id="checkOrgInputDiv">
	            				<jsp:include page="/views/circuitWOManage/orgTreeRadio.jsp" flush="true" >
									<jsp:param name="org"  value="checkOrg" />
									<jsp:param name="orgVal"  value="checkOrgVal" />
									<jsp:param name="actionURL"  value="organization/getSegmentByPid.cn" />
									<jsp:param name="width"  value="96%" />
									<jsp:param name="height"  value="30px" />
								</jsp:include>
	            			</div>
		            	</td>
		            	<th><font color="red">*</font>人员</th>
	            		<td>
	            			<div>
	            				<select id="checkReceiveUser" style="width:100%;height:30px" data-rules="{sele:''}" disabled="disabled">
			            		</select>
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
	
	//隐藏单选框里的第一个空白框
	$("checkForm select option[value='']").hide();
	
	BUI.use(['bui/form', 'bui/tooltip', 'bui/grid', 'bui/data','bui/tree', 'bui/extensions/treepicker','bui/select'],
			function(Form, Tooltip, Grid, Data,Tree, TreePicker,Select){
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
		
    	
    /**BUI结束**/
	});
	
	$(orgValInputId).on("change",function(){
		if($(orgValInputId).val()){
			$('#checkReceiveUser').attr("disabled",false);
		}else{
			$('#checkReceiveUser').attr("disabled",true);
		}
		//清除下拉选列表
		$("#checkReceiveUser").find("option[value!='']").remove();
		var orgId=$(orgValInputId).val();//审核单位id
		initUsers(orgId);
	});
	
	
	function initUsers(orgId){
		   $.ajax({
				type: "POST",
				url: contextPath+"userAction/getUsersByOrgId.cn",
				dataType: "json",
				data : {"orgId" : orgId},
				success:function(data) {
					for(var i in data){
						$("#checkReceiveUser").append("<option value='" + data[i].id + "' >" +data[i].name+ "</option>");
					}
				},
				error :function(res){
					alert("加载人员列表异常");
				}
			});
	   }
	
	
	
</script>
</body>
</html>