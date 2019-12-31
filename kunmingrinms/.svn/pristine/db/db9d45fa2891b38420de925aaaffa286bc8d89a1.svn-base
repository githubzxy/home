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
<title>无线通信终端设备（CIR）运用质量统计及分析报表_电通无报-2</title>
<style id="普铁无线报表报表模板_8860_Styles">
<!--table
.xl978860
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
.xl988860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;}
.xl998860
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
.xl1008860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl1018860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl1028860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;
	word-break:break-all;}
.xl1038860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl1048860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl1058860
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
.xl1068860
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;}
.xl1078860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl1088860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl1098860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl1108860
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
.xl1118860
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
.xl1128860
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
.xl1138860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	background:white;
	white-space:nowrap;}
.xl1148860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;
	word-break:break-all;}
.xl1158860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl1168860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl1178860
	{padding:0px;
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
.xl1188860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	background:white;
	white-space:normal;}
.xl1198860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl1208860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl1228860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl1248860
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
.xl1268860
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
<div id="普铁无线报表报表模板_8860" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=1111 class=xl978860
 style='border-collapse:collapse;table-layout:fixed;width:824pt'>
 <col class=xl978860 width=18 style='width:14pt'>
 <col class=xl978860 width=15 style='width:11pt'>
 <col class=xl978860 width=19 style='width:14pt'>
 <col class=xl978860 width=87 style='width:65pt'>
 <col class=xl978860 width=27 span=36 style='width:20pt'>
 <tr height=19 style='height:14.25pt'>
  <td colspan=4 height=19 class=xl998860 width=139 style='height:14.25pt;
  width:104pt'>电通无报-2</td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
  <td class=xl998860 width=27 style='width:20pt'></td>
 </tr>
 <tr height=24 style='height:18.0pt'>
  <td colspan=40 height=24 class=xl1248860 style='height:18.0pt'>无线通信终端设备（CIR）运用质量统计及分析报表</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl1108860 style='height:16.5pt'>填报单位：</td>
  <td colspan=6 class=xl1118860 id="belongOrgName" style="white-space:normal;">${requestScope.list1[0][39] }</td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl1058860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
  <td class=xl998860></td>
 </tr>
 <tr class=xl988860 height=33 style='height:24.95pt'>
  <td rowspan=2 height=66 width=18 style='height:49.9pt;width:14pt' align=left
  valign=top><span style='
  position:absolute;z-index:1;margin-left:0px;margin-top:1px;width:58px;
  height:166px'><img width=58 height=166
  src="../views/report/wireless/wirelessDeviceSheetTwo/wirelessDeviceSheetTwo.files/wirelessWorkShopCir_8860_image001.png"></span><span
  style=''>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td rowspan=2 height=66 class=xl1208860 width=18 style='height:49.9pt;
    width:14pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td colspan=2 rowspan=2 class=xl1268860 width=34 style='border-right:1.0pt solid black;
  width:25pt'>　</td>
  <td rowspan=5 class=xl1168860 width=87 style='width:65pt'>设备生产商</td>
  <td rowspan=5 class=xl1188860 width=27 style='width:20pt'>设备数量</td>
  <td rowspan=5 class=xl1178860 width=27 style='width:20pt'>设备故障总数</td>
  <td colspan=19 class=xl1018860 style='border-left:none'>硬件设备</td>
  <td colspan=4 class=xl1018860 style='border-left:none'>软件非正常</td>
  <td colspan=11 class=xl1018860 style='border-left:none'>原因分析</td>
 </tr>
 <tr class=xl988860 height=33 style='height:24.95pt'>
  <td rowspan=4 height=132 class=xl1178860 width=27 style='height:99.8pt;
  border-top:none;width:20pt'>450M电台单元</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>GPS单元</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>GSM-R语音单元</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>GSM-R数据单元</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>机车数据采集编码器</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>LBJ单元</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>MMI按键</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>MMI显示屏</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>送受话器</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>打印机</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>记录单元</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>主控单元</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>接口单元</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>电源</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>电池</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>天馈线</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>缆线接头</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>其它</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>小计</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>死机</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>工作模式转换</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>其它</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>小计</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>违章人为</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>维修不良</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>供电电源</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>用户损坏</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>材质不良</td>
  <td rowspan=4 class=xl1188860 width=27 style='border-top:none;width:20pt'>设备老化</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>软件程序</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>外界干扰</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>回库检测良好</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>其它</td>
  <td rowspan=4 class=xl1178860 width=27 style='border-top:none;width:20pt'>小计</td>
 </tr>
 <tr class=xl988860 height=33 style='height:24.95pt'>
  <td height=33 class=xl1078860 style='height:24.95pt'>　</td>
  <td class=xl1048860></td>
  <td class=xl1008860>　</td>
 </tr>
 <tr class=xl988860 height=33 style='height:24.95pt'>
  <td colspan=2 rowspan=2 height=66 class=xl1078860 style='border-bottom:1.0pt solid black;
  height:49.9pt'>　</td>
  <td rowspan=2 class=xl1008860 style='border-bottom:1.0pt solid black'>　</td>
 </tr>
 <tr class=xl988860 height=33 style='height:24.95pt'>
 </tr>
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt' id="bjht">
  <td colspan=3 height=21 class=xl1158860 style='height:15.95pt'>1</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s11">北京华铁公司</td>
  <c:forEach items="${requestScope.list1[0]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell" style='border-top:none;border-left:none' >${item}</td>
  </c:forEach>
  <c:if test="${empty list1[0]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>2</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s12">天津712厂</td>
  <c:forEach items="${requestScope.list1[1]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[1]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>3</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s13">上海通信工厂</td>
  <c:forEach items="${requestScope.list1[2]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[2]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>4</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s14">北京希电公司</td>
  <c:forEach items="${requestScope.list1[3]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell " style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[3]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>5</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s15">深圳长龙公司</td>
  <c:forEach items="${requestScope.list1[4]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell " style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[4]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>6</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s16">杭州创联公司</td>
  <c:forEach items="${requestScope.list1[5]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell " style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[5]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>7</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s17">世纪东方</td>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell " style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[6]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>8</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s18">上海复旦</td>
  <c:forEach items="${requestScope.list1[7]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell " style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[7]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>9</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s19">河南辉煌</td>
  <c:forEach items="${requestScope.list1[8]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell " style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[8]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>10</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s110">深圳思科泰</td>
  <c:forEach items="${requestScope.list1[9]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell " style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[9]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td class=xl1018860 colspan=3 height=21 width=52 style='height:15.95pt;width:39pt'>11</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s111">合计</td>
  <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="0" end="35">
  	<td class="xl1028860 Cell " style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1[10]}">
  	<c:forEach var="item" begin="0" end="35">
  		<td class="xl1028860 Cell" style='border-top:none;border-left:none' ></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class=xl988860 height=21 style='height:15.95pt'>
  <td colspan=3 rowspan=3 height=42 class=xl1208860 style='height:31.9pt;border-right:1.0pt solid black;border-bottom:1.0pt solid black;'>
  	<img width=58 height=70 src="../views/report/wireless/wirelessDeviceSheetTwo/wirelessDeviceSheetTwo.files/wirelessWorkShopCir_8860_image002.png">
  </td>
  <td rowspan=3 class=xl1168860 width=87 style='border-top:none;width:65pt'>设备生产商</td>
  <td colspan=3 rowspan=3 class=xl1178860 width=81 style='width:60pt'>入库数量<br>
    （台次）</td>
  <td colspan=3 rowspan=3 class=xl1178860 width=81 style='width:60pt'>故障数量<br>
    （台次）</td>
  <td colspan=3 rowspan=3 class=xl1178860 width=54 style='width:40pt'>入库良好率<br>
    （%）</td>
  <td colspan=3 rowspan=3 class=xl1188860 width=81 style='width:60pt'>故障率<br>
    （%）</td>
  <td colspan=24 rowspan=3 class=xl1178860 width=675 style='width:500pt'>故障分析说明</td>
 </tr>
 <tr class=xl988860 height=21 style='height:15.95pt'>
 </tr>
 <tr class=xl988860 height=21 style='height:15.95pt'>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1158860 style='height:15.95pt'>1</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s21">北京华铁公司</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[0][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[0][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[0][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[0][3]}</td>
  <td colspan=24 rowspan=11 class="xl1018706" id="remark" style='border-right:1.0pt solid black; border-bottom:1.0pt solid black'><textarea style="border:none;width: 99.4%;height: 99.2%;resize: none;" readonly="readonly">${requestScope.list2[0][4]}</textarea></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>2</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s22">天津712厂</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[1][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[1][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[1][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[1][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>3</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s23">上海通信工厂</td>
  <td colspan=3 class="xl1028860 Cell" style='border-left:none'>${requestScope.list2[2][0]}</td>
  <td colspan=3 class="xl1028860 Cell" style='border-left:none'>${requestScope.list2[2][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[2][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[2][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>4</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s24">北京希电公司</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[3][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[3][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[3][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[3][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>5</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s25">深圳长龙公司</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[4][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[4][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[4][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[4][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>6</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s26">杭州创联公司</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[5][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[5][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[5][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[5][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>7</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s27">世纪东方</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[6][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[6][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[6][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[6][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>8</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s28">上海复旦</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[7][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[7][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[7][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[7][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>9</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s29">河南辉煌</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[8][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[8][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[8][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[8][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>10</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s210">深圳思科泰</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[9][0]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[9][1]}</td>
  <td colspan=3 class="xl1028860 Cell " style='border-left:none'>${requestScope.list2[9][2]}</td>
  <td colspan=3 class="xl1148860 Cell" style='border-left:none'>${requestScope.list2[9][3]}</td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>11</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s211">合计</td>
  <td colspan=3 class="xl1148860 Cell " style='border-left:none'>${requestScope.list2[10][0]}</td>
  <td colspan=3 class="xl1148860 Cell " style='border-left:none'>${requestScope.list2[10][1]}</td>
  <td colspan=3 class="xl1148860 Cell " style='border-left:none'>${requestScope.list2[10][2]}</td>
  <td colspan=3 class="xl1148860 Cell " style='border-left:none'>${requestScope.list2[10][3]}</td>
 </tr>
 <!-- -----------------------------------正文结束--------------------------------------------- --> 
 <!-- -----------------------------------底部开始--------------------------------------------- --> 
 <tr height=21 style='height:15.95pt'>
  <td colspan=4 height=21 class=xl1108860 style='height:15.95pt'>单位负责人：</td>
  <td colspan=3 class="xl1118860 fillEditCell" id="personliable" style="white-space:normal;">${requestScope.list1[0][40] }</td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td colspan=3 class=xl1108860>填报人：</td>
  <td colspan=4 class="xl1118860" id="reporter" style="white-space:normal;">${requestScope.list1[0][41] }</td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td colspan=4 class=xl1108860>联系电话：</td>
  <td colspan=4 class="xl1118860 fillEditCell" id="phone" style="white-space:normal;">${requestScope.list1[0][42]}</td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td colspan=4 class=xl1108860>填报时间：</td>
  <td colspan=4 class="xl1128860" id="userfillDate" style="white-space:normal;">${requestScope.list1[0][43]}</td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
 </tr>
 <!-- -----------------------------------底部结束--------------------------------------------- --> 
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

var contextPath = '<%=contextPath%>' + '/';

	$(document).ready(function(){
	});
	
	//导出Excel
	$("#exportBtn").click(function() {
		$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetTwoAction/exportShow.cn");
		$("#showForm").submit();
	});
	
</script>
</body>
</html>