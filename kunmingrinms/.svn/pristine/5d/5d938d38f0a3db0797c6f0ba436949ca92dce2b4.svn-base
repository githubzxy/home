<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录日志管理</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询<span id="toggleSearch" class="x-icon icon-chevron-down"></span></legend>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">组织机构：</label>
					<div class="controls" >
						<jsp:include page="../common_page/OrgAllInputTree.jsp" flush="true">
							<jsp:param name="org"  value="org" />
							<jsp:param name="orgVal"  value="orgVal" />
							<jsp:param name="actionURL"  value="organization/getOrgChildrenById.cn" />
							<jsp:param name="width"  value="170px" />
							<jsp:param name="height"  value="18px" />
						</jsp:include>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">操作人：</label>
					<div class="controls">
						<input type="text" id="handleUser" class="input-normal" style="width: 171px;"/>
					</div>
				</div>
				<div style="float:right;margin-right: 80px">
					<button type="button" id="openChartPage" class="button button-primary">切换到图表</button>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">操作时间：</label>
					<div class="controls" style="height: 35px;">
						<input type="text" id="startTime" class="calendar calendar-time" style="width: 170px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">至：</label>
					<div class="controls" >
						<input type="text" id="endTime" class="calendar calendar-time" style="width: 170px;" />
					</div>
				</div>
				<div style="float:right;margin-right: 100px">
					<button type="button" id="btnSearch" class="button button-primary">查询</button>
				</div>
			</div>
		</fieldset>
	</form>
	<div class="search-grid-container">
		<fieldset>
			<legend>列表</legend>
			<div id="grid"></div>
		</fieldset>
	</div>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript">
	
var contextPath = '<%=contextPath%>' + '/';

var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
var pageSize = 15;//每页显示条数

var store,grid;// 列表及数据源声明

/**
 * 查询栏点击触发收起和展开
 */
function hiddenSearch() {
	$('#searchForm .row').toggle('slow',function(){
		var searchHeight = $('#searchForm').height();
		if(searchHeight < 50){//TODO自己根据条件判断收起和展开的条件及具体高度（即下面的44那个值）
			grid.set('height',grid.get('height') + 44);
			$('#toggleSearch').removeClass('icon-chevron-down');
			$('#toggleSearch').addClass('icon-chevron-right');
		}else{
			$('#toggleSearch').removeClass('icon-chevron-right');
			$('#toggleSearch').addClass('icon-chevron-down');
			grid.set('height',grid.get('height') - 44);
		}
	});
}
//进行高度计算
$(document).ready(function () {
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	grid.set('height',windownHeight - searchHeight-45);
	
	searchData();
});

function searchData() {//初始化页面方法
	pageNum = store.get("start");
	if(store){
		store.load({
			org : orgVal.value,
			userName : $("#handleUser").val(),
			startTime : $("#startTime").val(),
			endTime : $("#endTime").val(),
			start : 0 //从第一页开始
		});
	}
}

function searchBtnClick() {//查询方法，重新加载列表数据源TODO自己定义查询参数
	if(store){
		store.load({
			org : orgVal.value,
			userName : $("#handleUser").val(),
			startTime : $("#startTime").val(),
			endTime : $("#endTime").val(),
			
			start : pageNum //从第一页开始
		});
	}
}

$("#btnSearch").click(function(){
	searchBtnClick();
	return false;
});

// 切换到登录日志图表页
$('#openChartPage').click(function(){
	var threePerName = "登录日志图表";
	var threeModulePath = "../views/system/loginChartPage.jsp";
	var threePerId = "4028811c41a001630141a13817fd05b6";
	var mainContainer = window.parent;	
	mainContainer.menuClick(threePerName,threeModulePath,threePerId);	
	
});

BUI.use(["bui/grid","bui/data",'bui/calendar'],
		function(Grid,Data,Calendar){
	
	//再次点击清空时间
// 	$('#startTime').on('click',(function(){
// 		$('#startTime').val("");
// 	}));
// 	$('#endTime').on('click',(function(){
// 		$('#endTime').val(""); 
// 	}));
	
	//日历
	var datepickerStart = new Calendar.DatePicker({
		trigger : '#startTime',
		showTime : true,
		autoRender : true
	});
	var datepickerEnd = new Calendar.DatePicker({
		trigger : '#endTime',
		showTime : true,
		autoRender : true
	});
	//设置默认时间
	datepickerStart.on('show',function(){
		var c = datepickerStart.get('calendar');
		c.set('hour',0);
		c.set('minute',0);
		c.set('second',0);
	});
	datepickerEnd.on('show',function(){
		var c = datepickerEnd.get('calendar');
		c.set('hour',23);
		c.set('minute',59);
		c.set('second',59);
	});
	
	/*表格内容*/
	var Store = Data.Store;
	
	/*表格列设置*/
	var columns = [
		{
			title : '组织机构',
			dataIndex : 'orgName',
			width : '25%'
		},           
		{
			title:'操作人',
			dataIndex:'userName',
			width:'25%'
		},
		{
			title:'操作内容',
			dataIndex:'content',
			width:'25%'
		},
		{
			title:'操作时间',
			dataIndex:'operationTime',
			width:'25%',
			renderer: Grid.Format.datetimeRenderer
		}
	];
	
	// 数据库取出数据	
	store = new Store({
		url : contextPath + "loginLogAction/loginList.cn",
		pageSize : pageSize,
		proxy : {
			method : 'post',
			dataType : 'json'
		}
	});
	
	/*表格设置*/
	grid = new Grid.Grid({
		render : '#grid',
		width : '100%',//如果表格使用百分比，这个属性一定要设置
		columns : columns,
		idField : 'a',
		bbar:{pagingBar:true},
		plugins : [Grid.Plugins.RowNumber],
		store : store
	});

	grid.render();
	
	
/*BUI结束*/	
//console.log(store.__attrVals.data);
	
});
</script>
</body>
</html>