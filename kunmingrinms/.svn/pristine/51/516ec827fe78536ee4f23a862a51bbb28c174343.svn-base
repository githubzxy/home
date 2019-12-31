$(document).ready(function(){
	searchData();
	//导出按钮添加事件
	$("#exportBtn").click(exportTable);
});


/**
 * 查询表1数据
 */
function getTable1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/DeviceCollection?method=queryAllForChu_Search",
		dataType: "json",
		data: {
			"year":$("#year").html(),
			"orgId":$("#orgId").val()
			},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				
				var html="";
				var thead=$("#table1 thead");
				var base=$("#base");
				$("#table1").html("");
				$("#table1").html(thead);
				$.each(data,function(i,node) {	//遍历所有类型
						html+="<tr>";
						if(node.ROW_SPAN_ != null)
							html+="   <td rowspan='"+node.ROW_SPAN_+"'>"+formatNullData(node.DEVICE_TYPE_NAME_)+"</td>";
						if(/^[0-9]*$/.test(node.SEQ_)) {
							//为数字
							html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
							html+="   <td>"+formatNullData(node.DEVICE_NAME_)+"</td>";
						} else if(node.SEQ_ != null) {
							//不为数字 单项小计
							html+="   <td colspan='2'>"+formatNullData(node.SEQ_)+"</td>";
						} else {
							// 综合合格率
							html+="   <td colspan='3'>"+formatNullData(node.DEVICE_TYPE_NAME_)+"</td>";
						}
						html+="   <td>"+formatNullData(node.UNIT_)+"</td>";
						html+="   <td>"+formatNullData(node.TEST_IDENTIFY_NUM_)+"</td>";
						html+="   <td>"+formatDecimalData(node.FIT_NUM_)+"</td>";
						html+="   <td>"+formatPercentData(node.FIT_PER_)+"%</td>";
						html+="   <td>"+formatDecimalData(node.NO_FIT_NUM_)+"</td>";
						html+="   <td>"+formatPercentData(node.NO_FIT_PER_)+"%</td>";
						html+="   <td>"+formatNullData(node.REMARK_)+"</td>";
						html+="</tr>";
				});
				$("#table1").append(html);
				$("#table1").append(base);
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}

/**
 * 导出
 */
function exportTable(){
	var url = "/kunmingrinms/DeviceCollection?method=exportForChu";
	url += "&year="+$("#year").html();
	url += "&orgId="+$("#orgId").val();
	url += "&ids=8affa073533aa3d601533bbef63e0010";// 昆明通信段
	window.location = url;
}

/**
 * 查询数据
 */
function searchData(){
	getTable1();
}