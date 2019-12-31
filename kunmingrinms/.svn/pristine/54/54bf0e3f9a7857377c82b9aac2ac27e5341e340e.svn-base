<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<title>段科室设备单项质量分析表</title>
	<meta charset="utf-8">
    
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/bui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css"/>
	
  </head>
  <body style="padding: 10px;">
  	 	所属车间：
  		<input id="orgName" style="width:290px;" type="text" name="orgName" />
  	 	<input id = "searchBtn" type="button" value="查询"  onclick="searchData()"/>
		<input id="selectedIds" type="hidden" />
  	 	
  	 	<input id="year" class="query_info" type="hidden" value="${param.yearNum}" />
  	 	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" />
  	 	<input id="deviceTypeId" type="hidden" value="${param.deviceTypeId}" />
  	 	<input id="deviceId" type="hidden" value="${param.deviceId}" />
  	 	
  	 	<div class="autumn_table_div">
  	 	<!-- 表格1 -->
  	 		<center><span class="autumn_table_title">设备单项质量分析表</span></center>
  	 		<div class="oper_button_div">
  	 				<button class="excel_export">导出excel</button>
  	 		</div>
	  	 	<table id="table1" class="autumn_table autumn_table_background"  >
	  	 		<thead>
		  	 		<tr>
		  	 			<td colspan="1">填报单位：</td>
		  	 			<td colspan="4" class="left" width = "700"><span id="orgNameShow"></span></td>
		  	 			<td colspan="1">年度：</td>
		  	 			<td colspan="3" class="left"><span id="table1_span_year"></span></td>
		  	 		</tr>
		  	 		<tr>
		  	 			<td rowspan="2">设备类别</td>
		  	 			<td rowspan="2">设备名称</td>
		  	 			<td rowspan="2" width = "100" >设备总数</td>
		  	 			<td rowspan="2" width = "100" >测试鉴定数</td>
		  	 			<td colspan="2">合格</td>
		  	 			<td colspan="2">不合格</td>
		  	 			<td rowspan="2" width = "300">备注</td>
		  	 		</tr>
		  	 		<tr>
		  	 			<td width = "100">数量</td>
		  	 			<td width = "100">%</td>
		  	 			<td width = "100">数量</td>
		  	 			<td width = "100">%</td>
		  	 		</tr>
		  	 	</thead>
	  	 	</table>
	  	 	
  	 	<!-- 表格2 -->
	  	 	<center><span class="autumn_table_title">逐台检查登记表</span></center>
	  	 	<div class="oper_button_div">
  	 		</div>
	  	 	<table id="table2" class="autumn_table autumn_table_background"  >
	  	 		<thead>
		  	 		<tr>
		  	 			<td width="5%" rowspan="2">序号</td>
		  	 			<td width="10%" rowspan="2">设备安装地点<br />（中继段名称）</td>
		  	 			<td colspan="8">检查项目</td>
		  	 			<td width="10%" rowspan="2">备注</td>
		  	 		</tr>
		  	 		<tr>
		  	 			<td width="5%">整机强度、外观、防尘、散热检查</td>
		  	 			<td width="5%">设备性能检查</td>
		  	 			<td width="5%">运用质量检查</td>
		  	 			<td width="5%">附属设备检查</td>
		  	 			<td width="5%">设备配置信息及软件版本检查</td>
		  	 			<td width="5%">开通时间</td>
		  	 			<td width="5%">设备厂家</td>
		  	 			<td width="5%">鉴定结果</td>
		  	 		</tr>
		  	 	</thead>
	  	 	</table>
	  	 	
  	 	<!-- 表格3 -->
	  	 	<center><span class="autumn_table_title">不合格设备登记表</span></center>
	  	 	<div class="oper_button_div">
  	 		</div>
	  	 	<table id="table3" class="autumn_table autumn_table_background"  >
	  	 		<thead>
		  	 		<tr>
		  	 			<td width="7%"  >序号</td>
		  	 			<td width="10%" >设备安装地点<br />（中继段名称）</td>
		  	 			<td colspan = "2" width="20%" >设备属性</td>
		  	 			<td colspan = "3" width="#" >不合格项目名称</td>
		  	 			<td colspan = "2"  width="25%" >原因分析</td>
		  	 		</tr>
	  	 		</thead>
	  	 	</table>
  	 	</div>
  </body>
  	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/report_5_duan.js"></script>
</html>
