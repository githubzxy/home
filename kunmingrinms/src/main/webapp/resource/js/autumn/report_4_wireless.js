$(document).ready(function(){
	getTable1();
	getBase1();
	$(".table1_base_update").click(table1_base_update);
	$("#exportBtn").click(exportTable);
});

function getTable1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/DeviceCollectionWireless?method=queryAll",
		dataType: "json",
		data: {
			"year":$("#year").html(),
			"orgId":$("#orgId").val()
		},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				
				var html="";
				var thead=$("#table1 thead");
				var base=$("#base");
				$("#table1").html("");
				$("#table1").html(thead);
				$.each(data,function(i,node) {	//遍历所有类型
						html+="<tr>";
						if(node.ROW_SPAN_ != null)
							html+="   <td rowspan='"+node.ROW_SPAN_+"'>"+formatNullData(node.DEVICE_TYPE_NAME_)+"</td>";
						if(/^[0-9]*$/.test(node.SEQ_)) {
							//为数字
							html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
							html+="   <td>"+formatNullData(node.DEVICE_NAME_)+"</td>";
						} else if(node.SEQ_ != null) {
							//不为数字 单项小计
							html+="   <td colspan='2'>"+formatNullData(node.SEQ_)+"</td>";
						} else {
							// 综合合格率
							html+="   <td colspan='3'>"+formatNullData(node.DEVICE_TYPE_NAME_)+"</td>";
						}
						html+="   <td>"+formatNullData(node.UNIT_)+"</td>";
						html+="   <td>"+formatNullData(node.TEST_IDENTIFY_NUM_)+"</td>";
						html+="   <td>"+formatDecimalData(node.FIT_NUM_)+"</td>";
						html+="   <td>"+formatPercentData(node.FIT_PER_)+"%</td>";
						html+="   <td>"+formatDecimalData(node.NO_FIT_NUM_)+"</td>";
						html+="   <td>"+formatPercentData(node.NO_FIT_PER_)+"%</td>";
						html+="   <td>"+formatNullData(node.REMARK_)+"</td>";
						// 编号为数字
						// 没有数据或数据全部为0
						if(/^[0-9]*$/.test(node.SEQ_) 
								&& formatNullData(node.TEST_IDENTIFY_NUM_) != 0){
							
								html+="   <td><a onclick=\"table1_update('"+node.DEVICE_ID_+"','"+formatNullData(node.REMARK_)+"')\" href='javascript:;' class='faction'>修改备注</a></td>";
						} else {
							html+="   <td></td>";
						}
						html+="</tr>";
				});
				$("#table1").append(html);
				$("#table1").append(base);
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}
function getBase1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/DeviceCollectionWireless?method=getBase",
		dataType: "json",
		data: {
			"year":$("#year").html(),
			"orgId":$("#orgId").val()
		},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				if(data!=null){
					$("#fill_duty_user").html(formatNullData(data.ORG_DUTY_USER_));
					$("#fill_user").html(formatNullData(data.FILL_USER_));
					$("#fill_date").html(formatNullData(data.FILL_DATE_));
				}
			}
		}
	});
}

function table1_base_update(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/DeviceCollectionWireless?method=getBase",
		dataType: "json",
		data: {
			"year":$("#year").html(),
			"orgId":$("#orgId").val()
		},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				if(data!=null){
					$("#org_duty_user").val(formatNullData(data.ORG_DUTY_USER_));
				}
			}
		}
	});
	$("#table1_base_add_div").show();
	$("#table1_base_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"报表基本信息填写",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table1_base_add_form").form('validate');
				 if(validate){
					 $.ajax({
							type: "POST",
							url: "/kunmingrinms/DeviceCollectionWireless?method=addBase",
							dataType: "json",
							data : {
								"year" : $("#base_year").html(),
								"orgId" : $("#orgId").val(),
								"orgDutyUser" : $("#org_duty_user").val(),
								"fillUser" : $("#base_fill_user").html(),
								"fillDate" : $("#base_fill_date").html()
							},
							success: function(response){
								if(response.result!=1){
									alertWarn(response.message);
								}else{
									alertMessage("保存表头成功!");
									$("#table1_base_add_div").dialog("close");
									getBase1();
								}
							}
						});
				 }
			}
		},{
			text:'关闭',
			handler:function(){
				$("#table1_base_add_div").dialog("close");
			}
		}]
	}); 
}
function table1_update(deviceId,remark){
	
	$("#table1_add_div").show();
	$("#remark").val(remark);
	$("#table1_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"通信设备年度质量分析汇总表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table1_add_form").form('validate');
				 if(validate){
					 $.ajax({
							type: "POST",
							url: "/kunmingrinms/DeviceCollectionWireless?method=addCheck",
							dataType: "json",
							data: {
								"deviceId":deviceId,
								"year":$("#year").html(),
								"orgId":$("#orgId").val(),
								"remark":$("#remark").val()
							},
							success: function(response){
								if(response.result!=1){
									alertWarn(response.message);
								}else{
									alertMessage("保存备注成功!");
									$("#table1_add_div").dialog("close");
									getTable1();
								}
							}
						});
				 }
			}
		},{
			text:'关闭',
			handler:function(){
				$("#table1_add_div").dialog("close");
			}
		}]
	}); 
}

/**
 * 导出
 */
function exportTable(){
	var url = "/kunmingrinms/DeviceCollectionWireless?method=export";
	url += "&year="+$("#year").html();
	url += "&orgId="+$("#orgId").val();
	window.location = url;
}
