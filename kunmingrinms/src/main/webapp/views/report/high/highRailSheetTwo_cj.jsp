<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>高铁、城际铁路CIR故障统计及分析表</title>
<style id="高铁、城际铁路CIR故障统计及分析表_1张_16718_Styles">
<!--table
.xl6416718
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:normal;}
.xl6516718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1pt solid windowtext;
	white-space:normal;
	word-break:break-all;}
.xl6616718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl6716718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl6816718
	{padding:0px;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl6916718
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
.xl7016718
	{padding:0px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl7116718
	{padding:0px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl7216718
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
.xl7316718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl7416718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:1pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl7516718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl7616718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl7716718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1pt solid windowtext;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl7816718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl7916718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1pt solid windowtext;
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl8016718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:nowrap;}
.xl8116718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl8216718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:1pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl8316718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:nowrap;}
.xl8416718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;}
.xl8516718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl8616718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1pt solid windowtext;
	border-left:1pt solid windowtext;
	white-space:nowrap;}
.xl8716718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl8816718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1pt solid windowtext;
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl8916718
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl9016718
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl9116718
	{padding:0px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl9216718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1pt solid windowtext;
	white-space:normal;
	word-break:break-all;}
.xl9316718
	{padding:0px;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl9416718
	{padding:0px;
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
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl9516718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:1pt solid windowtext;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl9616718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1pt solid windowtext;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl9716718
	{padding:0px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1pt solid windowtext;
	border-bottom:1pt solid windowtext;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl9816718
	{padding:0px;
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
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
-->

</style>
</head>

<body>
<div style="margin-bottom:20px;margin-top:1px;">
	<form id="showForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}">
		<input type="hidden" id="month" name="month" value="${param.month}">
	</form>
	<button id="exportBtn">导出Excel</button>
</div>
<div id="高铁、城际铁路CIR故障统计及分析表_1张_16718" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=1066 style='border-collapse:
 collapse;table-layout:fixed;width:792pt'>
 <col width=17 span=3 style='width:13pt'>
 <col width=97 style='width:73pt'>
 <col width=27 span=34 style='width:20pt'>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl6916718 width=17 style='height:14.25pt;width:13pt'></td>
  <td class=xl6916718 width=17 style='width:13pt'></td>
  <td class=xl6916718 width=17 style='width:13pt'></td>
  <td class=xl6916718 width=97 style='width:73pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
  <td class=xl6916718 width=27 style='width:20pt'></td>
 </tr>
 <tr class=xl6816718 height=24 style='height:18.0pt'>
  <td colspan=38 height=24 class=xl9316718 width=1066 style='height:18.0pt;
  width:792pt'>高铁、城际铁路CIR故障统计及分析表</td>
 </tr>
 <tr height=21 style='height:15.95pt'>
  <td colspan=4 height=21 class=xl9416718 style='height:15.95pt'>填报单位：</td>
  <td colspan=8 class=xl9816718>${sessionScope.user.organization.name}</td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td class=xl6716718 width=27 style='width:20pt'></td>
  <td colspan=15 class=xl6716718 width=405 style='width:300pt'></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td rowspan=2 height=33 style='height:24.95pt;border-left:1pt solid windowtext' align=left>
  <span style='
  position:absolute;z-index:1;margin-left:0px;margin-top:1px;width:58px;
  height:166px'><img width=58 height=166
  src="../views/report/high/highRailSheetTwo1.files/wirelessWorkShopCir_8860_image001.png"></span><span
  style=''>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td rowspan=2 height=66 class=xl1208860 width=18 style='height:49.9pt;
    width:14pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td colspan=2 rowspan=2 class=xl8116718 style='border-top:none'></td>
  <td rowspan=5 class=xl9516718 width=97 style='border-bottom:1pt solid black;
  border-top:none;width:73pt'>设备生产商</td>
  <td rowspan=5 class=xl6516718 width=27 style='border-top:none;width:20pt'>运用设备数量</td>
  <td rowspan=5 class=xl6516718 width=27 style='border-top:none;width:20pt'>设备故障总数</td>
  <td colspan=17 class=xl6516718 width=459 style='border-left:none;width:340pt'>硬件设备</td>
  <td colspan=4 class=xl6516718 width=108 style='border-left:none;width:80pt'>软件非正常</td>
  <td colspan=11 class=xl6516718 width=297 style='border-left:none;width:220pt'>原因分析</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>450M电台单元</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>GPS单元</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>GSM-R语音单元</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>GSM-R数据单元</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>MMI按键</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>MMI显示屏</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>送受话器</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>打印机</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>记录单元</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>主控单元</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>接口单元</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>电源</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>电池</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>天馈线</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>缆线接头</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>其它</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>小计</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>死机</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>工作模式转换</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>其它</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>小计</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>违章人为</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>维修不良</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>供电电源</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>用户损坏</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>材质不良</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>设备老化</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>软件程序</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>外界干扰</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>回库检测良好</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>其它</td>
  <td rowspan=4 class=xl6516718 width=27 style='border-top:none;width:20pt'>小计</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl8316718 style='height:24.95pt'></td>
  <td class=xl8416718></td>
  <td class=xl8516718></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl8316718 style='height:24.95pt'></td>
  <td class=xl8416718></td>
  <td class=xl8516718></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl8616718 style='height:24.95pt'></td>
  <td class=xl8716718></td>
  <td class=xl8816718></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>1</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s11">北京华铁公司</td>
  <c:forEach items="${requestScope.list1[0]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>2</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s12">天津712厂</td>
    <c:forEach items="${requestScope.list1[1]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>3</td>
  <td class=xl6516718 style='border-top:none;border-left:none;width:73pt' id="s13">上海通信工厂</td>
    <c:forEach items="${requestScope.list1[2]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>4</td>
  <td class=xl6516718 style='border-top:none;border-left:none;width:73pt' id="s14">北京希电公司</td>
    <c:forEach items="${requestScope.list1[3]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>5</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s15">深圳长龙公司</td>
    <c:forEach items="${requestScope.list1[4]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>6</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s16">杭州创联公司</td>
    <c:forEach items="${requestScope.list1[5]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>7</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s17">世纪东方</td>
  <c:forEach items="${requestScope.list1[6]}" varStatus="i" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>8</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s18">上海复旦</td>
    <c:forEach items="${requestScope.list1[7]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>9</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s19">河南辉煌</td>
    <c:forEach items="${requestScope.list1[8]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>10</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s110">深圳思科泰</td>
    <c:forEach items="${requestScope.list1[9]}" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td class=xl6516718 colspan=3 height=21 width=52 style='height:15.95pt;width:39pt'>11</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s111">合计</td>
    <c:forEach items="${requestScope.list1[10]}" varStatus="i" var="item" begin="0" end="33">
  	<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'>${item}</td>
  </c:forEach>
  <c:if test="${empty list1}">
  	<c:forEach var="item" begin="0" end="33">
  		<td class="xl6516718" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr height=21 style='height:15.95pt'>
  <td colspan=3 rowspan=3 height=21 class=xl7316718 width=17 style='height:15.95pt;border-top:none;width:13pt'>
  	<img width=61 height=72 src="../views/report/high/highRailSheetTwo1.files/wirelessWorkShopCir_8860_image002.png">
  </td>
  <td rowspan=3 class=xl6516718 width=97 style='border-top:none;width:73pt'>设备生产商</td>
  <td colspan=3 rowspan=3 class=xl6516718 width=81 style='width:60pt'>入库数量<br>（台次）</td>
  <td colspan=3 rowspan=3 class=xl6516718 width=81 style='width:60pt'>故障数量<br>（台次）</td>
  <td colspan=3 rowspan=3 class=xl6516718 width=81 style='width:60pt'>入库良好率<br>（%）</td>
  <td colspan=3 rowspan=3 class=xl6516718 width=81 style='width:60pt'>故障率<br>（%）</td>
  <td colspan=22 rowspan=3 class=xl6516718 width=594 style='width:440pt'>故障分析说明</td>
 </tr>
 <tr height=21 style='height:15.95pt'>
 </tr>
 <tr height=21 style='height:15.95pt'>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>1</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s21">北京华铁公司</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[0][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[0][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[0][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[0][3]}</td>
  <td colspan=22 rowspan=11 class=xl6516718 width=594 style='width:440pt;'>
  <textarea id="faultAnalysis" readonly="readonly" style="border:none;width:99%;height:99%;resize:none;
  margin-right:-1px;margin-bottom:-4px;">${requestScope.list2[0][4]}</textarea>
  </td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>2</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s22">天津712厂</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[1][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[1][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[1][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[1][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>3</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s23">上海通信工厂</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[2][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[2][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[2][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[2][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>4</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s24">北京希电公司</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[3][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[3][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[3][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[3][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>5</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s25">深圳长龙公司</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[4][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[4][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[4][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[4][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>6</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s26">杭州创联公司</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[5][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[5][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[5][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[5][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>7</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s27">世纪东方</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[6][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[6][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[6][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[6][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>8</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s28">上海复旦</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[7][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[7][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[7][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[7][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>9</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s29">河南辉煌</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[8][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[8][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[8][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[8][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>10</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s210">深圳思科泰</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[9][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[9][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[9][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[9][3]}</td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>11</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s211">合计</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[10][0]}</td>
  <td colspan=3 class="xl6516718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[10][1]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[10][2]}</td>
  <td colspan=3 class="xl9216718" width=81 style='border-left:none;width:60pt'>${requestScope.list2[10][3]}</td>
 </tr>
 <tr style='height:30px'>
  <td colspan=4 height=21 class=xl8916718 style='height:15.95pt'>单位负责人：</td>
  <td colspan=3 class="xl9116718">${requestScope.list1[0][38] }</td>
  <td class=xl7016718 width=27 style='border-top:none;width:20pt'></td>
  <td class=xl7116718 width=27 style='width:20pt'></td>
  <td colspan=3 class=xl8916718>填报人：</td>
  <td colspan=4 class="xl9116718" style="white-space: normal;">${sessionScope.user.name}</td>
  <td class=xl7016718 width=27 style='border-top:none;width:20pt'></td>
  <td class=xl7216718></td>
  <td colspan=4 class=xl8916718>联系电话：</td>
  <td colspan=4 class="xl9116718">${requestScope.list1[0][40]}</td>
  <td class=xl7216718></td>
  <td class=xl7116718 width=27 style='width:20pt'></td>
  <td width=27 style='width:20pt' align=left></td>
  <td colspan=4 class=xl8916718>填报时间：</td>
  <td colspan=4 class=xl9016718>${requestScope.list1[0][41]}</td>
  <td class=xl7216718></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

//导出Excel
$("#exportBtn").click(function() {
	$("#showForm").attr("action", "/kunmingrinms/highRailSheetTwoAction/exportShow.cn");
	$("#showForm").submit();
});
	
</script>
</body>
</html>