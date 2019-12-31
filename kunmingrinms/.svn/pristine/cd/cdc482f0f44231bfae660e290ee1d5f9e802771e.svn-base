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
<title>工单管理</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
	.subShowMask {
		z-index: 1100 !important;
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
	.bui-grid-row-caoGao{
	    color: #FF00FF;
	 }
	.bui-grid-row-yiPaiFa{
	    color: #8B2252;
	 }
	 .bui-grid-row-chuLiZhong{
	    color: #ff0099;
	 }
	 .bui-grid-row-daiGuiDang{
	    color: #4169E1;
	 }
	 .bui-grid-row-yiGuiDang{
	    color: #0000FF;
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
								<input class="input-normal control-text" type="text"  id="orderName" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">工单号：</label>
							<div class="controls">
								<input class="input-normal control-text" type="text"  id="orderNum" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">工单类型：</label>
							<div class="controls">
								<select id="orderType" ></select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">下发时间：</label>
							<div class="controls">
								<input type="text" id="startDate" class="calendar" style="width: 140px;" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">至：</label>
							<div class="controls">
								<input type="text" id="endDate" class="calendar" style="width: 140px;" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">工单状态：</label>
							<div class="controls">
								<select id="status" ></select>
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
						<span class="miniSquare"  style="background-color: #FF00FF"></span>草稿
						<span class="miniSquare"  style="background-color: #8B2252"></span>已派发
						<span class="miniSquare"  style="background-color: #ff0099"></span>处理中
						<span class="miniSquare"  style="background-color: #4169E1"></span>待归档
						<span class="miniSquare"  style="background-color: #0000FF"></span>已归档
					</div>
			        <div id="grid"></div>
		    </fieldset>
	    </div>
	</div>
	<input type="hidden" id="fileDownTime" value="${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}" />
</body>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/workOrder/workOrderCommon.js"></script>
<script type="text/javascript">
	
var contextPath = '<%=contextPath%>' + '/';
var perId = "<%=perId%>";
var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
/**
 * 查询栏点击触发收起和展开
 */
function hiddenSearch() {
	$('#searchForm .row').toggle('slow',function(){
		var searchHeight = $('#searchForm').height();
		if(searchHeight < 50){//自己根据条件判断收起和展开的条件及具体高度（即下面的44那个值）
			grid.set('height',grid.get('height') + 44);
		}else{
			grid.set('height',grid.get('height') - 44);
		}
	});
}

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
	initMainStatus("status");
	$("#orderType").append("<option value='' >全部</option>");
	workOrder_type.listData("#orderType");
}

function searchData() {
	pageNum = store.get("start");
	if(store){
		store.load({
			orderName:$("#orderName").val(),
			orderNum:$("#orderNum").val(),
			orderType:$("#orderType").val(),
			startDate:$("#startDate").val(),
			endDate:$("#endDate").val(),
			status:$("#status").val(),
			orgId:"${sessionScope.user.organization.id}",
			start:pageNum //从第一页开始
		});
	}
}

function searchBtnClick() {//查询方法，重新加载列表数据源自己定义查询参数
	if(store){
		store.load({
			orderName:$("#orderName").val(),
			orderNum:$("#orderNum").val(),
			orderType:$("#orderType").val(),
			startDate:$("#startDate").val(),
			endDate:$("#endDate").val(),
			status:$("#status").val(),
			orgId:"${sessionScope.user.organization.id}",
			start:0 //从第一页开始
		});
	}
}

var store,grid;// 列表及数据源声明

var addDialog;// 新增弹出框
var updateDialog;// 修改弹出框
var showDialog;// 详细信息弹出框
var showSubDialog;// 执行人详细信息弹出框
var filingDialog;// 归档弹出框
var receiveUserDialog;// 变更执行人弹出框

//声明附件封装对象
function UploadFileDto(name,path){
	this.name = name;
	this.path = path;
}
BUI.use(['bui/grid','bui/data','bui/overlay','bui/calendar','mod/GridBtn','common/bodyLoadMask/MyLoadMask'],
	function(Grid, Data, Overlay, Calendar, GB, MyLoadMask) {
	
	/**
	* 初始化日期组件
	*/
	var datepicker = new Calendar.DatePicker({
		trigger : '.calendar',
		autoRender : true
	});

	/**
	 * 新增弹出框
	 */
	function addDialogCreate(){
		addDialog = new Overlay.Dialog({
			title : '新增工单',
			width : 685,
			height : 350,
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
				text : '保存',
				elCls : 'button',
				handler :function(){
						// 表单验证
						if(!addForm.isValid()) {
							return ;
						}
						
						var arr = new Array(); //声明数组,存储数据发往后台
						//获取上传文件的对列
						var fileArray = uploader.get("queue").getItems();
					 	for(var i in fileArray){
					    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
							arr[i] = dto; // 向集合添加对象
						};
						
						var orderName = $("#addOrderName").val();
						var orderType = $("#addOrderType").val();
						var orderNum = $("#addOrderNum").val();
						var orderSeq = $("#addOrderNum").attr("data-seq");
						var deadLine = $("#addForm #deadLine").val();
						
						var receiveUsers = addStore.getResult();
						if(receiveUsers.length == 0){
							$(".bui-ext-mask").addClass("subShowMask");
							tooltip('请新增执行人员');
							return;
						}
						receiveUsers = JSON.stringify(receiveUsers);
						
						addWorkOrder(orderName, orderType, orderNum, orderSeq, deadLine, receiveUsers, arr);
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
				url : contextPath + 'views/workOrder/workOrderAdd.jsp',//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return addDialog;
	}
	
	/**
	 * 修改弹出框
	 */
	function updateDialogCreate(workOrderId){
		updateDialog = new Overlay.Dialog({
			title : '修改工单',
			width : 685,
			height : 350,
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
				text : '保存',
				elCls : 'button',
				handler :function(){
						// 表单验证
						if(!updateForm.isValid()) {
							return ;
						}
						var receiveUsers = updateStore.getResult();
						if(receiveUsers.length == 0){
							$(".bui-ext-mask").addClass("subShowMask");
							tooltip('请新增执行人员');
							return;
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
						workOrder.name = $("#updateOrderName").val();
						workOrder.orderType = $("#updateOrderType").val();
						workOrder.orderNum = $("#updateOrderNum").val();
						workOrder.orderSeq = $("#updateOrderNum").attr("data-seq");
						workOrder.deadLine = $("#updateForm #deadLine").val();
						workOrder.receiveUsers = receiveUsers;
						
						updateWorkOrder(workOrder, arr);
						dialogClose(updateDialog);
					}
				}, {
					text : '关闭',
					elCls : 'button',
					handler : function() {
						dialogClose(updateDialog);
					}
				}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderUpdate.jsp?workOrderId=' + workOrderId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return updateDialog;
	}
	
	// 变更执行人变更记录
   	function receiveUserDialogCreate(id){
   		receiveUserDialog = new Overlay.Dialog({
   			title : '变更执行人',
   			width : 650,
   			height : 350,
   			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
   			mask : true,//非模态弹出框
   			bodyStyle : {padding : 0},
   			listeners : {
   				closing : function(){//关闭窗口时刷新列表
   					store.load();
   				}
   			},
   			buttons : [ {
   			text : '派发',
   			elCls : 'button btn-send',
   			handler :function(){
   				var receiveUser = updateStore.getResult();//获取接收人信息
   				if(receiveUser.length <= 0){
   					tooltip("请新增执行人员！");
   					$(".bui-ext-mask").addClass("subShowMask");
					return ;
   				}
   					//提交数据至服务端
   					$.post(contextPath + 'workOrderAction/updateSelectUsers.cn',
   							{
   								id : id,
   								receiveUser : JSON.stringify(receiveUser),
   							},function(data,status){
   								if(status){
   									if(data.status=='2'){
   										tooltip(data.msg);
   										$(".bui-ext-mask").addClass("subShowMask");
   										return;
   									}
   									if(data.status=='3'){
   										tooltip(data.msg);
   										$(".bui-ext-mask").addClass("subShowMask");
   										return;
   									}
   									commonSuccess("变更执行人派发成功！");
   								}else{
   									commonFailure("变更执行人派发失败！");
   								}
   								dialogClose(receiveUserDialog);
   							},'json');
   					}
   				}, {
   					text : '关闭',
   					elCls : 'button btn-close',
   					handler : function() {
   						dialogClose(receiveUserDialog);
   				}
   			}],
   			loader : {
   				url : contextPath + 'views/workOrder/workOrderReceiveUser.jsp?workOrderId='+id,
   				autoLoad : false,//不在弹出框组件初始化时自动加裁
   				lazyLoad : false,//不进行延迟加裁
   				dataType : 'html'//加载内容类型
   			}
   		});
   		return receiveUserDialog;
   	}
	
	/**
	 * 创建详细信息弹出框
	 */
	function showDialogCreate(workOrderId){
		showDialog = new Overlay.Dialog({
			title : '详细信息',
			width : 685,
			height : 450,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//非模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					store.load();
				}
			},
			buttons : [{
				text : '查看',
				elCls : 'button',
				handler : function() {
					var workOrderTransactor = showGrid.getSelected();
					if(workOrderTransactor) {
						var showSubDialog = showSubDialogCreate(workOrderTransactor.id);
						showSubDialog.show();
						showSubDialog.get('loader').load();
						
						// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
						$(".bui-ext-mask").addClass("subShowMask");
					}else{
// 						BUI.Message.Alert("请选择一个部门进行查看！","info");
						$(".bui-ext-mask").addClass("subShowMask");
						tooltip('请选择一个部门进行查看！');
					}

				}
			}, {
				text : '导出word',
				elCls : 'button',
				handler : function() {
					
					var workOrderTransactor = showGrid.getSelected();
					if(!workOrderTransactor){
// 						BUI.Message.Alert("请选择一个部门进行导出！","info");
						$(".bui-ext-mask").addClass("subShowMask");
						tooltip('请选择一个部门进行导出！');
						return;
					}
					exportWord(workOrderTransactor);
// 					dialogClose(showDialog);
				}
			}, {
				text : '回复附件打包下载',
				elCls : 'button',
				handler : function() {
					
					getReplyFileDown(workOrderId);
// 					dialogClose(showDialog);
				}
			}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderShow.jsp?workOrderId=' + workOrderId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return showDialog;
	}
	
	function showSubDialogCreate(workOrderTransactorId){
		showSubDialog = new Overlay.Dialog({
			title : '执行人详细信息',
			width : 685,
			height : 400,
			zIndex : '1111',
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//非模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					// 去除一级弹出框遮罩层
					$(".bui-ext-mask").removeClass("subShowMask");
				}
			},
			buttons : [],
			loader : {
				url : contextPath + 'views/workOrder/workOrderToDoShow.jsp?workOrderTransactorId=' + workOrderTransactorId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return showSubDialog;
	}
	
	// 归档弹出框
	function filingDialogCreate(workOrderId){
		filingDialog = new Overlay.Dialog({
			title : '归档工单',
			width : 450,
			height : 250,
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
				text : '保存',
				elCls : 'button',
				handler :function(){
						
						var arr = new Array(); //声明数组,存储数据发往后台
						//获取上传文件的对列
						var fileArray = uploader.get("queue").getItems();
					 	for(var i in fileArray){
					    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
							arr[i] = dto; // 向集合添加对象
						};
						
						var summary = $("#summary").val();
						filing(workOrderId, summary, arr);
						dialogClose(filingDialog);
					}
				}, {
					text : '关闭',
					elCls : 'button',
					handler : function() {
						dialogClose(filingDialog);
					}
				}],
			loader : {
				url : contextPath + 'views/workOrder/workOrderfiling.jsp',//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return filingDialog;
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
		dataIndex : 'orderNum',
		elCls : 'center',//居中显示
		sortable : false,	// 表头不排序
		width : '25%'
	}, {
		title : '工单名称',
		dataIndex : 'name',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '35%'
	},{
		title : '工单类型',
		dataIndex : 'orderType',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '12%',
		renderer:function(value) {
			return workOrder_type.typeName(value);
		}
	}/* ,{
		title:'创建时间',
		dataIndex :'creatDate',
		elCls:'center',
		sortable:false,
		width:'75px'
	} */,{
		title:'下发时间',
		dataIndex :'sendDate',
		elCls:'center',
		sortable:false,
		width:'75px'
	},{
		title:'完成期限',
		dataIndex :'deadLine',
		elCls:'center',
		sortable:false,
		width:'75px'
	},{
		title : '工单状态',
		dataIndex : 'status',
		elCls : 'center',
		sortable : false,	// 表头不排序
		width : '10%',
		renderer : function(value) {
				return mainStatusToChinese(value);
		}
	},{
		title : '操作',
		dataIndex : 'status',
		elCls : 'center',
		sortable : false,	
		width : '12%',
		renderer:function(value) {
			switch(value) {
				case CAO_GAO: // 草稿
					return '<span class="grid-command assignBtn">下发</span>'
					+'&nbsp;<span class="grid-command infoBtn">详情</span>';
				case DAI_GUI_DANG: // 待归档
					return '<span class="grid-command filingBtn">归档</span>'
					+'&nbsp;<span class="grid-command infoBtn">详情</span>';
				default:
					return '<span class="grid-command infoBtn">详情</span>';
			}
		}
	}];
	/*
	 * 列表数据源声明
	 */
	store = new Data.Store({
		pageSize : 10,//每页数量
		proxy : {
			url : contextPath + "workOrderAction/getAddListByDTO.cn",//TODO异步数据源请求
			method : 'post'
		}
	});
	/*
	 * 列表声明
	 */
	grid = new GB(
			{
				render : '#grid',
				idField : 'id',
				columns : columns,
				loadMask : true,
				perId : perId,
				contextPath : contextPath,
				store : store,
				width : '100%',
				itemStatusFields : {
					caoGao : 'caoGao', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
					yiPaiFa : 'yiPaiFa',
					chuLiZhong : 'chuLiZhong',
					daiGuiDang : 'daiGuiDang',
					yiGuiDang : 'yiGuiDang'
				},
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [
				            	Grid.Plugins.CheckSelection,//多选框插件
				            	Grid.Plugins.RowNumber//列序号插件
				            	 ],
				tbar : {
					items : [
							{
								btnCls : 'button button-small',
								text : '<i class="icon-plus"></i>新增',
								listeners : {
									click : function() {//点击时创建并弹出修改界面
										var addDialog = addDialogCreate();
										addDialog.show();
										addDialog.get('loader').load();
									}
								}
							},
							{
								xclass : 'bar-item-separator'
							}, {
								btnCls : 'button button-small',
								text : '<i class="icon-edit"></i>修改',
								listeners : {
									click : function() {
										var selectedAll = grid.getSelection();
										if(selectedAll.length != 1){
											commonFailure("请选择一条记录进行修改");
											return; 
										}
										
										var record = selectedAll[0];
										var workOrderId = record.id;
										if(record.status==1||record.status==2){
											var updateDialog = updateDialogCreate(workOrderId);
											updateDialog.show();
											updateDialog.get('loader').load();
										}else{
											commonFailure("此条信息不能修改");
										}
										
									}
								}
							},
							{
								xclass : 'bar-item-separator'
							}, {
								btnCls : 'button button-small',
								text : '<i class="icon-remove"></i>批量删除',
								listeners : {
									click : function() {
										var selectedAll = grid.getSelection();
										if(selectedAll.length == 0){
											commonFailure("请选择一条记录进行删除");
											return;
										}
										var ids = "";
										for(var i = 0; i < selectedAll.length; i ++) {
											ids += "," + selectedAll[i].id;
										}
										ids = ids.substring(1);
										
										delWorkOrder(ids);
									}
								}
							},{
			                	xclass : 'bar-item-separator' // 竖线分隔符
			                },{
			                  btnCls : 'button button-small',
			                  text : '<i class="icon-user"></i>变更执行人',
			                  listeners : {'click' : function(){
			                	  var selections = grid.getSelection();
									if(selections.length == 1){
										recordSelected = selections[0];
										receiveUserDialog = receiveUserDialogCreate(recordSelected.id);
										receiveUserDialog.show();
										receiveUserDialog.get('loader').load();
									}else{
										commonFailure('请选择一条数据进行操作！');
									}
			                    }
			                  }
			                },
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
	
	// 添加单元格点击事件
	grid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
		var record = ev.record;	//点击行的记录
    	if(target.hasClass('assignBtn')) {
    		assignBtn(record);
    	} else if(target.hasClass('filingBtn')) {
    		filingBtn(record);
    	} else if(target.hasClass('infoBtn')){
    		var workOrderId = record.id;
			var showDialog = showDialogCreate(workOrderId);
			showDialog.show();
			showDialog.get('loader').load();
    	}
	});
	readyInit();
	/**
	 * 新增
	 */
	function addWorkOrder(orderName, orderType, orderNum, orderSeq, deadLine, receiveUsers, arr) {
		
		$.post(contextPath + 'workOrderAction/add.cn',
				{
					orderName : orderName,
					orderType : orderType,
					orderNum : orderNum,
					orderSeq : orderSeq,
					deadLine : deadLine,
					receiveUsers : receiveUsers,
					uploadFileArr : JSON.stringify(arr)
				},function(data,status){
					if(status){
						commonSuccess("工单新增成功！");
					}else{
						commonFailure("工单新增失败！");
					}
					store.load();
				});
	}
	
	/**
	 * 修改
	 */
	function updateWorkOrder(workOrder, arr) {
		
		$.post(contextPath + 'workOrderAction/update.cn',
				{
					workOrder : JSON.stringify(workOrder),
					uploadFileArr : JSON.stringify(arr)
				},function(data,status){
					
					if(status){
						commonSuccess("工单修改成功！");
					}else{
						commonFailure("工单修改失败！");
					}
					store.load();
				});
	}
	
	/**
	 * 删除
	 * @param ids 
	 */
	function delWorkOrder(ids) {
		
		var msg = '确定要删除选中记录吗？<br/>';
		BUI.Message.Confirm(msg,
		function(){
			$.post(
					contextPath + "workOrderAction/delete.cn",	
					{
						ids:ids
					},
					function(data,status){
						if(status){//显示成功信息，并在5秒后消失
							commonSuccess('删除成功！');
						}else{
							commonFailure();
						}
						store.load();
					}
			);
		},
		'question');
	}
	
	/**
	 * 下发
	 * @param id 字符串
	 */
	function assignBtn(workOrder) {
		// 首先生成遮罩层,防止多次点击
		var MLM = new MyLoadMask({
			contextPath : contextPath,
			el : 'body'
		});
		MLM.show();
		$.post(contextPath + 'workOrderAction/assign.cn',
				{
					workOrder : JSON.stringify(workOrder)
				},function(data,status){
					if(status){
						MLM.hide();
						commonSuccess("工单下发成功！");
					}else{
						commonFailure("工单下发失败！");
					}
					store.load();
				});
	}
	
	// 归档按钮
	function filingBtn(workOrder) {
		
		var filingDialog = filingDialogCreate(workOrder.id);
		filingDialog.show();
		filingDialog.get('loader').load();
	}
	
	// 归档
	function filing(workOrderId, summary, arr) {
		
		$.post(contextPath + 'workOrderAction/filing.cn',
				{
					workOrderId :  workOrderId,
					summary : summary,
					uploadFileArr : JSON.stringify(arr)
				},function(data,status){
					if(status){
						commonSuccess("工单归档成功！");
					}else{
						commonFailure("工单归档失败！");
					}
					store.load();
				});
	}
	
	// 导出word
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
				},"text"
		);
	}
	
	// 获取回复附件打包
	function getReplyFileDown(workOrderId){
		$.ajax({
			url : contextPath + "workOrderZipFileAction/workOrderFilesToZip.cn",
			type : "post",
			dataType : "text",
			data:{
				workOrderId : workOrderId
			},
			success : function(data,status){
				if(data == "0"){
					$(".bui-ext-mask").addClass("subShowMask");
					tooltip("无附件下载！");
				}else{
					replyFileDown(data);
				}
			}
			
		});
	}
	
	// 回复附件打包下载
	function replyFileDown(url){
		var time = $('#fileDownTime').val();
		window.location.href = '/kunmingrinms/DownloadFileServlet?fileName=工单回复附件__'+time+'.zip&filePath='+url;
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
  	            	$(".bui-ext-mask").removeClass("subShowMask");
						this.close();
					}
  	        }]
  	    });
  	}
});
	</script>
</body>
</html>