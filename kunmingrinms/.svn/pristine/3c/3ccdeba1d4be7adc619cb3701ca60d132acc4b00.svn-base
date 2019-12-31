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
.xl11117005
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
.xl11217005
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
.xl11317005
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
.xl11417005
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
<div style="margin-bottom:30px;margin-top:1px;">
	<form id="addForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}">
		<input type="hidden" id="month" name="month" value="${param.month}">
	</form>
	<button id="saveBtn">保存</button>
	<button id="sumBtn">计算与合计</button>
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
 <tr class=xl9717005 height=21 style='height:15.95pt'>
  <td colspan=4 height=21 width=177 style='height:15.95pt;width:133pt'
  align=left valign=top><span style='
  position:absolute;z-index:1;margin-left:0px;margin-top:17px;width:67px;
  height:110px'><img width=67 height=110
  src="../wirelessDeviceSheetThree/wirelessDeviceSheetThree.files/image001.png"></span><span
  style=''>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=4 height=21 class=xl11517005 width=177 style='height:15.95pt;
    width:133pt;'>填报单位：</td>
   </tr>
  </table>
  </span></td>
  <td colspan=8 class=xl11617005 id="belongOrgName" style="white-space:normal;">${sessionScope.user.organization.name}</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11217005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
  <td class=xl11117005>　</td>
 </tr>
 <tr height=21 style='height:15.95pt'>
  <td rowspan=2 height=42 class=xl11717005 style='height:31.9pt'>　</td>
  <td colspan=2 rowspan=2 class=xl11817005 width=40 style='border-right:1.0pt solid black;
  width:30pt'>　</td>
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
  <td height=21 class=xl10417005 style='height:15.95pt'></td>
  <td class=xl10517005></td>
  <td class=xl10817005></td>
 </tr>
 <tr height=21 style='height:15.95pt'>
  <td colspan=2 rowspan=2 height=42 class=xl10417005 style='border-bottom:1.0pt solid black;
  height:31.9pt'></td>
  <td rowspan=2 class=xl10817005 style='border-bottom:1.0pt solid black'></td>
 </tr>
 <tr height=21 style='height:15.95pt'>
 </tr>
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl12717005 style='height:15.95pt'>1</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one1">天津712厂</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>2</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one2">上海通信工厂</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>3</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one3">北京希电公司</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>4</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one4">深圳长龙公司</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>5</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one5">杭州创联公司</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>6</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one6">深圳思科泰公司</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>7</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one7">泉州电子设备公司</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>8</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one8">兰新厂</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>9</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one9">奥地利伊林公司</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>10</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one10">日本信和公司</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>11</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one11">日本古野公司</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>12</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one12">成都铁科</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>13</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one13">哈尔滨北特</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>14</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one14">北京中铁</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>15</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one15">交大路通</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>16</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one16">其他</td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl10217005 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetOne">
  <td class=xl10317005 colspan=3 height=21 width=60 style='height:15.95pt;width:45pt'>17</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="one17">合计</td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line0"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line1"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line2"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line3"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line4"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line5"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line6"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line7"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line8"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line9"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line10"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line11"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line12"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line13"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line14"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line15"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line16"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line17"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line18"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line19"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line20"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line21"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line22"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line23"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line24"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line25"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line26"></td>
  <td class="xl10217005 sumCell data" style='border-top:none;border-left:none' id="line27"></td>
 </tr>
 <tr height=21 style='height:15.95pt'>
  <td colspan=3 rowspan=3 height=42 class=xl11717005 style='height:31.9pt;border-right:1.0pt solid black;border-bottom:1.0pt solid black;'>
  	<img width=64 height=68 src="../wirelessDeviceSheetThree/wirelessDeviceSheetThree.files/image002.png">
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
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
  <td colspan=18 rowspan=17 class=xl13117005 width=558 style='width:414pt;border-bottom:1.0pt solid black;' id="remark"><textarea id="faultAnalysis" class="remarkCell" style="width:99%;height:100%;resize:none;margin-right:-1px;margin-bottom:-4px;" maxlength="250" placeholder="请输入，字数限250个"/></textarea></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>2</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two2">上海通信工厂</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>3</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two3">北京希电公司</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>4</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two4">深圳长龙公司</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>5</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two5">杭州创联公司</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>6</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two6">深圳思科泰公司</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>7</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two7">泉州电子设备公司</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>8</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two8">兰新厂</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>9</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two9">奥地利伊林公司</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>10</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two10">日本信和公司</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>11</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two11">日本古野公司</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>12</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two12">成都铁科</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>13</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two13">哈尔滨北特</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>14</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two14">北京中铁</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>15</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two15">交大路通</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>16</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two16">其他</td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl10217005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl12817005 sumCell cell data" style='border-left:none'></td>
  <td colspan=2 class="xl13017005 sumCell cell data" width=62 style='border-left:none;width:46pt'></td>
 </tr>
 <tr height=21 style='height:15.95pt' class="sheetTwo">
  <td colspan=3 height=21 class=xl10317005 style='height:15.95pt'>17</td>
  <td class=xl10317005 style='border-top:none;border-left:none' id="two17">合计</td>
  <td colspan=3 class="xl10217005 sumCell data" style='border-left:none' id="lineTwo0"></td>
  <td colspan=3 class="xl10217005 sumCell data" style='border-left:none' id="lineTwo1"></td>
  <td colspan=2 class="xl12817005 sumCell data" style='border-left:none' id="lineTwo2"></td>
  <td colspan=2 class="xl13017005 sumCell data" width=62 style='border-left:none;width:46pt' id="lineTwo3"></td>
 </tr>
