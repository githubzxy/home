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
<title>工单审核</title>
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

	 .bui-grid-row-daiShenHe{
	    color : #458B74;
	 }
	 .bui-grid-row-shenHeTongGuo{
	    color: #00a100;
	 }
	 .bui-grid-row-shenHeBuTongGuo{
	    color: #5e5e00;
	 }
	 .x-grid-rownumber{
 		color:black;/* 序号，全为黑色 */
 	}
 	#grid .bui-grid-row{
 		height: 29px;
 	}
</style>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">工单主题:</label>
					<div class="controls">
						<input type="text" id="title" class="input-normal" style="width: 171px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">工单类型:</label>
					<div class="controls" >
						<select id="taskType" style="width: 181px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">工单状态:</label>
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
				<span class="miniSquare"  style="background-color: #458B74"></span>待审核
				<span class="miniSquare"  style="background-color: #00a100"></span>审核通过
				<span class="miniSquare"  style="background-color: #5e5e00"></span>审核不通过
			</div>
			<div id="grid"></div>
		</fieldset>
	</div>
	<form action="/kunmingrinms/circuitWOAction/expCircuitWO.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
		<input type="hidden" value="工单审核" name="fileName">
	</form>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>

<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var perId = "<%=perId%>";
	
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	
	var store,grid;// 列表及数据源声明

	var handleDialog;
	
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
		
		initSelection();//初始化查询栏的下拉选
		store.load({param : JSON.stringify(getParam())});
		
	}
	
	//初始化查询栏的下拉选
	function initSelection(){
		taskManage_orderType.listData("#taskType");
		taskManage_status.listData_check("#status");
	}
	
	
	//获取查询条件参数
	function getParam(){
		return {
			overtimeStatus : $("#overtimeStatus").val(),
			title : $("#title").val().trim(),
			taskType : $("#taskType").val(),
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
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select','mod/GridBtn'],function(Grid,Data,Calendar, Form,Overlay,Select,GB){
	  	
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
				title:'工单主题',
				dataIndex:'root',
				elCls : 'center',
				width:'35%',
				renderer : function(value){
					return value.title;
				}
			},{
				title:'工单类型',
				dataIndex:'root',
				elCls : 'center',
				width:'12%',
				renderer:function(value){
					return taskManage_orderType.typeName(value.taskType);
				}
			},{
				title:'派发时间',
				dataIndex:'sendDate',
				width:'75px',
				elCls : 'center',
				renderer: Grid.Format.datetimeRenderer
			},{
				title:'完成期限',
				dataIndex:'root',
				width:'75px',
				elCls : 'center',
				renderer : function(value){
					return value.limitTime;
				}
			},{
				title:'联系人',
				dataIndex:'root',
				elCls : 'center',
				width:'15%',
				renderer : function(value){
					return value.linkman.name;
				}
			},{
				title:'状态',
				dataIndex:'status',
				elCls : 'center',
				width:'15%',
				renderer:function(value){
					return taskManage_status.typeName(value);
				}
			},{
				title:'操作',
				dataIndex:'status',
				elCls : 'center',
				width:'10%',
				renderer:function(value){
					if(value==taskManage_status.daiShenHe){
						return '<span class="grid-command handleBtn">处理</span>';
					}else{
						return '<span class="grid-command handleBtn">详情</span>';
					}
					 
				}
			}];
		
		store = new Data.Store({
			url : contextPath+'circuitWOAction/getCheckByDTO.cn',
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
				daiShenHe : 'daiShenHe',
				shenHeTongGuo : 'shenHeTongGuo',
				shenHeBuTongGuo : 'shenHeBuTongGuo'
			},
			tbar : {
				items : [{
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
						xclass : 'bar-item-text',
						text : errorMsgHtml + sucMsgHtml
				}]
			},
			bbar : {pagingBar : true},
			plugins : [Grid.Plugins.RowNumber],
			store : store
		});
		grid.render();
		
		readyInit();
		
		grid.on('cellclick',function  (ev) {
			var record = ev.record;//点击行的记录
			var target = $(ev.domTarget); //点击的元素
			if(target.hasClass('handleBtn')){
				handleDialog=handleDialogCreate(record.id, record.status);
				handleDialog.show();
				handleDialog.get('loader').load();
			}
	    });
		
		
		function handleDialogCreate(id,taskStatus){
	    	   handleDialog = new Overlay.Dialog({
					title : '任务处理',
					width : 660,
					height : 330,
					closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
		   			mask : true,//非模态弹出框
		   			bodyStyle : {padding : 0},
		   			listeners : {
	   				  	 closing : function(){//关闭窗口时刷新列表
	   				      	store.load();
	   				   	}
		   			 },
		   			buttons : [{
	   					text : '审核通过',
	   					elCls : 'button btn-handleToDo btn-checkPass',
						handler : function() {
							var handleStatus=taskManage_status.shenHeTongGuo;
							checkDialog=checkDialogCreate(id,handleStatus);
							checkDialog.show();
							checkDialog.get('loader').load();
							 //遮罩层z-index提高至1080
							 $(".bui-ext-mask").addClass("dialogMask");
						}
		   			},{
	   					text : '审核不通过',
	   					elCls : 'button btn-handleToDo btn-checkNotPass',
						handler : function() {
							var handleStatus=taskManage_status.shenHeBuTongGuo;
							checkDialog=checkDialogCreate(id,handleStatus);
							checkDialog.show();
							checkDialog.get('loader').load();
							 //遮罩层z-index提高至1080
							 $(".bui-ext-mask").addClass("dialogMask");
						}
		   			},{
						text : '关闭',
						elCls : 'button btn-handleToDo btn-close',
						handler : function() {
							dialogClose(handleDialog);
					}
				}],
					loader : {
						url : contextPath + 'views/circuitWOManage/circuitWOCheck/circuitWOCheckDetail.jsp?id='+id+'&taskStatus='+taskStatus,
						autoLoad : false,//不在弹出框组件初始化时自动加裁
						lazyLoad : false,//不进行延迟加裁
						dataType : 'html'//加载内容类型
					}
		    	   	
				});
	    	   
				return handleDialog;
			}
		
		//审核弹出框
		function checkDialogCreate(id,handleStatus){
			checkDialog = new Overlay.Dialog({
				title : '任务审核',
				width : 620,
				height : 158,
				zIndex : '1090',
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
	  						$(".bui-ext-mask").removeClass("dialogMask");
	   				     	store.load();
	   				   }
	   			  },
	   			buttons : [ {
					text : '推送审核',
					elCls : 'button btn-reply',
					handler :function(){
						if(handleStatus==taskManage_status.shenHeBuTongGuo&&!checkForm.isValid()) {//审核不通过，才验证表单文本框
							return ;
						}
						//获取回复参数
						var arr=getUploadFileData();//获取上传文件信息
						if(handleStatus==taskManage_status.shenHeTongGuo&&arr.length<=0){//审核通过，才验证审核附件
							tooltip('审核附件不能为空！');
							$(".bui-ext-mask").addClass("userMask");
							return;
						}
						var checkMsg=$("#checkMsg").val();//审核意见
// 						console.log(arr);
// 						console.log(checkMsg);
						//提交后台
						$.post(contextPath + 'circuitWOAction/checkCircuitWO.cn',
						{
							id : id,
							checkFileArr : JSON.stringify(arr),
							checkMsg : checkMsg,
							status : handleStatus
						},function(data,status){
							if(status){
								commonSuccess("推送审核成功！");
								dialogClose(checkDialog);
								dialogClose(handleDialog);
							}else{
								commonFailure("推送审核失败！");
							}
						}, 'json');
					  }
					}, {
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(checkDialog);
					}
				}],
				loader : {
					url : contextPath + 'views/circuitWOManage/circuitWOCheck/circuitWOCheck.jsp?handleStatus='+handleStatus,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
			});
			return checkDialog;
		}
		
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
		
		//导出本页数据
		function exportXls(records){
			$("#exportXlsJson").val("");//清空值
			
			var json = '[';
			for(var i = 0 ; i < records.length ; i++){
				var row = records[i];
				json += '{'
					+'"title":'+'"'+row.root.title+'",'
					+'"taskType":'+'"'+taskManage_orderType.typeName(row.root.taskType)+'",'
					+'"sendDate":'+'"'+Grid.Format.datetimeRenderer(row.sendDate)+'",'
					+'"limitTime":'+'"'+Grid.Format.datetimeRenderer(row.root.limitTime)+'",'
					+'"linkman":'+'"'+row.root.linkman.name+'",'
					+'"status":'+'"'+taskManage_status.typeName(row.status)+'"'
					+'},';
			}
			json = json.substring(0, json.length - 1);
			json += ']';
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