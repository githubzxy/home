<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<title>秋鉴段</title>
	<meta charset="utf-8">
    
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/bui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css"/>
	<style type="text/css">
		.leftDiv {
			float: left;
			width: 200px;
			height: 535px;
			border-right: 2px solid #3892d3; 
			margin-right: 20px;
			padding-right: 20px;
		}
	</style>
  </head>
  <body class="bodypadding">
  	<input type="hidden" id="orgType" name="orgType" value="duan" readonly="readonly" />
  	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" />
  	<div class="leftDiv">
  		<fieldset>
				<legend>${sessionScope.user.organization.name}——管辖车间配置</legend>
				<div id="configOrgList"></div>
				<div id="savaDiv" style="text-align: right;">
					<input id = "saveWorkshop" type="button" value="保存"/>
				</div>
		</fieldset>
  	</div>
  	<div>
	  	 <div>
	  		<fieldset>
				<legend>段数据导入</legend>
					<br />
					<div>
						<form id="duanDeviceForm" action="http://10.160.94.86:8888/guangtiefileapp/duanDeviceImport.cn" method="post" enctype="multipart/form-data"  target="_blank">
							(电通报-2)设备单项质量分析表_汇总数据：<input type="file" id="duanDeviceFile" name="myFile"  style="width:400px" />
							<input id="orgId" name="orgId" type="hidden" value="${sessionScope.user.organization.id}" />
							<input id="duanDeviceSubmit"   type="button"  value="提交"  />
						</form>
					</div>
			</fieldset>
	  	</div>
	  	<hr />
	  	<div>
	  		<fieldset>
				<legend>段单项质量分析表数据查询</legend>
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
				<legend>段汇总表查询</legend>
				<div>
					选择表名：<select id="searchReportName" style="width: 20%;"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					年&nbsp;&nbsp;&nbsp;&nbsp;度：<select id="searchYearNum" style="width: 20%;"></select>
					<input id ="searchBtn" type="button" value="查询" />
				</div>
			</fieldset>
	  	</div>
	  	<hr />
	  	<div id="editReportView">
	  		<fieldset>
				<legend>段汇总表数据填报</legend>
				<div>
					选择表名：<select id="collectReportName" style="width: 20%;"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					年&nbsp;&nbsp;&nbsp;&nbsp;度：<select id="collectYearNum" style="width: 20%;"></select>
					<input id ="searchCollect" type="button" value="填报" />
				</div>
			</fieldset>
	  	</div>
	</div>
  </body>
	<script type="text/javascript">
		var contextPath = '<%=contextPath%>' + '/';	
	</script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/AutumnSegment.js"></script>
</html>