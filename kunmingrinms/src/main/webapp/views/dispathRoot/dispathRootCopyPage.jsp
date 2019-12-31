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
<title>调令抄送列表</title>
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
	 .bui-grid-row-yiChaoQi{
	    color:red;
	    z-index: 1000 !important; 
 	 }
	.userMask {
		z-index: 1100 !important;
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
	<input type="hidden" id="fileDownTime" value="${pageScope.now.year+1900}-${pageScope.now.month+1}-${pageScope.now.date}" />
	<div class="search-grid-container">
		<fieldset>
			<legend>列表</legend>
			<div id="miniSquareSpace">
				<span class="miniSquare"  style="background-color: red"></span>已超期
				<span class="miniSquare" style="background-color: #FF00FF"></span>草稿
				<span class="miniSquare" style="background-color: #333333"></span>待接收
				<span class="miniSquare" style="background-color: #ff0099"></span>处理中
				<span class="miniSquare" style="background-color: #0000FF"></span>已归档
			</div>
			<div id="grid"></div>
		</fieldset>
	</div>
	
	<form action="/kunmingrinms/dispatchRootAction/expDispatchRootCopy.cn" id="exportForm" method="post">
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

	var showDialog;// 详细信息弹出框
	var showChildDialog;// 子调令详细信息弹出框
	
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
	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,GB){
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
						return '<span class="grid-command btn-show">详情</span>';
				}
			}
		];
		
		//  数据库取出路局管理数据	
		store = new Store({
			url : contextPath + "dispatchRootAction/getDispatchRootCopyList.cn",
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
			perId : perId,
			contextPath:contextPath,
			idField : 'a',
			itemStatusFields : {
				magenta : 'caogao', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
				darkOrange : 'daijieshou',
				red : 'chulizhong',
				blue : 'yiguidang',
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
			plugins : [
		            	Grid.Plugins.RowNumber//列序号插件
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
			// 详情
			if(target.hasClass('btn-show')){
				showDialog = showDialogCreate(id);
	      		showDialog.show();
	    		showDialog.get('loader').load();
			}
		});
		
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