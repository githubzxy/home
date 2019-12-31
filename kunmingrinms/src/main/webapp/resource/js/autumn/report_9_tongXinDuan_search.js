//全局变量
var store;
var tree;
var picker;

//初始化树
BUI.use([ 'bui/extensions/treepicker', 'bui/tree', 'bui/data' ], function(
		TreePicker, Tree, Data) {
	store = new Data.TreeStore({
		root : {
			id : '8affa073533aa3d601533bbef63e0010',
			text : '昆明通信段'
		},
		url : '/kunmingrinms/WorkshopServlet',
		params : { // 设置请求时的参数
			method : "getTXDSegmentForFour",
			orgId : $("#orgId").val(),
			year : year
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
	$("#autnmu_table_export").click(exportReport);
});
/**
 * 获取车间
 */
function getWorkshop() {
	$('#orgName').combotree({
		width : 300,
		multiple : true
	});

	$.ajax({
		type : "POST",
		url : "/kunmingrinms/WorkshopServlet",
		dataType : "json",
		data : {
			"method" : "getT9Chu",
			"orgId" : $("#orgId").val(),
			"year" : $("#year").html()
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
				// 设置完树后设置一次表格初始值
				getTable1();
				// 设置默认车间
				var defShopName = "";
				$.each(workshopData, function(i, workshop) {
					// 去除昆明通信段
					if (workshop.id == "8affa073533aa3d601533bbef63e0010") {
						return true;
					}
					defShopName += workshop.text + ",";
				});
				$('#table1_span_org').html(defShopName);
			}
		},
		failure : function(res) {
			alert(res);
		}
	});
}

function getTable1() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/LineImproveCollection?method=queryAllForTXD",
		dataType : "json",
		data : {
			"year" : $("#year").html(),
			"ids" : getCombotreeChildren(),
			"orgId" : $("#orgId").val()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				var html = "";
				var thead = $("#table1 thead");
				var base = $("#base");
				$("#table1").html("");
				$("#table1").html(thead);
				$.each(data,
						function(i, node) { // 遍历所有类型
							html += "<tr>";
							html += "   <td>" + formatNullData(node.SEQ_)
									+ "</td>";
							html += "   <td>"
									+ formatNullData(node.DEVICE_NAME_)
									+ "</td>";
							html += "   <td>" + formatNullData(node.UNIT_)
									+ "</td>";
							html += "   <td>" + formatNullData(node.TOTAL_)
									+ "</td>";
							html += "   <td>" + formatNullData(node.FIT_NUM_)
									+ "</td>";
							html += "   <td>"
									+ formatNullData(node.NO_FIT_NUM_)
									+ "</td>";
							html += "   <td>" + formatNullData(node.RAISE_ONE_)
									+ "</td>";
							html += "   <td>" + formatNullData(node.RAISE_TWO_)
									+ "</td>";
							html += "   <td>"
									+ formatNullData(node.RAISE_THREE_)
									+ "</td>";
							html += "   <td>"
									+ formatNullData(node.RAISE_FOUR_)
									+ "</td>";
							html += "   <td>" + formatNullData(node.MEASURE_)
									+ "</td>";
							html += "   <td>"
									+ formatNullData(node.UNFINISH_EXPLAIN_)
									+ "</td>";
							html += "   <td>" + 
							    //formatNullData(node.ORG_NAME_)
									//+ ":" +
									formatNullData(node.REMARK_)
									+ "</td>";
						});
				$("#table1").append(html);
				$("#table1").append(base);
			}
		},
		failure : function(res) {
			alert(res);
		}
	});
}
/**
 * 设置部门栏
 */
function setOrgName() {
	$('#orgNameShow').html(picker.getSelectedText());
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

/**
 * 导出
 */
function exportReport() {
	var url = "/kunmingrinms/LineImproveCollection?method=exportTXDForSearch";
	url += "&year=" + $("#year").html();
	url += "&orgId=" + $("#orgId").val();
	url += "&fillData=" + $("#fill_date").html();
	url += "&ids=" + getCombotreeChildren();
	window.location = url;
}

/**
 * 查询
 */
function searchData() {
	// 必须等车间加载完才能进行选择部门的操作
	getTable1();
	setOrgName();
}