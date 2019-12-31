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
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<title>无线通信终端设备（机车电台、列尾司机控制盒）运用质量统计及分析报表_电通无报-3</title>
<style id="普铁无线报表报表模板_17005_Styles">
<!--table
.xl9717005
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
.xl9817005
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
.xl9917005
	{padding:0px;
	color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	white-space:nowrap;}
.xl10017005
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;}
.xl10117005
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
.xl10217005
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
.xl10317005
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
.xl10417005
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
.xl10517005
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
.xl10617005
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
.xl10717005
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
.xl10817005
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
.xl10917005
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
.xl11017005
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
.xl11517005
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
.xl11617005
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
.xl11717005
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
.xl11817005
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
.xl11917005
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
.xl12217005
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
.xl12317005
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
.xl12417005
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
.xl12517005
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
.xl12717005
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
.xl12817005
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
.xl12917005
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
.xl13017005
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	background:white;
	white-space:normal;
	word-break:break-all;}
.xl13117005
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl13317005
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
.bui-select-list {
    height : 250px;
}
</style>
</head>
<body>
<div style="margin-bottom:30px;margin-top:20px;">
	<label style="float:left;margin-left: 10px;">车间：</label>
	<form id="showForm" method="post">
		<div id="orgSelect" style="float:left; margin-right: 5px;">
		</div>
		<input type="hidden" id="belongDepart" name="belongDepart" value="${requestScope.belongDepart}" >
		<input type="hidden" id="belongDepartName" name="belongDepartName" value="${requestScope.belongDepartName}" >
		<input type="hidden" id="year" name="year" value="${param.year}">
		<input type="hidden" id="month" name="month" value="${param.month}">
	</form>
	<button type="submit" id="searchBtn" >查询</button>
	<button id="exportBtn">导出Excel</button>
