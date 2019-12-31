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
<title>工单盯控页面</title>
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
	.bui-grid-row-daiShenPi{
	    color: #458B74;
	 }
	 #grid .bui-grid-row{
 		height: 29px;
 	}
 	.bui-grid-row-yiChaoQi{
	    color:red;
	    z-index: 1000 !important; 
 	 }
 	.x-grid-rownumber{
 		color:black;/* 序号，全为黑色 */
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
						<span class="miniSquare"  style="background-color: #458B74"></span>待审批
					</div>			    
			        <div id="grid"></div>
		    </fieldset>
	    </div>
	</div>
</body>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	var curUserId = '${sessionScope.user.id}';
	var curOrgId = '${sessionScope.user.organization.id}';
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
			status:DAI_SHEN_PI, // 待审批
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
			status:DAI_SHEN_PI, // 待审批
			overTimeStatus:$('#overTimeStatus').val(),
			start : 0 //从第一页开始
		});
	}
}

var store,grid;// 列表及数据源声明

var showDialog;// 详细信息弹出框

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
	function showDialogCreate(workOrderTransactorId){
		showDialog = new Overlay.Dialog({
			title : '审核页面',
			width : 685,
			height : 350,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//非模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					store.load();
				}
			},
			buttons : [ {
				text : '合格',
				elCls : 'button',
				handler :function(){
						approval(workOrderTransactor, HE_GE);
						dialogClose(showDialog);
					}
				}, {
					text : '不合格',
					elCls : 'button',
					handler : function() {
						approval(workOrderTransactor, BU_HE_GE);
						dialogClose(showDialog);
					}
				}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderToDoShow.jsp?workOrderTransactorId=' + workOrderTransactorId,//弹出框加载的JSP页面
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
		dataIndex : 'order',
		elCls : 'center',//居中显示
		sortable : false,	// 表头不排序
		width : '25%',
		renderer:function(value) {
			if(value != null) {
				return value.orderNum;
			}
			return "";
		}
	}, {
		title : '工单名称',
		dataIndex : 'order',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '35%',
		renderer:function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		}
	},{
		title : '工单类型',
		dataIndex : 'order',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '12%',
		renderer:function(value) {
			return value == null ? "" : workOrder_type.typeName(value.orderType);
		}
	},{
		title : '执行人',
		dataIndex :'transactor',
		sortable :false,
		elCls : 'center',
		width : '15%',
		renderer:function(value) {
			return value.name;
		}
	},{
		title:'下发时间',
		dataIndex :'order',
		elCls:'center',
		sortable:false,
		width:'75px',
		renderer:function(value) {
			return value == null ? "" : value.sendDate;
		}
	},{
		title:'完成期限',
		dataIndex :'order',
		elCls:'center',
		sortable:false,
		width:'75px',
		renderer:function(value) {
			return value == null ? "" : value.deadLine;
		}
	},{
		title : '工单状态',
		dataIndex : 'status',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '10%',
		renderer : function(value) {
			return subStatusToChinese(value);
		}
	},{
		title : '操作',
		dataIndex : 'status',
		elCls : 'center',
		sortable : false,	
		width : '10%',
		renderer:function(value) {
			switch(value) {
				case DAI_SHEN_PI: // 待审批
					return '<span class="grid-command examineBtn">审核</span>';
				default:
					return '';
			}
		}
	}];
	/*
	 * 列表数据源声明
	 */
	store = new Data.Store({
		pageSize : 10,//每页数量
		proxy : {
			url : contextPath + "workOrderTransactorAction/getApprovalByDTO.cn",//异步数据源请求
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
					daiShenPi : 'daiShenPi',	//如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
					yiChaoQi: 'yiChaoQi'
				},
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [
				            	//Grid.Plugins.CheckSelection,//多选框插件
				            	Grid.Plugins.RowNumber//列序号插件
				            	 ],
				tbar : {
					items : [
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
	// 添加单元格点击事件
	grid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('examineBtn')) {
    		examineBtn(record.id);
    	}
	});
	
	/**
	 * 审核按钮
	 */
	function examineBtn(workOrderTransactorId) {
		var showDialog = showDialogCreate(workOrderTransactorId);
		showDialog.show();
		showDialog.get('loader').load();
	}
	
	/**
	 * 审批
	 */
	function approval(workOrderTransactor, status) {
		$.post(
				contextPath + "workOrderAction/approval.cn",
				{
					workOrderTransactor : JSON.stringify(workOrderTransactor),
					status : status
				},
				function(data,status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess("工单审批操作成功！");
					}else{
						commonFailure("工单审批操作失败！");
					}
					store.load();
				}
		);
	}
});
	</script>
</body>
</html>