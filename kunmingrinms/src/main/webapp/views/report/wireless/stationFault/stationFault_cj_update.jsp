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
<style id="普铁无线报表报表模板_6593_Styles">
<!--table
.xl956593
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
.xl966593
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
.xl976593
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
.xl986593
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
.xl996593
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
.xl1006593
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
.xl1016593
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
.xl1026593
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
.xl1036593
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
.xl1046593
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
.xl1056593
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
.xl1076593
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
.xl1096593
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
.xl1116593
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
	border-right:none;
	border-bottom:none;
	border-left:1pt solid windowtext;
	white-space:normal;}
.xl1206593
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
.xl1236593
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
	white-space:normal;}
.xl1246593
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
.xl1256593
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
.xl1266593
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
.xl1276593
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
	white-space:normal;}
.xl1286593
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
.xl1296593
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
	white-space:normal;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;}
-->
td{
	height:20pt;
}
.editCell ,.remarkEditCell{ 
 	cursor : pointer;
 	background-color: #FEFECC;
}
.notEditCell{ 
 	cursor : default;
 	background-color: #fff;
}
.fillEditCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
}
.activeRow {
	background-color: #CAFBCE;
}
a{
	text-decoration:none;
}
</style>
</head>
<body>
<div>
	<form id="updateForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="saveBtn">保存</button>
	<button id="exportBtn" >导出Excel</button>
</div>

