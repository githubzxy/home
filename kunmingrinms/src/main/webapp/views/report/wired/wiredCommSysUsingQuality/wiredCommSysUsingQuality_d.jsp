<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />

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
	white-space:normal;}
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
	white-space:normal;}
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

.bui-select-list {
    height : 250px;
}
</style>
</head>

<body>

<div style="margin-top: 20px;">
	<label style="float:left;margin-left: 20px;">车间：</label>
	<form id="countForm" method="post">
		<div id="orgSelect" style="float:left; margin-right: 5px;">
		</div>
		<input type="hidden" id="belongDepart" name="belongDepart" value="${requestScope.belongDepart}" >
		<input type="hidden" id="belongDepartName" name="belongDepartName" value="${requestScope.belongDepartName}" >
		<input type="hidden" id="year" name="year" value="${param.year}" >
		<input type="hidden" id="month" name="month" value="${param.month}" >
	</form>
	<button type="submit" id="searchBtn" >查询</button>
	<button type="button" id="exportBtn" >导出Excel</button>
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
  <td colspan=14 class=xl7020428 style='white-space:normal;'>${requestScope.belongDepartName}</td>
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
  <c:forEach items="${requestScope.result[0]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[0]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>2</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>行车录音</td>
  <td class=xl7420428 style='border-top:none'>录音完整清晰度、时间检查</td>
  <c:forEach items="${requestScope.result[1]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[1]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>3</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>会议</td>
  <td class=xl7420428 style='border-top:none'>图像监视、声音监听</td>
  <c:forEach items="${requestScope.result[2]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[2]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>4</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>电话</td>
  <td class=xl7420428 style='border-top:none'>114应答、报号时间</td>
  <c:forEach items="${requestScope.result[3]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[3]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>5</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>电报</td>
  <td class=xl7520428 width=199 style='border-top:none;width:149pt'>标准率，优质率，时限率，站名略号、统称语、业务资料准确率</td>
  <c:forEach items="${requestScope.result[4]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[4]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>6</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>应急</td>
  <td class=xl7420428 style='border-top:none'>时限合格，图像监视、声音监听</td>
  <c:forEach items="${requestScope.result[5]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[5]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>7</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>传输</td>
  <td class=xl7520428 width=199 style='border-top:none;width:149pt'>误码、光功率</td>
  <c:forEach items="${requestScope.result[6]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[6]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>8</td>
  <td class=xl7320428 style='border-top:none;border-left:none'>数据</td>
  <td class=xl7420428 style='border-top:none'>延时、延时变化、丢包测试</td>
  <c:forEach items="${requestScope.result[7]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[7]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
 <tr class="editRow"  height=33 style='height:24.95pt'>
  <td height=33 class=xl6920428 style='height:24.95pt;border-top:none'>9</td>
  <td class=xl7620428 width=99 style='border-top:none;border-left:none;
  width:74pt'>综合视频监控</td>
  <td class=xl6920428 style='border-top:none'>图像质量</td>
  <c:forEach items="${requestScope.result[8]}" varStatus="i" var="item" begin="0" end="15">
	<td class="xl6820428" style='border-top:none;border-left:none'>${item}</td>
  </c:forEach>
  <c:if test="${empty requestScope.result[8]}">
  	<c:forEach var="item" begin="0" end="15">
  		<td class="xl6820428" style='border-top:none;border-left:none'></td>
  	</c:forEach>
  </c:if>
 </tr>
</table>
</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';

var select;
BUI.use(['bui/data', 'bui/select'], function(Data, Select) {
	var store = new Data.Store({
		autoLoad : true,
		proxy : {
			url : contextPath + "wiredCommSysUsingQualityAction/getReportOrgs.cn",
			method : 'post'
		},
		params : {
			year : $("#year").val(),
			month : $("#month").val()
		}
	});
	select = new Select.Select({
		width : 250,
		render : '#orgSelect',
		valueField : '#belongDepart',
		multipleSelect : true,
		store : store
	});
	select.render();
	select.on("change", function(ev) {

		if(ev.item.value == "-1") {// 选中全部
			if($(".bui-list-item:first").hasClass("bui-list-item-selected")) {
				$(".bui-list-item").addClass("bui-list-item-selected");
			} else {
				$(".bui-list-item").removeClass("bui-list-item-selected");
			}
		} else {
			$(".bui-list-item:first").removeClass("bui-list-item-selected");
		}
		
		$("#belongDepart").val(select.getSelectedValue());
		$("#belongDepartName").val(select.getSelectedText());
		$("#orgSelect .bui-select .bui-select-input").val(select.getSelectedText());
	});
	
	$("#searchBtn").click(function() {
		$("#countForm").attr("action", "/kunmingrinms/wiredCommSysUsingQualityAction/getSegmentSummaryByDto.cn");
		$("#countForm").submit();
	});
	
	$("#exportBtn").click(function() {
		$("#countForm").attr("action", "/kunmingrinms/wiredCommSysUsingQualityAction/exportSegment.cn");
		$("#countForm").submit();
	});
	
});
</script>
</body>
</html>