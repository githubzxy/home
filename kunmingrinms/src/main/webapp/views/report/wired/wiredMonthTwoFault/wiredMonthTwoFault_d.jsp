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
	border-bottom:1.0pt solid windowtext;
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

.bui-select-list {
    height : 250px;
}
.image{
  	margin-top:20px;
}
</style>
</head>

<body>
<div style="margin-top: 20px;">
	<label style="float:left;margin-left: 20px;">车间：</label>
	<form id="countForm" method="post">
		<div id="orgSelect" style="float:left; margin-right: 5px;">
		</div>
		<input type="hidden" id="belongDepart" name="belongDepart" value="${requestScope.belongDepart}" >
		<input type="hidden" id="belongDepartName" name="belongDepartName" value="${requestScope.belongDepartName}" >
		<input type="hidden" id="year" name="year" value="2017" >
		<input type="hidden" id="month" name="month" value="01" >
	</form>
	<button type="submit" id="searchBtn" >查询</button>
	<button type="button" id="exportBtn" >导出Excel</button>
</div>
<div id="（普速）有线通信二类障碍月度分析表_23036" align=center>
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
  <td colspan=2 height=21 width=96 style='height:15.75pt;width:72pt'><span>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=21 class=xl7823036 width=96 style='height:15.75pt;
    width:72pt'>填报单位：</td>
   </tr>
  </table>
  </span></td>
  <td colspan=52 class=xl7123036 style="white-space:normal;">${requestScope.belongDepartName}</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
  <td colspan=2 class=xl7923036>普速有线通信报-4</td>
  <td class=xl6723036></td>
  <td class=xl6723036></td>
 </tr>
 <tr height=37 style='height:27.75pt'>
  <td rowspan=3 height=111 class=xl8623036 style='height:83.25pt'>单位名称</td>
  <td colspan=3 rowspan=3 class=xl8723036 style='border-right:1.0pt solid black;border-bottom:1.0pt solid black;'>
  	<img width=211 height=112 src="/kunmingrinms/views/report/wired/wiredMonthTwoFault/wiredMonthTwoFault.files/image006.png">
  </td>
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
  <td rowspan=3 class=xl7623036 width=52 style='width:39pt'>二类障碍总数（件）</td>
  <td rowspan=3 class=xl7623036 width=52 style='width:39pt'>二类障碍延时（小时）</td>
  <td rowspan=3 class=xl7623036 width=52 style='width:39pt'>影响行车（小时）</td>
  <td rowspan=3 class=xl7623036 width=52 style='width:39pt'>平均延时（小时）</td>
 </tr>
 <tr height=37 style='height:27.75pt'>
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
  <c:if test="${empty result[0]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[0]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>维修不良</td>
  <c:if test="${empty result[1]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[1]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>通信施工</td>
  <c:if test="${empty result[2]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[2]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>原因不明</td>
  <c:if test="${empty result[3]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[3]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[4]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[4]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=2 rowspan=4 height=84 class=xl7223036 style='height:63.0pt'>外单位责任</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>设备不良</td>
  <c:if test="${empty result[5]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[5]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>路内妨害</td>
  <c:if test="${empty result[6]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[6]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>路外妨害</td>
  <c:if test="${empty result[7]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[7]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[8]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[8]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl7223036 style='height:15.75pt;border-left:
  none'>非责任</td>
  <c:if test="${empty result[9]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[9]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl7223036 style='height:15.75pt;border-left:
  none'>合 计</td>
  <c:if test="${empty result[10]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[10]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl7223036 style='height:15.75pt;border-left:
  none'>二类障碍延时</td>
  <c:if test="${empty result[11]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[11]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td class=xl902592 rowspan=77 height=1617 style='height:1212.75pt;
  border-top:none'>设备厂家故障统计</td>
  <td rowspan=8 class=xl7623036 width=41 style='border-top:none;width:31pt'>传输</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>华为</td>
  <c:if test="${empty result[12]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[12]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[13]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[13]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>烽火</td>
  <c:if test="${empty result[14]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[14]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>马可尼</td>
  <c:if test="${empty result[15]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[15]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>北电</td>
  <c:if test="${empty result[16]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[16]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>朗讯</td>
  <c:if test="${empty result[17]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[17]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>NEC</td>
  <c:if test="${empty result[18]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[18]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[19]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[19]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=6 height=126 class=xl7623036 width=41 style='height:94.5pt;
  border-top:none;width:31pt'>接入</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>华为</td>
  <c:if test="${empty result[20]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[20]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[21]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[21]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>烽火</td>
  <c:if test="${empty result[22]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[22]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>朗讯</td>
  <c:if test="${empty result[23]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[23]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>NEC</td>
  <c:if test="${empty result[24]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[24]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[25]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[25]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=4 height=84 class=xl7623036 width=41 style='height:63.0pt;
  border-top:none;width:31pt'>同步</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>持久</td>
  <c:if test="${empty result[26]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[26]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>华为</td>
  <c:if test="${empty result[27]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[27]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>惠普</td>
  <c:if test="${empty result[28]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[28]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[29]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[29]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td rowspan=4 height=84 class=xl7623036 width=41 style='height:63.0pt;
  border-top:none;width:31pt'>数据</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>华为</td>
  <c:if test="${empty result[30]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[30]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[31]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[31]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>思科</td>
  <c:if test="${empty result[32]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[32]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[33]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[33]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=4 height=84 class=xl7623036 width=41 style='height:63.0pt;
  border-top:none;width:31pt'>调度</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>佳讯</td>
  <c:if test="${empty result[34]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[34]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <c:if test="${empty result[35]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[35]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>天龙</td>
  <c:if test="${empty result[36]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[36]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[37]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[37]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=6 height=126 class=xl7623036 width=41 style='height:94.5pt;
  border-top:none;width:31pt'>会议</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>华为</td>
  <c:if test="${empty result[38]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[38]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[39]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[39]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>POLYCOM</td>
  <c:if test="${empty result[40]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[40]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>VTEL</td>
  <c:if test="${empty result[41]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[41]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>北京二七厂</td>
  <c:if test="${empty result[42]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[42]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[43]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[43]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=4 height=84 class=xl7623036 width=41 style='height:63.0pt;
  border-top:none;width:31pt'>广播</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>天津北海</td>
  <c:if test="${empty result[44]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[44]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>天津先唯</td>
  <c:if test="${empty result[45]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[45]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>南京富成</td>
  <c:if test="${empty result[46]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[46]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[47]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[47]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=3 height=63 class=xl7623036 width=41 style='height:47.25pt;
  border-top:none;width:31pt'>电报</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>中软</td>
  <c:if test="${empty result[48]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[48]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>同济</td>
  <c:if test="${empty result[49]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[49]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[50]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[50]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=8 height=168 class=xl7623036 width=41 style='height:126.0pt;
  border-top:none;width:31pt'>应急</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>世纪东方</td>
  <c:if test="${empty result[51]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[51]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <c:if test="${empty result[52]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[52]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>佳讯</td>
  <c:if test="${empty result[53]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[53]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>久盛鸿业</td>
  <c:if test="${empty result[54]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[54]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>浙大</td>
  <c:if test="${empty result[55]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[55]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>河南辉煌</td>
  <c:if test="${empty result[56]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[56]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>有恒斯康</td>
  <c:if test="${empty result[57]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[57]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[58]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[58]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=6 height=126 class=xl7623036 width=41 style='height:94.5pt;
  border-top:none;width:31pt'>视频监控</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>国铁华晨</td>
  <c:if test="${empty result[59]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[59]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>佳讯</td>
  <c:if test="${empty result[60]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[60]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>世纪东方</td>
  <c:if test="${empty result[61]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[61]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>世纪瑞尔</td>
  <c:if test="${empty result[62]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[62]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>河南辉煌</td>
  <c:if test="${empty result[63]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[63]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[64]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[64]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=5 height=105 class=xl7623036 width=41 style='height:78.75pt;
  border-top:none;width:31pt'>电源</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>艾默生</td>
  <c:if test="${empty result[65]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[65]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中达</td>
  <c:if test="${empty result[66]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[66]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[67]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[67]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>动力源</td>
  <c:if test="${empty result[68]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[68]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[69]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[69]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=7 height=147 class=xl7623036 width=41 style='height:110.25pt;
  border-top:none;width:31pt'>蓄电池</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>江苏双登<span
  style=''> </span></td>
  <c:if test="${empty result[70]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[70]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>哈尔滨光宇</td>
  <c:if test="${empty result[71]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[71]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>威海文隆</td>
  <c:if test="${empty result[72]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[72]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>曲阜圣阳</td>
  <c:if test="${empty result[73]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[73]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>杭州南都</td>
  <c:if test="${empty result[74]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[74]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>武汉银泰</td>
  <c:if test="${empty result[75]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[75]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[76]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[76]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=12 height=252 class=xl6923036 width=41 style='height:189.0pt;
  border-top:none;width:31pt'>动环</td>
  <td class=xl7223036 style='border-top:none;border-left:none'>世纪瑞尔</td>
  <c:if test="${empty result[77]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[77]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>艾默生</td>
  <c:if test="${empty result[78]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[78]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中达</td>
  <c:if test="${empty result[79]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[79]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[80]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[80]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <c:if test="${empty result[81]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[81]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>北京正汇</td>
  <c:if test="${empty result[82]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[82]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>动力源</td>
  <c:if test="${empty result[83]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[83]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>西门子</td>
  <c:if test="${empty result[84]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[84]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>华讯</td>
  <c:if test="${empty result[85]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[85]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>信力隆</td>
  <c:if test="${empty result[86]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[86]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6723036 height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>先唯</td>
  <c:if test="${empty result[87]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[87]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl7223036 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[88]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7223036 " style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[88]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7223036 editCell" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
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
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var select;
BUI.use(['bui/data', 'bui/select'], function(Data, Select) {
	var store = new Data.Store({
		autoLoad : true,
		proxy : {
			url : contextPath + "wiredMonthTwoFaultAction/getReportWorkshop.cn",
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
				$(".image").css({
					"margin-top":"36px"
				});//设置图片的margin-top值
			} else {
				$(".bui-list-item").removeClass("bui-list-item-selected");
				$(".image").css({
					"margin-top":"20px"
				});
			}
		} else {
			$(".bui-list-item:first").removeClass("bui-list-item-selected");
			$(".image").css({
				"margin-top":"20px"
			});
		}
		
		$("#belongDepart").val(select.getSelectedValue());
		$("#belongDepartName").val(select.getSelectedText());
		$("#orgSelect .bui-select .bui-select-input").val(select.getSelectedText());
	});
	
	$("#searchBtn").click(function() {
		$("#countForm").attr("action", "/kunmingrinms/wiredMonthTwoFaultAction/getSegmentByDto.cn");
		$("#countForm").submit();
	});
	
	$("#exportBtn").click(function() {

		$("#countForm").attr("action", "/kunmingrinms/wiredMonthTwoFaultAction/exportSegment.cn");
		$("#countForm").submit();
	});
});
</script>
</body>

</html>