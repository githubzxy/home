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
    
	<link rel="stylesheet" type="text/css" href="../../resource/plugin/jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../resource/plugin/jquery-easyui-1.3.3/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../resource/plugin/jquery-easyui-1.3.3/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="../../resource/css/autumn.css">
	<script type="text/javascript" src="../../resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../resource/js/base/common.js"></script>
	<script type="text/javascript" src="../../resource/plugin/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../resource/plugin/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../resource/js/autumn/report_4_wireless.js"></script>
	
  </head>
  <body>
  	 	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" readOnly=true/>
  	 	
  	 	<div class="autumn_table_div">
  	 	<!-- 表格1 -->
  	 		<span class="autumn_table_title">无线通信设备年度质量分析汇总表</span>
  	 		<div class="oper_button_div">
  	 			<button class="table1_base_update">报表基本信息填写</button>
  	 			<button id="exportBtn">导出excel</button>
  	 		</div>
	  	 	<table id="table1" class="autumn_table autumn_table_background"  >
	  	 		<thead>
	  	 			<tr>
		  	 			<td colspan="2">填报单位：</td>
		  	 			<td colspan="7" class="left"><span id="orgName" >${sessionScope.user.organization.name}</span></td>
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
	  	 				<td width="5%" rowspan="2"></td>
	  	 			</tr>
		  	 		<tr>
		  	 			<td width="5%">数量</td>
	  	 				<td width="5%">百分比</td>
		  	 			<td width="5%">数量</td>
	  	 				<td width="5%">百分比</td>
		  	 		</tr>
		  	 	</thead>
		  	 	<tr id = "base">
	  	 			<td colspan="2" class="right">单位负责人：</td>
	  	 			<td colspan="3" class="left"><span id="fill_duty_user" ></span></td>
	  	 			<td colspan="1" class="right">填报人：</td>
	  	 			<td colspan="2" class="left"><span id="fill_user" >${sessionScope.user.name}</span></td>
	  	 			<td colspan="1" class="right">填报时间：</td>
	  	 			<td colspan="2" class="left"><span id="fill_date" ><jsp:include page="../common_page/ServerDate.jsp" flush="true"/></span></td>
	  	 		</tr>
	  	 	</table>
	  	 	<div id="table1_add_div" style="width:650px;height:250px;padding:10px; display:none;overflow:scroll;overflow-x:hidden">
			<form id="table1_add_form">
			 <fieldset>
				<legend>数据填写</legend>
				  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td width="20%" align="right">备注：</td>
						<td height="120" colspan="3" style="padding:10px 0 0 0">
						  <textarea id="remark" style="width:435px; height:115px;" maxlength="500" class="inputTextarea"></textarea>
						</td>
					</tr>
				  </table>
			  </fieldset>
			</form>
		</div>
		<div id="table1_base_add_div" style="width:650px;height:250px;padding:10px; display:none;overflow:scroll;overflow-x:hidden">
			<form id="table1_add_form">
			 <fieldset>
				<legend>报表基本信息填写</legend>
				  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
				  <tr>
						<td width="20%" align="right">填报单位：</td>
						<td width="20%"><span id="base_fill_org">${sessionScope.user.organization.name}</span></td>
						<td width="20%" height="30" align="right">年度：</td>
						<td width="20%"><span  id="base_year">${param.yearNum}</span></td>
					</tr>
					<tr>
						<td width="20%" align="right">单位负责人：</td>
						<td width="20%"><input id="org_duty_user" name="t1_p2" type="text"  maxlength="80"  class="inputText"/></span></td>
						<td width="20%" height="30" align="right">填报人：</td>
						<td width="20%"><span id="base_fill_user">${sessionScope.user.name}</span></td>
					</tr>
					<tr>
						<td width="20%" height="30" align="right">填报时间：</td>
						<td width="20%"><span id="base_fill_date"><jsp:include page="../common_page/ServerDate.jsp" flush="true"/></span></td>
					</tr>
				  </table>
			  </fieldset>
			</form>
		</div>
  </body>
</html>
