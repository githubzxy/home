<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>组织机构</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css_framework/css_bui/layout-min.css" rel="stylesheet">
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style>
#contentDiv {
	width:100%;
	margin:0;	
	overflow:hidden;
}

#leftDiv {
	float:left;
	width:250px;
	height:100%;
	border-right: 2px solid #3892d3;
/* 	background-color: red; */
}

#rightDiv {
	float:left;
	width:800px;
	height:100%;
	overflow:hidden;
/* 	background-color: blue; */
}

.bui-tree-picker {
	overflow-y : auto;
}
  </style>
</head>
<body>
	<div id="contentDiv">
		<div id="leftDiv"></div>
		<div id="rightDiv" class="form-horizontal">
			<div id="detailDiv">
				<fieldset>
						<legend>组织机构基本信息</legend>
						<div class="row">
							<div class="control-group span8">
								<label class="control-label">机构名称：</label>
								<div class="controls">
									<input class="input-normal control-text" type="text"  id="orgName" style="width: 171px" data-rules="{required:true, maxlength: 15}"/>
								</div>
							</div>
							<div class="control-group span8">
								<label class="control-label">上级机构：</label>
								<div class="controls">
									<input class="input-normal control-text" type="text"  id="parentOrg" style="width: 171px"/>
									<input type="hidden" id="parentOrgId"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="control-group span8">
								<label class="control-label">机构类型：</label>
								<div class="controls">
									<select  id="orgType"  style="width: 181px"></select>
								</div>
							</div>
							<div class="control-group span8">
								<label class="control-label">机构描述：</label>
								<div class="controls">
									<input class="input-large control-text" type="text"  id="orgDesc"  style="width: 171px;" data-rules="{maxlength: 30}"/>
								</div>
							</div>
							<div style="float:right;margin-right: 80px">
									<button class="button button-small" type="button" id="updateBtn"><i class="icon-ok"></i>保存</button>
									<button class="button button-small" type="button" id="deleteBtn" style="margin-left: 10px;"><i class="icon-remove"></i>删除</button>
							</div>
						</div>
				</fieldset>
			</div>
			<div class="search-grid-container">
				<fieldset>
					<legend id="subOrgHead">子机构列表</legend>
					<div id="grid"></div>
					<input type="hidden" id="gridValue" name="gridValue" value="" />
				</fieldset>
			</div>
		</div>
	</div>
<script src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script src="<%=contextPath%>/resource/js_framework/bui_framework/bui.js"></script>
<script src="<%=contextPath%>/resource/js/common.js"></script>
<script src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
var contextPath = '<%=contextPath%>' + '/';
var perId = "<%=perId%>";

function readyInit(){

	initEventBind();
	initPageData();
}

function initEventBind() {
	
	$("#updateBtn").click(updateHandle);
	$("#deleteBtn").click(deleteHandle);
}

function initPageData() {

	organization_type.listData("#orgType");
}

$(document).ready(function () {
	treeBtn(perId);
});
//控制组织机构基本信息的保存、删除按钮的权限
function treeBtn(perId){
	var btnArr = [];// 配置有按钮权限的集合
	$.ajax({
		url : contextPath + 'permission/getBtnPers.cn',
		async: false,
		type : 'post',
		data : {'perId' : perId},
		success : function(data){
			JSON.parse(data).forEach(function(e){
				btnArr.push(e.permissionDesc);
			});
		}
	});
	var updateBtnText = $('#updateBtn').text();
	var deleteBtnText = $('#deleteBtn').text();
	if($.inArray(updateBtnText, btnArr) == -1){
		$('#updateBtn').css('display','none');
	}
	if($.inArray(deleteBtnText, btnArr) == -1){
		$('#deleteBtn').css('display','none');
	}
}

var orgTree;
var orgStore;

var parentOrgStore;

var grid;
var store;
var addDialog;

