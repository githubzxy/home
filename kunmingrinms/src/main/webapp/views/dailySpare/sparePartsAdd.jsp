<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增备品</title>
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
		<form class="form-horizontal" id="addForm">
			<table class="popUpTable">
				<tbody>
				 <tr class="thTdPadding">
						<th><s>*</s>设备所属系统</th>
		            	<td colspan = "3">
			            	<div>
			     		       	<select name="deviceProperties" id="devicePropertiesAdd" style="width:100%;height:30px" data-rules="{sele:''}">
			     		       		<option value="">请选择</option>
			            		</select>
			            	</div>
		            	</td>
		            </tr>
					<tr class="thTdPadding"  style="height: 31px">
						<th><s>*</s>设备类别</th>
		            	<td>
			            	<div>
			            		<select name="speciality" id="specialityAdd" style="width:100%;height:30px" data-rules="{sele:''}" disabled="disabled">
			            			<option value="">请选择</option>
			            		</select>
			            	</div>
		            	</td>
		            	<th><s>*</s>所属车间</th>
	            		<td>
	            			<div>
								<select name="workShop" id="workShopAdd" style="width:100%;height:30px" data-rules="{sele:''}">
			            			<option value="">请选择</option>
			            		</select>
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>板件名称</th>
	            		<td>
	            			<div>
	            					<input type="text" name="platesName" id="platesNameAdd"   style="width:95%;height:30px">
	            			</div>
		            	</td>
	           			<th>&nbsp;&nbsp;所属工区</th>
	            		<td>
	            			<div>
								<select name="workArea" id="workAreaAdd" style="width:100%;height:30px" disabled="disabled">
									<option value="">请选择</option>
								</select>
							</div>
		            	</td>
		            </tr>
		             <tr class="thTdPadding">
		             	<th>板件可用设备型号</th>
		            	<td>
			            	<div>
			            		<input type="text" name="availableModle" id="availableModle"   style="width:95%;height:30px">
			            	</div>
		            	</td>
		            	<th>设备或单板编号</th>
	           			<td>
			            	<div>
			            		<input type="text" name="singleNumber" id="singleNumber" style="width:95%;height:30px" >
			            	</div>
		            	</td>
		            </tr>
		             <tr class="thTdPadding">
		             	<th><s>*</s>规格型号</th>
		            	<td>
			            	<div>
			            		<input type="text" name="sparePartModel" id="sparePartModelAdd" data-rules="{required:true,maxlength:50}"  
	            				 style="width:95%;height:30px">
			            	</div>
		            	</td>
		            	<th>存放地点</th>
	           			<td>
			            	<div>
			            		<input type="text" name="depositLocation" id="depositLocationAdd"
			            							  style="width:95%;height:30px" >
			            	</div>
		            	</td>
		            </tr>
		              
		            <tr class="thTdPadding">
		            	<th><s>*</s>数量</th>
		            	<td>
			            	<div>
			            		<input type="text" name="amount" id="amountAdd" 
			            									data-rules="{required:true,regexp:[/^\d+$/,'必须为数字'],min:1,maxlength:50}"  style="width:95%;height:30px">
			            	</div>
		            	</td>
		            	<th>单位</th>
	           			<td >
			            	<div>
			            		<input type="text" name="unit" id="unitAdd" style="width:97%;height:30px" >
<!-- 			            		<input type="hidden"  id="unitAddHidden"> -->
			            	</div>
		            	</td>
<!-- 		            	<th>厂家</th> -->
<!-- 	           			<td> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="factory" id="factoryAdd"   style="width:96%;height:30px" > -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
	          		</tr>
	          		<tr class="thTdPadding">
