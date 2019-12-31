$(document).ready(function(){
	initTable();
	getBaseInfo();
//	$(".table1_update").click(table1_update);
//	$(".table2_add").click(table2_add);
//	$(".table2_update").click(table2_update);
//	$(".table2_delete").click(table2_delete);
//	$(".table3_update").click(table3_update);
//	$("#baseInfoBtn").click(saveBaseInfo);
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
	$("#lineLength").numberbox({min:0,precision:0});
	$("#seq").numberbox({min:0,precision:0});
	$("#t3_p1").numberbox({min:0,precision:0});
	$("#opticalCableTest").numberbox({min:0,precision:0});
	$("#opticalCoreAmount").numberbox({min:0,precision:0});
});

function initTable() {
	
	getTable1();
	getTable2();
	getTable3();
}

/**
 * 获得线路
 * @param component jQuery组件对象
 */
function getRailLine(component){
	
	if(component instanceof jQuery){
		$.ajax({
			type: "POST",
			url: "/kunmingrinms/LineSingle?method=queryRailLine",
			dataType: "json",
			async:false,
			success: function(response){
				if(response.result!=1){
					alertWarn(response.message);
				}else{
					var data=response.data;
					var html="<option value=''></option>";
					component.html("");
					$.each(data,function(i,node){
						html+="<option value='"+node.RAIL_LINE_ID_+"'>"+node.NAME_+"</option>";
					});
					component.append(html);
				}
			},
			failure:function(res){
				alert(res);
			}
		});
	}
}

