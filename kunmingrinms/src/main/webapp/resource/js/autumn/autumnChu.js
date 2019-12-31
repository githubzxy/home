
$(document).ready(function(){
	initSingle();
	initSearch();
	
	$("#deviceType").change(searchDevicesByType);
	$("#search").click(search);
	$("#searchBtn").click(searchDuan);
});

function initSingle(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/AutumnInit?method=initSingle",
		dataType: "json",
		data : {
			"orgType" : $("#orgType").val()
		},
		success:function(response) {
			if(response.result != 1){
				alertWarn(response.message);
			}else{
				var data = response.data;
				if(data==null){
					return;
				}
				
				var htmlReportName="";
				var htmlYearNum="";
				var htmlDeviceType="";
				
				$("#reportName").html("");
				$("#yearNum").html("");
				$("#deviceType").html("");
				
				var reportNameData = data.reportNameMap;
				var yearNumData = data.yearNums;
				var deviceTypeData = data.deviceTypeMap;
				
				$.each(reportNameData, function(key, value){
					htmlReportName += "<option value='" + value + "' selected='selected'>" + key + "</option>";
				});
				
				var curYear = new Date().getFullYear();
				$.each(yearNumData, function(i, value){
					if(value == curYear){
						htmlYearNum += "<option value='" + value + "' selected='selected'>" + value + "</option>";
					}else{
						htmlYearNum += "<option value='" + value + "'>" + value + "</option>";
					}
					
				});
				
				$.each(deviceTypeData, function(key, value){
					htmlDeviceType += "<option value='" + key + "'>" + value + "</option>";
				});
				
				$("#reportName").html(htmlReportName);
				$("#yearNum").html(htmlYearNum);
				$("#deviceType").html(htmlDeviceType);
				// 默认为第一个设备类型，需要手动抛出设备类查询其设备名称
				$("#deviceType").change();
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}

/**
 * 初始化查询下拉框
 */
function initSearch() {
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/AutumnInit",
		dataType: "json",
		data: {
			"method":"initSearch",
			"orgType" : $("#orgType").val()
			},
		success:function(response) {
			if(response.result != 1){
				alertWarn(response.message);
			}else{
				var data = response.data;
				if(data==null){
					return;
				}
				var htmlReportName="";
				var htmlYearNum="";
				
				$("#searchReportName").html("");
				$("#searchYearNum").html("");
				
				var searchMap = data.searchMap;
				var yearNumData = data.yearNums;
				
				$.each(searchMap, function(key, value){
					htmlReportName += "<option value='" + value + "'>" + key + "</option>";
				});
				
				var curYear = new Date().getFullYear();
				$.each(yearNumData, function(i, value){
					if(value == curYear){
						htmlYearNum += "<option value='" + value + "' selected='selected'>" + value + "</option>";
					}else{
						htmlYearNum += "<option value='" + value + "'>" + value + "</option>";
					}
				});
				$("#searchReportName").html(htmlReportName);
				$("#searchYearNum").html(htmlYearNum);
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}

function searchDevicesByType(event){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/AutumnInit?method=searchDevicesByType",
		dataType: "json",
		data: {"deviceTypeId":$("#deviceType").val()},
		success:function(response) {
			if(response.result != 1){
				alertWarn(response.message);
			}else{
				var data = response.data;
				if(data==null){
					return;
				}
				
				var htmlDevice="";
				$("#device").html("");				
				$.each(data, function(i, value){
					htmlDevice += "<option value='" + value.ID_ + "'>" + value.DEVICE_NAME_ + "</option>";
				});
				
				$("#device").html(htmlDevice);
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}

function search(event){
	var reportName = $("#reportName").val();
	var yearNum = $("#yearNum").val();
	var deviceTypeId = $("#deviceType").val();
	var deviceId = $("#device").val();
	if(reportName && yearNum && deviceTypeId && deviceId) {
		
		var deviceTypeName = $.trim($("#deviceType").find("option:selected").text());
		var deviceName = $.trim($("#device").find("option:selected").text());
		
		var url = "../../../kunmingrinms/views/autumn/" + reportName +"?yearNum=" + yearNum 
		+ "&deviceTypeId=" + deviceTypeId + "&deviceTypeName=" + encodeURI(deviceTypeName)
		+ "&deviceId=" + deviceId + "&deviceName=" + encodeURI(deviceName);
		
		window.open(url, "_blank");
	} else {
		alert("表名，年度，设备类型，设备名必选");
	}
}


/**
 * 统计查询
 * @param event
 */
function searchDuan(event){
	var searchReportName = $("#searchReportName").val();
	var searchYearNum = $("#searchYearNum").val();
	
	if(searchReportName && searchYearNum) {
		
		var url = "../../../kunmingrinms/views/autumn/" + searchReportName +"?yearNum=" + searchYearNum;
		window.open(url, "_blank");
	} else {
		alert("表名和年度必选");
	}
}