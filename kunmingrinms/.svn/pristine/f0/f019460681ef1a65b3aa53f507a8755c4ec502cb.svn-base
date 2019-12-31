$(document).ready(function(){
	getTable1();
	getBase1();
	$(".export_excel").click(autumn_year_table_execl);
});

var dialog;
var detailUpdateDialog;
var nineId,deviceId;

BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
	
	dialog = new Overlay.Dialog({
    
       width:650,
       height:180,
       title:'报表基本信息填写',
       mask:true,     
       loader:{
    	   
    	   url : contextPath + 'views/autumn/report_9_base_update.jsp',   
    	   dataType : 'html',
    	   autoLoad : false,          
           lazyLoad : false           
       },   
       
       buttons : [ 
                   {text:'保存',
                	elCls : 'button button-primary', 
                	handler : function(){
    					// 表单验证
    					if (!baseForm.isValid()) {
    						return;
    					}
    					 $.ajax({
    							type: "POST",
    							url: "/kunmingrinms/LineImproveCollection?method=addBase",
    							dataType: "json",
    							data: {
    								"id":$("#baseId").val(),
    								"year":$("#year").html(),
    								"orgId":$("#orgId").val(),
    								"ORG_DUTY_USER_":$("#orgDutyUser").val(),
    								"FILL_USER_":$("#baseFileUser").html(),
    								"FILL_DATE_":$("#baseFileDate").html()
    								},
    							success: function(response){
    								if(response.result!=1){
    									alertWarn(response.message);
    								}else{
    									alertMessage("保存表头成功!");
    									dialogClose(dialog);
    									getBase1();
    								}
    							}
    						});
   				     }
                    },
                    { text:'关闭', 
                	  elCls : 'button', 
                	  handler : function(){ 
                		  dialogClose(dialog);
                		  }
                    }
                ]
                	   
                   
     });
   $('.table1_base_update').on('click',function () {       
	   var params= {
			   "year":$("#year").html(),
			   "orgId":$("#orgId").val()
	   };
	   dialog.show();
       dialog.get('loader').load(params);
       
   });
   
   
   detailUpdateDialog = new Overlay.Dialog({
	   
	   width:650,
       height:450,
       title:'通信设备年度质量分析汇总表',
       mask:true,     
       loader:{
    	   
    	   url : contextPath + 'views/autumn/report_9_data_update.jsp',   
    	   dataType : 'html',
    	   autoLoad : false,          
           lazyLoad : false
       },   
       
       buttons : [ 
                   {text:'保存',
                	elCls : 'button button-primary', 
                	handler : function(){
    					// 表单验证
    					if (!dataForm.isValid()) {
    						return;
    					}
    					 $.ajax({
    							type: "POST",
    							url: "/kunmingrinms/LineImproveCollection?method=addCheck",
    							dataType: "json",
    							data: {
    								"nineId":nineId,
    								"deviceId":deviceId,
    								"year":$("#year").html(),
    								"orgId":$("#orgId").val(),
    								"RAISE_ONE_":$("#firstQuarter").val(),
    								"RAISE_TWO_":$("#secondQuarter").val(),
    								"RAISE_THREE_":$("#thirdQuarter").val(),
    								"RAISE_FOUR_":$("#fourthQuarter").val(),
    								"MEASURE_":$("#measure").val(),
    								"UNFINISH_EXPLAIN_":$("#unfinishedExplain").val(),
    								"REMARK_":$("#remark").val()},
    							success: function(response){
    								if(response.result!=1){
    									alertWarn(response.message);
    								}else{
    									alertMessage("保存计划成功!");
    									dialogClose(detailUpdateDialog);
    									getTable1();
    								}
    							}
    						});
   				     }
                    },
                    { text:'关闭', 
                	  elCls : 'button', 
                	  handler : function(){ 
                		  dialogClose(detailUpdateDialog);
                		  }
                    }
                ]
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

function getTable1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/LineImproveCollection?method=queryAll",
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
				$.each(data,function(i,node){	//遍历所有类型
					html+="<tr>";
					html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
					html+="   <td>"+formatNullData(node.DEVICE_NAME_)+"</td>";
					html+="   <td>"+formatNullData(node.UNIT_)+"</td>";
					html+="   <td>"+formatNullData(node.TOTAL_)+"</td>";
					html+="   <td>"+formatNullData(node.FIT_NUM_)+"</td>";
					html+="   <td>"+formatNullData(node.NO_FIT_NUM_)+"</td>";
					html+="   <td>"+formatNullData(node.RAISE_ONE_)+"</td>";
					html+="   <td>"+formatNullData(node.RAISE_TWO_)+"</td>";
					html+="   <td>"+formatNullData(node.RAISE_THREE_)+"</td>";
					html+="   <td>"+formatNullData(node.RAISE_FOUR_)+"</td>";
					html+="   <td>"+formatNullData(node.MEASURE_)+"</td>";
					html+="   <td>"+formatNullData(node.UNFINISH_EXPLAIN_)+"</td>";
					html+="   <td>"+formatNullData(node.REMARK_)+"</td>";
					html+="   <td><a onclick=\"table1_update('"+node.NINE_ID_+"','"+node.DEVICE_ID_+"')\" href='javascript:;' class='faction'>修改计划</a></td>";
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
function getBase1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/LineImproveCollection?method=getBase",
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
				if(data!=null){
					$("#fill_duty_user").html(formatNullData(data.ORG_DUTY_USER_));
					$("#fill_user").html(formatNullData(data.FILL_USER_));
					$("#fill_date").html(formatNullData(data.FILL_DATE_));
					$("#baseId").val(data.ID_);
				}
			}
		}
	});
}

function table1_update(tempnineId,tempdeviceId){
	
	nineId = tempnineId;
	deviceId = tempdeviceId;
	
	var params= {
			"deviceId":tempdeviceId,
			"year":$("#year").html(),
			"orgId":$("#orgId").val()
	};
	detailUpdateDialog.show();
	detailUpdateDialog.get('loader').load(params);
}

function autumn_year_table_execl(){
	
	var url = "/kunmingrinms/LineImproveCollection?method=autumnYearExecl";
	url += "&year=" + $("#year").html();
	url += "&orgId=" + $("#orgId").val();
	url += "&fillData=" + $("#fill_date").html();
	window.location = url;
}