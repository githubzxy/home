<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>备品出库</title>
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
		<form class="form-horizontal" id="outForm">
			<table class="popUpTable">
				<tbody>
<!-- 					<tr class="thTdPadding"> -->
<!-- 						<th>设备属性</th> -->
<!-- 		            	<td colspan = "3"> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="deviceProperties" id="devicePropertiesOut"  style="width:98.3%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            </tr> -->
					<tr class="thTdPadding">
						<th>设备类别</th>
		            	<td>
			            	<div>
			            		<input type="text" name="speciality" id="specialityOut"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>所属车间</th>
	            		<td>
	            			<div>
			            		<input type="text" name="workShop" id="workShopOut"  style="width:96%;height:30px" disabled="disabled">
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>设备名称</th>
	            		<td>
	            			<div>
			            		<input type="text" name="sparePartName" id="sparePartNameOut"  style="width:96%;height:30px" disabled="disabled">
	            			</div>
		            	</td>
	           			<th>所属工区</th>
	            		<td>
	            			<div>
								<input type="text" name="workArea" id="workAreaOut"  style="width:96%;height:30px" disabled="disabled">
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th>规格型号</th>
		            	<td>
			            	<div>
	            				 <input type="text" name="sparePartModel" id="sparePartModelOut"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>存放地点</th>
	           			<td>
			            	<div>
			            		<input type="text" name="depositLocation" id="depositLocationOut"
			            							data-rules="{required:true}"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
<!-- 	          			<th>现存数量</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="amountN" id="amountNow_out"  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
						<th>单位</th>
	           			<td>
			            	<div>
			            		<input type="text" name="unit" id="unitOut"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          			<th>厂家</th>
	           			<td>
			            	<div>
			            		<input type="text" name="factory" id="factoryOut"  data-rules="{required:true}" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	
		            </tr>
		            <tr class="thTdPadding">
<!-- 	          			<th>单位</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="unit" id="unitOut"  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th>现存数量</th>
		            	<td>
			            	<div>
			            		<input type="text" name="amountN" id="amountNow_out"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>入库时间</th>
		            	<td>
			            	<div>
			            		<input type="text" name="putInTimeOut" id="putInTimeOut" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
<!-- 		            	<th><font style="color: red">*</font>出库数量</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="amountO" id="amountOut"  -->
<!-- 			            							data-rules="{required:true,regexp:[/^\d+$/,'必须为数字']}"  style="width:96%;height:30px"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            </tr>
		             <tr class="thTdPadding">
<!-- 		            	<th>购置时间</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="purchaseTimeOut" id="purchaseTimeOut" style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            	<th>入库时间</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="putInTimeOut" id="putInTimeOut" style="width:98%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th><font style="color: red">*</font>出库数量</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="amountO" id="amountOut" 
			            							data-rules="{required:true,regexp:[/^\d+$/,'必须为数字']}"  style="width:98%;height:30px">
			            	</div>
		            	</td>
	          		</tr>
<!-- 	          		<tr class="thTdPadding"> -->
<!-- 	          			<th>购置原因</th> -->
<!-- 	           			<td colspan="3"> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="purchaseReasonOut" id="purchaseReasonOut"  style="width:98%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            </tr> -->
	          		<tr class="thTdPadding">
	          			<th>软件版本</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="softwareVersionOut" id="softwareVersionOut"  style="width:98%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          		</tr>
		            <tr class="thTdPadding">
		           		<th>使用原因</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="rearon" id="rearonOut" style="width:98%;height:130px;" data-rules="{maxlength:200}"></textarea>
		            		</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var outForm; //弹出新增窗口
	var outTips;
	var id= '${param.id}';
	
	/**初始化弹出框开始*/
	$.post(contextPath + 'sparePartAction/getSparePartById.cn', //根据id查询设备名称
				{id : id},
				function(result,status){
    				if(status){//成功
// 						console.log(result);
    					setDialogParams(result);
					}
			},'json');
	
	/**初始化弹出框结束*/
	
	//初始化弹出框方法
	function setDialogParams(result){
// 		$("#specialityOut").val(emergency_speciality.typeName(result.speciality));
		$("#specialityOut").val(emergency_speciality_type.typeName(result.speciality));
// 		$("#sparePartNameOut").val(result.sparePartName.name);
		$("#sparePartNameOut").val(result.platesName);
		$("#workShopOut").val(result.workShop.name);
		$("#workAreaOut").val(result.workArea.name);
		$("#sparePartModelOut").val(result.sparePartModel);
		$("#amountNow_out").val(result.amount);
// 		$("#unitOut").val(emergency_unit.typeName(result.sparePartName.unit));
		$("#unitOut").val(result.unit);
		$("#commentOut").val(result.comment);
		$("#devicePropertiesOut").val(result.deviceProperties);
		$("#factoryOut").val(result.factory);
		$("#depositLocationOut").val(result.depositLocation);
		
		//quyy  加
// 		$("#purchaseTimeOut").val(result.buyDate);
// 		$("#purchaseReasonOut").val(result.buyReason);
		$("#putInTimeOut").val(result.inDate);
		$("#softwareVersionOut").val(result.softwareEdition);
	}
	
	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		
		//消息提示框
		if(outTips == undefined) {
			outTips = new Tooltip.Tips({
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
		outForm = new Form.Form({
			srcNode : '#outForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
	});

</script>
</body>
</html>