<div id="普铁无线报表报表模板_6593" align=center>
<table id="tableUp" border=0 cellpadding=0 cellspacing=0 width=1160 class=xl655356593
 style='border-collapse:collapse;table-layout:fixed;width:870pt;'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl655356593 width=35 style='height:15.0pt;width:26pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=99 style='width:74pt'></td>
 </tr>
 <tr height=30 style='height:22.5pt'>
  <td colspan=15 height=30 class=xl1046593 style='height:22.5pt'>便携电台故障统计分析</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl1026593 style='height:15.0pt'>填报单位：</td>
  <td colspan=3 class=xl1036593>${sessionScope.user.organization.name }</td>
  <td class=xl1256593></td>
  <td class=xl1256593></td>
  <td class=xl1256593></td>
  <td class=xl1256593></td>
  <td class=xl1256593></td>
  <td class=xl1256593></td>
  <td class=xl1256593></td>
  <td class=xl1256593></td>
  <td class=xl1266593></td>
  <td class=xl1256593></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td rowspan=2 height=38 class=xl1056593 width=35 style='height:28.5pt;border-top:none;width:26pt'>序号</td>
  <td rowspan=2 class=xl996593 style='border-top:none'>日期</td>
  <td rowspan=2 class=xl1056593 style='border-top:none;'>使用地点</td>
  <td colspan=2 class=xl996593 style='border-top:none'>设备</td>
  <td rowspan=2 class=xl1076593 style='border-bottom:1pt solid black;border-top:none'>编号</td>
  <td rowspan=2 class=xl996593 style='border-top:none'>故障现象</td>
  <td colspan=7 class=xl986593 style='border-left:none'>原因分析及处理结果</td>
  <td rowspan=2 class=xl1096593 style='border-bottom:1pt solid black;border-top:none'>测试检修记录</td>
  <td rowspan=2 class=xl1096593 style='border-bottom:1pt solid black;'>操作</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td class=xl986593 style='border-top:none;border-left:none'>型号</td>
  <td class=xl986593 style='border-top:none;border-left:none'>启用时间</td>
  <td height=19 class=xl986593 style='height:14.25pt;border-top:none;border-left:none'>发射</td>
  <td class=xl986593 style='border-top:none;border-left:none'>接收</td>
  <td class=xl986593 style='border-top:none;border-left:none'>信令</td>
  <td class=xl986593 style='border-top:none;border-left:none'>电池</td>
  <td class=xl986593 style='border-top:none;border-left:none'>天线</td>
  <td class=xl986593 style='border-top:none;border-left:none'>充电器</td>
  <td class=xl986593 style='border-top:none;border-left:none'>试验良好</td>
 </tr>
 <c:forEach items="${requestScope.tableDataUp}" varStatus="i" var="itemRow">
 	<tr class="editRow" height=19 style='height:14.25pt'>
	  <td height=19 class="xl986593 notEditCell data" style='height:14.25pt;border-top:none'>${itemRow[0] }</td>
	  <td class="xl996593 editCell data" style='border-top:none;border-left:none'>${itemRow[1] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[2] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[3] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[4] }</td>
	  <td class="xl996593 editCell data"  style='border-top:none;border-left:none'>${itemRow[5] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[6] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[7] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[8] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[9] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[10] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[11] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[12] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[13] }</td>
	  <td class="xl986593 editCell data" style='border-top:none;border-left:none'>${itemRow[14] }</td>
	  <c:if test="${i.index==0 }">
		 <td class="xl986593" style='border-top:none;border-left:none'><a href="JavaScript:" onclick="addTr(this);">增加</a></td>
	  </c:if>
	  <c:if test="${i.index!=0 }">
		 <td class="xl986593" style='border-top:none;border-left:none'>
		  	<a href="JavaScript:" onclick="addTr(this);">增加</a>
		  	<a href='JavaScript:' onclick="delTr(this);">删除</a>
	  	</td>
	  </c:if>
 	</tr>
 </c:forEach>
 <tr height=19 style='height:14.25pt'>
  <td rowspan="2" height=19 class=xl986593 style='height:14.25pt;border-top:none'>合计</td>
  <td class=xl996593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <td class=xl996593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'>发射</td>
  <td class=xl986593 style='border-top:none;border-left:none'>接收</td>
  <td class=xl986593 style='border-top:none;border-left:none'>信令</td>
  <td class=xl986593 style='border-top:none;border-left:none'>电池</td>
  <td class=xl986593 style='border-top:none;border-left:none'>天线</td>
  <td class=xl986593 style='border-top:none;border-left:none'>充电器</td>
  <td class=xl986593 style='border-top:none;border-left:none'>试验良好</td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td class=xl996593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <td class=xl996593 style='border-top:none;border-left:none'></td>
  <td class=xl986593 style='border-top:none;border-left:none'></td>
  <c:forEach items="${requestScope.sumDataUp}" varStatus="i" var="itemSum">
	  <td class='xl986593 sumDataUp' style='border-top:none;border-left:none'>${itemSum }</td>
  </c:forEach>
  <td colspan="2" class=xl986593 style='border-top:none;border-left:none'><a href="JavaScript:" onclick="calSumUp();">计算合计</a></td>
 </tr>
