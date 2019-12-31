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
<style>
<!--table
.xl666057
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
.xl676057
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
	white-space:normal;
	layout-flow:vertical-ideographic;}
.xl686057
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
.xl696057
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
.xl706057
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
.xl716057
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
.xl726057
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
.xl736057
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:windowtext;
	font-size:18.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl746057
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
.xl756057
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
.xl786057
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
.xl816057
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
.xl836057
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
.xl846057
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
.xl856057
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
.xl866057
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
.xl886057
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
.xl896057
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
.xl906057
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
-->
.editRow{ 
 	cursor : pointer;
 	background-color: #FEFECC;
}
.noEditCell{
	cursor : default;
	background-color: #ffffff;
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

<div id="（普速）有线通信故障（障碍）月度统计表_6057" align=center>
<table border=0 cellpadding=0 cellspacing=0 width=1166 class=xl666057
 style='border-collapse:collapse;table-layout:fixed;width:881pt'>
 <col class=xl666057 width=79 style='width:59pt'>
 <col class=xl666057 width=37 style='width:28pt'>
 <col class=xl666057 width=88 style='width:66pt'>
 <col class=xl666057 width=37 span=26 style='width:28pt'>
 <tr height=29 style='height:21.95pt'>
  <td colspan=29 height=29 class=xl736057 width=1166 style='height:21.95pt;
  width:881pt'>（普速）有线通信故障（障碍）月度统计表</td>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td height=26 class=xl706057 style='height:20.1pt'>填报单位:</td>
  <td colspan=2 class="xl846057" id="belongDepart">${sessionScope.user.organization.name }</td>
  <td class=xl686057></td>
  <td class=xl666057></td>
  <td class=xl686057></td>
  <td class=xl686057></td>
  <td class=xl686057></td>
  <td class=xl686057></td>
  <td class=xl686057></td>
  <td class=xl686057></td>
  <td class=xl686057></td>
  <td class=xl666057></td>
  <td colspan=2 class=xl856057>填报日期：</td>
  <td colspan=2 class="xl866057" id="userfillDate">${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}</td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td colspan=3 class=xl886057>普速有线通信报-2</td>
  <td class=xl716057></td>
 </tr>
 <tr class=xl676057 height=26 style='height:20.1pt'>
  <td rowspan=4 height=104 class=xl746057 dir=LTR width=79 style='height:80.4pt;
  border-top:none;width:59pt'>单位</td>
  <td rowspan=4 class=xl756057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>故障和障碍总件数</td>
  <td rowspan=4 class=xl756057 dir=LTR width=88 style='border-bottom:1pt solid black;
  border-top:none;width:66pt'>故障和障碍总延时</td>
  <td rowspan=4 class=xl756057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>设备换算皮长公里</td>
  <td rowspan=4 class=xl746057 dir=LTR width=37 style='width:28pt'>每百公里件数</td>
  <td colspan=7 class=xl786057 dir=LTR width=259 style='border-right:1pt solid black;
  border-left:none;width:196pt'>故障</td>
  <td colspan=17 class=xl786057 dir=LTR width=629 style='border-right:1pt solid black;
  border-left:none;width:476pt'>障碍</td>
 </tr>
 <tr class=xl676057 height=26 style='height:20.1pt'>
  <td colspan=3 height=26 class=xl786057 dir=LTR width=111 style='height:20.1pt;
  border-left:none;width:84pt'>故障合计</td>
  <td colspan=2 class=xl786057 dir=LTR width=74 style='border-right:1pt solid black;
  width:56pt'>责任</td>
  <td colspan=2 class=xl786057 dir=LTR width=74 style='border-left:none;
  width:56pt'>非责任</td>
  <td colspan=3 class=xl786057 dir=LTR width=111 style='border-right:1pt solid black;
  width:84pt'>障碍合计</td>
  <td colspan=7 class=xl696057 dir=LTR style='border-left:none'>一类障碍</td>
  <td colspan=7 class=xl696057 dir=LTR style='border-left:none'>二类障碍</td>
 </tr>
 <tr class=xl676057 height=26 style='height:20.1pt'>
  <td rowspan=2 height=52 class=xl836057 dir=LTR style='height:40.2pt;
  border-top:none'>件数</td>
  <td rowspan=2 class=xl836057 dir=LTR style='border-top:none'>延时</td>
  <td rowspan=2 class=xl756057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>平均延时</td>
  <td rowspan=2 class=xl816057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>件数</td>
  <td rowspan=2 class=xl816057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>延时</td>
  <td rowspan=2 class=xl816057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>件数</td>
  <td rowspan=2 class=xl816057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>延时</td>
  <td rowspan=2 class=xl816057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>件数</td>
  <td rowspan=2 class=xl816057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>延时</td>
  <td rowspan=2 class=xl756057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>平均延时</td>
  <td rowspan=2 class=xl836057 dir=LTR style='border-top:none'>件数</td>
  <td rowspan=2 class=xl836057 dir=LTR style='border-top:none'>延时</td>
  <td rowspan=2 class=xl756057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>平均延时</td>
  <td colspan=2 class=xl696057 dir=LTR style='border-left:none'>责任</td>
  <td colspan=2 class=xl696057 dir=LTR style='border-left:none'>非责任</td>
  <td rowspan=2 class=xl836057 dir=LTR style='border-top:none'>件数</td>
  <td rowspan=2 class=xl836057 dir=LTR style='border-top:none'>延时</td>
  <td rowspan=2 class=xl756057 dir=LTR width=37 style='border-bottom:1pt solid black;
  border-top:none;width:28pt'>平均延时</td>
  <td colspan=2 class=xl696057 dir=LTR style='border-left:none'>责任</td>
  <td colspan=2 class=xl696057 dir=LTR style='border-left:none'>非责任</td>
 </tr>
 <tr class=xl676057 height=26 style='height:20.1pt'>
  <td height=26 class=xl696057 dir=LTR style='height:20.1pt;border-top:none;
  border-left:none'>件数</td>
  <td class=xl696057 dir=LTR style='border-top:none;border-left:none'>延时</td>
  <td class=xl696057 dir=LTR style='border-top:none;border-left:none'>件数</td>
  <td class=xl696057 dir=LTR style='border-top:none;border-left:none'>延时</td>
  <td class=xl696057 dir=LTR style='border-top:none;border-left:none'>件数</td>
  <td class=xl696057 dir=LTR style='border-top:none;border-left:none'>延时</td>
  <td class=xl696057 dir=LTR style='border-top:none;border-left:none'>件数</td>
  <td class=xl696057 dir=LTR style='border-top:none;border-left:none'>延时</td>
 </tr>
 <tr height=26 style='height:20.1pt'>
  <td height=26 class=xl696057 style='height:20.1pt;border-top:none'>1</td>
  <td class=xl696057 style='border-top:none;border-left:none'>2</td>
  <td class=xl696057 style='border-top:none;border-left:none'>3</td>
  <td class=xl696057 style='border-top:none;border-left:none'>4</td>
  <td class=xl696057 style='border-top:none;border-left:none'>5</td>
  <td class=xl696057 style='border-top:none;border-left:none'>6</td>
  <td class=xl696057 style='border-top:none;border-left:none'>7</td>
  <td class=xl696057 style='border-top:none;border-left:none'>8</td>
  <td class=xl696057 style='border-top:none;border-left:none'>9</td>
  <td class=xl696057 style='border-top:none;border-left:none'>10</td>
  <td class=xl696057 style='border-top:none;border-left:none'>11</td>
  <td class=xl696057 style='border-top:none;border-left:none'>12</td>
  <td class=xl696057 style='border-top:none;border-left:none'>13</td>
  <td class=xl696057 style='border-top:none;border-left:none'>14</td>
  <td class=xl696057 style='border-top:none;border-left:none'>15</td>
  <td class=xl696057 style='border-top:none;border-left:none'>16</td>
  <td class=xl696057 style='border-top:none;border-left:none'>17</td>
  <td class=xl696057 style='border-top:none;border-left:none'>18</td>
  <td class=xl696057 style='border-top:none;border-left:none'>19</td>
  <td class=xl696057 style='border-top:none;border-left:none'>20</td>
  <td class=xl696057 style='border-top:none;border-left:none'>21</td>
  <td class=xl696057 style='border-top:none;border-left:none'>22</td>
  <td class=xl696057 style='border-top:none;border-left:none'>23</td>
  <td class=xl696057 style='border-top:none;border-left:none'>24</td>
  <td class=xl696057 style='border-top:none;border-left:none'>25</td>
  <td class=xl696057 style='border-top:none;border-left:none'>26</td>
  <td class=xl696057 style='border-top:none;border-left:none'>27</td>
  <td class=xl696057 style='border-top:none;border-left:none'>28</td>
  <td class=xl696057 style='border-top:none;border-left:none'>29</td>
 </tr>
 <tr class="editRow"  height=26 style='height:20.1pt'>
  <td height=26  class="xl696057 noEditCell" style='height:20.1pt;border-top:none;white-space:normal;'>${sessionScope.user.organization.name }</td>
  <td class="xl696057 "  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
  <td class="xl696057"  style='border-top:none;border-left:none'></td>
 </tr>
 <tr class=xl666057 height=26 style='height:20.1pt'>
  <td colspan=2 height=26 class=xl896057 style='height:20.1pt'>单位负责人：</td>
  <td class="xl726057 fillEditCell" id="principal"></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td colspan=2 class=xl896057>填报人：</td>
  <td colspan="3" class="xl726057" id="reporter">${sessionScope.user.name}</td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td colspan=2 class=xl896057>联系电话：</td>
  <td colspan=3 class="xl906057 fillEditCell" id="phone"></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
  <td class=xl666057></td>
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
	$(".editRow td").attr("contenteditable", "true");
	$(".noEditCell").attr("contenteditable", "false");//第一个单元格不可编辑
	$(".fillEditCell").attr("contenteditable", "true");
}

