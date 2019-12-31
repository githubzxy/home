<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
	String perId = request.getParameter("threePerId");
%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通信演练汇报</title>
<link href="<%=contextPath%>/bui/css/bs3/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/bui/css/bs3/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/common/uploader/uploader.css" rel="stylesheet">
<link href="<%=contextPath%>/common/form/tableLayout.css" rel="stylesheet" />
<style type="text/css">
	.mask {
		z-index: 1100 !important;
	}
	.attachFileSpan {
		float: right;
	}
	.bui-stdmod-body{
		overflow-x : hidden;/* 产生垂直滚动条 */
		overflow-y : auto
	}
</style>
</head>
<body style="overflow: hidden;">
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	var perId = '<%=perId%>';
	var orgId = '${user.organization.id}';
	var curUserId = '${sessionScope.user.id}';
	var curOrgName = '${sessionScope.user.organization.name}';
	var dialogTitle='通信演练计划';
	/*路径区  */
	var pathForPage='communicateAction/getAllCommunicateDataByUser.cn';//主页面路径
	var pathForQueryPlan='communicateAction/getCommunicateById.cn';//查询计划
	var pathForQueryReport='communicateAction/getCommunicateShopByCommunicateId.cn';//查询汇报计划
	var pathForSaveReportPlan='communicateAction/updateCommunicateShopData.cn';//保存汇报计划
	seajs.config({
		paths:{
			views: contextPath + 'views/accidentTraining',
			common: contextPath + 'common',
			bui: contextPath + 'bui'
		}
	});
	seajs.use('views/commonjs/ReportPage',function(ReportPage){
		var reportPage=new ReportPage({
			contextPath : contextPath,
			perId : perId,
			dialogTitle:dialogTitle,
			pathForPage:pathForPage,
			pathForQueryPlan:pathForQueryPlan,
			pathForQueryReport:pathForQueryReport,
			pathForSaveReportPlan:pathForSaveReportPlan,
		});
		reportPage.render();
	});
</script>
</body>
</html>