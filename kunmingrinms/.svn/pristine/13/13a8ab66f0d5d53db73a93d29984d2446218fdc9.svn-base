
$(document).ready(function() {
	searchData();
	$(".autnmu_table_export").click(autnmuTableExport);
});

/**
 * 查询
 */
function searchData() {
	// 必须等车间加载完才能进行选择部门的操作
	getTable1();
	clearBaseData();
}

/*
 * 清空单位负责人、填报人、填报时间信息
 */
function clearBaseData() {
	$('#org_duty_user').html("");
}

// 初始化表一
function getTable1() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/QualityImproveSummaryForDuan",
		dataType : "json",
		data : {
			"method" : "queryAllForChuSearch",
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


function autnmuTableExport() {
	var url = "/kunmingrinms/QualityImproveSummaryForDuan?method=queryAllForChuExport";
	url += "&year=" + $("#year").html();
	url += "&orgId=" + $("#orgId").val();
	window.location = url;
}

