<%@ page language="java"  import="java.text.*,java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
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
<title>车站设备故障统计分析表</title>
<style id="普铁无线报表报表模板_9609_Styles">
<!--table
.xl979609
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl989609
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;}
.xl999609
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;}
.xl1009609
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
.xl1019609
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
.xl1029609
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
.xl1039609
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
.xl1049609
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
.xl1059609
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
.xl1069609
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
.xl1079609
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
.xl1089609
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
.xl1099609
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
.xl1109609
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
.xl1119609
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
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;}
.xl1129609
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
.xl1139609
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
.xl1149609
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
<div style="margin-bottom:40px;margin-top:1px;">
	<form id="addForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="saveBtn">保存</button>
</div>
<div id="普铁无线报表报表模板_9609" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=1500 class=xl979609
 style='border-collapse:collapse;table-layout:fixed;width:1200px' id="table">
 <col class=xl979609 width=49 style='width:37pt'>
 <col class=xl989609 width=85 style='width:64pt'>
 <col class=xl979609 width=85 style='width:64pt'>
 <col class=xl989609 width=85 span=2 style='width:64pt'>
 <col class=xl989609 width=138 style='width:104pt'>
 <col class=xl979609 width=37 span=8 style='width:28pt'>
 <col class=xl979609 width=198 style='width:149pt'>
 <col class=xl999609 width=101 style='width:76pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl979609 width=49 style='height:15.0pt;width:37pt'></td>
  <td class=xl989609 width=85 style='width:64pt'></td>
  <td class=xl979609 width=85 style='width:64pt'></td>
  <td class=xl989609 width=85 style='width:64pt'></td>
  <td class=xl989609 width=85 style='width:64pt'></td>
  <td class=xl989609 width=138 style='width:104pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=37 style='width:28pt'></td>
  <td class=xl979609 width=198 style='width:149pt'></td>
  <td class=xl979609 width=101 style='width:76pt'></td>
 </tr>
 <tr height=30 style='height:22.5pt'>
  <td colspan=17 height=30 class=xl1099609 style='height:22.5pt'>车站设备故障统计分析</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl1139609 style='height:15.0pt'>填报单位：</td>
  <td colspan=3 class=xl1149609>${sessionScope.user.organization.name}</td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>	
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=2 height=60 class=xl1009609 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>序号</td>
  <td rowspan=2 class=xl1019609 style='border-top:none'>日期</td>
  <td rowspan=2 class=xl1009609 width=85 style='border-top:none;width:64pt'>车站</td>
  <td rowspan=2 class=xl1129609 width=85 style='border-top:none;width:64pt'>设备名称</td>
  <td rowspan=2 class=xl1019609 style='border-top:none'>编号</td>
  <td rowspan=2 class=xl1019609>故障现象</td>
  <td colspan=8 class=xl1029609 style='border-left:none'>原因分析及处理结果</td>
  <td rowspan=2 class=xl1029609>测试检修记录</td>
  <td rowspan=2 class=xl1029609>备注</td>
  <td rowspan=2 class=xl1029609>操作</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl1029609 style='height:30.0pt;border-top:none;
  border-left:none'>主机</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    盒</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl1029609 style='border-top:none;border-left:none'>天线</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>转接<br>
    器</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>解码<br>
    器</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>录音<br>
    设备</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
 </tr>
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl1029609 style='height:15.0pt;border-top:none'>1</td>
  <td class="xl1029609 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1029609 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1029609 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1029609 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1029609 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1029609 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1029609 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1029609" style='border-top:none;border-left:none'>
  	<a class="addRow" href="#" onclick="add_line(1)" id="row1">增加</a></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td rowspan=2 height=60 class=xl1009609 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>合计</td>
  <td class=xl1019609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1019609 style='border-top:none;border-left:none'></td>
  <td class=xl1019609 style='border-top:none;border-left:none'></td>
  <td class=xl1019609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'>主机</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    盒</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl1029609 style='border-top:none;border-left:none'>天线</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>转接<br>
    器</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>解码<br>
    器</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>录音<br>
    设备</td>
  <td class=xl1009609 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl1029609 style='height:15.0pt;border-top:none;
  border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class="xl1029609 radioHost" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 controlBox" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 controlCable" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 aerial" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 adaptor" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 decoder" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 record" style='border-top:none;border-left:none'></td>
  <td class="xl1029609 testWell" style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class=xl1029609 style='border-top:none;border-left:none'></td>
  <td class="xl1029609" style='border-top:none;border-left:none'>
<!--   	<a class="sumRow" href="#" id="sum">计算合计</a> -->
  	</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=2 height=19 class=xl1109609 style='height:14.25pt'>填报人：</td>
  <td colspan=2 class=xl1049609 style='border-top:none;' id="reporter">${sessionScope.user.name}</td>
  <td class=xl1069609></td>
  <td class=xl1079609>联系电话：</td>
  <td colspan=3 class="xl1119609 fillEditCell" id="phone"></td>
  <td class=xl1039609></td>
  <td class=xl1039609></td>
  <td colspan=3 class=xl1109609>填报日期：</td>
  <td class=xl1089609 id="userfillDate">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl1039609></td>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/report/reportValidate.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var fillDate = '<%=fillDate%>';
