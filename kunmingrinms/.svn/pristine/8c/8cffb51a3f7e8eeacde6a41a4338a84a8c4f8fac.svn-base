//全局变量
var store;
var tree;
var picker;

// 初始化树
BUI.use([ 'bui/extensions/treepicker', 'bui/tree', 'bui/data' ], function(
		TreePicker, Tree, Data) {
	store = new Data.TreeStore({
		root : {
			id : '8affa073533aa3d601533bbef63e0010',
			text : '昆明通信段'
		},
		url : '/kunmingrinms/WorkshopServlet',
		params : { // 设置请求时的参数
			method : "getTXDSegmentForThree",
			orgId : $("#orgId").val(),
			year :year
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
	$(".autnmu_table_export").click(autnmuTableExport);
});

/*
 * 清空单位负责人、填报人、填报时间信息
 */
function clearBaseData() {
	$('#org_duty_user').html("");
}

/**
 * 设置部门栏
 */
function setOrgName() {
	$('#orgNameShow').html(picker.getSelectedText());
}

// 初始化表一
function getTable1() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/QualityImproveSummaryForDuan",
		dataType : "json",
		data : {
			"method" : "queryAllForTXD",
			"ids" : getCombotreeChildren(),
			"orgId" : $("#orgId").val(),
			"year" : $("#year").html()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				var html = "";
				var thead = $("#table1 thead");
				var end = $("#base");
				$("#table1").html("");// 清空表一数据
				$("#table1").html(thead);// 添加表头
				$.each(data, function(i, node) {
					html += "<tr>";
					html += "   <td>" + formatNullData(node.SEQ_) + "</td>";
					html += "   <td>" + formatNullData(node.DEVICE_NAME_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.UNIT_) + "</td>";
					html += "   <td>" + formatNullData(node.TEST_IDENTIFY_NUM_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.NO_FIT_NUM_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.NO_FIT_CONTENT_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.TAKE_STEP_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.DUTY_ORG_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.DUTY_PEOPLE_) + "</td>";
					html += "   <td>" + formatNullData(node.TEAM_PEOPLE_)
							+ "</td>";
					html += "   <td>" + formatNullData(node.FINISH_DATE_)
							+ "</td>";
					html += "   <td align='left'>"
//							+ formatNullData(node.ORG_NAME_) + ":"
							+ formatNullData(node.REMARK_) + "</td>";
					html += "</tr>";
				});
				$("#table1").append(html);
				$("#table1").append(end);// 添加尾
			}
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

function autnmuTableExport() {
	var url = "/kunmingrinms/QualityImproveSummaryForDuan?method=exportForTXD";
	url += "&year=" + $("#year").html();
	url += "&ids=" + getCombotreeChildren();
	url += "&orgId=" + $("#orgId").val();
	window.location = url;
}

/**
 * 查询
 */
function searchData() {
	// 必须等车间加载完才能进行选择部门的操作
	getTable1();
	setOrgName();
	clearBaseData();
}