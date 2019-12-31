<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>备品返厂</title>
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
		<form class="form-horizontal" id="returnForm">
			<table class="popUpTable">
				<tbody>
<!-- 					 <tr class="thTdPadding"> -->
<!-- 						<th>设备属性</th> -->
<!-- 		            	<td colspan = "3"> -->
<!-- 			            	<div> -->
<!-- 			     		       	<input name="deviceProperties"  type="text" id="devicePropertiesReturn" style="width:98.3%;height:30px"   disabled="disabled"> -->
<!-- 			            		</input> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            </tr> -->
					<tr class="thTdPadding">
						<th>设备类别</th>
		            	<td>
			            	<div>
			            		<input type="text" name="speciality" id="specialityReturn"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>所属车间</th>
	            		<td>
	            			<div>
			            		<input type="text" name="workShop" id="workShopReturn"  style="width:96%;height:30px" disabled="disabled">
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>设备名称</th>
	            		<td>
	            			<div>
			            		<input type="text" name="sparePartName" id="sparePartNameReturn"  style="width:96%;height:30px" disabled="disabled">
	            			</div>
		            	</td>
	           			<th>所属工区</th>
	            		<td>
	            			<div>
								<input type="text" name="workArea" id="workAreaReturn"  style="width:96%;height:30px" disabled="disabled">
							</div>
		            	</td>
		            </tr>
		           
		            <tr class="thTdPadding">
						<th>规格型号</th>
		            	<td>
			            	<div>
	            				 <input type="text" name="sparePartModel" id="sparePartModelReturn"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>存放地点</th>
	           			<td>
			            	<div>
			            		<input type="text" name="depositLocation" id="depositLocationReturn"
			            							data-rules="{required:true}"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	
	          		</tr>
	          		 <tr class="thTdPadding">
<!-- 	          			<th>现存数量</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="amountReturn_N" id="amountReturn_Now"  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th>单位</th>
	           			<td>
			            	<div>
			            		<input type="text" name="unit" id="unitReturn"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>厂家</th>
	           			<td>
			            	<div>
			            		<input type="text" name="factory" id="factoryReturn"  style="width:96%;height:30px"  disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
	          		<tr class="thTdPadding">
<!-- 	          			<th>单位</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="unit" id="unitReturn"  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
						<th>现存数量</th>
		            	<td>
			            	<div>
			            		<input type="text" name="amountReturn_N" id="amountReturn_Now"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>入库时间</th>
		            	<td>
			            	<div>
			            		<input type="text" name="putInTimeReturn" id="putInTimeReturn" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
<!-- 		            	<th><s>*</s>返厂数量</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="amountReturn" id=amountReturn   -->
<!-- 			            							data-rules="{required:true,regexp:[/^\d+$/,'必须为数字']}"  style="width:96%;height:30px"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            </tr>
		             <tr class="thTdPadding">
<!-- 		            	<th>购置时间</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="purchaseTimeReturn" id="purchaseTimeReturn" style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            	<th>入库时间</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="putInTimeReturn" id="putInTimeReturn" style="width:98%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
						<th><s>*</s>返厂数量</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="amountReturn" id=amountReturn  
			            							data-rules="{required:true,regexp:[/^\d+$/,'必须为数字']}"  style="width:98%;height:30px">
			            	</div>
		            	</td>
	          		</tr>
<!-- 	          		<tr class="thTdPadding"> -->
<!-- 	          			<th>购置原因</th> -->
<!-- 	           			<td colspan="3"> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="purchaseReasonReturn" id="purchaseReasonReturn"  style="width:98%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            </tr> -->
	          		<tr class="thTdPadding">
	          			<th>软件版本</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="softwareVersionReturn" id="softwareVersionReturn"  style="width:98%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="comment" id="commentReturn" style="width:98%;height:130px;resize:none"  disabled="disabled" ></textarea>
		            		</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var returnForm; //弹出新增窗口
	var returnTips;
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
// 		$("#specialityReturn").val(emergency_speciality.typeName(result.speciality));
		$("#specialityReturn").val(emergency_speciality_type.typeName(result.speciality));
// 		$("#sparePartNameReturn").val(result.sparePartName.name);
		$("#sparePartNameReturn").val(result.platesName);
		$("#workShopReturn").val(result.workShop.name);
		$("#workAreaReturn").val(result.workArea.name);
		$("#sparePartModelReturn").val(result.sparePartModel);
		$("#amountReturn_Now").val(result.amount);
// 		$("#unitReturn").val(emergency_unit.typeName(result.sparePartName.unit));
		$("#unitReturn").val(result.unit);
		$("#commentReturn").val(result.comment);
		$("#devicePropertiesReturn").val(result.deviceProperties);
		$("#factoryReturn").val(result.factory);
		$("#depositLocationReturn").val(result.depositLocation);
		//quyy 加
// 		$("#purchaseTimeReturn").val(result.buyDate);
// 		$("#purchaseReasonReturn").val(result.buyReason);
		$("#putInTimeReturn").val(result.inDate);
		$("#softwareVersionReturn").val(result.softwareEdition);
	}
	
	
	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		
		//消息提示框
		if(returnTips == undefined) {
			returnTips = new Tooltip.Tips({
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
		returnForm = new Form.Form({
			srcNode : '#returnForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
	});

</script>
</body>
</html>