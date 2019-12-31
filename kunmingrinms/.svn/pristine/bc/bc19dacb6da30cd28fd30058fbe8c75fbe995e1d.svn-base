$(document).ready(function() {

			initTable();
			getBaseInfo();
			$(".excel_export").click(excelExport);
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
			url: "/kunmingrinms/DeviceSingle?method=getAllLine",
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

/**
 * 根据线路获取站点
 */
function getStationByLine(event) {

	// 线路组件
	var line = $(event.target);
	// 站点组件
	var station = event.data.component;
	if((line instanceof jQuery) && (station instanceof jQuery)){
		
		//当线路改变时，设置站点下拉框数据
		//清除站点中的数据
		station.html("");
		 $.ajax({
			type: "POST",
			url: "/kunmingrinms/DeviceSingle?method=getStationByLine",
			dataType: "json",
			async:false,
			data : {
						"id" : line.val()
					},
			success: function(response){
				if(response.result!=1){
					alertWarn(response.message);
				}else{
					var html = " <option value='' ></option> ";
					var data = response.data;
					//设置下拉框数据
					$.each(data, function(i, node) {
								html += "<option value='" + node.STA_ID_ + "'>"+node.STA_NAME_ +"</option>";
							});
					station.append(html);
				}
			}
		});
		 
	}
}

function getTable1() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/DeviceSingle",
		dataType : "json",
		data : {
			"method" : "queryAll",
			"deviceTypeId" : $("#deviceTypeId").val(),
			"deviceId" : $("#deviceId").val(),
			"year" : $("#year").val(),
			"orgId" : $("#orgId").val()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				$("#table1_span_org").html(data.ORG_NAME_);
				$("#table1_span_year").html(data.YEAR_);
				$("#report_id").val(data.ID_);
				var html = "";
				var thead = $("#table1 thead");
				$("#table1").html("");
				$("#table1").html(thead);
				html += "<tr>";
				html += "   <td>" + formatNullData(data.DEVICE_TYPE_) + "</td>";
				html += "   <td>" + formatNullData(data.DEVICE_NAME_) + "</td>";
				html += "   <td>" + formatNullData(data.TOTAL_) + "</td>";
				html += "   <td>" + formatNullData(data.TEST_IDENTIFY_NUM_)
						+ "</td>";
				html += "   <td>" + formatNullData(data.FIT_NUM_) + "</td>";
				html += "   <td>" + formatPercentData(data.FIT_PER_) + "%</td>";
				html += "   <td>" + formatNullData(data.NO_FIT_NUM_)
						+ "</td>";
				html += "   <td>" + formatPercentData(data.NO_FIT_PER_)
						+ "%</td>";
				html += "   <td>" + formatNullData(data.REMARK_) + "</td>";
				html += "</tr>";
				$("#table1").append(html);
			}
		},
		failure : function(res) {
			alert(res);
		}
	});
}

function getTable2() {
	$.ajax({
				type : "POST",
				url : "/kunmingrinms/DeviceSingle?method=queryCheck",
				dataType : "json",
				data : {
					"deviceTypeId" : $("#deviceTypeId").val(),
					"deviceId" : $("#deviceId").val(),
					"year" : $("#year").val(),
					"orgId" : $("#orgId").val()
				},
				success : function(response) {
					if (response.result != 1) {
						alertWarn(response.message);
					} else {
						var data = response.data;
						var html = "";
						var thead = $("#table2 thead");
						$("#table2").html("");
						$("#table2").html(thead);

						$.each(data, function(i, node) {
									html += "<tr>";
									html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
									html+="   <td>"+formatNullData(node.DEVICE_INSTALL_PLACE_)+"</td>";
									html+="   <td>"+fit_status(node.MACHINE_CHECK_)+"</td>";
									html+="   <td>"+fit_status(node.DEVICE_PERFORMANCE_)+"</td>";
									html+="   <td>"+fit_status(node.APPLICATION_QUALITY_)+"</td>";
									html+="   <td>"+fit_status(node.SUBSIDIARY_DEVICE_)+"</td>";
									html+="   <td>"+fit_status(node.DEVICE_INFO_)+"</td>";
									html+="   <td>"+formatNullData(node.STARTUP_DATE_)+"</td>";
									html+="   <td>"+formatNullData(node.DEVICE_PROVIDER)+"</td>";
									html+="   <td>"+formatNullData(node.APPRAISAL_RESULT_)+"</td>";
									html+="   <td>"+formatNullData(node.REMARK_)+"</td>";
									html += "</tr>";
								});
						$("#table2").append(html);
					}
				},
				failure : function(res) {
					alert(res);
				}
			});
}

function getTable3() {
	$.ajax({
				type : "POST",
				url : "/kunmingrinms/DeviceSingle?method=queryFailure",
				dataType : "json",
				data : {
					"deviceTypeId" : $("#deviceTypeId").val(),
					"deviceId" : $("#deviceId").val(),
					"year" : $("#year").val(),
					"orgId" : $("#orgId").val()
				},
				success : function(response) {
					if (response.result != 1) {
						alertWarn(response.message);
					} else {
						var data = response.data;
						var html = "";
						var thead = $("#table3 thead");
						var baseInfo = $("#baseInfo");
						$("#table3").html("");
						$("#table3").html(thead);

						$.each(data, function(i, node) {
									html += "<tr>";
									html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
									html+="   <td>"+formatNullData(node.DEVICE_INSTALL_PLACE_)+"</td>";
									html+="   <td colspan = '2' >"+formatNullData(node.DEVICE_PROPERTY_)+"</td>";
									html+="   <td colspan = '3' >"+formatNullData(node.NO_FIT_ITEM_NAME_)+"</td>";
									html+="   <td colspan = '2'>"+formatNullData(node.REASON_)+"</td>";
									html += "</tr>";
								});
						$("#table3").append(html);
						$("#table3").append(baseInfo);
					}
				},
				failure : function(res) {
					alert(res);
				}
			});
}

//初始化表的填报人信息
function getBaseInfo(){
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/DeviceSingle",
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
				if(data.ORG_DUTY_USER_ != null && data.ORG_DUTY_USER_ != ""){
					$("#org_duty_user").html(data.ORG_DUTY_USER_);
				}
				if(data.FILL_USER_ != null && data.FILL_USER_ != ""){
					$("#fill_user").html(data.FILL_USER_);
				}
				if(data.FILL_DATE_ != null && data.FILL_DATE_ != ""){
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
 * 导出文件
 */
function excelExport(){
	var url = "/kunmingrinms/DeviceSingle?method=chejianDeviceSingExcelExport";
	url += "&deviceTypeId=" + $("#deviceTypeId").val();
	url += "&deviceId=" + $("#deviceId").val();
	url += "&year=" + $("#year").val();
	url += "&orgId=" + $("#orgId").val();
	url += "&fillData=" + $("#fill_date").html();
	url += "&belong_org=" +  $("#orgId").val();
	window.location = url;
}


