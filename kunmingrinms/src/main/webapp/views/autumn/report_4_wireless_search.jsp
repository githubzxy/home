<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>无线通信设备年度质量分析汇总表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    
	<link rel="stylesheet" type="text/css" href="../../resource/css/autumn.css">
	<link rel="stylesheet" type="text/css" href="../../resource/css_framework/css_bui/bui.css">
	<link rel="stylesheet" type="text/css" href="../../resource/css_framework/css_bui/dpl.css">
	<link rel="stylesheet" type="text/css" href="../../resource/css_framework/css_bui/layout-min.css">
	
	<script src="../../resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
  	<script src="../../resource/js_framework/bui_framework/bui-min.js"></script>
	
	<script type="text/javascript" src="../../resource/js/base/common.js"></script>
	
  </head>
  <body>
  		所属车间：
  		<input id="orgName" style="width:290px;" type="text" name="orgName" >
  		<input id = "searchBtn" type="button" value="查询"  onclick="searchData()"/>
  	 	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" readOnly=true/>
  	 	<input id="selectedIds" type="hidden"  readOnly=true />
  	 	
  	 	<div class="autumn_table_div">
  	 		<!-- 表格1 -->
  	 		<span class="autumn_table_title">无线通信设备年度质量分析汇总表</span>
  	 		<div class="oper_button_div">
  	 			<button id="exportBtn">导出excel</button>
  	 		</div>
	  	 	<table id="table1" class="autumn_table autumn_table_background"  >
	  	 		<thead>
	  	 			<tr>
		  	 			<td colspan="2">填报单位：</td>
		  	 			<td colspan="6" class="left"><span id="orgNameShow" ></span></td>
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
  <script type="text/javascript" src="../../resource/js/autumn/report_4_wireless_search.js"></script>
</html>
