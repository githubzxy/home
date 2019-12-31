<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查看详细信息</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
  	#gridShow .bui-grid-header {
    	overflow-y: hidden;
	}
 	#showErrorSpan {
	 	position: inherit;
		right:inherit;
		top: inherit;
		margin-top:inherit;
 	}
</style>
</head>
<body id="show">
	<div class="demo-content"  style="width:100%; position:relative; height:100%; overflow-y:auto">
		<!-- 详细信息 -->
		<a id="expExcel" style="display: none;"></a>
		<div id="gridShow" style="float:right;margin-right:2px;margin-top:1px;"></div>
		<input type = "hidden" id="dataId">
	</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js/emergency/tableExportToExcel.js"></script>
<script type="text/javascript">

//失败提示信息
var showErrorMsgHtml = '<div id="showErrorMsg" class="tips tips-small tips-warning" style="display:none">'+
        '<span id="showErrorSpan" class="x-icon x-icon-small x-icon-error"><i class="icon icon-white icon-bell"/></span>'+
        '<div id="showErrorResultMsg" class="tips-content" style="width:100%;"></div>'+
        '</div>';
//成功提示信息
var showSucMsgHtml = '<div id="showSucMsg" class="tips tips-small  tips-success" style="display:none">'+
	    '<span class="x-icon x-icon-small x-icon-success"><i class="icon icon-white icon-ok"/></span>'+
	    '<div id="showSucResultMsg" class="tips-content" style="width:100%;"></div>'+
	    '</div>';

/**公用成功信息提示
 * @param msg
 */
function showCommonSuccess(msg){
	if(msg == null || msg.trim() == ''){
		msg = '操作成功！';
	}
	$('#showSucResultMsg').empty();
	$('#showSucResultMsg').append(msg);
	$('#showSucMsg').show();
	$('#showSucMsg').fadeOut(5000);
}

/**
 * 公用失败信息提示
 */
function showCommonFailure(msg){
	if(msg == null || msg.trim() == ''){
		msg = '保存数据失败，请联系管理员！';
	}
	$('#showErrorResultMsg').empty();
	$('#showErrorResultMsg').append(msg);
	$('#showErrorMsg').show();
	$('#showErrorMsg').fadeOut(5000);
}

	var pageNum = 0;//查询开始数，保证翻页后，storeQuestion再次load的时候还停留在当前页
	
	var storeShow,gridShow;// 列表及数据源声明

	var contextPath = '<%=contextPath%>' + '/';
	var id = '<%=request.getParameter("id")%>';
	
	$("#dataId").val(id);
	
	$(document).ready(function() {
		getRailLineNameAndId();
	});
	
	var railLineName;
	var railLineId;
	
	function getRailLineNameAndId() {
		$.ajax({
			url : contextPath + "GSMRAction/getRailLineNameAndId.cn",
			dataType : "json",
			type : "post",
			async : false,
			data:{
				"id" : id
			},
			success : function(data,status){
				if(data){
// 					console.log(data[0].name);
					railLineName = data[0].name;
	 				railLineId = data[0].id;
				}
			}
		});
	}
	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay'],
			function(Grid,Data,Calendar, Form,Overlay){
		
		var alert = BUI.Message.Alert;//使用bui的消息提示框
		
		/*表格列设置*/
		var columns = [
			{
				title:'',
				dataIndex:'num',
				elCls : 'center',
				width:'41'
			},
			{
				title:'项目',
				dataIndex:'norm',
				elCls : 'center',
				width:'35%'
			},
			{
				title:'标准',
				dataIndex:'normValue',
				elCls : 'center',
				width:'25%'
			}
		];
		
		addColumn(railLineName,railLineId);
		
		var colGroup = new Grid.Plugins.ColumnGroup({
            groups : [{
              title : '昆明铁路局',
              from : 3,
              to : 3
            }]
        }),
		//数据库取出数据
		storeShow = new Data.Store({
			url : contextPath + "GSMRAction/getGSMRStatisticsByGSMRInfo.cn",
			pageSize : 100,
			params : {         //设置请求时的参数
			      id : id
			},
			proxy : {
				method : 'post',
				dataType : 'json',
			},
			autoLoad : true
		});
			
		/*表格设置*/
		gridShow = new Grid.Grid({
			render : '#gridShow',
			width : '100%',//如果表格使用百分比，这个属性一定要设置
			columns : columns,
			idField : 'id',
			tbar : {
				items : [{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-download"></i>导出',
	                  listeners : {
	                    'click' : function(){
	                    	exportXls();
	                    }
	                  }
	                },{
						xclass : 'bar-item-text',
						text : showErrorMsgHtml + showSucMsgHtml
				}]
			},
			plugins : [colGroup],
			store : storeShow
		});
		gridShow.render();
		
		function addColumn(railLineName,railLineId){
			columns.push({//先添加一列，车间列
				   title : railLineName,
				   dataIndex : 'statistics',
				   width : "30%",
				   elCls : 'center'
			});
		}
     	
    	//导出本页数据
    	function exportXls(){
    		//表头
    		var thead=$('#gridShow .bui-grid-group-header .bui-grid-table').html();
    		thead = thead.replace(new RegExp('<span class="bui-grid-sort-icon">&nbsp;</span>','g'),"");
    		thead = thead.replace(new RegExp('<th class="bui-grid-hd-empty bui-grid-hd bui-grid-db-hd" aria-disabled="false" rowspan="2"><div class="bui-grid-hd-inner"></div></th>','g'),"");
    		//表体内容
    		var tbody=$('#gridShow .bui-grid-body .bui-grid-table').html();
    		tbody = tbody.replace(new RegExp('<td class="bui-grid-cell bui-grid-cell-empty">&nbsp;</td>','g'),"");
    		
    		var tableContent='<table border="1" cellspacing="0" cellpadding="0"> '
    								+thead
    								+tbody
    								+'</table>';
    								
    		var fileName="GSMR统计数据";//文件名
    		var sheetName="GSMR"; 
    		tableExportToExcel("expExcel",fileName, sheetName,tableContent);
    	}
        
        /**
    	 * 关闭弹出框并解除引用
    	 * param:d 待关闭的弹出框
    	 */
    	function dialogClose(d){
    		d.close();
    		d = null;
    	}
	/*BUI结束*/
	});

</script>
</body>
</html>