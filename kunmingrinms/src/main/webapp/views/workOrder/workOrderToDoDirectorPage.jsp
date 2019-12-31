<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>工单待办(车间主任)</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/tableLayout.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
div,td { word-break:break-all;}
	/* 二级弹出框的遮罩层*/
	.twoMask {
		z-index: 1100 !important;
	}
	.maskFour { 
 		z-index: 1150 !important; 
 	}
	#miniSquareSpace{
		margin-top:15px;
		margin-right:4px; 
		float:right;
	}
	.miniSquare{
		display:inline-block;
		margin-left:6px;
		margin-right:2px;
		width:10px;
		height:10px;
		background-color:#000;
	}
	
	.bui-grid-row-daiJieShou{
	    color: #FF5500;
	 }
	.bui-grid-row-daiHuiFu{
	    color: #00C5CD;
	 }
	 .bui-grid-row-daiHuiDa{
	    color: #8470FF;
	 }
	  .bui-grid-row-yiHuiDa{
	    color: #483D8B;
	 }
	  .bui-grid-row-daiShenPi{
	    color: #00a1a1;
	 }	 
	  .bui-grid-row-weiWanCheng{
	    color: #5CACEE;
	 }
	  .bui-grid-row-wanCheng{
	    color: #1E90FF;
	 }
	 .bui-grid-row-yiGuiDang{
	    color: #0000FF;
	 }
	 .bui-grid-row-yiFenPai{
	    color: #FF77FF;
	 }
	 .bui-grid-row-yiChaoQi{
	    color:red;
	    z-index: 1000 !important; 
	 }
	.x-grid-rownumber{
 		color:black;/* 序号，全为黑色 */
 	}
 	#grid .bui-grid-row{
 		height: 29px;
 	}
 	.x-grid-rownumber{
 		color:black;/* 序号，全为黑色 */
 	}
</style>
</head>
<body style="overflow: hidden;overflow-y:auto; ">
	<div id="tableHeadContent">
		<form id="searchForm" class="form-horizontal">
			<fieldset>
				<legend onclick="hiddenSearch()">查询</legend>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">工单名称：</label>
						<div class="controls">
							<input class="input-normal" type="text"  id="orderName" style="width: 170px;" />
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">工单号：</label>
						<div class="controls">
							<input class="input-normal" type="text" id="orderNum" style="width: 170px;" />
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">工单类型：</label>
						<div class="controls">
							<select id="orderType" style="width: 180px;"></select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">下发时间：</label>
						<div class="controls">
							<input type="text" id="startDate" class="calendar" style="width: 170px;" />
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">至：</label>
						<div class="controls">
							<input type="text" id="endDate" class="calendar" style="width: 170px;" />
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">工单状态：</label>
						<div class="controls">
							<select id="status" style="width: 180px;"></select>
						</div>
					</div>
					<div class="control-group span8">
					<label class="control-label">是否超期：</label>
					<div class="controls">
						<select id="overTimeStatus"  >
							<option value="">全部</option>
						    <option value="1">是</option>
						    <option value="2">否</option>
						</select>
					</div>
				</div>
					<div style="float:right;margin-right: 100px">
						<button type="button" id="btnSearch" class="button button-primary" onclick="searchBtnClick()">查询</button>
					</div>
				</div>
			</fieldset>
		</form>
	    <div class="search-grid-container">
			<fieldset>
			    <legend>列表</legend>
			    	<div id="miniSquareSpace">
			    		<span class="miniSquare"  style="background-color: red"></span>已超期
						<span class="miniSquare"  style="background-color: #FF5500"></span>待接收
						<span class="miniSquare"  style="background-color: #00C5CD"></span>待回复
						<span class="miniSquare"  style="background-color: #8470FF"></span>待回答
						<span class="miniSquare"  style="background-color: #483D8B "></span>已回答
						<span class="miniSquare"  style="background-color: #00a1a1"></span>待审批
						<span class="miniSquare"  style="background-color: #5CACEE"></span>未完成
						<span class="miniSquare"  style="background-color: #1E90FF"></span>完成
						<span class="miniSquare"  style="background-color: #0000FF"></span>已归档
						<span class="miniSquare"  style="background-color: #FF77FF"></span>已分派
					</div>
			        <div id="grid"></div>
		    </fieldset>
	    </div>
	</div>