</div>
<div id="普铁无线报表报表模板_17005" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=1045 class=xl9817005
 style='border-collapse:collapse;table-layout:fixed;width:777pt'>
 <col class=xl9817005 width=20 style='width:15pt'>
 <col class=xl9817005 width=21 style='width:16pt'>
 <col class=xl9817005 width=19 style='width:14pt'>
 <col class=xl9817005 width=117 style='width:88pt'>
 <col class=xl9817005 width=31 span=28 style='width:23pt'>
 <tr height=19 style='height:14.25pt'>
  <td colspan=4 height=19 class=xl11617005 width=177 style='height:14.25pt;
  width:133pt'>电通无报-3</td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
  <td class=xl11017005 width=31 style='width:23pt'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td colspan=32 height=25 class=xl13317005 style='height:18.75pt'>无线通信终端设备（机车电台、列尾司机控制盒）运用质量统计及分析报表</td>
 </tr>
 <tr>
    <td colspan=4 height=21 class=xl11517005 width=177 style='height:15.95pt;width:133pt;'>填报单位：</td>
    <td colspan=28 class=xl11617005 id="belongOrgName" style="white-space: normal;word-break:break-all;">${requestScope.belongDepartName}</td>
 </tr>
 <tr class=xl9717005 height=21 style='height:15.95pt'>
  <td colspan=3 rowspan=5 height=21 width=177 style='border:1.0pt solid black;height:15.95pt;width:133pt'
  align=left valign=top><span style='
  position:absolute;z-index:1;margin-left:0px;margin-top:-3px;width:67px;
  height:110px'><img width=67 height=110
  src="/kunmingrinms/views/report/wireless/wirelessDeviceSheetThree/wirelessDeviceSheetThree.files/image001.png"></span><span
  style=''>
  <table cellpadding=0 cellspacing=0>
  </table>
  </span></td>
  <td rowspan=5 class=xl12217005 width=117 style='width:88pt'>设备生产商</td>
  <td rowspan=5 class=xl12317005 width=31 style='width:23pt'>设备数量</td>
  <td rowspan=5 class=xl12417005 width=31 style='width:23pt'>故障总件数</td>
  <td colspan=10 class=xl10317005 style='border-left:none'>机车电台硬件设备</td>
  <td colspan=4 class=xl10317005 style='border-left:none'>机车电台软件非正常</td>
  <td rowspan=5 class=xl12417005 width=31 style='border-top:none;width:23pt'>列尾司机控制盒</td>
  <td colspan=11 class=xl10317005 style='border-left:none'>原因分析</td>
 </tr>
 <tr height=21 style='height:15.95pt'>
  <td rowspan=4 height=84 class=xl12417005 width=31 style='height:63.8pt;
  border-top:none;width:23pt'>主机</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>GPS单元</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>控制盒</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>喇叭</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>送受话器</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>电源</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>天馈线</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>缆线接头</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>其它</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>小计</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>死机</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>工作模式转换</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>其它</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>小计</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>违章人为</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>维修不良</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>供电电源</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>用户损坏</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>材质不良</td>
  <td rowspan=4 class=xl12317005 width=31 style='border-top:none;width:23pt'>设备老化</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>软件程序</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>外界干扰</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>回库检测良好</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>其它</td>
  <td rowspan=4 class=xl12417005 width=31 style='border-top:none;width:23pt'>小计</td>
 </tr>
 <tr height=21 style='height:15.95pt'>
 </tr>
 <tr height=21 style='height:15.95pt'>
 </tr>
 <tr height=21 style='height:15.95pt'>
 </tr>
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl12717005 style='height:15.95pt'>1</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one1">天津712厂</td>
  <c:forEach items="${requestScope.resultA[0]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[0]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>2</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one2">上海通信工厂</td>
  <c:forEach items="${requestScope.resultA[1]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[1]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>3</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one3">北京希电公司</td>
  <c:forEach items="${requestScope.resultA[2]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[2]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>4</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one4">深圳长龙公司</td>
  <c:forEach items="${requestScope.resultA[3]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[3]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>5</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one5">杭州创联公司</td>
  <c:forEach items="${requestScope.resultA[4]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[4]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>6</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one6">深圳思科泰公司</td>
  <c:forEach items="${requestScope.resultA[5]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[5]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>7</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one7">泉州电子设备公司</td>
  <c:forEach items="${requestScope.resultA[6]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none;'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[6]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>8</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one8">兰新厂</td>
  <c:forEach items="${requestScope.resultA[7]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[7]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>9</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one9">奥地利伊林公司</td>
  <c:forEach items="${requestScope.resultA[8]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[8]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>10</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one10">日本信和公司</td>
  <c:forEach items="${requestScope.resultA[9]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[9]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>11</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one11">日本古野公司</td>
  <c:forEach items="${requestScope.resultA[10]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[10]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>12</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one12">成都铁科</td>
  <c:forEach items="${requestScope.resultA[11]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[11]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>13</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one13">哈尔滨北特</td>
  <c:forEach items="${requestScope.resultA[12]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[12]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>14</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one14">北京中铁</td>
  <c:forEach items="${requestScope.resultA[13]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[13]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>15</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one15">交大路通</td>
  <c:forEach items="${requestScope.resultA[14]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[14]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>16</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one16">其他</td>
  <c:forEach items="${requestScope.resultA[15]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[15]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td class=xl10317005 colspan=3 height=21 width=60 style='height:15.95pt;width:45pt'>17</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one17">合计</td>
  <c:forEach items="${requestScope.resultA[16]}" varStatus="i" var="item" begin="0" end="27">
  	<td class="xl10217005 Cell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty resultA[16]}">
  	<c:forEach var="item" begin="0" end="27">
  		<td class="xl10217005 Cell" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt'>
  <td colspan=3 rowspan=3 height=42 class=xl11717005 style='height:31.9pt;border-right:1.0pt solid black;border-bottom:1.0pt solid black;'>
  	<img width=64 height=68 src="/kunmingrinms/views/report/wireless/wirelessDeviceSheetThree/wirelessDeviceSheetThree.files/image002.png">
  </td>
  <td rowspan=3 class=xl12217005 width=117 style='border-top:none;width:88pt'>设备生产商</td>
  <td colspan=3 rowspan=3 class=xl12417005 width=93 style='width:69pt'>机车电台入库数量（台次）</td>
  <td colspan=3 rowspan=3 class=xl12417005 width=93 style='width:69pt'>机车电台故障数量（台次）</td>
  <td colspan=2 rowspan=3 class=xl12417005 width=62 style='width:46pt'>机车电台入库良好率（%）</td>
  <td colspan=2 rowspan=3 class=xl12317005 width=62 style='width:46pt'>机车电台故障率（%）</td>
  <td colspan=18 rowspan=3 class=xl10317005>故障分析说明</td>
 </tr>
 <tr height=21 style='height:15.95pt'>
 </tr>
 <tr height=21 style='height:15.95pt'>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl12717005 style='height:15.95pt'>1</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two1">天津712厂</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[0][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[0][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[0][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[0][3]}</td>
  <td colspan=18 rowspan=17 class="xl1018706" width=558 style='border-right:1.0pt solid black; border-bottom:1.0pt solid black' id="remark"><textarea style="border:none;width: 98.5%;height: 100%;resize: none;" readonly="readonly"><c:if test="${not empty allRemark}"><c:forEach items="allRemark">${allRemark }</c:forEach></c:if></textarea></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>2</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two2">上海通信工厂</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[1][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[1][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[1][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[1][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>3</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two3">北京希电公司</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[2][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[2][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[2][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[2][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>4</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two4">深圳长龙公司</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[3][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[3][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[3][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[3][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>5</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two5">杭州创联公司</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[4][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[4][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[4][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[4][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>6</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two6">深圳思科泰公司</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[5][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[5][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[5][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[5][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>7</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two7">泉州电子设备公司</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[6][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[6][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[6][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[6][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>8</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two8">兰新厂</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[7][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[7][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[7][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[7][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>9</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two9">奥地利伊林公司</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[8][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[8][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[8][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[8][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>10</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two10">日本信和公司</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[9][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[9][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[9][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[9][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>11</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two11">日本古野公司</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[10][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[10][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[10][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[10][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>12</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two12">成都铁科</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[11][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[11][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[11][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[11][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>13</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two13">哈尔滨北特</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[12][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[12][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[12][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[12][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>14</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two14">北京中铁</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[13][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[13][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[13][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[13][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>15</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two15">交大路通</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[14][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[14][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[14][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[14][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>16</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two16">其他</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[15][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[15][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[15][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[15][3]}</td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>17</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two17">合计</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[16][0]}</td>
  <td colspan=3 class="xl10217005 Cell" style='border-left:none'>${requestScope.resultB[16][1]}</td>
  <td colspan=2 class="xl12817005 Cell" style='border-left:none'>${requestScope.resultB[16][2]}</td>
  <td colspan=2 class="xl13017005 Cell" width=62 style='border-left:none;width:46pt'>${requestScope.resultB[16][3]}</td>
 </tr>
<!-- -----------------------------------正文结束--------------------------------------------- --> 
<!-- -----------------------------------底部开始--------------------------------------------- -->
 
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript">

var contextPath = '<%=contextPath%>' + '/';

	$(document).ready(function(){
// 		$(".Cell").addClass("hiddenContext");
	});
	
	var select;
	BUI.use(['bui/data', 'bui/select'], function(Data, Select) {
		var store = new Data.Store({
			autoLoad : true,
			proxy : {
				url : contextPath + "wirelessDeviceSheetThreeAction/getReportWorkshop.cn",
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
		
		$("#searchBtn").click(function() {
			$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetThreeAction/getSegmentByDto.cn");
			$("#showForm").submit();
		});
		
		//导出Excel
		$("#exportBtn").click(function() {
			if($("#belongDepart").val()==""){
				alert("无法导出！");
			}else{
				$("#showForm").attr("action", "/kunmingrinms/wirelessDeviceSheetThreeAction/exportSegment.cn");
				$("#showForm").submit();
			}
		});
	});
</script>	
</body>
</html>