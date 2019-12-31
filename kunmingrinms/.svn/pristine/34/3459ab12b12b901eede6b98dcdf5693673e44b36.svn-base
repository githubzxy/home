<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>工单明细</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
	#miniSquareSpace{
		margin-top:15px;
		margin-right:4px; 
		float:right;
	}
	.miniSquare{
		display:inline-block;
		margin-left:6px;
		margin-right:2px;
		width:10px;
		height:10px;
		background-color:#000;
	}
	
	.bui-grid-row-caoGao{
	    color: #FF00FF;
	 }
	.bui-grid-row-yiPaiFa{
	    color: #8B2252;
	 }
	 .bui-grid-row-chuLiZhong{
	    color: #ff0099;
	 }
	  .bui-grid-row-daiGuiDang{
	    color: #4169E1;
	 }
	 .bui-grid-row-yiGuiDang{
	    color: #0000FF;
	 }
	 .bui-grid-row-yiChaoQi{
	    color:red;
	    z-index: 1000 !important; 
 	 }
	.x-grid-rownumber{
 		color:black;/* 序号，全为黑色 */
 	}
 	#grid .bui-grid-row{
 		height: 29px;
 	}
</style>
</head>
<body>
	<div id="tableHeadContent">
			<form id="searchForm" class="form-horizontal">
				<fieldset>
					<legend onclick="hiddenSearch()">查询</legend>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">工单名称：</label>
							<div class="controls">
								<input class="input-normal control-text" type="text"  id="orderName" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">工单号：</label>
							<div class="controls">
								<input class="input-normal control-text" type="text"  id="orderNum" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">工单类型：</label>
							<div class="controls">
								<select id="orderType" ></select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">下发时间：</label>
							<div class="controls">
								<input type="text" id="startDate" class="calendar" style="width: 140px;" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">至：</label>
							<div class="controls">
								<input type="text" id="endDate" class="calendar" style="width: 140px;" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">工单状态：</label>
							<div class="controls">
								<select id="status" ></select>
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">是否超期：</label>
							<div class="controls">
								<select id="overTimeStatus" >
									<option value="">全部</option>
								   <option value="1">是</option>
								   <option value="2">否</option>
								</select>
							</div>
						</div>
						<div style="float:right;margin-right: 100px">
							<button type="button" id="btnSearch" class="button button-primary" onclick="searchBtnClick()">查询</button>
						</div>
					</div>
				</fieldset>
			</form>
	    <div class="search-grid-container">
			<fieldset>
			    <legend>列表</legend>
			    	<div id="miniSquareSpace">
			    		<span class="miniSquare"  style="background-color: red"></span>已超期
						<span class="miniSquare"  style="background-color: #FF00FF"></span>草稿
						<span class="miniSquare"  style="background-color: #8B2252"></span>已派发
						<span class="miniSquare"  style="background-color: #ff0099"></span>处理中
						<span class="miniSquare"  style="background-color: #4169E1"></span>待归档
						<span class="miniSquare"  style="background-color: #0000FF"></span>已归档
					</div>
			        <div id="grid"></div>
		    </fieldset>
	    </div>
	</div>
	<form action="/kunmingrinms/workOrderDetailAction/expWorkOrder.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
</body>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
</script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/workOrder/workOrderCommon.js"></script>
<script type="text/javascript">
	
		var contextPath = '<%=contextPath%>' + '/';
		var perId = "<%=perId%>";
		var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
/**
 * 查询栏点击触发收起和展开
 */
function hiddenSearch() {
	$('#searchForm .row').toggle('slow',function(){
		var searchHeight = $('#searchForm').height();
		if(searchHeight < 50){//TODO自己根据条件判断收起和展开的条件及具体高度（即下面的44那个值）
			grid.set('height',grid.get('height') + 44);
		}else{
			grid.set('height',grid.get('height') - 44);
		}
	});
}

