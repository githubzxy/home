<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String contextPath = request.getContextPath();
	String timeNow = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>创建任务</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
	.bui-stdmod-body{
		overflow-x: hidden;
		overflow-y: auto;
	}
	.userMask {
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
	 .bui-grid-row-daiShenHe{
	    color : #458B74;
	 }
	 .bui-grid-row-shenHeTongGuo{
	    color: #00a100;
	 }
	 .bui-grid-row-shenHeBuTongGuo{
	    color: #5e5e00;
	 }
	.bui-grid-row-daiJieShou{
	    color: #333333;
	 }
	 .bui-grid-row-chuLiZhong{
	    color: #ff0099;
	 }
	 .bui-grid-row-yiGuiDang{
	    color: #0000FF;
	 }
	.x-grid-rownumber{
 		color:black;/* 序号，全为黑色 */
 	}
</style>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询<span id="toggleSearch" class="x-icon icon-chevron-down"></span></legend>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">任务标题:</label>
					<div class="controls">
						<input type="text" id="title" class="input-normal" style="width: 171px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">任务类别:</label>
					<div class="controls" >
						<select id="taskType" style="width: 181px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">紧急程度:</label>
					<div class="controls" >
						<select id="taskLevel" style="width: 181px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">任务状态:</label>
					<div class="controls" >
						<select id="status" style="width: 181px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">派发时间：</label>
					<div class="controls" >
						<input type="text" id="startTime" class="calendar"
						 style="width: 170px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">至：</label>
					<div class="controls" >
						<input type="text" id="endTime" class="calendar"
						 style="width: 170px;" />
					</div>
				</div>
				<div style="float:right;margin-right: 100px">
					<button type="button" id="btnSearch" class="button button-primary">查询</button>
				</div>
			</div>
		</fieldset>
	</form>
	<div class="search-grid-container">
		<fieldset>
			<legend>列表</legend>
			<div id="miniSquareSpace">
				<span class="miniSquare"  style="background-color: #FF00FF"></span>草稿
				<%-- <span class="miniSquare"  style="background-color: #458B74"></span>待审核 --%>
				<%-- <span class="miniSquare"  style="background-color: #00a100"></span>审核通过 --%>
				<%-- <span class="miniSquare"  style="background-color: #5e5e00"></span>审核不通过 --%>
				<span class="miniSquare"  style="background-color: #333333"></span>待接收
				<span class="miniSquare"  style="background-color: #ff0099"></span>处理中
				<span class="miniSquare"  style="background-color: #0000FF"></span>已归档
			</div>
			<div id="grid"></div>
		</fieldset>
	</div>
	<form action="/kunmingrinms/taskRootAction/expTaskRoot.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
		<input type="hidden" value="创建任务" name="fileName">
	</form>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/taskManage/taskReplyFileDownLoad.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var timeNow='<%=timeNow%>';
	var perId = "<%=perId%>";
	
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	
	var store,grid;// 列表及数据源声明

	var addDialog;// 新增弹出框
	var editDialog;// 修改弹出框
	var checkDialog;//回复弹出框
	var detailDialog;// 详细信息弹出框
	var childDetailDialog;//子任务详细信息弹出框
	var recordSelected;//选中的一条记录
	var receiveUserDialog;// 变更执行人弹出框
	
	/**
	 * 查询栏点击触发收起和展开
	 */
	function hiddenSearch() {
		$('#searchForm .row').toggle('slow',function(){
			var searchHeight = $('#searchForm').height();
			if(searchHeight < 50){//TODO自己根据条件判断收起和展开的条件及具体高度（即下面的44那个值）
				grid.set('height',grid.get('height') + 44);
				$('#toggleSearch').removeClass('icon-chevron-down');
				$('#toggleSearch').addClass('icon-chevron-right');
			}else{
				$('#toggleSearch').removeClass('icon-chevron-right');
				$('#toggleSearch').addClass('icon-chevron-down');
				grid.set('height',grid.get('height') - 44);
			}
		});
	}
	
	//进行高度计算
	function readyInit(){
		var windownHeight = $(window).height();
		var searchHeight = $('#searchForm').height();
		grid.set('height',windownHeight - searchHeight-45);
		store.load({param : JSON.stringify(getParam())});
	}
	
	//初始化查询栏的下拉选
	function initSelection(){
		taskManage_taskType.listData("#taskType");
		taskManage_taskLevel.listData("#taskLevel");
		taskManage_status.listData("#status");
	}
	initSelection();//初始化查询栏的下拉选
	
	//获取查询条件参数
	function getParam(){
		return {
			title : $("#title").val().trim(),
			taskType : $("#taskType").val(),
			taskLevel : $("#taskLevel").val(),
			status : $("#status").val(),
			sendStartDate : $("#searchForm #startTime").val(),
			sendEndDate : $("#searchForm #endTime").val(),
		};
	}
	
	$("#btnSearch").click(function(){
		if(store){
			store.load({
				param : JSON.stringify(getParam()),
				start : pageNum, //从第一页开始
				pageSize : 10
			});
		}
	});
	BUI.use(["bui/grid","bui/data",'bui/calendar','bui/overlay','mod/GridBtn','common/bodyLoadMask/MyLoadMask'],
			function(Grid, Data, Calendar, Overlay, GB, MyLoadMask){
		
		//日历
		var datepickerStart = new Calendar.DatePicker({
			trigger : '#startTime',
// 			showTime : true,
			autoRender : true
		});
		var datepickerEnd = new Calendar.DatePicker({
			trigger : '#endTime',
// 			showTime : true,
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
	  	
		/*表格列设置*/
		var columns = [{
				title:'任务标题',
				dataIndex:'title',
				elCls : 'center',
				width:'35%'
			},{
				title:'紧急程度',
				dataIndex:'taskLevel',
				elCls : 'center',
				width:'12%',
				renderer:function(value){
					return taskManage_taskLevel.typeName(value);
				}
			},{
				title:'任务类别',
				dataIndex:'taskType',
				elCls : 'center',
				width:'12%',
				renderer:function(value){
					return taskManage_taskType.typeName(value);
				}
			},{
				title:'派发时间',
				dataIndex:'sendDate',
				width:'75px',
				elCls : 'center',
// 				renderer: Grid.Format.datetimeRenderer
			},{
				title:'完成期限',
				dataIndex:'limitTime',
				width:'75px',
				elCls : 'center',
				renderer : function(value){
					return value!=null?value:"";
				}
// 				renderer: Grid.Format.datetimeRenderer
			},{
				title:'联系人',
				dataIndex:'linkman',
				elCls : 'center',
				width:'15%',
				renderer : function(value){
					return value.name;
				}
			},{
				title:'状态',
				dataIndex:'status',
				elCls : 'center',
				width:'10%',
				renderer:function(value){
					return taskManage_status.typeName(value);
				}
			},{
				title:'操作',
				dataIndex:'status',
				elCls : 'center',
				width:'120px',
				renderer:function(value){
					if(value==taskManage_status.caoGao){//草稿数据显示 送审、派发、详情
						return '<span class="grid-command sendCheck-Btn">送审</span>'+'&nbsp;'
								+ '<span class="grid-command send-Btn">派发</span>'+'&nbsp;'
								+ '<span class="grid-command detail-Btn">详情</span>';
					}else if(value==taskManage_status.shenHeTongGuo){//审核通过的数据显示派发、详情
						return '<span class="grid-command send-Btn">派发</span>'+'&nbsp;'
						+ '<span class="grid-command detail-Btn">详情</span>';
					}else if(value==taskManage_status.shenHeBuTongGuo){//审核不通过 的数据显示 送审、详情
						return '<span class="grid-command sendCheck-Btn">送审</span>'+'&nbsp;'
						+ '<span class="grid-command detail-Btn">详情</span>';
					}else{
						 return '<span class="grid-command detail-Btn">详情</span>';
					}
					
				}
			}];
		
		store = new Data.Store({
			url : contextPath+'taskRootAction/getAddListByDto.cn',
			pageSize : 10,
			proxy : {
				method : 'post',
				dataType : 'json'
			}
		});
			
		/*表格设置*/
		grid = new GB({
			render : '#grid',
			perId : perId,
			contextPath : contextPath,
			width : '100%',//如果表格使用百分比，这个属性一定要设置
			columns : columns,
			idField : 'id',
			itemStatusFields : {
				caoGao : 'caoGao', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
				daiShenHe : 'daiShenHe',
				shenHeTongGuo : 'shenHeTongGuo',
				shenHeBuTongGuo : 'shenHeBuTongGuo',
				daiJieShou : 'daiJieShou',
				chuLiZhong : 'chuLiZhong',
				yiGuiDang : 'yiGuiDang',
			},
			tbar : {
				items : [{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-plus"></i>新增',
	                  listeners : { 'click' : function(){
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
							if(selections.length==1){
								recordSelected=selections[0];
								var status=recordSelected.status;
								if(status==taskManage_status.caoGao
										||status==taskManage_status.daiJieShou) {
//										||status==taskManage_status.shenHeTongGuo
//										||status==taskManage_status.shenHeBuTongGuo){//[草稿][待接收][审核通过][审核不通过]的数据才能进行此操作
									editDialog=editDialogCreate(recordSelected.id, status);
									editDialog.show();
									editDialog.get('loader').load();
								}else{
									commonFailure('可修改[草稿][待接收]的任务！');
								}
							}else{
								commonFailure('请选择一条数据进行操作！');
							}
	                    }
	                  }
	                },{
	                	xclass : 'bar-item-separator' // 竖线分隔符
	                },{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-remove"></i>批量删除',
	                  listeners : {'click' : function(){
	                    	var selections = grid.getSelection();
							if(selections.length!=0){
								var ids = "";
								for(var i in selections){
		                    		recordSelected=selections[i];
		                    		var status=recordSelected.status;
		                    		if(status==taskManage_status.caoGao
		                    			||status==taskManage_status.daiJieShou
		                    			||status==taskManage_status.daiShenHe
		                    			||status==taskManage_status.shenHeTongGuo
		                    			||status==taskManage_status.shenHeBuTongGuo){//[草稿][待接收][待审核][审核通过][审核不通过]的数据才能进行此操作
		                    			
		                    			ids += recordSelected.id+',';
		                    		}else{
		                    			commonFailure('可删除[草稿][待接收][待审核][审核通过][审核不通过]的数据！');
		                    			return;
		                    		}
		                    	}
								ids=ids.substring(0,ids.length-1);
								deleteData(ids);
							}else{
								commonFailure("请选择要删除的数据！");
							}
	                    }
	                  }
	                },{
	                	xclass : 'bar-item-separator' // 竖线分隔符
	                },{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-download"></i>导出EXCEL',
	                  listeners : {'click' : function(){
		          			var records = store.getResult();
							if(!records||records.length<=0){
								commonFailure('无数据可以导出！');
								return;
							}
	                	    exportXls(records);
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
								var status=recordSelected.status;
								if(status==taskManage_status.daiShenHe
										||status==taskManage_status.shenHeTongGuo
										||status==taskManage_status.shenHeBuTongGuo){
									commonFailure('只能操作[草稿][待接收][处理中][已归档]的数据');
								}else{
									receiveUserDialog = receiveUserDialogCreate(recordSelected.id, status);
									receiveUserDialog.show();
									receiveUserDialog.get('loader').load();
								}
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
			plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber],
			store : store
		});
		grid.render();
		
		readyInit();
		
		grid.on('cellclick',function  (ev) {
			var record = ev.record;//点击行的记录
			var target = $(ev.domTarget); //点击的元素
			if(target.hasClass('sendCheck-Btn')){
//				checkDialog=checkDialogCreate(record.id);
//				checkDialog.show();
//				checkDialog.get('loader').load();
			}
			if(target.hasClass('send-Btn')){
				sendData(record.id);
			}
			if(target.hasClass('detail-Btn')){
			  detailDialog=showDetailDialogCreate(record.id, record.status);
           	  detailDialog.show();
           	  detailDialog.get('loader').load();
			}
	    });
		
		
		 //声明对象
		function UploadFileDto(name,path){
			this.name = name;
			this.path = path;
		}
		
		//获取上传文件数据(上传的)
		 function getUploadFileData(){
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
    		   title : '新建任务',
   			   width : 650,
   			   height : 470,
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
					text : '派发',
					elCls : 'button btn-send',
					handler :function(){
						if(!addForm.isValid()) {//表单验证
							return ;
						}
						
						var arr=getUploadFileData();//获取上传文件信息
// 						console.log(arr);
						var receiveUser=addReceiveStore.getResult();//获取接收人信息
// 						console.log(receiveUser);
						if(receiveUser.length <= 0){
							tooltip("请添加接收人！");
							$(".bui-ext-mask").addClass("userMask");
							return ;
						}
						var carbonCopyUser=addCopyStore.getResult();//获取抄送人信息
// 						console.log(carbonCopyUser);
						var param=getParamAdd();//获取其他表单数据
// 						console.log(param);
						//提交数据至服务端
						$.post(contextPath + 'taskRootAction/addAndSendTaskRoot.cn',
								{
									param : JSON.stringify(param),
									receiveUser : JSON.stringify(receiveUser),
									carbonCopyUser : JSON.stringify(carbonCopyUser),
									uploadFileArr : JSON.stringify(arr)
								},function(data,status){
									if(status){
										commonSuccess("新增并派发成功！");
									}else{
										commonFailure("新增并派发失败！");
									}
									dialogClose(addDialog);
								},'json');
						
					}
				},{
					text : '保存',
					elCls : 'button btn-save',
					handler :function(){
						if(!addForm.isValid()) {//表单验证
							return ;
						}
						
						var arr=getUploadFileData();//获取上传文件信息
// 						console.log(arr);
						var receiveUser=addReceiveStore.getResult();//获取接收人信息
// 						console.log(receiveUser);
						if(receiveUser.length <= 0){
							tooltip("请添加接收人！");
							$(".bui-ext-mask").addClass("userMask");
							return ;
						}
						var carbonCopyUser=addCopyStore.getResult();//获取抄送人信息
// 						console.log(carbonCopyUser);
						var param=getParamAdd();//获取其他表单数据
// 						console.log(param);
						
						//提交数据至服务端
						$.post(contextPath + 'taskRootAction/addTaskRoot.cn',
								{
									param : JSON.stringify(param),
									receiveUser : JSON.stringify(receiveUser),
									carbonCopyUser : JSON.stringify(carbonCopyUser),
									uploadFileArr : JSON.stringify(arr)
								},function(data,status){
									if(status){
										commonSuccess("新增并保存成功！");
									}else{
										commonFailure("新增并保存失败！");
									}
									dialogClose(addDialog);
								},'json');
					}
				}, {
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(addDialog);
				}
			}],
			loader : {
				url : contextPath + 'views/taskManage/taskAdd.jsp',
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
    	   	
    	   });
    	   return addDialog;
		}
    
		//获取已有及新上传的文件
		function getNewAndOldUploadFileData(){
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
       function editDialogCreate(id, status){
			editDialog = new Overlay.Dialog({
				title : '修改任务',
				width : 650,
	   			height : 470,
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
					text : '派发',
					elCls : 'button btn-send',
					handler :function(){
						if(!editForm.isValid()) {//表单验证
							return ;
						}
						
						var arr=getNewAndOldUploadFileData();//获取上传文件信息(已上传+新上传的)
						var receiveUser=editReceiveStore.getResult();//获取接收人信息
						if(receiveUser.length <= 0){
							tooltip("请添加接收人！");
							$(".bui-ext-mask").addClass("userMask");
							return ;
						}
						var carbonCopyUser=editCopyStore.getResult();//获取抄送人信息
						var param=getParamAdd();//获取表单其他数据
						//提交数据至服务端
						$.post(contextPath + 'taskRootAction/updateAndSendTaskRoot.cn',
								{
									param : JSON.stringify(param),
									receiveUser : JSON.stringify(receiveUser),
									carbonCopyUser : JSON.stringify(carbonCopyUser),
									uploadFileArr : JSON.stringify(arr)
								},function(data,status){
									if(status){
										if(data.status=='2'){
											tooltip(data.msg);
											$(".bui-ext-mask").addClass("userMask");
											return;
										}
										commonSuccess("修改并派发成功！");
									}else{
										commonFailure("修改并派发失败！");
									}
									dialogClose(editDialog);
								},'json');
						
					}
				},{
					text : '保存',
					elCls : 'button btn-save',
					handler :function(){
						if(!editForm.isValid()) {//表单验证
							return ;
						}
						var arr=getNewAndOldUploadFileData();//获取上传文件信息(已上传+新上传的)
						var receiveUser=editReceiveStore.getResult();//获取接收人信息
						if(receiveUser.length <= 0){
							tooltip("请添加接收人！");
							$(".bui-ext-mask").addClass("userMask");
							return ;
						}
						var carbonCopyUser=editCopyStore.getResult();//获取抄送人信息
						var param=getParamAdd();//获取其他表单数据
						//提交数据至服务端
						updateEditData(param, receiveUser, carbonCopyUser, arr);
					}
				}, {
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(editDialog);
				}
			}],
			loader : {
				url : contextPath +  'views/taskManage/taskEdit.jsp?id='+id,
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
    	   	
		});
		return editDialog;
	}
		
	function updateEditData(param, receiveUser, carbonCopyUser, arr){
		$.post(contextPath + 'taskRootAction/updateTaskRoot.cn',
				{
					param : JSON.stringify(param),
					receiveUser : JSON.stringify(receiveUser),
					carbonCopyUser : JSON.stringify(carbonCopyUser),
					uploadFileArr : JSON.stringify(arr)
				},function(data,status){
					if(status){
						if(data.status=='2'){
							tooltip(data.msg);
							$(".bui-ext-mask").addClass("userMask");
							return;
						}
						commonSuccess("修改并保存成功！");
					}else{
						commonFailure("修改并保存失败！");
					}
					dialogClose(editDialog);
				},'json');
	}	
	
	// 变更执行人变更记录
    function receiveUserDialogCreate(id, status){
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
					var receiveUser = editReceiveStore.getResult();//获取接收人信息
					if(receiveUser.length <= 0){
						tooltip("请添加接收人！");
						$(".bui-ext-mask").addClass("userMask");
						return ;
					}
					//提交数据至服务端
					$.post(contextPath + 'taskRootAction/updateReceiveUser.cn',
							{
								id : id,
								receiveUser : JSON.stringify(receiveUser),
							},function(data,status){
								if(status){
									if(data.status=='2'){
										tooltip(data.msg);
										$(".bui-ext-mask").addClass("userMask");
										return;
									}
									if(data.status=='3'){
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
				url : contextPath +  'views/taskManage/taskReceiveUser.jsp?id='+id,
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
 	   	
		});
		return receiveUserDialog;
	}
	
     	//发送审核-弹出框
       function checkDialogCreate(id){
    	   checkDialog = new Overlay.Dialog({
    		   title : '发送审核',
   			   width : 580,
   			   height : 96,
   			   closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
   			   mask : true,//非模态弹出框
   			   bodyStyle : {padding : 0},
   			   listeners : {
   				   closing : function(){//关闭窗口时刷新列表
   				      store.load();
   				   }
   			   },
   				buttons : [ {
					text : '送审',
					elCls : 'button btn-check',
					handler :function(){
						if(!checkForm.isValid()) {	// 表单验证
							return ;
						}
						//审核接收人id
						var receiveUserId=$("#checkReceiveUser").val();
						if(!receiveUserId){
							tooltip("请选择人员！");
							$(".bui-ext-mask").addClass("userMask");
							return;
						}
						$.post(contextPath + 'taskRootAction/sendToCheck.cn', 
							{
								id:id,
								receiveUserId : receiveUserId
							},function(result,status){
								if(status){//提示成功
			 						commonSuccess('发送审核成功！');
								}else{
									commonFailure("发送审核失败！");
								}
								dialogClose(checkDialog);//关闭弹出框
						});
					}
				}, {
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						this.close();
				}
			}],
			loader : {
				url : contextPath + 'views/taskManage/taskSendToCheck.jsp',
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
    	   	
    	   });
    	   return checkDialog;
		}
		
		//详情按钮弹出框-详细信息记录
       function showDetailDialogCreate(id, taskStatus){
    	   detailDialog = new Overlay.Dialog({
				title : '任务详细信息',
				width : 660,
				height : 440,
				closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
	   			mask : true,//非模态弹出框
	   			bodyStyle : {padding : 0},
	   			listeners : {
	   				   closing : function(){//关闭窗口时刷新列表
	   						$(".bui-ext-mask").removeClass("userMask");
	   				      	store.load();
	   				   }
	   			   },
	   			buttons : [{
   					text : '查看',
   					elCls : 'button btn-show',
					handler : function() {
						var selection = childrenDetailGrid.getSelected();
						if(selection) {
							childDetailDialog = showChildDetailDialogCreate(selection.id);
							childDetailDialog.show();
							childDetailDialog.get('loader').load();
							//将遮罩层的z-index加大到1100，用以遮罩一级弹出框
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
						taskReplyFileDownload(id, timeNow);
						$(".bui-ext-mask").addClass("userMask");
					}
					},{
						text : '关闭',
  						elCls : 'button btn-close',
					handler : function() {
						dialogClose(detailDialog);
				}
  				}],
				loader : {
					url : contextPath + 'views/taskManage/taskDetail.jsp?id='+id+'&taskStatus='+taskStatus,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return detailDialog;
		}
		
	    	 //子任务回复详情弹出框
	       function showChildDetailDialogCreate(id){
	    	   childDetailDialog = new Overlay.Dialog({
					title : '子任务回复详情',
					zIndex : '1300',
					width : 660,
					height : 273,
					closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
		   			mask : true,//非模态弹出框
		   			bodyStyle : {padding : 0},
		   			listeners : {
		   				   closing : function(){//关闭窗口时刷新列表
		   					  $(".bui-ext-mask").removeClass("userMask");
		   				   }
		   			   },
		   			buttons : [],
					loader : {
						url : contextPath + 'views/taskManage/childTaskDetail.jsp?id='+id,
						autoLoad : false,//不在弹出框组件初始化时自动加裁
						lazyLoad : false,//不进行延迟加裁
						dataType : 'html'//加载内容类型
					}
		    	   	
				});
				return childDetailDialog;
			}		
		
			
		//派发
       function sendData(id){
	    	// 首先生成遮罩层,防止多次点击
			var MLM = new MyLoadMask({
				contextPath : contextPath,
				el : 'body'
			});
			MLM.show();
    	  $.post(contextPath + 'taskRootAction/sendTaskRoot.cn', 
			{id: id},
  		   	function(result,status){
				if(status){
					MLM.hide();
					commonSuccess('派发成功！');
				}else{
					commonFailure("派发失败！");
				}
				store.load();
			});
       }	
		
        //删除
    	function deleteData(ids) {
    		var msg = '您确定要删除选中的数据吗?<br/>';
    		BUI.Message.Confirm(msg,function(){
    			$.post(contextPath + 'taskRootAction/deleteTaskRootByIds.cn', { ids: ids},function(result,status){
    				if(status){
						commonSuccess('删除成功！');
					}else{
						commonFailure("删除失败！");
					}
    				store.load();
    			});
    		},'question');
    	}
        
    	//导出本页数据
		function exportXls(records){
			$("#exportXlsJson").val("");//清空值
			
			var json = '[';
			for(var i = 0 ; i < records.length ; i++){
				var row = records[i];
				json += '{'
					+'"title":'+'"'+row.title+'",'
					+'"taskLevel":'+'"'+taskManage_taskLevel.typeName(row.taskLevel)+'",'
					+'"taskType":'+'"'+taskManage_taskType.typeName(row.taskType)+'",'
					+'"sendDate":'+'"'+Grid.Format.datetimeRenderer(row.sendDate)+'",'
					+'"limitTime":'+'"'+Grid.Format.datetimeRenderer(row.limitTime)+'",'
					+'"linkman":'+'"'+row.linkman.name+'",'
					+'"status":'+'"'+taskManage_status.typeName(row.status)+'"'
					+'},';
			}
			json = json.substring(0, json.length - 1);
			json += ']';
// 			console.log(json);
			$("#exportXlsJson").val(json);
			$("#exportForm").submit();
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
      	            	$(".bui-ext-mask").removeClass("userMask");
   						this.close();
   					}
      	        }]
      	    });
      	}

        // 关闭弹出框并解除引用
    	function dialogClose(d){
    		d.close();
    		d = null;
    	}
	/*BUI结束*/	
	});
</script>
</body>
</html>