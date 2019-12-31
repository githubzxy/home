
$(document).ready(function() {
	getTable1();
	$("#autnmu_table_export").click(exportReport);
});

function getTable1() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/LineImproveCollection?method=queryAllForChu",
		dataType : "json",
		data : {
			"year" : $("#year").html(),
			"orgId" : $("#orgId").val()//处id
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
							html += "   <td>"
									+ formatNullData(node.REMARK_)
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
 * 导出
 */
function exportReport() {
	var url = "/kunmingrinms/LineImproveCollection?method=queryAllForChuExport";
	url += "&year=" + $("#year").html();
	url += "&orgId=" + $("#orgId").val();
	url += "&fillData=" + $("#fill_date").html();
	window.location = url;
}

