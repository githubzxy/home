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
<title>修改无线列调机车电台（货车列尾司机控制盒）故障统计及分析汇总表</title>
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

.editCell { 
 	cursor : pointer;
 	background-color: #FEFECC;
}

.editStringCell { 
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
  <td colspan=21 height=33 class=xl10427048 style='height:24.95pt'>无线列调机车电台（货车列尾司机控制盒）故障统计及分析汇总表</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl10527048 style='height:24.95pt'>填报单位：</td>
  <td colspan=4 class=xl10327048>${sessionScope.user.organization.name}</td>
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
  <td rowspan=2 class=xl10127048 width=111 style='width:83pt'>操作</td>
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
<c:forEach items="${list}" var="item" varStatus="s">
 <tr height=33 style='height:24.95pt' class="trClass">
  <td height=33 class="xl10127048" width=45 style='height:24.95pt;border-top:none;width:34pt'>${s.count}</td>
  <td class="xl10127048 editStringCell numberCell" width=111 style='border-top:none;border-left:none;width:83pt'>${item.deviceName}</td>
  <td class="xl10127048 numberCell" width=76 style='border-top:none;border-left:none;width:57pt'>${item.faultSum}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.stationHost}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.controlBox}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.powerSupply}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.microphone}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.voiceDevice}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.stationAntenna}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.stationOther}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.rearControlBox}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.rearAntenna}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.rearOther}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.violationHumanR}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.poorMaintenanceR}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.powerSupplyR}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.usersDamagedR}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.materialAdverseR}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.outsideImpedeR}</td>
  <td class="xl10127048 editCell numberCell" width=45 style='border-top:none;border-left:none;width:34pt'>${item.touchBad}</td>
  <td class="xl10127048" width=45 style='border-top:none;border-left:none;width:34pt'>
   	<a class="addRow" href="#" onclick="add_line('${s.count}')" id="row${s.count}">增加</a><c:if test="${s.count gt 1}">&nbsp;<a class="delRow" href="#" onclick="remove_line(this)">删除</a></c:if>
   	</td>
 </tr>
</c:forEach>
 <tr class=xl9827048 height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl10627048 width=156 style='border-right:1.0pt solid black;
  height:24.95pt;width:117pt'>总计</td>
<c:forEach items="${sumResult}" var="item" varStatus="s">
  <td class="xl10127048 sum${s.count}" width=76 style='border-top:none;border-left:none;width:57pt'>${item }</td>
</c:forEach>
  <td class="xl10127048" width=76 style='border-top:none;border-left:none;width:57pt'>
<!--   	<a class="sumRow" href="#" id="sum">计算总计</a> -->
  </td>
 </tr>
 <tr style='height:200px'>
  <td class=xl10127048 width=45 style='height:200px;
  border-top:none;width:34pt'>月度故障及运用质量分析</td>
  <td colspan=10 class="xl10127048" width=547 style='width:200px'>
  	<textarea id="faultAnalysis" class="editStringCell" maxlength="250" style="border:none;width: 99%;height: 100%;resize: none;margin:0px -2px 0px ;"
  	placeholder="最多输入250个字符">${requestScope.list[0].faultAnalysis }</textarea></td>
  <td class=xl10127048 width=45 style='border-top:none;width:34pt'>建议措施</td>
  <td colspan=9 class="xl10127048" width=360 style='width:272pt'>
  	<textarea id="adviceMeasure" class="editStringCell" maxlength="250" style="border:none;width: 99%;height: 100%;resize: none;margin:0px -2px 0px ;" 
  	placeholder="最多输入250个字符">${requestScope.list[0].adviceMeasure }</textarea></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl10227048 style='height:24.95pt'>填报人：</td>
  <td colspan=2 class="xl9927048 fillEditCell" style='border-top:none;white-space: normal;' id="reporter">${sessionScope.user.name}</td>
  <td class=xl10027048 style='border-top:none'></td>
  <td colspan=2 class=xl10227048>联系电话：</td>
  <td colspan=3 class="xl10827048 fillEditCell" id="phone">${requestScope.list[0].phone }</td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
  <td colspan=2 class=xl11027048>填报日期：</td>
  <td colspan=4 class=xl10927048>
  <input class="xl10927048" readonly="readonly" id="userfillDate" style="border: black; width:230px;height:30px" value="${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}"/></td>
  <td class=xl9827048></td>
  <td class=xl9827048></td>
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
	$(trId).after('<tr height=33 style="height:24.95pt" class="trClass">' +
		'<td height=33 class=xl10127048 width=45 style="height:24.95pt;border-top:none;width:34pt">' + id + '</td>' +
		'<td class="xl10127048 editStringCell numberCell" width=111 style="border-top:none;border-left:none;width:83pt"></td>' +
		'<td class="xl10127048 numberCell" width=76 style="border-top:none;border-left:none;width:57pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
	 	'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
		'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
	 	'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
	  	'<td class="xl10127048 editCell numberCell" width=45 style="border-top:none;border-left:none;width:34pt"></td>' +
	  	'<td class="xl10127048" width=45 style="border-top:none;border-left:none;width:34pt">' +
		  	'<a class="addRow" href="#" onclick=add_line('+ id +') id=row' + id + ' >增加</a>&nbsp;' +
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
		var lastTD = $container.children().get(20);
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
	$(".editStringCell").attr("contenteditable", "true");
	$(".fillEditCell").attr("contenteditable", "true");
}

