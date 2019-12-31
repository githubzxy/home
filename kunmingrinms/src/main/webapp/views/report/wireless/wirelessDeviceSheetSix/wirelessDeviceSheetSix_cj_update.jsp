<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>修改CIR故障统计分析</title>
<style id="普铁无线报表报表模板_25841_Styles">
<!--table
.xl9725841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl9825841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl9925841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;}
.xl10025841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10125841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10225841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10325841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:nowrap;}
.xl10425841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl10525841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;}
.xl10625841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:right;
	vertical-align:middle;
	white-space:nowrap;}
.xl10725841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
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
.xl10825841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
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
.xl10925841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:12.0pt;
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
.xl11025841
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
	white-space:nowrap;}
.xl11125841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
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
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl11225841
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
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
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
-->

.editCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
 	white-space:normal;
}

.fillEditCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
 	white-space:normal;
}

.activeRow {
	background-color: #CAFBCE;
}

a{
	color : black;
	text-decoration: none
}

a:hover {
 	color: red;
 	text-decoration: none;
}

</style>
</head>

<body>
<div id="updateDiv">
	<form id="updateForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="saveBtn">保存</button>
	<button id="exportBtn" >导出Excel</button>
</div>
<div id="普铁无线报表报表模板_25841" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=1150 class=xl9725841
 style='border-collapse:collapse;table-layout:fixed;' id="table">
 <col class=xl9725841 width=49 style='width:37pt'>
 <col class=xl9825841 width=49 style='width:37pt'>
 <col class=xl9725841 width=49 style='width:37pt'>
 <col class=xl9825841 width=49 span=2 style='width:37pt'>
 <col class=xl9825841 width=138 style='width:104pt'>
 <col class=xl9725841 width=37 span=11 style='width:28pt'>
 <col class=xl9725841 width=180 style='width:135pt'>
 <col class=xl9925841 width=101 style='width:76pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl9725841 width=49 style='height:15.0pt;width:37pt'></td>
  <td class=xl9825841 width=49 style='width:37pt'></td>
  <td class=xl9725841 width=49 style='width:37pt'></td>
  <td class=xl9825841 width=49 style='width:37pt'></td>
  <td class=xl9825841 width=49 style='width:37pt'></td>
  <td class=xl9825841 width=138 style='width:104pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=37 style='width:28pt'></td>
  <td class=xl9725841 width=180 style='width:135pt'></td>
  <td class=xl9725841 width=101 style='width:76pt'></td>
 </tr>
 <tr height=29 style='height:21.95pt'>
  <td colspan=20 height=29 class=xl11025841 style='height:21.95pt'>CIR故障统计分析</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl11125841 style='height:15.0pt'>填报单位：</td>
  <td colspan=3 class=xl11225841>${sessionScope.user.organization.name}</td>
  <td class=xl10525841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=2 height=60 class=xl10425841 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>序号</td>
  <td rowspan=2 class=xl10125841 style='border-top:none'>日期</td>
  <td rowspan=2 class=xl10425841 width=49 style='border-top:none;width:37pt'>机车<br>
    型号</td>
  <td rowspan=2 class=xl10125841 style='border-top:none'>机车号</td>
  <td rowspan=2 class=xl10125841 style='border-top:none'>类型</td>
  <td rowspan=2 class=xl10125841>司机报故障现象</td>
  <td colspan=11 class=xl10025841 style='border-left:none'>原因分析及处理结果</td>
  <td rowspan=2 class=xl10025841>测试检修处理记录</td>
  <td rowspan=2 class=xl10025841>备注</td>
  <td rowspan=2 class=xl10025841>操作</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl10025841 style='height:30.0pt;border-top:none;
  border-left:none'>A架</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>B架</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>电台<br>
    主机</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>MMI</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>话筒</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>天线</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>喇叭</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>打印<br>
    机</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>其它</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
 </tr>
<c:if test="${empty list}">
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl10025841 style='height:15.0pt;border-top:none'>1</td>
  <td class="xl10125841 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl10225841 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl10125841 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl10125841 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl10125841 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl10325841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10325841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10325841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10325841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl10225841 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl10225841 editCell" style='border-top:none;border-left:none'></td>
  <td class="xl10225841" style='border-top:none;border-left:none'>
    <a class="addRow" href="#" onclick="add_line(1)" id="row1">增加</a></td>
 </tr>
