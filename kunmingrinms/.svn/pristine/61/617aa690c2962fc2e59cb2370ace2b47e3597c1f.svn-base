<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>通信设备（线路）质量提高计划统计表</title>
	<meta charset="utf-8">
    
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css" />
  </head>
  <body>
  	 	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" />
  	 	<input id="baseId" type="hidden" />
  	 	
  	 	<div class="autumn_table_div">
  	 	<!-- 表格1 -->
  	 		<span class="autumn_table_title">通信设备（线路）质量提高计划统计表</span>
  	 		<div class="oper_button_div">
  	 			<button class="table1_base_update">报表基本信息填写</button>
  	 			<button class="export_excel">导出excel</button>
  	 		</div>
	  	 	<table id="table1" class="autumn_table autumn_table_background"  >
	  	 		<thead>
	  	 			<tr>
		  	 			<td colspan="2">填表单位：</td>
		  	 			<td colspan="9" class="left"><span id="orgName" >${sessionScope.user.organization.name}</span></td>
		  	 			<td colspan="1">年度：</td>
		  	 			<td colspan="1" class="left"><span id="year" >${param.yearNum}</span></td>
		  	 		</tr>
	  	 			<tr>
	  	 				<td width="3%" rowspan="2">序号</td>
	  	 				<td width="10%" rowspan="2">设备名称</td>
	  	 				<td width="5%" rowspan="2">计量单位</td>
	  	 				<td width="5%" rowspan="2">总数量</td>
	  	 				<td width="10%" colspan="2">上年度质量状况</td>
	  	 				<td width="20%" colspan="4">季度提高计划</td>
	  	 				<td width="15%" rowspan="2">采取措施</td>
	  	 				<td width="10%" rowspan="2">未完成情况说明</td>
	  	 				<td width="10%" rowspan="2">备注</td>
	  	 				<td width="5%" rowspan= "2"></td>
	  	 			</tr>
		  	 		<tr>
		  	 			<td width="5%">合格数</td>
	  	 				<td width="5%">不合格数</td>
		  	 			<td width="5%">1</td>
		  	 			<td width="5%">2</td>
		  	 			<td width="5%">3</td>
		  	 			<td width="5%">4</td>
		  	 		</tr>
		  	 	</thead>
		  	 	<tr id = "base">
	  	 			<td colspan="2" class="right">单位负责人：</td>
	  	 			<td colspan="3" class="left"><span id="fill_duty_user" ></span></td>
	  	 			<td colspan="1" class="right">填报人：</td>
	  	 			<td colspan="2" class="left"><span id="fill_user" >${sessionScope.user.name}</span></td>
	  	 			<td colspan="2" class="right">填报日期：</td>
	  	 			<td colspan="3" class="left"><span id="fill_date" ><jsp:include page="../common_page/ServerDate.jsp" flush="true"/></span></td>
	  	 		</tr>
	  	 	</table>
	  	</div>
	<script type="text/javascript">
	   var contextPath = '<%=contextPath%>' + '/';
	</script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/report_9.js"></script>
  </body>
</html>
