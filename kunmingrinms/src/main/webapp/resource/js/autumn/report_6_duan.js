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
			method : "getT6WorkShop",
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

$(document).ready(function() {
	$(".export_excel").click(duanExportExcel);
});

/**
 * 设置部门栏
 */
function setOrgName() {
	$('#orgNameShow').html(picker.getSelectedText());
}

/**
 * 查询车间
 */
function getWorkshop() {
	$('#orgName').combotree({
		width : 300,
		multiple : true,
	});
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/WorkshopServlet",
		dataType : "json",
		// data: {"orgId":"f8062ea881ed4bdb9dd2f601c711557b"},//有线
		data : {
			"method" : "getT6WorkShop",
			"orgId" : $("#orgId").val(),
			"deviceId" : $("#deviceId").val(),
			"year" : $("#year").val()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				$.each(data, function(i, node) {
					workshopData.push({
						id : node.ORG_ID_,
						text : node.SHOW_ORG_NAME_
					});
				});
				$('#orgName').combotree('loadData', [ {
					id : "8affa073533aa3d601533bbef63e0010",
					text : '昆明通信段',
					children : workshopData
				} ]);
			}
			getAllTable();
		},
		failure : function(res) {
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

function getAllTable() {
	getTable1();
	getTable2();
	getTable3();
	setOrgName();
}

function getTable1() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/NetworkSingle?method=duanQueryAll",
		dataType : "json",
		data : {
			"deviceTypeId" : $("#deviceTypeId").val(),
			"deviceId" : $("#deviceId").val(),
			"year" : $("#year").val(),
			"workshops" : getCombotreeChildren()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;

				if (data != null && data.length != 0) {
					$("#table1_span_year").html(data.YEAR_);
					var html = "";
					var thead = $("#table1 thead");
					$("#table1").html("");
					$("#table1").html(thead);
					html += "<tr>";
					html += "   <td>" + formatNullData(data.DEVICE_TYPE_NAME_)
							+ "</td>";
					html += "   <td>" + formatNullData(data.DEVICE_NAME_)
							+ "</td>";
					html += "   <td>" + formatDecimalData(data.TOTAL_)
							+ "</td>";
					html += "   <td>"
							+ formatDecimalData(data.TEST_IDENTIFY_NUM_)
							+ "</td>";
					html += "   <td>" + formatDecimalData(data.FIT_NUM_)
							+ "</td>";
					html += "   <td>" + formatPercentData(data.FIT_PER_)
							+ "%</td>";
					html += "   <td>" + formatDecimalData(data.NO_FIT_NUM_)
							+ "</td>";
					html += "   <td>" + formatPercentData(data.NO_FIT_PER_)
							+ "%</td>";
					html += "   <td>" + formatNullData(data.REMARK_) + "</td>";
					html += "</tr>";
					$("#table1").append(html);
				} else {
					$("#table1_span_year").html("");
					var html = "";
					var thead = $("#table1 thead");
					$("#table1").html("");
					$("#table1").html(thead);
				}
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
		url : "/kunmingrinms/NetworkSingle?method=duanQueryCheck",
		dataType : "json",
		data : {
			"deviceTypeId" : $("#deviceTypeId").val(),
			"deviceId" : $("#deviceId").val(),
			"year" : $("#year").val(),
			"workshops" : getCombotreeChildren()
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
				$.each(data,
						function(i, node) {
							html += "<tr>";
							html += "   <td>" + formatNullData(node.SEQ_)
									+ "</td>";
							html += "   <td>" + formatNullData(node.PLACE_)
									+ "</td>";
							html += "   <td>" + fit_status(node.ALARM_)
									+ "</td>";
							html += "   <td>" + fit_status(node.CONFIGURATION_)
									+ "</td>";
							html += "   <td>" + fit_status(node.PERFORMANCE_)
									+ "</td>";
							html += "   <td>" + fit_status(node.ACCOUNT_SAFE_)
									+ "</td>";
							html += "   <td>"
									+ fit_status(node.SOFTWARE_VERSION_)
									+ "</td>";
							html += "   <td>" + fit_status(node.WHOLE_MACHINE_)
									+ "</td>";
							html += "   <td>"
									+ formatNullData(node.STARTUP_DATE_HOLE_)
									+ "</td>";
							html += "   <td>"
									+ formatNullData(node.DEVICE_PROVIDER_)
									+ "</td>";
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
		url : "/kunmingrinms/NetworkSingle?method=duanQueryFailure",
		dataType : "json",
		data : {
			"deviceTypeId" : $("#deviceTypeId").val(),
			"deviceId" : $("#deviceId").val(),
			"year" : $("#year").val(),
			"workshops" : getCombotreeChildren()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				var html = "";
				var thead = $("#table3 thead");
				$("#table3").html("");
				$("#table3").html(thead);
				$.each(data, function(i, node) {
					html += "<tr>";
					html += "   <td>" + formatNullData(node.SEQ_) + "</td>";
					html += "   <td>" + formatNullData(node.PLACE_) + "</td>";
					html += "   <td>" + formatNullData(node.DEVICE_PROPERTY_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.NO_FIT_ITEM_NAME_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.REASON_) + "</td>";
					html += "</tr>";
				});
				$("#table3").append(html);
			}
		},
		failure : function(res) {
			alert(res);
		}
	});
}

/**
 * 导出excel
 */
function duanExportExcel() {

	var url = "/kunmingrinms/NetworkSingle?method=duanExportExcel";
	url += "&deviceTypeId=" + $("#deviceTypeId").val();
	url += "&deviceId=" + $("#deviceId").val();
	url += "&year=" + $("#year").val();
	url += "&workshops=" + getCombotreeChildren();
	window.location = url;
}