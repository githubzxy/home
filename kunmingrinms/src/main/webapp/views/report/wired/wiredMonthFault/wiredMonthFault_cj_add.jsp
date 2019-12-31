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
<style id="（普速）有线通信故障月度分析表_16225_Styles">
<!--table
*{
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
}
table{
	padding:0px;
	text-align:center;
	vertical-align:middle;
	white-space:normal;
}
td{
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	
}
.xl7016225
	{
	white-space:nowrap;}

.xl7816225
	{
	font-size:9.0pt;
	border:1.0pt solid windowtext;
	}
.xl7916225
	{
	font-size:9.0pt;
	text-align:general;
	border:1.0pt solid windowtext;
	}
.xl8016225
	{
	border:1.0pt solid windowtext;
	background:white;
	white-space:nowrap;}
.xl8116225
	{
	white-space:nowrap;}
.xl8416225
	{
	color:black;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	}
.xl9916225
	{
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	}
.xl10316225
	{
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	}

.xl10916225
	{
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl11416225
	{
	color:black;
	font-size:9.0pt;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	}
.xl11516225
	{
	color:black;
	font-size:9.0pt;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	}
.xl11616225
	{
	color:black;
	font-size:9.0pt;
	border:1.0pt solid windowtext;
	}
.xl11716225
	{
	font-size:9.0pt;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	}
.xl12116225
	{
	font-size:9.0pt;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	}
.xl12516225
	{
	font-size:9.0pt;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	}
.xl12716225
	{
	font-size:9.0pt;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	}
.xl13116225
	{
	color:black;
	font-size:9.0pt;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl13316225
	{
	color:black;
	font-size:9.0pt;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;}
.xl13516225
	{
	color:black;
	font-size:9.0pt;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	}
.xl6553516225{
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;
}
-->
.editCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
}

.fillEditCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
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
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="saveBtn">保存</button>
</div>
<div id="昆铁业务报表20161128_16225" align=center >
<table border=0 cellpadding=0 cellspacing=0 
 style='border-collapse:collapse;table-layout:fixed;width:2482pt'>
 <col span=2 style='width:41pt'>
 <col style='width:31pt'>
 <col style='width:76pt'>
 <col span=2 style='width:36pt'>
 <col span=20 style='width:39pt'>
 <col span=3 style='width:43pt'>
 <col span=8 style='width:37pt'>
 <col span=7 style='width:34pt'>
 <col span=6 style='width:34pt'>
 <col span=9 style='width:35pt'>
 <col style='width:43pt'>
 <col span=3 style='width:54pt'>
 <tr style='height:20.25pt'>
  <td colspan=63 class=xl6553516225 style='height:20.25pt;font-weight:700;font-size:16.0pt;
  width:2428pt'>（普速）有线通信故障月度分析表</td>
 </tr>
 <tr class=xl6553516225 style='height:13.5pt'>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225 style = "text-align:right;" colspan=2>填报单位：</td>
  <td class=xl6553516225 style = "text-align:left; vertical-align:middle; white-space:normal;" colspan=5 id="belongDepart">${sessionScope.user.organization.name}</td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td colspan=3 style = "text-align:right;" class=xl6553516225>填报日期：</td>
  <td colspan=3 style = "text-align:left;" class=xl6553516225 >${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225>普速有线通信报-3</td>
 </tr>
 <tr style='height:20.25pt'>
  <td rowspan=3 class=xl10316225 style='height:68.25pt;
  width:41pt'>单位名称</td>
  <td colspan=3 rowspan=3 class=xl10316225 style='border-right:1.0pt solid black;
  border-left:none;width:148pt'><img height=91
  src="../wiredMonthFault/wiredMonthFault.files/image001.png"></td>
  <td rowspan=3 class=xl13516225 style='border-bottom:1.0pt solid black;
  width:36pt'>长途通信线路</td>
  <td rowspan=3 class=xl13516225 style='border-bottom:1.0pt solid black;
  width:36pt'>地区通信线路</td>
  <td colspan=18 class=xl13316225 style='border-right:1.0pt solid black;
  border-left:none'>传输与接入网设备</td>
  <td colspan=2 class=xl13116225 style='border-left:none'>同步设备</td>
  <td colspan=6 class=xl13316225 style='border-right:1.0pt solid black;
  border-left:none'>数据设备</td>
  <td colspan=5 class=xl13116225 style='border-left:none'>调度设备</td>
  <td colspan=4 class=xl13116225>会议设备</td>
  <td colspan=3 class=xl13116225 style='border-left:none'>广播设备</td>
  <td colspan=3 class=xl13116225>报话设备</td>
  <td colspan=3 class=xl13116225 style='border-right:1.0pt solid black'>应急通信设备</td>
  <td colspan=5 class=xl13116225 style='border-left:none'>综合视频监控设备</td>
  <td colspan=4 class=xl13116225 style='border-left:none'>电源设备、环境监控设备</td>
  <td rowspan=3 class=xl8416225 style='border-bottom:1.0pt solid black;
  width:43pt'>故障总数（件）</td>
  <td rowspan=3 class=xl8416225 style='border-bottom:1.0pt solid black;
  width:54pt'>故障延时（小时）</td>
  <td rowspan=3 class=xl8416225 style='border-bottom:1.0pt solid black;
  width:54pt'>影响行车（小时）</td>
  <td rowspan=3 class=xl8416225 style='border-bottom:1.0pt solid black;
  width:54pt'>平均延时（小时）</td>
 </tr>
 <tr style='height:20.25pt'>
  <td colspan=2 class=xl12516225 style='border-left:none;width:78pt'>骨干层DWDM<br>
    设备</td>
  <td colspan=2 class=xl12516225 style='width:78pt'>中继层DWDM<br>
    设备</td>
  <td colspan=3 class=xl12716225 style='width:117pt'>骨干层SDH/MSTP<br>
    设备</td>
  <td colspan=3 class=xl12716225 style='width:117pt'>中继层SDH/MSTP<br>
    设备</td>
  <td colspan=5 class=xl12716225 style='border-right:1.0pt solid black;
  width:195pt'>接入层传输设备</td>
  <td colspan=3 class=xl12716225 style='border-left:none;width:117pt'>接入网设备</td>
  <td rowspan=2 class=xl11716225 style='border-bottom:1.0pt solid black;
  width:39pt'>时钟同步设备</td>
  <td rowspan=2 class=xl11716225 style='border-bottom:1.0pt solid black;
  width:39pt'>时间同步设备</td>
  <td rowspan=2 class=xl7816225 style='border-top:none;width:43pt'>骨干网大区节点路由器</td>
  <td rowspan=2 class=xl7816225 style='border-top:none;width:43pt'>局区域网核心层路由器</td>
  <td rowspan=2 class=xl7816225 style='border-top:none;width:43pt'>局区域网汇聚层路由器</td>
  <td rowspan=2 class=xl7816225 style='border-top:none;width:37pt'>接入层路由器</td>
  <td rowspan=2 class=xl12116225 style='border-bottom:1.0pt solid black;
  border-top:none;width:37pt'>交换机</td>
  <td rowspan=2 class=xl7816225  style='border-top:none;width:37pt'>DSLAM设备</td>
  <td rowspan=2 class=xl11416225  style='border-bottom:1.0pt solid black;
  border-top:none;width:37pt'>调度所交换机</td>
  <td rowspan=2 class=xl11416225  style='border-bottom:1.0pt solid black;
  border-top:none;width:37pt'>车站交换机</td>
  <td rowspan=2 class=xl11416225  style='border-bottom:1.0pt solid black;
  border-top:none;width:37pt'>操作台、值班台</td>
  <td rowspan=2 class=xl11416225  style='border-bottom:1.0pt solid black;
  border-top:none;width:37pt'>模拟调度</td>
  <td rowspan=2 class=xl11416225  style='border-bottom:1.0pt solid black;
  border-top:none;width:37pt'>通信记录仪</td>
  <td rowspan=2 class=xl11516225 style='width:34pt'>视频MCU</td>
  <td rowspan=2 class=xl11516225 style='width:34pt'>视频会议终端</td>
  <td rowspan=2 class=xl11516225 style='width:34pt'>音频会议总机（转接机）</td>
  <td rowspan=2 class=xl11516225 style='width:34pt'>音频会议分机</td>
  <td rowspan=2 class=xl11516225 style='width:34pt'>客运广播设备</td>
  <td rowspan=2 class=xl11716225 style='border-bottom:1.0pt solid black;
  width:34pt'>列车广播机</td>
  <td rowspan=2 class=xl11716225 style='width:34pt'>站场广播机</td>
  <td rowspan=2 class=xl12116225 style='border-bottom:1.0pt solid black;
  border-top:none;width:34pt'>话务台</td>
  <td rowspan=2 class=xl11616225 style='border-top:none;width:34pt'>电报交换机</td>
  <td rowspan=2 class=xl11416225 style='border-bottom:1.0pt solid black;
  border-top:none;width:34pt'>电报终端</td>
  <td rowspan=2 class=xl11416225 style='border-bottom:1.0pt solid black;
  border-top:none;width:34pt'>局端中心设备</td>
  <td rowspan=2 class=xl11416225 style='border-bottom:1.0pt solid black;
  border-top:none;width:34pt'>动图现场设备</td>
  <td rowspan=2 class=xl11416225 style='border-bottom:1.0pt solid black;
  border-top:none;width:34pt'>静图终端设备</td>
  <td rowspan=2 class=xl11616225 style='border-top:none;width:35pt'>图像操作控制台</td>
  <td rowspan=2 class=xl11616225 style='border-top:none;width:35pt'>存储设备</td>
  <td rowspan=2 class=xl11616225 style='border-top:none;width:35pt'>编解码设备</td>
  <td rowspan=2 class=xl11616225 style='border-top:none;width:35pt'>摄像机</td>
  <td rowspan=2 class=xl11616225 style='border-top:none;width:35pt'>视频光端机</td>
  <td rowspan=2 class=xl11416225 style='border-bottom:1.0pt solid black;
  border-top:none;width:35pt'>高频开关电源</td>
  <td rowspan=2 class=xl11416225 style='border-bottom:1.0pt solid black;
  border-top:none;width:35pt'>蓄电池</td>
  <td rowspan=2 class=xl11416225 style='border-bottom:1.0pt solid black;
  border-top:none;width:35pt'>逆变器、UPS</td>
  <td rowspan=2 class=xl11416225 style='border-bottom:1.0pt solid black;
  border-top:none;width:35pt'>机房环境监控设备</td>

 </tr>
 <tr style='height:27.75pt'>
  <td class=xl7816225 style='border-left:none;width:39pt'>OTM/OADM</td>
  <td class=xl7816225 style='border-left:none;width:39pt'>OLA/REG</td>
  <td class=xl7816225 style='border-left:none;width:39pt'>OTM/OADM</td>
  <td class=xl7816225 style='border-left:none;width:39pt'>OLA/REG</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>10G</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>2.5G</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>622M/ 155M</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>10G</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>2.5G</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>622M/ 155M</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>2.5G</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>622M/ 155M</td>
  <td class=xl7916225 style='border-top:none;border-left:none;
  width:39pt'>PDH设备</td>
  <td class=xl7916225 style='border-top:none;border-left:none;
  width:39pt'>HDSL设备</td>
  <td class=xl7816225 style='border-top:none;border-left:none;
  width:39pt'>其它</td>
  <td class=xl7916225 style='border-top:none;border-left:none;
  width:39pt'>PCM设备</td>
  <td class=xl7916225 style='border-top:none;border-left:none;
  width:39pt'>OLT设备</td>
  <td class=xl7916225 style='border-top:none;border-left:none;
  width:39pt'>ONU设备</td>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl7716225 style='height:18.75pt;border-top:none;width:41pt'>1</td>
  <td colspan=3 class=xl7716225 style='border-right:1.0pt solid black;border-left:none;width:148pt'>2</td>
  <td class=xl7716225 style='border-left:none'>3</td>
  <td class=xl7716225 style='border-left:none'>4</td>
  <td class=xl7716225 style='border-left:none'>5</td>
  <td class=xl7716225 style='border-left:none'>6</td>
  <td class=xl7716225 style='border-left:none'>7</td>
  <td class=xl7716225 style='border-left:none'>8</td>
  <td class=xl7716225 style='border-left:none'>9</td>
  <td class=xl7716225 style='border-left:none'>10</td>
  <td class=xl7716225 style='border-left:none'>11</td>
  <td class=xl7716225 style='border-left:none'>12</td>
  <td class=xl7716225 style='border-left:none'>13</td>
  <td class=xl7716225 style='border-left:none'>14</td>
  <td class=xl7716225 style='border-left:none'>15</td>
  <td class=xl7716225 style='border-left:none'>16</td>
  <td class=xl7716225 style='border-left:none'>17</td>
  <td class=xl7716225 style='border-left:none'>18</td>
  <td class=xl7716225 style='border-left:none'>19</td>
  <td class=xl7716225 style='border-left:none'>20</td>
  <td class=xl7716225 style='border-left:none'>21</td>
  <td class=xl7716225 style='border-left:none'>22</td>
  <td class=xl7716225 style='border-left:none'>23</td>
  <td class=xl7716225 style='border-left:none'>24</td>
  <td class=xl7716225 style='border-left:none'>25</td>
  <td class=xl7716225 style='border-left:none'>26</td>
  <td class=xl7716225 style='border-left:none'>27</td>
  <td class=xl7716225 style='border-left:none'>28</td>
  <td class=xl7716225 style='border-left:none'>29</td>
  <td class=xl7716225 style='border-left:none'>30</td>
  <td class=xl7716225 style='border-left:none'>31</td>
  <td class=xl7716225 style='border-left:none'>32</td>
  <td class=xl7716225 style='border-left:none'>33</td>
  <td class=xl7716225 style='border-left:none'>34</td>
  <td class=xl7716225 style='border-left:none'>35</td>
  <td class=xl7716225 style='border-left:none'>36</td>
  <td class=xl7716225 style='border-left:none'>37</td>
  <td class=xl7716225 style='border-left:none'>38</td>
  <td class=xl7716225 style='border-left:none'>39</td>
  <td class=xl7716225 style='border-left:none'>40</td>
  <td class=xl7716225 style='border-left:none'>41</td>
  <td class=xl7716225 style='border-left:none'>42</td>
  <td class=xl7716225 style='border-left:none'>43</td>
  <td class=xl7716225 style='border-left:none'>44</td>
  <td class=xl7716225 style='border-left:none'>45</td>
  <td class=xl7716225 style='border-left:none'>46</td>
  <td class=xl7716225 style='border-left:none'>47</td>
  <td class=xl7716225 style='border-left:none'>48</td>
  <td class=xl7716225 style='border-left:none'>49</td>
  <td class=xl7716225 style='border-left:none'>50</td>
  <td class=xl7716225 style='border-left:none'>51</td>
  <td class=xl7716225 style='border-left:none'>52</td>
  <td class=xl7716225 style='border-left:none'>53</td>
  <td class=xl7716225 style='border-left:none'>54</td>
  <td class=xl7716225 style='border-left:none'>55</td>
  <td class=xl7716225 style='border-left:none'>56</td>
  <td class=xl7716225 style='border-left:none'>57</td>
  <td class=xl7716225 style='border-left:none'>58</td>
  <td class=xl7716225 style='border-left:none'>59</td>
  <td class=xl7716225 style='border-left:none'>60</td>
  <td class=xl7716225 style='border-left:none'>61</td>
 </tr>
 <tr style='height:18.75pt'>
  <td rowspan=89 class=xl10916225 style='border-bottom:1.0pt solid black;
  height:1438.95pt'>　</td>
  <td colspan=2 rowspan=5 class=xl10916225>通信责任</td>
  <td class=xl8016225 style='border-left:none'>违章人为</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>维修不良</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>通信施工</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>原因不明</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td colspan=2 rowspan=4 class=xl10916225 style='height:75.0pt'>外单位责任</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>设备不良</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>路内妨害</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>路外妨害</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td colspan=3 class=xl10916225 style='height:18.75pt;border-left:
  none'>非责任</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td colspan=3 class=xl10916225 style='height:18.75pt;border-left:
  none'>合 计</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:18.75pt'>
  <td colspan=3 class=xl10916225 style='height:18.75pt;border-left:
  none'>故障延时</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:16.2pt'>
  <td rowspan=77 class=xl10316225 style='border-bottom:
  1.0pt solid black;height:1213.95pt;border-top:none;width:41pt'>设备厂家故障统计</td>
  <td rowspan=8 class=xl9916225 style='border-bottom:1.0pt solid black;
  border-top:none;width:31pt'>传输</td>
  <td class=xl8016225 style='border-left:none'>华为</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>烽火</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>马可尼</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>北电</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>朗讯</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>NEC</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=6 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:94.5pt;border-top:none;width:31pt'>接入</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>华为</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>烽火</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>朗讯</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>NEC</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=4 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:63.0pt;border-top:none;width:31pt'>同步</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>持久</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>华为</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>惠普</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr  style='height:15.75pt'>
  <td rowspan=4 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:63.0pt;border-top:none;width:31pt'>数据</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>华为</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>思科</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=4 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:63.0pt;border-top:none;width:31pt'>调度</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>佳讯</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>天龙</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=6 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:94.5pt;border-top:none;width:31pt'>会议</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>华为</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>POLYCOM</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>VTEL</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>北京二七厂</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=4 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:63.0pt;border-top:none;width:31pt'>广播</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>天津北海</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>天津先唯</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>南京富成</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=3 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:47.25pt;border-top:none;width:31pt'>电报</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>中软</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>同济</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=8 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:126.0pt;border-top:none;width:31pt'>应急</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>世纪东方</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>佳讯</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>久盛鸿业</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>浙大</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>河南辉煌</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>有恒斯康</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=6 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:94.5pt;border-top:none;width:31pt'>视频监控</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>国铁华晨</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>佳讯</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>世纪东方</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>世纪瑞尔</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>河南辉煌</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=5 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:78.75pt;border-top:none;width:31pt'>电源</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>艾默生</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中达</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>动力源</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=7 class=xl9916225 style='height:110.25pt;
  border-top:none;width:31pt'>蓄电池</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>江苏双登</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>哈尔滨光宇</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>威海文隆</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>曲阜圣阳</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>杭州南都</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>武汉银泰</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=12 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:189.75pt;width:31pt'>动环</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>世纪瑞尔</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>艾默生</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中达</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:16.5pt'>
  <td class=xl8016225 style='height:16.5pt;border-top:none;
  border-left:none'>北京正汇</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>动力源</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>西门子</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>华讯</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>信力隆</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>先唯</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
  <td class="xl7716225 editCell" style='border-left:none'></td>
 </tr>
 <tr class=xl6553516225  style='height:20.1pt'>
  <td  class=xl6553516225 style='height:20.1pt'></td>
  <td colspan = 2 class=xl6553516225>单位负责人：</td>
  <td colspan = 2 class="xl6553516225 fillEditCell" style='text-align:left; white-space: normal;' id="principal"></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225>填报人：</td>
  <td colspan=2 class=xl6553516225 style='text-align:left; white-space: normal;' id="reporter">${sessionScope.user.name}</td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td colspan=2 style='text-align:right;' class=xl6553516225>联系电话：</td>
  <td colspan=3 class="xl6553516225 fillEditCell" style='text-align:left; white-space: normal;' id="phone"></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
 </tr>
 <tr class=xl6553516225 style='height:15.6pt'>
  <td class=xl6553516225>填表说明：</td>
  <td class=xl6553516225>&nbsp1、DWDM 系统OTM站一个方向算一套设备；</td>
 </tr>
 <tr class=xl6553516225 style='height:15.6pt'>
  <td class=xl6553516225></td>
  <td class=xl6553516225>
  &nbsp2、DWDM设备OTM和OADM设备数量直接相加；OLA和REG设备数量直接相加。
  </td>
 </tr>
 <tr class=xl6553516225 style='height:15.6pt'>
 <td class=xl6553516225></td>
  <td class=xl6553516225>
  &nbsp3、SDH 系统同一速率等级的ADM站、TM站和REG站设备数量直接相加。
  </td>
 </tr>
 <tr class=xl6553516225 style='height:15.6pt'>
  <td class=xl6553516225></td>
  <td class=xl6553516225>
  &nbsp4、同步设备、时间设备一套包括天线和节点设备。
  </td>
 </tr>
 <tr class=xl6553516225 style='height:15.6pt'>
  <td class=xl6553516225></td>
  <td class=xl6553516225>
  &nbsp5、请将因“设备不良”而导致的故障数量填入本表下方设备供货厂家相应的空白位置。非表中列出厂家，请填入对应设备“其它”行，并于表后写出具体厂家名称。
  </td>
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
	
	var wiredMonthFault = getSaveDate();
	
	$.post(contextPath + 'wiredMonthFaultAction/addOrUpdate.cn',
			{
				year : $("#year").val(),
				month : $("#month").val(),
				wiredMonthFaults :  JSON.stringify(wiredMonthFault)
			},function(data,status){
				if(status){
					alert("保存成功!");
				}else{
					alert("保存失败!");
				}
			});
}

// 获取保存数据
function getSaveDate() {
	
	var wiredMonthFault = [];
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
			var seq = i - 6;// 表头6行
			
			var obj = new Object();
			
			obj.dataIndex = seq;
			
			obj.trafficLine = $(rowArray[0]).text();
			obj.areaLine = $(rowArray[1]).text();
			
			obj.boneDwdmOTM = $(rowArray[2]).text();
			obj.boneDwdmOLA = $(rowArray[3]).text();
			obj.midDwdmOTM = $(rowArray[4]).text();
			obj.midDwdmOLA = $(rowArray[5]).text();
			obj.boneSdh10G = $(rowArray[6]).text();
			obj.boneSdh25G = $(rowArray[7]).text();
			obj.boneSdh622M = $(rowArray[8]).text();
			obj.midSdh10G = $(rowArray[9]).text();
			obj.midSdh25G = $(rowArray[10]).text();
			obj.midSdh622M = $(rowArray[11]).text();
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
			
			obj.faultTotal = $(rowArray[55]).text();
			obj.timelag = $(rowArray[56]).text();
			obj.affectTrip = $(rowArray[57]).text();
			obj.avgLag = $(rowArray[58]).text();
			
			obj.principal = principal;
			obj.reporter = reporter;
			obj.belongDepart = belongDepart;
			obj.phone = phone;
			
			wiredMonthFault[seq] = obj;
		}
	});
	return wiredMonthFault;
}
</script>
</body>
</html>