<!-- 	          			<th>单位</th> -->
<!-- 	           			<td > -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="unit" id="unitAdd" style="width:97%;height:30px" > -->
<!-- 			            		<input type="hidden"  id="unitAddHidden"> -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 		            	<th style="background-color: GhostWhite;border-right: none;"></th> -->
<!-- 		            	<td style="background-color: GhostWhite;border-left:none;"></td> -->
		            	<th>厂家</th>
	           			<td>
			            	<div>
			            		<input type="text" name="factory" id="factoryAdd"   style="width:96%;height:30px" >
			            	</div>
		            	</td>
		            	<th>软件版本</th>
	           			<td colspan="3">
			            	<div>
			            		<input type="text" name="softwareVersionAdd" id="softwareVersionAdd"  style="width:96%;height:30px" >
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
		            	<th>入库时间</th>
		            	<td >
			            	<div>
			            		<input type="text" name="putInTimeAdd" id="putInTimeAdd"  style="width:96%;height:30px" disabled="disabled">
			            	</div>
		            	</td>
	          			<th>入库原因</th>
	           			<td >
			            	<div>
			            		<input type="text" name="purchaseReasonAdd" id="purchaseReasonAdd"  style="width:96%;height:30px">
			            	</div>
		            	</td>
		            </tr>
<!-- 	          		<tr class="thTdPadding"> -->
<!-- 	          			<th>软件版本</th> -->
<!-- 	           			<td colspan="3"> -->
<!-- 			            	<div> -->
<!-- 			            		<input type="text" name="softwareVersionAdd" id="softwareVersionAdd"  style="width:96%;height:30px" > -->
<!-- 			            	</div> -->
<!-- 		            	</td> -->
<!-- 	          		</tr> -->
		            <tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="comment" id="commentAdd" style="width:98%;height:120px;" data-rules="{maxlength:200}"></textarea>
		            		</div>
		            	</td>
	          		</tr>
		            
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var addForm; //弹出新增窗口
	var addTips;
	/***初始化设备属性下拉框****/
// 	daily_attribute.listData("#devicePropertiesAdd");
// 	function getSystemName(){
	 	$.post(contextPath + 'dailySpare/sparePartAction/getSystemName.cn',
				function(result){
						for(var i in result){
							$("#devicePropertiesAdd").append("<option value='" + result[i].value + "' >" + result[i].value+ "</option>");//初始化设备名称下拉选
					}
				},'json');
// 	} 
	
	/**初始化下拉选开始*/	
// 	dailySpare_speciality.listData("#specialityAdd");//初始化设备类别下拉选
	//设备类别值改变，触发加载设备名称下拉列表
