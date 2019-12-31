<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
-->
.notEditCell{
	background-color: #FEFECC;
}
.editCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
}
.sumCell{
	background-color: #FEFEEE;
}
.remarkCell{
	background-color: #FEFECC;
}
.fillEditCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
}
.activeRow {
	background-color: #CAFBCE;
}
.hiddenContext{
    word-break:keep-all;/* 不换行 */
    white-space:nowrap;/* 不换行 */
    overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
}
</style>
</head>
<body>
<div style="margin-bottom:40px;margin-top:1px;">
	<form id="updateForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}">
		<input type="hidden" id="month" name="month" value="${param.month}">
	</form>
	<button id="saveBtn">保存</button>
	<button id="exportBtn">导出Excel</button>
	<button id="sumBtn">计算与合计</button>
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
 <tr height=26 style='height:20.1pt'>
  <td colspan=2 height=26 class=xl12723788 width=90 style='height:20.1pt;
  width:68pt'>单位：</td>
  <td colspan=8 class=xl12823788 style='border-bottom:1.0pt solid black;white-space:normal;' id="belongOrgName">${requestScope.list1[0][28]}</td>
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
  <td colspan=3 rowspan=5 height=26 width=138 style='height:20.1pt;width:68pt;border:1.0pt solid black;' align=left
  valign=top><span style=';
  position:absolute;z-index:1;margin-left:0px;margin-top:1px;width:138px;
  height:133px'><img width=138 height=133
  src="/kunmingrinms/views/report/wireless/wirelessDeviceSheetOne/wirelessDeviceSheetOne.files/image001.png"></span><span
  style=''>
  <table cellpadding=0 cellspacing=0>
  </table>
  </span></td>
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
 </tr>
 <tr height=26 style='height:20.1pt'>
 </tr>
 <tr height=26 style='height:20.1pt'>
 </tr>
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one1">天津712厂</td>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[0]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one2">上海通信工厂</td>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[1]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one3">北京希电公司</td>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[2]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one4">深圳长龙公司</td>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[3]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one5">杭州创联公司</td>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[4]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one6">深圳思科泰公司</td>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[5]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one7">泉州电子设备公司</td>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[6]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one8">兰新厂</td>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[7]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one9">奥地利伊林公司</td>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[8]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one10">日本信和公司</td>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[9]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="one11">日本古野公司</td>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[10]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one12">南京泰通</td>
  <c:forEach items="${requestScope.list1[11]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[11]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[11]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[11]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[11]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[11]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[11]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[11]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one13">武汉虹信</td>
  <c:forEach items="${requestScope.list1[12]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[12]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[12]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[12]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[12]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[12]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[12]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[12]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one14">京信</td>
  <c:forEach items="${requestScope.list1[13]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[13]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[13]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[13]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[13]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[13]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[13]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[13]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one15">三维</td>
  <c:forEach items="${requestScope.list1[14]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[14]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[14]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[14]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[14]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[14]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[14]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[14]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one16">COMLAB</td>
  <c:forEach items="${requestScope.list1[15]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[15]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[15]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[15]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[15]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[15]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[15]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[15]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one17">安德鲁</td>
  <c:forEach items="${requestScope.list1[16]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[16]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[16]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[16]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[16]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[16]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[16]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[16]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="one18">深圳赛格</td>
  <c:forEach items="${requestScope.list1[17]}" varStatus="i" var="item" begin="0" end="0">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[17]}" varStatus="i" var="item" begin="1" end="7">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[17]}" varStatus="i" var="item" begin="8" end="8">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[17]}" varStatus="i" var="item" begin="9" end="15">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[17]}" varStatus="i" var="item" begin="16" end="16">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[17]}" varStatus="i" var="item" begin="17" end="23">
  	<td class="xl10223788 editCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list1[17]}" varStatus="i" var="item" begin="24" end="24">
  	<td class="xl10223788 sumCell cell data" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[17]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 editCell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetOne">
  <td id="one19" colspan=3 class=xl13023788 height=26 width=135 style='height:20.1pt;width:102pt'>合计</td>
  <c:forEach items="${requestScope.list1[18]}" varStatus="i" var="item" begin="0" end="24">
  	<td class="xl10223788 sumCell data" style='border-top:none;border-left:none' id="line${i.count}">${item}</td>
  </c:forEach>
  <c:if test="${empty list1[18]}">
  	<c:forEach var="item" begin="0" end="24">
  		<td class="xl10223788 sumCell" style='border-top:none;border-left:none'></td>
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
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two1">天津712厂</td>
  <c:forEach items="${requestScope.list2[0]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10223788 editCell cell data" style='border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[0]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10223788 sumCell cell data" style='border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[0]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10223788 editCell cell data" style='border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[0]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10223788 sumCell cell data" style='border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[0]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10223788 editCell" style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <td colspan=13 rowspan=19 class=xl10823788 style='border-right:1.0pt solid black; border-bottom:1.0pt solid black'>
  	<textarea id="remark" class="remarkCell" style="width:98.5%;height:100%;resize:none;margin-left:0px;margin-bottom:-4px;" maxlength="250" placeholder="请输入，字数限250个"/>${requestScope.list2[0][6]}</textarea>
  </td>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two2">上海通信工厂</td>
  <c:forEach items="${requestScope.list2[1]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[1]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[1]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[1]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[1]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two3">北京希电公司</td>
  <c:forEach items="${requestScope.list2[2]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[2]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[2]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[2]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[2]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two4">深圳长龙公司</td>
  <c:forEach items="${requestScope.list2[3]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[3]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[3]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[3]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[3]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two5">杭州创联公司</td>
  <c:forEach items="${requestScope.list2[4]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[4]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[4]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[4]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[4]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two6">深圳思科泰公司</td>
  <c:forEach items="${requestScope.list2[5]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[5]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[5]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[5]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[5]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two7">泉州电子设备公司</td>
  <c:forEach items="${requestScope.list2[6]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[6]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[6]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[6]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[6]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two8">兰新厂</td>
  <c:forEach items="${requestScope.list2[7]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[7]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[7]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[7]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[7]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two9">奥地利伊林公司</td>
  <c:forEach items="${requestScope.list2[8]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[8]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[8]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[8]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[8]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two10">日本信和公司</td>
  <c:forEach items="${requestScope.list2[9]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[9]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[9]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[9]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[9]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11423788 style='height:20.1pt' id="two11">日本古野公司</td>
  <c:forEach items="${requestScope.list2[10]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[10]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[10]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[10]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[10]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two12">南京泰通</td>
  <c:forEach items="${requestScope.list2[11]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[11]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[11]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[11]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[11]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two13">武汉虹信</td>
  <c:forEach items="${requestScope.list2[12]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[12]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[12]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[12]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[12]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two14">京信</td>
  <c:forEach items="${requestScope.list2[13]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[13]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[13]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[13]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[13]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two15">三维</td>
  <c:forEach items="${requestScope.list2[14]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[14]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[14]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[14]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[14]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two16">COMLAB</td>
  <c:forEach items="${requestScope.list2[15]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[15]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[15]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[15]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[15]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two17">安德鲁</td>
  <c:forEach items="${requestScope.list2[16]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[16]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[16]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[16]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[16]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl11823788 style='height:20.1pt' id="two18">深圳赛格</td>
  <c:forEach items="${requestScope.list2[17]}" varStatus="i" var="item" begin="0" end="1">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[17]}" varStatus="i" var="item" begin="2" end="2">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[17]}" varStatus="i" var="item" begin="3" end="4">
  	<td colspan=2 class="xl10623788 editCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:forEach items="${requestScope.list2[17]}" varStatus="i" var="item" begin="5" end="5">
  	<td colspan=2 class="xl10623788 sumCell cell data" style='border-right:1.0pt solid black;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list2[17]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10623788 editCell" style='border-right:1.0pt solid black;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=26 style='height:20.1pt' class="sheetTwo">
  <td colspan=3 height=26 class=xl10223788 style='height:20.1pt' id="two19">合计</td>
  <c:forEach items="${requestScope.list2[18]}" varStatus="i" var="item" begin="0" end="5">
  	<td colspan=2 class="xl10223788 sumCell data" style='border-left:none' id="lineTwo${i.count}">${item}</td>
  </c:forEach>
  <c:if test="${empty list2[18]}">
  	<c:forEach var="item" begin="0" end="5">
  		<td colspan=2 class="xl10223788 editCell" style='border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
