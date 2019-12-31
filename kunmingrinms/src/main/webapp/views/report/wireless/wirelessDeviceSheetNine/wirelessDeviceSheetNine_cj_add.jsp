<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%
	String contextPath = request.getContextPath();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	String fillDate = sdf.format(new Date()); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<title>区间设备故障统计分析表</title>
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
.editCell {
 	cursor : pointer;
 	background-color: #FEFECC;
 	white-space:normal;
}

.fillEditCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
 	white-space:normal;
}

.activeRow {
	background-color: #CAFBCE;
}

a{
	color : black;
	text-decoration: none
}

a:hover {
 	color: red;
 	text-decoration: none;
}
</style>
</head>
<body>
<div style="margin-bottom:40px;margin-top:1px;">
	<form id="addForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="saveBtn">保存</button>
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
  <td colspan=3 class=xl11723099>${sessionScope.user.organization.name}</td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
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
  <td rowspan=2 class=xl10523099>操作</td>
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
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl10223099 style='height:15.0pt;border-top:none'>1</td>
  <td class="xl10223099 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl10223099 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl10223099 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl10223099 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl10223099 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl10223099 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'>
  	<a class="addRow" href="#" onclick="add_line(1)" id="row1">增加</a>
  </td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td rowspan=2 height=60 class=xl11123099 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>合计</td>
  <td class=xl11023099 style='border-top:none;border-left:none'></td>
  <td class=xl10523099 style='border-top:none;border-left:none'></td>
  <td class=xl11023099 style='border-top:none;border-left:none'></td>
  <td class=xl11023099 style='border-top:none;border-left:none'></td>
  <td class=xl11023099 style='border-top:none;border-left:none'></td>
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
  <td class=xl10523099 style='border-top:none;border-left:none'></td>
  <td class=xl10523099 style='border-top:none;border-left:none'></td>
  <td class=xl10523099 style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl10223099 style='height:15.0pt;border-top:none;
  border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class="xl10223099 positiveplate" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 reversedisc" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 duplexer" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 power" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 aerial" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 leakycable" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 repeater" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 intervalstation" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 opticalpowercable" style='border-top:none;border-left:none'></td>
  <td class="xl10223099 testWell" style='border-top:none;border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class=xl10223099 style='border-top:none;border-left:none'></td>
  <td class="xl10223099" style='border-top:none;border-left:none'>
<!--   	<a class="sumRow" href="#" id="sum">计算合计</a> -->
  </td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl11523099 style='height:15.0pt'>填报人：</td>
  <td colspan=2 class=xl10123099 style='border-top:none;' id="reporter">${sessionScope.user.name}</td>
  <td class=xl9823099></td>
  <td class=xl11223099>联系电话：</td>
  <td colspan=3 class="xl11823099 fillEditCell" id="phone"></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td class=xl9723099></td>
  <td colspan=2 class=xl11323099>填报日期：</td>
  <td class=xl10023099 id="userfillDate">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl9723099></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/report/reportValidate.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var fillDate = '<%=fillDate%>';
//增加行记录
function add_line(id){
	var trId = $('#row' + id).parent().parent();  
	$(trId).after('<tr height=20 style="height:15.0pt" class="trClass">' +
		'<td height=20 class=xl10223099 style="height:15.0pt;border-top:none">' + id + '</td>' +
		'<td class="xl10223099 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10223099 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10223099 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10223099 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10223099 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10223099 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10223099 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10223099" style="border-top:none;border-left:none">' +
		  	'<a class="addRow" href="#" onclick=add_line('+ id +') id=row' + id + '>增加</a>&nbsp;' +
			'<a class="delRow" href="#" onclick="remove_line(this)">删除</a></td>' +
 		'</tr>');
	initElementAttr();
	bindAllEvent();
	sort_line(); // 每次新增完之后进行排序操作
};
var length = 1;
//排序
function sort_line(){
	var classsContainer = $(".trClass");  //获取所有节点的dom数组  
	length = classsContainer.length;  //数组长度
	
	for(var i = 1; i <= length; i++){  
		var $container = $(classsContainer[i - 1]); //循环遍历每一个dom节点  
		// 获取序号节点
		var no = $container.children().get(0);
		// 修改序号
		$(no).html(i);
		// 获取tr下最后一个td内的第一个a标签
		var lastTD = $container.children().get(18);
		// 修改a标签的id值和add_line()参数值
		$($(lastTD).children('a').get(0)).attr("id","row" + i);
		$($(lastTD).children('a').get(0)).attr("onclick","add_line(" + i + ")");
	}  
}
var currentStep = 0;
//删除选择记录
function remove_line(index) {
	if(index != null) {
		currentStep = $(index).parent().parent().find("td:first-child").html();
	}
	$("#table tr").each(function() {
		var seq = parseInt($(this).children("td").html());
		if(length != 1){
			if(seq == currentStep) {
				$(this).remove();
			}
		}
	});
	initElementAttr();
	bindAllEvent();
	sort_line();// 每次删除完之后进行排序操作
}

$(document).ready(function(){
	initElementAttr();
	bindAllEvent();
});
// 初始化.editCell的属性允许编辑
function initElementAttr() {
	$(".editCell").attr("contenteditable", "true");
	$(".fillEditCell").attr("contenteditable", "true");
}
//绑定事件
function bindAllEvent() {
	$(".editCell").mouseover(highlightRow);
}
// 高亮行
function highlightRow() {
	$(".editCell").removeClass("activeRow");
	$(this).addClass("activeRow");
	$(this).siblings(".editCell").addClass("activeRow");
}

