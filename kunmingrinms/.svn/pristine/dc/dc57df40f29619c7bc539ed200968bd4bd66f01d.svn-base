<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
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
<title>新增高铁、城际铁路CIR故障统计及分析表</title>
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
<div style="margin-bottom:20px;margin-top:1px;">
	<form id="addForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}">
		<input type="hidden" id="month" name="month" value="${param.month}">
	</form>
	<button id="saveBtn">保存</button>
	<button id="sumBtn">计算与合计</button>
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
  <td colspan=8 class=xl9816718 id="belongOrgName">${sessionScope.user.organization.name}</td>
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
  src="../high/highRailSheetTwo1.files/wirelessWorkShopCir_8860_image001.png"></span><span
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
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>2</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s12">天津712厂</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>3</td>
  <td class=xl6516718 style='border-top:none;border-left:none;width:73pt' id="s13">上海通信工厂</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>4</td>
  <td class=xl6516718 style='border-top:none;border-left:none;width:73pt' id="s14">北京希电公司</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>5</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s15">深圳长龙公司</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>6</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s16">杭州创联公司</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>7</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s17">世纪东方</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>8</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s18">上海复旦</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>9</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s19">河南辉煌</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>10</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s110">深圳思科泰</td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 editCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
  <td class="xl6516718 sumCell cell data" width=27 style='border-top:none;border-left:none;width:20pt'></td>
 </tr>
 <tr class="sheetOne" height=21 style='height:15.95pt'>
  <td class=xl6516718 colspan=3 height=21 width=52 style='height:15.95pt;width:39pt'>11</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s111">合计</td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line0"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line1"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line2"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line3"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line4"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line5"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line6"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line7"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line8"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line9"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line10"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line11"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line12"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line13"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line14"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line15"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line16"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line17"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line18"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line19"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line20"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line21"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line22"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line23"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line24"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line25"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line26"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line27"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line28"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line29"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line30"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line31"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line32"></td>
  <td class="xl6516718 sumCell data" width=27 style='border-top:none;border-left:none;width:20pt' id="line33"></td>
 </tr>
 <tr height=21 style='height:15.95pt'>
  <td class=xl6516718 colspan=3 rowspan=3 height=21 width=52 style='height:15.95pt;width:39pt'>
  <img width=60 height=75 src="../high/highRailSheetTwo1.files/wirelessWorkShopCir_8860_image002.png">
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
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=22 rowspan=11 class=xl6516718 width=594 style='width:440pt'>
  <textarea id="faultAnalysis" class="remarkCell" style="border:none;width:99%;height:100%;resize:none;
  margin-right:-1px;margin-bottom:-4px;" maxlength="250" placeholder="请输入，字数限250个"/></textarea>
  </td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>2</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s22">天津712厂</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>3</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s23">上海通信工厂</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>4</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s24">北京希电公司</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>5</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s25">深圳长龙公司</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>6</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s26">杭州创联公司</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>7</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s27">世纪东方</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>8</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s28">上海复旦</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>9</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s29">河南辉煌</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>10</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s210">深圳思科泰</td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl6516718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
  <td colspan=3 class="xl9216718 sumCell cell data" width=81 style='border-left:none;width:60pt'></td>
 </tr>
 <tr class="sheetTwo" height=21 style='height:15.95pt'>
  <td colspan=3 height=21 class=xl6516718 width=51 style='height:15.95pt;width:39pt'>11</td>
  <td class=xl6516718 width=97 style='border-top:none;border-left:none;width:73pt' id="s211">合计</td>
  <td colspan=3 class="xl6516718 sumCell data" width=81 style='border-left:none;width:60pt' id="lineTwo0"></td>
  <td colspan=3 class="xl6516718 sumCell data" width=81 style='border-left:none;width:60pt' id="lineTwo1"></td>
  <td colspan=3 class="xl9216718 sumCell data" width=81 style='border-left:none;width:60pt' id="lineTwo2"></td>
  <td colspan=3 class="xl9216718 sumCell data" width=81 style='border-left:none;width:60pt' id="lineTwo3"></td>
 </tr>
 <tr style='height:30px'>
  <td colspan=4 height=21 class=xl8916718 style='height:15.95pt'>单位负责人：</td>
  <td colspan=3 class="xl9116718 fillEditCell" id="personliable" style="white-space: normal;"></td>
  <td class=xl7016718 width=27 style='border-top:none;width:20pt'></td>
  <td class=xl7116718 width=27 style='width:20pt'></td>
  <td colspan=3 class=xl8916718>填报人：</td>
  <td colspan=4 class="xl9116718 fillEditCell" id="reporter" style="white-space: normal;">${sessionScope.user.name}</td>
  <td class=xl7016718 width=27 style='border-top:none;width:20pt'></td>
  <td class=xl7216718></td>
  <td colspan=4 class=xl8916718>联系电话：</td>
  <td colspan=4 class="xl9116718 fillEditCell" id="phone" style="white-space: normal;"></td>
  <td class=xl7216718></td>
  <td class=xl7116718 width=27 style='width:20pt'></td>
  <td width=27 style='width:20pt' align=left></td>
  <td colspan=4 class=xl8916718>填报时间：</td>
  <td colspan=4 class=xl9016718 id="userfillDate" style="white-space: normal;">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl7216718></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/report/reportValidate.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var fillDate = '<%=fillDate%>';

