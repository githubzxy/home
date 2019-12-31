<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>备品调拨</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	} 
</style>
</head>
<body style="overflow-x: hidden;">
	<!-- 弹出框 -->
	<div id="content">
		<form class="form-horizontal" id="moveForm">
			<div style="margin-top:12px;">
				<span style="float:left; width:85px; margin-left:2px;">原备品信息</span>
				<hr style="float:left; width:520px;height:2px; background: #ccc;margin-top:8px;"></hr>
			</div>
			
			<table class="popUpTable" >
				<tbody>
<!-- 					<tr class="thTdPadding"> -->
<!-- 						<th>设备属性</th> -->
<!-- 		            	<td colspan = "3"> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="deviceProperties" id="devicePropertiesMove"  style="width:98.3%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            </tr> -->
					<tr class="thTdPadding">
						<th>设备类别</th>
		            	<td>
			            	<div>
			            		<input type="text" name="speciality" id="specialityMove"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>所属车间</th>
	            		<td>
	            			<div>
			            		<input type="text" name="workShop" id="workShopMove"  style="width:96%;height:30px" disabled="disabled">
			            		<input type="hidden"  id="workShopMove_hidden"> 
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>设备名称</th>
	            		<td>
	            			<div>
			            		<input type="text" name="sparePartName" id="sparePartNameMove"  style="width:96%;height:30px" disabled="disabled">
	            			</div>
		            	</td>
	           			<th>所属工区</th>
	            		<td>
	            			<div>
								<input type="text" name="workArea" id="workAreaMove"  style="width:96%;height:30px" disabled="disabled">
								<input type="hidden"  id="workAreaMove_hidden"> 
							</div>
		            	</td>
		            </tr>
		             
		            <tr class="thTdPadding">
						<th>规格型号</th>
		            	<td>
			            	<div>
	            				 <input type="text" name="sparePartModel" id="sparePartModelMove"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>存放地点</th>
	           			<td>
			            	<div>
			            		<input type="text" name="depositLocation" id="depositLocationMove"
			            							data-rules="{required:true}"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	
	          		</tr>
	          		<tr class="thTdPadding">
<!-- 	          			<th>现存数量</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="amountM_N" id="amountMove_Now"  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th>单位</th>
	           			<td>
			            	<div>
			            		<input type="text" name="unit" id="unitMove"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          			<th>厂家</th>
	           			<td>
			            	<div>
			            		<input type="text" name="factory" id="factoryMove"  data-rules="{required:true}" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          			
		            </tr>
<!-- 		            <tr class="thTdPadding"> -->
<!-- 		            	<th>单位</th> -->
<!-- 	           			<td colspan = "3"> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="unit" id="unitMove"  style="width:98%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            </tr> -->
		            <tr class="thTdPadding">
<!-- 		            	<th>购置时间</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="purchaseTimeMove" id="purchaseTimeMove" class="calendar" -->
<!-- 			            									  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
						<th>现存数量</th>
		            	<td>
			            	<div>
			            		<input type="text" name="amountM_N" id="amountMove_Now"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>入库时间</th>
		            	<td>
			            	<div>
			            		<input type="text" name="putInTimeMove" id="putInTimeMove" class="calendar"
			            									disabled="disabled"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          		</tr>
<!-- 	          		<tr class="thTdPadding"> -->
<!-- 	          			<th>购置原因</th> -->
<!-- 	           			<td colspan="3"> -->
<!-- 	           			<div> -->
<!--             				<input type="text" name="purchaseReasonMove" id="purchaseReasonMove" style="width:98%;height:30px" disabled="disabled"> -->
<!-- 		            	</div> -->
<!-- 		            	</td> -->
<!-- 		            </tr> -->
	          		<tr class="thTdPadding">
	          			<th>软件版本</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="softwareVersionMove" id="softwareVersionMove"  style="width:98%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="comment" id="commentMove" style="width:98%;height:130px;resize:none"  disabled="disabled" ></textarea>
		            		</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
			
			<div style="margin-top:12px;">
				<span style="float:left; width:85px;margin-left:2px;">接收机构信息</span>
				<hr style="float:left; width:520px;height:2px; background: #ccc;margin-top:8px;"></hr>
			</div>
			
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th><s>*</s>接收车间</th>
		            	<td>
			            	<div>
			            		<select name="workShop" id="workShopAccept" style="width:100%;height:30px" data-rules="{sele:''}">
		            				<option value="">请选择</option>
		            			</select>
			            	</div>
		            	</td>
		            	<th>接收工区</th>
	            		<td>
	            			<div>
			            		<select name="workArea" id="workAreaAccept" style="width:100%;height:30px" disabled="disabled">
		            				<option value="">请选择</option>
		            			</select>
							</div>
		            	</td>
	            	</tr>
	            	<tr class="thTdPadding">
						<th><s>*</s>移库数量</th>
		            	<td colspan="3">
			            	<div>
			            		<input type="text" name="amount" id="amountMove"  
			            								data-rules="{required:true,regexp:[/^\d+$/,'必须为数字']}"  style="width:98%;height:30px">
			            	</div>
		            	</td>
