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
<style id="（普速）有线通信二类障碍月度分析表_23036_Styles">
<!--table
.xl6723036
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl6923036
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
.xl7123036
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;}
.xl7223036
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
.xl7423036
	{padding:0px;
	color:windowtext;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl7523036
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
.xl7623036
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
.xl7723036
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl7823036
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	white-space:nowrap;}
.xl7923036
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
.xl8023036
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl8123036
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
.xl8323036
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
.xl8423036
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
.xl8623036
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
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl8723036
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
.xl9023036
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
.xl902592
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
	white-space:normal;}
.xl9123036
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
.xl9323036
	{padding:0px;
	color:windowtext;
	font-size:10.0pt;
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
-->

.editCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
}

.fillEditCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
 	white-space:normal;
}

.activeRow {
	background-color: #CAFBCE;
}
</style>
</head>

<body>
<div>
	<form id="addForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}"" >
	</form>
	<button id="saveBtn">保存</button>
</div>
<div id="（普速）有线通信一类障碍月度分析表_23036" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=3346 class=xl6723036
 style='border-collapse:collapse;table-layout:fixed;width:2509pt'>
 <col class=xl6723036 width=67 style='width:50pt'>
 <col class=xl6723036 width=55 style='width:41pt'>
 <col class=xl6723036 width=41 style='width:31pt'>
 <col class=xl6723036 width=115 style='width:86pt'>
 <col class=xl6723036 width=52 span=59 style='width:39pt'>
 <tr height=27 style='height:20.25pt'>
  <td colspan=63 height=27 class=xl7423036 width=3346 style='height:20.25pt;
  width:2509pt'>（普速）有线通信二类障碍月度分析表</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl6723036 style='height:15.75pt'></td>
  <td colspan=2 height=21 width=96 style='height:15.75pt;width:72pt'
  align=left valign=top><span style='
  position:absolute;z-index:2;margin-left:0px;margin-top:20px;width:211px;
  height:112px'><img width=211 height=112
  src="wiredMonthTwoFault.files/image006.png"></span><span
  style=''>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=21 class=xl7823036 width=96 style='height:15.75pt;
    width:72pt'>填报单位：</td>
   </tr>
  </table>
  </span></td>
  <td class=xl7123036 id="belongDepart">${sessionScope.user.organization.name }</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td colspan=2 class=xl7723036>填报日期：</td>
  <td colspan=2 class=xl8423036>${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td colspan=2 class=xl7923036>普速有线通信报-4</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
 </tr>
 <tr height=37 style='height:27.75pt'>
  <td rowspan=3 height=111 class=xl8623036 style='height:83.25pt'>单位名称</td>
  <td colspan=3 class=xl8723036 style='border-right:1.0pt solid black'>　</td>
  <td rowspan=3 class=xl9023036 width=52 style='width:39pt'>长途通信线路</td>
  <td rowspan=3 class=xl6923036 width=52 style='width:39pt'>地区通信线路</td>
  <td colspan=18 class=xl8323036 style='border-left:none'>传输与接入网设备</td>
  <td colspan=2 class=xl8323036 style='border-left:none'>同步设备</td>
  <td colspan=6 class=xl8323036 style='border-left:none'>数据设备</td>
  <td colspan=5 class=xl8323036 style='border-left:none'>调度设备</td>
  <td colspan=4 class=xl8323036 style='border-left:none'>会议设备</td>
  <td colspan=3 class=xl8323036 style='border-left:none'>广播设备</td>
  <td colspan=3 class=xl8323036 style='border-left:none'>报话设备</td>
  <td colspan=3 class=xl8323036 style='border-left:none'>应急通信设备</td>
  <td colspan=5 class=xl8323036 style='border-left:none'>综合视频监控设备</td>
  <td colspan=4 class=xl8323036 style='border-left:none'>电源设备、环境监控设备</td>
  <td rowspan=3 class=xl7623036 width=52 style='border-top:none;width:39pt'>二类障碍总数（件）</td>
  <td rowspan=3 class=xl7623036 width=52 style='border-top:none;width:39pt'>二类障碍延时（小时）</td>
  <td rowspan=3 class=xl7623036 width=52 style='width:39pt'>影响行车（小时）</td>
  <td rowspan=3 class=xl7623036 width=52 style='width:39pt'>平均延时（小时）</td>
 </tr>
 <tr height=37 style='height:27.75pt'>
  <td colspan=3 height=37 class=xl8123036 style='border-right:1.0pt solid black;
  height:27.75pt'>　</td>
  <td colspan=2 class=xl8323036 style='border-left:none'>骨干层DWDM<br>
    设备</td>
  <td colspan=2 class=xl8323036 style='border-left:none'>中继层DWDM<br>
    设备</td>
  <td colspan=3 class=xl8323036 style='border-left:none'>骨干层SDH/MSTP<br>
    设备</td>
  <td colspan=3 class=xl8323036 style='border-left:none'>中继层SDH/MSTP<br>
    设备</td>
  <td colspan=5 class=xl8323036 style='border-left:none'>接入层传输设备</td>
  <td colspan=3 class=xl8323036 style='border-left:none'>接入网设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>时钟同步设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>时间同步设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>骨干网大区节点路由器</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>局区域网核心层路由器</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>局区域网汇聚层路由器</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>接入层路由器</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>交换机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>DSLAM设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>调度所交换机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>车站交换机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>操作台、值班台</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>模拟调度</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>通信记录仪</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>视频MCU</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>视频会议终端</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>音频会议总机（转接机）</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>音频会议分机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>客运广播设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>列车广播机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>站场广播机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>话务台</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>电报交换机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>电报终端</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>局端中心设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>动图现场设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>静图终端设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>图像操作控制台</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>存储设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>编解码设备</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>摄像机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>视频光端机</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>高频开关电源</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>蓄电池</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>逆变器、UPS</td>
  <td rowspan=2 class=xl6923036 width=52 style='border-top:none;width:39pt'>机房环境监控设备</td>
 </tr>
 <tr height=37 style='height:27.75pt'>
  <td colspan=3 height=37 class=xl9123036 style='border-right:1.0pt solid black;
  height:27.75pt'>　</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>OTM/ OADM</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>OLA/ REG</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>OTM/ OADM</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>OLA/ REG</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>10G</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>2.5G</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>622M/ 155M</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>10G</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>2.5G</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>622M/ 155M</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>2.5G</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>622M/ 155M</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>PDH设备</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>HDSL设备</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>其它</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>PCM设备</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>OLT设备</td>
  <td class=xl6923036 width=52 style='border-top:none;border-left:none;
  width:39pt'>ONU设备</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none'>1</td>
  <td colspan=3 class=xl7523036 style='border-left:none'>2</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>3</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>4</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>5</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>6</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>7</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>8</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>9</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>10</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>11</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>12</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>13</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>14</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>15</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>16</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>17</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>18</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>19</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>20</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>21</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>22</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>23</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>24</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>25</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>26</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>27</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>28</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>29</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>30</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>31</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>32</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>33</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>34</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>35</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>36</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>37</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>38</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>39</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>40</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>41</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>42</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>43</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>44</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>45</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>46</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>47</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>48</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>49</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>50</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>51</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>52</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>53</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>54</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>55</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>56</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>57</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>58</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>59</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>60</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>61</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=89 height=1869 class=xl7223036 style='height:1401.75pt;
  border-top:none'>　</td>
  <td colspan=2 rowspan=5 class=xl7223036>通信责任</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>违章人为</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>维修不良</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>通信施工</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>原因不明</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=2 rowspan=4 height=84 class=xl7223036 style='height:63.0pt'>外单位责任</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>设备不良</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>路内妨害</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>路外妨害</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl7223036 style='height:15.75pt;border-left:
  none'>非责任</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl7223036 style='height:15.75pt;border-left:
  none'>合 计</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl7223036 style='height:15.75pt;border-left:
  none'>二类障碍延时</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td class=xl902592 rowspan=77 height=1617 style='height:1212.75pt;
  border-top:none'>设备厂家故障统计</td>
  <td rowspan=8 class=xl7623036 width=41 style='border-top:none;width:31pt'>传输</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>华为</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>烽火</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>马可尼</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>北电</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>朗讯</td>
   <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>NEC</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=6 height=126 class=xl7623036 width=41 style='height:94.5pt;
  border-top:none;width:31pt'>接入</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>华为</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>烽火</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>朗讯</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>NEC</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=4 height=84 class=xl7623036 width=41 style='height:63.0pt;
  border-top:none;width:31pt'>同步</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>持久</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>华为</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>惠普</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td rowspan=4 height=84 class=xl7623036 width=41 style='height:63.0pt;
  border-top:none;width:31pt'>数据</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>华为</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>思科</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=4 height=84 class=xl7623036 width=41 style='height:63.0pt;
  border-top:none;width:31pt'>调度</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>佳讯</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>天龙</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=6 height=126 class=xl7623036 width=41 style='height:94.5pt;
  border-top:none;width:31pt'>会议</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>华为</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>POLYCOM</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>VTEL</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>北京二七厂</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=4 height=84 class=xl7623036 width=41 style='height:63.0pt;
  border-top:none;width:31pt'>广播</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>天津北海</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>天津先唯</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>南京富成</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=3 height=63 class=xl7623036 width=41 style='height:47.25pt;
  border-top:none;width:31pt'>电报</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>中软</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>同济</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=8 height=168 class=xl7623036 width=41 style='height:126.0pt;
  border-top:none;width:31pt'>应急</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>世纪东方</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>佳讯</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>久盛鸿业</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>浙大</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>河南辉煌</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>有恒斯康</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=6 height=126 class=xl7623036 width=41 style='height:94.5pt;
  border-top:none;width:31pt'>视频监控</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>国铁华晨</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>佳讯</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>世纪东方</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>世纪瑞尔</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>河南辉煌</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=5 height=105 class=xl7623036 width=41 style='height:78.75pt;
  border-top:none;width:31pt'>电源</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>艾默生</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中达</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>动力源</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=7 height=147 class=xl7623036 width=41 style='height:110.25pt;
  border-top:none;width:31pt'>蓄电池</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>江苏双登<span
  style=''> </span></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>哈尔滨光宇</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>威海文隆</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>曲阜圣阳</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>杭州南都</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>武汉银泰</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=12 height=252 class=xl6923036 width=41 style='height:189.0pt;
  border-top:none;width:31pt'>动环</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>世纪瑞尔</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>艾默生</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中达</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>北京正汇</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>动力源</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>西门子</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>华讯</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>信力隆</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>先唯</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl7223036 editCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td colspan=2 height=21 class=xl9323036 style='height:15.75pt'>单位负责人：</td>
  <td colspan=2 class="xl7123036 fillEditCell" id="principal"></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td colspan=2 class=xl9323036>填报人：</td>
  <td colspan=3 class="xl7123036 fillEditCell" id="reporter">${sessionScope.user.name}</td>
  <td class=xl6723036></td>
  <td colspan=2 class=xl9323036>联系电话：</td>
  <td colspan=2 class="xl8023036 fillEditCell" id="phone"></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl6723036 style='height:15.75pt'>填表说明：</td>
  <td colspan=18 class=xl7123036>1、DWDM 系统OTM站一个方向算一套设备；</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl6723036 style='height:15.75pt'></td>
  <td colspan=18 class=xl7123036>2、DWDM设备OTM和OADM设备数量直接相加；OLA和REG设备数量直接相加。<span
  style=''> </span></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
 </tr>
 <tr class=xl6553523036 height=21 style='height:15.75pt'>
  <td height=21 class=xl6723036 style='height:15.75pt'></td>
  <td colspan=18 class=xl7123036>3、SDH 系统同一速率等级的ADM站、TM站和REG站设备数量直接相加。</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
 </tr>
 <tr class=xl6553523036 height=21 style='height:15.75pt'>
  <td height=21 class=xl6723036 style='height:15.75pt'></td>
  <td colspan=18 class=xl7123036>4、同步设备、时间设备一套包括天线和节点设备。</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl6723036 style='height:15.75pt'></td>
  <td colspan=18 class=xl7123036>5、请将因“设备不良”而导致的故障数量填入本表下方设备供货厂家相应的空白位置。非表中列出厂家，请填入对应设备“其它”行，并于表后写出具体厂家名称。</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
 </tr>
</table>

</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

$(document).ready(function(){
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
	$("#saveBtn").click(saveBtn);
}

// 高亮行
function highlightRow() {
	$(".editCell").removeClass("activeRow");

	$(this).addClass("activeRow");
	$(this).siblings(".editCell").addClass("activeRow");
}

function saveBtn() {
	var wiredMonthTwoFaults = getSaveDate();
	$.post(contextPath + 'wiredMonthTwoFaultAction/addOrUpdate.cn',
			{
				year : $("#year").val(),
				month : $("#month").val(),
				wiredMonthTwoFaults :  JSON.stringify(wiredMonthTwoFaults)
			},function(data,status){
				alert("保存成功");
			});
}

// 获取保存数据
function getSaveDate() {
	var wiredMonthTwoFaults = [];
	
	// 负责人
	var principal = $("#principal").text();
	// 填报人
	var reporter = $("#reporter").text();
	// 填报单位
	var belongDepart = "${sessionScope.user.organization.id}";
	// 联系电话
	var phone = $("#phone").text();
	
	$("tr").each(function(i) {

		var rowArray = $(this).children(".editCell");
		if(rowArray && rowArray.length != 0) {
			var seq = i - 7;// 表头7行
			
			var obj = new Object();
			obj.dataIndex = seq;
			var sum = 0;
			for(var i=0; i<54; i++){
				sum += parseInt($(rowArray[i]).text());
			}
			
			obj.trafficLine = $(rowArray[0]).text();
			obj.areaLine = $(rowArray[1]).text();
			obj.boneDwtmOtm = $(rowArray[2]).text();
			obj.boneDwtmOla = $(rowArray[3]).text();
			obj.midDwtmOtm = $(rowArray[4]).text();
			obj.midDwtmOla = $(rowArray[5]).text();
			obj.boneSdh10G = $(rowArray[6]).text();
			obj.boneSdh25G = $(rowArray[7]).text();
			obj.boneSdh622M = $(rowArray[8]).text();
			obj.midDwtm10G = $(rowArray[9]).text();
			
			obj.midDwtm25G = $(rowArray[10]).text();
			obj.midDwtm622M = $(rowArray[11]).text();
			obj.couple25G = $(rowArray[12]).text();
			obj.couple622M = $(rowArray[13]).text();
			obj.couplePdh = $(rowArray[14]).text();
			obj.coupleHDSL = $(rowArray[15]).text();
			obj.coupleOther = $(rowArray[16]).text();
			obj.coupleNetPcm = $(rowArray[17]).text();
			obj.coupleNetOLT = $(rowArray[18]).text();
			obj.coupleNetOnu = $(rowArray[19]).text();
			
			obj.clockSync = $(rowArray[20]).text();
			obj.timeSync = $(rowArray[21]).text();
			obj.boneRouter = $(rowArray[22]).text();
			obj.partCoreRouter = $(rowArray[23]).text();
			obj.partSetRouter = $(rowArray[24]).text();
			obj.coupleRouter = $(rowArray[25]).text();
			obj.gyrotrope = $(rowArray[26]).text();
			obj.dslamDevice = $(rowArray[27]).text();
			obj.disGyrotrope = $(rowArray[28]).text();
			obj.staGyrotrope = $(rowArray[29]).text();
			
			obj.dutyStage = $(rowArray[30]).text();
			obj.simulateDis = $(rowArray[31]).text();
			obj.comRecorder = $(rowArray[32]).text();
			obj.videoMcu = $(rowArray[33]).text();
			obj.videoSession = $(rowArray[34]).text();
			obj.audioMain = $(rowArray[35]).text();
			obj.audioMinor = $(rowArray[36]).text();
			obj.trafficBcst = $(rowArray[37]).text();
			obj.trainBcst = $(rowArray[38]).text();
			obj.stationBcst = $(rowArray[39]).text();
			
			obj.storyStage = $(rowArray[40]).text();
			obj.cableGyrotrope = $(rowArray[41]).text();
			obj.cableEnd = $(rowArray[42]).text();
			obj.localSide = $(rowArray[43]).text();
			obj.cardonSite = $(rowArray[44]).text();
			obj.stillEnd = $(rowArray[45]).text();
			obj.pictureCon = $(rowArray[46]).text();
			obj.storeSite = $(rowArray[47]).text();
			obj.codeSite = $(rowArray[48]).text();
			obj.videography = $(rowArray[49]).text();
			
			obj.videoRay = $(rowArray[50]).text();
			obj.stopcock = $(rowArray[51]).text();
			obj.store = $(rowArray[52]).text();
			obj.athwart = $(rowArray[53]).text();
			obj.roomEnvic = $(rowArray[54]).text();
			obj.faultTotal = sum;
			obj.timelag = $(rowArray[56]).text();
			obj.affectTrip = $(rowArray[57]).text();
			obj.avgLag = $(rowArray[58]).text();
			
			obj.principal = principal;
			obj.reporter = reporter;
			obj.belongDepart = belongDepart;
			obj.phone = phone;
			
			wiredMonthTwoFaults[seq] = obj;
		}
	});
	
	return wiredMonthTwoFaults;
}

</script>
</body>

</html>