//进行高度计算
function readyInit(){
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	grid.set('height',windownHeight - searchHeight - 45);
	
	initPage();
	searchData();
};

/**
 * 初始化页面数据
 */
function initPage() {
	
	initMainStatus("status");
	$("#orderType").append("<option value='' >全部</option>");
	workOrder_type.listData("#orderType");
}

function searchData() {
	pageNum = store.get("start");
	if(store){
		store.load({
			orderName : $("#orderName").val(),
			orderNum : $("#orderNum").val(),
			orderType:$("#orderType").val(),
			startDate:$("#startDate").val(),
			endDate:$("#endDate").val(),
			status:$("#status").val(),
			overTimeStatus:$('#overTimeStatus').val(),
			start : pageNum //从第一页开始
		});
	}
}

function searchBtnClick() {//查询方法，重新加载列表数据源TODO自己定义查询参数
	
	if(store){
		store.load({
			orderName : $("#orderName").val(),
			orderNum : $("#orderNum").val(),
			orderType:$("#orderType").val(),
			startDate:$("#startDate").val(),
			endDate:$("#endDate").val(),
			status:$("#status").val(),
			overTimeStatus:$('#overTimeStatus').val(),
			start : 0 //从第一页开始
		});
	}
}

var store,grid;// 列表及数据源声明

var showDialog;// 详细信息弹出框

var configDialog;//值班部门配置弹出框

