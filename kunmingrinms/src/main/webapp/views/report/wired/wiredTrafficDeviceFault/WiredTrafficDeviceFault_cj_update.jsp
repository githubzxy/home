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
<style id="（普速）有线通信设备故障(事故）汇总表_16088_Styles">
<!--table
.xl6916088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:16.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:bottom;
	white-space:normal;}
.xl7016088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Helv, sans-serif;
	text-align:general;
	vertical-align:bottom;
	white-space:normal;}
.xl7116088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Helv, sans-serif;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl7216088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Helv, sans-serif;
	text-align:general;
	vertical-align:bottom;
	white-space:normal;}
.xl7316088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Helv, sans-serif;
	text-align:general;
	vertical-align:bottom;
	white-space:normal;}
.xl7416088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Helv, sans-serif;
	text-align:general;
	vertical-align:middle;
	white-space:normal;}
.xl7516088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Helv, sans-serif;
	text-align:general;
	vertical-align:top;
	white-space:normal;}
.xl7616088
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
	white-space:normal;}
.xl7716088
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
.xl7816088
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
.xl7916088
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
	border-top:none;
	border-right:none;
	border-bottom:1pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl8016088
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
.xl8116088
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
.xl8216088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl8316088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl8416088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;
	layout-flow:vertical-ideographic;}
.xl8516088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;
	layout-flow:vertical-ideographic;}
.xl8616088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl8716088
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
	vertical-align:top;
	white-space:normal;}
.xl8816088
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
	vertical-align:top;
	border-top:1pt solid windowtext;
	border-right:1pt solid windowtext;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl8916088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9016088
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
	vertical-align:top;
	border-top:1pt solid windowtext;
	border-right:1pt solid windowtext;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl9116088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9216088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9316088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9416088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9516088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9616088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9716088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9816088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl9916088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl10016088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl10116088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl10216088
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
	vertical-align:top;
	border:1pt solid windowtext;
	white-space:normal;}
.xl10316088
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
.xl10416088
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
.xl10516088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
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
.xl10616088
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
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
.xl10716088
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
	white-space:normal;}
.xl10816088
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
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl10916088
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
.xl11016088
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
.xl11116088
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
	white-space:normal;}
.xl11216088
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
	white-space:normal;
	layout-flow:vertical-ideographic;}
.xl11316088
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
.xl11416088
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
	white-space:normal;
	layout-flow:vertical-ideographic;}
.xl11616088
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
-->