$(document).ready(function(){
// 	$(".editCell").addClass("hiddenContext");
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
										+parseInt(valueOfNum($(rowArray[19]).text()))
										+parseInt(valueOfNum($(rowArray[20]).text()))
										+parseInt(valueOfNum($(rowArray[21]).text())));
			
			$(rowArray[18]).html(parseInt(valueOfNum($(rowArray[2]).text()))
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
											+parseInt(valueOfNum($(rowArray[17]).text())));
			
			$(rowArray[22]).html(parseInt(valueOfNum($(rowArray[19]).text()))
											+parseInt(valueOfNum($(rowArray[20]).text()))
											+parseInt(valueOfNum($(rowArray[21]).text())));
			
			$(rowArray[33]).html(parseInt(valueOfNum($(rowArray[23]).text()))
											+parseInt(valueOfNum($(rowArray[24]).text()))
											+parseInt(valueOfNum($(rowArray[25]).text()))
											+parseInt(valueOfNum($(rowArray[26]).text()))
											+parseInt(valueOfNum($(rowArray[27]).text()))
											+parseInt(valueOfNum($(rowArray[28]).text()))
											+parseInt(valueOfNum($(rowArray[29]).text()))
											+parseInt(valueOfNum($(rowArray[30]).text()))
											+parseInt(valueOfNum($(rowArray[31]).text()))
											+parseInt(valueOfNum($(rowArray[32]).text())));
			
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
	
	$.post(contextPath + 'highRailSheetTwoAction/add.cn',
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

			obj.seq = j + 1;
			obj.deviceProducer = $("#s1"+obj.seq).text();
			obj.deviceNum = $(rowArray[0]).text();
		
			obj.deviceFaultCount = $(rowArray[1]).text();
			
			obj.transceiver = $(rowArray[2]).text();
			obj.gpsUnit = $(rowArray[3]).text();
			obj.voiceUnit = $(rowArray[4]).text();
			obj.dataUnit = $(rowArray[5]).text();
			obj.button = $(rowArray[6]).text();
			obj.display = $(rowArray[7]).text();
			obj.sendReceive = $(rowArray[8]).text();
			obj.printer = $(rowArray[9]).text();
			obj.recordUnit = $(rowArray[10]).text();
			obj.masterUnit = $(rowArray[11]).text();
			obj.interfaceUnit = $(rowArray[12]).text();
			obj.powerSupply = $(rowArray[13]).text();
			obj.battery = $(rowArray[14]).text();
			obj.antenna = $(rowArray[15]).text();
			obj.cableConnector = $(rowArray[16]).text();
			obj.otherDevice = $(rowArray[17]).text();
			
			obj.hardwareCount = $(rowArray[18]).text();
			
			obj.crash = $(rowArray[19]).text();
			obj.operatingMode = $(rowArray[20]).text();
			obj.otherSoft = $(rowArray[21]).text();
			
			obj.softwareCount = $(rowArray[22]).text();
			
			obj.violationHumanR = $(rowArray[23]).text();
			obj.poorMaintenanceR = $(rowArray[24]).text();
			obj.powerSupplyR = $(rowArray[25]).text();
			obj.usersDamagedR = $(rowArray[26]).text();
			obj.materialAdverseR = $(rowArray[27]).text();
			obj.deviceAging = $(rowArray[28]).text();
			obj.softwareProgram = $(rowArray[29]).text();
			obj.outsideImpedeR = $(rowArray[30]).text();
			obj.wellTested = $(rowArray[31]).text();
			obj.otherR = $(rowArray[32]).text();
			
			obj.questionCount = $(rowArray[33]).text();
			
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
	// 填报单位名
	var belongOrgName = $("#belongOrgName").text();
	// 填报日期
	var userfillDate = $("#userfillDate").text();
	// 故障分析
	var faultAnalysis = $("#faultAnalysis").val();
	
	$(".sheetTwo").each(function(j) {
		var rowArray = $(this).children(".data");
		if(rowArray && rowArray.length != 0) {
			var seq = j;
			var obj = new Object();

			obj.seq = j + 1;
			obj.deviceProducer = $("#s2"+obj.seq).text();
			obj.warehousing = $(rowArray[0]).text();
			obj.faultNum = $(rowArray[1]).text();
			obj.goodRate = $(rowArray[2]).text();
			obj.faultRate = $(rowArray[3]).text();
			
			obj.belongOrg = belongOrg;
			obj.belongOrgName = belongOrgName;
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