BUI.use(['bui/extensions/treepicker', 'bui/tree','bui/data', 'bui/grid', 'bui/overlay','mod/GridBtn'], 
		function(TreePicker, Tree, Data, Grid, Overlay,GB) {

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
		  proxy : {
	 			url : contextPath+'organization/getOrgChildrenById.cn',
				method : 'post'
		  },
          autoLoad : true
      });
	
	orgTree = new Tree.TreeList({
		render : '#leftDiv',
		store : orgStore,				
		showLine : true ,//显示连接线				
		showRoot : true
	});
	orgTree.render();
	orgStore.load({id : gztxd_id});// 默认展开昆明通信段
	orgTree.on("itemclick", function(ev) {
		
		var orgObj = ev.item;
		$("#orgName").val(orgObj.text);
		$("#parentOrg").val(orgObj.parent == null ? "" : orgObj.parent.text);
		$("#parentOrgId").val(orgObj.parent == null ? "" : orgObj.parent.id);
		$("#orgType").val(orgObj.type);
		$("#orgDesc").val(orgObj.desc);
		
		$("#orgName").removeAttr("disabled");
		$("#parentOrg").removeAttr("disabled");
		$("#orgType").removeAttr("disabled");
		$("#orgDesc").removeAttr("disabled");
		if(orgObj.id == gtjt_id) {
			$("#orgName").attr("disabled", "disabled");
			$("#parentOrg").attr("disabled", "disabled");
			$("#orgType").attr("disabled", "disabled");
			$("#orgDesc").attr("disabled", "disabled");
		}
		
		// 加载上级机构树
		parentOrgStore.load({id : gtjt_id, curId : orgObj.id});
		
		// 子机构列表展示
		$("#subOrgHead").html(orgObj.text + "的子机构列表");
		querySubOrg(orgObj.id);
	});
	
	parentOrgStore = new Data.TreeStore({
		  map:{
			  'name' : 'text',	// 节点显示文本
			  'isdept' : 'leaf'	// 是否为叶子节点
		  },
		  root:{
			  text : gtjt_name,
			  id : gtjt_id
		  },
		  pidField : "id", // 异步树必须设置该属性：标示父元素id的字段名称
		  proxy : {
				url : contextPath+'organization/getChildrenByPidAndCurId.cn',
				method : 'post'
		  }
	});
	
	var parentOrgTree = new Tree.TreeList({
		store : parentOrgStore,				
		showLine : true ,//显示连接线				
		showRoot : true
	});
	
	var parentOrgPicker = new TreePicker({
		trigger : '#parentOrg',
		valueField : '#parentOrgId', //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
		width : 200,  //指定宽度
		height : 400,
		children : [parentOrgTree] //配置picker内的列表
	});
	parentOrgPicker.render();
	
	
	/**
	 * 新增弹出框
	 */
	function addDialogCreate(){
		addDialog = new Overlay.Dialog({
			title : '新增子机构',
			width : 680,
			height : 200,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					store.load();
				}
			},
			buttons : [ {
				text : '保存',
				elCls : 'button',
				handler :function(){
						// 表单验证
						if(!addForm.isValid()) {
							return ;
						}
						var name = $("#orgNameAdd").val();
						var parentId = $("#parentOrgIdAdd").val();
						var type = $("#orgTypeAdd").val();
						var desc = $("#orgDescAdd").val();
						
						addSubOrg(name, parentId, type, desc);
						dialogClose(addDialog);
					}
				}, {
					text : '关闭',
					elCls : 'button',
					handler : function() {
						dialogClose(addDialog);
					}
				}],
			loader : {
				url : contextPath + 'views/system/organizationAdd.jsp',//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return addDialog;
	}
	
	/**
	 * 关闭弹出框并解除引用
	 * param:d 待关闭的弹出框
	 */
	function dialogClose(d){
		d.close();
		d = null;
	}
	
	/*
	 * 列表表头声明
	 */
	var columns = [{
		title : '机构名称',
		dataIndex : 'name',
		elCls : 'center',//居中显示
		sortable : false,	// 表头不排序
		width : '20%'
	}, {
		title : '上级机构',
		dataIndex : 'parent',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '20%',
		renderer: function(value) {
			return orgTree.getSelected() ==null ? "" : orgTree.getSelected().text;
		}
	},{
		title : '机构类型',
		dataIndex : 'type',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '15%',
		renderer:function(value) {
			return organization_type.typeName(value);
		}
	},{
		title : '机构描述',
		dataIndex : 'desc',
		elCls : 'center',//居中显示
		sortable : false,	// 表头不排序
		width : '45%'
	}];
	/*
	 * 列表数据源声明
	 */
	store = new Data.Store({
		autoLoad:true,
		listeners : {
        	'update' : generateGridValue
        }
	});
	/*
	 * 列表声明
	 */
	grid = new GB(
			{
				render : '#grid',
				perId : perId,
				contextPath : contextPath,
				idField : 'id',
				columns : columns,
				loadMask : true,
				store : store,
				width : '100%',
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [ 
// 				            	Grid.Plugins.AutoFit,//自适应宽度插件
				            	Grid.Plugins.CheckSelection,//多选框插件
				            	Grid.Plugins.RowNumber//列序号插件
				            	 ],
				tbar : {
					items : [
							{
								btnCls : 'button button-small',
		                       	text : '<i class="icon-plus"></i>新增',
		                       	listeners : {
		                        	 click : function() {
		                        		 
		                        		 	if(!orgTree.getSelected()) {
		                        		 		commonFailure("请选择父组织机构！");
		                        		 		return ;
		                        		 	}
		                        		 	
		                        		 	var addDialog = addDialogCreate();
		                        			addDialog.show();
		                        			addDialog.get('loader').load();
		                        	 }
		                       	}
							},
							{
								xclass : 'bar-item-separator'
							},
							{
								btnCls : 'button button-small',
		                       	text : '<i class="icon-remove"></i>批量删除',
		                       	listeners : {
		                        	 click : function() {
		                        		 deleteSubOrg();
		                        	 }
		                       	}
							},
							{
								xclass : 'bar-item-separator'
							},
							{
								btnCls : 'button button-small',
		                       	text : '<i class="icon-arrow-up"></i>向上',
		                       	listeners : {
		                        	 click : upItem
		                       	}
							},
							{
								 btnCls : 'button button-small',
		                         text : '<i class="icon-arrow-down"></i>向下',
		                         listeners : {
		                        	 click : downItem
		                         }
							},
							{
								btnCls : 'button button-small',
		                         text : '<i class="icon-chevron-up"></i>置顶',
		                         listeners : {
		                        	 click : topItem
		                         }
							},
							{
								 btnCls : 'button button-small',
		                         text : '<i class="icon-chevron-down"></i>置底',
		                         listeners : {
		                        	 click : bottomItem
		                         }
							},
							{
								 btnCls : 'button button-small',
		                         text : '<i class="icon-ok"></i>保存排序',
		                         listeners : {
		                        	 click : function() {
		                        		 	if(!orgTree.getSelected()) {
		                        		 		commonFailure("请选择父组织机构！");
		                        		 		return ;
		                        		 	}
											saveSubSort();
		                        	 }
		                         }
							},
							{
								xclass : 'bar-item-text',
								text : errorMsgHtml+sucMsgHtml
							}]
				}
			});
	grid.render();//渲染列表
	
	readyInit();
	
	initPageLayout();
	function initPageLayout() {
		var winHeight = $(window).height();
		$("#contentDiv").height(winHeight);
		
		var winWidth = $(window).width();
		$("#rightDiv").width(winWidth - $("#leftDiv").width() - 10);
		
		// 设置树的高度
		orgTree.set('height',winHeight - 10);
		// 设置表格高度
		var detailDiv = $('#detailDiv').height();
		grid.set('height',winHeight - detailDiv - 45);
	}
	
	// 子机构列表展示
	function querySubOrg(id) {
		$.post(
				contextPath + "organization/getOrgChildrenById.cn",
				{
					id : id
				},function(data,status){
					store.setResult(data);
				}, 'json');
	}
	
	// 新增子机构
	function addSubOrg(name, parentId, type, desc) {
		$.post(
				contextPath + "organization/add.cn",	
				{
					name : name,
					parentId : parentId,
					type : type,
					desc : desc
				},
				function(data,status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess('新增成功！');
					}else{
						commonFailure();
					}
					orgStore.load({id : parentId});// 更新组织机构树
					querySubOrg(parentId);
					
					parentOrgStore.load();
				}
		);
	}
	
	// 批量删除子机构
	function deleteSubOrg() {
		var orgObj = orgTree.getSelected();
		var parentId = orgObj.id;
		var msg = '确定要删除子机构吗？<br/>';
		BUI.Message.Confirm(msg,
		function(){
			
			var ids = "";
			var subOrgArr = grid.getSelection();
			for(var i = 0; i < subOrgArr.length; i++) {
				ids += subOrgArr[i].id + ",";
			}
			ids = ids.substring(0, ids.length - 1);
			$.post(
					contextPath + "organization/batchDelete.cn",	
					{
						ids : ids
					},
					function(data,status){
						if(status){//显示成功信息，并在5秒后消失
							commonSuccess('删除成功！');
						}else{
							commonFailure();
						}
						
						orgStore.load({id : parentId});// 更新组织机构树
						// 如果删除所有子机构，父机构变为叶子节点
						if(subOrgArr.length == grid.getItemCount()) {
							var item = orgTree.getItem(parentId);
							item.leaf = true;
						}
						querySubOrg(parentId);
						
						parentOrgStore.load();
					}
			);
		},
		'question');
	}
	
	// 保存排序
	function saveSubSort() {
		var orgObj = orgTree.getSelected();
		var parentId = orgObj.id;
		var ids = $("#gridValue").val();
		$.post(
				contextPath + "organization/saveSort.cn",	
				{
					ids : ids
				},
				function(data,status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess('保存排序成功！');
					}else{
						commonFailure();
					}
					orgStore.load({id : parentId});// 更新组织机构树
					querySubOrg(parentId);
					
					parentOrgStore.load();
				}
		);
	}
});