.editCell{ 
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
.notEditCell{ 
 	cursor : default;
 	background-color: #fff;
}
a{
	text-decoration:none;
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
	<button id="exportBtn" >导出Excel</button>
</div>

<div id="（普速）有线通信设备故障(事故）汇总表_16088" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=1186 class=xl7016088
 style='border-collapse:collapse;table-layout:fixed;width:952pt'>
 <col class=xl7116088 width=85 span=2 style='width:64pt'>
 <col class=xl7016088 width=85 span=2 style='width:64pt'>
 <col class=xl7216088 width=109 span=2 style='width:82pt'>
 <col class=xl7216088 width=85 style='width:64pt'>
 <col class=xl7216088 width=181 span=2 style='width:136pt'>
 <col class=xl7016088 width=181 style='width:136pt'>
 <tr class=xl6916088 height=37 style='height:27.95pt'>
  <td colspan=11 height=37 class=xl11316088 width=1186 style='height:27.95pt;
  width:892pt'>（普速）有线通信设备故障(事故）汇总表</td>
 </tr>
 <tr class=xl6916088 height=26 style='height:20.1pt'>
  <td colspan=2 height=26 class=xl11616088 style='height:20.1pt'>填报单位：</td>
  <td class='xl7616088' id="belongDepart">${sessionScope.user.organization.name }</td>
  <td class=xl10516088></td>
  <td class=xl7716088>填报日期：</td>
  <td class='xl7816088' id="userfillDate">${userfillDate }</td>
  <td class=xl7916088></td>
  <td class=xl7916088></td>
  <td class=xl10616088></td>
  <td class=xl10416088>普速有线通信报-7</td>
 </tr>
 <tr class=xl7316088 height=37 style='height:27.95pt'>
  <td height=37 class=xl8016088 width=85 style='height:27.95pt;width:64pt'>故障类别</td>
  <td class=xl8016088 width=85 style='border-left:none;width:64pt'>设备名称</td>
  <td class=xl8016088 width=85 style='border-left:none;width:64pt'>设备厂家</td>
  <td class=xl8016088 width=85 style='border-top:none;border-left:none;width:64pt'>故障地点</td>
  <td class=xl8016088 width=109 style='border-top:none;border-left:none;width:82pt'>发生时间</td>
  <td class=xl8016088 width=109 style='border-top:none;border-left:none;width:82pt'>恢复时间</td>
  <td class=xl8016088 width=85 style='border-top:none;border-left:none;width:64pt'>故障延时</td>
  <td class=xl8016088 width=181 style='border-top:none;border-left:none;width:136pt'>故障现象及影响范围</td>
  <td class=xl8016088 width=181 style='border-top:none;border-left:none;width:136pt'>故障原因及处理过程</td>
  <td class=xl8116088 width=181 style='border-left:none;width:136pt'>定责类型（故障、事故）</td>
  <td class=xl8116088 width=100 style='border-left:none;width:100pt'>操作</td>
 </tr>
 <c:forEach items="${requestScope.result1}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass1" style='height:38px'>
			<c:if test="${i.index==0 }">
				  <td rowspan=${rowSpan1 } class='xl11416088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,1);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,1);">增加</a> <a href="JavaScript:" onclick="delTr(this,1);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result2}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass2" style='height:38px'>
			<c:if test="${i.index==0 }">
				  <td rowspan=${rowSpan2 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;text-align:center;vertical-align:middle;'>
					<a href="JavaScript:" onclick="addTr(this,2);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;text-align:center;vertical-align:middle;'>
					<a href="JavaScript:" onclick="addTr(this,2);">增加</a> <a href="JavaScript:" onclick="delTr(this,2);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result3}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass3" style='height:38px'>
			<c:if test="${i.index==0 }">
				  <td rowspan=${rowSpan3 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,3);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,3);">增加</a> <a href="JavaScript:" onclick="delTr(this,3);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
 <c:forEach items="${requestScope.result4}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass4" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan4 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,4);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,4);">增加</a> <a href="JavaScript:" onclick="delTr(this,4);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
 <c:forEach items="${requestScope.result5}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass5" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan5 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,5);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,5);">增加</a> <a href="JavaScript:" onclick="delTr(this,5);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result6}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass6" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan6 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,6);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,6);">增加</a> <a href="JavaScript:" onclick="delTr(this,6);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result7}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass7" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan7 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,7);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,7);">增加</a> <a href="JavaScript:" onclick="delTr(this,7);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result8}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass8" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan8 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,8);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,8);">增加</a> <a href="JavaScript:" onclick="delTr(this,8);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result9}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass9" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan9 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,9);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,9);">增加</a> <a href="JavaScript:" onclick="delTr(this,9);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result10}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass10" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan10 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,10);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,10);">增加</a> <a href="JavaScript:" onclick="delTr(this,10);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result11}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass11" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan11 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,11);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,11);">增加</a> <a href="JavaScript:" onclick="delTr(this,11);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
  <c:forEach items="${requestScope.result12}" varStatus="i" var="itemRow">
 	<tr class="xl7516088 faultClass12" style='height:38px'>
			<c:if test="${i.index==0 }">
				 <td rowspan=${rowSpan12 } class='xl11216088 editCell notEditCell' width=85 style='width:64pt'>${itemRow[0] }</td>
			</c:if>
			<td class='xl8416088 editCell' width=85 style='width:64pt'>${itemRow[1] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[2] }</td>
			<td class='xl9716088 editCell' width=85 style='width:64pt'>${itemRow[3] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[4] }</td>
			<td class='xl10216088 editCell' width=109 style='width:82pt'>${itemRow[5] }</td>
			<td class='xl10216088 editCell' width=85 style='width:64pt'>${itemRow[6] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[7] }</td>
			<td class='xl10216088 editCell' width=181 style='width:136pt'>${itemRow[8] }</td>
			<td class='xl9716088 editCell' width=181 style='width:136pt'>${itemRow[9] }</td>
			<c:if test="${i.index==0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,12);">增加</a>
				</td>
			</c:if>
			<c:if test="${i.index!=0 }">
				 <td class=xl9716088 width=80 style='width:60pt;vertical-align:middle;text-align:center;'>
					<a href="JavaScript:" onclick="addTr(this,12);">增加</a> <a href="JavaScript:" onclick="delTr(this,12);">删除</a>
				</td>
			</c:if>
 	</tr>
  </c:forEach>
 <tr class=xl7416088 height=26 style='height:20.1pt'>
  <td colspan=2 height=26 class=xl10916088 style='height:20.1pt'>单位负责人：</td>
  <td class='xl10716088 fillEditCell'  id="principal">${principal }</td>
  <td class=xl10316088></td>
  <td class=xl10816088 style='border-top:none'></td>
  <td class=xl10916088 style='border-top:none'>填报人：</td>
  <td class='xl10716088 fillEditCell' id="reporter">${reporter }</td>
  <td class=xl11016088 width=181 style='width:136pt'>联系电话：</td>
  <td class='xl11116088 fillEditCell' width=181 style='width:136pt' id="phone">${phone }</td>
  <td class=xl10316088></td>
 </tr>
