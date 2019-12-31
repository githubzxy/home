$(document).ready(function(){
	initTable();
	getBaseInfo();
//	$(".table1_update").click(table1_update);
//	$(".table1_save").click(table1_save);
//	$(".table2_add").click(table2_add);
	$(".exportExcel").click(exportExcel);
	
	$('.dateTimeRequired').datebox({  
        required:true,
		missingMessage:"日期必须填写!"
    });
	$('.dateTime').datebox({  
    });
	$('.inputText').validatebox({
		required: false,
		validType:['length[0,80]']
    });
	$('.inputTextarea').validatebox({
		required: false,
		validType:['length[0,500]']
    });
	$('.inputTextRequired').validatebox({
		required: false,
		missingMessage:"此项为必填项!",
		validType:['length[0,80]']
    });
	$("#t1_p3").numberbox({min:0,precision:0});
	$("#seq").numberbox({min:0,precision:0});
	$("#t3_p1").numberbox({min:0,precision:0});
//	$("#baseInfoBtn").click(saveBaseInfo);
});

function initTable() {
	
	getTable1();
	getTable2();
	getTable3();
}

function getTable1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/NetworkSingle?method=queryAll",
		dataType: "json",
		data: {"deviceTypeId":$("#deviceTypeId").val(),"deviceId":$("#deviceId").val(),"year":$("#year").val(),"orgId":$("#orgId").val()},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				$("#table1_span_org").html(data.ORG_NAME_);		
				$("#table1_span_year").html(data.YEAR_);			
				$("#report_id").val(data.ID_);	
				var html="";
				var thead=$("#table1 thead");
				$("#table1").html("");
				$("#table1").html(thead);
				html+="<tr>";
				html+="   <td>"+formatNullData(data.DEVICE_TYPE_NAME_)+"</td>";
				html+="   <td>"+formatNullData(data.DEVICE_NAME_)+"</td>";
				html+="   <td>"+formatDecimalData(data.TOTAL_)+"</td>";
				html+="   <td>"+formatDecimalData(data.TEST_IDENTIFY_NUM_)+"</td>";
				html+="   <td>"+formatDecimalData(data.FIT_NUM_)+"</td>";
				html+="   <td>"+formatPercentData(data.FIT_PER_)+"%</td>";
				html+="   <td>"+formatDecimalData(data.NO_FIT_NUM_)+"</td>";
				html+="   <td>"+formatPercentData(data.NO_FIT_PER_)+"%</td>";
				html+="   <td>"+formatNullData(data.REMARK_)+"</td>";
				html+="</tr>";
				$("#table1").append(html);
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}

function getTable2(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/NetworkSingle?method=queryCheck",
		dataType: "json",
		data: {"deviceTypeId":$("#deviceTypeId").val(),"deviceId":$("#deviceId").val(),"year":$("#year").val(),"orgId":$("#orgId").val()},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				var html="";
				var thead=$("#table2 thead");
				$("#table2").html("");
				$("#table2").html(thead);
				$.each(data,function(i,node){	
					html+="<tr>";
//					html+="   <td><a onclick='table2_add()' href='javascript:;' class='faction'>增加</a>" +
//										"<a onclick=\"table2_update('"+node.ID_+"')\" href='javascript:;' class='faction'>修改</a>" +
//										"<a onclick=\"table2_delete(\'"+node.ID_+"')\" href='javascript:;' class='faction'>删除</a></td>";
					html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
					html+="   <td>"+formatNullData(node.PLACE_)+"</td>";
					html+="   <td>"+fit_status(node.ALARM_)+"</td>";
					html+="   <td>"+fit_status(node.CONFIGURATION_)+"</td>";
					html+="   <td>"+fit_status(node.PERFORMANCE_)+"</td>";
					html+="   <td>"+fit_status(node.ACCOUNT_SAFE_)+"</td>";
					html+="   <td>"+fit_status(node.SOFTWARE_VERSION_)+"</td>";
					html+="   <td>"+fit_status(node.WHOLE_MACHINE_)+"</td>";
					html+="   <td>"+formatNullData(node.STARTUP_DATE_HOLE_)+"</td>";
					html+="   <td>"+formatNullData(node.DEVICE_PROVIDER_)+"</td>";
					html+="</tr>";
				});
				$("#table2").append(html);
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}