function updateHandle() {
	
	var orgObj = orgTree.getSelected();
	if(!orgObj){
		commonFailure("请在左侧机构树上选中某个机构后再进行修改保存！");
		return;
	}
	var id = orgObj.id;
	var name = $("#orgName").val();
	var parentId = $("#parentOrgId").val();
	var type = $("#orgType").val();
	var desc = $("#orgDesc").val();
	if(!name){
		commonFailure("机构名称不能为空！");
		$("#orgName").focus();
		return;
	}
	if(desc.length > 30){
		commonFailure("机构描述不能超过30个字！");
		$('#orgDesc').focus();
		return;
	}
	$.post(
			contextPath + "organization/update.cn",	
			{
				id : id,
				name : name,
				parentId : parentId,
				type : type,
				desc : desc
			},
			function(data,status){
				if(status){//显示成功信息，并在5秒后消失
					commonSuccess('保存成功！');
				}else{
					commonFailure();
				}
				orgStore.load({id : parentId});// 更新组织机构树
				parentOrgStore.load();
			}
	);
}

function deleteHandle() {
	
	var orgObj = orgTree.getSelected();
	if(!orgObj){
		commonFailure("请在左侧机构树上选中某个机构后再进行删除！");
		return;
	}
	var id = orgObj.id;
	var parentId = $("#parentOrgId").val();
	
	if(!orgObj.leaf) { // 组织机构树的非叶子节点不能直接删除
		commonFailure("请先删除该机构的所有子机构!");
		return;
	}
	var msg = '确定要删除吗？<br/>';
	BUI.Message.Confirm(msg,
	function(){
		$.post(
				contextPath + "organization/delete.cn",	
				{
					id : id
				},
				function(data,status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess('删除成功！');
					}else{
						commonFailure();
					}
					orgStore.load({id : parentId});// 更新组织机构树
					parentOrgStore.load();
				}
		);
	},
	'question');
	
}

