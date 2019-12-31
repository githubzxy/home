<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<style id="（普速）有线通信系统运用质量月度统计表_20428_Styles">
<!--table
.xl6620428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl6720428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl6820428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:1pt solid windowtext;
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl6920428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1pt solid windowtext;
	white-space:normal;}
.xl7020428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	white-space:normal;
	word-break:break-all;}
.xl7120428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:1pt solid windowtext;
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl7220428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1pt solid windowtext;
	white-space:normal;}
.xl7320428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:1pt solid windowtext;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl7420428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1pt solid windowtext;
	white-space:normal;}
.xl7520428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1pt solid windowtext;
	white-space:normal;}
.xl7620428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border-top:1pt solid windowtext;
	border-right:none;
	border-bottom:1pt solid windowtext;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl7720428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	white-space:normal;}
.xl7820428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
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
.xl7920428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
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
	white-space:normal;
	word-break:break-all;}
.xl8020428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
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
	white-space:normal;}
.xl8120428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
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
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl8220428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
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
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl8320428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl8420428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
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
.xl8620428
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
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
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:normal;}
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

<div id="（普速）有线通信系统运用质量月度统计表_20428" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=1186 class=xl6620428
 style='border-collapse:collapse;table-layout:fixed;width:893pt'>
 <col class=xl6620428 width=40 style='width:30pt'>
 <col class=xl6620428 width=99 style='width:74pt'>
 <col class=xl6620428 width=199 style='width:149pt'>
 <col class=xl6620428 width=53 span=16 style='width:40pt'>
 <tr height=38 style='height:28.5pt'>
  <td colspan=19 height=38 class=xl8320428 width=1186 style='height:28.5pt;
  width:893pt'>（普速）有线通信系统运用质量月度统计表</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl8120428 style='height:24.95pt'>填报单位：</td>
  <td colspan=3 class=xl7020428>${sessionScope.user.organization.name }</td>
  <td colspan=2 class=xl8120428>填报日期：</td>
  <td colspan=2 class="xl8620428" id="userfillDate">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td colspan=3 class=xl8220428>普速有线通信报-1</td>
 </tr>
 <tr class=xl6720428 height=54 style='height:41.1pt'>
  <td rowspan=2 height=87 class=xl7220428 width=40 style='height:66.05pt;
  border-top:none;width:30pt'>序号</td>
  <td rowspan=2 class=xl8420428 width=99 style='border-bottom:1pt solid black;
  border-top:none;width:74pt'>类别</td>
  <td rowspan=2 class=xl8420428 width=199 style='border-bottom:1pt solid black;
  width:149pt'>检查项目</td>
  <td rowspan=2 class=xl8420428 width=53 style='border-bottom:1pt solid black;
  width:40pt'>抽查<br>
    数量</td>
  <td class=xl7120428 width=53 style='width:40pt'>呼叫<br>
    准确率</td>
  <td class=xl7120428 width=53 style='border-top:none;width:40pt'>通话<br>
    良好率</td>
  <td class=xl7120428 width=53 style='border-top:none;width:40pt'>录音<br>
    良好率</td>
  <td class=xl7120428 width=53 style='border-top:none;width:40pt'>时间<br>
    合格率</td>
  <td class=xl7120428 width=53 style='border-top:none;width:40pt'>视频<br>
    良好率</td>
  <td class=xl7220428 width=53 style='border-left:none;width:40pt'>电话<br>
    应答<br>
    合格率</td>
  <td class=xl7220428 width=53 style='border-left:none;width:40pt'>电报<br>
    标准率</td>
  <td class=xl7220428 width=53 style='border-left:none;width:40pt'>电报<br>
    优质率</td>
  <td class=xl7220428 width=53 style='border-left:none;width:40pt'>电报<br>
    时限率</td>
  <td class=xl7220428 width=53 style='border-left:none;width:40pt'>电报<br>
    资料<br>
    准确率</td>
  <td class=xl7220428 width=53 style='border-left:none;width:40pt'>误码<br>
    合格率</td>
  <td class=xl7220428 width=53 style='border-left:none;width:40pt'>光功率合格率</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>延时<br>
    合格率</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>延时<br>
    变化<br>
    合格率</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>丢包<br>
    合格率</td>
 </tr>
 <tr class=xl6720428 height=33 style='height:24.95pt'>
  <td height=33 class=xl7120428 width=53 style='height:24.95pt;border-top:none;
  width:40pt'>%</td>
  <td class=xl7120428 width=53 style='border-top:none;width:40pt'>%</td>
  <td class=xl7120428 width=53 style='border-top:none;width:40pt'>%</td>
  <td class=xl7120428 width=53 style='border-top:none;width:40pt'>%</td>
  <td class=xl7120428 width=53 style='border-top:none;width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
  <td class=xl7220428 width=53 style='border-top:none;border-left:none;
  width:40pt'>%</td>
 </tr>
 <tr class="editRow" height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>1</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>调度</td>
  <td class=xl7420428 style='border-top:none'>呼叫与通话试验</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>2</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>行车录音</td>
  <td class=xl7420428 style='border-top:none'>录音完整清晰度、时间检查</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>3</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>会议</td>
  <td class=xl7420428 style='border-top:none'>图像监视、声音监听</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>4</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>电话</td>
  <td class=xl7420428 style='border-top:none'>114应答、报号时间</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>5</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>电报</td>
  <td class=xl7520428 width=199 style='border-top:none;width:149pt'>标准率，优质率，时限率，站名略号、统称语、业务资料准确率</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>6</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>应急</td>
  <td class=xl7420428 style='border-top:none'>时限合格，图像监视、声音监听</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>7</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>传输</td>
  <td class=xl7520428 width=199 style='border-top:none;width:149pt'>误码、光功率</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td> 
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>    
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>8</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>数据</td>
  <td class=xl7420428 style='border-top:none'>延时、延时变化、丢包测试</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td> 
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>    
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>    
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
  <td class="xl6920428 editCell doubleCell" style='border-top:none;border-left:none'></td>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>9</td>
  <td class=xl7620428 width=99 style='border-top:none;border-left:none;
  width:74pt'>综合视频监控</td>
  <td class=xl6920428 style='border-top:none'>图像质量</td>
  <td class="xl6820428 editCell intCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td> 
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>    
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>    
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
  <td class="xl6820428 editCell doubleCell" style='border-top:none'></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl6620428 style='height:24.95pt'></td>
  <td class=xl6620428></td>
  <td class=xl7720428>填报人：</td>
  <td colspan=3 class="xl7020428" id="userId">${sessionScope.user.name}</td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td colspan=2 class=xl8020428>联系电话：</td>
  <td colspan=2 class="xl7920428 fillEditCell" id="phone"></td> <!-- ${requestScope.result[0][65] }  根据后台返回数据而定 -->
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
  <td class=xl6620428></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/report/reportValidate.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

