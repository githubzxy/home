<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<title>部门设备关系管理</title>
	<meta charset="utf-8">
    
    <link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css"  />
    <link rel="stylesheet" type="text/css"  href="<%=contextPath%>/resource/css_framework/css_bui/bui.css"  />
  	
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resource/css/autumn.css" />
  </head>
  <body class="bodypadding">
  	<input type="hidden" id="orgType" name="orgType" value="duan" readonly="readonly" />
  	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" />
  	<table width="100%"  border="0" cellpadding="0" cellspacing="0">
  		<tr>
  			<td>
  				设备类型：<select id="deviceType" name="deviceType"  style = "width:200px"></select>
  			</td>
  			<td rowspan = "2"  width = "100"  align = "center">
  				<button id = "addBtn"  type="button" style="width: 85px; height: 30px;">移入</button>
  				<button id = "delBtn" type="button" style="width: 85px; height: 30px;">移出</button>
  			</td>
  			<td>
  				设备类型：<select id="beSelectedDvType"  style = "width:150px"></select>
  				设备名：<input id="deviceName" type="text"  style = "width:100px" />
  				<button id = "searchBtn" type="button" >查询</button>
  			</td>
  		</tr >
  		<tr>
  			<td valign = "top"  style="width:40%">
  			<div>
  				<fieldset>
  					<legend>待选设备</legend>
  					<div id="waitSelectDG" ></div>
  				</fieldset>
  				
  			</div>
  			</td>
  			<td valign = "top"  style="width:50%">
  				<div>
	  				<fieldset>
	  					<legend>已选设备</legend>
	  					<div id="beSelectedDG" ></div>
	  				</fieldset>
  				</div>
  			</td>
  		</tr>
  	</table>
  		
  </body>
  	<script src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
  	<script src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
	<script type="text/javascript" src="<%=contextPath%>/resource/js/base/common.js"></script>
  <!-- bui的组件定义应该在body加载完成后，应为bui的组件定义需要有body中标签定义完成后才可使用 -->
  <script type="text/javascript" src="<%=contextPath%>/resource/js/autumn/autumnOrgDeviceManage.js"></script>
</html>