<!-- 		            	<th style="background-color: white;border-right-color: white;"></th> -->
<!-- 	           			<td></td> -->
	            	</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var moveForm; //弹出新增窗口
	var moveTips;
	var id= '${param.id}';
	
	/**初始化弹出框开始*/
	$.post(contextPath + 'sparePartAction/getSparePartById.cn', //根据id查询备品
				{id : id},
				function(result,status){
    				if(status){//成功
// 						console.log(result);
    					setDialogParams(result);
					}
			},'json');
	
	$.post(contextPath + 'organization/getAllWorkshop.cn', //查询所有车间并初始化
			function(result,status){
				if(status){//成功
// 					console.log(result[0]);
					for(var i in result){
						$("#workShopAccept").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化车间下拉选
					}
				}
		},'json');

	//所属车间值改变，触发加载工区下拉列表
	$("#workShopAccept").on("change",function(){
		if($('#workShopAccept').val()){
			$('#workAreaAccept').attr("disabled",false);
		}else{
			$('#workAreaAccept').attr("disabled",true);
		}
		$("#workAreaAccept").find("option[value!='']").remove(); //车间值变化，就清除工区select的所有option
		var id=$("#workShopAccept").find("option:selected").val();
		if(id!=""){
			getWorkAreasByParentId(id);
		}
	});
	
	//查询工区名称并初始化下拉列表
	function getWorkAreasByParentId(id){
		$.post(contextPath + 'organization/getOrgChildrenById.cn', //根据车间查询工区
				{id : id},
				function(result,status){
					if(status){//成功
						for(var i in result){
	//							console.log(result[i]);
							$("#workAreaAccept").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化车间下拉选
						}
					}
				},'json');
	}
	
	
	/**初始化弹出框结束*/
	
	//初始化弹出框方法
	function setDialogParams(result){
// 		$("#specialityMove").val(emergency_speciality.typeName(result.speciality));
		$("#specialityMove").val(emergency_speciality_type.typeName(result.speciality));
// 		$("#sparePartNameMove").val(result.sparePartName.name);
		$("#sparePartNameMove").val(result.platesName);
		$("#workShopMove").val(result.workShop.name);
		$("#workShopMove_hidden").val(result.workShop.id);//隐藏域，赋值为当前记录的车间id
		$("#workAreaMove").val(result.workArea.name);
		$("#workAreaMove_hidden").val(result.workArea.id);//隐藏域，赋值为当前记录的工区id
		$("#sparePartModelMove").val(result.sparePartModel);
		$("#amountMove_Now").val(result.amount);
// 		$("#unitMove").val(emergency_unit.typeName(result.sparePartName.unit));
		$("#unitMove").val(result.unit);
		$("#commentMove").val(result.comment);
		$("#devicePropertiesMove").val(result.deviceProperties);
		$("#factoryMove").val(result.factory);
		$("#depositLocationMove").val(result.depositLocation);
		
		//quyy  加
// 		$("#purchaseTimeMove").val(result.buyDate);
// 		$("#purchaseReasonMove").val(result.buyReason);
		$("#putInTimeMove").val(result.inDate);
		$("#softwareVersionMove").val(result.softwareEdition);
	}
	
	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		
		//消息提示框
		if(moveTips == undefined) {
			moveTips = new Tooltip.Tips({
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
		moveForm = new Form.Form({
			srcNode : '#moveForm',
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

</script>
</body>
</html>