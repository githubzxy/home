<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>备品入库</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body style="overflow-x: hidden;">
	<!-- 弹出框 -->
	<div id="content">
		<form class="form-horizontal" id="inForm">
			<table class="popUpTable">
				<tbody>
				 	<tr class="thTdPadding">
						<th>设备所属系统</th>
		            	<td colspan = "3">
			            	<div>
			            		<input type="text" name="deviceProperties" id="devicePropertiesIn"  style="width:98.3%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
					<tr class="thTdPadding">
						<th>设备类别</th>
		            	<td>
			            	<div>
			            		<input type="text" name="speciality" id="specialityIn"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>所属车间</th>
	            		<td>
	            			<div>
			            		<input type="text" name="workShop" id="workShopIn"  style="width:96%;height:30px" disabled="disabled">
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>板件名称</th>
	            		<td>
	            			<div>
			            		<input type="text" name="platesName" id="platesNameIn"  style="width:96%;height:30px" disabled="disabled">
	            			</div>
		            	</td>
	           			<th>所属工区</th>
	            		<td>
	            			<div>
								<input type="text" name="workArea" id="workAreaIn"  style="width:96%;height:30px" disabled="disabled">
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
	            				 <input type="text" name="sparePartModel" id=sparePartModelIn  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>存放地点</th>
	           			<td>
			            	<div>
			            		<input type="text" name="depositLocation" id="depositLocationIn"
			            							data-rules="{required:true}"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
<!-- 	          			<th>现存数量</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="amountIn_n" id=amountIn_now  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th>单位</th>
	           			<td>
			            	<div>
			            		<input type="text" name="unit" id=unitIn  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>厂家</th>
	           			<td>
			            	<div>
			            		<input type="text" name="factory" id="factoryIn"  data-rules="{required:true}" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
<!-- 	          			<th>单位</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="unit" id=unitIn  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th>现存数量</th>
		            	<td>
			            	<div>
			            		<input type="text" name="amountIn_n" id=amountIn_now  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th><font style="color: red">*</font>入库数量</th>
	           			<td>
			            	<div>
			            		<input type="text" name="amount" id=amountIn 
			            							data-rules="{required:true,regexp:[/^\d+$/,'必须为数字']}"  style="width:95%;height:30px">
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
		            	<th>入库时间</th>
		            	<td >
			            	<div>
			            		<input type="text" name="putInTimeIn" id="putInTimeIn" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          			<th>入库原因</th>
	           			<td >
			            	<div>
			            		<input type="text" name="purchaseReasonIn" id="purchaseReasonIn"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
	          		<tr class="thTdPadding">
	          			<th>软件版本</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="softwareVersionIn" id="softwareVersionIn"  style="width:98%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          		</tr>
		            <tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="comment" id="commentIn" style="width:98%;height:120px;resize:none"  disabled="disabled" ></textarea>
		            		</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var inForm; //弹出新增窗口
	var inTips;
	var id= '${param.id}';
	var resultObj;//根据id查询的对象（日常备品）
	
	/**初始化弹出框开始*/
	$.post(contextPath + 'dailySpare/sparePartAction/getSparePartById.cn', //根据id查询设备名称（包含单位）
				{id : id},
				function(result,status){
    				if(status){//成功
// 						console.log(result);
    					resultObj=result;//将返回值存储起来，用于向后台发数据
    					setDialogParams(result);
					}
			},'json');
	
	/**初始化弹出框结束*/
	
	//初始化弹出框参数方法
	function setDialogParams(result){
// 		$("#specialityIn").val(dailySpare_speciality.typeName(result.speciality));
		$("#specialityIn").val(result.speciality);
// 		$("#sparePartNameIn").val(result.sparePartName.name);
		$("#platesNameIn").val(result.platesName);
		$("#workShopIn").val(result.workShop.name);
		$("#workAreaIn").val(result.workArea.name);
		$("#sparePartModelIn").val(result.sparePartModel);
		$("#amountIn_now").val(result.amount);
// 		$("#unitIn").val(daily_unit.typeName(result.sparePartName.unit));
		$("#unitIn").val(result.unit);
		$("#commentIn").val(result.comment);
		$("#devicePropertiesIn").val(result.deviceProperties);
		$("#factoryIn").val(result.factory);
		$("#depositLocationIn").val(result.depositLocation);
		$("#purchaseReasonIn").val(result.buyReason);
		$("#putInTimeIn").val(result.inDate);
		$("#softwareVersionIn").val(result.softwareEdition);
		$("#availableModle").val(result.availableModle);
		$("#singleNumber").val(result.singleNumber);
	}
	
	//获取参数
	function getParamIn(){
		return {
			sparePartId : resultObj.id,
			speciality : resultObj.speciality,
			deviceNameId : resultObj.sparePartName.id,
			sparePartModel : resultObj.sparePartModel,
			availableModle : resultObj.availableModle,
			platesName : resultObj.platesName,
			singleNumber : resultObj.singleNumber,
			workShopId :resultObj.workShop.id,
			workAreaId : resultObj.workArea.id,
			amount : resultObj.amount,
			createDate : resultObj.createDate,
			deviceProperties : resultObj.deviceProperties,
			factory : resultObj.factory,
			depositLocation : resultObj.depositLocation,
			amountOper : $("#amountIn").val(),
			comment : $("#commentIn").val()
		};
	}
	
	
	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		
		//消息提示框
		if(inTips == undefined) {
			inTips = new Tooltip.Tips({
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
		inForm = new Form.Form({
			srcNode : '#inForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
	});

</script>
</body>
</html>