</body>
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
</script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/workOrder/workOrderCommon.js"></script>
<script type="text/javascript">
	
var contextPath = '<%=contextPath%>' + '/';
var perId = "<%=perId%>";
var orgId='${sessionScope.user.organization.id }';
var orgName='${sessionScope.user.organization.name }';

var orgType = "${sessionScope.user.organization.type}";
var userId = "${sessionScope.user.id}";

var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页

/**
 * 查询栏点击触发收起和展开
 */
function hiddenSearch() {
	$('#searchForm .row').toggle('slow',function(){
		var searchHeight = $('#searchForm').height();
		if(searchHeight < 50){//TODO自己根据条件判断收起和展开的条件及具体高度（即下面的44那个值）
			grid.set('height',grid.get('height') + 44);
		}else{
			grid.set('height',grid.get('height') - 44);
		}
	});
}

//进行高度计算
function readyInit(){
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	grid.set('height',windownHeight - searchHeight - 45);
	
	initPage();
	searchData();
}

/**
 * 初始化页面数据
 */
function initPage() {
	
	initSubStatus("status");
	$("#orderType").append("<option value='' >全部</option>");
	workOrder_type.listData("#orderType");
}

function searchData() {
	pageNum = store.get("start");
	if(store){
		store.load({
			orderName : $("#orderName").val(),
			orderNum : $("#orderNum").val(),
			orderType:$("#orderType").val(),
			startDate:$("#startDate").val(),
			endDate:$("#endDate").val(),
			status:$("#status").val(),
			overTimeStatus:$("#overTimeStatus").val(),
			start : pageNum //从第一页开始
		});
	}
}

function searchBtnClick() {//查询方法，重新加载列表数据源TODO自己定义查询参数
	
	if(store){
		store.load({
			orderName : $("#orderName").val(),
			orderNum : $("#orderNum").val(),
			orderType:$("#orderType").val(),
			startDate:$("#startDate").val(),
			endDate:$("#endDate").val(),
			status:$("#status").val(),
			overTimeStatus:$("#overTimeStatus").val(),
			start : 0 //从第一页开始
		});
	}
}

var store,grid;// 列表及数据源声明

var disposalDialog;// 处理弹出框
var replyDialog;// 回复弹出框
var showDialog;// 详细信息弹出框

var assignDialog;// 分派弹出框
var answerQuestionDialog;// 提问回答弹出框

//声明附件封装对象
function UploadFileDto(name,path){
	this.name = name;
	this.path = path;
}

