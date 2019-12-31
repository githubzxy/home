<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>通信设备（线路）质量提高计划表（明细）</title>	
    
	<link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css">
  </head>
  <body>
  		所属科室：
  		<input id="orgName" style="width:290px;" type="text" name="orgName" />
  	 	<input id="selectedIds" type="hidden"  />
  		<input id = "searchBtn" type="button" value="查询"  onclick="searchData()"/>
  	 	<input id="orgId" type="hidden" value="8affa073533aa3d601533bbef63e0010" /><!-- 此id代表昆明通信段 -->
  	 	
  	 	<div class="autumn_table_div">
  	 	<!-- 表格1 -->
  	 		<span class="autumn_table_title">通信设备（线路）质量提高计划表（明细）</span>
  	 		<div class="oper_button_div">
  	 			<button class="autnmu_table_export">导出excel</button>
  	 		</div>
	  	 	<table id="table1" class="autumn_table autumn_table_background"  >
	  	 		<thead>
		  	 		<tr>
		  	 			<td colspan="1">填报单位：</td>
		  	 			<td colspan="6" class="left" width = "700"><span id="orgNameShow" ></span></td>
		  	 			<td colspan="1">年度：</td>
		  	 			<td colspan="5" class="left"><span id="year" >${param.yearNum}</span></td>
		  	 		</tr>
		  	 		<tr>
		  	 		
		  	 			<td width = "80">序号</td>
		  	 			<td width = "150">设备名称</td>
		  	 			<td width = "30">计量单位</td>
		  	 			<td width="60">总数量</td>
		  	 			<td width="60">不合格数量</td>
		  	 			<td width = "220">不合格质量状况</td>
		  	 			<td width = "220">采取措施</td>
		  	 			<td width = "100">责任单位</td>
		  	 			 <td width="60">责任人</td>
		  	 			<td width = "60">协作人</td>
		  	 			<td width = "80">完成日期</td>
		  	 			<td >备注</td>
		  	 		</tr>
		  	 	</thead>
	  	 	</table>
		</div>
  </body>
  	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript">
	  var year ='${param.yearNum}';
	</script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/report_8_tongXinDuan_search.js"></script>
</html>
