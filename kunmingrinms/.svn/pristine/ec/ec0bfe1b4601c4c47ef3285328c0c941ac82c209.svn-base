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
<title>新增机车列尾控制盒故障处理情况报表</title>
<style id="普铁无线报表报表模板_10009_Styles">
<!--table
.xl9710009
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
.xl9810009
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
.xl9910009
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
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl10010009
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
	border:1.0pt solid windowtext;
	white-space:normal;}
.xl10110009
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
.xl10210009
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
.xl10310009
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
.xl10410009
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
.xl10510009
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
.xl10610009
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
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:nowrap;}
.xl10710009
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
.xl10810009
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
.xl10910009
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
.xl11010009
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
.xl11110009
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
.xl11210009
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
.xl11310009
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
.xl11410009
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
.xl11510009
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
<div>
	<form id="addForm" method="post">
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button id="saveBtn">保存</button>
</div>
<div id="普铁无线报表报表模板_10009" align=center>
<table border=0 cellpadding=0 cellspacing=0 style='border-collapse:
 collapse;table-layout:fixed;width:1574px' id="table">
 <col width=45 style='width:34pt'>
 <col width=85 span=5 style='width:64pt'>
 <col class=xl9710009 width=85 style='width:64pt'>
 <col width=85 span=6 style='width:64pt'>
 <col width=117 span=2 style='width:88pt'>
 <col width=85 span=2 style='width:64pt'>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl10410009 width=45 style='height:24.95pt;width:34pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10510009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=117 style='width:88pt'></td>
  <td class=xl10410009 width=117 style='width:88pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
  <td class=xl10410009 width=85 style='width:64pt'></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=18 height=33 class=xl11510009 style='height:24.95pt'>机车列尾控制盒故障处理情况报表</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td colspan=2 height=33 class=xl11010009 style='height:24.95pt'>填报单位：</td>
  <td colspan=3 class=xl11110009>${sessionScope.user.organization.name}</td>
  <td class=xl10610009></td>
  <td class=xl10510009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
  <td class=xl10410009></td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td rowspan=2 height=66 class=xl9910009 width=45 style='height:49.9pt;
  border-top:none;width:34pt'>序号</td>
  <td colspan=7 class=xl9910009 width=595 style='border-left:none;width:448pt'>列尾故障受理情况</td>
  <td colspan=5 class=xl9910009 width=425 style='border-left:none;width:320pt'>故障处理情况</td>
  <td colspan=2 class=xl9910009 width=234 style='border-left:none;width:176pt'>更换控制盒情况</td>
  <td rowspan=2 class=xl9910009 width=85 style='width:64pt'>检修人</td>
  <td rowspan=2 class=xl9910009 width=85 style='width:64pt'>备注</td>
  <td rowspan=2 class=xl9910009 width=85 style='width:64pt'>操作</td>
 </tr>
 <tr height=33 style='height:24.95pt'>
  <td height=33 class=xl9910009 width=85 style='height:24.95pt;border-top:none;
  border-left:none;width:64pt'>日期</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>时间</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>受理人</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>机车类型<br>
    /号码</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>控制盒号码<br>
    （1/2室）</td>
  <td class=xl10010009 width=85 style='border-top:none;border-left:none;
  width:64pt'>报故障控制盒号码</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>故障现象</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>入库日期</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>入库时间</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>列尾设备检测</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>故障处理情况</td>
  <td class=xl9910009 width=85 style='border-top:none;border-left:none;
  width:64pt'>数据下载上传单位及姓名</td>
  <td class=xl9910009 width=117 style='border-top:none;border-left:none;
  width:88pt'>故障控制盒号码<br>
    （1/2室）</td>
  <td class=xl9910009 width=117 style='border-top:none;border-left:none;
  width:88pt'>更换后控制盒号码<br>
    （1/2室）</td>
 </tr>
 <tr height=33 style='height:24.95pt' class="trClass">
  <td height=33 class=xl10110009 width=45 style='height:24.95pt;border-top:
  none;width:34pt'>1</td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10310009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10210009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10310009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=117 style='border-top:none;border-left:none;
  width:88pt'></td>
  <td class="xl10110009 editCell" width=117 style='border-top:none;border-left:none;
  width:88pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009 editCell" width=85 style='border-top:none;border-left:none;
  width:64pt'></td>
  <td class="xl10110009" width=85 style='border-top:none;border-left:none;
  width:64pt'>
  	<a class="addRow" href="#" onclick="add_line(1)" id="row1">增加</a></td>
 </tr>
 <tr height=35 style='height:26.25pt' id="endLine">
  <td colspan=2 height=35 class=xl10910009 style='height:26.25pt'>填报人：</td>
  <td colspan=2 class="xl9810009 fillEditCell" style='border-top:none;white-space:normal;' id="reporter">${sessionScope.user.name}</td>
   <td class=xl10710009 style='border-top:none'></td>
  <td colspan=2 class=xl10910009>联系电话：</td>
  <td colspan=2 class="xl11310009 fillEditCell" id="phone"></td>
  <td class=xl10710009 style='border-top:none'></td>
  <td class=xl10810009 style='border-top:none'></td>
  <td colspan=2 class=xl11210009>填报日期：</td>
  <td colspan=2 class="xl11410009">
  	<input class="xl11410009" readonly="readonly" id="userfillDate" style="border: black; width:230px;height:30px" value="${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}"/></td>
  <td class=xl10710009 style='border-top:none'></td>
  <td class=xl10710009 style='border-top:none'></td>
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
		'<td height=33 class=xl10110009 width=45 style="height:24.95pt;width:34pt">' + id + '</td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10310009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10210009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10310009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009 editCell" width=85 style="border-left:none; width:64pt"></td>' +
		'<td class="xl10110009" width=85 style="border-left:none; width:64pt">' +
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
		var lastTD = $container.children().get(17);
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