<!-- -----------------------------------正文结束--------------------------------------------- --> 
<!-- -----------------------------------底部开始--------------------------------------------- --> 
 <tr class=xl10017005 height=21 style='height:15.95pt'>
  <td colspan=4 height=21 class=xl11517005 style='height:15.95pt'>单位负责人：</td>
  <td colspan=3 class="xl11617005 fillEditCell" id="personliable" style="white-space:normal;"></td>
  <td class=xl10117005 style='border-top:none'>　</td>
  <td colspan=3 class=xl11517005>填报人：</td>
  <td colspan=3 class="xl11617005" id="reporter" style="white-space:normal;">${sessionScope.user.name}</td>
  <td class=xl10117005 style='border-top:none'>　</td>
  <td class=xl10117005 style='border-top:none'>　</td>
  <td colspan=3 class=xl11417005>联系电话：</td>
  <td colspan=4 class="xl11317005 fillEditCell" id="phone" style="white-space:normal;"></td>
  <td class=xl10117005 style='border-top:none'>　</td>
  <td class=xl10117005 style='border-top:none'>　</td>
  <td colspan=4 class=xl11517005>填报时间：</td>
  <td colspan=3 class="xl12917005" id="userfillDate" style="white-space:normal;">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
 </tr>
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
	
	$('#sumBtn').on('click',function(){
		
		sumRowOne();
		sumColOne();
		//判断输入值是否为整数，是返回值为true，不是返回值为false
		flag1 = validateIntNumber($(".sheetOne .editCell"));
		//当输入值都是整数时，判断输入值是否满足业务的除法要求
		//（被除数要小于除数）该报表则为故障数量小于入库数量
		flag2 = divisorAndDividendCheck(".sheetTwo",".cell",0,1);
		
		if(flag1==false){
			alert("数据输入错误，请输入整数！");		
		}
		if(flag1==true){
			if(flag2==false){
				alert("入库数量数量不能小于故障数量！");
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
		
		//定义一个二维数组用于存储sheetOne的$(rowArray[0]).html()和$(rowArray[1]).html()的值
		var arr = new Array();
		
		for(var i = 0 ; i < 16 ; i++){
			arr[i] = new Array();
		}
		
		$(".sheetOne").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
				
				$(rowArray[1]).html(parseInt(valueOfNum($(rowArray[2]).text()))
											+parseInt(valueOfNum($(rowArray[3]).text()))
											+parseInt(valueOfNum($(rowArray[4]).text()))
											+parseInt(valueOfNum($(rowArray[5]).text()))
											+parseInt(valueOfNum($(rowArray[6]).text()))
											+parseInt(valueOfNum($(rowArray[7]).text()))
											+parseInt(valueOfNum($(rowArray[8]).text()))
											+parseInt(valueOfNum($(rowArray[9]).text()))
											+parseInt(valueOfNum($(rowArray[10]).text()))
											+parseInt(valueOfNum($(rowArray[12]).text()))
											+parseInt(valueOfNum($(rowArray[13]).text()))
											+parseInt(valueOfNum($(rowArray[14]).text()))
											+parseInt(valueOfNum($(rowArray[16]).text())));
				
				$(rowArray[11]).html(parseInt(valueOfNum($(rowArray[2]).text()))
											+parseInt(valueOfNum($(rowArray[3]).text()))
											+parseInt(valueOfNum($(rowArray[4]).text()))
											+parseInt(valueOfNum($(rowArray[5]).text()))
											+parseInt(valueOfNum($(rowArray[6]).text()))
											+parseInt(valueOfNum($(rowArray[7]).text()))
											+parseInt(valueOfNum($(rowArray[8]).text()))
											+parseInt(valueOfNum($(rowArray[9]).text()))
											+parseInt(valueOfNum($(rowArray[10]).text())));
				
				$(rowArray[15]).html(parseInt(valueOfNum($(rowArray[12]).text()))
												+parseInt(valueOfNum($(rowArray[13]).text()))
												+parseInt(valueOfNum($(rowArray[14]).text())));
				
				$(rowArray[27]).html(parseInt(valueOfNum($(rowArray[17]).text()))
												+parseInt(valueOfNum($(rowArray[18]).text()))
												+parseInt(valueOfNum($(rowArray[19]).text()))
												+parseInt(valueOfNum($(rowArray[20]).text()))
												+parseInt(valueOfNum($(rowArray[21]).text()))
												+parseInt(valueOfNum($(rowArray[22]).text()))
												+parseInt(valueOfNum($(rowArray[23]).text()))
												+parseInt(valueOfNum($(rowArray[24]).text()))
												+parseInt(valueOfNum($(rowArray[25]).text()))
												+parseInt(valueOfNum($(rowArray[26]).text())));
				
				arr[j][0] = $(rowArray[0]).text();
				arr[j][1] = $(rowArray[1]).text();
				
			}
			//将二维数组传给sheetTwo，对sheetTwo中的前两列进行赋值
			sumRowTwo(arr);
		});
		
	}
	//列合计
	function sumColOne() {
		
		var line0 = 0;
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
		var line26 = 0;
		var line27 = 0;
		$(".sheetOne").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
				line0 = parseInt(valueOfNum($(rowArray[0]).text())) + parseInt(line0);
				line1 = parseInt(valueOfNum($(rowArray[1]).text())) + parseInt(line1);
				line2 = parseInt(valueOfNum($(rowArray[2]).text())) + parseInt(line2);
				line3 = parseInt(valueOfNum($(rowArray[3]).text())) + parseInt(line3);
				line4 = parseInt(valueOfNum($(rowArray[4]).text())) + parseInt(line4);
				line5 = parseInt(valueOfNum($(rowArray[5]).text())) + parseInt(line5);
				line6 = parseInt(valueOfNum($(rowArray[6]).text())) + parseInt(line6);
				line7 = parseInt(valueOfNum($(rowArray[7]).text())) + parseInt(line7);
				line8 = parseInt(valueOfNum($(rowArray[8]).text())) + parseInt(line8);
				line9 = parseInt(valueOfNum($(rowArray[9]).text())) + parseInt(line9);
				line10 = parseInt(valueOfNum($(rowArray[10]).text())) + parseInt(line10);
				line11 = parseInt(valueOfNum($(rowArray[11]).text())) + parseInt(line11);
				line12 = parseInt(valueOfNum($(rowArray[12]).text())) + parseInt(line12);
				line13 = parseInt(valueOfNum($(rowArray[13]).text())) + parseInt(line13);
				line14 = parseInt(valueOfNum($(rowArray[14]).text())) + parseInt(line14);
				line15 = parseInt(valueOfNum($(rowArray[15]).text())) + parseInt(line15);
				line16 = parseInt(valueOfNum($(rowArray[16]).text())) + parseInt(line16);
				line17 = parseInt(valueOfNum($(rowArray[17]).text())) + parseInt(line17);
				line18 = parseInt(valueOfNum($(rowArray[18]).text())) + parseInt(line18);
				line19 = parseInt(valueOfNum($(rowArray[19]).text())) + parseInt(line19);
				line20 = parseInt(valueOfNum($(rowArray[20]).text())) + parseInt(line20);
				line21 = parseInt(valueOfNum($(rowArray[21]).text())) + parseInt(line21);
				line22 = parseInt(valueOfNum($(rowArray[22]).text())) + parseInt(line22);
				line23 = parseInt(valueOfNum($(rowArray[23]).text())) + parseInt(line23);
				line24 = parseInt(valueOfNum($(rowArray[24]).text())) + parseInt(line24);
				line25 = parseInt(valueOfNum($(rowArray[25]).text())) + parseInt(line25);
				line26 = parseInt(valueOfNum($(rowArray[26]).text())) + parseInt(line26);
				line27 = parseInt(valueOfNum($(rowArray[27]).text())) + parseInt(line27);
			}
		});
		$('#line0').html(line0);
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
		$('#line26').html(line26);
		$('#line27').html(line27);
		
	}

	//行合计
	function sumRowTwo(arr) {
		
		$(".sheetTwo").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
				
				$(rowArray[0]).html(valueOfNum(arr[j][0]));
				$(rowArray[1]).html(valueOfNum(arr[j][1]));
				
				$(rowArray[2]).html("0.00");
				$(rowArray[3]).html("0.00");
				
				if(parseInt($(rowArray[1]).text())<=parseInt($(rowArray[0]).text())&&$(rowArray[0]).text()!=0){
					var result = ((1-(parseInt($(rowArray[1]).text())/parseInt($(rowArray[0]).text())))*100).toFixed(2);
					$(rowArray[2]).html(result);
				}
				if(parseInt($(rowArray[1]).text())<=parseInt($(rowArray[0]).text())&&$(rowArray[0]).text()!=0){
					var result = ((parseInt($(rowArray[1]).text())/parseInt($(rowArray[0]).text()))*100).toFixed(2);
					$(rowArray[3]).html(result);
				}
				
			}
		});
		//调用sheetTwo的列相加函数
		sumColTwo();
		
	}

	//列合计
	function sumColTwo() {
		
		var line0 = 0;
		var line1 = 0;
		var line2 = 0;
		var line3 = 0;
		$(".sheetTwo").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
				line0 = parseInt(valueOfNum($(rowArray[0]).text())) + parseInt(line0);
				line1 = parseInt(valueOfNum($(rowArray[1]).text())) + parseInt(line1);
			}
		});
		$('#lineTwo0').html(line0);
		$('#lineTwo1').html(line1);
		
		$('#lineTwo2').html("0.00");
		if(parseInt($('#lineTwo1').text())<=parseInt($('#lineTwo0').text())&&$('#lineTwo0').text()!=0){
			var result = ((1-(parseInt($('#lineTwo1').text())/parseInt($('#lineTwo0').text())))*100).toFixed(2);
			$('#lineTwo2').html(result);
		}
		$('#lineTwo3').html("0.00");
		if(parseInt($('#lineTwo1').text())<=parseInt($('#lineTwo0').text())&&$('#lineTwo0').text()!=0){
			var result = ((parseInt($('#lineTwo1').text())/parseInt($('#lineTwo0').text()))*100).toFixed(2);
			$('#lineTwo3').html(result);
		}
	}
	
	$('#saveBtn').on('click',function(){
		
		sumRowOne();
		sumColOne();
		//判断输入值是否为整数，是返回值为true，不是返回值为false
		flag1 = validateIntNumber($(".sheetOne .editCell"));
		//当输入值都是整数时，判断输入值是否满足业务的除法要求
		//（被除数要小于除数）该报表则为故障数量小于入库数量
		flag2 = divisorAndDividendCheck(".sheetTwo",".cell",0,1);
		
		if(flag1==false){
			alert("数据输入错误，请输入整数！");		
		}
		if(flag1==true){
			if(flag2==false){
				alert("入库数量数量不能小于故障数量！");
			}else{
				saveData();
			}
		}
		
	});
	
	function saveData(){
		var faultAnalysisDatas = getSaveFaultAnalysisDatas();
		var applicationDatas = getSaveApplicationDatas();
		
		$.post(contextPath + 'wirelessDeviceSheetThreeAction/add.cn',
				{
					year : $('#year').val(),
					month : $('#month').val(),
					faultAnalysisDatas :  JSON.stringify(faultAnalysisDatas),
					applicationDatas :  JSON.stringify(applicationDatas)
				},function(data,status){
					if(status){
						alert("保存成功!");
					}else{
						alert("保存失败!");
					}
				});
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

				obj.sequenceNumber = j+1;
				obj.deviceProducer = $("#one"+obj.sequenceNumber).text();
				
				obj.deviceNum = $(rowArray[0]).text();
			
				obj.deviceFaultCount = $(rowArray[1]).text();
				
				obj.host = $(rowArray[2]).text();
				obj.gpsUnit = $(rowArray[3]).text();
				obj.controlBox = $(rowArray[4]).text();
				obj.speaker = $(rowArray[5]).text();
				obj.sendReceive = $(rowArray[6]).text();
				obj.powerSupply = $(rowArray[7]).text();
				obj.antenna = $(rowArray[8]).text();
				obj.cableConnector = $(rowArray[9]).text();
				obj.otherDevice = $(rowArray[10]).text();
				
				obj.hardwareCount = $(rowArray[11]).text();
				
				obj.crash = $(rowArray[12]).text();
				obj.operatingMode = $(rowArray[13]).text();
				obj.otherSoft = $(rowArray[14]).text();
				
				obj.softwareCount = $(rowArray[15]).text();
				
				obj.driverControlBox = $(rowArray[16]).text();
				
				obj.violationHumanR = $(rowArray[17]).text();
				obj.poorMaintenanceR = $(rowArray[18]).text();
				obj.powerSupplyR = $(rowArray[19]).text();
				obj.usersDamagedR = $(rowArray[20]).text();
				obj.materialAdverseR = $(rowArray[21]).text();
				obj.deviceAging = $(rowArray[22]).text();
				obj.softwareProgram = $(rowArray[23]).text();
				obj.outsideImpedeR = $(rowArray[24]).text();
				obj.wellTested = $(rowArray[25]).text();
				obj.otherR = $(rowArray[26]).text();
				
				obj.questionCount = $(rowArray[27]).text();
				
				obj.belongOrg = belongOrg;
				obj.belongOrgName = belongOrgName;
				obj.personliable = personliable;
				obj.reporter = reporter;
				obj.phone = phone;
				obj.userfillDate = userfillDate + fillDate.substring(10);
				
				faultAnalysisDatas[seq] = obj;
			}
		});
		
		return faultAnalysisDatas;
	}
	
	//获取保存数据
	function getSaveApplicationDatas() {
		
		var applicationDatas = [];
		// 填报人
		var reporter = $("#reporter").text();
		// 填报单位
		var belongOrg = "${sessionScope.user.organization.id}";
		// 填报日期
		var userfillDate = $("#userfillDate").text();
		// 故障分析
		var faultAnalysis = $("#faultAnalysis").val();
		
		$(".sheetTwo").each(function(j) {
			var rowArray = $(this).children(".data");
			if(rowArray && rowArray.length != 0) {
				var seq = j;
				var obj = new Object();

				obj.sequenceNumber = j+1;
				obj.deviceProducer = $("#two"+obj.sequenceNumber).text();
				
				obj.warehousing = $(rowArray[0]).text();
				obj.faultNum = $(rowArray[1]).text();
				obj.goodRate = $(rowArray[2]).text();
				obj.faultRate = $(rowArray[3]).text();
				
				obj.belongOrg = belongOrg;
				obj.reporter = reporter;
				obj.faultAnalysis = faultAnalysis;
				obj.userfillDate = userfillDate + fillDate.substring(10);
				
				applicationDatas[seq] = obj;
			}
			
		});
		
		return applicationDatas;
	}
</script>	
</body>
</html>