</table>
 <table id="tableDown" border=0 cellpadding=0 cellspacing=0 width=1160 class=xl655356593
 style='border-collapse:collapse;table-layout:fixed;width:870pt '>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl655356593 width=35 style='height:15.0pt;width:26pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=72 style='width:54pt'></td>
  <td class=xl655356593 width=99 style='width:74pt'></td>
 </tr>
 <tr height=31 style='height:23.25pt'>
  <td rowspan=2 height=63 class=xl1056593 width=35 style='height:47.25pt;width:26pt'>序号</td>
  <td colspan=3 class=xl1206593 style='border-right:1pt solid black;border-left:none'>运用基本情况</td>
  <td colspan=3 class=xl1006593 style='border-left:none'>便携电台运用良好率</td>
  <td colspan=9 rowspan=2 class=xl986593>备注</td>
 </tr>
 <tr height=32 style='height:24.0pt'>
  <td height=32 class=xl1006593 style='height:24.0pt;border-top:none;
  border-left:none'>运用类型</td>
  <td class=xl966593 width=72 style='border-top:none;border-left:none;
  width:54pt'>设备运用<br>
    总数</td>
  <td class=xl966593 width=72 style='border-top:none;border-left:none;
  width:54pt'>当月天数</td>
  <td class=xl966593 width=72 style='border-top:none;border-left:none;
  width:54pt'>当月总运用<br>
    台次</td>
  <td class=xl966593 width=72 style='border-top:none;border-left:none;
  width:54pt'>总故障<br>
    台次</td>
  <td class=xl966593 width=72 style='border-top:none;border-left:none;
  width:54pt'>良好率<br>
    （%）</td>
 </tr>
 <c:forEach items="${requestScope.tabelDataDown}" varStatus="i" var="itemRow">
	<tr class="editRow sheetTwo" height=19 style='height:14.25pt'>
	<td height=19 class="xl986593 notEditCell data" style='height:14.25pt;border-top:none'>${itemRow[0] }</td>
	<td class="xl986593 notEditCell data" style='border-top:none;border-left:none'>${itemRow[1] }</td>
	<td class="xl986593 editCell intCell cell data" style='border-top:none;border-left:none'>${itemRow[2] }</td>
	<td class="xl986593 editCell intCell cell data" style='border-top:none;border-left:none'>${itemRow[3] }</td>
	<td class="xl986593 editCell intCell cell data" style='border-top:none;border-left:none'>${itemRow[4] }</td>
	<td class="xl986593 editCell intCell cell data" style='border-top:none;border-left:none'>${itemRow[5] }</td>
	<td class="xl976593 doubleCell cell data" style='border-top:none;border-left:none'>${itemRow[6] }</td>
	<c:if test="${i.index==0 }">
		<td colspan=9 rowspan=4 class="xl1116593" style='border-right:1pt solid black;border-bottom:1pt solid black'>
			<textarea id="remark" class="remarkEditCell" maxlength="250" style="resize:none;border:none;width:99.5%;height:98%;" placeholder="最多输入250个字符">${itemRow[7] }</textarea>
		</td>
	</c:if>
 </tr>
 </c:forEach>
 <tr height=19 style='height:14.25pt'>
  <td colspan="2" height=19 class=xl986593 style='height:14.25pt;border-top:none'>合计</td>
  <c:forEach items="${requestScope.sumDataDown}" varStatus="i" var="itemSum">
	  <td class='xl986593 sumDataDown'  style='border-top:none;border-left:none'>${itemSum }</td>
  </c:forEach>
  <td colspan="9" class=xl986593 style='border-top:none;border-left:none'><a href="JavaScript:" onclick="calSumDown();">计算合计</a></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=2 height=19 class=xl1016593 style='height:14.25pt'>填报人：</td>
  <td colspan=2  class="xl1236593 fillEditCell" id="reporter">${requestScope.reporter}</td>
  <td class=xl1246593></td>
  <td colspan="2" class=xl956593>联系电话：</td>
  <td colspan=2 class="xl1276593 fillEditCell" id="phone">${requestScope.phone}</td>
  <td class=xl1286593 style='border-top:none'></td>
  <td class=xl1246593></td>
  <td colspan=2 class=xl1016593>填报日期：</td>
  <td colspan=2 class=xl1296593 id="userfillDate">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
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
	$(".editCell,.remarkEditCell").attr("contenteditable", "true");
	$(".fillEditCell").attr("contenteditable", "true");
	$(".notEditCell").attr("contenteditable", "false");
}

//绑定事件
function bindAllEvent() {
	$(".editCell,.remarkEditCell").mouseover(highlightRow);
	$("#saveBtn").click(saveBtn);
	$("#exportBtn").click(exportBtn);
}

//高亮行
function highlightRow() {
	$(".editCell,.remarkEditCell").removeClass("activeRow");
	$(this).addClass("activeRow");
	if($(this).hasClass("editCell")){
		$(this).siblings(".editCell").addClass("activeRow");
	}
	
}