/*
 * 判断数列是否已有相同的组织机构名
 */
function isContain(arr,name,c)
{
  for(var i=0;i<arr.length;i++)
  {
     if(name && arr[i].name==name && i != c)
      return true;
  }
  return false;
}

/**
 * 判断一个数组中是否包含对应的值
 */
function arrContains(arr,value){
	if(arr == null || arr.length == 0 || value == null){
		return false;
	}
	for(var i = 0;i < arr.length;i++){
		if(arr[i] == value){
			return true;
		}
	}
	return false;
}

/**
 * 获取子机构列表数据拼装成JSON字符串值并赋给隐藏的gridValue输入框
 */
function generateGridValue(){
 	var records = store.getResult();
 	var gridAllValue = "";
	for(var c = 0; c < records.length;c++){
		var record  = records[c];
		if(isContain(records,record.name,c)){
			BUI.Message.Alert(
					'组织机构名称【'+record.name+'】已存在相同名字的组织机构名称',
					'error');
			return;
		}
		gridAllValue += record.id + ",";
	 }
	 gridAllValue = gridAllValue.substring(0, gridAllValue.length - 1);
	$("#gridValue").val(gridAllValue);
}

/**
* 将选中的工作项目向上移动
*/
function upItem(){
	if(grid.getSelection().length == 0){
		BUI.Message.Alert(
				'请选择一条或多条记录进行排序',
				'error');
		return;
	}
	var forMoveRecords = grid.getSelection();
	var records = store.getResult();
	var affectIdxs = new Array();//受排序影响有变动的源数组下标
	for(var i = 0;i < forMoveRecords.length;i++){//先将被选中的记录序号收入集合
		var moveRecord = forMoveRecords[i];
		var moveIdx = store.findIndexBy(moveRecord);
		affectIdxs.push(moveIdx);
	}
	affectIdxs.sort(function(a,b){return a - b;});//根据序号大小升序排列
	for(var i = 0;i < affectIdxs.length;i++){//将被排序影响的记录置入数据源中
		var moveIdx = affectIdxs[i];
		if(moveIdx == 0){
			continue;
		}
		var affectIdx = moveIdx - 1;
		var affectRecord = records[affectIdx];
		records[affectIdx] = records[moveIdx];
		records[moveIdx] = affectRecord;
	}

	store.setResult(records);
	grid.setSelection(forMoveRecords);
	generateGridValue();
}
/**
* 将选中的工作项目向下移动
*/
function downItem(){
	if(grid.getSelection().length == 0){
		BUI.Message.Alert(
				'请选择一条或多条记录进行排序',
				'error');
		return;
	}
	var forMoveRecords = grid.getSelection();
	var records = store.getResult();
	var affectIdxs = new Array();//受排序影响有变动的源数组下标
	for(var i = 0;i < forMoveRecords.length;i++){//先将被选中的记录序号收入集合
		var moveRecord = forMoveRecords[i];
		var moveIdx = store.findIndexBy(moveRecord);
		affectIdxs.push(moveIdx);
	}
	affectIdxs.sort(function(a,b){return b - a;});//根据序号大小降序排列
	for(var i = 0;i < affectIdxs.length;i++){//将被排序影响的记录置入数据源中
		var moveIdx = affectIdxs[i];
		if(moveIdx == records.length - 1){
			continue;
		}
		var affectIdx = moveIdx + 1;
		var affectRecord = records[affectIdx];
		records[affectIdx] = records[moveIdx];
		records[moveIdx] = affectRecord;
	}
	store.setResult(records);
	grid.setSelection(forMoveRecords);
	generateGridValue();
}

