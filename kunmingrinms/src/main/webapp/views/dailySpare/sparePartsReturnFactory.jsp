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
					 <tr class="thTdPadding">
						<th>设备所属系统</th>
		            	<td colspan = "3">
			            	<div>
			     		       	<input name="deviceProperties"  type="text" id="devicePropertiesReturn" style="width:98.3%;height:30px"   disabled="disabled">
			            		</input>
			            	</div>
		            	</td>
		            </tr>
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
	           			<th>板件名称</th>
	            		<td>
	            			<div>
			            		<input type="text" name="platesName" id="platesNameReturn"  style="width:96%;height:30px" disabled="disabled">
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
		             	<th>板件可用设备型号</th>
		            	<td>
			            	<div>
			            		<input type="text" name="availableModle" id="availableModle"   style="width:96%;height:34px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>设备或单板编号</th>
	           			<td>
			            	<div>
			            		<input type="text" name="singleNumber" id="singleNumber" style="width:96%;height:34px" disabled="disabled" >
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
		            	<th><s>*</s>返厂数量</th>
	           			<td>
			            	<div>
			            		<input type="text" name="amountReturn" id=amountReturn  
			            							data-rules="{required:true,regexp:[/^\d+$/,'必须为数字']}"  style="width:96%;height:30px">
			            	</div>
		            	</td>
		            </tr>
		             <tr class="thTdPadding">
		            	<th>入库时间</th>
		            	<td>
			            	<div>
			            		<input type="text" name="putInTimeReturn" id="putInTimeReturn" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          			<th>入库原因</th>
	           			<td >
			            	<div>
			            		<input type="text" name="purchaseReasonReturn" id="purchaseReasonReturn"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
	          		<tr class="thTdPadding">
	          			<th>软件版本</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="softwareVersionReturn" id="softwareVersionReturn"  style="width:98.3%;height:30px" disabled="disabled">
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
	$.post(contextPath + 'dailySpare/sparePartAction/getSparePartById.cn', //根据id查询设备名称
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
// 		$("#specialityReturn").val(dailySpare_speciality.typeName(result.speciality));
		$("#specialityReturn").val(result.speciality);
// 		$("#sparePartNameReturn").val(result.sparePartName.name);
		$("#workShopReturn").val(result.workShop.name);
		$("#workAreaReturn").val(result.workArea.name);
		$("#sparePartModelReturn").val(result.sparePartModel);
		$("#amountReturn_Now").val(result.amount);
// 		$("#unitReturn").val(daily_unit.typeName(result.sparePartName.unit));
		$("#unitReturn").val(result.unit);
		$("#commentReturn").val(result.comment);
		$("#devicePropertiesReturn").val(result.deviceProperties);
		$("#factoryReturn").val(result.factory);
		$("#depositLocationReturn").val(result.depositLocation);
		//quyy 加
		$("#availableModle").val(result.availableModle);
		$("#singleNumber").val(result.singleNumber);
		$("#platesNameReturn").val(result.platesName);
		$("#purchaseTimeReturn").val(result.buyDate);
		$("#purchaseReasonReturn").val(result.buyReason);
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