//添加行
function addTr(clickObj){
	var line="<tr class='editRow' height=19 style='height:14.25pt'>"
				+ 		"<td height=19 class='xl986593 notEditCell data'>1</td>"
				+  	"<td class='xl996593 editCell data'></td>"
				+ 		"<td class='xl986593 editCell data'></td>"
				+ 		"<td class='xl986593 editCell data'></td>"
				+ 		"<td class='xl986593 editCell data'></td>"
				+ 		"<td class='xl996593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593 editCell data'></td>"
				+		"<td class='xl986593'>"
				+			"<a href='JavaScript:' onclick='addTr(this);'>增加</a> "
				+			"<a href='JavaScript:' onclick='delTr(this);'>删除</a>"
				+		"</td>"
				+  "</tr>";
	var curLine=$(clickObj).parent().parent();
	curLine.after(line);//当前行后追加一行

	//动态生成序号
	resetDataIndex();
	
	initElementAttr();
	$(".editCell").mouseover(highlightRow);
// 	bindAllEvent();
}

function resetDataIndex(){
	var editRows=$("#tableUp .editRow");//表格（上）的所有可编辑行
	//循环设置每一行的序号（递增）
	for(var i=0;i<editRows.length;i++){
		var $line=$(editRows[i]);
		$line.children("td:first").text(i+1);
	}
}

//删除行
function delTr(clickObj){
	var curLine=$(clickObj).parent().parent();
	curLine.remove();
	
	//动态改变序号
	resetDataIndex();
}

function saveBtn() {
	//验证表格（上）中是否为数字0或1
	if(!validateTableUp()){//验证不通过
		alert("【原因分析及处理结果】单元格只能输入整数0或1");
		return;
	};
	//验证表格（下）
	if(!validateTableDown()){//验证不通过
		return;
	};
	//验证联系电话
// 	if(!validatePhone($("#phone"))){
// 		return;
// 	}
	
	var tableDataUp = getSaveDataUp();
	var tableDataDown = getSaveDataDown();
	
	if(!tableDataUp||!tableDataDown){//表格（上、下）只要有一个验证不通过
		return;
	}
// 	console.log(JSON.stringify(tableDataUp));
// 	console.log(JSON.stringify(tableDataDown));
	$.post(contextPath + 'stationFaultAction/saveOrUpdate.cn',
			{
				year : $("#year").val(),
				month : $("#month").val(),
				tableDataUp :  JSON.stringify(tableDataUp),
				tableDataDown :  JSON.stringify(tableDataDown)
			},function(data,status){
				if(data!=null){
					alert(data);
					return;
				}
				alert("保存成功");
			},'json');
}

/**
 * 验证表格（上）【原因分析及处理结果】是否为数字0或1
 */
function validateTableUp(){
	var isPassUp=true;
	//获取表格（上）的编辑数据
	var rowsUp=$("#tableUp .editRow");
	for(var i=0;i<rowsUp.length;i++){//遍历行
		var cellsUp=$(rowsUp[i]).children(".editCell");
		for(var j=6;j<=12;j++){
			$(cellsUp[j]).css('background-color','');//清除验证不通过的样式
			
			var cell=$(cellsUp[j]).text().trim()=='' ? '0' : $(cellsUp[j]).text().trim();//若不输入，默认为0
			if(cell!=0&&cell!=1){
				$(cellsUp[j]).css('background-color','#FF5151');//添加验证不通过的样式
				isPassUp=false;
			}
		}
	}
	return isPassUp;
}

//验证表格（下）
function validateTableDown(){
	if(!validateIntNumber($("#tableDown .intCell"))){//验证整数单元格
		alert("请输入正整数！");
		return false;
	};
	if(validateIntNumber($("#tableDown .intCell"))){//在通过了整数校验后进行是否满足业务除法的验证
		if(!divisorAndDividendCheck(".sheetTwo",".intCell",2,3)){
			alert("总运用台次不能小于总故障台次！");
			return false;
		}
	}
	if(!validateDoubleNumber($("#tableDown .doubleCell"))){//验证浮点数单元格
		alert("请输入有效的非负数字！");
		return false;
	};
	return true;
}