</table>

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
	$(".notEditCell").attr("contenteditable", "false");
}

//绑定事件
function bindAllEvent() {
	$(".editCell").mouseover(highlightRow);
	$("#saveBtn").click(saveBtn);
	$("#exportBtn").click(exportBtn);
}

//高亮行
function highlightRow() {
	$(".editCell").removeClass("activeRow");
	$(this).addClass("activeRow");
	$(this).siblings(".editCell").addClass("activeRow");
	$(".notEditCell").removeClass("activeRow");
}

function addTr(clickObj,id){
	var curLineClass='.faultClass'+id;
	var line="<tr class='xl7516088 faultClass"+id+"'style='height:38px'>"
				+ "<td class='xl8216088 editCell' width=85 style='width:64pt'></td>"
				+ "<td class='xl8216088 editCell' width=85 style='width:64pt'></td>"
				+ "<td class='xl8216088 editCell' width=85 style='width:64pt'></td>"
				+ "<td class='xl8916088 editCell' width=109 style='width:82pt'></td>"
				+ "<td class='xl8916088 editCell' width=109 style='width:82pt'></td>"
				+ "<td class='xl9116088 editCell' width=85 style='width:64pt'></td>"
				+ "<td class='xl8216088 editCell' width=181 style='width:136pt'></td>"
				+ "<td class='xl8216088 editCell' width=181 style='width:136pt'></td>"
				+ "<td class='xl8216088 editCell' width=181 style='width:136pt'></td>"
				+ "<td class='xl8016088' width=80 style='width:60pt;text-align:center;'>"
				+	"<a href='JavaScript:' onclick='addTr(this,"+id+");'>增加</a> "
				+	"<a href='JavaScript:' onclick='delTr(this,"+id+");'>删除</a>"
				+ "</td>"
				+ "</tr>";
	var curLine=$(clickObj).parent().parent();
	curLine.after(line);//当前行后追加一行
	
	//首列合并单元格数量加1
	var mergeCell=$($(curLineClass).get(0)).children("td").get(0);//同类的第1行的第1列
	$(mergeCell).attr("rowspan",parseInt($(mergeCell).attr("rowspan"))+1);

	initElementAttr();
	$(".editCell").mouseover(highlightRow);
// 	bindAllEvent();
}

function delTr(clickObj,id){
	var curLineClass='.faultClass'+id;
	
	var firstCell=$($(curLineClass).get(0)).children("td").get(0);//同类的第1行的第1列
	var rowspanNum=parseInt($(firstCell).attr("rowspan"));//行合并数
	var text=$(firstCell).text();//文本
	
	var curLine=$(clickObj).parent().parent();
	curLine.remove();
	
	firstCell=$($(curLineClass).get(0)).children("td").get(0);//再次获取同类的第1行的第1列
	if(firstCell){
		if(firstCell.hasAttribute("rowspan")){//有合并单元格属性，首列合并单元格数量减1
			$(firstCell).attr("rowspan",rowspanNum-1);
		}else{//无合并单元格属性,第一个单元格前面追加一个
			rowspanNum=rowspanNum-1;
			var tdAdd="<td rowspan="+rowspanNum+" height=66 class='xl11216088 editCell notEditCell' width=85 style='height:50pt;width:64pt'>"+text+"</td>"
			$(firstCell).before(tdAdd);
		}
	}
}