</c:if>
<c:forEach items="${list}" var="item" varStatus="s">
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl10025841 style='height:15.0pt;border-top:none'>${s.count }</td>
  <td class="xl10125841 editCell" style='border-top:none;border-left:none;'>${item.date }</td>
  <td class="xl10225841 editCell" style='border-top:none;border-left:none;'>${item.engineType }</td>
  <td class="xl10125841 editCell" style='border-top:none;border-left:none;'>${item.engineNum }</td>
  <td class="xl10125841 editCell" style='border-top:none;border-left:none;'>${item.type }</td>
  <td class="xl10125841 editCell" style='border-top:none;border-left:none;'>${item.faultPhenomenon }</td>
  <td class="xl10325841 editCell numberCell" style='border-top:none;border-left:none'>${item.ashelf }</td>
  <td class="xl10325841 editCell numberCell" style='border-top:none;border-left:none'>${item.bshelf }</td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'>${item.radioHost }</td>
  <td class="xl10325841 editCell numberCell" style='border-top:none;border-left:none'>${item.multiMediaI }</td>
  <td class="xl10325841 editCell numberCell" style='border-top:none;border-left:none'>${item.mike }</td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'>${item.controlCable }</td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'>${item.aerial }</td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'>${item.speaker }</td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'>${item.printer }</td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'>${item.other }</td>
  <td class="xl10025841 editCell numberCell" style='border-top:none;border-left:none'>${item.testWell }</td>
  <td class="xl10225841 editCell" style='border-top:none;border-left:none;'>${item.testFixNote }</td>
  <td class="xl10225841 editCell" style='border-top:none;border-left:none;'>${item.remark }</td>
  <td class="xl10225841" style='border-top:none;border-left:none'>
   	<a class="addRow" href="#" onclick="add_line('${s.count}')" id="row${s.count}">增加</a><c:if test="${s.count gt 1}">&nbsp;<a class="delRow" href="#" onclick="remove_line(this)">删除</a></c:if>
   	</td>
 </tr>
</c:forEach>
 <tr height=40 style='height:30.0pt'>
  <td rowspan=2 height=60 class=xl10425841 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>合计</td>
  <td class=xl10125841 style='border-top:none;border-left:none'></td>
  <td class=xl10025841 style='border-top:none;border-left:none'></td>
  <td class=xl10125841 style='border-top:none;border-left:none'></td>
  <td class=xl10125841 style='border-top:none;border-left:none'></td>
  <td class=xl10125841 style='border-top:none;border-left:none'></td>
  <td class=xl10025841 style='border-top:none;border-left:none'>A架</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>B架</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>电台<br>
    主机</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>MMI</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>话筒</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>天线</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>喇叭</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>打印<br>
    机</td>
  <td class=xl10025841 style='border-top:none;border-left:none'>其它</td>
  <td class=xl10425841 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
  <td class=xl10025841 style='border-top:none;border-left:none'></td>
  <td class=xl10025841 style='border-top:none;border-left:none'></td>
  <td class=xl10025841 style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=20 style='height:15.0pt' id="total">
  <td height=20 class=xl10125841 style='height:15.0pt;border-top:none;
  border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
  <td class="xl10125841" style='border-top:none;border-left:none'></td>
<c:forEach items="${sumResult}" var="item" varStatus="s">
  <td class="xl10025841 sum${s.count}" style='border-top:none;border-left:none;'>${item }</td>
</c:forEach>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'></td>
  <td class="xl10025841" style='border-top:none;border-left:none'>
<!--   	<a class="sumRow" href="#" id="sum">计算总计</a></td> -->
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl10725841 style='height:15.0pt'>填报人：</td>
  <td colspan=3 class="xl10825841 fillEditCell" id="reporter">${sessionScope.user.name}</td>
  <td class=xl10625841>联系电话：</td>
  <td colspan=3 class="xl10825841 fillEditCell" id="phone">${requestScope.list[0].phone }</td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td class=xl9725841></td>
  <td colspan=3 class=xl10725841>填报日期：</td>
  <td colspan=2 class="xl10925841">
	<input class="xl10925841" readonly="readonly" id="userfillDate" style="border: black; width:230px;height:30px" 
	  value="${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}"/></td>
  <td class=xl9725841></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/report/reportValidate.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var fillDate = '<%=fillDate%>';

