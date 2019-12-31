<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改备品</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
</head>
<body style="overflow-x: hidden;">
	<!-- 弹出框 -->
	<div id="content">
		<form class="form-horizontal" id="editForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th>设备所属系统</th>
		            	<td colspan = "3">
			            	<div>
			            		<input type="text" name="deviceProperties" id="devicePropertiesIn" style="width:98.3%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
					<tr class="thTdPadding">
						<th>设备类别</th>
		            	<td>
			            	<div>
			            		<input type="text" name="speciality" id="specialityEdit" style="width:96%;height:30px" disabled="disabled">
			            		<input type="hidden" id="specialityEdit_hidden" >
			            	</div>
		            	</td>
		            	<th>所属车间</th>
	            		<td>
	            			<div>
			            		<input type="text" name="workShop" id="workShopEdit"  style="width:96%;height:30px" disabled="disabled">
			            		<input type="hidden" id="workShopEdit_hidden" >
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>板件名称</th>
	            		<td>
	            			<div>
			            		<input type="text" name="platesName" id="platesNameEdit" style="width:96%;height:30px" disabled="disabled">
<!-- 			            		<input type="hidden" id="sparePartNameEdit_hidden" > -->
	            			</div>
		            	</td>
	           			<th>所属工区</th>
	            		<td>
	            			<div>
								<input type="text" name="workArea" id="workAreaEdit" style="width:96%;height:30px" disabled="disabled">
								<input type="hidden" id="workAreaEdit_hidden" >
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
<!-- 		            	<th>厂家</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="factory" id="factoryEdit" style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th><font style="color: red">*</font>规格型号</th>
		            	<td>
			            	<div>
			            		<input type="text" name="sparePartModel" id=sparePartModelEdit data-rules="{required:true,maxlength:50}"  
	            				 style="width:96%;height:30px" disabled="disabled">
	            				 <input type="hidden"  id="sparePartModelEdit_hidden" >
			            	</div>
		            	</td>
		            	<th>存放地点</th>
	           			<td>
			            	<div>
			            		<input type="text" name="depositLocation" id="depositLocationEdit"
			            						style="width:96%;height:30px" disabled="disabled" >
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
<!-- 						<th><font style="color: red">*</font>规格型号</th> -->
<!-- 		            	<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="sparePartModel" id=sparePartModelEdit data-rules="{required:true,maxlength:50}"   -->
<!-- 	            				 style="width:95%;height:30px"> -->
<!-- 	            				 <input type="hidden"  id="sparePartModelEdit_hidden" > -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
		            	<th><font style="color: red">*</font>数量</th>
		            	<td>
			            	<div>
			            		<input type="text" name="amount" id=amountEdit 
			            							data-rules="{required:true,regexp:[/^\d+$/,'必须为数字'],maxlength:50}"  style="width:95%;height:30px">
			            	</div>
		            	</td>
		            	<th>单位</th>
	           			<td>
			            	<div>
			            		<input type="text" name="unit" id=unitEdit style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
<!-- 		            	<th>厂家</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="factory" id="factoryEdit" style="width:96%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
	          		</tr>
	          		<tr class="thTdPadding">
<!-- 	          			<th>单位</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="unit" id=unitEdit style="width:97%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            	<th style="background-color: GhostWhite;border-right: none;"></th> -->
<!-- 		            	<td style="background-color: GhostWhite;border-left:none;"></td> -->
		            	<th>厂家</th>
	           			<td>
			            	<div>
			            		<input type="text" name="factory" id="factoryEdit" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            	<th>软件版本</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="softwareVersionEdit" id="softwareVersionEdit"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
		            	<th>入库时间</th>
		            	<td>
			            	<div>
			            		<input type="text" name="putInTimeEdit" id="putInTimeEdit" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          			<th>入库原因</th>
	           			<td >
			            	<div>
			            		<input type="text" name="purchaseReasonEdit" id="purchaseReasonEdit" style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
		            </tr>
<!-- 		            <tr class="thTdPadding"> -->
<!-- 	          			<th>软件版本</th> -->
<!-- 	           			<td colspan="3"> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="softwareVersionEdit" id="softwareVersionEdit"  style="width:98%;height:30px" disabled="disabled"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 	          		</tr> -->
		            <tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="comment" id="commentEdit" style="width:98%;height:120px;" data-rules="{maxlength:200}"></textarea>
		            		</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var editForm; //弹出新增窗口
	var editTips;
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
		$("#devicePropertiesIn").val(result.deviceProperties);
// 		$("#specialityEdit").val(dailySpare_speciality.typeName(result.speciality));
		$("#specialityEdit").val(result.speciality);
		$("#platesNameEdit").val(result.platesName);
		$("#workShopEdit").val(result.workShop.name);
		$("#workAreaEdit").val(result.workArea.name);
		$("#sparePartModelEdit").val(result.sparePartModel);
		$("#amountEdit").val(result.amount);
// 		$("#unitEdit").val(daily_unit.typeName(result.sparePartName.unit));
		$("#unitEdit").val(result.unit);
		$("#commentEdit").val(result.comment);
		$("#devicePropertiesEdit").val(result.deviceProperties);
		$("#factoryEdit").val(result.factory);
		$("#depositLocationEdit").val(result.depositLocation);
		
		//给隐藏域设值，用于验证参数
		$("#specialityEdit_hidden").val(result.speciality);
// 		$("#sparePartNameEdit_hidden").val(result.sparePartName.id);
		$("#workShopEdit_hidden").val(result.workShop.id);
		$("#workAreaEdit_hidden").val(result.workArea.id);
		$("#sparePartModelEdit_hidden").val(result.sparePartModel);//原始型号
		
		$("#purchaseTimeEdit").val(result.buyDate);
		$("#purchaseReasonEdit").val(result.buyReason);
		$("#availableModle").val(result.availableModle);
		$("#singleNumber").val(result.singleNumber);
		$("#putInTimeEdit").val(result.inDate);
		$("#softwareVersionEdit").val(result.softwareEdition);
	}
	
	//获取验证参数
	function getValidateParam(){
		return{
			 speciality : $("#specialityEdit_hidden").val(),
		 	 deviceNameId : $("#sparePartNameEdit_hidden").val(),
		 	 sparePartModel :$("#sparePartModelEdit").val(),//改变后的型号
			 workShopId :$("#workShopEdit_hidden").val(),
			 workAreaId : $("#workAreaEdit_hidden").val()
		};
	}
	
	//获取参数
	function getParamEdit(){
		return {
			id:id,
			sparePartModel : $("#sparePartModelEdit").val(),
			amount : $("#amountEdit").val(),
			comment : $("#commentEdit").val()
		};
	}
	
	BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay','bui/select'],
			function(Uploader, Calendar, Form, Tooltip, Grid, Data, Overlay,Select){
		
		//消息提示框
		if(editTips == undefined) {
			editTips = new Tooltip.Tips({
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
		editForm = new Form.Form({
			srcNode : '#editForm',
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