BUI.use(['bui/grid', 'bui/data', 'bui/overlay', 'bui/calendar','mod/GridBtn'],
	function(Grid, Data, Overlay, Calendar,GB) {
	
	/**
	* 初始化日期组件
	*/
	var datepicker = new Calendar.DatePicker({
		trigger : '.calendar',
		autoRender : true
	});

	/**
	 * 创建详细信息弹出框
	 */
	function showDialogCreate(workOrderId){
		showDialog = new Overlay.Dialog({
			title : '详细信息',
			width : 685,
			height : 450,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//非模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					store.load();
				}
			},
			buttons : [],
			loader : {
				url : contextPath + 'views/workOrder/workOrderShow.jsp?workOrderId=' + workOrderId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return showDialog;
	}
	
	/**
	 * 关闭弹出框并解除引用
	 * param:d 待关闭的弹出框
	 */
	function dialogClose(d){
		d.close();
		d = null;
	}
	
	/*
	 * 列表表头声明
	 */
	var columns = [{//TODO自己声明列表表头
		title : '工单号',
		dataIndex : 'orderNum',
		elCls : 'center',//居中显示
		sortable : false,	// 表头不排序
		width : '20%'
	}, {
		title : '工单名称',
		dataIndex : 'name',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '20%'
	},{
		title : '工单类型',
		dataIndex : 'orderType',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '12%',
		renderer:function(value){
			return workOrder_type.typeName(value);
		}
	}, {
		title : '拟稿人',
		dataIndex : 'creatUser',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '10%',
		renderer : function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		}
	}/* ,{
		title : '创建日期',
		dataIndex : 'creatDate',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '75px'
	} */,{
		title:'下发时间',
		dataIndex :'sendDate',
		elCls:'center',
		sortable:false,
		width:'75px'
	}, {
		title : '附件名称',
		dataIndex : 'orderAttachFileStr',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '20%'
	},{
		title:'完成期限',
		dataIndex :'deadLine',
		elCls:'center',
		sortable:false,
		width:'75px'
	}, {
		title : '完成日期',
		dataIndex : 'finishDate',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '75px',
		renderer : function(value){
			if(value != null) {
				return value;
			}
			return "";
		}
	},{
		title : '工单状态',
		dataIndex : 'status',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '10%',
		renderer : function(value){
			return mainStatusToChinese(value);
		}
	}
	];
	/*
	 * 列表数据源声明
	 */
	store = new Data.Store({
		pageSize : 10,//每页数量
		proxy : {
			url : contextPath + "workOrderDetailAction/getDetailByDTO.cn",
			method : 'post'
		}
	});
	/*
	 * 列表声明
	 */
	grid = new GB(
			{
				render : '#grid',
				idField : 'id',
				columns : columns,
				loadMask : true,
				perId : perId,
				contextPath:contextPath,
				store : store,
				width : '100%',
				itemStatusFields : {
					caoGao : 'caoGao', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
					yiPaiFa : 'yiPaiFa',
					chuLiZhong : 'chuLiZhong',
					daiGuiDang : 'daiGuiDang',
					yiGuiDang : 'yiGuiDang',
					yiChaoQi: 'yiChaoQi'
				},
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [
// 				            	Grid.Plugins.CheckSelection,//多选框插件
				            	Grid.Plugins.RowNumber//列序号插件
				            	 ],
				tbar : {
					items : [
							{
								btnCls : 'button button-small',
								text : '<i class="icon-download"></i>导出EXCEL',
								listeners : {
									click : function() {//点击时创建并弹出修改界面
										exportXls();
									}
								}
							},
							{
								xclass : 'bar-item-separator'
							}, {
								btnCls : 'button button-small',
								text : '<i class="icon-list-alt"></i>详情',
								listeners : {
									click : function() {
										var selectedAll = grid.getSelection();
										if(selectedAll.length == 0){
											commonFailure("请选择一条记录进行查看");
											return;
										}
										var record = selectedAll[0];
										var workOrderId = record.id;
										var showDialog = showDialogCreate(workOrderId);
										showDialog.show();
										showDialog.get('loader').load();
									}
								}
							},
							{
								xclass : 'bar-item-text',
								text : errorMsgHtml+sucMsgHtml
							}]
				},
				// 底部工具栏
				bbar : {
					// pagingBar:表明包含分页栏
					pagingBar : true
				}
			});
	grid.render();//渲染列表
	readyInit();
	// 导出
// 	function exportXls() {
		
// 		var start = store.get("start");// 开始页
// 		var limit = store.get("pageSize");// 每页数量
		
// 		window.location.href = contextPath+ 'workOrderDetailAction/exportXls.cn?orderName='
// 			+$("#orderName").val()
// 			+ '&orderNum=' + $("#orderNum").val()
// 			+ '&orderType=' + $("#orderType").val()
// 			+ '&startDate=' + $("#startDate").val()
// 			+ '&endDate=' + $("#endDate").val()
// 			+ '&status=' + $("#status").val()
// 			+ '&start=' + start
// 			+ '&limit=' + limit;
// 	}
	
	//导出本页数据
	function exportXls(){
		// 导出本页数据
		var records = store.getResult();	
			var json = '[';
		for(var i = 0 ; i < records.length ; i++){
			var row = records[i];
			json += '{'
				+'"orderNum":'+'"'+row.orderNum+'",'
				+'"name":'+'"'+row.name+'",'
				+'"orderType":'+'"'+workOrder_type.typeName(row.orderType)+'",'
				+'"creatUser":'+'"'+row.creatUser.name+'",'
// 				+'"creatDate":'+'"'+Grid.Format.datetimeRenderer(row.creatDate)+'",'
				+'"sendDate":'+'"'+Grid.Format.datetimeRenderer(row.sendDate)+'",'
				+'"orderAttachFileStr":'+'"'+row.orderAttachFileStr+'",'
				+'"deadLine":'+'"'+Grid.Format.datetimeRenderer(row.deadLine)+'",'
				+'"finishDate":'+'"'+Grid.Format.datetimeRenderer(row.finishDate)+'",'
				+'"status":'+'"'+mainStatusToChinese(row.status)+'"'
				+'},';
		}
		json = json.substring(0, json.length - 1);
		json += ']';
		$("#exportXlsJson").val(json);
		if(json != ']'){
			$("#exportForm").submit();
		}else{
			commonFailure("导出失败！");
		}
	}
	
});
	</script>
</body>
</html>