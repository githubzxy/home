<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<title>车间设备单项质量分析表</title>
	<meta charset="utf-8">
    
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/bui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css"/>
  </head>
  <body>
  	 	<input id="orgName" class="query_info" type="hidden" value="${sessionScope.user.organization.name}" />
  	 	<input id="year" class="query_info" type="hidden" value="${param.yearNum}" />
  	 	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" />
  	 	<input id="deviceTypeId" type="hidden" value="${param.deviceTypeId}" />
  	 	<input id="deviceId" type="hidden" value="${param.deviceId}" />
  	 	<input id="uesrId" type="hidden" value="${sessionScope.user.id}" />
  	 	<input id="report_id" type="hidden"  />
  	 	
  	 	<div class="autumn_table_div">
  	 	<!-- 表格1 -->
  	 		<center><span class="autumn_table_title">设备单项质量分析表</span></center>
  	 		<div class="oper_button_div">
<!--   	 			<button class="table1_update">编辑基本信息</button> -->
<!--   	 			<button id="baseInfoBtn" >编辑填报人信息</button> -->
  	 			<button  class= "excel_export">导出到excel</button>
  	 		</div>
	  	 	<table id="table1" class="autumn_table autumn_table_background"  >
	  	 		<thead>
		  	 		<tr>
		  	 			<td colspan="1">填报单位：</td>
		  	 			<td colspan="4" class="left"><span id="table1_span_org">${sessionScope.user.organization.name}</span></td>
		  	 			<td colspan="1">年度：</td>
		  	 			<td colspan="3" class="left"><span id="table1_span_year">${param.yearNum}</span></td>
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
		  	 			<td width = "70">数量</td>
		  	 			<td width = "70">%</td>
		  	 			<td width = "70">数量</td>
		  	 			<td width = "70">%</td>
		  	 		</tr>
		  	 	</thead>
	  	 	</table>
	  	 	
  	 	<!-- 表格2 -->
	  	 	<center><span class="autumn_table_title">逐台检查登记表</span></center>
	  	 	<div class="oper_button_div">
<!--   	 			<button class="table2_add">新增</button> -->
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
	  	 		<tr id = "baseInfo">
	  	 			<td colspan = "2" align="right">单位负责人：</td>
	  	 			<td id = "org_duty_user" colspan = "2" align="left"></td>
	  	 			<td colspan = "2" align="right">填报人：</td>
	  	 			<td id = "fill_user"  width = "200" align="left">${sessionScope.user.name}</td>
	  	 			<td align="right">填报时间：</td>
	  	 			<td id = "fill_date"  width = "200" align="left"><jsp:include page="../common_page/ServerDate.jsp" flush="true"/></td>
	  	 		</tr>
	  	 	</table>
	  	 	
	  	 	<table id="fillExplanation" >
	  	 		<tr>
	  	 			<td align="right" width = "100">填写说明：</td>
	  	 			<td align="left">一、汇总表</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">1.本表与年度质量分析汇总表中的“设备名称”栏中每种设备一一对应，即一行对应一表。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">2.设备类别——即为年度质量分析汇总表中的“类别”内容。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">3.设备名称——与年度质量分析汇总表中的“设备名称”对应。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">4.设备数量——同一设备名称下在用设备总数。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">5.测试鉴定数——本年度检查鉴定的设备数量。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">二、逐台检查登记表</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">1.单项设备（含附属设备）鉴定以设备强度、性能和运用质量为主，鉴定的项目标准及评定标准由各局结合本规则确定。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">2.设备安装地点，填写机房名称，当同一机房安装了两台相同设备时，应分别填写，并在备注栏用所属系统、线路名称或用途等进行区分。如果是线路鉴定，则填写中继段名称。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">3.设备性能检查，以年度计表安排的测试内容为依据。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">4.运用质量检查，以质量管理中规定的检查项目为依据。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">5.附属设备，如调度台配备的应急分机。如果该项设备无附属设备，本项填“--”。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">6.设备配置信息及软件版本检查，以版本管理要求为依据。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">7.备注——以调度操作台为例，安装地点同为北京局调度所，备注栏应分别注明用途，即京津列调、京石列调等。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">三、不合格设备登记表</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">1.设备属性——不合格设备所在线路、所属系统或用途等。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">2.不合格项目名称——对应上表检查项目。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">3.原因分析——不合格项目名称中的具体内容（项目细分）。</td>
	  	 		</tr>
	  	 	</table>
  	 	</div>
  </body>
  	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/report_5_chejian.js"></script>
</html>
