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
<title>车站设备故障统计分析表</title>
<style id="普铁无线报表报表模板_9609_Styles">
<!--table
.xl979609
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
.xl989609
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
.xl999609
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
.xl1009609
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
.xl1019609
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
.xl1029609
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
.xl1039609
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
.xl1049609
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
.xl1059609
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
.xl1069609
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
.xl1079609
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
	white-space:nowrap;}
.xl1089609
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
	white-space:nowrap;}
.xl1099609
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
.xl1109609
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
.xl1119609
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
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl1129609
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
.xl1139609
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
.xl1149609
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
-->
</style>
</head>
<body>
<div style="margin-bottom:40px;margin-top:1px;">
	<form id="showForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="exportBtn" >导出Excel</button>
</div>
<div id="普铁无线报表报表模板_9609" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=1500 class=xl979609
 style='border-collapse:collapse;table-layout:fixed;width:1200px' id="table">
 <col class=xl979609 width=49 style='width:37pt'>
 <col class=xl989609 width=85 style='width:64pt'>
 <col class=xl979609 width=85 style='width:64pt'>
 <col class=xl989609 width=85 span=2 style='width:64pt'>
 <col class=xl989609 width=138 style='width:104pt'>
 <col class=xl979609 width=37 span=8 style='width:28pt'>
 <col class=xl979609 width=198 style='width:149pt'>
 <col class=xl999609 width=101 style='width:76pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl979609 width=49 style='height:15.0pt;width:37pt'></td>
  <td class=xl989609 width=85 style='width:64pt'></td>
  <td class=xl979609 width=85 style='width:64pt'></td>
  <td class=xl989609 width=85 style='width:64pt'></td>
  <td class=xl989609 width=85 style='width:64pt'></td>
  <td class=xl989609 width=138 style='width:104pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=198 style='width:149pt'></td>
  <td class=xl979609 width=101 style='width:76pt'></td>
 </tr>
 <tr height=30 style='height:22.5pt'>
  <td colspan=16 height=30 class=xl1099609 style='height:22.5pt'><span
  style=''> </span>车站设备故障统计分析</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl1139609 style='height:15.0pt'>填报单位：</td>
  <td colspan=3 class=xl1149609>${belongOrgName}</td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=2 height=60 class=xl1009609 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>序号</td>
  <td rowspan=2 class=xl1019609 style='border-top:none'>日期</td>
  <td rowspan=2 class=xl1009609 width=85 style='border-top:none;width:64pt'>车站</td>
  <td rowspan=2 class=xl1129609 width=85 style='border-top:none;width:64pt'>设备名称</td>
  <td rowspan=2 class=xl1019609 style='border-top:none'>编号</td>
  <td rowspan=2 class=xl1019609>故障现象</td>
  <td colspan=8 class=xl1029609 style='border-left:none'>原因分析及处理结果</td>
  <td rowspan=2 class=xl1029609>测试检修记录</td>
  <td rowspan=2 class=xl1029609>备注</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl1029609 style='height:30.0pt;border-top:none;
  border-left:none'>主机</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    盒</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl1029609 style='border-top:none;border-left:none'>天线</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>转接<br>
    器</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>解码<br>
    器</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>录音<br>
    设备</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
 </tr>
 <c:if test="${empty list}">
 <tr height=20 style='height:15.0pt' class="trClass">
 	<td height=20 class=xl1029609 style='height:15.0pt;border-top:none'>1</td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 	<td class="xl1029609" style='border-top:none;border-left:none;'></td>
 </tr>
 </c:if>
 <c:forEach items="${list}" var="item" varStatus="s">
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl1029609 style='height:15.0pt;border-top:none'>${s.count }</td>
  <td class="xl1029609" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.date }</td>
  <td class="xl1029609" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.station }</td>
  <td class="xl1029609" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.equipmentName }</td>
  <td class="xl1029609" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.identifier }</td>
  <td class="xl1029609" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.faultPhenomenon }</td>
  <td class="xl1029609" style='border-top:none;border-left:none'>${item.radioHost }</td>
  <td class="xl1029609" style='border-top:none;border-left:none'>${item.controlBox }</td>
  <td class="xl1029609" style='border-top:none;border-left:none'>${item.controlCable }</td>
  <td class="xl1029609" style='border-top:none;border-left:none'>${item.aerial }</td>
  <td class="xl1029609" style='border-top:none;border-left:none'>${item.adaptor }</td>
  <td class="xl1029609" style='border-top:none;border-left:none'>${item.decoder }</td>
  <td class="xl1029609" style='border-top:none;border-left:none'>${item.record }</td>
  <td class="xl1029609" style='border-top:none;border-left:none'>${item.testWell }</td>
  <td class="xl1029609" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.testFixNote }</td>
  <td class="xl1029609" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.remark }</td>
 </tr>
 </c:forEach>
 <tr height=40 style='height:30.0pt'>
  <td rowspan=2 height=60 class=xl1009609 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>合计</td>
  <td class=xl1019609 style='border-top:none;border-left:none'>　</td>
  <td class=xl1029609 style='border-top:none;border-left:none'>　</td>
  <td class=xl1019609 style='border-top:none;border-left:none'>　</td>
  <td class=xl1019609 style='border-top:none;border-left:none'>　</td>
  <td class=xl1019609 style='border-top:none;border-left:none'>　</td>
  <td class=xl1029609 style='border-top:none;border-left:none'>主机</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    盒</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl1029609 style='border-top:none;border-left:none'>天线</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>转接<br>
    器</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>解码<br>
    器</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>录音<br>
    设备</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
  <td class=xl1029609 style='border-top:none;border-left:none'>　</td>
  <td class=xl1029609 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=20 style='height:15.0pt' id="total">
  <td height=20 class=xl1029609 style='height:15.0pt;border-top:none;
  border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <c:forEach items="${sumResult}" var="item" varStatus="s">
  	<td class="xl1029609" style='border-top:none;border-left:none'>${item }</td>
  </c:forEach>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=2 height=19 class=xl1109609 style='height:14.25pt'>填报人：</td>
  <td colspan=2 class="xl1049609 fillEditCell" style='border-top:none;white-space: normal;' id="reporter">${requestScope.list[0].userId }</td>
  <td class=xl1069609></td>
  <td class=xl1079609>联系电话：</td>
  <td colspan=3 class="xl1119609 fillEditCell" id="phone">${requestScope.list[0].phone }</td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td colspan=3 class=xl1109609>填报日期：</td>
  <td class=xl1089609 id="userfillDate">${requestScope.list[0].userfillDateShow }</td>
  <td class=xl1039609></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
//导出Excel
$("#exportBtn").click(function() {
	$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetEightAction/exportShow.cn");
	$("#showForm").submit();
});
</script>
</body>
</html>