//点击保存按钮
$('#saveBtn').on('click',function(){
	// 1.首先进行数据的校验
	if(!checkNumberIsOneOrZero("tr", ".numberCell")){
		alert("数据输入错误，请输入0或者1！");
		return ;
	}
	// 长度校验
	if(!checkDataLength($(".editCell"))){
		alert("数据输入过长，最多250个字符！");
		return ;
	}
	else{
		// 2.然后计算总和
		getSumData();
		// 3.最后进行数据保存
		saveData();
	}
});

$('#sum').on('click',function(){
	getSumData();
});
// 2.计算总和
function getSumData(){
	var positiveplate = 0;
	var reversedisc = 0;
	var duplexer = 0;
	var power = 0;
	var aerial = 0;
	var leakycable = 0;
	var repeater = 0;
	var intervalstation = 0;
	var opticalpowercable = 0;
	var testWell = 0;
	$("tr").each(function(j) {
		var rowArray = $(this).children(".editCell");
		if(rowArray && rowArray.length != 0) {
			positiveplate = parseInt(valueOfNum($(rowArray[5]).text())) + parseInt(positiveplate);
			reversedisc = parseInt(valueOfNum($(rowArray[6]).text())) + parseInt(reversedisc);
			duplexer = parseInt(valueOfNum($(rowArray[7]).text())) + parseInt(duplexer);
			power = parseInt(valueOfNum($(rowArray[8]).text())) + parseInt(power);
			aerial = parseInt(valueOfNum($(rowArray[9]).text())) + parseInt(aerial);
			leakycable = parseInt(valueOfNum($(rowArray[10]).text())) + parseInt(leakycable);
			repeater = parseInt(valueOfNum($(rowArray[11]).text())) + parseInt(repeater);
			intervalstation = parseInt(valueOfNum($(rowArray[12]).text())) + parseInt(intervalstation);
			opticalpowercable = parseInt(valueOfNum($(rowArray[13]).text())) + parseInt(opticalpowercable);
			testWell = parseInt(valueOfNum($(rowArray[14]).text())) + parseInt(testWell);
		}
	});
	$('.positiveplate').html(positiveplate);
	$('.reversedisc').html(reversedisc);
	$('.duplexer').html(duplexer);
	$('.power').html(power);
	$('.aerial').html(aerial);
	$('.leakycable').html(leakycable);
	$('.repeater').html(repeater);
	$('.intervalstation').html(intervalstation);
	$('.opticalpowercable').html(opticalpowercable);
	$('.testWell').html(testWell);
};
// 若为空,则转换为0
function valueOfNum(num){
	if(num == "" || num == null){
		return 0;
	}else{
		return num;
	}
}

// 3.保存数据
function saveData(){
	
	var wirelessDeviceSheetNine = getSaveData();
	
	$.post(contextPath + 'wirelessDeviceSheetNineAction/add.cn',
			{
				year : $('#addForm #year').val(),
				month : $('#addForm #month').val(),
				wirelessDeviceSheetNine :  JSON.stringify(wirelessDeviceSheetNine)
			},function(data,status){
				if(status){
					alert("保存成功!");
				}else{
					alert("保存失败!");
				}
			});
};

//获取保存数据
function getSaveData() {
	
	var wirelessDeviceSheetNine = [];
	
	// 填报人
	var reporter = $("#reporter").text();
	// 联系电话
	var phone = $("#phone").text();
	// 填报日期
	var userfillDate = $("#userfillDate").html();
	// 填报单位
	var belongDepart = "${sessionScope.user.organization.id}";
	// 填报单位名
	var belongOrgName = "${sessionScope.user.organization.name}";
	
	$("tr").each(function(j) {

		var rowArray = $(this).children(".editCell");
		if(rowArray && rowArray.length != 0) {
			var seq = j - 5;// 表头5行
			var obj = new Object();
			
			obj.date = $(rowArray[0]).text();
			obj.interregional = $(rowArray[1]).text();
			obj.equipmentName = $(rowArray[2]).text();
			obj.identifier = $(rowArray[3]).text();
			obj.faultPhenomenon = $(rowArray[4]).text();
			
			obj.positiveplate = $(rowArray[5]).text();
			obj.reversedisc = $(rowArray[6]).text();
			obj.duplexer = $(rowArray[7]).text();
			obj.power = $(rowArray[8]).text();
			obj.aerial = $(rowArray[9]).text();
			obj.leakycable = $(rowArray[10]).text();
			obj.repeater = $(rowArray[11]).text();
			obj.intervalstation = $(rowArray[12]).text();
			obj.opticalpowercable = $(rowArray[13]).text();
			obj.testWell = $(rowArray[14]).text();
			
			obj.testFixNote = $(rowArray[15]).text();
			obj.remark = $(rowArray[16]).text();
			
			obj.orgId = belongDepart;
			obj.userId = reporter;
			obj.phone = phone;
			obj.userfillDate = userfillDate + fillDate.substring(10);
			obj.belongOrgName = belongOrgName;
			obj.seq = seq + 1;
			
			wirelessDeviceSheetNine[seq] = obj;
		}
	});
	
	return wirelessDeviceSheetNine;
}

</script>
</body>
</html>