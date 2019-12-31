<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>修改角色</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
.bui-tree-picker {
	overflow-y:auto;
}
</style>
</head>
<body>
	<div>
		<form id="updateRole" class="form-horizontal">
		     <table class="popUpTable">
		       <tr  class="thTdPadding">
		           <th><label style="color: red">*</label>角色名:</th>
		           <td>
			           <div>
			           	 <input type="text" name="saveName" id="saveName" style="width: 98.5%; height:30px;" data-rules="{required : true}"/>
			          	 <input type="hidden" name="saveId" id="saveId" value=""/>
			           </div>
		           </td>
		       </tr>
		       <tr  class="thTdPadding">
		           <th>角色描述:</th>
		           <td>
		          		 <textarea name="saveDesc" id="saveDesc" style="width: 98.5%;height: 60px;" class="input-large"></textarea>
		           </td>
		       </tr>
		       <tr  class="thTdPadding">
			       <th><label style="color: red">*</label>所属权限:</th>
			       <td> 
			      		<div id="update" style="height: 253px;width: 100%;overflow:hidden;"></div>
			       </td>
		       </tr>
		     </table>
		</form>
	</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	var contextPath = '<%=contextPath%>' + '/';
	
	var updateTree;
	var updateStore;
	var node;
	var roleId = '${param.roleId}';
	
	getData();
	
	function getData(){
		$.ajax({
			url : contextPath + 'roleAction/getRoleById.cn',
			type : "post",
			data : {"roleId" :roleId},
			dataType : 'json',
			success : function(data){
				$("#updateRole #saveName").val(data.name);
				$("#updateRole #saveDesc").val(data.desc);
			}
		});
	}
	
	BUI.use(["bui/grid", "bui/data", 'bui/calendar', 'bui/tree', 'bui/form', 'bui/overlay', 'bui/select'],
			function(Grid,Data,Calendar, Tree, Form,Overlay,Select){
		
		$("#updateRole #saveId").val(roleId);
		
		updateStore = new Data.TreeStore({
			  map:{
				  'permissionDesc' : 'text'// 节点显示文本
			  },		
			  proxy : {
		 			url : contextPath+'permission/getAllPers.cn',
					method : 'post',
			  },
	          autoLoad : true
	     });
		updateTree = new Tree.TreeList({
	        render : '#updateRole #update',
	        height : 253,
	        store : updateStore,
	        idField:"id",
	        checkType: 'all', //checkType:勾选模式，提供了4中，all,onlyLeaf,none,custom
	        showLine : true //显示连接线
	    });
		updateTree.render();
		updateStore.on('load',getSelectedData);
		function getSelectedData(){
			$.ajax({
				url : contextPath + 'permission/getPersByRole.cn',
				type : "post",
				data : {"roleId" :roleId},
				dataType : 'json',
				success : function(data){
					var permissionDatas = eval(data);
					for( var i=0;i<permissionDatas.length;i++){
						node = updateTree.findNode(permissionDatas[i].id);
						if(node.children.length ==0){
							updateTree.setNodeChecked(node,true); 
						}
					}
				}
			});
			
		}
	
});
</script>
</body>
</html>