$(document).ready(function(){
	initElementAttr();
	bindAllEvent();
});

//初始化.editCell的属性允许编辑
function initElementAttr() {
	$(".editCell").attr("contenteditable", "true");
	$(".fillEditCell").attr("contenteditable", "true");
}

//绑定事件
function bindAllEvent() {
	$(".editCell").mouseover(highlightRow);
	$("#saveBtn").click(saveBtn);
}

//高亮行
function highlightRow() {
	$(".editCell").removeClass("activeRow");
	$(this).addClass("activeRow");
	$(this).siblings(".editCell").addClass("activeRow");
}

function saveBtn() {
	
	if(!validateIntNumber($(".editRow .intCell"))){//验证整数单元格
		alert("请输入整数！");
		return false;
	};
	
	if(!validateDoubleNumber($(".editRow .doubleCell"))){//验证浮点数单元格
		alert("请输入有效的非负数字！");
		return false;
	};
	//验证联系电话
// 	if(!validatePhone($("#phone"))){
// 		return;
// 	}
	
	var commSysUsingQuality = getSaveData();
	$.post(contextPath + 'wiredCommSysUsingQualityAction/add.cn',
			{
				year : $("#year").val(),
				month : $("#month").val(),
				commSysUsingQuality :  JSON.stringify(commSysUsingQuality)
			},function(data,status){
				if(status){
					alert("保存成功!");
				}else{
					alert("保存失败!");
				}
			},'json');
}


//获取保存数据
function getSaveData() {
	var commSysUsingQuality=[];
	
	var userfillDate=$("#userfillDate").html();//用户填报日期
	var userId = $("#userId").html();// 填报人
	var orgId = "${sessionScope.user.organization.id}";// 填报单位id
	var phone = $("#phone").html();// 联系电话
	
	$("table .editRow").each(function(i) {
		var rowArr = $(this).children();
		if(rowArr && rowArr.length != 0) {
			var row=[];
			row[0]=$(rowArr[0]).text();//序号
			row[1]=$(rowArr[1]).text();//类别
			row[2]=$(rowArr[2]).text();//检查项目
			row[3]=$(rowArr[3]).text();//抽查数量
			row[4]=$(rowArr[4]).text();//呼叫准确率
			row[5]=$(rowArr[5]).text();//通话良好率
			row[6]=$(rowArr[6]).text();//录音良好率
			row[7]=$(rowArr[7]).text();//时间合格率
			row[8]=$(rowArr[8]).text();//视频良好率
			row[9]=$(rowArr[9]).text();//电话应答合格率
			row[10]=$(rowArr[10]).text();//电报标准率
			row[11]=$(rowArr[11]).text();//电报优质率
			row[12]=$(rowArr[12]).text();//电报时限率
			row[13]=$(rowArr[13]).text();//电报资料准确率
			row[14]=$(rowArr[14]).text();//误码合格率
			row[15]=$(rowArr[15]).text();//光功率合格率
			row[16]=$(rowArr[16]).text();//延时合格率
			row[17]=$(rowArr[17]).text();//延时变化合格率
			row[18]=$(rowArr[18]).text();//丢包合格率
			
			row[19]=orgId;
			row[20]=userId;
			row[21]=phone;
			row[22]=userfillDate;
			
			commSysUsingQuality[i]=row;
		}
	});
	return commSysUsingQuality;
}
</script>
</body>
</html>