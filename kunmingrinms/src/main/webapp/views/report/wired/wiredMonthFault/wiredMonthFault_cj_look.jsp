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
</style>
</head>
<body>
<div>
	<form id="showForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="exportBtn" >导出Excel</button>
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
  <td colspan=3 style = "text-align:left;" class=xl6553516225 >${requestScope.result[0][66]}</td>
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
  src="../views/report/wired/wiredMonthFault/wiredMonthFault.files/image001.png"></td>
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
  <c:if test="${empty result[0]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[0]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>维修不良</td>
  <c:if test="${empty result[1]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[1]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>通信施工</td>
  <c:if test="${empty result[2]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[2]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>原因不明</td>
  <c:if test="${empty result[3]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[3]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[4]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[4]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td colspan=2 rowspan=4 class=xl10916225 style='height:75.0pt'>外单位责任</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>设备不良</td>
  <c:if test="${empty result[5]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[5]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>路内妨害</td>
  <c:if test="${empty result[6]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[6]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>路外妨害</td>
  <c:if test="${empty result[7]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[7]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td class=xl8016225 style='height:18.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[8]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[8]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td colspan=3 class=xl10916225 style='height:18.75pt;border-left:
  none'>非责任</td>
  <c:if test="${empty result[9]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[9]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td colspan=3 class=xl10916225 style='height:18.75pt;border-left:
  none'>合 计</td>
  <c:if test="${empty result[10]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[10]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:18.75pt'>
  <td colspan=3 class=xl10916225 style='height:18.75pt;border-left:
  none'>故障延时</td>
  <c:if test="${empty result[11]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[11]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:16.2pt'>
  <td rowspan=77 class=xl10316225 style='border-bottom:
  1.0pt solid black;height:1213.95pt;border-top:none;width:41pt'>设备厂家故障统计</td>
  <td rowspan=8 class=xl9916225 style='border-bottom:1.0pt solid black;
  border-top:none;width:31pt'>传输</td>
  <td class=xl8016225 style='border-left:none'>华为</td>
  <c:if test="${empty result[12]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[12]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[13]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[13]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>烽火</td>
  <c:if test="${empty result[14]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[14]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>马可尼</td>
  <c:if test="${empty result[15]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[15]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>北电</td>
  <c:if test="${empty result[16]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[16]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>朗讯</td>
  <c:if test="${empty result[17]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[17]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>NEC</td>
  <c:if test="${empty result[18]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[18]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[19]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[19]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=6 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:94.5pt;border-top:none;width:31pt'>接入</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>华为</td>
  <c:if test="${empty result[20]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[20]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[21]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[21]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>烽火</td>
 <c:if test="${empty result[22]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[22]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>朗讯</td>
  <c:if test="${empty result[23]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[23]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>NEC</td>
  <c:if test="${empty result[24]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[24]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[25]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[25]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=4 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:63.0pt;border-top:none;width:31pt'>同步</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>持久</td>
  <c:if test="${empty result[26]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[26]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>华为</td>
  <c:if test="${empty result[27]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[27]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>惠普</td>
  <c:if test="${empty result[28]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[28]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[29]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[29]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr  style='height:15.75pt'>
  <td rowspan=4 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:63.0pt;border-top:none;width:31pt'>数据</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>华为</td>
  <c:if test="${empty result[30]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[30]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[31]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[31]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>思科</td>
  <c:if test="${empty result[32]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[32]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[33]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[33]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=4 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:63.0pt;border-top:none;width:31pt'>调度</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>佳讯</td>
  <c:if test="${empty result[34]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[34]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <c:if test="${empty result[35]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[35]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>天龙</td>
  <c:if test="${empty result[36]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[36]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[37]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[37]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=6 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:94.5pt;border-top:none;width:31pt'>会议</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>华为</td>
  <c:if test="${empty result[38]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[38]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[39]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[39]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>POLYCOM</td>
  <c:if test="${empty result[40]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[40]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>VTEL</td>
  <c:if test="${empty result[41]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[41]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>北京二七厂</td>
  <c:if test="${empty result[42]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[42]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[43]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[43]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=4 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:63.0pt;border-top:none;width:31pt'>广播</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>天津北海</td>
  <c:if test="${empty result[44]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[44]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>天津先唯</td>
  <c:if test="${empty result[45]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[45]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>南京富成</td>
  <c:if test="${empty result[46]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[46]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[47]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[47]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=3 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:47.25pt;border-top:none;width:31pt'>电报</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>中软</td>
  <c:if test="${empty result[48]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[48]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>同济</td>
  <c:if test="${empty result[49]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[49]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[50]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[50]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=8 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:126.0pt;border-top:none;width:31pt'>应急</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>世纪东方</td>
  <c:if test="${empty result[51]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[51]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <c:if test="${empty result[52]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[52]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>佳讯</td>
  <c:if test="${empty result[53]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[53]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>久盛鸿业</td>
  <c:if test="${empty result[54]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[54]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>浙大</td>
  <c:if test="${empty result[55]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[55]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>河南辉煌</td>
  <c:if test="${empty result[56]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[56]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>有恒斯康</td>
  <c:if test="${empty result[57]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[57]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[58]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[58]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=6 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:94.5pt;border-top:none;width:31pt'>视频监控</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>国铁华晨</td>
  <c:if test="${empty result[59]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[59]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>佳讯</td>
  <c:if test="${empty result[60]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[60]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>世纪东方</td>
  <c:if test="${empty result[61]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[61]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>世纪瑞尔</td>
  <c:if test="${empty result[62]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[62]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>河南辉煌</td>
  <c:if test="${empty result[63]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[63]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[64]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[64]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=5 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:78.75pt;border-top:none;width:31pt'>电源</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>艾默生</td>
  <c:if test="${empty result[65]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[65]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中达</td>
  <c:if test="${empty result[66]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[66]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[67]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[67]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>动力源</td>
  <c:if test="${empty result[68]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[68]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[69]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[69]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=7 class=xl9916225 style='height:110.25pt;
  border-top:none;width:31pt'>蓄电池</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>江苏双登</td>
  <c:if test="${empty result[70]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[70]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>哈尔滨光宇</td>
  <c:if test="${empty result[71]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[71]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>威海文隆</td>
  <c:if test="${empty result[72]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[72]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>曲阜圣阳</td>
  <c:if test="${empty result[73]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[73]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>杭州南都</td>
  <c:if test="${empty result[74]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[74]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>武汉银泰</td>
  <c:if test="${empty result[75]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[75]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[76]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[76]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td rowspan=12 class=xl9916225 style='border-bottom:1.0pt solid black;
  height:189.75pt;width:31pt'>动环</td>
  <td class=xl8016225 style='border-top:none;border-left:none'>世纪瑞尔</td>
  <c:if test="${empty result[77]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[77]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>艾默生</td>
  <c:if test="${empty result[78]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[78]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中达</td>
  <c:if test="${empty result[79]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[79]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中兴</td>
  <c:if test="${empty result[80]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[80]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>中软</td>
  <c:if test="${empty result[81]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[81]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:16.5pt'>
  <td class=xl8016225 style='height:16.5pt;border-top:none;
  border-left:none'>北京正汇</td>
  <c:if test="${empty result[82]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[82]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>动力源</td>
  <c:if test="${empty result[83]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[83]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>西门子</td>
  <c:if test="${empty result[84]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[84]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>华讯</td>
  <c:if test="${empty result[85]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[85]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>信力隆</td>
  <c:if test="${empty result[86]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[86]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr  style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>先唯</td>
  <c:if test="${empty result[87]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[87]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr style='height:15.75pt'>
  <td class=xl8016225 style='height:15.75pt;border-top:none;
  border-left:none'>其它</td>
  <c:if test="${empty result[88]}">
  	<c:forEach var="item" begin="0" end="58">
  		<td class="xl7716225 " style='border-left:none'></td>
  	</c:forEach>
  </c:if>
  <c:forEach items="${requestScope.result[88]}" varStatus="i" var="item" begin="0" end="58">
  	<td class="xl7716225 " style='border-left:none'>${item}</td>
  </c:forEach>
 </tr>
 <tr class=xl6553516225  style='height:20.1pt'>
  <td  class=xl6553516225 style='height:20.1pt'></td>
  <td colspan = 2 class=xl6553516225>单位负责人：</td>
  <td colspan = 2 class="xl6553516225" style='text-align:left; white-space: normal;' id="principal">${requestScope.result[0][61]}</td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225>填报人：</td>
  <td colspan=2 class=xl6553516225 style='text-align:left; white-space: normal;' id="reporter">${requestScope.result[0][63]}</td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td class=xl6553516225></td>
  <td colspan=2 style='text-align:right;' class=xl6553516225>联系电话：</td>
  <td colspan=3 class="xl6553516225" style='text-align:left; white-space: normal;' id="phone">${requestScope.result[0][65]}</td>
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
});

$("#exportBtn").click(function() {
	$("#showForm").attr("action", "/kunmingrinms/wiredMonthFaultAction/exportWorkShop.cn");
	$("#showForm").submit();
});
</script>
</body>
</html>