// 表基本信息填写框
var baseDialog;
var addDialog;
var updateDialog;

BUI.use(['bui/overlay'], function(Overlay) {
	
	/**
	 * 表基本信息弹出框
	 */
	baseDialog = new Overlay.Dialog({
		title : '报表基本信息填写',
		width : 650,
		height : 200,
		mask : true,//非模态弹出框
		bodyStyle : {padding : 10},
		listeners : {
			closing : function(){
				//关闭窗口时刷新报表基本信息
				getBaseInfo();
			}
		},
		buttons : [ {
			text : '保存',
			elCls : 'button',
			handler :function(){
					// 表单验证
					if (!baseForm.isValid()) {
						return;
					}
					// 发ajax消息，保存基本表信息
					$.ajax({
								type : "POST",
								url : "/kunmingrinms/QualityImproveSummaryForDuan?method=saveBaseInfo ",
								dataType : "json",
								data : {
									"orgId" : $("#orgId").val(),
									"year" : $("#base_year").html(),
									"org_duty_user" : $("#base_duty_user").val(),
									"fill_user" : $("#base_fill_user").html(),
									"fill_date" : $("#base_fill_date").html()
								},
								success : function(response) {
									alertMessage("保存成功!");
									dialogClose(baseDialog);
									getBaseInfo();
								},
								failure : function(res) {
									alert(res);
								}
							});
				}
			}, {
				text : '关闭',
				elCls : 'button',
				handler : function() {
					dialogClose(baseDialog);
				}
			}],
		loader : {
			url : contextPath + 'views/autumn/report_8_chejian_base_update.jsp',//弹出框加载的JSP页面
			autoLoad : false,//不在弹出框组件初始化时自动加裁
			lazyLoad : false,//不进行延迟加裁
			dataType : 'html'//加载内容类型
		}
	});

	/**
	 * 添加数据弹出框
	 */
	addDialog = new Overlay.Dialog({
		title : '报表数据添加',
		width : 650,
		height : 400,
		mask : true,//非模态弹出框
		bodyStyle : {padding : 10},
		listeners : {
			closing : function(){
				getTable1();
			}
		},
		buttons : [ {
			text : '保存',
			elCls : 'button',
			handler :function(){
					// 表单验证
					if (!addForm.isValid()) {
						return;
					}
					$.ajax({
						type : "POST",
						url : "/kunmingrinms/QualityImproveSummary?method=add",
						dataType : "json",
						data : {
							"orgId" :  $("#orgId").val(),
							"year" :  $("#year").html(),
							
							"no_fit_content" :  $("#addDiv #no_fit_content").val(),
							"take_step" : $("#addDiv #take_step").val(),
							"duty_org" : $("#addDiv #duty_org").val(),
							"team_people" : $("#addDiv #team_people").val(),
							"finish_date" : $("#addDiv #finish_date").val(),
							"remark" : $("#addDiv #remark").val(),
							"duty_people" : $("#addDiv #duty_people").val(),
							"device_id" : deviceID,
						},
						success : function(response) {
							if (response.result != 1) {
								alertWarn(response.message);
							} else {
								alertMessage("保存成功!");
								dialogClose(addDialog);
								getTable1();
							}
						}
					});
				}
			}, {
				text : '关闭',
				elCls : 'button',
				handler : function() {
					dialogClose(addDialog);
				}
			}],
		loader : {
			url : contextPath + 'views/autumn/report_8_chejian_data_add.jsp',//弹出框加载的JSP页面
			autoLoad : false,//不在弹出框组件初始化时自动加裁
			lazyLoad : false,//不进行延迟加裁
			dataType : 'html'//加载内容类型
		}
	});
	
	/**
	 * 更新数据弹出框
	 */
	updateDialog = new Overlay.Dialog({
		title : '报表数据编辑',
		width : 650,
		height : 400,
		mask : true,//非模态弹出框
		bodyStyle : {padding : 10},
		listeners : {
			closing : function(){
				getTable1();
			}
		},
		buttons : [ {
			text : '保存',
			elCls : 'button',
			handler :function(){
					// 表单验证
					if (!updateForm.isValid()) {
						return;
					}
					$.ajax({
						type : "POST",
						url : "/kunmingrinms/QualityImproveSummary?method=update",
						dataType : "json",
						data : {
							"suID" :  suID,
							"orgId" :  $("#orgId").val(),
							"year" :  $("#year").html(),
							
							"no_fit_content" :  $("#updateDiv #no_fit_content").val(),
							"take_step" : $("#updateDiv #take_step").val(),
							"duty_org" : $("#updateDiv #duty_org").val(),
							"team_people" : $("#updateDiv #team_people").val(),
							"finish_date" : $("#updateDiv #finish_date").val(),
							"remark" : $("#updateDiv #remark").val(),
							"duty_people" : $("#updateDiv #duty_people").val()
						},
						success : function(response) {
							if (response.result != 1) {
								alertWarn(response.message);
							} else {
								alertMessage("保存成功!");
								dialogClose(updateDialog);
								getTable1();
							}
						}
					});
				}
			}, {
				text : '关闭',
				elCls : 'button',
				handler : function() {
					dialogClose(updateDialog);
				}
			}],
		loader : {
			url : contextPath + 'views/autumn/report_8_chejian_data_update.jsp',//弹出框加载的JSP页面
			autoLoad : false,//不在弹出框组件初始化时自动加裁
			lazyLoad : false,//不进行延迟加裁
			dataType : 'html'//加载内容类型
		}
	});
	
	/**
	 * 关闭弹出框并解除引用
	 * param:d 待关闭的弹出框
	 */
	function dialogClose(d){
		d.close();
		d = null;
	}

});