//获取保存数据-表格（上）
function getSaveDataUp() {
	
	if(!checkDataLength($(".editCell"))){
		alert("数据输入过长，最多250个字符！");
		return ;
	}
	
	var tableDataUp=[];
	//获取表格（上）的编辑数据
	var rowsUp=$("#tableUp .editRow");
	for(var i=0;i<rowsUp.length;i++){
		var cellsUp=$(rowsUp[i]).children(".data");
		var recordsUp={
				dataIndex : $(cellsUp[0]).text(),
				happenTime : $(cellsUp[1]).text(),
				
				userSite : $(cellsUp[2]).text(),
				deviceName : $(cellsUp[3]).text(),
				enableTime : $(cellsUp[4]).text(),
				number : $(cellsUp[5]).text(),
				faultApp : $(cellsUp[6]).text(),
				
				fire : $(cellsUp[7]).text().trim()=='' ? '0' : $(cellsUp[7]).text().trim(),
				accept : $(cellsUp[8]).text().trim()=='' ? '0' : $(cellsUp[8]).text().trim(),
				sign : $(cellsUp[9]).text().trim()=='' ? '0' : $(cellsUp[9]).text().trim(),
				cell : $(cellsUp[10]).text().trim()=='' ? '0' : $(cellsUp[10]).text().trim(),
				mast : $(cellsUp[11]).text().trim()=='' ? '0' : $(cellsUp[11]).text().trim(),
				charger : $(cellsUp[12]).text().trim()=='' ? '0' : $(cellsUp[12]).text().trim(),
				tryout : $(cellsUp[13]).text().trim()=='' ? '0' : $(cellsUp[13]).text().trim(),
				
				trialTabb : $(cellsUp[14]).text(),
				
				belongDepart : "${sessionScope.user.organization.id}",//填报单位
				reporter : $("#reporter").text(),	// 填报人
				phone : $("#phone").text().trim(),	// 联系电话
				userfillDate : $("#userfillDate").text()	//用户填报日期
		};
		tableDataUp.push(recordsUp);
	};
// 	console.log(tableDataUp);
	return tableDataUp;

}

/**
 * 手动计算表格（上）的合计
 */
function calSumUp(){
	//验证表格（上）中是否为数字0或1
	if(!validateTableUp()){//验证不通过
		alert("【原因分析及处理结果】单元格只能输入整数0或1");
		return;
	};

	var tableDataUp = getSaveDataUp();
	var sumDataUp=[0,0,0,0,0,0,0];
	for(var i=0;i<tableDataUp.length;i++){
		var recordUp=tableDataUp[i];
		
		var index=0;
		sumDataUp[index++]+=parseInt(recordUp.fire);
		sumDataUp[index++]+=parseInt(recordUp.accept);
		sumDataUp[index++]+=parseInt(recordUp.sign);
		sumDataUp[index++]+=parseInt(recordUp.cell);
		sumDataUp[index++]+=parseInt(recordUp.mast);
		sumDataUp[index++]+=parseInt(recordUp.charger);
		sumDataUp[index++]+=parseInt(recordUp.tryout);
	}
	//将计算结果显示在对应的单元格中
	var sum=$(".sumDataUp");
	for(var j=0;j<sum.length;j++){
		$(sum[j]).html(sumDataUp[j]);
	}
	
}

