<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待办调令</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/tableLayout.css" rel="stylesheet" />
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
	.bui-grid-row-darkOrange{
	    color: #333333;/* 橙色  待接收 */
	 }
	.bui-grid-row-Turquoise2{
	    color: #00C5CD; /* 蓝绿色  待回复*/
	 }
	.bui-grid-row-green{
	    color: #55BB00; /* 绿色 已回复*/
	 }
	 .bui-grid-row-blue{
	    color: #0000FF;/* 蓝色   已归档*/
	 }
	 .bui-grid-row-lavender{
	    color: #FF77FF;/* 淡紫色   已分派*/
	 }
	 .bui-grid-row-red{
	    color: #ff0099;/* 红色   处理中 */
	 }
	 .bui-grid-row-yiChaoQi{
	    color:red;
	    z-index: 1000 !important; 
 	 }
	.mask {
		z-index: 1100 !important;
	}
 	.maskFour { 
 		z-index: 1150 !important; 
 	}
 	#grid .bui-grid-row{
 		height: 29px;
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
						<%--TODO bug修改时写死，后期优化--%>
						<select name="status" id="status" style="width: 180px;">
							<option value="">请选择</option>
							<option value="3">待接收</option>
							<option value="5">已接收（待回复）</option>
							<option value="6">已回复</option>
							<option value="8">已归档</option>
							<option value="7">已分派</option>
							<option value="4">处理中</option>

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
					<button type="button" id="btnSearch" class="button button-primary">查询</button>
				</div>
			</div>
		</fieldset>
	</form>
	<div class="search-grid-container">
		<fieldset>
			<legend>列表</legend>
			<div id="miniSquareSpace">
				<span class="miniSquare"  style="background-color: red"></span>已超期
				<span class="miniSquare" style="background-color: #333333"></span>待接收
				<span class="miniSquare" style="background-color: #00C5CD"></span>已接收（待回复）
				<%--<span class="miniSquare" style="background-color: #00C5CD"></span>待回复--%>
				<span class="miniSquare" style="background-color: #55BB00"></span>已回复
				<span class="miniSquare" style="background-color: #0000FF"></span>已归档
				<span class="miniSquare" style="background-color: #FF77FF"></span>已分派
				<span class="miniSquare" style="background-color: #ff0099"></span>处理中
			</div>
			<div id = "grid"></div>
		</fieldset>
	</div>
	
	<form action="/kunmingrinms/dispatchRootAction/expDispatchBacklog.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
	
	<input type="hidden" id="acceptOrgId" value="${sessionScope.user.organization.id }" />
	
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var perId = "<%=perId%>";
	var orgId='${sessionScope.user.organization.id }';
    var orgName='${sessionScope.user.organization.name }';
	
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	var pageSize = 10;//每页显示条数
	
	var store,grid;// 列表及数据源声明

	var disposeDialog;// 处理信息弹出框
	var showDialog;// 详细信息弹出框
	var replyDialog;// 回复弹出框
	var assignDialog;// 分派弹出框
	
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
		// initDateType();
	}
	
	// function initDateType() {// 调令状态
	// 	dispathBacklog_status.listData("#searchForm #status");
	// }
	
	function searchData() {//初始化页面方法
		pageNum = store.get("start");
		if(store){
			store.load({
				number : $("#searchForm #number").val(),
				status : $("#searchForm #status").val(),
				startTime : $("#searchForm #startTime").val(),
				endTime : $("#searchForm #endTime").val(),
				overTimeStatus:$("#searchForm #overTimeStatus").val(),
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
				overTimeStatus:$("#searchForm #overTimeStatus").val(),
				start : pageNum //从第一页开始
			});
		}
	}
	
	$("#btnSearch").click(function(){
		searchBtnClick();
		return false;
	});
	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','mod/GridBtn','common/multiSelectUser/MultiSelectUserTool'],
			function(Grid,Data,Calendar, Form,Overlay,GB,MultiSelectUserTool){
		var alert = BUI.Message.Alert;//使用bui的消息提示框
		
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
				title:'发令单位',
				dataIndex:'parentDispath',
				width:'15%',
				elCls : 'center',
				renderer: function(value) {
					return value == null ? "" : value.sendUser.organization.name;
				}
			},
			{
				title:'发令人',
				dataIndex:'parentDispath',
				width:'15%',
				elCls : 'center',
				renderer: function(value) {
					return value == null ? "" : value.sendUser.name;
				}
			},
			{
				title:'发令时间',
				dataIndex:'parentDispath',
				width:'75px',
				elCls : 'center',
				renderer: function(value) {
					return value == null ? "" : value.sendDate;
				}
			},
			{
				title:'完成期限',
				dataIndex:'root',
				width:'75px',
				elCls : 'center',
				renderer: function(value) {
					return value == null ? "" : value.deadLine;
				}
			},
			{
				title:'状态',
				dataIndex:'status',
				width:'10%',
				elCls : 'center',
				renderer: function(value) {
					return dispathBacklog_status.statusName(Number(value));
				}
			},
			{
				title:'操作',
				dataIndex:'status',
				width:'30%',
				elCls : 'center',
				renderer : function(value) {
					if(value=='3'){//待接收 3
						 return '<span class="grid-command btn-receive" >接收</span>&nbsp;'+
//                 		'<span class="grid-command btn-turn">转派</span>&nbsp;'+ 
                		'<span class="grid-command btn-show">详情</span>'; 
                	}
// 					else if(value=='3.5'){
//                 		return  '<span class="grid-command btn-reply">回复</span>&nbsp;'+
//                 		'<span class="grid-command btn-assign">分派</span>&nbsp;'+ 
// //                 		'<span class="grid-command btn-turn">转派</span>&nbsp;'+ 
//                 		'<span class="grid-command btn-show">详情</span>';
//                 	}
                	else if(value=='5'){
                		return '<span class="grid-command btn-reply">回复</span>&nbsp;'+
                		'<span class="grid-command btn-assign">分派</span>&nbsp;'+
//                 		'<span class="grid-command btn-turn">转派</span>&nbsp;'+ 
                		'<span class="grid-command btn-show">详情</span>';
                	}else if(value=='6'){//已回复6
                		return '<span class="grid-command btn-show">详情</span>';
                	}else if(value=='7'){//已分派7
                		return'<span class="grid-command btn-assign">分派</span>&nbsp;'+
//                 		'<span class="grid-command btn-turn">转派</span>&nbsp;'+ 
                		'<span class="grid-command btn-show">详情</span>';
                	}else if(value=='4'){//处理中 4
                		return '<span class="grid-command btn-show">详情</span>';
//                 		return '<span class="grid-command btn-turn">转派</span>&nbsp;'+ 
//                 		'<span class="grid-command btn-show">详情</span>';
                	} else{
                    	 return '<span class="grid-command btn-show">详情</span>';
                	} 
				}
			}
		];
		
		//  数据库取出路局管理数据	
		store = new Store({
			url : contextPath + "dispatchRootAction/getDispathBacklog.cn",
			pageSize : pageSize,
			proxy : {
				method : 'post',
				dataType : 'json',
			}
		});
			
		/*表格设置*/
		grid = new GB({
			render : '#grid',
			perId : perId,
			contextPath : contextPath,
			width : '100%',//如果表格使用百分比，这个属性一定要设置
			columns : columns,
			idField : 'a',
			itemStatusFields : {
				darkOrange : 'daijieshou',
				Turquoise2 : 'daihuifu',
				green : 'yihuifu',
				blue : 'yiguidang',
				lavender : 'yifenpai',
				red : 'chulizhong',
				yiChaoQi: 'yiChaoQi'
			},
			tbar : {
				items : [{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-download"></i>导出EXCEL',
	                  listeners : {
	                    'click' : function(){
	                    	exportData();
	                    }
	                  }
	                },{
						xclass : 'bar-item-text',
						text : errorMsgHtml + sucMsgHtml
				}]
			},
			bbar : {pagingBar : true},
			plugins : [Grid.Plugins.RowNumber//列序号插件
						],
			store : store
		});

		grid.render();
		
		readyInit();
		
	     //声明对象
		function UploadFileDto(name,path){
			this.name = name;
			this.path = path;
		}
		
		// 按钮事件
		grid.on("itemclick",function(e){
			var target = $(e.domTarget);
			//console.log(target);
			var id = e.item.id;
         	var status =  e.item.status;
         	// 详情
			if(target.hasClass('btn-show')){
				showDialog = showDialogCreate(id,status);
	      		showDialog.show();
	    		showDialog.get('loader').load();
			}
         	
			/**
            * 修改：按钮放到主页面
            */
            if(target.hasClass('btn-reply')){ //回复
            	replyDialog = replyDialogCreate(id);
				replyDialog.show();
				replyDialog.get('loader').load();
				
				// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
				$(".bui-ext-mask").addClass("mask");
            }
            if(target.hasClass('btn-receive')){ //接收
            	$.post(contextPath + "dispatchRootAction/receive.cn",{id:id},function(item){},'json');
            	commonSuccess("接收成功！");
            	store.load();
            }
			if(target.hasClass('btn-assign')){ //分派
				$.post(contextPath + "dispatchRootAction/drAssignBefore.cn",
						{
							id : id
						},function(item){
							var status = item.status;
							if(status == "7"){
								showCommonFailure("受理人已分派！不能再进行分派");
							}else{
								assignDialog = assignDialogCreate(id);
								assignDialog.show();
								assignDialog.get('loader').load();
								
								// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
								$(".bui-ext-mask").addClass("mask");
							}
						},
					'json');
			}
			if(target.hasClass('btn-turn')){ //转派
				var multiSelectUserTool = new MultiSelectUserTool({
            		//待转派的命令id（通过该id获取父命令id，
            		//通过父命令id获取所有该父命令的子命令，
            		//子命令中有个owner属性表示的命令所属用户，
            		//通过这个属性过滤掉下拉选中已经拥有子命令的用户）
            		id : id,
            		orgId : orgId,
            		orgName : orgName,
            		contextPath : contextPath+"dispatchRootAction/getSelectUsersByOrgId.cn"
            	});
            	multiSelectUserTool.show();
            	multiSelectUserTool.on('sureBtn',function(e){
            		var receiveUserId = $("#user").val();//接收人id
                    if(!receiveUserId){
                    	tooltip("接收人不能为空");
                        $(".bui-ext-mask").addClass("maskFour");
                        return ;
                    }
                    $.post(contextPath + 'dispatchRootAction/turnToSendMultiUser.cn',
                            {
                                id : id,
                                receiveUserId : receiveUserId
                            },function(data,status){
                                if(status){
                                    commonSuccess("转派成功！");
                                }else{
                                    commonFailure("转派失败！");
                                }
                                readyInit();
                            }, 'json');
    				multiSelectUserTool.close();// 关闭转派弹框
    			});
			}
        	
         	
		});
		
		// 详情显示页面
		function showDialogCreate(id,status){
			var titleName = "";
			if(status == 3){
				titleName = "待接收调度命令详情";
			}
			if(status == 4){
				titleName = "处理中调度命令详情";
			}
			if(status == 5){
				titleName = "待回复调度命令详情";
			}
			if(status == 6){
				titleName = "已回复调度命令详情";
			}
			if(status == 8){
				titleName = "已归档调度命令详情";
			}
			if(status == 7){
				titleName = "已分派调度命令详情";
			}
			showDialog = new Overlay.Dialog({
				title : titleName,
				width : 680,
				height : 450,
				closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
	   			mask : true,//非模态弹出框
	   			bodyStyle : {padding : 0},
	   			listeners : {
	   				closing : function(){//关闭窗口时刷新列表
	   				   store.load();
	   			    }
	   			},
	   			buttons : [],
				loader : {
					url : contextPath + 'views/dispathRoot/dispathRootBacklogShow.jsp?id=' + id + '&status=' + status,//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return showDialog;
		}
	     
		
		// 回复操作
		function replyDialogCreate(id){
			replyDialog = new Overlay.Dialog({
    		   title : '调令回复',
   			   width : 420,
   			   height : 230,
			   zIndex : '1111',
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
  				   		// 去除一级弹出框遮罩层
  	   					$(".bui-ext-mask").removeClass("mask");
   				   }
   			   },
   				buttons : [{
					text : '回复',
					elCls : 'button btn-reply',
					handler : function() {
						if(!replyForm.isValid()) {
							return ;
						}
						/****************** 获取上传文件信息开始 ******************/
						var arr = new Array(); //声明数组,存储数据发往后台
						//获取上传文件的对列
						var fileArray = uploader.get("queue").getItems();
					 	for(var i in fileArray){
					    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
							arr[i] = dto; // 向集合添加对象
						};
						/****************** 获取上传文件信息结束 ******************/
						// 执行提交到数据库的方法
						$.ajax({
							url : contextPath + "dispatchRootAction/dispathRootReply.cn",
							type : "post",
							dataType :"json",
							data:{
								id : id,
								replyContent : $("#replyForm #replyContent").val(),
								uploadFileArr : JSON.stringify(arr)
							},
							success : function(status){
								if(status){
									commonSuccess("回复成功！");
								}else{
									commonFailure("回复失败,该命令已不存在！");
								}
								store.load();
							}
						});
						dialogClose(replyDialog);
					}
				},{
					text : '关闭',
					elCls : 'button btn-close',
					handler : function() {
						//取消正在上传的文件
 						var uploaders = uploader.get("queue").getItems();
 						for(var i in uploaders){
 							uploader.cancel(uploaders[i]);
 						}
						dialogClose(replyDialog);
					}
			}],
			loader : {
				url : contextPath + 'views/dispathRoot/dispathRootBacklogReply.jsp',//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
   			
    	   });
    	   return replyDialog;
		}
		
		// 分派操作
		function assignDialogCreate(id){
			assignDialog = new Overlay.Dialog({
    		   title : '调度命令分派',
   			   width : 650,
   			   height : 310,
			   zIndex : '1111',
	   		   closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
	   		   mask : true,//非模态弹出框
	   		   bodyStyle : {padding : 0},
   			   listeners : {
   				   closing : function(){//关闭窗口时刷新列表
  				   		// 去除一级弹出框遮罩层
  	   					$(".bui-ext-mask").removeClass("mask");
   				   }
   			   },
   				buttons : [{
					text : '派发',
					elCls : 'button btn-assign',
					handler : function() {
						var assignUser = assignStore.getResult();
						if(assignUser.length <= 0){
							tooltip("请选择分派执行人员！");
							$(".bui-ext-mask").addClass("maskFour");
							return ;
						}
						// 执行提交到数据库的方法
						$.ajax({
							url : contextPath + "dispatchRootAction/dispathRootAssign.cn",
							type : "post",
							dataType :"json",
							data:{
								id : id,
								assignUser : JSON.stringify(assignUser),
								assignContent : $("#assignForm #assignContent").val(),
							},
							success : function(status){
								if(status){
									commonSuccess("派发成功！");
								}else{
									commonFailure("派发失败,子命令已回复！");
								}
								store.load();
							}
						});
						dialogClose(assignDialog);
					}
				},{
					text : '关闭',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(assignDialog);
					}
			}],
			loader : {
				url : contextPath + 'views/dispathRoot/dispathRootBacklogAssign.jsp?id='+id,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
   			
    	   });
    	   return assignDialog;
		}
		
		//导出本页数据
		function exportData(){
			// 导出本页数据
			var records = store.getResult();	
 			var json = '[';
			for(var i = 0 ; i < records.length ; i++){
				var row = records[i];
				var deadLine = row.deadLine||row.root.deadLine;
				json += '{'
					+'"dispatchNum":'+'"'+row.dispatchNum+'",'
					+'"organization":'+'"'+row.parentDispath.sendUser.organization.name+'",'
					+'"sendUser":'+'"'+row.parentDispath.sendUser.name+'",'
					+'"sendDate":'+'"'+Grid.Format.datetimeRenderer(row.parentDispath.sendDate)+'",'
					+'"deadLine":'+'"'+Grid.Format.datetimeRenderer(deadLine)+'",'
					+'"status":'+'"'+dispathBacklog_status.statusName(Number(row.status))+'"'
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
      	            	$(".bui-ext-mask").removeClass("maskFour");
   						this.close();
   					}
      	        }]
      	    });
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