BUI.use(['bui/grid', 'bui/data', 'bui/overlay', 'bui/calendar','mod/GridBtn','common/multiSelectUser/MultiSelectUserTool'],
	function(Grid, Data, Overlay, Calendar,GB,MultiSelectUserTool) {
	
	/**
	* 初始化日期组件
	*/
	var datepicker = new Calendar.DatePicker({
		trigger : '.calendar',
		autoRender : true
	});

	/**
	 * 处理 弹出框
	 */
	function disposalDialogCreate(workOrderTransactorId){
		disposalDialog = new Overlay.Dialog({
			title : '处理工单',
			width : 685,
			height : 302,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//非模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					store.load();
				},
				afterRenderUI : function() {
					if(orgType == 5) {// 工区的组织机构类型为5，工区用户不能分派
						var buttons = disposalDialog.get('buttons');
						buttons.pop();
					}
				}
			},
			buttons : [ {
				text : '接收',
				elCls : 'button',
				handler :function(){
						receive(receiveWorkOrderTransactor);
						dialogClose(disposalDialog);
					}
				}, {
					text : '转派',
					elCls : 'button',
					handler : function() {
						turnToSendFunc(workOrderTransactorId);
					}
				}, {
					text : '分派',
					elCls : 'button ',
					handler : function() {
						assignFunc(workOrderTransactorId);
					}
				}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderToDoReceive.jsp?workOrderTransactorId=' + workOrderTransactorId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return disposalDialog;
	}
	
	/**
	 * 分派弹出框
	 */
	function assignDialogCreate(workOrderTransactorId,rootId){
		assignDialog = new Overlay.Dialog({
			title : '分派页面',
			width : 685,
			height : 250,
			zIndex : '1111',
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					// 去除一级弹出框遮罩层
					$(".bui-ext-mask").removeClass("twoMask");
				}
			},
			buttons : [ {
				text : '保存',
				elCls : 'button',
				handler :function(){
						
						var receiveUsers = assignStore.getResult();
						if(receiveUsers.length == 0){
							$(".bui-ext-mask").addClass("maskFour");
							tooltip('请新增执行人员');
							return;
						}
						var workOrderTransactor = {id: workOrderTransactorId};
						var assignRemark = $("#assignFrom #assignRemark").val();
						   //验证分派的任务是否未处理过（未处理可重新分派，否则不能分派）
                        var temp = true;
					       $.ajax({  
						         type : "post",  
						          url : contextPath + "workOrderTransactorAction/checkAssign.cn",
						          data : {
						        	  workOrderTransactorId : workOrderTransactorId,
						          } ,
						          dataType:'json',
						          async : false,  
						          success : function(data){  
		            	                if(data) {
		           						 BUI.Message.Alert(data.msg, function(){
		           							 $(".bui-ext-mask").removeClass("maskFour");
		           						 },"error");
		           						 $(".bui-ext-mask").addClass("maskFour");
		           						 temp = false;
		           						 return ;
		           					}
						          }  
					     }); 
					    if(!temp){
     	               		return ;
     	             	}
						assign(workOrderTransactor, receiveUsers, assignRemark);
						// 先关闭转派弹出窗，再关闭处理弹出窗
						dialogClose(assignDialog);
						if(disposalDialog){
							dialogClose(disposalDialog);
						}
						
					}
				}, {
					text : '关闭',
					elCls : 'button',
					handler : function() {
						dialogClose(assignDialog);
					}
				}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderToDoAssign.jsp?id='+workOrderTransactorId+'&rootId='+rootId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return assignDialog;
	}
	
	/**
	 * 回复弹出框
	 */
	function replyDialogCreate(workOrderTransactorId){
		replyDialog = new Overlay.Dialog({
			title : '回复工单',
			width : 685,
			height : 371,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//非模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
	   				//取消正在上传的文件
					var uploaders = uploader.get("queue").getItems();
					for(var i in uploaders){
						uploader.cancel(uploaders[i]);
					}
					store.load();
				}
			},
			buttons : [ {
				text : '提问',
				elCls : 'button',
				handler :function(){
						var answerQuestionDialog = answerQuestionDialogCreate(workOrderTransactorId);
						answerQuestionDialog.show();
						answerQuestionDialog.get('loader').load();
						// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
						$(".bui-ext-mask").addClass("twoMask");
					}
				}, {
					text : '完成',
					elCls : 'button',
					handler :function(){

							// 表单验证
							if(!replyForm.isValid()) {
								return ;
							}
							
							var arr = new Array(); //声明数组,存储数据发往后台
							var fillDiv = $(".fileLabel");
							for(var i = 0 ; i < fillDiv.length ; i++){// 已存在的文件+新上传文件(无path)
						    	var dto = new UploadFileDto(fillDiv[i].title,fillDiv[i].id); // 声明对象
								arr[i] = dto; // 向集合添加对象
							};
							var fileArray = uploader.get("queue").getItems();
							for(var i = 0 ; i < fileArray.length;i++){// 新上传的文件
						    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); // 声明对象
						    	arr.push(dto); // 向集合追加对象
								if(arr[0].path == ""){
									arr.splice(0,1);// 删除path=""的元素
								}
							};
							
							replyWorkOrderTransactor.responseContent = $("#replyDiv #responseContent").val();
							replyFinish(replyWorkOrderTransactor, arr);
							dialogClose(replyDialog);
						}
				}, {
					text : '未完成',
					elCls : 'button',
					handler :function(){
							// 表单验证
							if(!replyForm.isValid()) {
								return ;
							}
							var arr = new Array(); //声明数组,存储数据发往后台
							var fillDiv = $(".fileLabel");
							for(var i = 0 ; i < fillDiv.length ; i++){// 已存在的文件+新上传文件(无path)
						    	var dto = new UploadFileDto(fillDiv[i].title,fillDiv[i].id); // 声明对象
								arr[i] = dto; // 向集合添加对象
							};
							var fileArray = uploader.get("queue").getItems();
							for(var i = 0 ; i < fileArray.length;i++){// 新上传的文件
						    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); // 声明对象
						    	arr.push(dto); // 向集合追加对象
								if(arr[0].path == ""){
									arr.splice(0,1);// 删除path=""的元素
								}
							};
							
							replyWorkOrderTransactor.responseContent = $("#replyDiv #responseContent").val();
							replyNoFinish(replyWorkOrderTransactor, arr);
							dialogClose(replyDialog);
						}
					}, {
				text : '导出',
				elCls : 'button',
				handler : function() {
					exportWord(replyWorkOrderTransactor);
// 					dialogClose(replyDialog);
				}
			}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderToDoReply.jsp?workOrderTransactorId=' + workOrderTransactorId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return replyDialog;
	}
	
	/**
	 * 提问回答弹出框
	 */
	function answerQuestionDialogCreate(workOrderTransactorId){
		answerQuestionDialog = new Overlay.Dialog({
			title : '提问回答页面',
			width : 540,
			height : 440,
			zIndex : '1111',
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : false,
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					// 去除一级弹出框遮罩层
					$(".bui-ext-mask").removeClass("twoMask");
				}
			},
			buttons : [ {
				text : '保存',
				elCls : 'button',
				handler :function(){
						
						var answerQuestionStr = $("#answerQuestionDiv #answerQuestion").val();
						var problemStr = $("#answerQuestionDiv #problem").val();
						if(problemStr == ""){
							$(".bui-ext-mask").addClass("maskFour");
							tooltip("请输入内容！");
							return ;
						}
						problemSave(workOrderTransactorId, answerQuestionStr, problemStr);
						// 先关闭提问回答弹出窗，再关闭回复弹出窗
						dialogClose(answerQuestionDialog);
						dialogClose(replyDialog);
					}
				}, {
					text : '关闭',
					elCls : 'button',
					handler : function() {
						dialogClose(answerQuestionDialog);
					}
				}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderToDoAnswerQuestion.jsp?workOrderTransactorId=' + workOrderTransactorId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return answerQuestionDialog;
	}
	
	/**
	 * 创建详细信息弹出框
	 */
	function showDialogCreate(workOrderTransactorId){
		showDialog = new Overlay.Dialog({
			title : '详细信息',
			width : 685,
			height : 400,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//非模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					store.load();
				}
			},
			buttons : [{
				text : '导出',
				elCls : 'button',
				handler : function() {
					exportWord(workOrderTransactor);
// 					dialogClose(showDialog);
				}
			}, {
				text : '关闭',
				elCls : 'button',
				handler : function() {
					dialogClose(showDialog);
				}
			}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderToDoShow.jsp?workOrderTransactorId=' + workOrderTransactorId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return showDialog;
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
	var columns = [{//TODO自己声明列表表头
		title : '工单号',
		dataIndex : 'order',
		elCls : 'center',//居中显示
		sortable : false,	// 表头不排序
		width : '20%',
		renderer:function(value) {
			if(value != null) {
				return value.orderNum;
			}
			return "";
		}
	}, {
		title : '工单名称',
		dataIndex : 'order',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '27%',
		renderer:function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		}
	},{
		title : '工单类型',
		dataIndex : 'order',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '8%',
		renderer:function(value) {
			return value == null ? "" : workOrder_type.typeName(value.orderType);
		}
	},{
		title:'受令单位',
		dataIndex:'transactor',
		width:'10%',
		elCls : 'center',
		sortable : false,	// 表头不排序
		renderer: function(value) {
			return value == null ? "" : value.organization.name;
		}
	},{
		title:'受令人',
		dataIndex:'transactor',
		width:'10%',
		elCls : 'center',
		sortable : false,	// 表头不排序
		renderer: function(value) {
			return value == null ? "" : value.name;
		}
	},{
		title : '下发时间',
		dataIndex : 'order',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '75px',
		renderer:function(value) {
			return value.sendDate;
		}
	},{
		title : '完成期限',
		dataIndex : 'order',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '75px',
		renderer:function(value) {
			return value.deadLine;
		}
	},{
		title : '工单状态',
		dataIndex : 'status',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '8%',
		renderer : function(value) {
			return subStatusToChinese(value);
		}
	},{
		title : '操作',
		dataIndex : 'status',
		elCls : 'center',
		sortable : false,	
		width : '22%',
		renderer:function(value,obj) {
			if(obj.transactor.id == userId){
				switch(value) {
					case DAI_JIE_SHOU: // 待接收
						return '<span class="grid-command replyBtn">回复</span>&nbsp;'+
	            		'<span class="grid-command assign">分派</span>&nbsp;'+
	            		'<span class="grid-command btn-dispatch">转派</span>&nbsp;'+ 
	            		'<span class="grid-command btn-show">详情</span>';
					case DAI_HUI_FU: // 待回复
						return '<span class="grid-command replyBtn">回复</span>&nbsp;<span class="grid-command assign">分派</span>&nbsp;<span class="grid-command btn-dispatch">转派</span>&nbsp;<span class="grid-command btn-show">详情</span>';
					case DAI_HUI_DA: // 待回答
						return '<span class="grid-command replyBtn">回复</span>&nbsp;<span class="grid-command assign">分派</span>&nbsp;<span class="grid-command btn-dispatch">转派</span>&nbsp;<span class="grid-command btn-show">详情</span>';
					case Yi_HUI_DA: // 已回答
						return '<span class="grid-command replyBtn">回复</span>&nbsp;<span class="grid-command assign">分派</span>&nbsp;<span class="grid-command btn-dispatch">转派</span>&nbsp;<span class="grid-command btn-show">详情</span>';
					case YI_FEN_PAI : //  已分派
						return '<span class="grid-command assign">分派</span>&nbsp;<span class="grid-command btn-dispatch">转派</span>&nbsp;<span class="grid-command btn-show">详情</span>';
					default:
						return '<span class="grid-command btn-show">详情</span>';
				}
			}else{
				return '<span class="grid-command btn-show">详情</span>';
			}
		}
	}];
	/*
	 * 列表数据源声明
	 */
	store = new Data.Store({
		pageSize : 10,//每页数量
		proxy : {
			url : contextPath + "workOrderTransactorAction/getToDoByWorkShopDirector.cn",//TODO异步数据源请求
			method : 'post'
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
				itemStatusFields : {
					daiJieShou : 'daiJieShou', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
					daiHuiFu : 'daiHuiFu',
					daiHuiDa : 'daiHuiDa',
					yiHuiDa : 'yiHuiDa',
					daiShenPi : 'daiShenPi',
					weiWanCheng : 'weiWanCheng',
					wanCheng : 'wanCheng',
					yiGuiDang : 'yiGuiDang',
					yiFenPai : 'yiFenPai',
					yiChaoQi: 'yiChaoQi'
				},
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [
// 				            	Grid.Plugins.CheckSelection,//多选框插件
				            	Grid.Plugins.RowNumber//列序号插件
				            	 ],
				tbar : {
					items : [
							{
								xclass : 'bar-item-text',
								text : errorMsgHtml+sucMsgHtml
							}]
				},
				// 底部工具栏
				bbar : {
					// pagingBar:表明包含分页栏
					pagingBar : true
				}
			});
	grid.render();//渲染列表
	
	readyInit();
	
	// 添加单元格点击事件
	grid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
		var rootId = record.order.id;
    	if(target.hasClass('disposalBtn')) {
    		disposalBtn(record.id);
    	}
    	else if(target.hasClass('replyBtn')) {//回复
    		replyBtn(record.id);
    	} else if(target.hasClass('assign')){//分派
    		assignFunc(record.id,rootId);
    	} else if(target.hasClass('btn-dispatch')){//转派
    		turnToSendFunc(record.id,record.status);
    	} else if(target.hasClass('btn-show')){//详情
    		var showDialog = showDialogCreate(record.id);
			showDialog.show();
			showDialog.get('loader').load();
    	}
	});
	
	/**
	 * 处理按钮
	 */
	function disposalBtn(workOrderTransactorId) {
		var disposalDialog = disposalDialogCreate(workOrderTransactorId);
		disposalDialog.show();
		disposalDialog.get('loader').load();
	}
	
	/**
	 * 回复按钮
	 */
	function replyBtn(workOrderTransactorId) {
		var replyDialog = replyDialogCreate(workOrderTransactorId);
		replyDialog.show();
		replyDialog.get('loader').load();
	}
	
	/**
	 * 接收
	 */
	function receive(workOrderTransactor) {
		$.post(
				contextPath + "workOrderTransactorAction/receive.cn",	
				{
					workOrderTransactor : JSON.stringify(workOrderTransactor)
				},
				function(data,status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess("接收成功！");
					}else{
						commonFailure("接收失败！");
					}
					store.load();
				}
		);
	}
	
	/**
	 * 转派
	 */
	function turnToSendFunc(workOrderTransactorId) {
// 		var turnToSendDialog = turnToSendDialogCreate(workOrderTransactorId);
// 		turnToSendDialog.show();
// 		turnToSendDialog.get('loader').load();
// 		// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
// 		$(".bui-ext-mask").addClass("twoMask");
		var multiSelectUserTool = new MultiSelectUserTool({
    		//待转派的数据id（通过该id获取父id，
    		//通过父id获取所有该父数据的子数据，
    		//子数据中有个属性表示的数据所属用户，
    		//通过这个属性过滤掉下拉选中已经拥有子数据的用户）
    		id:workOrderTransactorId,
    		orgId:orgId,
    		orgName:orgName,
    		contextPath:contextPath+"workOrderTransactorAction/getSelectUsersByOrgId.cn"
    	});
    	multiSelectUserTool.show();
    	multiSelectUserTool.on('sureBtn',function(e){
            var receiveUserId = $("#user").val();//接收人id
            if(!receiveUserId){
            	tooltip("接收人不能为空");
                $(".bui-ext-mask").addClass("maskFour");
                return ;
            }
            $.post(contextPath + 'workOrderTransactorAction/turnToSendMultiUser.cn',
                    {
                        id : workOrderTransactorId,
                        receiveUserId : receiveUserId,
                        status : status
                    },function(data,status){
                        if(status){
                            commonSuccess("转派成功！");
                        }else{
                            commonFailure("转派失败！");
                        }
                        readyInit();
                    }, 'json');
			multiSelectUserTool.close();
// 			dialogClose(disposalDialog);
		});
	}
	
	/*
	* 转派保存
	*/
	function turnToSend(workOrderTransactor, receiveUserId) {
		
		$.post(
				contextPath + "workOrderTransactorAction/turnToSend.cn",
				{
					workOrderTransactor : JSON.stringify(workOrderTransactor),
					receiveUserId : receiveUserId
				},
				function(data,status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess("工单转派操作成功！");
					}else{
						commonFailure("工单转派操作失败！");
					}
					store.load();
				}
		);
	}
	
	/*
	* 分派验证
	*/
	function assignFunc(workOrderTransactorId,rootId) {
		// 验证当前子工单是否能分派
		$.post(
				contextPath + "workOrderTransactorAction/checkAssign.cn",
				{
					workOrderTransactorId : workOrderTransactorId,
				},
				function(data,status){
					if(data) {
						 BUI.Message.Alert(data.msg, "error");
						 return ;
					}
					var assignDialog = assignDialogCreate(workOrderTransactorId,rootId);
					assignDialog.show();
					assignDialog.get('loader').load();
					
					// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
					$(".bui-ext-mask").addClass("twoMask");
				},'json'
		);
	}
	
	/*
	* 分派---保存
	*/
	function assign(workOrderTransactor, receiveUsers, assignRemark) {
		
		$.post(
				contextPath + "workOrderTransactorAction/assign.cn",
				{
					workOrderTransactor : JSON.stringify(workOrderTransactor),
					receiveUsers : JSON.stringify(receiveUsers),
					assignRemark : assignRemark
				},
				function(status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess("工单分派操作成功！");
					}else{
						commonFailure("工单分派操作失败,子单已回复！");
					}
					store.load();
				}, 'json'
		);
	}
	
	/**
	 * 提问--->保存
	 */
	function problemSave(workOrderTransactorId, answerQuestionStr, problemStr) {
		$.post(
				contextPath + "workOrderTransactorAction/ask.cn",
				{
					workOrderTransactorId : workOrderTransactorId,
					answerQuestionStr : answerQuestionStr,
					problemStr : problemStr
				},
				function(status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess("工单提问操作成功！");
					}else{
						commonFailure("工单提问操作失败,该工单已不存在！");
					}
					store.load();
				}, 'json'
		);
	}
	
	/**
	 * 回复--->完成
	 */
	function replyFinish(workOrderTransactor, arr) {
		$.post(
				contextPath + "workOrderTransactorAction/replyFinish.cn",	
				{
					workOrderTransactor : JSON.stringify(workOrderTransactor),
					uploadFileArr : JSON.stringify(arr)
				},
				function(status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess("工单完成操作成功！");
					}else{
						commonFailure("工单完成操作失败,该工单已不存在！");
					}
					store.load();
				}, 'json'
		);
	}
	 
	/**
	 * 回复--->未完成
	 */
	function replyNoFinish(workOrderTransactor, arr) {
		$.post(
				contextPath + "workOrderTransactorAction/replyNoFinish.cn",
				{
					workOrderTransactor : JSON.stringify(workOrderTransactor),
					uploadFileArr : JSON.stringify(arr)
				},
				function(status){
					if(status){//显示成功信息，并在5秒后消失
						commonSuccess("工单未完成操作成功！");
					}else{
						commonFailure("工单未完成操作失败,该工单已不存在！");
					}
					store.load();
				}, 'json'
		);
	}
	 
	function exportWord(workOrderTransactor) {
		
		$.post(
				contextPath + "workOrderTransactorAction/exportWord.cn",
				{
					workOrderTransactorId : workOrderTransactor.id
				},
				function(data,status){
					
					var fileName = "工单详情_";
					fileName += workOrderTransactor.transactor.organization.name + "_";
					fileName += "${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}.doc";
					window.location.href = "/kunmingrinms/DownloadFileServlet?fileName="+ fileName +"&filePath=" + data;
				},'text'
		);
	}
	
	// 弹出框提示
	function tooltip(msg){
		BUI.Message.Show({
			msg : msg,
			closeable : false,
			buttons : [
  	            {
  	              text : '确定',
  	              elCls : 'button',
  	              handler : function(){
  	            	$(".bui-ext-mask").removeClass("maskFour");
						this.close();
					}
  	        }]
  	    });
  	}
	
});
	</script>
</body>
</html>