// 增加行记录
function add_line(id){
	var trId = $('#row' + id).parent().parent();  
	$(trId).after('<tr height=20 style="height:15.0pt" class="trClass">' +
		'<td height=20 class=xl10025841 style="height:15.0pt;border-top:none">' + id + '</td>' +
		'<td class="xl10125841 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10225841 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10125841 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10125841 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10125841 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10325841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10325841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10025841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10325841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10325841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10025841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10025841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10025841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10025841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10025841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10025841 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl10225841 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10225841 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl10225841" style="border-top:none;border-left:none">' +
		  	'<a class="addRow" href="#" onclick=add_line('+ id +') id=row' + id + '>增加</a>&nbsp;' +
			'<a class="delRow" href="#" onclick="remove_line(this)">删除</a></td>' +
 		'</tr>');
	initElementAttr();
	bindAllEvent();
	sort_line(); // 每次新增完之后进行排序操作
};

var length = 1;
// 排序
function sort_line(){
	var classsContainer = $(".trClass");  //获取所有节点的dom数组  
	length = classsContainer.length;  //数组长度
	
	for(var i = 1; i <= length; i++){  
		var $container = $(classsContainer[i - 1]); //循环遍历每一个dom节点  
		// 获取序号节点
		var no = $container.children().get(0);
		// 修改序号
		$(no).html(i);
		// 获取tr下最后一个td内的第一个a标签
		var lastTD = $container.children().get(19);
		// 修改a标签的id值和add_line()参数值
		$($(lastTD).children('a').get(0)).attr("id","row" + i);
		$($(lastTD).children('a').get(0)).attr("onclick","add_line(" + i + ")");
	}  
}

var currentStep = 0;
	
//删除选择记录
function remove_line(index) {
	if(index != null) {
		currentStep = $(index).parent().parent().find("td:first-child").html();
	}
	$("#table tr").each(function() {
		var seq = parseInt($(this).children("td").html());
		if(length != 1){
			if(seq == currentStep) {
				$(this).remove();
			}
		}
	});
	initElementAttr();
	bindAllEvent();
	sort_line();// 每次删除完之后进行排序操作
}

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
}

// 高亮行
function highlightRow() {
	$(".editCell").removeClass("activeRow");

	$(this).addClass("activeRow");
	$(this).siblings(".editCell").addClass("activeRow");
}

// 点击保存
$('#saveBtn').on('click',function(){
	// 1.首先进行数据的校验
	if(!checkNumberIsOneOrZero("tr", ".numberCell")){
		alert("数据输入错误，请输入0或者1！");
		return ;
	}
	// 长度校验
	if(!checkDataLength($(".editCell"))){
		alert("数据输入过长，最多250个字符！");
		return ;
	}
	else{
		// 2.然后计算总和
		getSumData();
		// 3.最后进行数据保存
		saveData();
	}
});

$('#sum').on('click',function(){
	getSumData();
});
//2.计算总和
function getSumData(){
	var ashelf = 0;
	var bshelf = 0;
	var radioHost = 0;
	var multiMediaI = 0;
	var mike = 0;
	var controlCable = 0;
	var aerial = 0;
	var speaker = 0;
	var printer = 0;
	var other = 0;
	var testWell = 0;
	$("tr").each(function(j) {
		var rowArray = $(this).children(".editCell");
		if(rowArray && rowArray.length != 0) {
			ashelf = parseInt(valueOfNum($(rowArray[5]).text())) + parseInt(ashelf);
			bshelf = parseInt(valueOfNum($(rowArray[6]).text())) + parseInt(bshelf);
			radioHost = parseInt(valueOfNum($(rowArray[7]).text())) + parseInt(radioHost);
			multiMediaI = parseInt(valueOfNum($(rowArray[8]).text())) + parseInt(multiMediaI);
			mike = parseInt(valueOfNum($(rowArray[9]).text())) + parseInt(mike);
			controlCable = parseInt(valueOfNum($(rowArray[10]).text())) + parseInt(controlCable);
			aerial = parseInt(valueOfNum($(rowArray[11]).text())) + parseInt(aerial);
			speaker = parseInt(valueOfNum($(rowArray[12]).text())) + parseInt(speaker);
			printer = parseInt(valueOfNum($(rowArray[13]).text())) + parseInt(printer);
			other = parseInt(valueOfNum($(rowArray[14]).text())) + parseInt(other);
			testWell = parseInt(valueOfNum($(rowArray[15]).text())) + parseInt(testWell);
		}
	});
	$('.sum1').html(ashelf);
	$('.sum2').html(bshelf);
	$('.sum3').html(radioHost);
	$('.sum4').html(multiMediaI);
	$('.sum5').html(mike);
	$('.sum6').html(controlCable);
	$('.sum7').html(aerial);
	$('.sum8').html(speaker);
	$('.sum9').html(printer);
	$('.sum10').html(other);
	$('.sum11').html(testWell);
};
// 若为空,则转换为0
function valueOfNum(num){
	if(num == "" || num == null){
		return 0;
	}else{
		return num;
	}
}