<!-- -----------------------------------正文结束--------------------------------------------- --> 
<!-- -----------------------------------底部开始--------------------------------------------- -->
 <tr height=26 style='height:20.1pt'>
  <td colspan=3 height=26 class=xl12523788 style='height:20.1pt'>单位负责人：</td>
  <td colspan=2 class="xl12423788 fillEditCell" id="personliable" style="white-space:normal;">${requestScope.list1[0][29]}</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td colspan=2 class=xl12523788>填报人：</td>
  <td colspan=3 class="xl12423788" id="reporter" style="white-space:normal;">${requestScope.list1[0][30]}</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td colspan=3 class=xl12523788>联系电话：</td>
  <td colspan=3 class="xl12423788 fillEditCell" id="phone" style="white-space:normal;">${requestScope.list1[0][31]}</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td class=xl10023788 style='border-top:none'>　</td>
  <td colspan=3 class=xl12523788>填报时间：</td>
  <td colspan=3 class="xl12623788" id="userfillDate" style="white-space:normal;">${requestScope.list1[0][32]}</td>
 </tr>
<!-- -----------------------------------底部结束--------------------------------------------- -->
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/report/reportValidate.js"></script>
<script type="text/javascript">

var contextPath = '<%=contextPath%>' + '/';
var fillDate = '<%=fillDate%>';

	$(document).ready(function(){
// 		$(".editCell").addClass("hiddenContext");
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
		$(".remarkCell").mouseover(highlightRemark);
	}
	// 高亮行
	function highlightRow() {
		$(".remarkCell").removeClass("activeRow");
		$(".editCell").removeClass("activeRow");
		$(this).addClass("activeRow");
		$(this).siblings(".editCell").addClass("activeRow");
	}
	function highlightRemark() {
		$(".editCell").removeClass("activeRow");
		$(".remarkCell").removeClass("activeRow");
		$(this).addClass("activeRow");
		$(this).siblings(".remarkCell").addClass("activeRow");
	}
	//计算按钮的响应
	$('#sumBtn').on('click',function(){
		
		sumRowOne();
		sumColOne();
		sumRowTwo();
		sumColTwo();
		//判断输入值是否为整数，是返回值为true，不是返回值为false
		flagOne = validateIntNumber($(".sheetOne .editCell"));
		flagTwo = validateIntNumber($(".sheetTwo .editCell"));
		//当sheetTwo（下表）输入的值都为整数时才判断输入值是否满足业务的除法要求
		//（被除数要小于除数）该报表则为故障台时要小于总运用台时
		if(flagTwo){
			//满足业务除法要求时返回true，不满足时返回false
			flagThree = divisorAndDividendCheck(".sheetTwo",".editCell",0,1);
		}
		//当上表和下表的数据都有非整数时
		if(flagOne==false&&flagTwo==false){
			alert("数据输入错误，请输入整数！");
		}
		//当上表的数据有非整数而下表没有非整数时
		if(flagOne==false&&flagTwo==true){
			//当数据满足业务除法时
			if(flagThree==true){
				alert("数据输入错误，请输入整数！");
			//当数据不满足业务除法时
			}else{
				alert("数据输入错误，请输入整数！并且总运用台时不能小于故障台时！");
			}
		}
		//当上表数据没有非整数下表有非整数时
		if(flagOne==true&&flagTwo==false){
			alert("数据输入错误，请输入整数！");
		}
		//当上下表数据都没有非整数时
		if(flagOne==true&&flagTwo==true){
			if(flagThree==false){
				alert("总运用台时不能小于故障台时！");
			}
		}
	});
	// 若为空,则转换为0
	function valueOfNum(num){
		if(num == "" || num == null){
			return 0;
		}else{
			return num;
		}
	}
	
	//行合计
	function sumRowOne() {
		
		$(".sheetOne").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
				
				$(rowArray[0]).html(parseInt(valueOfNum($(rowArray[1]).text()))
											+parseInt(valueOfNum($(rowArray[2]).text()))
											+parseInt(valueOfNum($(rowArray[3]).text()))
											+parseInt(valueOfNum($(rowArray[4]).text()))
											+parseInt(valueOfNum($(rowArray[5]).text()))
											+parseInt(valueOfNum($(rowArray[6]).text()))
											+parseInt(valueOfNum($(rowArray[7]).text()))
											+parseInt(valueOfNum($(rowArray[9]).text()))
											+parseInt(valueOfNum($(rowArray[10]).text()))
											+parseInt(valueOfNum($(rowArray[11]).text()))
											+parseInt(valueOfNum($(rowArray[12]).text()))
											+parseInt(valueOfNum($(rowArray[13]).text()))
											+parseInt(valueOfNum($(rowArray[14]).text()))
											+parseInt(valueOfNum($(rowArray[15]).text())));
				
				$(rowArray[8]).html(parseInt(valueOfNum($(rowArray[1]).text()))
											+parseInt(valueOfNum($(rowArray[2]).text()))
											+parseInt(valueOfNum($(rowArray[3]).text()))
											+parseInt(valueOfNum($(rowArray[4]).text()))
											+parseInt(valueOfNum($(rowArray[5]).text()))
											+parseInt(valueOfNum($(rowArray[6]).text()))
											+parseInt(valueOfNum($(rowArray[7]).text())));
				
				$(rowArray[16]).html(parseInt(valueOfNum($(rowArray[11]).text()))
												+parseInt(valueOfNum($(rowArray[12]).text()))
												+parseInt(valueOfNum($(rowArray[13]).text()))
												+parseInt(valueOfNum($(rowArray[14]).text()))
												+parseInt(valueOfNum($(rowArray[15]).text())));
				
				$(rowArray[24]).html(parseInt(valueOfNum($(rowArray[17]).text()))
												+parseInt(valueOfNum($(rowArray[18]).text()))
												+parseInt(valueOfNum($(rowArray[19]).text()))
												+parseInt(valueOfNum($(rowArray[20]).text()))
												+parseInt(valueOfNum($(rowArray[21]).text()))
												+parseInt(valueOfNum($(rowArray[22]).text()))
												+parseInt(valueOfNum($(rowArray[23]).text())));
			}
		});
		
	}
	//列合计
	function sumColOne() {
		
		var line1 = 0;
		var line2 = 0;
		var line3 = 0;
		var line4 = 0;
		var line5 = 0;
		var line6 = 0;
		var line7 = 0;
		var line8 = 0;
		var line9 = 0;
		var line10 = 0;
		var line11 = 0;
		var line12 = 0;
		var line13 = 0;
		var line14 = 0;
		var line15 = 0;
		var line16 = 0;
		var line17 = 0;
		var line18 = 0;
		var line19 = 0;
		var line20 = 0;
		var line21 = 0;
		var line22 = 0;
		var line23 = 0;
		var line24 = 0;
		var line25 = 0;
		$(".sheetOne").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
				line1 = parseInt(valueOfNum($(rowArray[0]).text())) + parseInt(line1);
				line2 = parseInt(valueOfNum($(rowArray[1]).text())) + parseInt(line2);
				line3 = parseInt(valueOfNum($(rowArray[2]).text())) + parseInt(line3);
				line4 = parseInt(valueOfNum($(rowArray[3]).text())) + parseInt(line4);
				line5 = parseInt(valueOfNum($(rowArray[4]).text())) + parseInt(line5);
				line6 = parseInt(valueOfNum($(rowArray[5]).text())) + parseInt(line6);
				line7 = parseInt(valueOfNum($(rowArray[6]).text())) + parseInt(line7);
				line8 = parseInt(valueOfNum($(rowArray[7]).text())) + parseInt(line8);
				line9 = parseInt(valueOfNum($(rowArray[8]).text())) + parseInt(line9);
				line10 = parseInt(valueOfNum($(rowArray[9]).text())) + parseInt(line10);
				line11 = parseInt(valueOfNum($(rowArray[10]).text())) + parseInt(line11);
				line12 = parseInt(valueOfNum($(rowArray[11]).text())) + parseInt(line12);
				line13 = parseInt(valueOfNum($(rowArray[12]).text())) + parseInt(line13);
				line14 = parseInt(valueOfNum($(rowArray[13]).text())) + parseInt(line14);
				line15 = parseInt(valueOfNum($(rowArray[14]).text())) + parseInt(line15);
				line16 = parseInt(valueOfNum($(rowArray[15]).text())) + parseInt(line16);
				line17 = parseInt(valueOfNum($(rowArray[16]).text())) + parseInt(line17);
				line18 = parseInt(valueOfNum($(rowArray[17]).text())) + parseInt(line18);
				line19 = parseInt(valueOfNum($(rowArray[18]).text())) + parseInt(line19);
				line20 = parseInt(valueOfNum($(rowArray[19]).text())) + parseInt(line20);
				line21 = parseInt(valueOfNum($(rowArray[20]).text())) + parseInt(line21);
				line22 = parseInt(valueOfNum($(rowArray[21]).text())) + parseInt(line22);
				line23 = parseInt(valueOfNum($(rowArray[22]).text())) + parseInt(line23);
				line24 = parseInt(valueOfNum($(rowArray[23]).text())) + parseInt(line24);
				line25 = parseInt(valueOfNum($(rowArray[24]).text())) + parseInt(line25);
			}
		});
		$('#line1').html(line1);
		$('#line2').html(line2);
		$('#line3').html(line3);
		$('#line4').html(line4);
		$('#line5').html(line5);
		$('#line6').html(line6);
		$('#line7').html(line7);
		$('#line8').html(line8);
		$('#line9').html(line9);
		$('#line10').html(line10);
		$('#line11').html(line11);
		$('#line12').html(line12);
		$('#line13').html(line13);
		$('#line14').html(line14);
		$('#line15').html(line15);
		$('#line16').html(line16);
		$('#line17').html(line17);
		$('#line18').html(line18);
		$('#line19').html(line19);
		$('#line20').html(line20);
		$('#line21').html(line21);
		$('#line22').html(line22);
		$('#line23').html(line23);
		$('#line24').html(line24);
		$('#line25').html(line25);
		
	}
	
	//行合计
	function sumRowTwo() {
		
		$(".sheetTwo").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
				
				$(rowArray[2]).html("0.00");
				
				if(parseInt($(rowArray[1]).text())<=parseInt($(rowArray[0]).text())&&$(rowArray[0]).text()!=0){
					var result = ((1-(parseInt($(rowArray[1]).text())/parseInt($(rowArray[0]).text())))*100).toFixed(2);
					$(rowArray[2]).html(result);
				}
				
				$(rowArray[5]).html(parseInt(valueOfNum($(rowArray[3]).text()))
											+parseInt(valueOfNum($(rowArray[4]).text())));
				
			}
		});
		
	}
	//列合计
	function sumColTwo() {
		
		var line1 = 0;
		var line2 = 0;
		var line3 = 0;
		var line4 = 0;
		var line5 = 0;
		var line6 = 0;
		$(".sheetTwo").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
				line1 = parseInt(valueOfNum($(rowArray[0]).text())) + parseInt(line1);
				line2 = parseInt(valueOfNum($(rowArray[1]).text())) + parseInt(line2);
				line4 = parseInt(valueOfNum($(rowArray[3]).text())) + parseInt(line4);
				line5 = parseInt(valueOfNum($(rowArray[4]).text())) + parseInt(line5);
				line6 = parseInt(valueOfNum($(rowArray[5]).text())) + parseInt(line6);
			}
		});
		$('#lineTwo1').html(line1);
		$('#lineTwo2').html(line2);
		$('#lineTwo4').html(line4);
		$('#lineTwo5').html(line5);
		$('#lineTwo6').html(line6);
		$('#lineTwo3').html("0.00");
		if(parseInt($('#lineTwo2').text())<=parseInt($('#lineTwo1').text())&&$('#lineTwo1').text()!=0){
			var result = ((1-(parseInt($('#lineTwo2').text())/parseInt($('#lineTwo1').text())))*100).toFixed(2);
			$('#lineTwo3').html(result);
		}
	}
	
	$('#saveBtn').on('click',function(){
		
		sumRowOne();
		sumColOne();
		sumRowTwo();
		sumColTwo();
		//判断输入值是否为整数，是返回值为true，不是返回值为false
		flagOne = validateIntNumber($(".sheetOne .editCell"));
		flagTwo = validateIntNumber($(".sheetTwo .editCell"));
		//当sheetTwo（下表）输入的值都为整数时才判断输入值是否满足业务的除法要求
		//（被除数要小于除数）该报表则为故障台时要小于总运用台时
		if(flagTwo){
			//满足业务除法要求时返回true，不满足时返回false
			flagThree = divisorAndDividendCheck(".sheetTwo",".editCell",0,1);
		}
		//当上表和下表的数据都有非整数时
		if(flagOne==false&&flagTwo==false){
			alert("数据输入错误，请输入整数！");
		}
		//当上表的数据有非整数而下表没有非整数时
		if(flagOne==false&&flagTwo==true){
			//当数据满足业务除法时
			if(flagThree==true){
				alert("数据输入错误，请输入整数！");
			//当数据不满足业务除法时
			}else{
				alert("数据输入错误，请输入整数！并且总运用台时不能小于故障台时！");
			}
		}
		//当上表数据没有非整数下表有非整数时
		if(flagOne==true&&flagTwo==false){
			alert("数据输入错误，请输入整数！");
		}
		//当上下表数据都没有非整数时
		if(flagOne==true&&flagTwo==true){
			//当下表数据不满足业务除法时
			if(flagThree==false){
				alert("总运用台时不能小于故障台时！");
				return;
			}else{
				saveData();
			}
		}
		
	});
	
	function saveData(){
		
		var statisticAnalysisDatas = getSaveStatisticAnalysisDatas();
		var faultAnalysisDatas = getSaveFaultAnalysisDatas();
		
		$.post(contextPath + 'wirelessDeviceSheetOneAction/add.cn',
				{
					year : $('#year').val(),
					month : $('#month').val(),
					statisticAnalysisDatas :  JSON.stringify(statisticAnalysisDatas),
					faultAnalysisDatas :  JSON.stringify(faultAnalysisDatas)
				},function(data,status){
					if(status){
						alert("保存成功!");
					}else{
						alert("保存失败!");
					}
				});
	}

	//获取保存数据
	function getSaveStatisticAnalysisDatas() {
		
		var statisticAnalysisDatas = [];
		//单位负责人
		var personliable = $("#personliable").text();
		// 填报人
		var reporter = $("#reporter").text();
		// 填报单位
		var belongOrg = "${sessionScope.user.organization.id}";
		// 填报单位名
		var belongOrgName = $("#belongOrgName").text();
		// 联系电话
		var phone = $("#phone").text();
		// 填报日期
		var userfillDate = $("#userfillDate").text();
		
		$(".sheetOne").each(function(j) {
			var rowArray = $(this).children(".data");
			if(rowArray && rowArray.length != 0) {
				var seq = j;
				var obj = new Object();

				obj.index = j+1;
				if(j==18){
					obj.deviceProducer = "合计";
				}else{
					obj.deviceProducer = $("#one"+obj.index).text();
				}
				
				obj.allCount = $(rowArray[0]).text();
			
				obj.stationHost = $(rowArray[1]).text();
				obj.controlBox = $(rowArray[2]).text();
				obj.microphone = $(rowArray[3]).text();
				obj.controlCable = $(rowArray[4]).text();
				obj.stationAntenna = $(rowArray[5]).text();
				obj.powerSupply = $(rowArray[6]).text();
				obj.stationOther = $(rowArray[7]).text();
				obj.stationRadioCount = $(rowArray[8]).text();
				
				obj.receiverDecoder = $(rowArray[9]).text();
				obj.stationAdapter = $(rowArray[10]).text();
				
				obj.repeaters = $(rowArray[11]).text();
				obj.fiberOpticRepeater = $(rowArray[12]).text();
				obj.rangeRadio = $(rowArray[13]).text();
				obj.rangeAntenna = $(rowArray[14]).text();
				obj.leakageCable = $(rowArray[15]).text();
				obj.workShopDeviceCount = $(rowArray[16]).text();
				
				obj.violationHumanR = $(rowArray[17]).text();
				obj.poorMaintenanceR = $(rowArray[18]).text();
				obj.powerSupplyR = $(rowArray[19]).text();
				obj.usersDamagedR = $(rowArray[20]).text();
				obj.materialAdverseR = $(rowArray[21]).text();
				obj.outsideImpedeR = $(rowArray[22]).text();
				obj.otherR = $(rowArray[23]).text();
				obj.questionCount = $(rowArray[24]).text();
				
				obj.belongOrg = belongOrg;
				obj.belongOrgName = belongOrgName;
				obj.personliable = personliable;
				obj.reporter = reporter;
				obj.phone = phone;
				obj.userfillDate = userfillDate + fillDate.substring(10);
				
				statisticAnalysisDatas[seq] = obj;
			}
		});
		
		return statisticAnalysisDatas;
	}
	
	//获取保存数据
	function getSaveFaultAnalysisDatas() {
		
		var faultAnalysisDatas = [];
		//单位负责人
		var personliable = $("#personliable").text();
		// 填报人
		var reporter = $("#reporter").text();
		// 填报单位
		var belongOrg = "${sessionScope.user.organization.id}";
		// 填报日期
		var userfillDate = $("#userfillDate").text();
		// 故障分析
		var memo = $("#remark").val();
		
		$(".sheetTwo").each(function(j) {
			var rowArray = $(this).children(".data");
			if(rowArray && rowArray.length != 0) {
				var seq = j;
				var obj = new Object();

				obj.index = j+1;
				obj.deviceProducer = $("#two"+obj.index).text();
				
				obj.useTimeCount = $(rowArray[0]).text();
				obj.faultTimeCount = $(rowArray[1]).text();
				obj.faultRate = $(rowArray[2]).text();
				obj.oneFaultCount = $(rowArray[3]).text();
				obj.secondFaultCount = $(rowArray[4]).text();
				obj.faultAllCount = $(rowArray[5]).text();
				
				obj.belongOrg = belongOrg;
				obj.personliable = personliable;
				obj.reporter = reporter;
				obj.memo = memo;
				obj.userfillDate = userfillDate + fillDate.substring(10);
				
				faultAnalysisDatas[seq] = obj;
			}
			
		});
		
		return faultAnalysisDatas;
	}
	
	//导出Excel
	$("#exportBtn").click(function() {
		
		sumRowOne();
		sumColOne();
		sumRowTwo();
		sumColTwo();
		//判断输入值是否为整数，是返回值为true，不是返回值为false
		flagOne = validateIntNumber($(".sheetOne .editCell"));
		flagTwo = validateIntNumber($(".sheetTwo .editCell"));
		//当sheetTwo（下表）输入的值都为整数时才判断输入值是否满足业务的除法要求
		//（被除数要小于除数）该报表则为故障台时要小于总运用台时
		if(flagTwo==true){
			//满足业务除法要求时返回true，不满足时返回false
			flagThree = divisorAndDividendCheck(".sheetTwo",".editCell",0,1);
		}
		//当上表和下表的数据都有非整数时
		if(flagOne==false&&flagTwo==false){
			alert("数据输入错误，请输入整数！");
		}
		//当上表的数据有非整数而下表没有非整数时
		if(flagOne==false&&flagTwo==true){
			//当数据满足业务除法时
			if(flagThree==true){
				alert("数据输入错误，请输入整数！");
			//当数据不满足业务除法时
			}else{
				alert("数据输入错误，请输入整数！并且总运用台时不能小于故障台时！");
			}
		}
		//当上表数据没有非整数下表有非整数时
		if(flagOne==true&&flagTwo==false){
			alert("数据输入错误，请输入整数！");
		}
		//当上下表数据都没有非整数时
		if(flagOne==true&&flagTwo==true){
			//当下表数据不满足业务除法时
			if(flagThree==false){
				alert("总运用台时不能小于故障台时！");
				return;
			}else{
				//保存且导出
				saveDataAndExport();;
			}
		}
	});
	function saveDataAndExport(){
		
		var statisticAnalysisDatas = getSaveStatisticAnalysisDatas();
		var faultAnalysisDatas = getSaveFaultAnalysisDatas();
		
		$.post(contextPath + 'wirelessDeviceSheetOneAction/add.cn',
				{
					year : $('#year').val(),
					month : $('#month').val(),
					statisticAnalysisDatas :  JSON.stringify(statisticAnalysisDatas),
					faultAnalysisDatas :  JSON.stringify(faultAnalysisDatas)
				},function(data,status){
					if(status){
						$("#updateForm").attr("action", "/kunmingrinms/wirelessDeviceSheetOneAction/exportShow.cn");
						$("#updateForm").submit();
					}else{
						alert("保存失败!");
					}
				});
	}
</script>
</body>
</html>