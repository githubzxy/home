<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<title>无线通信固定设备运用质量统计及分析报表_电通无报-1</title>
<style id="普铁无线报表报表模板_23788_Styles">
<!--table
.xl9623788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;}
.xl9723788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl9823788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl9923788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl10023788
	{padding:0px;
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
.xl10123788
	{padding:0px;
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
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10223788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;
	word-break:break-all;}
.xl10323788
	{padding:0px;
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
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10423788
	{padding:0px;
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
.xl10523788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl10623788
	{padding:0px;
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
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;
	word-break:break-all;}
.xl10723788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl10823788
	{padding:0px;
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
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl11023788
	{padding:0px;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl11223788
	{padding:0px;
	color:windowtext;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl11423788
	{padding:0px;
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
.xl11523788
	{padding:0px;
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
.xl11723788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl11823788
	{padding:0px;
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
.xl11923788
	{padding:0px;
	color:windowtext;
	font-size:11.0pt;
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
	white-space:normal;}
.xl12123788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl12423788
	{padding:0px;
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
.xl12523788
	{padding:0px;
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
.xl12623788
	{padding:0px;
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
.xl12723788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	white-space:nowrap;}
.xl12823788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;}
.xl13023788
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl1018706
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:left;
	vertical-align:top;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
-->
.hiddenContext{
    word-break:keep-all;/* 不换行 */
    white-space:nowrap;/* 不换行 */
    overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
}
</style>
</head>
<body>
<div style="margin-bottom:40px;margin-top:1px;">
	<form id="showForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}">
		<input type="hidden" id="month" name="month" value="${param.month}">
	</form>
	<button id="exportBtn">导出Excel</button>
</div>
<div id="普铁无线报表报表模板_23788" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=960 class=xl9623788
 style='border-collapse:collapse;table-layout:fixed;width:727pt'>
 <col class=xl9623788 width=45 span=3 style='width:34pt'>
 <col class=xl9623788 width=33 span=25 style='width:25pt'>
 <tr height=26 style='height:20.1pt'>
  <td colspan=3 height=26 class=xl9723788 width=135 style='height:20.1pt;
  width:102pt'>电通无报-1</td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
  <td class=xl9723788 width=33 style='width:25pt'></td>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td colspan=28 height=26 class=xl11223788 style='height:20.1pt'>无线通信固定设备运用质量统计及分析报表</td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td colspan=2 height=26 width=90 style='height:19.5pt;width:68pt' align=left
  valign=top><span style=';
  position:absolute;z-index:1;margin-left:0px;margin-top:25px;width:138px;
  height:133px'><img width=138 height=133
  src="/kunmingrinms/views/report/wireless/wirelessDeviceSheetOne/wirelessDeviceSheetOne.files/image001.png"></span><span
  style=''>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=26 class=xl12723788 width=90 style='height:19.5pt;
    width:68pt'>单位：</td>
   </tr>
  </table>
  </span></td>
  <td colspan=5 class=xl12823788 style='border-bottom:1.0pt solid black;white-space:normal;' id="belongOrgName">${requestScope.list1[0][28]}</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td class=xl9923788>　</td>
  <td colspan=8 class=xl9723788></td>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td rowspan=2 height=52 class=xl10823788 style='height:40.2pt'>　</td>
  <td colspan=2 rowspan=2 class=xl11923788 width=90 style='border-right:1.0pt solid black;
  width:68pt'>　</td>
  <td rowspan=5 class=xl12123788 width=33 style='border-bottom:1.0pt solid black;
  border-top:none;width:25pt'>总<br>
    件<br>
    数</td>
  <td colspan=8 class=xl10223788 style='border-left:none'>车站电台</td>
  <td colspan=2 class=xl10223788 style='border-left:none'>车站设备</td>
  <td colspan=6 class=xl10223788 style='border-left:none'>区间设备</td>
  <td colspan=8 class=xl10223788 style='border-left:none'>原因分析</td>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td rowspan=4 height=104 class=xl11523788 width=33 style='height:80.4pt;
  border-top:none;width:25pt'>车站主机</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>控制盒<span
  style=''> </span></td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>送受话器</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>控制电缆</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>天馈线</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>电源</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>其他</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>小计</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>接收解码器</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>车站转接器</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>中继器</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>光纤直放站</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>区间电台</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>天馈线</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>漏泄缆</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>小计</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>违章人为</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>维修不良</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>供电电源</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>用户损坏</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>材质不良</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>外界妨碍</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>其它</td>
  <td rowspan=4 class=xl11523788 width=33 style='border-top:none;width:25pt'>小计</td>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td height=26 class=xl10123788 style='height:20.1pt'>　</td>
  <td class=xl9723788></td>
  <td class=xl9823788>　</td>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td colspan=2 rowspan=2 height=52 class=xl10123788 style='border-bottom:1.0pt solid black;
  height:40.2pt'>　</td>
  <td rowspan=2 class=xl9823788 style='border-bottom:1.0pt solid black'>　</td>
 </tr>
 <tr height=26 style='height:20.1pt'>
 </tr>
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one1">天津712厂</td>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one2">上海通信工厂</td>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one3">北京希电公司</td>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one4">深圳长龙公司</td>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one5">杭州创联公司</td>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one6">深圳思科泰公司</td>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one7">泉州电子设备公司</td>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one8">兰新厂</td>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one9">奥地利伊林公司</td>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one10">日本信和公司</td>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one11">日本古野公司</td>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one12">南京泰通</td>
  <c:forEach items="${requestScope.list1[11]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one13">武汉虹信</td>
  <c:forEach items="${requestScope.list1[12]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one14">京信</td>
  <c:forEach items="${requestScope.list1[13]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one15">三维</td>
  <c:forEach items="${requestScope.list1[14]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one16">COMLAB</td>
  <c:forEach items="${requestScope.list1[15]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one17">安德鲁</td>
  <c:forEach items="${requestScope.list1[16]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one18">深圳赛格</td>
  <c:forEach items="${requestScope.list1[17]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td id="one19" colspan=3 class=xl13023788 height=26 width=135 style='height:20.1pt;width:102pt'>合计</td>
  <c:forEach items="${requestScope.list1[18]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td colspan=3 rowspan=3 height=52 class=xl10823788 style='height:40.2pt;border-right:1.0pt solid black;'>
  	<img width=136 height=80 src="/kunmingrinms/views/report/wireless/wirelessDeviceSheetOne/wirelessDeviceSheetOne.files/image002.png">
  </td>
  <td colspan=6 class=xl10723788>车站电台运用良好率</td>
  <td colspan=6 class=xl10223788 style='border-left:none'>障碍及故障统计</td>
  <td colspan=13 rowspan=3 class=xl11523788 width=429 style='width:325pt'>备注</td>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td colspan=2 rowspan=2 height=52 class=xl11723788 width=66 style='height:
  40.2pt;width:50pt'>总运用<br>
    台时</td>
  <td colspan=2 rowspan=2 class=xl11523788 width=66 style='width:50pt'>故障<br>
    台时</td>
  <td colspan=2 rowspan=2 class=xl11523788 width=66 style='width:50pt'>运用<br>
    良好率（%）</td>
  <td colspan=2 rowspan=2 class=xl11523788 width=66 style='width:50pt'>一类障碍件数</td>
  <td colspan=2 rowspan=2 class=xl11523788 width=66 style='width:50pt'>二类障碍件数</td>
  <td colspan=2 rowspan=2 class=xl11523788 width=66 style='width:50pt'>故障<br>
    件数</td>
 </tr>
 <tr height=26 style='height:20.1pt'>
 </tr>
 <tr  class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two1">天津712厂</td>
  <c:forEach items="${requestScope.list2[0]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10223788 Cell" style='border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[0]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10223788 Cell" style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <td colspan=13 rowspan=19 class=xl1018706 id="remark" style='border-right:1.0pt solid black; border-bottom:1.0pt solid black;'>
  	<textarea style="border:none;width:99%;height:99.6%;resize:none;" readonly="readonly">${requestScope.list2[0][6]}</textarea>
  </td>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two2">上海通信工厂</td>
  <c:forEach items="${requestScope.list2[1]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[1]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two3">北京希电公司</td>
  <c:forEach items="${requestScope.list2[2]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[2]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two4">深圳长龙公司</td>
  <c:forEach items="${requestScope.list2[3]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[3]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two5">杭州创联公司</td>
  <c:forEach items="${requestScope.list2[4]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[4]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two6">深圳思科泰公司</td>
 <c:forEach items="${requestScope.list2[5]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[5]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two7">泉州电子设备公司</td>
  <c:forEach items="${requestScope.list2[6]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[6]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two8">兰新厂</td>
  <c:forEach items="${requestScope.list2[7]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[7]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two9">奥地利伊林公司</td>
  <c:forEach items="${requestScope.list2[8]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[8]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two10">日本信和公司</td>
  <c:forEach items="${requestScope.list2[9]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[9]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two11">日本古野公司</td>
  <c:forEach items="${requestScope.list2[10]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[10]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two12">南京泰通</td>
  <c:forEach items="${requestScope.list2[11]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[11]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two13">武汉虹信</td>
  <c:forEach items="${requestScope.list2[12]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[12]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two14">京信</td>
  <c:forEach items="${requestScope.list2[13]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[13]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two15">三维</td>
  <c:forEach items="${requestScope.list2[14]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[14]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two16">COMLAB</td>
  <c:forEach items="${requestScope.list2[15]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[15]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two17">安德鲁</td>
  <c:forEach items="${requestScope.list2[16]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[16]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two18">深圳赛格</td>
  <c:forEach items="${requestScope.list2[17]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[17]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 Cell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl10223788 style='height:20.1pt' id="two19">合计</td>
  <c:forEach items="${requestScope.list2[18]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10223788 Cell" style='border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[18]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10223788 Cell" style='border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
<!-- -----------------------------------正文结束--------------------------------------------- --> 
<!-- -----------------------------------底部开始--------------------------------------------- -->
 <tr height=26 style='height:20.1pt'>
  <td colspan=3 height=26 class=xl12523788 style='height:20.1pt'>单位负责人：</td>
  <td colspan=2 class="xl12423788" id="personliable" style="white-space:normal;">${requestScope.list1[0][29]}</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td colspan=2 class=xl12523788>填报人：</td>
  <td colspan=3 class="xl12423788" id="reporter" style="white-space:normal;">${requestScope.list1[0][30]}</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td colspan=3 class=xl12523788>联系电话：</td>
  <td colspan=3 class="xl12423788" id="phone" style="white-space:normal;">${requestScope.list1[0][31]}</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td colspan=3 class=xl12523788>填报时间：</td>
  <td colspan=3 class="xl12623788" id="userfillDate" style="white-space:normal;">${requestScope.list1[0][32]}</td>
 </tr>
<!-- -----------------------------------底部结束--------------------------------------------- -->
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

var contextPath = '<%=contextPath%>' + '/';

	$(document).ready(function(){
// 		$(".Cell").addClass("hiddenContext");
	});
	//导出Excel
	$("#exportBtn").click(function() {
		$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetOneAction/exportShow.cn");
		$("#showForm").submit();
	});
</script>
</body>
</html>