function getTable1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/LineSingle?method=queryAll",
		dataType: "json",
				data : {
					"orgId" : $("#orgId").val(),
					"deviceTypeId" : $("#deviceTypeId").val(),
					"deviceId" : $("#deviceId").val(),
					"year" : $("#year").val()},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				if(data==null){
					$("#table1_span_org").val($("#orgName").val());
					$("#table1_span_year").val($("#year").val());
					$("#report_id").val(data.ID_);
					return;
				}
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
				html+="   <td>"+data.TOTAL_+"</td>";
				html+="   <td>"+data.TEST_IDENTIFY_NUM_+"</td>";
				html+="   <td>"+data.FIT_NUM_+"</td>";
				html+="   <td>"+formatPercentData(data.FIT_PER_)+"%</td>";
				html+="   <td>"+data.NO_FIT_NUM_+"</td>";
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
		url: "/kunmingrinms/LineSingle?method=queryCheck",
		dataType: "json",
				data : {
					"deviceTypeId" : $("#deviceTypeId").val(),
					"deviceId" : $("#deviceId").val(),
					"year" : $("#year").val(),
					"orgId" : $("#orgId").val()
				},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				var html="";
				var thead=$("#table2 thead");
				$("#table2").html("");
				$("#table2").html(thead);
				if(data==null||data.length<1){
					return;
				}
				$.each(data,function(i,node){	
					html+="<tr>";
//					html+="   <td><a onclick='table2_add()' href='javascript:;' class='faction'>增加</a>" +
//					"<a onclick=\"table2_update('"+node.ID_+"')\" href='javascript:;' class='faction'>修改</a>" +
//					"<a onclick=\"table2_delete(\'"+node.ID_+"')\" href='javascript:;' class='faction'>删除</a></td>";
					html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
//					html+="   <td>"+showFullRailLine(node.RAIL_LINE_NAME_, node.LINE_PART_, node.KM_MARK_)+"</td>";
					html+="   <td>"+formatNullData(node.LINE_NAME_)+"</td>";
					html+="   <td>"+formatNullData(node.LINE_LENGTH_)+"</td>";
					html+="   <td>"+formatNullData(node.OPTICAL_CABLE_TEST_)+"</td>";
//					html+="   <td>"+fit_status(node.LLJL_LENGTH_CHECK)+"</td>";
//					html+="   <td>"+fit_status(node.LLKJ_ATTACH_CHECK)+"</td>";
					html+="   <td>"+formatNullData(node.OPTICAL_CORE_AMOUNT_)+"</td>";
					html+="   <td>"+fit_status(node.LINE_STRENGTH_LOOK_)+"</td>";
					html+="   <td>"+fit_status(node.ATTACH_STRENGTH_LOOK_)+"</td>";
					html+="   <td>"+formatNullData(node.STARTUP_DATE_HOLE_)+"</td>";
					html+="   <td>"+formatNullData(node.DEVICE_PROVIDER_)+"</td>";
					html+="   <td>"+formatNullData(node.REMARK_)+"</td>";
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
		url: "/kunmingrinms/LineSingle?method=queryFailure",
		dataType: "json",
				data : {
					"deviceTypeId" : $("#deviceTypeId").val(),
					"deviceId" : $("#deviceId").val(),
					"year" : $("#year").val(),
					"orgId" : $("#orgId").val()
				},
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
//					html+="   <td>"+showFullRailLine(node.RAIL_LINE_NAME_, node.LINE_PART_, node.KM_MARK_)+"</td>";
					html+="   <td>"+formatNullData(node.LINE_NAME_)+"</td>";
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
		url: "/kunmingrinms/LineSingle?method=getAllById",
		dataType: "json",
		data : {
			"id":$("#report_id").val(),
		},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				if(data==null){
					$("#t1_p4").val($("#orgName").val());
					return;
				}
				$("#t1_p1").html(formatNullData(data.NAME_));
				$("#t1_p2").html(formatNullData(data.DEVICE_NAME_));
				$("#t1_p3").numberbox("setValue",data.TOTAL_);
				$("#t1_p4").val(formatNullData(data.REMARK_));
			}
		}
	});
	
	$("#table1_add_div").show();
	$("#table1_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"线路单项质量分析表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table1_add_form").form('validate');
				 if(validate){
					 $.ajax({
						type: "POST",
						url: "/kunmingrinms/LineSingle?method=updateAll",
						dataType: "json",
						data : {
							"id" : $("#report_id").val(),
							"total" : $("#t1_p3").val(),
							"remark" : $("#t1_p4").val(),
							
							"deviceName" : $("#t1_p2").html(),
							"deviceTypeName" : $("#t1_p1").html(),
							"deviceTypeId" : $("#deviceTypeId").val(),
							"deviceId" : $("#deviceId").val(),
							"year" : $("#year").val(),
							"orgId" : $("#orgId").val(),
						},
						success: function(response){
							if(response.result!=1){
								alertWarn(response.message);
							}else{
								alertMessage("保存分析表成功!");
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
function table1_save(){

		$.ajax({
			type: "POST",
			url: "/kunmingrinms/LineSingle?method=addAll",
			dataType: "json",
			async:false,
			data : {
				"orgId" : $("#orgId").val(),
				"year" : $("#year").val(),
				"deviceId" : $("#deviceId").val(),
				"deviceTypeId" : $("#deviceTypeId").val()
			},
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
	
	
	$("#lineLength").numberbox("clear");
	$("#opticalCableTest").numberbox("clear");
	$("#opticalCoreAmount").numberbox("clear");
	
	$("#remark").val($("#orgName").val());
	
	//清下拉框
//	$("#lljlLengthCheck").get(0).selectedIndex=0;
//	$("#llkjAttachCheck").get(0).selectedIndex=0;
	$("#lineStrengthLook").get(0).selectedIndex=0;
	$("#attachStrengthLook").get(0).selectedIndex=0;
	
	// 获取线路
	getRailLine($("#railLineId"));
	
	$("#table2_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"线路单项质量分析表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table2_add_form").form('validate');
				 if(validate){
					 $.ajax({
						type: "POST",
						url: "/kunmingrinms/LineSingle?method=addCheck",
						dataType: "json",
						data: {
							"orgId":$("#orgId").val(),
							"year":$("#year").val(),
							"deviceId":$("#deviceId").val(),
							"deviceTypeId":$("#deviceTypeId").val(),
							"seq":$("#seq").val(),
							"railLineId":"",
							"railLineName": $.trim($("#railLineId").find("option:selected").text()), 
							"linePart":"", 
							"kmMark":"", 
							"lineName":$("#lineName").val(),
							"lineLength":$("#lineLength").val(), 
							"opticalCableTest":$("#opticalCableTest").val(), 
							"lljlLengthCheck":$("#lljlLengthCheck").val(), 
							"llkjAttachCheck":$("#llkjAttachCheck").val(),
							"opticalCoreAmount":$("#opticalCoreAmount").val(), 
							"lineStrengthLook":$("#lineStrengthLook").val(), 
							"attachStrengthLook":$("#attachStrengthLook").val(), 
							"startupDateHole":$("#startupDateHole").val(), 
							"deviceProvider":$("#deviceProvider").val(), 
							"remark":$("#remark").val()},
						success: function(response){
							if(response.result!=1){
								alertWarn(response.message);
							}else{
								alertMessage("保存分析表成功!");
								$("#table2_add_div").dialog("close");
								table1_save();
								$('#table2_add_form')[0].reset();
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

	// 获取线路
	getRailLine($("#railLineId"));
	
	$.ajax({//查询数据
		type: "POST",
		url: "/kunmingrinms/LineSingle?method=getCheck",
		dataType: "json",
		data: {"id":id},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				$("#seq").numberbox("setValue",data.SEQ_);
				$("#railLineId").val(data.RAIL_LINE_ID_);
				$("#linePart").val(data.LINE_PART_);
				$("#kmMark").val(data.KM_MARK_);
				$("#lineLength").val(data.LINE_LENGTH_);
				$("#opticalCableTest").val(data.OPTICAL_CABLE_TEST_);
				$("#lljlLengthCheck").val(data.LLJL_LENGTH_CHECK);
				$("#llkjAttachCheck").val(data.LLKJ_ATTACH_CHECK);
				$("#opticalCoreAmount").val(data.OPTICAL_CORE_AMOUNT_);
				$("#lineStrengthLook").val(data.LINE_STRENGTH_LOOK_);
				$("#attachStrengthLook").val(data.ATTACH_STRENGTH_LOOK_);
				$("#startupDateHole").val(data.STARTUP_DATE_HOLE_);
				$("#deviceProvider").val(data.DEVICE_PROVIDER_);
				$("#remark").val(data.REMARK_);
				$("#lineName").val(data.LINE_NAME_);
			}
		}
	});
	
	$("#table2_add_div").show();
	$("#table2_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"线路单项质量分析表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table2_add_form").form('validate');
				 if(validate){
					 $.ajax({
						type: "POST",
						url: "/kunmingrinms/LineSingle?method=updateCheck",
						dataType: "json",
						data: {
							"id":id,
							"orgId":$("#orgId").val(),
							"year":$("#year").val(),
							"deviceId":$("#deviceId").val(),
							"deviceTypeId":$("#deviceTypeId").val(),
							"seq":$("#seq").val(),
							"railLineId":$("#railLineId").val(), 
							"railLineName": $.trim($("#railLineId").find("option:selected").text()), 
							"linePart":$("#linePart").val(), 
							"kmMark":$("#kmMark").val(), 
							"lineLength":$("#lineLength").val(), 
							"opticalCableTest":$("#opticalCableTest").val(), 
							"lljlLengthCheck":$("#lljlLengthCheck").val(), 
							"llkjAttachCheck":$("#llkjAttachCheck").val(),
							"opticalCoreAmount":$("#opticalCoreAmount").val(), 
							"lineStrengthLook":$("#lineStrengthLook").val(), 
							"attachStrengthLook":$("#attachStrengthLook").val(), 
							"startupDateHole":$("#startupDateHole").val(), 
							"deviceProvider":$("#deviceProvider").val(), 
							"remark":$("#remark").val(),
							"lineName":$("#lineName").val()},
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
				url: "/kunmingrinms/LineSingle?method=deleteCheck",
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
//		title:"线路单项质量分析表",
//		buttons:[{
//			text:'保存',
//			handler:function(){
//				 var validate = $("#table3_add_form").form('validate');
//				 if(validate){
//					 $.ajax({
//						type: "POST",
//						url: "/kunmingrinms/LineSingle?method=addFailure",
//						dataType: "json",
//						data: {"orgId":$("#orgId").val(),"year":$("#year").val(),"deviceId":$("#deviceId").val(),"deviceTypeId":$("#deviceTypeId").val(),
//							   "SEQ_":$("#t3_p1").val(), "RAIL_LINE_ID_":$("#t3_p3").val(), "RAIL_LINE_NAME_": $.trim($("#t3_p3").find("option:selected").text()), 
//							   "LINE_PART_":$("#t3_p4").val(), "KM_MARK_":$("#t3_p5").val(), "DEVICE_PROPERTY_":$("#t3_p6").val(), "NO_FIT_ITEM_NAME_":$("#t3_p7").val(), 
//							   "REASON_":$("#t3_p8").val()},
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
	
	// 获取线路
	getRailLine($("#t3_p3"));
	
	$.ajax({//查询数据
		type: "POST",
		url: "/kunmingrinms/LineSingle?method=getFailure",
		dataType: "json",
		data: {"id":id},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				$("#t3_p1").numberbox("setValue",data.SEQ_);
				$("#t3_p3").val(data.RAIL_LINE_ID_);
				$("#t3_p4").val(data.LINE_PART_);
				$("#t3_p5").val(data.KM_MARK_);
				$("#t3_p6").val(data.DEVICE_PROPERTY_);
				$("#t3_p7").val(data.NO_FIT_ITEM_NAME_);
				$("#t3_p8").val(data.REASON_);
				$("#reLineName").val(data.LINE_NAME_);
			}
		}
	});

	$("#table3_add_div").show();
	$("#table3_add_div").dialog({
		collapsible: false,
		minimizable: false,
		maximizable: false,
		modal:true,
		title:"线路单项质量分析表",
		buttons:[{
			text:'保存',
			handler:function(){
				 var validate = $("#table3_add_form").form('validate');
				 if(validate){
					 $.ajax({
						type: "POST",
						url: "/kunmingrinms/LineSingle?method=updateFailure",
						dataType: "json",
						data: {
							"id":id,
							"orgId":$("#orgId").val(),
							"year":$("#year").val(),
							"deviceId":$("#deviceId").val(),
							"deviceTypeId":$("#deviceTypeId").val(),
							"seq":$("#t3_p1").val(), 
							"railLineId":$("#t3_p3").val(), 
							"railLineName": $.trim($("#t3_p3").find("option:selected").text()), 
							"linePart":$("#t3_p4").val(), 
							"kmMark":$("#t3_p5").val(), 
							"deviceProperty":$("#t3_p6").val(), 
							"noFitItemName_":$("#t3_p7").val(), 
							"reason":$("#t3_p8").val()},
						success: function(response){
							if(response.result!=1){
								alertWarn(response.message);
							}else{
								alertMessage("修改记录成功!");
								$("#table3_add_div").dialog("close");
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
//				url: "/kunmingrinms/LineSingle?method=deleteFailure",
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

// 显示完整的线路（线路名+区间+公里标）;
function showFullRailLine(railLineName, linePart, km_mark){
	if(railLineName==null||railLineName==undefined){
		return "-";
	}
	var str = railLineName;
	if(linePart!=null&&linePart!=undefined){
		str+= "-";
		str+= linePart;
	}
	
	if(km_mark!=null&&km_mark!=undefined){
		str+= "-";
		str+= km_mark;
	}
	return str;
}

//初始化表的基础信息	
function getBaseInfo(){
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/LineSingle",
		dataType : "json",
		data : {
			"method" : "getBaseInfo",
			"belong_org" :  $("#orgId").val(),
			"year" :  $("#year").val(),
			"deviceId" :  $("#deviceId").val()
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
					url : "/kunmingrinms/LineSingle?method=saveBaseInfo ",
					dataType : "json",
					data : {
						"belong_org" :  $("#orgId").val(),
						"year" :  $("#base_year").html(),
						"org_duty_user" : $("#base_duty_user").val(),
						"fill_user" :  $("#base_fill_user").html(),
						"deviceId" :  $("#deviceId").val(),
						"fill_date" :  $("#base_fill_date").html()
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
	var url = "/kunmingrinms/LineSingle?method=chejianExcelExport";
	url += "&deviceTypeId=" + $("#deviceTypeId").val();
	url += "&deviceId=" + $("#deviceId").val();
	url += "&year=" + $("#year").val();
	url += "&orgId=" + $("#orgId").val();
	url += "&fillData=" + $("#fill_date").html();
	url += "&belong_org=" + $("#orgId").val();
	window.location = url;
}