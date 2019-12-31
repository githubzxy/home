<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>处线路单项质量分析表</title>
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
  	 	<input id="selectedIds" type="hidden"  readOnly=true />
  	 	
  	 	<input id="year" class="query_info" type="hidden" value="${param.yearNum}" readOnly="true"/>
  	 	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" readOnly=true/>
  	 	<input id="deviceTypeId" type="hidden" value="${param.deviceTypeId}" readOnly="true"/>
  	 	<input id="deviceId" type="hidden" value="${param.deviceId}" readOnly="true"/>
  	 	
  	 	<div class="autumn_table_div">
  	 	<!-- 表格1 -->
  	 		<center><span class="autumn_table_title">线路单项质量分析表</span></center>
  	 		<div class="oper_button_div">
  	 			<button class="excel_export">导出到excel</button>
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
		  	 			<td width="10%" rowspan="2">设备类别</td>
		  	 			<td width="10%" rowspan="2">设备名称</td>
		  	 			<td width="10%" rowspan="2">设备总数</td>
		  	 			<td width="10%" rowspan="2">设备测试鉴定数</td>
		  	 			<td width="10%" colspan="2">合格</td>
		  	 			<td width="10%" colspan="2">不合格</td>
		  	 			<td width="20%" rowspan="2">备注</td>
		  	 		</tr>
		  	 		<tr>
		  	 			<td>数量</td>
		  	 			<td>%</td>
		  	 			<td>数量</td>
		  	 			<td>%</td>
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
		  	 			<td width="10%" rowspan="2">中继段名称（线路名称）</td>
		  	 			<td colspan="10">检查项目</td>
		  	 		</tr>
		  	 		<tr>
		  	 			<td width="5%" >线路长度KM</td>
		  	 			<td width="5%">光电缆特性（测试光缆芯数或电缆对数）</td>
<!-- 		  	 			<td width="5%">漏缆径路检查</td> -->
<!-- 		  	 			<td width="5%">漏缆卡具及附属设备检查</td> -->
		  	 			<td width="5%">合格纤芯数量或电缆对数</td>
		  	 			<td width="5%">线路强度与外观检查</td>
		  	 			<td width="5%">附属设备外观与强度检查</td>
		  	 			<td width="5%">开通时间</td>
		  	 			<td width="10%">设备厂家</td>
		  	 			<td width="20%">备注</td>
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
		  	 			<td width="5%">序号</td>
		  	 			<td width="15%">安装地点</td>
		  	 			<td width="15%">设备属性</td>
		  	 			<td width="15%">不合格项目名称</td>
		  	 			<td colspan = "2"  width="15%">原因分析</td>
		  	 		</tr>
	  	 		</thead>
	  	 	</table>
  	 	</div>
  </body>
  <script type="text/javascript" src="../../resource/js/autumn/report_7_chu.js"></script>
</html>