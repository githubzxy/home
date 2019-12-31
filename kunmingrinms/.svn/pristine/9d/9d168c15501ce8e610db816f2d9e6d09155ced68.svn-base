<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
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
<title>车间无线列调机车电台（货车列尾司机控制盒）故障统计及分析汇总表</title>
<style id="普铁无线报表报表模板_27048_Styles">
<!--table
.xl9727048
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
	vertical-align:bottom;
	white-space:nowrap;}
.xl9827048
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
.xl9927048
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
.xl10027048
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
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl10127048
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
.xl10227048
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
.xl10327048
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
.xl10427048
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
.xl10527048
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
.xl10627048
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
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl10827048
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
.xl10927048
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
.xl11027048
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
<div id="普铁无线报表报表模板_27048" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=1080 class=xl9727048
 style='border-collapse:collapse;table-layout:fixed;' id="table">
 <col class=xl9727048 width=45 style='width:34pt'>
 <col class=xl9727048 width=111 style='width:83pt'>
 <col class=xl9727048 width=76 style='width:57pt'>
 <col class=xl9727048 width=45 span=17 style='width:34pt'>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl9827048 width=45 style='height:24.95pt;width:34pt'></td>
  <td class=xl9827048 width=111 style='width:83pt'></td>
  <td class=xl9827048 width=76 style='width:57pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
  <td class=xl9827048 width=45 style='width:34pt'></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=20 height=33 class=xl10427048 style='height:24.95pt'>无线列调机车电台（货车列尾司机控制盒）故障统计及分析汇总表</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl10527048 style='height:24.95pt'>填报单位：</td>
  <td colspan=4 class=xl10327048>${belongOrgName}</td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td colspan=2 class=xl9827048></td>
 </tr>
 <tr class=xl9827048 height=40 style='height:30.0pt'>
  <td rowspan=2 height=80 class=xl10127048 width=45 style='height:60.0pt;
  border-top:none;width:34pt'>序号</td>
  <td rowspan=2 class=xl10127048 width=111 style='border-top:none;width:83pt'>列尾设备名称</td>
  <td rowspan=2 class=xl10127048 width=76 style='border-top:none;width:57pt'>故障总数<br>
    （台）</td>
  <td colspan=7 class=xl10127048 width=315 style='border-left:none;width:238pt'>机车电台部分</td>
  <td colspan=3 class=xl10127048 width=135 style='border-left:none;width:102pt'>列尾控制盒</td>
  <td colspan=7 class=xl10127048 width=315 style='border-left:none;width:238pt'>原因分析</td>
 </tr>
 <tr class=xl9827048 height=40 style='height:30.0pt'>
  <td height=40 class=xl10127048 width=45 style='height:30.0pt;border-top:none;
  border-left:none;width:34pt'>主机</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>控制盒</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>电源</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>送话盒</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>扬声器</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>天线</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>其他</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>控制盒</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>馈线</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>其他</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>违章人为</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>维修不良</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>供电电源</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>用户损坏</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>材质不良</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>外界妨碍</td>
  <td class=xl10127048 width=45 style='border-top:none;border-left:none;
  width:34pt'>接触不良</td>
 </tr>
 <c:if test="${empty list}">
<tr height=33 style='height:24.95pt' class="trClass">
  <td height=33 class=xl10127048 width=45 style='height:24.95pt;border-top:none;width:34pt'>1</td>
  <td class="xl10127048" width=111 style='border-top:none;border-left:none;width:83pt'></td>
  <td class="xl10127048" width=76 style='border-top:none;border-left:none;width:57pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'></td>
 </tr>
</c:if>
 <c:forEach items="${list}" var="item" varStatus="s">
 <tr height=33 style='height:24.95pt' class="trClass">
  <td height=33 class=xl10127048 width=45 style='height:24.95pt;border-top:none;width:34pt'>${s.count}</td>
  <td class="xl10127048" width=111 style='border-top:none;border-left:none;width:83pt;word-wrap:break-word;word-break:break-all;'>${item.deviceName}</td>
  <td class="xl10127048" width=76 style='border-top:none;border-left:none;width:57pt'>${item.faultSum}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.stationHost}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.controlBox}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.powerSupply}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.microphone}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.voiceDevice}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.stationAntenna}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.stationOther}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.rearControlBox}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.rearAntenna}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.rearOther}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.violationHumanR}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.poorMaintenanceR}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.powerSupplyR}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.usersDamagedR}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.materialAdverseR}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.outsideImpedeR}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>${item.touchBad}</td>
  </tr>
 </c:forEach>
 <tr class=xl9827048 height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl10627048 width=156 style='border-right:1.0pt solid black;
  height:24.95pt;width:117pt'>总计</td>
<c:forEach items="${sumResult}" var="item">
  <td class=xl10127048 width=76 style='border-top:none;border-left:none;width:57pt'>${item }</td>
</c:forEach>
 </tr>
 <tr style='height:200px'>
  <td  class=xl10127048 width=45 style='height:200px;
  width:34pt'>月度故障及运用质量分析</td>
  <td colspan=10 class="xl10127048" width=547 style='width:412pt'>
  	<textarea id="faultAnalysis" maxlength="200" style="border:none;width: 99%;height: 100%;resize: none;margin:0px -2px 0px ;" readonly="readonly">${requestScope.list[0].faultAnalysis }</textarea></td>
  <td class=xl10127048 width=45 style='width:34pt'>建议措施</td>
  <td colspan=8 class="xl10127048" width=360 style='width:272pt'>
  	<textarea id="adviceMeasure" maxlength="200" style="border:none;width: 99%;height: 100%;resize: none;margin:0px -2px 0px ;" readonly="readonly">${requestScope.list[0].adviceMeasure }</textarea></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl10227048 style='height:24.95pt'>填报人：</td>
  <td colspan=2 class="xl9927048 fillEditCell" style='border-top:none' id="reporter">${userName }</td>
  <td class=xl10027048 style='border-top:none'></td>
  <td colspan=2 class=xl10227048>联系电话：</td>
  <td colspan=3 class="xl10827048 fillEditCell" id="phone">${requestScope.list[0].phone }</td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td colspan=2 class=xl11027048>填报日期：</td>
  <td colspan=4 class=xl10927048>${requestScope.list[0].userfillDateShow }</td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

//导出Excel
$("#showDiv #exportBtn").click(function() {

	$("#showForm").attr("action", "/kunmingrinms/trainRearFaultSheetOneAction/exportShow.cn");
	$("#showForm").submit();
});

</script>
</body>
</html>