$(document).ready(function() {
	getTable1();
	getBaseInfo();
	$("#saveBase").click(saveBaseInfo);
	$("#excelExport").click(excelExport);
});

/**
 * 保存基础信息
 */
function saveBaseInfo() {
	
	var params= {
			"year":$("#year").html(),
	};
	baseDialog.show();
	baseDialog.get('loader').load(params);
}

/**
 * 编辑统计表中的数据
 * 如果之前已经填写过，则suID不为空，则使用suID去查询指定数据并进行修改
 * 如果之前未填写，则suID为空，进行新增动作
 * @param suID 报表8 AUTUMN_EIGHT_SUMMARY的主键Id
 * @param deviceID 设备Id
 * @param BelongOrg 所属部门
 * @param year 年份
 */
function editSummary(suID,deviceID,belongOrg,year){
	var params;
	if(suID == "null"){
		params= {
				"deviceID":deviceID,
				'belongOrg':belongOrg,
				'year':year
		};
		addDialog.show();
		addDialog.get('loader').load(params);
	}else{
		params= {
				"suID":suID,
		};
		updateDialog.show();
		updateDialog.get('loader').load(params);
	}
}

//初始化表一
function getTable1() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/QualityImproveSummary",
		dataType : "json",
		data : {
			"method" : "queryAll",
			"orgId" :  $("#orgId").val(),
			"year" :  $("#year").html()
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
					html += "   <td>" + formatNullData(node.DEVICE_NAME_) + "</td>";
					html += "   <td>" + formatNullData(node.UNIT_)+ "</td>";
					html += "   <td>" + formatNullData(node.TEST_IDENTIFY_NUM_)+ "</td>";
					html += "   <td>" + formatNullData(node.NO_FIT_NUM_) + "</td>";
					html += "   <td>" + formatNullData(node.NO_FIT_CONTENT_) + "</td>";
					html += "   <td>" + formatNullData(node.TAKE_STEP_) + "</td>";
					html += "   <td>" + formatNullData(node.DUTY_ORG_) + "</td>";
					html += "   <td>" + formatNullData(node.DUTY_PEOPLE_) + "</td>";
					html += "   <td>" + formatNullData(node.TEAM_PEOPLE_) + "</td>";
					html += "   <td>" + formatNullData(node.FINISH_DATE_) + "</td>";
					html += "   <td>" + formatNullData(node.REMARK_) + "</td>";
					html += "   <td><a onclick=\"editSummary('"+node.SU_ID_+"','"+node.DEVICE_ID_+"','"+node.BELONG_ORG_+"','"+node.YEAR_+"')\" href='javascript:;' class='faction'>编辑</a></td>";
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

//初始化表的基础信息	
function getBaseInfo(){
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/QualityImproveSummaryForDuan",
		dataType : "json",
		data : {
			"method" : "getBaseInfo",
			"orgId" :  $("#orgId").val(),
			"year" :  $("#year").html()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				if(data != null && data.length != 0){
					$("#org_duty_user").html(data.ORG_DUTY_USER_);
					$("#fill_user").html(data.FILL_USER_);
					$("#fill_date").html(data.FILL_DATE_);
				}
			}
		},
		failure : function(res) {
			alert(res);
		}
	});
}

//excel导出
function excelExport(){
	var url = "/kunmingrinms/QualityImproveSummary?method=excelExport";
	url += "&year=" + $("#year").html();
	url += "&orgId=" + $("#orgId").val();
	url += "&fillData=" + $("#fill_date").html();
	window.location = url;
}