// 点击保存按钮
$('#saveBtn').on('click',function(){
	// 长度校验
	if(!checkDataLength($(".editCell"))){
		alert("数据输入过长，最多250个字符！");
		return ;
	}
	saveData();
});

// 数据保存
function saveData(){ 
	var trainRearFaultSheetTwos = getSaveData();
	
	$.post(contextPath + 'trainRearFaultAction/add.cn',
			{
				year : $('#addForm #year').val(),
				month : $('#addForm #month').val(),
				trainRearFaultSheetTwos :  JSON.stringify(trainRearFaultSheetTwos)
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
	var trainRearFaultSheetTwos = [];
	
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
			obj.time = $(rowArray[1]).text();
			obj.acceptPerson = $(rowArray[2]).text();
			obj.trainType = $(rowArray[3]).text();
			obj.controlBox = $(rowArray[4]).text();
			obj.faultControlBox = $(rowArray[5]).text();
			obj.faultPhenomenon = $(rowArray[6]).text();

			obj.enterDate = $(rowArray[7]).text();
			obj.enterTime = $(rowArray[8]).text();
			obj.deviceExamine = $(rowArray[9]).text();
			obj.dealFault = $(rowArray[10]).text();
			obj.upAndDown = $(rowArray[11]).text();
			obj.faultBoxNum = $(rowArray[12]).text();
			obj.changeFaultBoxNum = $(rowArray[13]).text();
			obj.repairPerson = $(rowArray[14]).text();
			obj.memo = $(rowArray[15]).text();
			
			obj.belongOrg = belongDepart;
			obj.reporter = reporter;
			obj.phone = phone;
			obj.userfillDate = userfillDate + fillDate.substring(10);
			obj.belongOrgName = belongOrgName;
			obj.dataIndex = seq + 1;
			
			trainRearFaultSheetTwos[seq] = obj;
		}
	});
	
	return trainRearFaultSheetTwos;
}

</script>
</body>
</html>
