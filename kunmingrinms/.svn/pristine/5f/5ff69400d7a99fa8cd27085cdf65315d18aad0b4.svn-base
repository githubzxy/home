<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<title>通信设备年度质量分析汇总表</title>
	<meta charset="utf-8">
    
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css" />
  </head>
  <body style="overflow-x: hidden">
  	 	<input id="orgId" type="hidden" value="chu" /><!-- 此id代表昆明通信段 -->
  	 	
  	 	<div class="autumn_table_div">
  	 		<!-- 表格1 -->
  	 		<span class="autumn_table_title">通信设备年度质量分析汇总表</span>
  	 		<div class="oper_button_div">
  	 			<button id="exportBtn">导出excel</button>
  	 		</div>
	  	 	<table id="table1" class="autumn_table autumn_table_background"  >
	  	 		<thead>
	  	 			<tr>
		  	 			<td colspan="2">填报单位：</td>
		  	 			<td colspan="6" class="left"><span id="orgNameShow" >昆明通信段</span></td>
		  	 			<td colspan="1">年度：</td>
		  	 			<td colspan="1" class="left"><span id="year" >${param.yearNum}</span></td>
		  	 		</tr>
	  	 			<tr>
	  	 				<td width="12%" rowspan="2">类别</td>
	  	 				<td width="3%" rowspan="2">编号</td>
	  	 				<td width="21%" rowspan="2">设备名称</td>
	  	 				<td width="3%" rowspan="2">单位</td>
	  	 				<td width="6%" rowspan="2">设备总数</td>
	  	 				<td width="10%" colspan="2">合格数</td>
	  	 				<td width="10%" colspan="2">不合格数</td>
	  	 				<td width="10%" rowspan="2">备注</td>
	  	 			</tr>
		  	 		<tr>
		  	 			<td width="5%">数量</td>
	  	 				<td width="5%">百分比</td>
		  	 			<td width="5%">数量</td>
	  	 				<td width="5%">百分比</td>
		  	 		</tr>
		  	 	</thead>
	  	 	</table>
		</div>
  </body>
  	<script src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
  	<script src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/report_4_search_chu.js"></script>
</html>