function saveBtn() {
	// 校验数据的长度
	if(!checkDataLength($(".editCell"))){
		alert("数据输入过长，最多250个字符！");
		return;
	}
	
	var wiredTrafficDeviceFault=getSaveData();
// 	console.log(wiredTrafficDeviceFault);
// 	console.log($("#year").val());
// 	console.log($("#month").val());
	$.post(contextPath + 'wiredTrafficDeviceFaultAction/update.cn',
			{
				year : $("#year").val(),
				month : $("#month").val(),
				wiredTrafficDeviceFault :  JSON.stringify(wiredTrafficDeviceFault)
			},function(data,status){
				if(data!=null){
					alert(data);
					return;
				}
				alert("保存成功");
			},'json');
}

//获取保存数据
function getSaveData() {
	var dataArr1=getSaveDataByClass(".faultClass1", "1");//【通信线路及附属设备】的相关数据
	var dataArr2=getSaveDataByClass(".faultClass2", "2");//【传输与接入网设备】的相关数据
	var dataArr3=getSaveDataByClass(".faultClass3", "3");//【同步设备】的相关数据
	var dataArr4=getSaveDataByClass(".faultClass4", "4");//【数据网设备】的相关数据
	var dataArr5=getSaveDataByClass(".faultClass5", "5");//【调度通信设备】的相关数据
	var dataArr6=getSaveDataByClass(".faultClass6", "6");//【会议通信设备】的相关数据
	var dataArr7=getSaveDataByClass(".faultClass7", "7");//【广播与站场设备】的相关数据
	var dataArr8=getSaveDataByClass(".faultClass8", "8");//【报话设备】的相关数据
	var dataArr9=getSaveDataByClass(".faultClass9", "9");//【应急通信设备】的相关数据
	var dataArr10=getSaveDataByClass(".faultClass10", "10");//【综合视频监控设备】的相关数据
	var dataArr11=getSaveDataByClass(".faultClass11", "11");//【通信电源与环境监控设备】的相关数据
	var dataArr12=getSaveDataByClass(".faultClass12", "12");//【机房设备】的相关数据
	//合并数组
	var dataArr=dataArr1.concat(dataArr2,dataArr3,dataArr4,dataArr5,dataArr6,dataArr7,dataArr8,dataArr9,dataArr10,dataArr11,dataArr12);
	return dataArr;
}

/**
 * 根据样式类获取保存数据(className：类选择器中的类，faultCode：类别代码，一个故障类别对应一个代码)
 */
function getSaveDataByClass(className,faultCode){//
	var trArr=[];//有className类的相关行数据
	$(className).each(function(i) {
		var tdArr=[];//单元格数据
		var row = $(this).children(".editCell");
		var length=row.length;
		for(var j=0;j<length;j++){
			tdArr[j]=$(row[j]).text();
		}
		
		tdArr[length++]=faultCode;//类别代码
		tdArr[length++]=i+1;//类别代码
		tdArr[length++]="${sessionScope.user.organization.id}";// 填报单位id
		tdArr[length++]=$("#userfillDate").text();//用户填报日期
		tdArr[length++]=$("#principal").text();// 负责人
		tdArr[length++]=$("#reporter").text();// 填报人
		tdArr[length++]=$("#phone").text();// 联系电话
		tdArr[length++]=$("#belongDepart").text();// 填报单位名
		
		if(i>0){//第二行开始，每行少一个元素，手动补上
			tdArr.unshift(trArr[0][0]);
		}
		trArr[i]=tdArr;
	});
	return trArr;
}

// 导出
function exportBtn() {
	// 校验数据的长度
	if(!checkDataLength($(".editCell"))){
		alert("数据输入过长，最多250个字符！");
		return;
	}
	
	var wiredTrafficDeviceFault=getSaveData();
	$.post(contextPath + 'wiredTrafficDeviceFaultAction/update.cn',
			{
				year : $("#year").val(),
				month : $("#month").val(),
				wiredTrafficDeviceFault :  JSON.stringify(wiredTrafficDeviceFault)
			},function(data,status){
				if(data!=null){
					alert(data);
					return;
				}
				$("#addForm").attr("action", "/kunmingrinms/wiredTrafficDeviceFaultAction/exportWorkShop.cn");
				$("#addForm").submit();
			},'json');
}

</script>

</div>
</html>
