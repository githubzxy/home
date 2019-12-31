<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>工单重派</title>
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
		<form class="form-horizontal" id="resendForm">
			<table class="popUpTable">
				<tbody>
	          		<tr class="thTdPadding">
		           		<th><font color="red">*</font>组织机构</th>
	            		<td>
	            			<div>
		            			<input type="text" name="resendOrg" id="resendOrg" class="control-text" style="width:96%; height:30px" data-rules="{required:true}" readonly="readonly"/>
								<input type="hidden" name="resendOrgVal" id="resendOrgVal"  />
	            			</div>
		            	</td>
		            	<th><font color="red">*</font>人员</th>
	            		<td>
	            			<div>
	            				<select id="resendReceiveUser" style="width:100%;height:30px" data-rules="{sele:''}" disabled="disabled">
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
	var resendForm; //弹出新增窗口
	var resendTips;
	
	var curOrgType = "${sessionScope.user.organization.type}";
	var curOrgId = "${sessionScope.user.organization.id}";
// 	alert("${sessionScope.user.organization.type eq 4 ? '车间' : '科室'}");
	//隐藏单选框里的第一个空白框
	$("resendForm select option[value='']").hide();
	
	BUI.use(['bui/form', 'bui/tooltip', 'bui/data','bui/tree', 'bui/extensions/treepicker'],
			function(Form, Tooltip, Data,Tree, TreePicker){
		//消息提示框
		if(resendTips == undefined) {
			resendTips = new Tooltip.Tips({
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
		resendForm = new Form.Form({
			srcNode : '#resendForm',
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
    	
		
		var treeUrl = contextPath + "organization/getAllWorkshop.cn";
		var treeOrgId = "";
		if(curOrgType == ORG_TYPE_CJ) {// 如果登录用户所属组织机构为车间
			treeUrl = contextPath + "organization/getOrgChildrenById.cn";
			treeOrgId = curOrgId;
		}
		
    	/*
		*渲染组织机构树
		*/
		var treeStore = new Data.TreeStore({
			url : treeUrl,
			proxy : {
				method : 'post',
				dataType : 'json'
			},
			map : {	// 节点映射
				'name' : 'text',	// 节点显示文本
			}
		});
		// 默认加载昆明通信段
		treeStore.load({id : treeOrgId});

		var tree = new Tree.TreeList({
			store : treeStore,
			showLine : true,	//显示连接线
			cascadeCheckd : false, //不级联勾选
			width : 206, 
			height : 171
		});

		new TreePicker({
			trigger : "#resendOrg",
			valueField : "#resendOrgVal", //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
			align:{
				node:'window' ,
				points: ['bl', 'tl'],	// 弹出窗口在文本框的正上方
				offset : [0,0]
			},
			autoRender : true,
			children : [ tree ] //配置picker内的列表
		});
		
    /**BUI结束**/
	});
	
	$("#resendOrgVal").on("change",function(){
		if($('#resendOrgVal').val()){
			$('#resendReceiveUser').attr("disabled",false);
		}else{
			$('#resendReceiveUser').attr("disabled",true);
		}
		//清除下拉选列表
		$("#resendReceiveUser").find("option[value!='']").remove();
		var orgId=$("#resendOrgVal").val();//审核单位id
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
						$("#resendReceiveUser").append("<option value='" + data[i].id + "' >" +data[i].name+ "</option>");
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