function getTable3(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/NetworkSingle?method=queryFailure",
		dataType: "json",
		data: {"deviceTypeId":$("#deviceTypeId").val(),"deviceId":$("#deviceId").val(),"year":$("#year").val(),"orgId":$("#orgId").val()},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				var html="";
				var thead=$("#table3 thead");
				var baseInfo = $("#baseInfo");
				$("#table3").html("");
				$("#table3").html(thead);
				$.each(data,function(i,node){	
					html+="<tr>";
//					html+="   <td><a onclick=\"table3_update('"+node.ID_+"')\" href='javascript:;' class='faction'>修改</a></td>";
					html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
					html+="   <td>"+formatNullData(node.PLACE_)+"</td>";
					html+="   <td>"+formatNullData(node.DEVICE_PROPERTY_)+"</td>";
					html+="   <td>"+formatNullData(node.NO_FIT_ITEM_NAME_)+"</td>";
					html+="   <td colspan = '3'>"+formatNullData(node.REASON_)+"</td>";
					html+="</tr>";
				});
				$("#table3").append(html);
				$("#table3").append(baseInfo);
			}
		},
		failure:function(res){
			alert(res);
		}
	});

}
function table1_update(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/NetworkSingle",
		dataType: "json",
		data : {
			"method" : "getAllById",
			"id":$("#report_id").val()
			},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				$("#t1_p1").html(formatNullData(data.NAME_));
				$("#t1_p2").html(formatNullData(data.DEVICE_NAME_));
				$("#t1_p3").numberbox("setValue",data.TOTAL_);
				$("#t1_p4").val(data.REMARK_);
			}
		}
	});
	
	$("#table1_add_div").show();
	$("#table1_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"网管单项质量分析表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table1_add_form").form('validate');
				 if(validate){
					 $.ajax({
						type: "POST",
						url: "/kunmingrinms/NetworkSingle?method=updateAll",
						dataType: "json",
						data : {
									"id" : $("#report_id").val(),
									"total" : $("#t1_p3").val(),
									"remark" : $("#t1_p4").val(),
									},
						success: function(response){
							if(response.result!=1){
								alertWarn(response.message);
							}else{
								alertMessage("保存分析表成功!");
								$("#table1_add_div").dialog("close");
								initTable();
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
function table1_save(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/NetworkSingle?method=addAll",
		dataType: "json",
		async:false,
		data: {"orgId":$("#orgId").val(),"year":$("#year").val(),"deviceId":$("#deviceId").val(),"deviceTypeId":$("#deviceTypeId").val()},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				alertMessage("汇总数据成功!");
			}
		}
	});
}
function table2_add(){
	$("#table2_add_div").show();
	$('#table2_add_form')[0].reset();
	
	$("#seq").numberbox("clear");
	
	$("#alarm").get(0).selectedIndex=0;
	$("#configuration").get(0).selectedIndex=0;
	$("#performance").get(0).selectedIndex=0;
	$("#accountSafe").get(0).selectedIndex=0;
	$("#softwareVersion").get(0).selectedIndex=0;
	$("#wholeMachine").get(0).selectedIndex=0;
	
	$("#table2_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"网管单项质量分析表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table2_add_form").form('validate');
				 if(validate){
					 $.ajax({
						type: "POST",
						url: "/kunmingrinms/NetworkSingle?method=addCheck",
						dataType: "json",
						data: {
							"orgId":$("#orgId").val(),
							"year":$("#year").val(),
							"deviceId":$("#deviceId").val(),
							"deviceTypeId":$("#deviceTypeId").val(),
							"seq":$("#seq").val(),
							"place":$("#place").val(),
							"alarm":$("#alarm").val(),
							"configuration":$("#configuration").val(),
							"performance":$("#performance").val(),
							"accountSafe":$("#accountSafe").val(),
							"softwareVersion":$("#softwareVersion").val(),
							"wholeMachine":$("#wholeMachine").val(),
							"startupDateHole":$("#startupDateHole").val(),
							"deviceProvider":$("#deviceProvider").val()},
						success: function(response){
							if(response.result!=1){
								alertWarn(response.message);
							}else{
								alertMessage("保存登记表成功!");
								$("#table2_add_div").dialog("close");
								table1_save();
								initTable();
							}
						}
					});
				 }
			}
		},{
			text:'关闭',
			handler:function(){
				$("#table2_add_div").dialog("close");
			}
		}]
	}); 
}
function table2_update(id){
	$.ajax({//查询数据
		type: "POST",
		url: "/kunmingrinms/NetworkSingle?method=getCheck",
		dataType: "json",
		data: {"id":id},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				$("#seq").numberbox("setValue",data.SEQ_);
				$("#place").val(data.PLACE_);
				$("#alarm option[value='"+data.ALARM_+"']").attr("selected","selected");
				$("#configuration option[value='"+data.CONFIGURATION_+"']").attr("selected","selected");
				$("#performance option[value='"+data.PERFORMANCE_+"']").attr("selected","selected");
				$("#accountSafe option[value='"+data.ACCOUNT_SAFE_+"']").attr("selected","selected");
				$("#softwareVersion option[value='"+data.SOFTWARE_VERSION_+"']").attr("selected","selected");
				$("#wholeMachine option[value='"+data.WHOLE_MACHINE_+"']").attr("selected","selected");
				$("#startupDateHole").val(data.STARTUP_DATE_HOLE_);
				$("#deviceProvider").val(data.DEVICE_PROVIDER_);
			}
		}
	});
	
	$("#table2_add_div").show();
	$("#table2_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"网管单项质量分析表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table2_add_form").form('validate');
				 if(validate){
					 $.ajax({
						type: "POST",
						url: "/kunmingrinms/NetworkSingle?method=updateCheck",
						dataType: "json",
						data: {
							"id":id,
							"orgId":$("#orgId").val(),
							"year":$("#year").val(),
							"deviceId":$("#deviceId").val(),
							"deviceTypeId":$("#deviceTypeId").val(),
							"seq":$("#seq").val(),
							"place":$("#place").val(),
							"alarm":$("#alarm").val(),
							"configuration":$("#configuration").val(),
							"performance":$("#performance").val(),
							"accountSafe":$("#accountSafe").val(),
							"softwareVersion":$("#softwareVersion").val(),
							"wholeMachine":$("#wholeMachine").val(),
							"startupDateHole":$("#startupDateHole").val(),
							"deviceProvider":$("#deviceProvider").val()},
						success: function(response){
							if(response.result!=1){
								alertWarn(response.message);
							}else{
								alertMessage("修改记录成功!");
								$("#table2_add_div").dialog("close");
								table1_save();
								initTable();
							}
						}
					});
				 }
			}
		},{
			text:'关闭',
			handler:function(){
				$("#table2_add_div").dialog("close");
			}
		}]
	}); 
}
function table2_delete(id){
	$.messager.confirm('提示框', '你确定要删除记录吗?',function(flag){
		if(flag){
			$.ajax({
				type: "POST",
				url: "/kunmingrinms/NetworkSingle?method=deleteCheck",
				dataType: "json",
				data: {"id":id},
				success: function(response){
					if(response.result!=1){
						alertWarn(response.message);
					}else{
						alertMessage("删除数据成功!");
						table1_save();
						initTable();
					}
				}
			});
		 }
	});
}
//function table3_add(){
//	$("#table3_add_div").show();
//	$('#table3_add_form')[0].reset();
//	$("#t3_p1").numberbox("clear");
//	$("#table3_add_div").dialog({
//		collapsible: false,
//		minimizable: false,
//		maximizable: false,
//		modal:true,
//		title:"网管单项质量分析表",
//		buttons:[{
//			text:'保存',
//			handler:function(){
//				 var validate = $("#table3_add_form").form('validate');
//				 if(validate){
//					 $.ajax({
//						type: "POST",
//						url: "/kunmingrinms/NetworkSingle?method=addFailure",
//						dataType: "json",
//						data: {"orgId":$("#orgId").val(),"year":$("#year").val(),"deviceId":$("#deviceId").val(),"deviceTypeId":$("#deviceTypeId").val(),
//								"seq":$("#t3_p1").val(),"place":$("#t3_p2").val(),"DEVICE_PROPERTY_":$("#t3_p3").val(),
//								"NO_FIT_ITEM_NAME_":$("#t3_p4").val(),"REASON_":$("#t3_p5").val()},
//						success: function(response){
//							if(response.result!=1){
//								alertWarn(response.message);
//							}else{
//								alertMessage("保存登记表成功!");
//								$("#table3_add_div").dialog("close");
//								getTable3();
//							}
//						}
//					});
//				 }
//			}
//		},{
//			text:'关闭',
//			handler:function(){
//				$("#table3_add_div").dialog("close");
//			}
//		}]
//	}); 
//}
function table3_update(id){
	$.ajax({//查询数据
		type: "POST",
		url: "/kunmingrinms/NetworkSingle?method=getFailure",
		dataType: "json",
		data: {"id":id},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				$("#t3_p1").numberbox("setValue",data.SEQ_);
				$("#t3_p2").val(data.PLACE_);
				$("#t3_p3").val(data.DEVICE_PROPERTY_);
				$("#t3_p4").val(data.NO_FIT_ITEM_NAME_);
				$("#t3_p5").val(data.REASON_);
			}
		}
	});

	$("#table3_add_div").show();
	$("#table3_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"网管单项质量分析表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table3_add_form").form('validate');
				 if(validate){
					 $.ajax({
						type: "POST",
						url: "/kunmingrinms/NetworkSingle?method=updateFailure",
						dataType: "json",
						data: {
							"id":id,
							"orgId":$("#orgId").val(),
							"year":$("#year").val(),
							"deviceId":$("#deviceId").val(),
							"deviceTypeId":$("#deviceTypeId").val(),
							"seq":$("#t3_p1").val(),
							"place":$("#t3_p2").val(),
							"DEVICE_PROPERTY_":$("#t3_p3").val(),
							"NO_FIT_ITEM_NAME_":$("#t3_p4").val(),
							"REASON_":$("#t3_p5").val()},
						success: function(response){
							if(response.result!=1){
								alertWarn(response.message);
							}else{
								getTable3();
								alertMessage("修改记录成功!");
								$("#table3_add_div").dialog("close");
							}
						}
					});
				 }
			}
		},{
			text:'关闭',
			handler:function(){
				$("#table3_add_div").dialog("close");
			}
		}]
	}); 

}
//function table3_delete(id){
//	$.messager.confirm('提示框', '你确定要删除记录吗?',function(flag){
//		if(flag){
//			$.ajax({
//				type: "POST",
//				url: "/kunmingrinms/NetworkSingle?method=deleteFailure",
//				dataType: "json",
//				data: {"id":id},
//				success: function(response){
//					if(response.result!=1){
//						alertWarn(response.message);
//					}else{
//						alertMessage("删除数据成功!");
//						getTable3();
//					}
//				}
//			});
//		}
//	});
//}