//绑定事件
function bindAllEvent() {
	$(".editCell").mouseover(highlightRow);
	$(".editStringCell").mouseover(highlightRow);
}

// 高亮行
function highlightRow() {
	$(".editCell").removeClass("activeRow");
	$(".editStringCell").removeClass("activeRow");

	$(this).addClass("activeRow");
	$(this).siblings(".editCell").addClass("activeRow");
	$(this).siblings(".editStringCell").addClass("activeRow");
}

//点击保存按钮
$('#saveBtn').on('click',function(){
	// 1.首先进行数据的校验
	if(!validateIntNumber($(".editCell"))){
		alert("数据输入错误，请输入整数！");
		return ;
	}
	// 长度校验
	if(!checkDataLength($(".numberCell"))){
		alert("数据输入过长，最多250个字符！");
		return ;
	}
	else{
		// 2.然后行计算总和
		getSumRowData();
		// 3.列计算总和
		getSumColData();
		// 4.最后进行数据保存
		saveData();
	}
});

$('#sum').on('click',function(){
	getSumRowData();
	getSumColData();
});

//2.行计算总和
function getSumRowData(){
	$(".trClass").each(function(j) {
		var rowArray = $(this).children(".numberCell");
		if(rowArray && rowArray.length != 0) {
			var rowSum = 0;
			for(var i = 2;i < 12;i++){
				rowSum = parseInt(valueOfNum($(rowArray[i]).text())) + parseInt(rowSum);
			}
			$(rowArray[1]).html(rowSum);
		}
	});
}

//3.列计算总和
function getSumColData(){
	var faultSum = 0;
	var stationHost = 0;
	var controlBox = 0;
	var powerSupply = 0;
	var microphone = 0;
	var voiceDevice = 0;
	var stationAntenna = 0;
	var stationOther = 0;
	var rearControlBox = 0;
	var rearAntenna = 0;
	var rearOther = 0;
	var violationHumanR = 0;
	var poorMaintenanceR = 0;
	var powerSupplyR = 0;
	var usersDamagedR = 0;
	var materialAdverseR = 0;
	var outsideImpedeR = 0;
	var touchBad = 0;
	$("tr").each(function(j) {
		var rowArray = $(this).children(".numberCell");
		if(rowArray && rowArray.length != 0) {
			faultSum = parseInt(valueOfNum($(rowArray[1]).text())) + parseInt(faultSum);
			stationHost = parseInt(valueOfNum($(rowArray[2]).text())) + parseInt(stationHost);
			controlBox = parseInt(valueOfNum($(rowArray[3]).text())) + parseInt(controlBox);
			powerSupply = parseInt(valueOfNum($(rowArray[4]).text())) + parseInt(powerSupply);
			microphone = parseInt(valueOfNum($(rowArray[5]).text())) + parseInt(microphone);
			voiceDevice = parseInt(valueOfNum($(rowArray[6]).text())) + parseInt(voiceDevice);
			stationAntenna = parseInt(valueOfNum($(rowArray[7]).text())) + parseInt(stationAntenna);
			stationOther = parseInt(valueOfNum($(rowArray[8]).text())) + parseInt(stationOther);
			rearControlBox = parseInt(valueOfNum($(rowArray[9]).text())) + parseInt(rearControlBox);
			rearAntenna = parseInt(valueOfNum($(rowArray[10]).text())) + parseInt(rearAntenna);
			rearOther = parseInt(valueOfNum($(rowArray[11]).text())) + parseInt(rearOther);
			violationHumanR = parseInt(valueOfNum($(rowArray[12]).text())) + parseInt(violationHumanR);
			poorMaintenanceR = parseInt(valueOfNum($(rowArray[13]).text())) + parseInt(poorMaintenanceR);
			powerSupplyR = parseInt(valueOfNum($(rowArray[14]).text())) + parseInt(powerSupplyR);
			usersDamagedR = parseInt(valueOfNum($(rowArray[15]).text())) + parseInt(usersDamagedR);
			materialAdverseR = parseInt(valueOfNum($(rowArray[16]).text())) + parseInt(materialAdverseR);
			outsideImpedeR = parseInt(valueOfNum($(rowArray[17]).text())) + parseInt(outsideImpedeR);
			touchBad = parseInt(valueOfNum($(rowArray[18]).text())) + parseInt(touchBad);
		};
	});
	$('.sum1').html(faultSum);
	$('.sum2').html(stationHost);
	$('.sum3').html(controlBox);
	$('.sum4').html(powerSupply);
	$('.sum5').html(microphone);
	$('.sum6').html(voiceDevice);
	$('.sum7').html(stationAntenna);
	$('.sum8').html(stationOther);
	$('.sum9').html(rearControlBox);
	$('.sum10').html(rearAntenna);
	$('.sum11').html(rearOther);
	$('.sum12').html(violationHumanR);
	$('.sum13').html(poorMaintenanceR);
	$('.sum14').html(powerSupplyR);
	$('.sum15').html(usersDamagedR);
	$('.sum16').html(materialAdverseR);
	$('.sum17').html(outsideImpedeR);
	$('.sum18').html(touchBad);
}
//若为空,则转换为0
function valueOfNum(num){
	if(num == "" || num == null){
		return 0;
	}else{
		return num;
	}
}

