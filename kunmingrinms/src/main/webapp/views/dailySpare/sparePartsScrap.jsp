<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>备品报废</title>
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
		<form class="form-horizontal" id="scrapForm">
			<table class="popUpTable">
				<tbody>
					 <tr class="thTdPadding">
						<th>设备所属系统</th>
		            	<td colspan = "3">
			            	<div>
			            		<input type="text" name="deviceProperties" id="devicePropertiesScrap"  style="width:98.3%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
					<tr class="thTdPadding">
						<th>设备类别</th>
		            	<td>
			            	<div>
			            		<input type="text" name="speciality" id="specialityScrap"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>所属车间</th>
	            		<td>
	            			<div>
			            		<input type="text" name="workShop" id="workShopScrap"  style="width:96%;height:30px" disabled="disabled">
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>板件名称</th>
	            		<td>
	            			<div>
			            		<input type="text" name="platesName" id="platesNameScrap"  style="width:96%;height:30px" disabled="disabled">
	            			</div>
		            	</td>
	           			<th>所属工区</th>
	            		<td>
	            			<div>
								<input type="text" name="workArea" id="workAreaScrap"  style="width:96%;height:30px" disabled="disabled">
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
	            				 <input type="text" name="sparePartModel" id="sparePartModelScrap"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>存放地点</th>
	           			<td>
			            	<div>
			            		<input type="text" name="depositLocation" id="depositLocationScrap"
			            							data-rules="{required:true}"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	
	          		</tr>
	          		  <tr class="thTdPadding">
<!-- 	          			<th>现存数量</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="amountScrap_N" id="amountScrap_Now"  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th>单位</th>
	           			<td>
			            	<div>
			            		<input type="text" name="unit" id="unitScrap"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>厂家</th>
	           			<td>
			            	<div>
			            		<input type="text" name="factory" id="factoryScrap"  data-rules="{required:true}" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            </tr>
	          		<tr class="thTdPadding">
<!-- 	          			<th>单位</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="unit" id="unitScrap"  style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th>现存数量</th>
		            	<td>
			            	<div>
			            		<input type="text" name="amountScrap_N" id="amountScrap_Now"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th><s>*</s>报废数量</th>
	           			<td>
			            	<div>
			            		<input type="text" name="amount" id="amountScrap"  
			            							data-rules="{required:true,regexp:[/^\d+$/,'必须为数字']}"   style="width:96%;height:30px">
			            	</div>
		            	</td>
		            </tr>
		             <tr class="thTdPadding">
		            	<th>入库时间</th>
		            	<td>
			            	<div>
			            		<input type="text" name="putInTimeScrap" id="putInTimeScrap" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          			<th>入库原因</th>
	           			<td >
			            	<div>
			            		<input type="text" name="purchaseReasonScrap" id="purchaseReasonScrap"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
	          		<tr class="thTdPadding">
	          			<th>软件版本</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="softwareVersionScrap" id="softwareVersionScrap"  style="width:98.3%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          		</tr>
		            <tr class="thTdPadding">
		           		<th>报废原因</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="reason" id="reasonScrap" style="width:98.3%;height:90px;" data-rules="{maxlength:200}"></textarea>
		            		</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var scrapForm; //弹出新增窗口
	var scrapTips;
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
// 		$("#specialityScrap").val(dailySpare_speciality.typeName(result.speciality));
		$("#specialityScrap").val(result.speciality);
// 		$("#sparePartNameScrap").val(result.sparePartName.name);
		$("#workShopScrap").val(result.workShop.name);
		$("#workAreaScrap").val(result.workArea.name);
		$("#sparePartModelScrap").val(result.sparePartModel);
		$("#amountScrap_Now").val(result.amount);
// 		$("#unitScrap").val(daily_unit.typeName(result.sparePartName.unit));
		$("#unitScrap").val(result.unit);
		$("#commentScrap").val(result.comment);
		$("#devicePropertiesScrap").val(result.deviceProperties);
		$("#factoryScrap").val(result.factory);
		$("#depositLocationScrap").val(result.depositLocation);
		
		$("#availableModle").val(result.availableModle);
		$("#singleNumber").val(result.singleNumber);
		$("#platesNameScrap").val(result.platesName);
		$("#purchaseTimeScrap").val(result.buyDate);
		$("#purchaseReasonScrap").val(result.buyReason);
		$("#putInTimeScrap").val(result.inDate);
		$("#softwareVersionScrap").val(result.softwareEdition);
	}
	
	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		
		//消息提示框
		if(scrapTips == undefined) {
			scrapTips = new Tooltip.Tips({
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
		scrapForm = new Form.Form({
			srcNode : '#scrapForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
	});

</script>
</body>
</html>