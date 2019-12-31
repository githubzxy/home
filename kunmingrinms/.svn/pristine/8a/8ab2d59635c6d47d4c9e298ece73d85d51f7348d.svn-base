
var listStore;
var configOrgList;
	
BUI.use(['bui/data'], function(Data){
	
	var List = BUI.List;
    
	listStore = new Data.Store({
		url : contextPath + "organization/getAllWorkshopBySegment.cn",
		autoLoad : true,
		params : {
			segmentId : $("#orgId").val()
		},
		proxy : {
			method : 'post',
			dataType : 'json'
		}
	});
	
	configOrgList = new List.Listbox({
		idField : 'id',
		itemTpl : '<li><span class="x-checkbox"></span>{name}</li>',
		elCls : 'bui-select-list',//默认是'bui-simple-list'
		render : '#configOrgList',
		store : listStore,
		height : 600,
		itemStatusFields : { //设置数据跟状态的对应关系
            selected : 'isdept'
		},
	});
	configOrgList.render();
});

$(document).ready(function(){
	initLeftDivHeight();
	initView();
	initSingle();
	initCollect();
	initSearch();
	
	$("#deviceType").change(searchDevicesByType);
	$("#search").click(search);
	$("#searchCollect").click(searchCollect);
	$("#searchBtn").click(searchDuan);
	
	$("#duanDeviceSubmit").click(duanDeviceSubmit);
	
	initLeftInfo();
	$("#saveWorkshop").click(saveWorkshop);
	
});

//动态初始化左侧div高度
function initLeftDivHeight(){
	//初始化leftDiv的高度
	var windownHeight = $(window).height();
	var leftDivHeight=windownHeight-28;
	$(".leftDiv").css("height",leftDivHeight);
	
	//设置ListBox的高度
	var savaBtnHeight=$("#savaDiv").height();
	configOrgList.set("height",leftDivHeight-savaBtnHeight-30);//30代表fieldset的线宽、文字高度及其padding、margin
}

function initSingle(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/AutumnInit?method=initSingle",
		dataType: "json",
		data: {"orgType":$("#orgType").val()},
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

function initCollect() {
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/AutumnInit?method=initCollect",
		dataType: "json",
		data: {"orgType":$("#orgType").val()},
		success:function(response) {
			if(response.result != 1){
				alertWarn(response.message);
			}else{
				var data = response.data;
				if(data==null){
					return;
				}
				
				var htmlCollectReportName="";
				var htmlYearNum="";
				
				$("#collectReportName").html("");
				$("#collectYearNum").html("");
				
				var collectMap = data.collectMap;
				var yearNumData = data.yearNums;
				
				$.each(collectMap, function(key, value){
					htmlCollectReportName += "<option value='" + value + "'>" + key + "</option>";
				});
				
				var curYear = new Date().getFullYear();
				$.each(yearNumData, function(i, value){
					if(value == curYear){
						htmlYearNum += "<option value='" + value + "' selected='selected'>" + value + "</option>";
					}else{
						htmlYearNum += "<option value='" + value + "'>" + value + "</option>";
					}
				});
				
				$("#collectReportName").html(htmlCollectReportName);
				$("#collectYearNum").html(htmlYearNum);
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
			"method":"initSearch"
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
						htmlYearNum += "<option selected='selected' value='" + value + "'>" + value + "</option>";
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

function searchCollect(event){
	var collectReportName = $("#collectReportName").val();
	var collectYearNum = $("#collectYearNum").val();
	
	if(collectReportName && collectYearNum) {
		
		var url = "../../../kunmingrinms/views/autumn/" + collectReportName +"?yearNum=" + collectYearNum;
		window.open(url, "_blank");
	} else {
		
		alert("表名和年度必选");
	}
}

/**
 * 查询
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

/**
 * 设备提交
 */
function duanDeviceSubmit(){
	//验证上传文件,通过则将form提交
	if(fileValidate($("#duanDeviceFile"))){
		$("#duanDeviceForm").submit();
	}
}

/**
 * 文件名验证
 */
function fileValidate(fileObj){ 
	var flag = true;
	// 上传文件不能为空，格式必须为xsl和xlsx
	var filepath=fileObj.val(); 
	//验证时否为空
	if( filepath == undefined || $.trim(filepath)== "" ){ 
		alert("请选择上传文件！"); 
		flag=false; 
	}else{ 
		//验证最后一个后缀是否是Excel文件
		var fileArr=filepath.split("\\"); 
		var fileTArr=fileArr[fileArr.length-1].toLowerCase().split("."); 
		var filetype=fileTArr[fileTArr.length-1]; 
		if(filetype!="xls"&&filetype!="xlsx"){ 
			alert("上传文件必须为Excel文件！"); 
			flag=false; 
		}
	}
	//返回验证标记
	return flag;
}

//文件下载
function download(url) {
	window.location.href = url;
}

/**
 * 如果不是'普铁有线科','普铁无线科','高铁技术科','技术支持中心',则不显示填写模块
 */
function initView(){
	var orgId = $("#orgId").val();
	if(orgId != "0ce89e50f02240229e72794d2b957d23" && orgId != "f8062ea881ed4bdb9dd2f601c711557b"
		&& orgId != "318df0d5ee374bd097abb3f20948dec4" && orgId != "8a4fa4282d6b4077bd7d60efe6155483"
	){
		$("#editReportView").hide();
	}
}

/**
 * 初始化左侧信息提示
 * @returns
 */
function initLeftInfo() {
	$("#savaDiv").prepend(sucHtml+errorHtml+warningHtml);
	$('#sucSpan').hide();
	$('#errorSpan').hide();
	$('#warningSpan').hide();
}

//成功提示信息
var sucHtml = '<span id="sucSpan"><span class="x-icon x-icon-small x-icon-success"><i class="icon icon-white icon-ok"></i></span> 保存成功！</span>';
//失败提示信息
var errorHtml = '<span id="errorSpan"><span class="x-icon x-icon-small x-icon-error"><i class="icon icon-white icon-bell"></i></span>保存失败！</span>';
//失败提示信息
var warningHtml = '<span id="warningSpan"><span class="x-icon x-icon-small x-icon-warning"><i class="icon icon-white icon-warning"></i></span>失败，未选择车间</span>';

/**公用成功信息提示
 * @param msg
 */
function successInfo() {
	$('#sucSpan').show();
	$('#sucSpan').fadeOut(5000);
}

/**
 * 公用失败信息提示
 */
function failureInfo() {
	$('#errorSpan').show();
	$('#errorSpan').fadeOut(5000);
}
/**
 * 提示信息
 */
function warningInfo(){
	$('#warningSpan').show();
	$('#warningSpan').fadeOut(5000);
}

/**
 * 保存段与车间关系
 */
function saveWorkshop() {
	var items = configOrgList.getSelection();
	var workshopIds = "";
	for(var i = 0; i < items.length; i++) {
		workshopIds += items[i].id + ',';
	}
	workshopIds = workshopIds.substring(0,workshopIds.length-1);
	
	if(workshopIds==''){//若未配置车间，提示
		warningInfo();
		return;
	}
	
	$.post(contextPath + 'organization/saveSegmentAndWorkshop.cn',
			{
				segmentId : $("#orgId").val(),
				workshopIds : workshopIds
			},function(data,status){
				if(status){
					successInfo();
				}else{
					failureInfo();
				}
			}, 'json');
}