//获取保存数据-表格（下）
function getSaveDataDown() {
	var tableDataDown=[];
	//获取表格（下）的编辑数据
	var rowsDown=$("#tableDown .editRow");
	for(var i=0;i<rowsDown.length;i++){
		var cellsDown=$(rowsDown[i]).children(".data");
		var recordsDown={
				dataIndex : $(cellsDown[0]).text(),
				userType : $(cellsDown[1]).text(),
				
				deviceUseCou : $(cellsDown[2]).text().trim()=='' ? '0' : $(cellsDown[2]).text().trim(),
				days : $(cellsDown[3]).text().trim()=='' ? '0' : $(cellsDown[3]).text().trim(),
				useCount : $(cellsDown[4]).text().trim()=='' ? '0' : $(cellsDown[4]).text().trim(),
				faultCount : $(cellsDown[5]).text().trim()=='' ? '0' : $(cellsDown[5]).text().trim(),
				goddRate : $(cellsDown[6]).text()=='' ? '0' : $(cellsDown[6]).text(),
				
				remark : $("#remark").val(), //备注
				
				belongDepart : "${sessionScope.user.organization.id}",//填报单位
				reporter : $("#reporter").text(),	// 填报人
				phone : $("#phone").text().trim(),	// 联系电话
				userfillDate : $("#userfillDate").text()	//用户填报日期
		};
		tableDataDown.push(recordsDown);
	};
// 	console.log(tableDataDown);
	return tableDataDown;
}

/**
 * 手动计算表格（下）的合计
 */
function calSumDown(){
	//验证表格（下）
	if(!validateTableDown()){//验证不通过
		return;
	};
	
	$(".sheetTwo").each(function(j) {
		var rowArray = $(this).children(".cell");
		if(rowArray && rowArray.length != 0) {
			
			$(rowArray[4]).html("0.0");
			
			if(parseInt($(rowArray[3]).text())<=parseInt($(rowArray[2]).text())&&$(rowArray[2]).text()!=0){
				var result = ((1-(parseInt($(rowArray[3]).text())/parseInt($(rowArray[2]).text())))*100).toFixed(1);
				$(rowArray[4]).html(result);
			}
			
		}
	});
	
	var tableDataDown = getSaveDataDown();
	var sumDataDown=[0,0,0,0,0];
	for(var i=0;i<tableDataDown.length;i++){
		var recordDown=tableDataDown[i];
		
		var index=0;
		sumDataDown[index++]+=parseInt(recordDown.deviceUseCou);
		sumDataDown[index++]=parseInt(recordDown.days);
		sumDataDown[index++]+=parseInt(recordDown.useCount);
		sumDataDown[index++]+=parseInt(recordDown.faultCount);
		sumDataDown[index++]=parseFloat((sumDataDown[2]-sumDataDown[3])/zeroToOne(sumDataDown[2])*100).toFixed(1);//计算良好率，良好率为浮点数
	}
	//将计算结果显示在对应的单元格中
	var sumDown=$(".sumDataDown");
	for(var j=0;j<sumDown.length;j++){
		$(sumDown[j]).html(sumDataDown[j]);
	}

}

function zeroToOne(d){
	return d==0 ? 1 : d;
}

function exportBtn() {
	saveAndExport();
}
function saveAndExport(){
	//验证表格（上）中是否为数字0或1
	if(!validateTableUp()){//验证不通过
		alert("【原因分析及处理结果】单元格只能输入整数0或1");
		return;
	};
	//验证表格（下）
	if(!validateTableDown()){//验证不通过
		return;
	};
	
	var tableDataUp = getSaveDataUp();
	var tableDataDown = getSaveDataDown();
	
	if(!tableDataUp||!tableDataDown){//表格（上、下）只要有一个验证不通过
		return;
	}
	$.post(contextPath + 'stationFaultAction/saveOrUpdate.cn',
			{
				year : $("#year").val(),
				month : $("#month").val(),
				tableDataUp :  JSON.stringify(tableDataUp),
				tableDataDown :  JSON.stringify(tableDataDown)
			},function(data,status){
				if(data!=null){
					alert(data);
					return;
				}
				$("#updateForm").attr("action", "/kunmingrinms/stationFaultAction/exportWorkShop.cn");
				$("#updateForm").submit();
			},'json');
}
</script>
</body>
</html>