<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录日志图表页</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
</head>
<body>
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询<span id="toggleSearch" class="x-icon icon-chevron-down"></span></legend>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">组织机构：</label>
					<div class="controls" >
						<select id="orgType" style="width: 180px">
							<option value="3">科室</option>
							<option value="4" selected="selected">车间</option>
							<option value="5">工区</option>
						</select>
					</div>
				</div>
				<div style="float:right;margin-right: 80px">
					<button type="button" id="openLoginPage" class="button button-primary">切换到列表</button>
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
	<div class="search-grid-container" style="overflow-x:hidden; overflow-y:auto;">
		<fieldset>
			<legend>图表展示</legend>
				<div id="chartId"></div>
		</fieldset>
	</div>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/sq.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

/**
 * 查询栏点击触发收起和展开
 */
function hiddenSearch() {
	$('#searchForm .row').toggle('slow',function(){
		var windownHeight = $(window).height();
		var searchHeight = $('#searchForm').height();
		if(searchHeight < 50){
			$("#chartId").height(windownHeight - searchHeight - 60);
			$('#toggleSearch').removeClass('icon-chevron-down');
			$('#toggleSearch').addClass('icon-chevron-right');
		}else{
			$("#chartId").height(windownHeight - searchHeight - 60);
			$('#toggleSearch').removeClass('icon-chevron-right');
			$('#toggleSearch').addClass('icon-chevron-down');
		}
	});
}

$(document).ready(function(){ 
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	$("#chartId").height(windownHeight - searchHeight - 44);
});

seajs.config({
	paths : {
		zrender : contextPath + 'resource/js_framework/zrender',
		echarts : contextPath + 'resource/js_framework/echarts',
		system : contextPath + 'resource/js/system',
		bui : contextPath + 'resource/js_framework/bui_framework/bui'// 针对时间控件追加的js
		}
});
seajs.use(['system/loginChartPage', 'bui/calendar'],function(loginChartPage, Calendar){
	
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
	// 初始化登录入职图表页
	loginChartPage.initPage();
	// 点击查询按钮
	$("#btnSearch").click(function(){
		loginChartPage.initPage();
	});
	
});

//切换到登录日志列表页
$('#openLoginPage').click(function(){
	var threePerName = "登录日志";
	var threeModulePath = "../views/system/loginPage.jsp";
	var threePerId = "4028811c41a001630141a13817fd05b7";
	var mainContainer = window.parent;	
	mainContainer.menuClick(threePerName,threeModulePath,threePerId);	
});
</script>
</body>
</html>