<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>通信设备（线路）质量提高计划统计表</title>
    
	<link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css/autumn.css">
	
  </head>
  <body style="overflow-x:hidden; overflow-y: auto;">
  	 	<input id="orgId" type="hidden" value="8affa073533aa3d601533bbef63e0010" /><!-- 昆明通信段id -->
  		所属车间：
  		<input id="orgName" style="width:290px;" type="text" name="orgName" >
  		<input id="selectedIds" type="hidden"  />
  		<input id = "searchBtn" type="button" value="查询"  onclick="searchData()"/>
  	 	<div class="autumn_table_div">
  	 	<!-- 表格1 -->
  	 		<span class="autumn_table_title">通信设备（线路）质量提高计划统计表</span>
  	 		<div class="oper_button_div">
  	 			<button id="autnmu_table_export">导出excel</button>
  	 		</div>
	  	 	<table id="table1" class="autumn_table autumn_table_background"  >
	  	 		<thead>
	  	 			<tr>
		  	 			<td colspan="2">填表单位：</td>
		  	 			<td colspan="9" class="left"><span id="orgNameShow" ></span></td>
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
	  	 	</table>
	  	 </div>
  </body>
  	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript">
	  var year = '${param.yearNum}';
	</script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/report_9_tongXinDuan_search.js"></script>
</html>
