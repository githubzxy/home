<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<title>区间设备故障统计分析表</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<style id="普铁无线报表报表模板_23099_Styles">
<!--table
.xl9723099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl9823099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl9923099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;}
.xl10023099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;}
.xl10123099
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
.xl10223099
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
	white-space:nowrap;}
.xl10323099
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
	white-space:nowrap;}
.xl10423099
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
.xl10523099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10623099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:red;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10723099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:fuchsia;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10823099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:fuchsia;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10923099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:teal;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl11023099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl11123099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl11223099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	white-space:nowrap;}
.xl11323099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
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
.xl11423099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl11523099
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
.xl11623099
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
.xl11723099
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
.xl11823099
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
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
-->
.bui-select-list {
    height : 250px;
}
</style>
</head>
<body>
<div style="margin-bottom:40px;margin-top:20px;">
	<label style="float:left;margin-left: 10px;">车间：</label>
	<form id="showForm" method="post">
		<div id="orgSelect" style="float:left; margin-right: 5px;">
		</div>
		<input type="hidden" id="belongDepart" name="belongDepart" value="${requestScope.belongDepart}" >
		<input type="hidden" id="belongDepartName" name="belongDepartName" value="${requestScope.belongDepartName}" >
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button type="submit" id="searchBtn" >查询</button>
	<button id="exportBtn" >导出Excel</button>
