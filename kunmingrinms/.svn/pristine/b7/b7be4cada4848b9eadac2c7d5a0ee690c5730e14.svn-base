<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>角色分配</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
#contentDiv {
	width:100%;
	height:100%;
	margin:0;
	overflow:hidden;
}
#leftDiv {
	float:left;
	width:230px;
	height:486px;
}
#rightDiv {
	float:left;
	width:450px;
	height:486px;
	overflow:hidden;
}
.bui-tree-picker {
	overflow-y:auto;
}
</style>
</head>
<body>
	<div id="contentDiv">
		<div id="leftDiv" class="form-horizontal">
			<div id="leftListDiv"></div>
		</div>
		<div id="rightDiv" class="form-horizontal">
			<fieldset>
				<legend id="listHead">列表</legend>
				<div id="userGrid"></div>
				<input type="hidden" id="gridValue" name="gridValue" value="" />
				<input type="hidden" id="orgId"  value="" />
			</fieldset>
		</div>
	</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript">

	var contextPath = '<%=contextPath%>' + '/';
	
	var orgTree;
	var orgStore;
	
	var roleId = '${param.roleId}';
	var rustore,rugrid;	
	
	$(document).ready(function () {		
		rustore.load();
	});
	
	BUI.use(["bui/grid", "bui/data", 'bui/calendar', 'bui/tree', 'bui/form', 'bui/overlay', 'bui/select'],
			function(Grid,Data,Calendar, Tree, Form,Overlay,Select){
		
		orgStore = new Data.TreeStore({
			  map:{
				  'name' : 'text',	// 节点显示文本
				  'isdept' : 'leaf'	// 是否为叶子节点
			  },
			  root:{
				  text : gtjt_name,
				  id : gtjt_id
			  },
			  pidField : "id", // 异步树必须设置该属性：标示父元素id的字段名称
			  proxy:{
		 			url : contextPath+'organization/getOrgChildrenById.cn',
					method : 'post'
			  },
	          autoLoad : true
	      });
		
		orgTree = new Tree.TreeList({
			render : '#leftListDiv',
			height:484,
			store : orgStore,
			showLine : true ,//显示连接线				
			showRoot : true ,
		});
		orgTree.render();
		
// 		orgStore.load({id : "8affa073533aa3d601533bbef63e0010"});// 默认展开昆铁
		
		orgTree.on("itemclick", function(ev) {
			
			var orgObj = ev.item;
			$("#orgId").val(orgObj.id);
			showOrgPeople(orgObj.id);
			$("#listHead").html(orgObj.text + "的用户");

		});
		
		var rucolumns = [{
			title:'用户名',
			dataIndex:'userName',
			elCls : 'center',
			width:'50%'
		},{
			title:'联系电话',
			dataIndex:'userPhone',
			elCls : 'center',
			width:'50%',
		}];
	rustore = new Data.Store({
		autoLoad:true,
	});
	function showOrgPeople(orgId) {
		$.post(contextPath + "userAction/getRoleConfigShow.cn",
				{
					orgId : orgId,
					roleId : roleId
				},function(data,status){
					rustore.setResult(data);
				}, 'json');
	}
	/*表格设置*/
	rugrid = new Grid.Grid({
		render : '#userGrid',
		store : rustore,
		itemStatusFields : {
			selected : 'hasOnRole',
		},
		width:430,
		height:460,
		columns : rucolumns,
		idField : 'id',
		plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber],
	});
	rugrid.render();
	
});
</script>
</body>
</html>