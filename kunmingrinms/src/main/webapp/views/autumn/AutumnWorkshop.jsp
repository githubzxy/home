<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<title>秋鉴车间</title>
	<meta charset="utf-8">
    
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css" />
	
  </head>
  <body class="bodypadding">
  	<input type="hidden" id="orgType" name="orgType" value="chejian" readonly="readonly" />
  	  	<div>
  		<fieldset>
			<legend>操作说明下载</legend>
			<div>
				<input id ="lineDowload" type="button" value="下载"  onclick="download('/kunmingrinms/Template/readme.doc')"/>
			</div>
		</fieldset>
  	</div>
  	<hr />
  	<div>
	  		<fieldset>
				<legend>数据导入</legend>
					<br />
					<div>
						<form id="deviceForm" action="http://10.160.94.86:8888/guangtiefileapp/deviceImport.cn" method="post" enctype="multipart/form-data"  target="_blank">
							(电通报-2)设备单项质量分析表：<input type="file" id="deviceFile" name="myFile"  style="width:400px" />
							<input id="orgId" name="orgId" type="hidden" value="${sessionScope.user.organization.id}" />
							<input id="deviceSubmit"   type="button"  value="提交"  />
							<input id ="deviceDowload" type="button" value="设备模版下载"  onclick="download('/kunmingrinms/Template/deviveReport_2015-7-13.xls')"/>
							<input id ="deviceDowloadExplain" type="button" value="模版说明下载"  onclick="download('/kunmingrinms/Template/deviceDowloadExplain_2015-7-13.xls')"/>
						</form>
					</div>
<!-- 					<hr /><br /> -->
<!-- 					<div> -->
<!-- 						<form id="netForm" action="http://192.168.0.103:8888/fileserver/netImport.cn" method="post" enctype="multipart/form-data" target="_blank"> -->
<%-- 							<input name="orgId" type="hidden" value="${sessionScope.user.organization.id}" /> --%>
<!-- 							(电通通报-6)网管单项质量分析表：<input type="file" id="netFile" name="myFile"  style="width:400px" /> -->
<!-- 							<input id="netSubmit"   type="button"  value="提交"  /> -->
<!-- 							<input id ="netDowload" type="button" value="网管模版下载"  onclick="download('/kunmingrinms/Template/netReport.xls')"/> -->
<!-- 						</form> -->
<!-- 					</div> -->
<!-- 					<hr /><br /> -->
<!-- 					<div> -->
<!-- 						<form id="lineForm" action="http://192.168.0.103:8888/fileserver/lineImport.cn" method="post" enctype="multipart/form-data" target="_blank"> -->
<%-- 							<input name="orgId" type="hidden" value="${sessionScope.user.organization.id}" /> --%>
<!-- 							(电通通报-7)线路单项质量分析表：<input id = "lineFile"  type="file" name="myFile"  style="width:400px" /> -->
<!-- 							<input id="lineSubmit"   type="button"  value="提交"  /> -->
<!-- 							<input id ="lineDowload" type="button" value="线路模版下载"  onclick="download('/kunmingrinms/Template/lineReport.xls')"/> -->
<!-- 						</form> -->
<!-- 					</div> -->
<!-- 					<br /> -->
			</fieldset>
  		</div>
  		<hr />
  	
  	  	<div>
  		<fieldset>
			<legend>车间单项质量分析表数据查询</legend>
			<div>
				选择表名：<select id="reportName" style="width: 20%;"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				年&nbsp;&nbsp;&nbsp;&nbsp;度：<select id="yearNum" style="width: 20%;"></select>
			</div>
			<div>
				设备类型：<select id="deviceType" name="deviceType" style="width: 20%;"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				设备名：<select id="device" name="device" style="width: 20%;"></select>
				<input id = "search" type="button" value="查询" />
			</div>
		</fieldset>
  	</div>
  	<hr />
  	<div>
  		<fieldset>
			<legend>车间通信设备（线路）质量提高计划汇总表（明细）</legend>
			<div>
				选择表名：<select id="collectReportName" style="width: 20%;"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				年&nbsp;&nbsp;&nbsp;&nbsp;度：<select id="collectYearNum" style="width: 20%;"></select>
				<input id ="searchCollect" type="button" value="填报" />
			</div>
		</fieldset>
  		</div>
  </body>
  	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/AutumnWorkshop.js"></script>
</html>