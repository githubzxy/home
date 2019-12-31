<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<title>秋鉴通信段</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/bui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css"/>
	
  </head>
  <body class="bodypadding">
  	<input type="hidden" id="orgType" name="orgType" value="tongXinDuan" readonly="readonly" />
  	<div>
  		<fieldset>
			<legend>通信段单项质量分析表数据查询</legend>
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
			<legend>通信段汇总表查询</legend>
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
				<legend>通信段汇总表数据填报</legend>
				<div>
					选择表名：<select id="collectReportName" style="width: 20%;"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					年&nbsp;&nbsp;&nbsp;&nbsp;度：<select id="collectYearNum" style="width: 20%;"></select>
					<input id ="searchCollect" type="button" value="填报" />
				</div>
			</fieldset>
	  	</div>
	  	<hr />
  </body>
  	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/AutumnAllSegment.js"></script>
</html>