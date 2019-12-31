<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>人员选择公共组件</title>
<style type="text/css">
	.bui-tree-picker {
		border : 1px solid #c3c3d6;
	}

	.bui-tree-list {
		border: 0px;
	}
	 	
 	.bui-dialog .bui-stdmod-body {
 		padding: 0px;
 	}
</style>
</head>
<body>
	<div style="margin: 20px; width: 530px;">
		<div class="row" style="margin-top: 10px;">
			<div class="span1">
				<textarea id="org" style="width: 500px;height: 50px;resize:none;" placeholder="单击选择部门"></textarea>
				<input type="hidden"  id="orgVal"  />
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
		  <div class="span8">
		  	<label class="control-label">待选列表：</label>
		  </div>
		  <div class="span5">
		  	<label class="control-label">已选列表：</label>
		  </div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div id="orgUsersList" class="span5"></div>
			<div class="btns centered span3" style="margin-top: 50px;">
				<button  class="button button-small" type="button" id="add" style="margin-top: 15px;">&nbsp;&nbsp;移&nbsp;&nbsp;入&nbsp;&nbsp;</button>
				<button  class="button button-small" type="button" id="remove" style="margin-top: 15px;">&nbsp;&nbsp;移&nbsp;&nbsp;出&nbsp;&nbsp;</button>
				<button  class="button button-small" type="button" id="addAll" style="margin-top: 15px;">全部移入</button>
				<button  class="button button-small" type="button" id="removeAll" style="margin-top: 15px;">全部移出</button>
			</div>
			<div id="selectedUsersList"  class="span5"></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript">

	var contextPath = '<%=contextPath%>' + '/';	
	
	var tree;
	var treePicker;
	var orgUsersStore;
	var selectedUsersStore;
	
	var orgUsersList;
	var selectedUsersList;
	// 回显已选用户数据
	var selectUserIds = '${param.selectUserIds}';
	
	BUI.use(['bui/calendar', 'bui/form', 'bui/data', 'bui/tree', 'bui/extensions/treepicker'],
			function(Calendar, Form, Data, Tree, TreePicker){
		/*
		*渲染ORG组织机构树
		*/
		var treeStore = new Data.TreeStore({
			url : contextPath + "organization/getOrgAndFriend.cn",
			proxy : {
				method : 'post',
				dataType : 'json'
			},
			map : {	// 节点映射
				'name' : 'text',	// 节点显示文本
				'isdept' : 'leaf'	// 是否为叶子节点
			}
		});
		// 默认加载昆明通信段
		treeStore.load({id : gztxd_id});

		tree = new Tree.TreeList({
			idField : 'id',
			store : treeStore,
			checkType : 'all',
			showLine : true,	//显示连接线
			cascadeCheckd : false, //不级联勾选
			width : 250, 
			height : 300,
			listeners : {
				itemclick : function(e) {
					var item = e.item;
					// 点击昆明通信段和好友组，但是没有点击昆明通信段和好友组Checkbox  不能勾选
					if(item.id == gztxd_id&& !$(e.domTarget).hasClass('x-tree-icon-checkbox')) {
						return ;
					}
					// 点击昆明通信段和好友组，并且点击昆明通信段和好友组Checkbox  不能勾选
					if(item.id == gztxd_id && $(e.domTarget).hasClass('x-tree-icon-checkbox')) {
						var flag = !tree.isChecked(item);
						tree.setNodeChecked(item, flag);
						return ;
					}
					
					
					// 如果点击checkbox，则直接打√
					if($(e.domTarget).hasClass('x-tree-icon-checkbox')) {
						return ;
					}
					
					// ------------单击 li 在当前行的checkbox打√-------------
					// 取反  勾选Checkbox
					var flag = !tree.isChecked(item);
					tree.setNodeChecked(item, flag);
				}
			}
		});

		treePicker = new TreePicker({
			trigger : "#org",
			valueField : "#orgVal", //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
			selectStatus : 'checked',//设置勾选作为状态改变的事件
			autoRender : true,
			listeners : {
				hide : function(e) {
					// 控件隐藏后，查询部门对应的人员
					var orgIds = $("#orgVal").val();
					if(orgIds != null && orgIds.length != 0) {
						orgUsersStore.load({orgIds: orgIds});
					}
				}
			},
			children : [
				tree,
				{
					content :  '<center>'
								+	'<button type="button" class="button button-small workshopBtn" data-flag="1" onclick="selectAllCheJian()">全部车间</button>&nbsp;&nbsp;'
								+	'<button type="button" class="button button-small" onclick="hideWin()">&nbsp;&nbsp;确&nbsp;&nbsp;认&nbsp;&nbsp;</button>'
								+	'</center>'
				}
			] //配置picker内的列表
		});
		
		
		//--------------------------    Listbox ----------------------------------
		var List = BUI.List;
	    
		orgUsersStore = new Data.Store({
			url : contextPath + "userAction/getUserByOrgIds.cn",
			proxy : {
				method : 'post',
				dataType : 'json'
			}
		});
		
		selectedUsersStore = new Data.Store({
			url : contextPath + "userAction/getUsersByIds.cn",
			proxy : {
				method : 'post',
				dataType : 'json'
			}
		});
		
		orgUsersList = new List.Listbox({
			idField : 'id',
			itemTpl : '<li><span class="x-checkbox"></span>{name}</li>',
			elCls : 'bui-select-list',//默认是'bui-simple-list'
			render : '#orgUsersList',
			store : orgUsersStore,
			height : 260
		});
		selectedUsersList = new List.Listbox({
			idField : 'id',
			itemTpl : '<li><span class="x-checkbox"></span>{name}</li>',
			elCls : 'bui-select-list',//默认是'bui-simple-list'
			render : '#selectedUsersList',
			store : selectedUsersStore,
			height : 260
		});
		orgUsersList.render();
		selectedUsersList.render();

		// 回显已选用户数据
		selectedUsersList.removeItems();
		if(selectUserIds != null && selectUserIds.length != 0) {
			selectedUsersStore.load({ids: selectUserIds});
		}
	//--------------------------    Listbox 移入移出事件处理----------------------------------
	    $('#add').on('click',function(){
			var items = orgUsersList.getSelection();
			distinctAddItems(items);
	    });
	    
	    $('#remove').on('click',function(){
			var items = selectedUsersList.getSelection();
			selectedUsersList.removeItems(items);
	    });
	    
	    $('#addAll').on('click',function(){
			var addItems = orgUsersList.getItems();
			distinctAddItems(addItems);
	    });
	    
	    $('#removeAll').on('click',function(){
			selectedUsersList.clearItems();
	    });
	    
	    orgUsersList.on('dblclick',function(e){
			var element = $(e.domTarget).closest('li');
			var item = orgUsersList.getItemByElement(element);
			var items = new Array(item);
			distinctAddItems(items);
	    });
	    
	    selectedUsersList.on('dblclick',function(e){
	     	 var element = $(e.domTarget).closest('li');
	         var item = selectedUsersList.getItemByElement(element);
	         selectedUsersList.removeItem(item);
	    });
		
	});
	
	// 选择全部车间
 	function selectAllCheJian() {
 		
 		var btnFlag = $(".workshopBtn").attr("data-flag");
 		
 		if(btnFlag == "0") {
 			tree.clearAllChecked();
			$(".workshopBtn").html("全部车间");
			$(".workshopBtn").attr("data-flag", "1");
			
			return ;
 		}
 		
		$.post(contextPath + 'organization/getAllWorkshop.cn',
				{
				},function(data,status){
					
					for(var i = 0; i < data.length; i++) {
						var node = tree.findNode(data[i].id);
						tree.setNodeChecked(node, true);
					}
					$(".workshopBtn").html("取消全部车间");
					$(".workshopBtn").attr("data-flag", "0");
				}, 'json');
 	}
 	
	// 隐藏树形窗口
 	function hideWin() {
 		// 隐藏
 		treePicker.hide();
 	}
	
    // 已选列表中 去除 重复用户
    function distinctAddItems(items) {
    	var item;
    	var id;
    	for(var i = 0; i < items.length; i++) {
    		item = items[i];
    		if(item == null || item == "null" || item == undefined) {
    			continue;
    		}
    		id = item.id;
    		// 不存在，添加
    		if(!selectedUsersList.getItem(id)) {
    			selectedUsersList.addItem(item);
    		}
    	}
    	//  清除  待选列表  List中CheckBox“√“
    	orgUsersList.clearSelection();
    }
</script>
</html>