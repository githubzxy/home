$(document).ready(function(){
	getTable1();
	getBase1();
	$("#exportBtn").click(exportTable);
});

var baseDialog;
var updateDialog;

BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
	
	baseDialog = new Overlay.Dialog({
    
       width:650,
       height:200,
       title:'报表基本信息填写',
       mask:true,     
       loader:{
    	   
    	   url : contextPath + 'views/autumn/report_4_tongXinDuan_base_update.jsp',   
    	   dataType : 'html',
    	   autoLoad : false,          
           lazyLoad : false           
       },   
       
       buttons : [ 
                   {text:'保存',
                	elCls : 'button', 
                	handler : function(){
    					// 表单验证
    					if (!baseForm.isValid()) {
    						return;
    					}
   					  $.ajax({
   							type: "POST",
   							url: "/kunmingrinms/DeviceCollection?method=addBase",
   							dataType: "json",
   							data : {
   								"year" : $("#base_year").html(),
   								"orgId" : $("#orgId").val(),
   								"orgDutyUser" : $("#org_duty_user").val(),
   								"fillUser" : $("#base_fill_user").html(),
   								"fillDate" : $("#base_fill_date").html()
   							},
   							success: function(response){
   								if(response.result!=1){
   									alertWarn(response.message);
   								}else{
   									alertMessage("保存表头成功!");
   									dialogClose(baseDialog);
   									getBase1();
   								}
   							}
   						});
   				     }
                    },
                    { text:'关闭', 
                	  elCls : 'button', 
                	  handler : function(){ 
                		  dialogClose(baseDialog);
                		  }
                    }
                ]
                	   
                   
     });
	
   $('.table1_base_update').on('click',function () { 
	   var params= {
			   "year":$("#year").html(),
			   "orgId":$("#orgId").val()
	   };
	   baseDialog.show();
       baseDialog.get('loader').load(params);
   });
   
   /**
	 * 更新数据弹出框
	 */
	updateDialog = new Overlay.Dialog({
		title : '备注填写',
		width : 650,
		height : 200,
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
						type: "POST",
						url: "/kunmingrinms/DeviceCollection?method=addCheck",
						dataType: "json",
						data: {
							"deviceId":deviceId,
							"year":$("#year").html(),
							"orgId":$("#orgId").val(),
							"remark":$("#remark").val()
						},
						success: function(response){
							if(response.result!=1){
								alertWarn(response.message);
							}else{
								alertMessage("保存备注成功!");
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
			url : contextPath + 'views/autumn/report_4_data_update.jsp',//弹出框加载的JSP页面
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


function getTable1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/DeviceCollection?method=queryAllForTongXinDuanSearch_Write",
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
						// 编号为数字
						// 没有数据或数据全部为0
						if(/^[0-9]*$/.test(node.SEQ_) 
								&& formatNullData(node.TEST_IDENTIFY_NUM_) != 0){
							
								html+="   <td><a onclick=\"table1_update('"+node.DEVICE_ID_+"','"+formatNullData(escape(node.REMARK_))+"')\" href='javascript:;' class='faction'>修改备注</a></td>";
						} else {
							html+="   <td></td>";
						}
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
function getBase1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/DeviceCollection?method=getBase",
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
				}
			}
		}
	});
}

function table1_update(deviceId,remark){
	
	   var params= {
			   "deviceId":deviceId,
			   "remark":remark
	   };
	   updateDialog.show();
	   updateDialog.get('loader').load(params);
}

/**
 * 导出
 */
function exportTable(){
	var url = "/kunmingrinms/DeviceCollection?method=exportForTXD_Write";
	url += "&year="+$("#year").html();
	url += "&orgId="+$("#orgId").val();
	url += "&ids=";
	window.location = url;
}
