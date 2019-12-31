<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
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
<title>车间CIR故障统计分析</title>
<style id="普铁无线报表报表模板_25841_Styles">
<!--table
.xl9725841
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
.xl9825841
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
.xl9925841
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
.xl10025841
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
.xl10125841
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
.xl10225841
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
.xl10325841
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
.xl10425841
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
.xl10525841
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
.xl10625841
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
.xl10725841
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
.xl10825841
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
.xl10925841
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
.xl11025841
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
.xl11125841
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
.xl11225841
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
<div id="showDiv">
	<form id="showForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="exportBtn" >导出Excel</button>
</div>
<div id="普铁无线报表报表模板_25841" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=1150 class=xl9725841
 style='border-collapse:collapse;table-layout:fixed;' id="table">
 <col class=xl9725841 width=49 style='width:37pt'>
 <col class=xl9825841 width=49 style='width:37pt'>
 <col class=xl9725841 width=49 style='width:37pt'>
 <col class=xl9825841 width=49 span=2 style='width:37pt'>
 <col class=xl9825841 width=138 style='width:104pt'>
 <col class=xl9725841 width=37 span=11 style='width:28pt'>
 <col class=xl9725841 width=180 style='width:135pt'>
 <col class=xl9925841 width=101 style='width:76pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl9725841 width=49 style='height:15.0pt;width:37pt'></td>
  <td class=xl9825841 width=49 style='width:37pt'></td>
  <td class=xl9725841 width=49 style='width:37pt'></td>
  <td class=xl9825841 width=49 style='width:37pt'></td>
  <td class=xl9825841 width=49 style='width:37pt'></td>
  <td class=xl9825841 width=138 style='width:104pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=180 style='width:135pt'></td>
  <td class=xl9725841 width=101 style='width:76pt'></td>
 </tr>
 <tr height=29 style='height:21.95pt'>
  <td colspan=19 height=29 class=xl11025841 style='height:21.95pt'>CIR故障统计分析</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl11125841 style='height:15.0pt'>填报单位：</td>
  <td colspan=3 class=xl11225841>${belongOrgName}</td>
  <td class=xl10525841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=2 height=60 class=xl10425841 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>序号</td>
  <td rowspan=2 class=xl10125841 style='border-top:none'>日期</td>
  <td rowspan=2 class=xl10425841 width=49 style='border-top:none;width:37pt'>机车<br>
    型号</td>
  <td rowspan=2 class=xl10125841 style='border-top:none'>机车号</td>
  <td rowspan=2 class=xl10125841 style='border-top:none'>类型</td>
  <td rowspan=2 class=xl10125841>司机报故障现象</td>
  <td colspan=11 class=xl10025841 style='border-left:none'>原因分析及处理结果</td>
  <td rowspan=2 class=xl10025841>测试检修处理记录</td>
  <td rowspan=2 class=xl10025841>备注</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl10025841 style='height:30.0pt;border-top:none;
  border-left:none'>A架</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>B架</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>电台<br>
    主机</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>MMI</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>话筒</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>天线</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>喇叭</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>打印<br>
    机</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>其它</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
 </tr>
<c:if test="${empty list}">
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl10025841 style='height:15.0pt;border-top:none'>1</td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
  <td class="xl10225841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
  <td class="xl10325841" style='border-top:none;border-left:none'></td>
  <td class="xl10325841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10325841" style='border-top:none;border-left:none'></td>
  <td class="xl10325841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10225841" style='border-top:none;border-left:none'></td>
  <td class="xl10225841" style='border-top:none;border-left:none'></td>
 </tr>
</c:if>
<c:forEach items="${list}" var="item" varStatus="s"> 
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl10025841 style='height:15.0pt;border-top:none'>${s.count }</td>
  <td class="xl10125841" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.date }</td>
  <td class="xl10225841" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.engineType }</td>
  <td class="xl10125841" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.engineNum }</td>
  <td class="xl10125841" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.type }</td>
  <td class="xl10125841" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.faultPhenomenon }</td>
  <td class="xl10325841" style='border-top:none;border-left:none'>${item.ashelf }</td>
  <td class="xl10325841" style='border-top:none;border-left:none'>${item.bshelf }</td>
  <td class="xl10025841" style='border-top:none;border-left:none'>${item.radioHost }</td>
  <td class="xl10325841" style='border-top:none;border-left:none'>${item.multiMediaI }</td>
  <td class="xl10325841" style='border-top:none;border-left:none'>${item.mike }</td>
  <td class="xl10025841" style='border-top:none;border-left:none'>${item.controlCable }</td>
  <td class="xl10025841" style='border-top:none;border-left:none'>${item.aerial }</td>
  <td class="xl10025841" style='border-top:none;border-left:none'>${item.speaker }</td>
  <td class="xl10025841" style='border-top:none;border-left:none'>${item.printer }</td>
  <td class="xl10025841" style='border-top:none;border-left:none'>${item.other }</td>
  <td class="xl10025841" style='border-top:none;border-left:none'>${item.testWell }</td>
  <td class="xl10225841" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.testFixNote }</td>
  <td class="xl10225841" style='border-top:none;border-left:none;word-wrap:break-word;word-break:break-all;white-space:normal;'>${item.remark }</td>
 </tr>
</c:forEach>
 <tr height=40 style='height:30.0pt'>
  <td rowspan=2 height=60 class=xl10425841 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>合计</td>
  <td class=xl10125841 style='border-top:none;border-left:none'></td>
  <td class=xl10025841 style='border-top:none;border-left:none'></td>
  <td class=xl10125841 style='border-top:none;border-left:none'></td>
  <td class=xl10125841 style='border-top:none;border-left:none'></td>
  <td class=xl10125841 style='border-top:none;border-left:none'></td>
  <td class=xl10025841 style='border-top:none;border-left:none'>A架</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>B架</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>电台<br>
    主机</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>MMI</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>话筒</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>天线</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>喇叭</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>打印<br>
    机</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>其它</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
  <td class=xl10025841 style='border-top:none;border-left:none'></td>
  <td class=xl10025841 style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=20 style='height:15.0pt' id="total">
  <td height=20 class=xl10125841 style='height:15.0pt;border-top:none;
  border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
<c:forEach items="${sumResult}" var="item">
  <td class="xl10125841" style='border-top:none;border-left:none'>${item }</td>
</c:forEach>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl10725841 style='height:15.0pt'>填报人：</td>
  <td colspan=3 class="xl10825841" id="reporter">${userName }</td>
  <td class=xl10625841>联系电话：</td>
  <td colspan=3 class="xl10825841" id="phone">${requestScope.list[0].phone }</td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td colspan=3 class=xl10725841>填报日期：</td>
  <td colspan=2 class="xl10925841">${requestScope.list[0].userfillDateShow }</td>
  <td class=xl9725841></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

//导出Excel
$("#showDiv #exportBtn").click(function() {

	$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetSixAction/exportShow.cn");
	$("#showForm").submit();
});

</script>
</body>
</html>
