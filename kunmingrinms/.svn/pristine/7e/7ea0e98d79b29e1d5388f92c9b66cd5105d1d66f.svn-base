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
<title>创建调度命令</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
	#miniSquareSpace{
		margin-top:15px;
		margin-right:4px; 
		float:right;
	}
	.miniSquare{
		display:inline-block;
		margin-left:10px;
		margin-right:3px;
		width:10px;
		height:10px;
		background-color:#000;
	}
	.bui-grid-row-magenta{
	    color: #FF00FF; /* 粉紫色  草稿*/
	 }
	 .bui-grid-row-darkOrange{
	    color: #333333;/* 橙色  待接收*/
	 }
	 .bui-grid-row-red{
	    color: #ff0099;/* 红色   处理中*/
	 }
	 .bui-grid-row-blue{
	    color: #0000FF;/* 蓝色   已归档*/
	 }
	.userMask {
		z-index: 1100 !important;
	}
	.x-grid-rownumber{
		color : black;
	}
</style>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			 <div class="row">
				<div class="control-group span8">
					<label class="control-label">命令号：</label>
					<div class="controls">
						<input type="text" name="number" id="number" class="input-normal" style="width: 170px;"/>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">调令状态：</label>
					<div class="controls">
						<select name="status" id="status" style="width: 180px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">发令时间：</label>
					<div class="controls" >
						<input type="text" id="startTime" class="calendar calendar-time"
						 style="width: 170px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">至：</label>
					<div class="controls" >
						<input type="text" id="endTime" class="calendar calendar-time"
						 style="width: 170px;" />
					</div>
				</div>
				<div style="float:right;margin-right: 100px">
					<button type="button" id="btnSearch" class="button button-primary">查询</button>
				</div>
			</div>
		</fieldset>
	</form>
	<input type="hidden" id="fileDownTime" value="${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}" />
	<div class="search-grid-container">
		<fieldset>
			<legend>列表</legend>
			<div id="miniSquareSpace">
				<span class="miniSquare" style="background-color: #FF00FF"></span>草稿
				<span class="miniSquare" style="background-color: #333333"></span>待接收
				<!-- <span class="miniSquare" style="background-color: #00C5CD"></span>已接收 -->
				<span class="miniSquare" style="background-color: #ff0099"></span>处理中
				<span class="miniSquare" style="background-color: #0000FF"></span>已归档
			</div>
			<div id="grid"></div>
		</fieldset>
	</div>
	
	<form action="/kunmingrinms/dispatchRootAction/expDispatchRoot.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var perId = "<%=perId%>";
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	var pageSize = 10;//每页显示条数
	
	var store,grid;// 列表及数据源声明

	var addDialog;// 新增弹出框
	var editDialog;// 修改弹出框
	var showDialog;// 详细信息弹出框
	var showChildDialog;// 子调令详细信息弹出框
	var receiveUserDialog;// 变更执行人弹出框
	
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
		grid.set('height',windownHeight - searchHeight-45);
		
		searchData();
		initDateType();
	};
	
	function initDateType() {// 调令状态
		dispathRoot_status.listData("#searchForm #status");
	}
	
	function searchData() {//初始化页面方法
		pageNum = store.get("start");
		if(store){
			store.load({
				number : $("#searchForm #number").val(),
				status : $("#searchForm #status").val(),
				startTime : $("#searchForm #startTime").val(),
				endTime : $("#searchForm #endTime").val(),
				start : 0 //从第一页开始
			});
		}
	}
	
	function searchBtnClick() {//查询方法，重新加载列表数据源TODO自己定义查询参数
		if(store){
			store.load({
				number : $("#searchForm #number").val(),
				status : $("#searchForm #status").val(),
				startTime : $("#searchForm #startTime").val(),
				endTime : $("#searchForm #endTime").val(),
				overTimeStatus:$("#overTimeStatus").val(),
				start : pageNum //从第一页开始
			});
		}
	}
	
	$("#btnSearch").click(function(){
		searchBtnClick();
		return false;
	});
	