</div>
<div id="普铁无线报表报表模板_23099" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=1210 class=xl9723099
 style='border-collapse:collapse;table-layout:fixed;width:1290px' id="table">
 <col class=xl9723099 width=49 style='width:37pt'>
 <col class=xl9823099 width=85 style='width:64pt'>
 <col class=xl9723099 width=85 style='width:64pt'>
 <col class=xl9823099 width=85 span=2 style='width:64pt'>
 <col class=xl9823099 width=138 style='width:104pt'>
 <col class=xl9723099 width=37 span=8 style='width:28pt'>
 <col class=xl9723099 width=69 style='width:52pt'>
 <col class=xl9723099 width=37 style='width:28pt'>
 <col class=xl9723099 width=180 style='width:135pt'>
 <col class=xl9923099 width=101 style='width:76pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl9723099 width=49 style='height:15.0pt;width:37pt'></td>
  <td class=xl9823099 width=85 style='width:64pt'></td>
  <td class=xl9723099 width=85 style='width:64pt'></td>
  <td class=xl9823099 width=85 style='width:64pt'></td>
  <td class=xl9823099 width=85 style='width:64pt'></td>
  <td class=xl9823099 width=138 style='width:104pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=69 style='width:52pt'></td>
  <td class=xl9723099 width=37 style='width:28pt'></td>
  <td class=xl9723099 width=180 style='width:135pt'></td>
  <td class=xl9723099 width=101 style='width:76pt'></td>
 </tr>
 <tr height=30 style='height:22.5pt'>
  <td colspan=19 height=30 class=xl11423099 style='height:22.5pt'>区间设备故障统计分析</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl11623099 style='height:15.0pt'>填报单位：</td>
  <td colspan=17 class=xl11723099 style="white-space: normal;">${requestScope.belongDepartName}</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=2 height=60 class=xl11123099 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>序号</td>
  <td rowspan=2 class=xl11023099 style='border-top:none'>日期</td>
  <td rowspan=2 class=xl11123099 width=85 style='border-top:none;width:64pt'>区间</td>
  <td rowspan=2 class=xl11023099 style='border-top:none'>设备名称</td>
  <td rowspan=2 class=xl11023099 style='border-top:none'>编号</td>
  <td rowspan=2 class=xl11023099>故障现象</td>
  <td colspan=10 class=xl10523099 style='border-left:none'>原因分析及处理结果</td>
  <td rowspan=2 class=xl10523099>测试检修记录</td>
  <td rowspan=2 class=xl10523099>备注</td>
  <td rowspan=2 class=xl10523099>所属车间</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl11123099 width=37 style='height:30.0pt;border-top:none;
  border-left:none;width:28pt'>正向<br>
    盘</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>反向<br>
    盘</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>双工<br>
    器</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>电源</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>天线</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>漏缆</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>直放<br>
    站</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>区间<br>
    电台</td>
  <td class=xl11123099 width=69 style='border-top:none;border-left:none;
  width:52pt'>光（电）<br>
    缆</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
 </tr>
 <c:if test="${empty list}">
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl10223099 style='height:15.0pt;border-top:none'>1</td>
  <td class="xl10223099" style='border-top:none;border-left:none;white-space:normal;'></td>
  <td class="xl10223099" style='border-top:none;border-left:none;white-space:normal;'></td>
  <td class="xl10223099" style='border-top:none;border-left:none;white-space:normal;'></td>
  <td class="xl10223099" style='border-top:none;border-left:none;white-space:normal;'></td>
  <td class="xl10223099" style='border-top:none;border-left:none;white-space:normal;'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none;white-space:normal;'></td>
  <td class="xl10223099" style='border-top:none;border-left:none;white-space:normal;'></td>
  <td class="xl10223099" style='border-top:none;border-left:none;white-space:normal;'></td>
 </tr>
 </c:if>
 <c:forEach items="${list}" var="item" varStatus="s">
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl10223099 style='height:15.0pt;border-top:none'>${s.count }</td>
  <td class="xl10223099" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.date }</td>
  <td class="xl10223099" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.interregional }</td>
  <td class="xl10223099" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.equipmentName }</td>
  <td class="xl10223099" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.identifier }</td>
  <td class="xl10223099" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.faultPhenomenon }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.positiveplate }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.reversedisc }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.duplexer }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.power }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.aerial }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.leakycable }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.repeater }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.intervalstation }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.opticalpowercable }</td>
  <td class="xl10223099" style='border-top:none;border-left:none'>${item.testWell }</td>
  <td class="xl10223099" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.testFixNote }</td>
  <td class="xl10223099" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.remark }</td>
  <td class="xl10223099" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.belongOrgName }</td>
 </tr>
 </c:forEach>
 <tr height=40 style='height:30.0pt'>
  <td rowspan=2 height=60 class=xl11123099 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>合计</td>
  <td class=xl11023099 style='border-top:none;border-left:none'>　</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>　</td>
  <td class=xl11023099 style='border-top:none;border-left:none'>　</td>
  <td class=xl11023099 style='border-top:none;border-left:none'>　</td>
  <td class=xl11023099 style='border-top:none;border-left:none'>　</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>正向<br>
    盘</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>反向<br>
    盘</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>双工<br>
    器</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>电源</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>天线</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>漏缆</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>直放<br>
    站</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>区间<br>
    电台</td>
  <td class=xl11123099 width=69 style='border-top:none;border-left:none;
  width:52pt'>光（电）<br>
    缆</td>
  <td class=xl11123099 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>　</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>　</td>
  <td class=xl10523099 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl10223099 style='height:15.0pt;border-top:none;
  border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <c:if test="${empty sumResult}">
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  	<td class="xl10223099" style='border-top:none;border-left:none'>0</td>
  </c:if>
  <c:forEach items="${sumResult}" var="item" varStatus="s">
  <td class="xl10223099" style='border-top:none;border-left:none'>${item }</td>
  </c:forEach>
  <td class=xl10223099 style='border-top:none;border-left:none'>　</td>
  <td class=xl10223099 style='border-top:none;border-left:none'>　</td>
  <td class=xl10223099 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=19></td>
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
			url : contextPath + "wirelessDeviceSheetNineAction/getReportWorkshop.cn",
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
$("#searchBtn").click(function() {
	$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetNineAction/getSegmentByDto.cn");
	$("#showForm").submit();
});

//导出Excel
$("#exportBtn").click(function() {
	$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetNineAction/exportShowBycj.cn");
	$("#showForm").submit();
});
</script>
</body>
</html>