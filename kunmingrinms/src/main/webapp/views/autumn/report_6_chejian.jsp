<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>车间网管单项质量分析表</title>
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
	<script type="text/javascript" src="../../resource/js/autumn/report_6_chejian.js"></script>
	
  </head>
  <body>
  	 	<input id="orgName" class="query_info" type="hidden" value="${sessionScope.user.organization.name}" readOnly=true/>
  	 	<input id="year" class="query_info" type="hidden" value="${param.yearNum}" readOnly="true"/>
  	 	<input id="orgId" type="hidden" value="${sessionScope.user.organization.id}" readOnly=true/>
  	 	<input id="deviceTypeId" type="hidden" value="${param.deviceTypeId}" readOnly="true"/>
  	 	<input id="deviceId" type="hidden" value="${param.deviceId}" readOnly="true"/>
  	 	<input id="uesrId" type="hidden" value="${sessionScope.user.id}" readOnly="true"/>
  	 	<input id="report_id" type="hidden"  readOnly="true"/>
  	 	
  	 	<div class="autumn_table_div">
  	 	<!-- 表格1 -->
  	 		<center><span class="autumn_table_title">网管单项质量分析表</span></center>
  	 		<div class="oper_button_div">
<!--   	 			<button class="table1_update">编辑基本信息</button> -->
<!--   	 			<button id="baseInfoBtn" >编辑填报人信息</button> -->
  	 			<button class="exportExcel" >导出到excel</button>
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
<!--   	 			<button class="table2_add">新增</button> -->
  	 		</div>
	  	 	<table id="table2" class="autumn_table autumn_table_background"  >
	  	 		<thead>
		  	 		<tr>
<!-- 		  	 			<td width="5%" rowspan="2"></td> -->
		  	 			<td width="5%" rowspan="2">序号</td>
		  	 			<td width="10%" rowspan="2">设备安装地点</td>
		  	 			<td colspan="8">检查项目</td>
		  	 		</tr>
		  	 		<tr>
		  	 			<td width="5%" >告警管理检查分析</td>
		  	 			<td width="5%">配置管理检查分析</td>
		  	 			<td width="5%">性能管理检查分析</td>
		  	 			<td width="5%">帐户与安全管理检查</td>
		  	 			<td width="5%">软件版本检查</td>
		  	 			<td width="5%">整机强度、外观、防尘、散热检查</td>
		  	 			<td width="5%">开通时间</td>
		  	 			<td width="10%">设备厂家</td>
		  	 		</tr>
		  	 	</thead>
	  	 	</table>
	  	 	
  	 	<!-- 表格3 -->
	  	 	<center><span class="autumn_table_title">不合格设备登记表</span></center>
	  	 	<table id="table3" class="autumn_table autumn_table_background"  >
	  	 		<thead>
		  	 		<tr>
