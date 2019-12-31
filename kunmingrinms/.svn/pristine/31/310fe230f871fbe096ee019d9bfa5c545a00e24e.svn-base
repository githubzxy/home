//全局变量
var store;
var tree;
var picker;

//初始化树
BUI.use([ 'bui/extensions/treepicker', 'bui/tree', 'bui/data' ], function(TreePicker, Tree, Data) {
	store = new Data.TreeStore({
		root : {
			id : '8affa073533aa3d601533bbef63e0010',
			text : '昆明通信段'
		},
		url : '/kunmingrinms/WorkshopServlet',
		params : { // 设置请求时的参数
			method : "getT7WorkShop",
			orgId : $("#orgId").val(),
			deviceId : $("#deviceId").val(),
			year : $("#year").val()
		},
		dataProperty : 'data',
		proxy : {
			method : 'post',
			dataType : 'json'
		},
		map : { // 节点映射
			'ORG_ID_' : 'id',
			'SHOW_ORG_NAME_' : 'text' // 节点显示文本
		},
		autoLoad : true
	});
	tree = new Tree.TreeList({
		store : store,
		checkType : 'all',
		height : 320,
		showRoot : true,
		showLine : true
	// 显示连接线
	});
	picker = new TreePicker({
		valueField : '#selectedIds',// 用于装选中的id的隐藏域，每次修改都会更新这个隐藏域的值
		trigger : '#orgName',
		selectStatus : 'checked',// 设置勾选作为状态改变的事件
		autoRender : true,
		width : 300, // 指定宽度
		children : [ tree ]
	// 配置picker内的列表
	});
	// 加载完成后查询数据
	store.on('load', function(ev) {
		searchData();
	});
});

$(document).ready(function(){
	$(".excel_export").click(excelExport);
});

function getTable1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/LineSingle?method=queryAllByOrgs",
		dataType: "json",
				data : {
						"ids" : getCombotreeChildren(),
						"deviceId" : $("#deviceId").val(),
						"year" : $("#year").val()
					},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var html="";
				var thead=$("#table1 thead");
				$("#table1").html("");
				$("#table1").html(thead);
				
				var data=response.data;
				
				if(data == null || data.length == 0){
					$("#table1_span_year").html("");
					return;
				}
				$("#table1_span_year").html(formatNullData(data.YEAR_));		
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
		url: "/kunmingrinms/LineSingle?method=queryCheckByOrgs",
		dataType: "json",
				data : {
					"ids" : getCombotreeChildren(),
					"deviceId" : $("#deviceId").val(),
					"year" : $("#year").val()
				},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var html="";
				var thead=$("#table2 thead");
				$("#table2").html("");
				$("#table2").html(thead);
				var data=response.data;
				if(data==null||data.length<1){
					return;
				}
				$.each(data,function(i,node){	
					html+="<tr>";
					html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
//					html+="   <td>"+showFullRailLine(node.RAIL_LINE_NAME_, node.LINE_PART_, node.KM_MARK_)+"</td>";
					html+="   <td>"+formatNullData(node.LINE_NAME_)+"</td>";
					html+="   <td>"+formatDecimalData(node.LINE_LENGTH_)+"</td>";
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
		url: "/kunmingrinms/LineSingle?method=queryFailureByOrgs",
		dataType: "json",
				data : {
					"ids" : getCombotreeChildren(),
					"deviceId" : $("#deviceId").val(),
					"year" : $("#year").val()
				},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var html="";
				var thead=$("#table3 thead");
				$("#table3").html("");
				$("#table3").html(thead);
				var data=response.data;
				if(data==null||data.length<1){
					return;
				}
				$.each(data,function(i,node){	
					html+="<tr>";
					html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
//					html+="   <td>"+showFullRailLine(node.RAIL_LINE_NAME_, node.LINE_PART_, node.KM_MARK_)+"</td>";
					html+="   <td>"+formatNullData(node.LINE_NAME_)+"</td>";
					html+="   <td>"+formatNullData(node.DEVICE_PROPERTY_)+"</td>";
					html+="   <td>"+formatNullData(node.NO_FIT_ITEM_NAME_)+"</td>";
					html+="   <td>"+formatNullData(node.REASON_)+"</td>";
					html+="</tr>";
				});
				$("#table3").append(html);
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}

/**
 * 设置部门栏
 */
function setOrgName(){
	$('#orgNameShow').html(picker.getSelectedText());
}

/**
 * 获取车间
 */
function getWorkshop() {
	$('#orgName').combotree({
		width:300,
	    multiple:true,
	});
	
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/WorkshopServlet",
		dataType: "json",
		data : {
			"method":"getT7WorkShop",
			"orgId":$("#orgId").val() ,
			"deviceId":$("#deviceId").val() ,
			"year":$("#year").val() 
			},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data = response.data;
				$.each(data, function(i, node) {
					
					workshopData.push({id:node.ORG_ID_, text:node.SHOW_ORG_NAME_});
				});
				
				$('#orgName').combotree('loadData', [{
					id: "8affa073533aa3d601533bbef63e0010",
					text: '昆明通信段',
					children: workshopData
				}]);
				//设置完树后设置一次表格初始值
				getTable1();
				getTable2();
				getTable3();
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}

/**
 * 获取combotree的Children值
 */
function getCombotreeChildren() {
	var workshops = "";
	var item = picker.getSelectedValue();// 选中的节点
	// 如果没有选中则设置为所有组织机构,否则传入选中的值
	if (item) {
		workshops = picker.getSelectedValue();
	} else {
		for ( var i = 0; i < store.getResult().length; i++) {
			workshops += store.getResult()[i].id + ",";
		}
		workshops = workshops.substring(0, workshops.length - 1);
	}
	return workshops;
}

//显示完整的线路（线路名+区间+公里标）;
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

//导出数据到excel中
function excelExport(){
	var url = "/kunmingrinms/LineSingle?method=excelExport";
	url += "&deviceId=" + $("#deviceId").val();
	url += "&year=" + $("#year").val();
	url += "&ids=" + getCombotreeChildren();
	window.location = url;
}

/**
 * 查询
 */
function searchData(){
	getTable1();
	getTable2();
	getTable3();
	setOrgName();
}