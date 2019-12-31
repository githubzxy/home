<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<title>通信设备月度生产计划（完成）及质量报告表</title>
<style>
<!--table
.font527801
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	}
.xl1527801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;}
.xl1527802
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;}
.xl6427801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	background:aliceblue;
	white-space:nowrap;}
.xl6527801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	white-space:nowrap;}
.xl6527802
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	vertical-align:middle;
	white-space:nowrap;}
.xl6627801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	background:aliceblue;
	white-space:normal;}
.xl6727801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl6827801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:normal;}
.xl6927801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl7027801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl7127801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl7227801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;}
.xl7327801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;}
.xl7427801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
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
.xl7527801
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
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
-->

</style>
</head>

<body>
<div id="showDiv">
	<form id="showForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="exportBtn" >导出Excel</button>
</div>
<div id="月度生产报表统计模版_27801" align=center>
<table border=0 cellpadding=0 cellspacing=0 style='border-collapse:
 collapse;table-layout:fixed;width:990px'>
 <col style='width:140px'>
 <col style='width:200px'>
 <col span=2 style='width:40pt'>
 <col style='width:52pt'>
 <col span=4 style='width:40pt'>
 <tr height=27 style='height:20.25pt'>
  <td colspan=9 height=27 class=xl7127801 width=917 style='height:20.25pt;
  width:690pt'>通信设备月度生产计划（完成）及质量报告表</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl6527802 style='height:15.75pt'>填报单位：
  	<span>${requestScope.list[0][6]}</span>
  </td>
  <td class=xl1527801></td>
  <td class=xl1527801></td>
  <td class=xl1527801></td>
  <td colspan=3 class=xl6527801>填报日期：</td>
  <td colspan=2 class=xl7227801>${requestScope.list[0][10]}</td>
 </tr>
 <tr class=xl6427801 height=36 style='height:27.0pt'>
  <td height=36 class=xl6627801 style='height:27.0pt;width:240px'>设备类别</td>
  <td class=xl6627801 width=285 style='border-left:none;width:214pt'>设备名称</td>
  <td class=xl6627801 width=53 style='border-left:none;width:40pt'>单位</td>
  <td class=xl6627801 style='border-left:none;width:60px'>设备总数</td>
  <td class=xl6627801 width=69 style='border-left:none;width:52pt'>本月完成数</td>
  <td class=xl6627801 width=53 style='border-left:none;width:40pt'>合格数</td>
  <td class=xl6627801 width=53 style='border-left:none;width:40pt'>合格比</td>
  <td class=xl6627801 width=53 style='border-left:none;width:40pt'>不合格数</td>
  <td class=xl6627801 width=53 style='border-left:none;width:40pt'>不合格比</td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=10 height=180 class=xl6927801 width=245 style='height:135.0pt;
  border-top:none;width:184pt'>通信线路附属设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>长途光缆/光电综合缆</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>公里</td>
   <c:forEach items="${list[0]}" var="item" begin="0" end="5">
	  <td class="xl6927801" width=53 style='border-top:none;border-left:none;
	  width:40pt'>${item }</td>
  </c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>长途电缆综合</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>公里</td>
	<c:forEach items="${list[1]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>地区光缆</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>公里</td>
  <c:forEach items="${list[2]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>地区电缆</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>公里</td>
  <c:forEach items="${list[3]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>架空线路</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>公里</td>
  <c:forEach items="${list[4]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>电缆交接箱</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>个</td>
  <c:forEach items="${list[5]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>充气机设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[6]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>光缆在线监测系统</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[7]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>区间通话柱</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>个</td>
  <c:forEach items="${list[8]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其他设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[9]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=19 height=342 class=xl6927801 width=245 style='height:256.5pt;
  border-top:none;width:184pt'>传输与接入网设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>各级传输及接入网网管</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[10]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>骨干层DWDM系统上下业务（OTM/OADM)</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[11]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>骨干层DWDM系统光放站（OLA/REG）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[12]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>中继层DWDM系统上下业务站(OTM/OADM)</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[13]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>中继层DWDM系统光放站（OLA/REG）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[14]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>骨干层SDH系统10G设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[15]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>骨干层SDH系统2.5G设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[16]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>骨干层SDH系统622M/155M设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[17]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>中继层SDH系统10G设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[18]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>中继层SDH系统2.5G设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[19]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>中继层SDH系统622M/155M设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[20]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>接入层SDH系统2.5G设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[21]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>接入层SDH系统622M/155M设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[22]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>接入层PDH设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[23]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>OLT设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[24]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>ONU设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[25]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>PCM设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[26]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>HDSL</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[27]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[28]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=2 height=36 class=xl6927801 width=245 style='height:27.0pt;
  border-top:none;width:184pt'>同步设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>时钟同步设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[29]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>时间同步设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[30]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=11 height=198 class=xl6927801 width=245 style='height:148.5pt;
  border-top:none;width:184pt'>数据网设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>骨干网大区节点路由器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[31]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>铁道部区域网接入路由器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[32]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>铁路局区域网核心层路由器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[33]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>铁路局区域网汇聚层路由器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[34]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>铁路局区域网接入层路由器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[35]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>交换机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[36]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>DSLAM设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[37]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>域名系统</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[38]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>网络安全设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[39]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>网管系统</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[40]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[41]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=10 height=180 class=xl6927801 width=245 style='height:135.0pt;
  border-top:none;width:184pt'>调度通信设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>干调交换机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[42]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>干调交换机网管</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[43]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>干调操作台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[44]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>调度所调度交换机（主系统）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[45]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>数字调度系统网管</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[46]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>操作台（触摸）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[47]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>操作台（键控）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[48]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>车站调度交换机（分系统）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[49]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>通信记录仪</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[50]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[51]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=14 height=252 class=xl6927801 width=245 style='height:189.0pt;
  border-top:none;width:184pt'>会议通信设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>视频MCU</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[52]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>视频会议终端</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[53]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>视频会议网管</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[54]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>视频分配设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[55]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>视频监视器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[56]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>录音/录像/图像播放设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[57]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>调音台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[58]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>桌面会议系统</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[59]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>电视机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[60]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>摄像头</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>个</td>
  <c:forEach items="${list[61]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>音频会议总结（转接机）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[62]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>音频会议分机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[63]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>会议功放机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[64]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[65]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=9 height=162 class=xl6927801 width=245 style='height:121.5pt;
  border-top:none;width:184pt'>广播与站场设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>客运广播设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[66]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>列车广播设备（数字）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[67]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>列车广播设备（模拟）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[68]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>站场广播机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[69]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>扩音转接机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[70]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>电话集中机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[71]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>塔钟</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[72]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>子母钟</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[73]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[74]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=8 height=144 class=xl6927801 width=245 style='height:108.0pt;
  border-top:none;width:184pt'>报话设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>话务台（含114、113、117）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[75]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>电报交换机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[76]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>电报交换机网管</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[77]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>电报终端</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[78]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>打印机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[79]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>传真机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[80]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>复印件</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[81]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[82]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=11 height=198 class=xl6927801 width=245 style='height:148.5pt;
  border-top:none;width:184pt'>综合视频监控设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>应急中心设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[83]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>网关、网守、网管设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[84]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>中心操作台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[85]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>显示设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[86]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>局域网及其他附属设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[87]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>静止图像局端设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[88]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>动图现场设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[89]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>海事卫星设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[90]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>静图终端设备（含照相机、手机）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[91]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>应急抢险器材</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[92]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其他设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[93]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=8 height=144 class=xl6927801 width=245 style='height:108.0pt;
  border-top:none;width:184pt'>应急通信设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>网管类服务器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[94]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>图像操作控制台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[95]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>储存设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[96]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>局域网及其他附属设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[97]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>编解码器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[98]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>摄像机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>个</td>
  <c:forEach items="${list[99]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>视频光端机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>端</td>
  <c:forEach items="${list[100]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[101]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=9 height=198 class=xl6927801 width=245 style='height:148.5pt;
  border-top:none;width:184pt'>通信电源与环境监控设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>高频开关电源</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[102]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>蓄电池</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>组</td>
  <c:forEach items="${list[103]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>逆变器、UPS</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[104]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>交、直流配电屏（箱）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[105]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>柴、汽油发动机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[106]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>稳压电源</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[107]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>机房环境集中监控系统网管</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[108]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=54 style='height:40.5pt'>
  <td height=54 class=xl6727801 width=285 style='height:40.5pt;border-top:none;
  border-left:none;width:214pt'>机房环境集中监控系统现场设备（烟温感、门禁、水浸探测器、温湿度传感器、监控采集单元等）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[109]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[110]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=5 height=90 class=xl6927801 width=245 style='height:67.5pt;
  border-top:none;width:184pt'>机房设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>地线</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>组</td>
  <c:forEach items="${list[111]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>空调设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[112]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>消防器材</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>组</td>
  <c:forEach items="${list[113]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>防雷设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>组</td>
  <c:forEach items="${list[114]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>其它设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'></td>
  <c:forEach items="${list[115]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=7 height=126 class=xl6927801 width=245 style='height:94.5pt;
  border-top:none;width:184pt'>无线列调车站设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>车站电台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[116]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>无线调度命令转接器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[117]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>无线车次号接收解码器</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[118]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>通信语音记录仪</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[119]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>外勤便携电台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[120]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>光纤直放站近端机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[121]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>铁塔</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>座</td>
  <c:forEach items="${list[122]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=6 height=108 class=xl6927801 width=245 style='height:81.0pt;
  border-top:none;width:184pt'>无线列调机车设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>机车电台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[123]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>CIR机车综合无线通信设备</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[124]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>LBJ（800M机车电台）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[125]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>列尾司机控制盒</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[126]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>副司机便携电台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[127]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>车长便携电台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>套</td>
  <c:forEach items="${list[128]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=7 height=126 class=xl6927801 width=245 style='height:94.5pt;
  border-top:none;width:184pt'>无线列调区间设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>区间中继器（洞口）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[129]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>区间中继器（洞内）</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[130]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>区间电台</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[131]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>光纤直放站远端机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[132]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>无线直放站</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[133]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>漏泄电缆</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>公里</td>
  <c:forEach items="${list[134]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>铁塔</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>座</td>
  <c:forEach items="${list[135]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td rowspan=5 height=90 class=xl6927801 width=245 style='height:67.5pt;
  border-top:none;width:184pt'>GSMR-R通信设备</td>
  <td class=xl6727801 width=285 style='border-top:none;border-left:none;
  width:214pt'>GSM-R基站</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[136]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>光纤直放站近端机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[137]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>光纤直放站远端机</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>台</td>
  <c:forEach items="${list[138]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>漏泄电缆</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>公里</td>
  <c:forEach items="${list[139]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl6727801 width=285 style='height:13.5pt;border-top:none;
  border-left:none;width:214pt'>铁塔</td>
  <td class=xl6927801 width=53 style='border-top:none;border-left:none;
  width:40pt'>座</td>
  <c:forEach items="${list[140]}" var="item" begin="0" end="5">
		<td class="xl6927801" width=53 style='border-top:none;border-left:none;
		width:40pt'>${item }</td>
	</c:forEach>
 </tr>
 <tr style='height:30px'>
  <td class=xl1527801 style='height:30px;line-height: 30px;'>单位负责人：
	<span style="width: 100px;height:30px;
		display:-moz-inline-box;display:inline-block;">${requestScope.list[0][7]}</span></td>
  <td class=xl6827801 width=285 style='width:214pt;line-height: 30px;'>填报人：
  	<span style="width: 180px;height:30px;
  		display:-moz-inline-box;display:inline-block;">${requestScope.list[0][8]}</span></td>
  <td class=xl7027801 width=53 style='width:40pt'></td>
  <td colspan=2 class=xl7427801>联系电话：</td>
  <td colspan=3 class="xl7527801">${requestScope.list[0][9]}</td>
  <td class=xl1527801></td>
 </tr>
</table>
</div>

<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

//导出Excel
$("#showDiv #exportBtn").click(function() {
	$("#showForm").attr("action", "/kunmingrinms/communicationMonthProductionAction/exportShow.cn");
	$("#showForm").submit();
});

</script>
</body>
</html>

