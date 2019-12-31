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
<title>新增无线机车故障统计分析表</title>
<style id="普铁无线报表报表模板_8944_Styles">
<!--table
.xl978944
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
.xl988944
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
.xl998944
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
.xl1008944
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
.xl1018944
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
.xl1028944
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
.xl1038944
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
.xl1048944
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;}
.xl1058944
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
.xl1068944
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
.xl1078944
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
.xl1088944
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
.xl1098944
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
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
.xl1108944
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
.xl1118944
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
<div id="普铁无线报表报表模板_8944" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=1500 class=xl978944
 style='border-collapse:collapse;table-layout:fixed;width:1000px' id="table">
 <col class=xl978944 width=49 style='width:37pt'>
 <col class=xl988944 width=49 style='width:37pt'>
 <col class=xl978944 width=49 style='width:37pt'>
 <col class=xl988944 width=49 span=2 style='width:37pt'>
 <col class=xl988944 width=138 style='width:104pt'>
 <col class=xl978944 width=37 span=7 style='width:28pt'>
 <col class=xl978944 width=180 style='width:135pt'>
 <col class=xl998944 width=101 style='mso-width-alt:3232;width:76pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl978944 width=49 style='height:15.0pt;width:37pt'></td>
  <td class=xl988944 width=49 style='width:37pt'></td>
  <td class=xl978944 width=49 style='width:37pt'></td>
  <td class=xl988944 width=49 style='width:37pt'></td>
  <td class=xl988944 width=49 style='width:37pt'></td>
  <td class=xl988944 width=138 style='width:104pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=37 style='width:28pt'></td>
  <td class=xl978944 width=180 style='width:135pt'></td>
  <td class=xl978944 width=101 style='width:76pt'></td>
 </tr>
 <tr height=30 style='height:22.5pt'>
  <td colspan=16 height=30 class=xl1108944 style='height:22.5pt'>机车故障统计分析</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl1078944 style='height:15.0pt'>填报单位：</td>
  <td colspan=3 class=xl1088944>${sessionScope.user.organization.name}</td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
  <td class=xl978944></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=2 height=60 class=xl1028944 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>序号</td>
  <td rowspan=2 class=xl1008944 style='border-top:none'>日期</td>
  <td rowspan=2 class=xl1028944 width=49 style='border-top:none;width:37pt'>机车<br>
    型号</td>
  <td rowspan=2 class=xl1008944 style='border-top:none'>机车号</td>
  <td rowspan=2 class=xl1008944 style='border-top:none'>类型</td>
  <td rowspan=2 class=xl1008944>司机报故障现象</td>
  <td colspan=7 class=xl1018944 style='border-left:none'>原因分析及处理结果</td>
  <td rowspan=2 class=xl1018944>测试检修记录</td>
  <td rowspan=2 class=xl1018944>备注</td>
  <td rowspan=2 class=xl1018944>操作</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl1028944 width=37 style='height:30.0pt;border-top:none;
  border-left:none;width:28pt'>电台<br>
    主机</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    盒</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>话筒</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>喇叭</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>天线</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
 </tr>
 <tr height=20 style='height:15.0pt' class="trClass">
  <td height=20 class=xl1018944 style='height:15.0pt;border-top:none'>1</td>
  <td class="xl1008944 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1008944 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1008944 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1008944 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1008944 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1018944 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 editCell numberCell" style='border-top:none;border-left:none'></td>
  <td class="xl1008944 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1008944 editCell" style='border-top:none;border-left:none;'></td>
  <td class="xl1008944" style='border-top:none;border-left:none'>
  	<a class="addRow" href="#" onclick="add_line(1)" id="row1">增加</a></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td rowspan=2 height=60 class=xl1028944 width=49 style='height:45.0pt;
  border-top:none;width:37pt'>合计</td>
  <td class=xl1008944 style='border-top:none;border-left:none'></td>
  <td class=xl1018944 style='border-top:none;border-left:none'></td>
  <td class=xl1008944 style='border-top:none;border-left:none'></td>
  <td class=xl1008944 style='border-top:none;border-left:none'></td>
  <td class=xl1008944 style='border-top:none;border-left:none'></td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>电台<br>
    主机</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    盒</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>话筒</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>喇叭</td>
  <td class=xl1018944 style='border-top:none;border-left:none'>天线</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>控制<br>
    电缆</td>
  <td class=xl1028944 width=37 style='border-top:none;border-left:none;
  width:28pt'>试验<br>
    良好</td>
  <td class=xl1018944 style='border-top:none;border-left:none'></td>
  <td class=xl1018944 style='border-top:none;border-left:none'></td>
  <td class=xl1018944 style='border-top:none;border-left:none'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class="xl1018944" style='height:15.0pt;border-top:none;
  border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 radioHost" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 controlBox" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 mike" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 speaker" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 aerial" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 controlCable" style='border-top:none;border-left:none'></td>
  <td class="xl1018944 testWell" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'></td>
  <td class="xl1018944" style='border-top:none;border-left:none'>