/* 	$("#specialityAdd").on("change",function(){
		if($('#specialityAdd').val()){
			$('#sparePartNameAdd').attr("disabled",false);
		}else{
			$('#sparePartNameAdd').attr("disabled",true);
		}
		$("#sparePartNameAdd").find("option[value!='']").remove(); //设备类别值变化，就清除设备名称select的所有option
		$("#unitAdd").val('');//清除单位
		var speciality=$("#specialityAdd").val();
		if(speciality!=""){
			getsparePartNameBySpeciality1(speciality);
		}
	}); */
	$("#devicePropertiesAdd").on("change",function(){
	if($('#devicePropertiesAdd').val()){
		$('#specialityAdd').attr("disabled",false);
	}else{
		$('#specialityAdd').attr("disabled",true);
	}
	$("#specialityAdd").find("option[value!='']").remove(); //设备类别值变化，就清除设备名称select的所有option
// 	$("#unitAdd").val('');//清除单位
	var systemName=$("#devicePropertiesAdd").val();
	if(systemName!=""){
		getTypeBySystemName(systemName);
	}
});

	//根据设备类别查询设备名称
	function getsparePartNameBySpeciality1(speciality){
/* 	 	$.post(contextPath + 'dailySpare/deviceNameAction/getDeviceNamesByDeviceCategory.cn',
			{deviceCategory : speciality},
			function(result,status){
				if(status){//成功
// 					console.log(result);
					for(var i in result){
						$("#sparePartNameAdd").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化设备名称下拉选
					}
				}
			},'json');
			*/
			
	} 
	//根据所属系统获取设备类别
	function getTypeBySystemName(systemName){
 	$.post(contextPath + 'dailySpare/sparePartAction/getTypeBySystemName.cn',
			{"systemName" : systemName},
			function(result){
					for(var i in result){
						$("#specialityAdd").append("<option value='" + result[i].value + "' >" + result[i].value+ "</option>");//初始化设备名称下拉选
				}
			},'json');
			
			
	} 
	
		$.post(contextPath + 'organization/getAllWorkshop.cn', //查询所有车间并初始化
				function(result,status){
    				if(status){//成功
//     					console.log(result[0]);
						for(var i in result){
							$("#workShopAdd").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化车间下拉选
						}
					}
			},'json');
	
	//所属车间值改变，触发加载工区下拉列表
	$("#workShopAdd").on("change",function(){
		if($('#workShopAdd').val()){
			$('#workAreaAdd').attr("disabled",false);
		}else{
			$('#workAreaAdd').attr("disabled",true);
		}
		$("#workAreaAdd").find("option[value!='']").remove(); //车间值变化，就清除工区select的所有option
		var id=$("#workShopAdd").find("option:selected").val();
		if(id!=""){
			getWorkAreasByParentId1(id);
		}
	});
	
	//查询工区名称并初始化下拉列表
	function getWorkAreasByParentId1(id){
		$.post(contextPath + 'organization/getOrgChildrenById.cn', //根据车间查询工区
				{id : id},
				function(result,status){
    				if(status){//成功
						for(var i in result){
// 							console.log(result[i]);
							$("#workAreaAdd").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化车间下拉选
						}
					}
				},'json');
	}
	
	//’设备名称‘值改变，触发加载’单位‘的值
	$("#sparePartNameAdd").on("change",function(){
		var id=$("#sparePartNameAdd").find("option:selected").val();
		if(id!=""){
			$.post(contextPath + 'dailySpare/deviceNameAction/getDeviceNameById.cn', //根据id查询设备名称（包含单位）
					{id : id},
					function(result,status){
	    				if(status){//成功
// 							console.log(result);
	    					$("#unitAddHidden").val(result.unit);//将"单位"的id存放在隐藏域中，用于获取该值发送至服务端
	    					$("#unitAdd").val(daily_unit.typeName(result.unit));
						}
				},'json');
		}
	});
	
/**初始化下拉选结束*/
	
	
	//隐藏本页面单选框里的第一个空白框
	$("#addForm select option[value='']").hide();
	
	//获取对象参数，赋值给全局变量paramAdd
	function getParamAdd(){
		workShopId=$("#workShopAdd").val();
		var workAreaId=$("#workAreaAdd").val();
		if(workAreaId==""){//若工区为空，则工区同车间
			workAreaId=workShopId;
		}
		return {
			speciality : $("#specialityAdd").val(),
			deviceNameId : $("#sparePartNameAdd").val(),
			sparePartModel : $("#sparePartModelAdd").val(),
			workShopId : workShopId,
			workAreaId : workAreaId,
			availableModle : $("#availableModle").val(),
			singleNumber : $("#singleNumber").val(),
			platesName : $("#platesNameAdd").val(),
			amount : $("#amountAdd").val(),
			comment : $("#commentAdd").val(),
			deviceProperties : $("#devicePropertiesAdd").val(),
			factory : $("#factoryAdd").val(),
			buyReason : $("#purchaseReasonAdd").val(),
			softwareEdition : $("#softwareVersionAdd").val(),
			depositLocation:$("#depositLocationAdd").val(),
			unit:$("#unitAdd").val(),
		};
	}
	
	BUI.use(['bui/form', 'bui/tooltip','bui/calendar'],
			function(Form, Tooltip,Calendar){
		//日历
// 		var datePurchaseTimeAdd = new Calendar.DatePicker({
// 			trigger : '#purchaseTimeAdd',
// 			showTime : true,
// 			autoRender : true
// 		});
// 		//设置默认时间
// 		datePurchaseTimeAdd.on('show',function(){
// 			var c = datepickerStart.get('calendar');
// 			c.set('hour',new Date().getHours());
// 			c.set('minute',new Date().getMinutes()+1);
// 			c.set('second',new Date().getSeconds());
// 		});
// 获取迪当前时间，用于填写弹出框的"入库时间"
        var date = new Date();
		var now_date=date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate()+' '+
		date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
		$('#putInTimeAdd').val(now_date);
		//消息提示框
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