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
<title>通信演练计划</title>
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
<input type="hidden" id="fileDownTime" value="${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}" />
<script charset="utf-8" src="<%=contextPath%>/common/sq.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	var perId = '<%=perId%>';
	var orgId = '${user.organization.id}';
	var curUserId = '${sessionScope.user.id}';
	var curOrgName = '${sessionScope.user.organization.name}';
	var dialogTitle='通信演练计划';//弹出窗名称
	var shopStr='communicateShopStr';//打包下载传递参数
	/*路径区  */
	var pathForPage='communicateAction/getAllCommunicateData.cn';//主页路径
	var orgPath='organization/getOrgChildrenById.cn';//组织路径
	var pathForAdd="communicateAction/addCommunicate.cn";//新增路径
	var pathForQueryById="communicateAction/getCommunicateById.cn";//查询路径
	var pathForModify="communicateAction/updateCommunicateData.cn";//修改路径
	var pathForDel='communicateAction/deleteCommunicates.cn';//删除路径
	var getAllShop="communicateAction/getAllCommunicateShopDataById.cn";
	var trainingShopPath='communicateAction/getCommunicateShopById.cn';//汇报工区路径
	var getZipFile="communicateAction/getZipFile.cn";//打包下载路径
	seajs.config({
		paths:{
			views: contextPath + 'views/accidentTraining',
			common: contextPath + 'common',
			bui: contextPath + 'bui'
		}
	});
	seajs.use('views/commonjs/TrainingPage',function(TrainingPage){
		var trainingPage=new TrainingPage({
			contextPath : contextPath,
			perId : perId,
			getAllShop:getAllShop,
			pathForPage:pathForPage,
			dialogTitle:dialogTitle,
			orgPath:orgPath,
			pathForAdd:pathForAdd,
			pathForQueryById:pathForQueryById,
			pathForModify:pathForModify,
			pathForDel:pathForDel,
			trainingShopPath:trainingShopPath,
			getZipFile:getZipFile,
			shopStr:shopStr,
		});
		trainingPage.render();
	});
</script>
</body>
</html>