//绑定事件
function bindAllEvent() {
 	$(".editRow").mouseover(highlightRow);
	$("#saveBtn").click(saveBtn);
}

//高亮行
function highlightRow() {
	$(".editRow td").removeClass("activeRow");
	$(this).find("td").addClass("activeRow");
	$(".noEditCell").removeClass("activeRow");
}

function saveBtn() {
	if(!validateDoubleNumber($("table .editRow td:gt(0)"))){//验证浮点数单元格（第一个除外）
		alert("请输入有效的非负数字！");
		return false;
	};
	//验证联系电话
// 	if(!validatePhone($("#phone"))){
// 		return;
// 	}
	
	var wiredCommFault = getSaveData();
	$.post(contextPath + 'wiredCommunicationFaultAction/add.cn',
			{
				year : $("#year").val(),
				month : $("#month").val(),
				wiredCommFault :  JSON.stringify(wiredCommFault)
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
	var wiredCommFault=[];
	
	var row=$("table .editRow td");
	var length=row.length;
	for(var i=0;i<length;i++){
		wiredCommFault[i]=$(row[i]).text();//将添加的数据存入数组
	};
	wiredCommFault[length]="${sessionScope.user.organization.id}";// 填报单位id
	wiredCommFault[length+1]=$("#userfillDate").text();//用户填报日期
	wiredCommFault[length+2]=$("#principal").text();// 负责人
	wiredCommFault[length+3]=$("#reporter").text();// 填报人
	wiredCommFault[length+4]=$("#phone").text();// 联系电话
	return wiredCommFault;
}
</script>
</body>
</html>