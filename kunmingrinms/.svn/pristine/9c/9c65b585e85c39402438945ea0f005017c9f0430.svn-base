<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>车间通信设备（线路）质量提高计划表（明细）</title>	
    
	<link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css">
	
  </head>
  <body style="padding: 10px;">
  	 	<input id="orgId" type="hidden" value="chu" />
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
		  	 			<td colspan="6" class="left" width = "700"><span id="orgNameShow" >昆明通信段</span></td>
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
		<!---------------------- 表基本信息填写框 ------------------->
  	 	<div id="baseInfo_add_div" style="width:650px;height:200px;padding:10px; display:none;overflow:scroll;overflow-x:hidden">
			<form id="baseInfo_add_form">
			 <fieldset>
				<legend>报表基本信息填写</legend>
				  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td width="20%" align="right">填报单位：</td>
						<td width="20%"><span id="base_fill_org">昆明通信段</span></td>
						<td width="20%" height="30" align="right">年度：</td>
						<td width="20%"><span  id="base_year"></span></td>
					</tr>
					<tr>
						<td width="20%" align="right">填报人：</td>
						<td width="20%"><span id="base_fill_user">昆明通信段</span></td>
						<td width="20%" height="30" align="right">填报时间：</td>
						<td width="20%"><span id="base_fill_date"><jsp:include page="../common_page/ServerDate.jsp" flush="true"/></span></td>
					</tr>
					<tr>
						<td width="20%" align="right">单位负责人：</td>
						<td width="20%"><input id="base_duty_user"  type="text"  maxlength="255"  class="inputTextRequired"/></td>
					</tr>
				  </table>
			  </fieldset>
			</form>
		</div>
  </body>
  	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/report_8_search_chu.js"></script>
</html>
