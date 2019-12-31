<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<title>段机车列尾控制盒故障处理情况报表</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<style id="普铁无线报表报表模板_10009_Styles">
<!--table
.xl9710009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;}
.xl9810009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl9910009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl10010009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl10110009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl10210009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl10310009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl10410009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl10510009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl10610009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl10710009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl10810009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl10910009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl11010009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl11110009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl11210009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl11310009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl11410009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl11510009
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
-->

.bui-select-list {
    height : 250px;
}
</style>
</head>

<body>
<div id="showDiv" style="margin-top: 20px;">
	<label style="float:left;margin-left: 20px;">车间：</label>
	<form id="showForm" method="post">
		<div id="orgSelect" style="float:left; margin-right: 5px;">
		</div>
		<input type="hidden" id="belongDepart" name="belongDepart" value="${requestScope.belongDepart}" >
		<input type="hidden" id="belongDepartName" name="belongDepartName" value="${requestScope.belongDepartName}" >
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button type="submit" id="searchBtn" >查询</button>
	<button type="button" id="exportBtn" >导出Excel</button>
</div>
<div id="普铁无线报表报表模板_10009" align=center>
<table border=0 cellpadding=0 cellspacing=0 style='border-collapse:
 collapse;table-layout:fixed;width:1580px' id="table">
 <col width=45 style='width:34pt'>
 <col width=85 span=5 style='width:64pt'>
 <col class=xl9710009 width=85 style='width:64pt'>
 <col width=85 span=6 style='width:64pt'>
 <col width=117 span=2 style='width:88pt'>
 <col width=85 span=2 style='width:64pt'>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl10410009 width=45 style='height:24.95pt;width:34pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10510009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=117 style='width:88pt'></td>
  <td class=xl10410009 width=117 style='width:88pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=18 height=33 class=xl11510009 style='height:24.95pt'>机车列尾控制盒故障处理情况报表</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl11010009 style='height:24.95pt'>填报单位：</td>
  <td colspan=16 style="white-space: normal;word-break:break-all;" class=xl11110009>${requestScope.belongDepartName}</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td rowspan=2 height=66 class=xl9910009 width=45 style='height:49.9pt;
  border-top:none;width:34pt'>序号</td>
  <td colspan=7 class=xl9910009 width=595 style='border-left:none;width:448pt'>列尾故障受理情况</td>
  <td colspan=5 class=xl9910009 width=425 style='border-left:none;width:320pt'>故障处理情况</td>
  <td colspan=2 class=xl9910009 width=234 style='border-left:none;width:176pt'>更换控制盒情况</td>
  <td rowspan=2 class=xl9910009 width=85 style='width:64pt'>检修人</td>
  <td rowspan=2 class=xl9910009 width=85 style='width:64pt'>备注</td>
  <td rowspan=2 class=xl9910009 width=95 style='width:95pt'>所属车间</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl9910009 width=85 style='height:24.95pt;border-top:none;
  border-left:none;width:64pt'>日期</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>时间</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>受理人</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>机车类型<br>
    /号码</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>控制盒号码<br>
    （1/2室）</td>
  <td class=xl10010009 width=85 style='border-top:none;border-left:none;
  width:64pt'>报故障控制盒号码</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>故障现象</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>入库日期</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>入库时间</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>列尾设备检测</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>故障处理情况</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>数据下载上传单位及姓名</td>
  <td class=xl9910009 width=117 style='border-top:none;border-left:none;
  width:88pt'>故障控制盒号码<br>
    （1/2室）</td>
  <td class=xl9910009 width=117 style='border-top:none;border-left:none;
  width:88pt'>更换后控制盒号码<br>
    （1/2室）</td>
 </tr>
 <c:if test="${empty list}">
  <tr height=33 style='height:24.95pt' class="trClass">
  <td height=33 class=xl10110009 width=45 style='height:24.95pt;border-top:
  none;width:34pt'>1</td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10310009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10210009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10310009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=117 style='border-top:none;border-left:none;
  width:88pt'></td>
  <td class="xl10110009" width=117 style='border-top:none;border-left:none;
  width:88pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
 </tr>
 </c:if>
 <c:forEach items="${list}" var="item" varStatus="s">
 <tr id="line1" height=33 style='height:24.95pt' class="trClass">
  <td height=33 class=xl10110009 width=45 style='height:24.95pt;border-top:
  none;width:34pt'>${s.count}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.date}</td>
  <td class="xl10310009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.time}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.acceptPerson}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.trainType}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.controlBox}</td>
  <td class="xl10210009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.faultControlBox}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.faultPhenomenon}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.enterDate}</td>
  <td class="xl10310009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.enterTime}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.deviceExamine}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.dealFault}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.upAndDown}</td>
  <td class="xl10110009 editCell" width=117 style='border-top:none;border-left:none;
  width:88pt;word-wrap:break-word;word-break:break-all;'>${item.faultBoxNum}</td>
  <td class="xl10110009 editCell" width=117 style='border-top:none;border-left:none;
  width:88pt;word-wrap:break-word;word-break:break-all;'>${item.changeFaultBoxNum}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.repairPerson}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.memo}</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt;word-wrap:break-word;word-break:break-all;'>${item.belongOrgName}</td>
 </tr>
 </c:forEach>
  <tr height=35 style='height:26.25pt'>
  <td colspan=2 height=35 class=xl10910009 style='height:26.25pt'></td>
  <td colspan=2 class="xl9810009" style='border-top:none;white-space:normal;'></td>
  <td class=xl10710009 style='border-top:none'></td>
  <td colspan=2 class=xl10910009></td>
  <td colspan=2 class="xl11310009"></td>
  <td class=xl10710009 style='border-top:none'></td>
  <td class=xl10810009 style='border-top:none'></td>
  <td colspan=2 class=xl11210009></td>
  <td colspan=2 class="xl11410009"></td>
  <td class=xl10710009 style='border-top:none'></td>
  <td class=xl10710009 style='border-top:none'></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var select;
BUI.use(['bui/data', 'bui/select'], function(Data, Select) {
	var store = new Data.Store({
		autoLoad : true,
		proxy : {
			url : contextPath + "trainRearFaultAction/getTrainRearFault.cn",
			method : 'post'
		},
		params : {
			year : $("#year").val(),
			month : $("#month").val()
		}
	});
	select = new Select.Select({
		width : 250,
		render : '#orgSelect',
		valueField : '#belongDepart',
		multipleSelect : true,
		store : store
	});
	select.render();
	select.on("change", function(ev) {

		if(ev.item.value == "-1") {// 选中全部
			if($(".bui-list-item:first").hasClass("bui-list-item-selected")) {
				$(".bui-list-item").addClass("bui-list-item-selected");
			} else {
				$(".bui-list-item").removeClass("bui-list-item-selected");
			}
		} else {
			$(".bui-list-item:first").removeClass("bui-list-item-selected");
		}
		
		$("#belongDepart").val(select.getSelectedValue());
		$("#belongDepartName").val(select.getSelectedText());
		$("#orgSelect .bui-select .bui-select-input").val(select.getSelectedText());
	});
});

// 根据车间条件查询
$("#showDiv #searchBtn").click(function() {
	$("#showForm").attr("action", "/kunmingrinms/trainRearFaultAction/getTrainRearFaultBycj.cn");
	$("#showForm").submit();
});

//导出Excel
$("#showDiv #exportBtn").click(function() {

	$("#showForm").attr("action", "/kunmingrinms/trainRearFaultAction/exportShowBycj.cn");
	$("#showForm").submit();
});


</script>
</body>
</html>