//增加行记录
function add_line(id){
	var trId = $('#row' + id).parent().parent();  
	$(trId).after('<tr height=20 style="height:15.0pt" class="trClass">' +
		'<td height=20 class=xl1029609 style="height:15.0pt;border-top:none">' + id + '</td>' +
		'<td class="xl1029609 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1029609 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1029609 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1029609 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1029609 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1029609 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1029609 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1029609 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1029609 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1029609 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1029609 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1029609 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1029609 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1029609 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1029609 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1029609" style="border-top:none;border-left:none">' +
		  	'<a class="addRow" href="#" onclick=add_line('+ id +') id=row' + id + '>增加</a>&nbsp;' +
			'<a class="delRow" href="#" onclick="remove_line(this)">删除</a></td>' +
 		'</tr>');
	initElementAttr();
	bindAllEvent();
	sort_line(); // 每次新增完之后进行排序操作
};
var length = 1;
//排序
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
		var lastTD = $container.children().get(16);
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

//点击保存按钮
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
// 2.计算总和
function getSumData(){
	var radioHost = 0;
	var controlBox = 0;
	var controlCable = 0;
	var aerial = 0;
	var adaptor = 0;
	var decoder = 0;
	var record = 0;
	var testWell = 0;
	$("tr").each(function(j) {
		var rowArray = $(this).children(".editCell");
		if(rowArray && rowArray.length != 0) {
			radioHost = parseInt(valueOfNum($(rowArray[5]).text())) + parseInt(radioHost);
			controlBox = parseInt(valueOfNum($(rowArray[6]).text())) + parseInt(controlBox);
			controlCable = parseInt(valueOfNum($(rowArray[7]).text())) + parseInt(controlCable);
			aerial = parseInt(valueOfNum($(rowArray[8]).text())) + parseInt(aerial);
			adaptor = parseInt(valueOfNum($(rowArray[9]).text())) + parseInt(adaptor);
			decoder = parseInt(valueOfNum($(rowArray[10]).text())) + parseInt(decoder);
			record = parseInt(valueOfNum($(rowArray[11]).text())) + parseInt(record);
			testWell = parseInt(valueOfNum($(rowArray[12]).text())) + parseInt(testWell);
		}
	});
	$('.radioHost').html(radioHost);
	$('.controlBox').html(controlBox);
	$('.controlCable').html(controlCable);
	$('.aerial').html(aerial);
	$('.adaptor').html(adaptor);
	$('.decoder').html(decoder);
	$('.record').html(record);
	$('.testWell').html(testWell);
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
	
	var wirelessDeviceSheetEight = getSaveData();
	
	$.post(contextPath + 'wirelessDeviceSheetEightAction/add.cn',
			{
				year : $('#addForm #year').val(),
				month : $('#addForm #month').val(),
				wirelessDeviceSheetEight :  JSON.stringify(wirelessDeviceSheetEight)
			},function(data,status){
				if(status){
					alert("保存成功!");
				}else{
					alert("保存失败!");
				}
			});
};

//获取保存数据
function getSaveData() {
	
	var wirelessDeviceSheetEight = [];
	
	// 填报人
	var reporter = $("#reporter").text();
	// 联系电话
	var phone = $("#phone").text();
	// 填报日期
	var userfillDate = $("#userfillDate").html();
	// 填报单位
	var belongDepart = "${sessionScope.user.organization.id}";
	// 填报单位名
	var belongOrgName = "${sessionScope.user.organization.name}";
	
	$("tr").each(function(j) {

		var rowArray = $(this).children(".editCell");
		if(rowArray && rowArray.length != 0) {
			var seq = j - 5;// 表头5行
			var obj = new Object();
			
			obj.date = $(rowArray[0]).text();
			obj.station = $(rowArray[1]).text();
			obj.equipmentName = $(rowArray[2]).text();
			obj.identifier = $(rowArray[3]).text();
			obj.faultPhenomenon = $(rowArray[4]).text();
			
			obj.radioHost = $(rowArray[5]).text();
			obj.controlBox = $(rowArray[6]).text();
			obj.controlCable = $(rowArray[7]).text();
			obj.aerial = $(rowArray[8]).text();
			obj.adaptor = $(rowArray[9]).text();
			obj.decoder = $(rowArray[10]).text();
			obj.record = $(rowArray[11]).text();
			obj.testWell = $(rowArray[12]).text();
			
			obj.testFixNote = $(rowArray[13]).text();
			obj.remark = $(rowArray[14]).text();
			
			obj.orgId = belongDepart;
			obj.userId = reporter;
			obj.phone = phone;
			obj.userfillDate = userfillDate + fillDate.substring(10);
			obj.belongOrgName = belongOrgName;
			obj.seq = seq + 1;
			
			wirelessDeviceSheetEight[seq] = obj;
		}
	});
	
	return wirelessDeviceSheetEight;
}

</script>
</body>
</html>