//初始化表的基础信息	
function getBaseInfo(){
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/NetworkSingle",
		dataType : "json",
		data : {
			"method" : "getBaseInfo",
			"belong_org" :  $("#orgId").val(),
			"year" :  $("#year").val(),
			"deviceId" : $("#deviceId").val()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				if(data != null && data.length != 0){
					$("#org_duty_user").html(data.ORG_DUTY_USER_);
					$("#fill_user").html(data.FILL_USER_);
					$("#fill_date").html(data.FILL_DATE_);
				}
			}
		},
		failure : function(res) {
			alert(res);
		}
	});
}




/**
 * 保存基础信息
 */
function saveBaseInfo() {
	$("#baseInfo_add_div").show();
	$('#baseInfo_add_form')[0].reset();// 清空表单
	
	//设置基本信息
	$("#base_fill_org").html($("#table1_span_org").html());
	$("#base_year").html($("#year").val());
	$("#base_fill_user").html($("#fill_user").html());
	$("#base_fill_date").html($("#fill_date").html());
	$("#base_duty_user").val($("#org_duty_user").html());
	
	// easyUI封装的弹出窗
	$("#baseInfo_add_div").dialog({
		collapsible : false,// 打开，收缩按钮
		minimizable : false,// 最小化
		maximizable : false,// 最大化
		modal : false,// 模态true-后面的页面不可操作.false-后面的页面可操作
		title : "报表基本信息填写",
		buttons : [{
			text : '保存',
			handler : function() {
				var validate = $("#baseInfo_add_form").form('validate');
				if (validate) {
					//发ajax消息，保存基本表信息
					$.ajax({
						type : "POST",
					url : "/kunmingrinms/NetworkSingle?method=saveBaseInfo ",
					dataType : "json",
					data : {
						"belong_org" :  $("#orgId").val(),
						"year" :  $("#base_year").html(),
						"org_duty_user" : $("#base_duty_user").val(),
						"fill_user" :  $("#base_fill_user").html(),
						"fill_date" :  $("#base_fill_date").html(),
						"deviceId" :  $("#deviceId").val()
					},
					success : function(response) {
						alertMessage("保存成功!");
						$("#baseInfo_add_div").dialog("close");
						getBaseInfo();
						},
						failure : function(res) {
							alert(res);
						}
					});
								}
							}
						}, {
							text : '关闭',
						handler : function() {
							$("#baseInfo_add_div").dialog("close");
							}
						}]
					});
}

/**
 * 导出数据到excel
 */
function exportExcel(){
	var url = "/kunmingrinms/NetworkSingle?method=chejianExcelExport";
	url += "&deviceTypeId=" + $("#deviceTypeId").val();
	url += "&deviceId=" + $("#deviceId").val();
	url += "&year=" + $("#year").val();
	url += "&orgId=" + $("#orgId").val();
	url += "&fillData=" + $("#fill_date").html();
	url += "&belong_org=" + $("#orgId").val();
	window.location = url;
}