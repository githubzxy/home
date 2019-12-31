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
<title>无线机车故障统计分析表</title>
<style id="普铁无线报表报表模板_8944_Styles">
<!--table
.xl978944
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
.xl988944
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
.xl998944
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
.xl1008944
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
.xl1018944
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
.xl1028944
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
.xl1038944
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
.xl1048944
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
.xl1058944
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
.xl1068944
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
.xl1078944
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
.xl1088944
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
.xl1098944
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
.xl1108944
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
.xl1118944
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
<div id="普铁无线报表报表模板_8944" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=1500 class=xl978944
 style='border-collapse:collapse;table-layout:fixed;width:1000px' id="table">
 <col class=xl978944 width=49 style='width:37pt'>
 <col class=xl988944 width=49 style='width:37pt'>
 <col class=xl978944 width=49 style='width:37pt'>
 <col class=xl988944 width=49 span=2 style='width:37pt'>
 <col class=xl988944 width=138 style='width:104pt'>
 <col class=xl978944 width=37 span=7 style='width:28pt'>
 <col class=xl978944 width=180 style='width:135pt'>
 <col class=xl998944 width=101 style='mso-width-alt:3232;width:76pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl978944 width=49 style='height:15.0pt;width:37pt'></td>
  <td class=xl988944 width=49 style='width:37pt'></td>
  <td class=xl978944 width=49 style='width:37pt'></td>
  <td class=xl988944 width=49 style='width:37pt'></td>
  <td class=xl988944 width=49 style='width:37pt'></td>
  <td class=xl988944 width=138 style='width:104pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=180 style='width:135pt'></td>
  <td class=xl978944 width=101 style='width:76pt'></td>
 </tr>
 <tr height=30 style='height:22.5pt'>
  <td colspan=15 height=30 class=xl1108944 style='height:22.5pt'>机车故障统计分析</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl1078944 style='height:15.0pt'>填报单位：</td>
  <td colspan=3 class=xl1088944>${belongOrgName}</td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=2 height=60 class=xl1028944 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>序号</td>
  <td rowspan=2 class=xl1008944 style='border-top:none'>日期</td>
  <td rowspan=2 class=xl1028944 width=49 style='border-top:none;width:37pt'>机车<br>
    型号</td>
  <td rowspan=2 class=xl1008944 style='border-top:none'>机车号</td>
  <td rowspan=2 class=xl1008944 style='border-top:none'>类型</td>
  <td rowspan=2 class=xl1008944>司机报故障现象</td>
  <td colspan=7 class=xl1018944 style='border-left:none'>原因分析及处理结果</td>
  <td rowspan=2 class=xl1018944>测试检修记录</td>
  <td rowspan=2 class=xl1018944>备注</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl1028944 width=37 style='height:30.0pt;border-top:none;
  border-left:none;width:28pt'>电台<br>
    主机</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    盒</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>话筒</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>喇叭</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>天线</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
 </tr>
 <c:if test="${empty list}">
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl1018944 style='height:15.0pt;border-top:none'>1</td>
  <td class="xl1008944"  style='border-top:none;border-left:none;'></td>
  <td class="xl1008944"  style='border-top:none;border-left:none;'></td>
  <td class="xl1008944"  style='border-top:none;border-left:none;'></td>
  <td class="xl1008944"  style='border-top:none;border-left:none;'></td>
  <td class="xl1008944"  style='border-top:none;border-left:none;'></td>
  <td class="xl1018944"  style='border-top:none;border-left:none'></td>
  <td class="xl1018944"  style='border-top:none;border-left:none'></td>
  <td class="xl1018944"  style='border-top:none;border-left:none'></td>
  <td class="xl1018944"  style='border-top:none;border-left:none'></td>
  <td class="xl1018944"  style='border-top:none;border-left:none'></td>
  <td class="xl1018944"  style='border-top:none;border-left:none'></td>
  <td class="xl1018944"  style='border-top:none;border-left:none'></td>
  <td class="xl1008944"  style='border-top:none;border-left:none;'></td>
  <td class="xl1008944"  style='border-top:none;border-left:none;'></td>
 </tr>
 </c:if>
 <c:forEach items="${list}" var="item" varStatus="s">
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl1018944 style='height:15.0pt;border-top:none'>${s.count }</td>
  <td class="xl1008944"  style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.date }</td>
  <td class="xl1008944"  style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.engineType }</td>
  <td class="xl1008944"  style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.engineNum }</td>
  <td class="xl1008944"  style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.type }</td>
  <td class="xl1008944"  style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.faultPhenomenon }</td>
  <td class="xl1018944"  style='border-top:none;border-left:none'>${item.radioHost }</td>
  <td class="xl1018944"  style='border-top:none;border-left:none'>${item.controlBox }</td>
  <td class="xl1018944"  style='border-top:none;border-left:none'>${item.mike }</td>
  <td class="xl1018944"  style='border-top:none;border-left:none'>${item.speaker }</td>
  <td class="xl1018944"  style='border-top:none;border-left:none'>${item.aerial }</td>
  <td class="xl1018944"  style='border-top:none;border-left:none'>${item.controlCable }</td>
  <td class="xl1018944"  style='border-top:none;border-left:none'>${item.testWell }</td>
  <td class="xl1008944"  style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.testFixNote }</td>
  <td class="xl1008944"  style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.remark }</td>
 </tr>
 </c:forEach>
 <tr height=40 style='height:30.0pt'>
  <td rowspan=2 height=60 class=xl1028944 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>合计</td>
  <td class=xl1008944 style='border-top:none;border-left:none'></td>
  <td class=xl1018944 style='border-top:none;border-left:none'></td>
  <td class=xl1008944 style='border-top:none;border-left:none'></td>
  <td class=xl1008944 style='border-top:none;border-left:none'></td>
  <td class=xl1008944 style='border-top:none;border-left:none'></td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>电台<br>
    主机</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    盒</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>话筒</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>喇叭</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>天线</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
  <td class=xl1018944 style='border-top:none;border-left:none'></td>
  <td class=xl1018944 style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=20 style='height:15.0pt' id="total">
  <td height=20 class="xl1018944" style='height:15.0pt;border-top:none;
  border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <c:forEach items="${sumResult}" var="item" varStatus="s">
  	<td class="xl1018944" style='border-top:none;border-left:none'>${item }</td>
  </c:forEach>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl1058944 style='height:15.0pt'>填报人：</td>
  <td colspan=2 class="xl1068944 fillEditCell" id="reporter" style='white-space: normal;'>${requestScope.list[0].userId }</td>
  <td class=xl988944></td>
  <td class=xl1038944>联系电话：</td>
  <td colspan=3 class="xl1068944 fillEditCell" id="phone">${requestScope.list[0].phone }</td>
  <td class=xl978944></td>
  <td colspan=3 class=xl1098944>填报日期：</td>
  <td class=xl1048944 id="userfillDate">${requestScope.list[0].userfillDateShow }</td>
  <td class=xl978944></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
//导出Excel
$("#exportBtn").click(function() {
	$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetSevenAction/exportShow.cn");
	$("#showForm").submit();
});
</script>
</body>
</html>