// 4.保存数据
function saveData(){
	var trainRearFaultSheetOnes = getSaveData();
	
	$.post(contextPath + 'trainRearFaultSheetOneAction/add.cn',
			{
				year : $('#updateForm #year').val(),
				month : $('#updateForm #month').val(),
				trainRearFaultSheetOnes :  JSON.stringify(trainRearFaultSheetOnes)
			},function(data,status){
				if(status){
					alert("保存成功!");
				}else{
					alert("保存失败!");
				};
			});
};

//获取保存数据
function getSaveData() {
	var trainRearFaultSheetOnes = [];
	
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

		var rowArray = $(this).children(".numberCell");
		if(rowArray && rowArray.length != 0) {
			var seq = j - 5;// 表头5行
			var obj = new Object();
			
			obj.deviceName = $(rowArray[0]).text();
			
			obj.faultSum = $(rowArray[1]).text();
			obj.stationHost = $(rowArray[2]).text();
			obj.controlBox = $(rowArray[3]).text();
			obj.powerSupply = $(rowArray[4]).text();
			obj.microphone = $(rowArray[5]).text();
			obj.voiceDevice = $(rowArray[6]).text();
			obj.stationAntenna = $(rowArray[7]).text();
			obj.stationOther = $(rowArray[8]).text();
			
			obj.rearControlBox = $(rowArray[9]).text();
			obj.rearAntenna = $(rowArray[10]).text();
			obj.rearOther = $(rowArray[11]).text();
			
			obj.violationHumanR = $(rowArray[12]).text();
			obj.poorMaintenanceR = $(rowArray[13]).text();
			obj.powerSupplyR = $(rowArray[14]).text();
			obj.usersDamagedR = $(rowArray[15]).text();
			obj.materialAdverseR = $(rowArray[16]).text();
			obj.outsideImpedeR = $(rowArray[17]).text();
			obj.touchBad = $(rowArray[18]).text();
			
			obj.faultAnalysis = $('#faultAnalysis').val();
			obj.adviceMeasure = $('#adviceMeasure').val();
			
			obj.belongOrg = belongDepart;
			obj.reporter = reporter;
			obj.phone = phone;
			obj.userfillDate = userfillDate + fillDate.substring(10);
			obj.belongOrgName = belongOrgName;
			obj.dataIndex = seq + 1;
			
			trainRearFaultSheetOnes[seq] = obj;
		};
	});
	return trainRearFaultSheetOnes;
}

//导出Excel
$("#updateDiv #exportBtn").click(function() {
	// 1.首先进行数据的校验
	if(!validateIntNumber($(".editCell"))){
		alert("数据输入错误，请输入整数！");
		return ;
	}
	else{
		// 2.然后行计算总和
		getSumRowData();
		// 3.列计算总和
		getSumColData();
		
		// 4.最后进行数据保存
		var trainRearFaultSheetOnes = getSaveData();
		$.post(contextPath + 'trainRearFaultSheetOneAction/add.cn',
				{
					year : $('#updateForm #year').val(),
					month : $('#updateForm #month').val(),
					trainRearFaultSheetOnes : JSON.stringify(trainRearFaultSheetOnes)
				},function(data,status){
					if(status){
						$("#updateForm").attr("action", "/kunmingrinms/trainRearFaultSheetOneAction/exportShow.cn");
						$("#updateForm").submit();
					}else{
						alert("导出失败!");
					};
			});
	}
	
});

</script>
</body>
</html>