<!-- 		  	 			<td width="6%"></td> -->
		  	 			<td width="5%">序号</td>
		  	 			<td width="15%">设备安装地点</td>
		  	 			<td width="15%">设备属性</td>
		  	 			<td width="15%">不合格项目名称</td>
		  	 			<td colspan = "3"  width="15%">原因分析</td>
		  	 		</tr>
	  	 		</thead>
	  	 		<tr id = "baseInfo">
	  	 			<td colspan = "2" align="right">单位负责人：</td>
	  	 			<td id = "org_duty_user"  align="left"></td>
	  	 			<td align="right">填报人：</td>
	  	 			<td id = "fill_user"  width = "150" align="left">${sessionScope.user.name}</td>
	  	 			<td align="right"   width = "150">填报时间：</td>
	  	 			<td id = "fill_date"  width = "200" align="left"><jsp:include page="../common_page/ServerDate.jsp" flush="true"/></td>
	  	 		</tr>
	  	 	</table>
	  	 	
	  	 	<table id="fillExplanation" >
	  	 		<tr>
	  	 			<td align="right" width = "100">填写说明：</td>
	  	 			<td align="left">1、本表与年度质量分析汇总表中的“设备名称”栏中每种设备一一对应，即一行对应一表。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">2、设备类别——即为年度质量分析汇总表中的“类别”内容。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">3、设备名称——与年度质量分析汇总表中的“设备名称”对应。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">4、设备数量——同一设备名称下在用设备总数。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">5、测试鉴定数——本年度检查鉴定的设备数量。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">6、设备安装地点——机房名称。当同一机房安装了两台相同设备时，应分别填写，并在备注栏用所属系统、线路名称或用途等进行区分。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">7、设备性能检查及测试分析——以年度计表安排的测试内容为依据。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">8、测试值——以合格或不合格区分。检查项目栏下有一项不合格的，如此项测试值为不合格。例：功能检查中告警不好，则功能测试值为不合格。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">9、备注——以调度操作台为例，安装地点同为北京局调度所，备注栏应分别注明用途，即京津列调、京石列调等。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">10、设备属性——不合格设备所在线路、所属系统或用途等。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">11、不合格项目名称——对应上表检查项目。</td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="right"></td>
	  	 			<td align="left">12、原因分析——不合格项目名称中的具体内容（项目细分）。</td>
	  	 		</tr>
	  	 	</table>
  	 	</div>
  	 	<!---------------------- 新增修改1 ------------------->
  	 	<div id="table1_add_div" style="width:650px;height:350px;padding:10px; display:none;overflow:scroll;overflow-x:hidden">
			<form id="table1_add_form">
			 <fieldset>
				<legend>网管单项质量分析表</legend>
				  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td width="20%" align="right">设备类别：</td>
						<td width="20%"><span id="t1_p1"></span></td>
						<td width="20%" height="30" align="right">设备名称：</td>
						<td width="20%"><span id="t1_p2"></span></td>
					</tr>
					<tr>
						<td width="20%" align="right">设备总数：</td>
						<td width="20%"><input id="t1_p3"  type="text"  maxlength="80"  class="inputText"/></td>
					</tr>
					<tr>
						<td width="20%" align="right">备注：</td>
						<td height="120" colspan="3" style="padding:10px 0 0 0">
						  <textarea  id="t1_p4" style="width:435px; height:115px;" maxlength="500" class="inputTextarea"></textarea>
						</td>
					</tr>
				  </table>
			  </fieldset>
			</form>
		</div>
  	 	<!---------------------- 新增修改2 ------------------->
		<div id="table2_add_div" style="width:650px;height:410px;padding:10px; display:none;overflow:scroll;overflow-x:hidden">
			<form id="table2_add_form">
			 <fieldset>
				<legend>逐台检查登记表</legend>
				  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr height="40px">
						<td width="20%" align="right" >设备安装地点：</td>
						<td width="20%" colspan="3"><input id="place"  type="text"  class="inputText" style="width:430px;" maxlength="255" /></td>
					</tr>
					<tr>
						<td width="20%" align="right" >序号：</td>
						<td width="20%" colspan="3"><input id="seq"  type="text"   class="inputText" style="width:430px;" maxlength="255" /></td>
					</tr>
					<tr height="40px">
						<td width="20%" align="right">告警管理检查分析：</td>
						<td width="20%" >
							<select id="alarm"  style="width:131px">
								<option id="111" value="" ></option>
								<option value="1" text="合格">合格</option>
								<option value="0" text="不合格">不合格</option>
							</select>
						</td>
						<td width="20%" align="right">配置管理检查分析：</td>
						<td width="20%">
							<select id="configuration"  style="width:131px">
								<option value="" text="-"></option>
								<option value="1" text="合格">合格</option>
								<option value="0" text="不合格">不合格</option>
							</select>
						</td>
					</tr>
					<tr height="40px">
						<td width="20%" align="right">性能管理检查分析：</td>
						<td width="20%">
							<select id="performance"  style="width:131px">
								<option value="" text="-"></option>
								<option value="1" text="合格">合格</option>
								<option value="0" text="不合格">不合格</option>
							</select>
						</td>
						<td width="20%" align="right">帐户与安全管理检查：</td>
						<td width="20%">
							<select id="accountSafe"  style="width:131px">
								<option value="" text="-"></option>
								<option value="1" text="合格">合格</option>
								<option value="0" text="不合格">不合格</option>
							</select>
						</td>
					</tr>
					<tr height="40px">
						<td width="20%" align="right">软件版本检查：</td>
						<td width="20%">
							<select id="softwareVersion"  style="width:131px">
								<option value="" text="-"></option>
								<option value="1" text="合格">合格</option>
								<option value="0" text="不合格">不合格</option>
							</select>
						</td>
						<td width="20%" align="right">整机强度、外观、防尘、散热检查：</td>
						<td width="20%">
							<select id="wholeMachine"  style="width:131px">
								<option value="" text="-"></option>
								<option value="1" text="合格">合格</option>
								<option value="0" text="不合格">不合格</option>
							</select>
						</td>
					</tr>
					<tr height="40px">
						<td width="20%" align="right">开通时间：</td>
						<td width="20%"><input id="startupDateHole"  type="text"  maxlength="80"  class="inputText"/></td>
						<td width="20%" align="right">设备厂家：</td>
						<td width="20%"><input id="deviceProvider"  type="text"  maxlength="80"  class="inputText"/></td>
					</tr>
				  </table>
			  </fieldset>
			</form>
		</div>
		<!---------------------- 新增修改3 ------------------->
		<div id="table3_add_div" style="width:650px;height:350px;padding:10px; display:none;overflow:scroll;overflow-x:hidden">
			<form id="table3_add_form">
			 <fieldset>
				<legend>不合格设备登记表</legend>
				  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr height="40px">
						<td width="15%" align="right">序号：</td>
						<td width="20%"><input id="t3_p1"  type="text"  maxlength="80"  class="inputText" disabled="disabled"/></td>
						<td width="20%" align="right">设备安装地点：</td>
						<td width="20%"><input id="t3_p2"  type="text"  maxlength="80"  class="inputText" disabled="disabled"/></td>
					</tr>
					<tr height="40px">
						<td width="15%" align="right">设备属性：</td>
						<td width="20%"><input id="t3_p3"  type="text"  maxlength="80"  class="inputText"/></td>
						<td width="20%" align="right">不合格项目名称：</td>
						<td width="20%"><input id="t3_p4"  type="text"  maxlength="80"  class="inputText" disabled="disabled"/></td>
					</tr>
					<tr>
						<td width="15%" align="right">原因分析：</td>
						<td height="120" colspan="3" style="padding:10px 0 0 0">
						  <textarea  id="t3_p5" style="width:435px; height:115px;" maxlength="500" class="inputTextarea"></textarea>
						</td>
					</tr>
				  </table>
			  </fieldset>
			</form>
		</div>
		
		<!---------------------- 表基本信息填写框 ------------------->
  	 	<div id="baseInfo_add_div" style="width:650px;height:220px;padding:10px; display:none;overflow:scroll;overflow-x:hidden">
			<form id="baseInfo_add_form">
			 <fieldset>
				<legend>报表基本信息填写</legend>
				  <table  width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td width="20%" align="right">填报单位：</td>
						<td width="20%"><span id="base_fill_org">${sessionScope.organization.name}</span></td>
						<td width="20%" height="30" align="right">年度：</td>
						<td width="20%"><span  id="base_year">${param.yearNum}</span></td>
					</tr>
					<tr>
						<td width="20%" align="right">填报人：</td>
						<td width="20%"><span id="base_fill_user" >${sessionScope.user.name}</span></td>
						<td width="20%" height="30" align="right">填报时间：</td>
						<td width="20%"><span id="base_fill_date"><jsp:include page="../common_page/ServerDate.jsp" flush="true"/></td>
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
</html>