/**
* 将选中的工作项目置顶
*/
function topItem(){
	if(grid.getSelection().length == 0){
		BUI.Message.Alert(
				'请选择一条或多条记录进行排序',
				'warn');
		return;
	}
	var forMoveRecords = grid.getSelection();
	var records = store.getResult();
	var affectIdxs = new Array();//受排序影响有变动的源数组下标
	for(var i = 0;i < forMoveRecords.length;i++){//先将被选中的记录序号收入集合
		var moveRecord = forMoveRecords[i];
		var moveIdx = store.findIndexBy(moveRecord);
		affectIdxs.push(moveIdx);
	}
	affectIdxs.sort(function(a,b){return a - b;});//根据序号大小升序排列
	var newRecords = new Array();
	for(var i = 0;i < affectIdxs.length;i++){//将被排序影响的记录置入数据源中
		newRecords.push(records[affectIdxs[i]]);
	}
	for(var i = 0;i < records.length;i++){
		if(!arrContains(affectIdxs,i)){
			newRecords.push(records[i]);
		}
	}
	//重新设置本地数据源
	store.setResult(newRecords);
	//保持移动工作项目的被选中状态
	grid.setSelection(forMoveRecords);
	//生成移动后所有工作项目的值
	generateGridValue();
}

/**
* 将选中的工作项目置底
*/
function bottomItem(){
	if(grid.getSelection().length == 0){
		BUI.Message.Alert(
				'请选择一条或多条记录进行排序',
				'error');
		return;
	}
	var forMoveRecords = grid.getSelection();
	var records = store.getResult();
	var affectIdxs = new Array();//受排序影响有变动的源数组下标
	for(var i = 0;i < forMoveRecords.length;i++){//先将被选中的记录序号收入集合
		var moveRecord = forMoveRecords[i];
		var moveIdx = store.findIndexBy(moveRecord);
		affectIdxs.push(moveIdx);
	}
	affectIdxs.sort(function(a,b){return a - b;});//根据序号大小升序排列
	var newRecords = new Array();
	for(var i = 0;i < records.length;i++){
		if(!arrContains(affectIdxs,i)){
			newRecords.push(records[i]);
		}
	}
	for(var i = 0;i < affectIdxs.length;i++){//将被排序影响的记录置入数据源中
		newRecords.push(records[affectIdxs[i]]);
	}
	//重新设置本地数据源
	store.setResult(newRecords);
	//保持移动工作项目的被选中状态
	grid.setSelection(forMoveRecords);
	//生成移动后所有工作项目的值
	generateGridValue();
}

</script>

</body>
</html>