// 	BUI.use(["bui/grid","bui/data",'bui/calendar','bui/overlay','mod/GridBtn','common/bodyLoadMask/MyLoadMask'],
// 			function(Grid, Data, Calendar, Overlay, GB, MyLoadMask){
	BUI.use(["bui/grid","bui/data",'bui/calendar','bui/overlay','mod/GridBtn','common/bodyLoadMask/BodyLoadMask'],
			function(Grid, Data, Calendar, Overlay, GB, BodyLoadMask){
		
		//再次点击清空时间
// 		$('#startTime').on('click',(function(){
// 			$('#startTime').val("");
// 		}));
// 		$('#endTime').on('click',(function(){
// 			$('#endTime').val(""); 
// 		}));
		
		//日历
		var datepickerStart = new Calendar.DatePicker({
			trigger : '#startTime',
			showTime : true,
			autoRender : true
		});
		var datepickerEnd = new Calendar.DatePicker({
			trigger : '#endTime',
			showTime : true,
			autoRender : true
		});
		//设置默认时间
		datepickerStart.on('show',function(){
			var c = datepickerStart.get('calendar');
			c.set('hour',0);
			c.set('minute',0);
			c.set('second',0);
		});
		datepickerEnd.on('show',function(){
			var c = datepickerEnd.get('calendar');
			c.set('hour',23);
			c.set('minute',59);
			c.set('second',59);
		});
		
		/*表格内容*/
		var Store = Data.Store;
		/*表格列设置*/
		var columns = [
			{
				title:'命令号',
				dataIndex:'dispatchNum',
				width:'45%',
				elCls : 'center',
			},           
			{
				title:'值班调度',
				dataIndex:'dispatchUser',
				width:'25%',
				elCls : 'center',
			},
			{
				title:'发令时间',
				dataIndex:'sendDate',
				width:'75px',
				elCls : 'center',
				renderer: Grid.Format.datetimeRenderer
			},
			{
				title:'完成期限',
				dataIndex:'deadLine',
				width:'75px',
				elCls : 'center',
				renderer: Grid.Format.datetimeRenderer
			},
			{
				title:'发令人',
				dataIndex:'sendUser',
				width:'25%',
				elCls : 'center',
				renderer: function(value) {
					return value == null ? "" : value.name;
				}
			},
			{
				title:'状态',
				dataIndex:'status',
				width:'15%',
				elCls : 'center',
				renderer: function(value) {
					return dispathRoot_status.statusName(Number(value));
				}
			},
			{
				title : '操作',
				dataIndex : 'status',
				width:'15%',
				elCls : 'center',
				renderer : function(value) {
					switch(Number(value)) {
					case 1: // 草稿
						return '<span class="grid-command btn-send">派发</span>&nbsp;<span class="grid-command btn-show">详情</span>';
					default:
						return '<span class="grid-command btn-show">详情</span>';
					}
				}
			}
		];
		
		//  数据库取出路局管理数据	
		store = new Store({
			url : contextPath + "dispatchRootAction/getAddListByDTO.cn",
			pageSize : pageSize,
			proxy : {
				method : 'post',
				dataType : 'json',
			}
		});
			
		/*表格设置*/
		grid = new GB({
			render : '#grid',
			width : '100%',//如果表格使用百分比，这个属性一定要设置
			columns : columns,
			idField : 'a',
			perId : perId,
			contextPath:contextPath,
			itemStatusFields : {
				magenta : 'caogao', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
				darkOrange : 'daijieshou',
				red : 'chulizhong',
				blue : 'yiguidang'
			},
			tbar : {
				items : [{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-plus"></i>新增',
	                  listeners : {
	                    'click' : function(){
	                    	addDialog = addDialogCreate();
	                    	addDialog.show();
	                    	addDialog.get('loader').load();
	                    }
	                  }
	                },{
	                	xclass : 'bar-item-separator' // 竖线分隔符
	                },{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-edit"></i>修改',
	                  listeners : { 'click' : function(){
	                	  var selections = grid.getSelection();
						  if(selections.length == 1){
							  if(selections[0].status == 1 || selections[0].status == 3){
								recordSelected = selections[0];
								editDialog = editDialogCreate(recordSelected.id);
								editDialog.show();
								editDialog.get('loader').load();
							}else{
								commonFailure('请选择【草稿】和【待接受】状态进行操作！');
							}
						  }
						  else{
								commonFailure('请选择一条数据进行操作！');
						  }
	                    }
	                  }
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
	                btnCls : 'button button-small',
	                  text : '<i class="icon-remove"></i>批量删除',
	                  listeners : {
	                    'click' : function(){
	                    	var selections = grid.getSelection();
							if(selections.length != 0){
								var bool = true; //设置是否存在状态为处理中和已归档(默认存在)
								for(var i=0;i<selections.length;i++){
									var statusa = selections[i].status; //取出状态
									if(statusa == 4 || statusa == 8 ){
										commonFailure('请选择【草稿】和【待接受】状态进行操作！');
										bool = false; //改为不存在
										break; //跳出后面循环
									}
								}
								if(bool){
									deleteData(selections);
								}
							}else{
								commonFailure("请选择要删除的数据！");
								return ;
							}
	                    }
	                  }
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-download"></i>导出EXCEL',
	                  listeners : {
	                    'click' : function(){
	                    	exportData();
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
	                },{
						xclass : 'bar-item-text',
						text : errorMsgHtml + sucMsgHtml
				}]
			},
			bbar : {pagingBar : true},
			plugins : [
			           Grid.Plugins.CheckSelection, //多选框插件
			           Grid.Plugins.RowNumber //列序号插件
			           ],
			store : store
		});

		grid.render();
		readyInit();
		// 按钮事件
		grid.on("itemclick",function(e){
			var target = $(e.domTarget);
			//console.log(target);
			var id = e.item.id;
			// 派发
			if(target.hasClass('btn-send')){
				// 首先生成遮罩层,防止多次点击
// 				var MLM = new MyLoadMask({
// 					contextPath : contextPath,
// 					el : 'body'
// 				});
// 				MLM.show();
				var BLM = new BodyLoadMask({
					contextPath : contextPath,
					el : 'div .bui-grid'
				});
				BLM.show();
				$.ajax({
					url : contextPath + "dispatchRootAction/sendDispatchRoot.cn",
					type : "post",
					data : {
						id : id
					},
					success : function(data,status){
						if(status){
// 							MLM.hide(); 
// 							setTimeout(function() {
// 										BLM.hide();
// 									}, 10000);
							BLM.hide(); 
							commonSuccess("派发成功！");
						}else{
							commonFailure("派发失败！");
						}
						store.load();
					}
				});
				return false;
			};
			// 详情
			if(target.hasClass('btn-show')){
				showDialog = showDialogCreate(id);
	      		showDialog.show();
	    		showDialog.get('loader').load();
			}
		});
		
		//声明对象
		function UploadFileDto(name,path){
			this.name = name;
			this.path = path;
		}
		
		// 新增时，上传文件
		function addUpload(){
			var arr = new Array(); //声明数组,存储数据发往后台
			//获取上传文件的对列
			var fileArray = uploader.get("queue").getItems();
		 	for(var i in fileArray){
		    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
				arr[i] = dto; // 向集合添加对象
			};
		 	return arr;
		}
		
		//添加记录
       function addDialogCreate(){
    	   addDialog = new Overlay.Dialog({
    		   title : '添加调度命令',
   			   width : 660,
   			   height : 459,
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
   				buttons : [{
					text : '新增并派发',
					elCls : 'button btn-save-send',
					handler : function() {
						if(!addForm.isValid()) {
							return ;
						}
						/****************** 获取上传文件信息开始 ******************/
						var arr = addUpload();
						/****************** 获取上传文件信息结束 ******************/
						var acceptUser = addAcceptUserStore.getResult();
						if(acceptUser.length <= 0){
							tooltip("请新增受理人！");
							$(".bui-ext-mask").addClass("userMask");
							return ;
						}
						var copyUser = addCopyUserStore.getResult();
						// 执行提交到数据库的方法
						$.ajax({
							url : contextPath + "dispatchRootAction/addAndSendDispatchRoot.cn",
							type : "post",
							data:{
								"id" : $("#addForm #numberId").val(),
								"number" : $("#addForm #number").val(),
								"nowTime" : $("#addForm #nowTime").val(),
								"organizations" : $("#addForm #organizations").val(),
								"dispatchUser" : $("#addForm #dispatchUser").val(),
								"acceptUser" : JSON.stringify(acceptUser),
								"copyUser" : JSON.stringify(copyUser),
								"content" : $("#addForm #content").val(),
								"issueUser" : $("#addForm #issueUser").val(),
								"deadLine" : $("#addForm #deadLine").val(),
								"uploadFileArr" : JSON.stringify(arr)
							},
							success : function(data,status){
								if(status){
									commonSuccess("新增并派发成功！");
								}else{
									commonFailure("新增并派发失败！");
								}
								store.load();
							}
						});
						dialogClose(addDialog);
					}
				},{
					text : '保存',
					elCls : 'button btn-save',
					handler :function(){
						if(!addForm.isValid()) {
							return ;
						}
						/****************** 获取上传文件信息开始 ******************/
						var arr = addUpload();
						/****************** 获取上传文件信息结束 ******************/
						var acceptUser = addAcceptUserStore.getResult();
						if(acceptUser.length <= 0){
							tooltip("请新增受理人！");
							$(".bui-ext-mask").addClass("userMask");
							return ;
						}
						var copyUser = addCopyUserStore.getResult();
						// 执行提交到数据库的方法
						$.ajax({
							url : contextPath + "dispatchRootAction/addDispatchRoot.cn",
							type : "post",
							data:{
								"number" : $("#addForm #number").val(),
								"nowTime" : $("#addForm #nowTime").val(),
								"organizations" : $("#addForm #organizations").val(),
								"dispatchUser" : $("#addForm #dispatchUser").val(),
								"acceptUser" : JSON.stringify(acceptUser),
								"copyUser" : JSON.stringify(copyUser),
								"content" : $("#addForm #content").val(),
								"issueUser" : $("#addForm #issueUser").val(),
								"deadLine" : $("#addForm #deadLine").val(),
								"uploadFileArr" : JSON.stringify(arr)
							},
							success : function(data,status){
								if(status){
									commonSuccess("新增成功！");
								}else{
									commonFailure("新增失败！");
								}
								store.load();
							}
						});
						dialogClose(addDialog);
					}
				}, {
					text : '关闭',
					elCls : 'button btn-close',
					handler : function() {
						//取消正在上传的文件
 						var uploaders = uploader.get("queue").getItems();
 						for(var i in uploaders){
 							uploader.cancel(uploaders[i]);
 						}
						dialogClose(addDialog);
					}
			}],
			loader : {
				url : contextPath + 'views/dispathRoot/dispathRootAdd.jsp',//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
    	   	
    	   });
    	   return addDialog;
		}
		
		// 修改时，上传文件
		function updateUpload(){
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
			return arr;
		}
		
		//修改记录
       function editDialogCreate(id){
			editDialog = new Overlay.Dialog({
				title : "修改调度命令",
				width : 650,
				height : 454,
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
					text : '修改并派发',
					elCls : 'button btn-save-send',
					handler : function() {
						if(!editForm.isValid()) {
							return ;
						}
						/****************** 获取上传文件信息开始 ******************/
						var arr = updateUpload();
						/****************** 获取上传文件信息结束 ******************/
						var acceptUser = editAcceptUserStore.getResult();
						if(acceptUser.length <= 0){
							tooltip("请新增受理人！");
							$(".bui-ext-mask").addClass("userMask");
							return ;
						}
						var copyUser = editCopyUserStore.getResult();
						// 执行提交到数据库的方法
						$.ajax({
							url : contextPath + "dispatchRootAction/updateAndSendDispatchRoot.cn",
							type : "post",
							data:{
								id : $("#editForm #numberId").val(),
								number : $("#editForm #number").val(),
								nowTime : $("#editForm #nowTime").val(),
								organizations : $("#editForm #organizations").val(),
								dispatchUser : $("#editForm #dispatchUser").val(),
								acceptUser : JSON.stringify(acceptUser),
								copyUser : JSON.stringify(copyUser),
								content : $("#editForm #content").val(),
								issueUser : $("#editForm #issueUser").val(),
								deadLine : $("#editForm #deadLine").val(),
								uploadFileArr : JSON.stringify(arr)
							},
							success : function(data,status){
								if(!data){
									commonSuccess("修改并派发成功！");
								}else{
									commonFailure("修改并派发失败！受理人已分派");
								}
								store.load();
							}
						});
						dialogClose(editDialog);
					}
				},{
					text : '保存',
					elCls : 'button btn-save',
					handler :function(){
						if(!editForm.isValid()) {
							return ;
						}
						/****************** 获取上传文件信息开始 ******************/
						var arr = updateUpload();
						/****************** 获取上传文件信息结束 ******************/
						var acceptUser = editAcceptUserStore.getResult();
						if(acceptUser.length <= 0){
							tooltip("请新增受理人！");
							$(".bui-ext-mask").addClass("userMask");
							return ;
						}
						var copyUser = editCopyUserStore.getResult();
						// 执行提交到数据库的方法
						$.ajax({
							url : contextPath + "dispatchRootAction/updateDispatchRoot.cn",
							type : "post",
							data:{
								id : $("#editForm #numberId").val(),
								number : $("#editForm #number").val(),
								nowTime : $("#editForm #nowTime").val(),
								organizations : $("#editForm #organizations").val(),
								dispatchUser : $("#editForm #dispatchUser").val(),
								acceptUser : JSON.stringify(acceptUser),
								copyUser : JSON.stringify(copyUser),
								content : $("#editForm #content").val(),
								issueUser : $("#editForm #issueUser").val(),
								deadLine : $("#editForm #deadLine").val(),
								uploadFileArr : JSON.stringify(arr)
							},
							success : function(data,status){
								if(!data){
									commonSuccess("修改成功！");
								}else{
									commonFailure("修改失败！受理人已分派");
								}
								store.load();
							}
						});
						dialogClose(editDialog);
						}
					}, {
						text : '关闭',
						elCls : 'button btn-close',
						handler : function() {
							//取消正在上传的文件
	  						var uploaders = uploader.get("queue").getItems();
	  						for(var i in uploaders){
	  							uploader.cancel(uploaders[i]);
	  						}
							dialogClose(editDialog);
					}
				}],
				loader : {
					url : contextPath + 'views/dispathRoot/dispathRootUpdate.jsp?id=' + id,//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return editDialog;
		}
		
    // 变更执行人变更记录
	function receiveUserDialogCreate(id){
		receiveUserDialog = new Overlay.Dialog({
			title : '变更执行人',
			width : 650,
			height : 470,
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
				var receiveUser = editAcceptUserStore.getResult();//获取接收人信息
				if(receiveUser.length <= 0){
					tooltip("请新增受理人！");
					$(".bui-ext-mask").addClass("userMask");
						return ;
					}
					//提交数据至服务端
					$.post(contextPath + 'dispatchRootAction/updateSelectUsers.cn',
							{
								id : id,
								receiveUser : JSON.stringify(receiveUser),
								organizations : $('#receiveUserForm #organizations').val(),
							},function(data,status){
								if(status){
									if(data.status=='2'){// 失败
										commonFailure("变更执行人派发失败！");
										return;
									}
									if(data.status=='3'){// 受理人没有变化
										tooltip(data.msg);
										$(".bui-ext-mask").addClass("userMask");
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
				url : contextPath + 'views/dispathRoot/dispathRootReceiveUser.jsp?id='+id,
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
		});
		return receiveUserDialog;
	}
			
		//详细信息记录
       function showDialogCreate(id){
    	   showDialog = new Overlay.Dialog({
				title : "查看详细信息",
				width : 650,
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
	   					elCls : 'button btn-show',
						handler : function() {
							var selections = showGrid.getSelected();
							if(selections) {
								showChildDialog = showChildDialogCreate(selections.id);
								showChildDialog.show();
								showChildDialog.get('loader').load();
								
								// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
								$(".bui-ext-mask").addClass("userMask");
							}else{
								tooltip("请选择子任务进行查看！");
								$(".bui-ext-mask").addClass("userMask");
							}
						}
		   			},{
		   				text : '回复附件打包下载',
	   					elCls : 'button btn-down',
						handler : function() {
							getReplyFileDown(id);
							$(".bui-ext-mask").addClass("userMask");
							//dialogClose(showDialog);
						}
 					},{
 						text : '关闭',
   						elCls : 'button btn-close',
						handler : function() {
							dialogClose(showDialog);
					}
   				}],
				loader : {
					url : contextPath + 'views/dispathRoot/dispathRootShow.jsp?id=' + id,//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return showDialog;
		}
		
		function showChildDialogCreate(id){
    	    showChildDialog = new Overlay.Dialog({
   			title : '子调度命令详情',
   			width : 650,
   			height : 310,
   			zIndex : '1111',
   			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
   			mask : true,//非模态弹出框
   			bodyStyle : {padding : 0},
   			listeners : {
   				closing : function(){//关闭窗口时刷新列表
   					// 去除一级弹出框遮罩层
   					$(".bui-ext-mask").removeClass("userMask");
   				}
   			},
   			buttons : [],
   			loader : {
   				url : contextPath + 'views/dispathRoot/dispathRootToDoShow.jsp?id=' + id,//弹出框加载的JSP页面
   				autoLoad : false,//不在弹出框组件初始化时自动加裁
   				lazyLoad : false,//不进行延迟加裁
   				dataType : 'html'//加载内容类型
   			}
   		});
   		return showChildDialog;
   	}
		//导出本页数据
		function exportData(){
			// 导出本页数据
			var records = store.getResult();	
 			var json = '[';
			for(var i = 0 ; i < records.length ; i++){
				var row = records[i];
				json += '{'
					+'"dispatchNum":'+'"'+row.dispatchNum+'",'
					+'"dispatchUser":'+'"'+row.dispatchUser+'",'
					+'"sendDate":'+'"'+Grid.Format.datetimeRenderer(row.sendDate)+'",'
					+'"deadLine":'+'"'+Grid.Format.datetimeRenderer(row.deadLine)+'",'
					+'"sendUser":'+'"'+(row.sendUser == null ? "" : row.sendUser.name)+'",'
					+'"status":'+'"'+dispathRoot_status.statusName(Number(row.status))+'"'
					+'},';
			}
			json = json.substring(0, json.length - 1);
			json += ']';
			$("#exportXlsJson").val(json);
			if(json != ']'){
				$("#exportForm").submit();
			}else{
				commonFailure("导出失败！");
			}
		}
			
        //删除
    	function deleteData(selections) {
    		var msg = '您确定要删除数据吗?<br/>';
    		BUI.Message.Confirm(msg,function(){
    			var ids = "";
    			for(var i = 0;i < selections.length;i++){
    				ids = ids + "," + selections[i].id;
    			}
    			// 删除操作
    			$.ajax({
					url : contextPath + "dispatchRootAction/deleteDispatchRoot.cn",
					type : "post",
					data:{
						jsonIds : ids.substring(1, ids.length)
					},
					success : function(data,status){
						if(status){
							commonSuccess("删除成功！");
						}else{
							commonFailure("删除失败！");
						}
						store.load();
					}
    			});
    		},
    		'question');
    	}
        
		// 弹出框提示
		function tooltip(msg){
			var msg = msg;
			BUI.Message.Show({
				msg : msg,
				closeable : false,
				buttons : [
      	            {
      	              text : '确定',
      	              elCls : 'button',
      	              handler : function(){
      	            	$(".bui-ext-mask").removeClass("userMask");
   						this.close();
   					}
      	        }]
      	    });
      	}
		
		// 获取回复附件打包
		function getReplyFileDown(id){
			$.ajax({
				url : contextPath + "dispatchZipFileAction/dispatchFilesToZip.cn",
				type : "post",
				data:{
					parentId : id
				},
				success : function(data,status){
					if(data == "0"){
						tooltip("无附件下载！");
					}else{
						replyFileDown(data);
						$(".bui-ext-mask").removeClass("userMask");
					}
				},
				dataType:"text"
				
			});
		}
		
		// 回复附件打包下载
		function replyFileDown(url){
			var time = $('#fileDownTime').val();
			window.location.href = '/kunmingrinms/DownloadFileServlet?fileName=调令回复附件_'+time+'.zip&filePath='+url;
		}
		
		
        /**
    	 * 关闭弹出框并解除引用
    	 * param:d 待关闭的弹出框
    	 */
    	function dialogClose(d){
    		d.close();
    		d = null;
    	}
	/*BUI结束*/	
	//console.log(store.__attrVals.data);
	});
</script>
</body>
</html>