<!--   	<a class="sumRow" href="#" id="sum">计算合计</a> -->
  	</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl1058944 style='height:15.0pt'>填报人：</td>
  <td colspan=2 class=xl1068944 id="reporter">${sessionScope.user.name}</td>
  <td class=xl988944></td>
  <td class=xl1038944>联系电话：</td>
  <td colspan=3 class="xl1068944 fillEditCell" id="phone"></td>
  <td class=xl978944></td>
  <td colspan=3 class=xl1098944>填报日期：</td>
  <td class=xl1048944 id="userfillDate">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl978944></td>
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
		'<td height=20 class=xl1018944 style="height:15.0pt;border-top:none">' + id + '</td>' +
		'<td class="xl1018944 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1018944 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1018944 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1018944 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1018944 editCell" style="border-top:none;border-left:none;"></td>' +
		'<td class="xl1018944 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1018944 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1018944 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1018944 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1018944 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1018944 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1018944 editCell numberCell" style="border-top:none;border-left:none"></td>' +
		'<td class="xl1018944 editCell" style="border-top:none;border-left:none;white-space:normal;"></td>' +
		'<td class="xl1018944 editCell" style="border-top:none;border-left:none;white-space:normal;"></td>' +
		'<td class="xl1018944" style="border-top:none;border-left:none">' +
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
		var lastTD = $container.children().get(15);
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
	var mike = 0;
	var speaker = 0;
	var aerial = 0;
	var controlCable = 0;
	var testWell = 0;
	$("tr").each(function(j) {
		var rowArray = $(this).children(".editCell");
		if(rowArray && rowArray.length != 0) {
			radioHost = parseInt(valueOfNum($(rowArray[5]).text())) + parseInt(radioHost);
			controlBox = parseInt(valueOfNum($(rowArray[6]).text())) + parseInt(controlBox);
			mike = parseInt(valueOfNum($(rowArray[7]).text())) + parseInt(mike);
			speaker = parseInt(valueOfNum($(rowArray[8]).text())) + parseInt(speaker);
			aerial = parseInt(valueOfNum($(rowArray[9]).text())) + parseInt(aerial);
			controlCable = parseInt(valueOfNum($(rowArray[10]).text())) + parseInt(controlCable);
			testWell = parseInt(valueOfNum($(rowArray[11]).text())) + parseInt(testWell);
		}
	});
	$('.radioHost').html(radioHost);
	$('.controlBox').html(controlBox);
	$('.mike').html(mike);
	$('.speaker').html(speaker);
	$('.aerial').html(aerial);
	$('.controlCable').html(controlCable);
	$('.testWell').html(testWell);
};
//若为空,则转换为0
function valueOfNum(num){
	if(num == "" || num == null){
		return 0;
	}else{
		return num;
	}
}

// 3.保存数据
function saveData(){
	
	var wirelessDeviceSheetSeven = getSaveData();
	
	$.post(contextPath + 'wirelessDeviceSheetSevenAction/add.cn',
			{
				year : $('#addForm #year').val(),
				month : $('#addForm #month').val(),
				wirelessDeviceSheetSeven :  JSON.stringify(wirelessDeviceSheetSeven)
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
	
	var wirelessDeviceSheetSeven = [];
	
	// 填报人
	var reporter = $("#reporter").text();
	// 填报单位
	var belongDepart = "${sessionScope.user.organization.id}";
	// 联系电话
	var phone = $("#phone").text();
	// 填报日期
	var userfillDate = $("#userfillDate").html();
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
			
			obj.radioHost = $(rowArray[5]).text();
			obj.controlBox = $(rowArray[6]).text();
			obj.mike = $(rowArray[7]).text();
			obj.speaker = $(rowArray[8]).text();
			obj.aerial = $(rowArray[9]).text();
			obj.controlCable = $(rowArray[10]).text();
			obj.testWell = $(rowArray[11]).text();
			
			obj.testFixNote = $(rowArray[12]).text();
			obj.remark = $(rowArray[13]).text();
			
			obj.orgId = belongDepart;
			obj.userId = reporter;
			obj.phone = phone;
			obj.userfillDate = userfillDate + fillDate.substring(10);
			obj.belongOrgName = belongOrgName;
			obj.seq = seq + 1;
			
			wirelessDeviceSheetSeven[seq] = obj;
		}
	});
	
	return wirelessDeviceSheetSeven;
}

</script>
</body>
</html>