// 3.保存数据
function saveData(){
	var wirelessDeviceSheetSixs = getSaveData();
	
	$.post(contextPath + 'wirelessDeviceSheetSixAction/add.cn',
			{
				year : $('#updateForm #year').val(),
				month : $('#updateForm #month').val(),
				wirelessDeviceSheetSixs :  JSON.stringify(wirelessDeviceSheetSixs)
			},function(data,status){
				if(status){
					alert("保存成功!");
				}else{
					alert("保存失败!");
				}
		});
}

//获取保存数据
function getSaveData() {
	var wirelessDeviceSheetSixs = [];
	
	// 填报人
	var reporter = $("#reporter").text();
	// 填报单位
	var belongDepart = "${sessionScope.user.organization.id}";
	// 联系电话
	var phone = $("#phone").text();
	// 填报日期
	var userfillDate = $("#userfillDate").val();
	// 填报单位名
	var belongOrgName = "${sessionScope.user.organization.name}";
	
	$("tr").each(function(j) {

		var rowArray = $(this).children(".editCell");
		if(rowArray && rowArray.length != 0) {
			var seq = j - 5;// 表头5行
			var obj = new Object();
			
			obj.date = $(rowArray[0]).text();
			obj.engineType = $(rowArray[1]).text();
			obj.engineNum = $(rowArray[2]).text();
			obj.type = $(rowArray[3]).text();
			obj.faultPhenomenon = $(rowArray[4]).text();
			
			obj.ashelf = $(rowArray[5]).text();
			obj.bshelf = $(rowArray[6]).text();
			obj.radioHost = $(rowArray[7]).text();
			obj.multiMediaI = $(rowArray[8]).text();
			obj.mike = $(rowArray[9]).text();
			obj.controlCable = $(rowArray[10]).text();
			obj.aerial = $(rowArray[11]).text();
			obj.speaker = $(rowArray[12]).text();
			obj.printer = $(rowArray[13]).text();
			obj.other = $(rowArray[14]).text();
			obj.testWell = $(rowArray[15]).text();
			
			obj.testFixNote = $(rowArray[16]).text();
			obj.remark = $(rowArray[17]).text();
			
			obj.orgId = belongDepart;
			obj.userId = reporter;
			obj.phone = phone;
			obj.userfillDate = userfillDate + fillDate.substring(10);
			obj.belongOrgName = belongOrgName;
			obj.seq = seq + 1;
			
			wirelessDeviceSheetSixs[seq] = obj;
		}
	});
	
	return wirelessDeviceSheetSixs;
}

//导出Excel
$("#updateDiv #exportBtn").click(function() {
	// 1.首先进行数据的校验
	if(!checkNumberIsOneOrZero("tr", ".numberCell")){
		alert("数据输入错误，请输入0或者1！");
		return ;
	}
	else{
		// 2.然后计算总和
		getSumData();
		
		// 3.最后进行数据保存
		var wirelessDeviceSheetSixs = getSaveData();
		$.post(contextPath + 'wirelessDeviceSheetSixAction/add.cn',
				{
					year : $('#updateForm #year').val(),
					month : $('#updateForm #month').val(),
					wirelessDeviceSheetSixs :  JSON.stringify(wirelessDeviceSheetSixs)
				},function(data,status){
					if(status){
						$("#updateForm").attr("action", "/kunmingrinms/wirelessDeviceSheetSixAction/exportShow.cn");
						$("#updateForm").submit();
					}else{
						alert("导出失败!");
					}
			});
	}
	
});

</script>
</body>
</html>
