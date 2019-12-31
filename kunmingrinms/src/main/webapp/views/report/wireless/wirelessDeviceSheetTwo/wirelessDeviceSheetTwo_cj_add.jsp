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
	<form id="addForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}">
		<input type="hidden" id="month" name="month" value="${param.month}">
	</form>
	<button id="saveBtn">保存</button>
	<button id="sumBtn">计算与合计</button>
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
 <tr height=22 style='height:16.1.0t'>
  <td colspan=4 height=22 class=xl1108860 style='height:16.5pt'>填报单位：</td>
  <td colspan=8 class=xl1118860 id="belongOrgName" style="white-space:normal;">${sessionScope.user.organization.name}</td>
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
  src="../wirelessDeviceSheetTwo/wirelessDeviceSheetTwo.files/wirelessWorkShopCir_8860_image001.png"></span><span
  style=''>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td rowspan=2 height=66 class=xl1208860 width=18 style='height:49.9pt;
    width:14pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td colspan=2 rowspan=2 class=xl1268860 width=34 style='border-right:1.0pt solid black;width:25pt'>　</td>
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
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------- -->
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt' id="bjht">
  <td colspan=3 height=21 class=xl1158860 style='height:15.95pt'>1</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s11">北京华铁公司</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>2</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s12">天津712厂</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>3</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s13">上海通信工厂</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>4</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s14">北京希电公司</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>5</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s15">深圳长龙公司</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>6</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s16">杭州创联公司</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>7</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s17">世纪东方</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>8</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s18">上海复旦</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>9</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s19">河南辉煌</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>10</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s110">深圳思科泰</td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 editCell cell data" style='border-top:none;border-left:none'></td>
  <td class="xl1028860 sumCell cell data" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetOne" height=21 style='height:15.95pt'>
  <td class=xl1018860 colspan=3 height=21 width=52 style='height:15.95pt;width:39pt'>11</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s111">合计</td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line0"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line1"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line2"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line3"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line4"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line5"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line6"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line7"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line8"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line9"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line10"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line11"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line12"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line13"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line14"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line15"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line16"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line17"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line18"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line19"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line20"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line21"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line22"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line23"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line24"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line25"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line26"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line27"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line28"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line29"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line30"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line31"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line32"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line33"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line34"></td>
  <td class="xl1028860 sumCell data" style='border-top:none;border-left:none' id="line35"></td>
 </tr>
 <tr class=xl988860 height=21 style='height:15.95pt'>
  <td colspan=3 rowspan=3 height=40 class=xl1208860 style='height:31.9pt;border-right:1.0pt solid black;border-bottom:1.0pt solid black;'>
  	<img width=58 height=70 src="../wirelessDeviceSheetTwo/wirelessDeviceSheetTwo.files/wirelessWorkShopCir_8860_image002.png">
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
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
  <td colspan=24 rowspan=11 class="xl1138860" id="remark">
  	 <textarea id="faultAnalysis" class="remarkCell" style="width:99%;height:100%;resize:none;margin-right:-1px;margin-bottom:-4px;" maxlength="250" placeholder="请输入，字数限250个"/></textarea>
  </td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>2</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s22">天津712厂</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>3</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s23">上海通信工厂</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>4</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s24">北京希电公司</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>5</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s25">深圳长龙公司</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>6</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s26">杭州创联公司</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>7</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s27">世纪东方</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>8</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s28">上海复旦</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>9</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s29">河南辉煌</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>10</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s210">深圳思科泰</td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1028860 sumCell cell data" style='border-left:none'></td>
  <td colspan=3 class="xl1148860 sumCell cell data" style='border-left:none'></td>
 </tr>
 <tr class="xl988860 sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl1018860 style='height:15.95pt'>11</td>
  <td class=xl1018860 style='border-top:none;border-left:none' id="s211">合计</td>
  <td colspan=3 class="xl1148860 sumCell data" style='border-left:none' id="lineTwo0"></td>
  <td colspan=3 class="xl1148860 sumCell data" style='border-left:none' id="lineTwo1"></td>
  <td colspan=3 class="xl1148860 sumCell data" style='border-left:none' id="lineTwo2"></td>
  <td colspan=3 class="xl1148860 sumCell data" style='border-left:none' id="lineTwo3"></td>
 </tr>
 <!-- -----------------------------------正文结束--------------------------------------------- --> 
 <!-- -----------------------------------底部开始--------------------------------------------- --> 
 <tr height=21 style='height:15.95pt'>
  <td colspan=4 height=21 class=xl1108860 style='height:15.95pt'>单位负责人：</td>
  <td colspan=3 class="xl1118860 fillEditCell" id="personliable" style="white-space:normal;"></td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td colspan=3 class=xl1108860>填报人：</td>
  <td colspan=4 class="xl1118860" id="reporter" style="white-space:normal;">${sessionScope.user.name}</td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td colspan=4 class=xl1108860>联系电话：</td>
  <td colspan=4 class="xl1118860 fillEditCell" id="phone" style="white-space:normal;">${requestScope.result[0][65]}</td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td colspan=4 class=xl1108860>填报时间：</td>
  <td colspan=4 class="xl1128860" id="userfillDate" style="white-space:normal;">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
  <td class=xl1068860></td>
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
		
		for(var i = 0 ; i < 10 ; i++){
			arr[i] = new Array();
		}
		
		$(".sheetOne").each(function(j) {
			var rowArray = $(this).children(".cell");
			if(rowArray && rowArray.length != 0) {
// 				//硬件设备的小计
// 				var hardwareCount = parseInt(valueOfNum($(rowArray[2]).text()));
// 				for(var i = 3 ; i < 20 ; i++){
// 					hardwareCount = parseInt(hardwareCount) + parseInt(valueOfNum($(rowArray[i]).text()));
// 				}
// 				//软件问题的小计
// 				var softwareCount = parseInt(valueOfNum($(rowArray[21]).text()));
// 				for(var j = 22 ; j < 24 ; j++){
// 					softwareCount = parseInt(softwareCount) + parseInt(valueOfNum($(rowArray[j]).text()));
// 				}
// 				//原因的小计
// 				var causeCount = parseInt(valueOfNum($(rowArray[25]).text()));
// 				for(var k = 26 ; k < 35 ;k++){
// 					causeCount = parseInt(causeCount) + parseInt(valueOfNum($(rowArray[k]).text()));
// 				}
				
// 				$(rowArray[1]).html(parseInt(valueOfNum(hardwareCount+softwareCount)));
				
// 				$(rowArray[20]).html(parseInt(valueOfNum(hardwareCount)));
				
// 				$(rowArray[24]).html(parseInt(valueOfNum(softwareCount)));
				
// 				$(rowArray[35]).html(parseInt(valueOfNum(causeCount)));
				
				$(rowArray[1]).html(parseInt(valueOfNum($(rowArray[2]).text()))
											+parseInt(valueOfNum($(rowArray[3]).text()))
											+parseInt(valueOfNum($(rowArray[4]).text()))
											+parseInt(valueOfNum($(rowArray[5]).text()))
											+parseInt(valueOfNum($(rowArray[6]).text()))
											+parseInt(valueOfNum($(rowArray[7]).text()))
											+parseInt(valueOfNum($(rowArray[8]).text()))
											+parseInt(valueOfNum($(rowArray[9]).text()))
											+parseInt(valueOfNum($(rowArray[10]).text()))
											+parseInt(valueOfNum($(rowArray[11]).text()))
											+parseInt(valueOfNum($(rowArray[12]).text()))
											+parseInt(valueOfNum($(rowArray[13]).text()))
											+parseInt(valueOfNum($(rowArray[14]).text()))
											+parseInt(valueOfNum($(rowArray[15]).text()))
											+parseInt(valueOfNum($(rowArray[16]).text()))
											+parseInt(valueOfNum($(rowArray[17]).text()))
											+parseInt(valueOfNum($(rowArray[18]).text()))
											+parseInt(valueOfNum($(rowArray[19]).text()))
											+parseInt(valueOfNum($(rowArray[21]).text()))
											+parseInt(valueOfNum($(rowArray[22]).text()))
											+parseInt(valueOfNum($(rowArray[23]).text())));
				
				$(rowArray[20]).html(parseInt(valueOfNum($(rowArray[2]).text()))
												+parseInt(valueOfNum($(rowArray[3]).text()))
												+parseInt(valueOfNum($(rowArray[4]).text()))
												+parseInt(valueOfNum($(rowArray[5]).text()))
												+parseInt(valueOfNum($(rowArray[6]).text()))
												+parseInt(valueOfNum($(rowArray[7]).text()))
												+parseInt(valueOfNum($(rowArray[8]).text()))
												+parseInt(valueOfNum($(rowArray[9]).text()))
												+parseInt(valueOfNum($(rowArray[10]).text()))
												+parseInt(valueOfNum($(rowArray[11]).text()))
												+parseInt(valueOfNum($(rowArray[12]).text()))
												+parseInt(valueOfNum($(rowArray[13]).text()))
												+parseInt(valueOfNum($(rowArray[14]).text()))
												+parseInt(valueOfNum($(rowArray[15]).text()))
												+parseInt(valueOfNum($(rowArray[16]).text()))
												+parseInt(valueOfNum($(rowArray[17]).text()))
												+parseInt(valueOfNum($(rowArray[18]).text()))
												+parseInt(valueOfNum($(rowArray[19]).text())));
				
				$(rowArray[24]).html(parseInt(valueOfNum($(rowArray[21]).text()))
												+parseInt(valueOfNum($(rowArray[22]).text()))
												+parseInt(valueOfNum($(rowArray[23]).text())));
				
				$(rowArray[35]).html(parseInt(valueOfNum($(rowArray[25]).text()))
												+parseInt(valueOfNum($(rowArray[26]).text()))
												+parseInt(valueOfNum($(rowArray[27]).text()))
												+parseInt(valueOfNum($(rowArray[28]).text()))
												+parseInt(valueOfNum($(rowArray[29]).text()))
												+parseInt(valueOfNum($(rowArray[30]).text()))
												+parseInt(valueOfNum($(rowArray[31]).text()))
												+parseInt(valueOfNum($(rowArray[32]).text()))
												+parseInt(valueOfNum($(rowArray[33]).text()))
												+parseInt(valueOfNum($(rowArray[34]).text())));
				
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
		var line28 = 0;
		var line29 = 0;
		var line30 = 0;
		var line31 = 0;
		var line32 = 0;
		var line33 = 0;
		var line34 = 0;
		var line35 = 0;
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
				line28 = parseInt(valueOfNum($(rowArray[28]).text())) + parseInt(line28);
				line29 = parseInt(valueOfNum($(rowArray[29]).text())) + parseInt(line29);
				line30 = parseInt(valueOfNum($(rowArray[30]).text())) + parseInt(line30);
				line31 = parseInt(valueOfNum($(rowArray[31]).text())) + parseInt(line31);
				line32 = parseInt(valueOfNum($(rowArray[32]).text())) + parseInt(line32);
				line33 = parseInt(valueOfNum($(rowArray[33]).text())) + parseInt(line33);
				line34 = parseInt(valueOfNum($(rowArray[34]).text())) + parseInt(line34);
				line35 = parseInt(valueOfNum($(rowArray[35]).text())) + parseInt(line35);
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
		$('#line28').html(line28);
		$('#line29').html(line29);
		$('#line30').html(line30);
		$('#line31').html(line31);
		$('#line32').html(line32);
		$('#line33').html(line33);
		$('#line34').html(line34);
		$('#line35').html(line35);
		
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
		
		$.post(contextPath + 'wirelessDeviceSheetTwoAction/add.cn',
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
				var seq = j;// 表头8行
				var obj = new Object();

				obj.sequenceNumber = j+1;
				obj.deviceProducer = $("#s1"+obj.sequenceNumber).text();
				obj.deviceNum = $(rowArray[0]).text();
			
				obj.deviceFaultCount = $(rowArray[1]).text();
				
				obj.transceiver = $(rowArray[2]).text();
				obj.gpsUnit = $(rowArray[3]).text();
				obj.voiceUnit = $(rowArray[4]).text();
				obj.dataUnit = $(rowArray[5]).text();
				obj.encoder = $(rowArray[6]).text();
				obj.lbjUnit = $(rowArray[7]).text();
				obj.button = $(rowArray[8]).text();
				obj.display = $(rowArray[9]).text();
				obj.sendReceive = $(rowArray[10]).text();
				obj.printer = $(rowArray[11]).text();
				obj.recordUnit = $(rowArray[12]).text();
				obj.masterUnit = $(rowArray[13]).text();
				obj.interfaceUnit = $(rowArray[14]).text();
				obj.powerSupply = $(rowArray[15]).text();
				obj.battery = $(rowArray[16]).text();
				obj.antenna = $(rowArray[17]).text();
				obj.cableConnector = $(rowArray[18]).text();
				obj.otherDevice = $(rowArray[19]).text();
				
				obj.hardwareCount = $(rowArray[20]).text();
				
				obj.crash = $(rowArray[21]).text();
				obj.operatingMode = $(rowArray[22]).text();
				obj.otherSoft = $(rowArray[23]).text();
				
				obj.softwareCount = $(rowArray[24]).text();
				
				obj.violationHumanR = $(rowArray[25]).text();
				obj.poorMaintenanceR = $(rowArray[26]).text();
				obj.powerSupplyR = $(rowArray[27]).text();
				obj.usersDamagedR = $(rowArray[28]).text();
				obj.materialAdverseR = $(rowArray[29]).text();
				obj.deviceAging = $(rowArray[30]).text();
				obj.softwareProgram = $(rowArray[31]).text();
				obj.outsideImpedeR = $(rowArray[32]).text();
				obj.wellTested = $(rowArray[33]).text();
				obj.otherR = $(rowArray[34]).text();
				
				obj.questionCount = $(rowArray[35]).text();
				
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
				var seq = j;// 表头22行
				var obj = new Object();

				obj.sequenceNumber = j+1;
				obj.deviceProducer = $("#s2"+obj.sequenceNumber).text();
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