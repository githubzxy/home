<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%             
	String contextPath = request.getContextPath(); 
%>
<input type="text" name="${param.org}" id="${param.org}" class="control-text" data-rules="{required:true}"/>
<input type="hidden" name="${param.orgVal}" id="${param.orgVal}"  />
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript">
/*
 * 页面参数说明：
 * ${param.org}：”必填“		显示组织机构文本框ID
 * ${param.orgVal}：”必填“		存放组织机构文本框所选数据的影藏域ID
 * ${param.actionURL}：”必填“		访问Action控制类的URL	(注：只写action路径。如：organization/getSegmentByPid.cn)
 * ${param.checkType}：树节点勾选模式，提供了4中，all,onlyLeaf,none,custom（默认值）
 * ${param.align}：弹出窗口在文本框的方向（默认向下） up,down
 * ${param.width}：设置文本框的宽度
 * ${param.height}：设置文本框的高度
 */

	var contextPath = '<%=contextPath%>' + '/';	
 
	// 取得org文本框id
	var orgInputId = "#${param.org}";
	// 取得orgVal文本框id
	var orgValInputId = "#${param.orgVal}";
	
	// 访问Action控制类的URL
	var myActionURL = contextPath + "${param.actionURL}";
	
	// checkType：树节点勾选模式，提供了4中，all,onlyLeaf,none,custom（默认值）
	var myCheckType = "custom";
	// selectStatus：选中的状态   selected（默认值）,checked
	var mySelectStatus = "selected";
	var checkType = "${param.checkType}";
	if(checkType == "all") {
		myCheckType = checkType;
		mySelectStatus = "checked";
	}
	
	// 弹出窗口在文本框的方向
	var align = "${param.align}";
	var myPoints = ['bl', 'tl'];
	if(align == "up") {
		myPoints = ['tl','bl'];	// 正上方
	}
	
	
	
	BUI.use(['bui/calendar', 'bui/form', 'bui/data', 'bui/tree', 'bui/extensions/treepicker'],
			function(Calendar, Form, Data, Tree, TreePicker){
		/*
		*渲染ORG组织机构树
		*/
		var treeStore = new Data.TreeStore({
			root : {
				id : gztxd_id,
				text : gztxd_name
			},
			url : myActionURL,
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

		var tree = new Tree.TreeList({
			store : treeStore,
			showRoot : true,
			checkType : myCheckType,
			showLine : true,	//显示连接线
			cascadeCheckd : false, //不级联勾选
			width : 250, 
			height : 230
		});

		new TreePicker({
			trigger : orgInputId,
			valueField : orgValInputId, //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
			selectStatus : mySelectStatus,//设置勾选作为状态改变的事件
			align:{
				node:'window' ,
				points: myPoints,	// 弹出窗口在文本框的正上方
				offset : [0,0]
			},
			autoRender : true,
			children : [ tree ] //配置picker内的列表
		});
		
	});
	
	// 初始化页面
	$(document).ready(function () {
		setInputWidthHight();
		bindDutyOrgEvent();
	});
	
	// 设置文本框的宽度和高度
	function setInputWidthHight() {
		$(orgInputId).css("width", "${param.width}");
		$(orgInputId).css("height", "${param.height}");
	}
	
	// 绑定  责任部门 的事件
	function bindDutyOrgEvent() {
		$(orgInputId).change(function() {
			$(orgInputId).attr("title", $(this).val());
			
			// 当文本框为空，同时设置隐藏文本框的值为空
			if($(orgInputId).val() == "") {
				$(orgValInputId).val("");
			}
		});
	}
	
</script>