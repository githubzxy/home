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
<title>退回电路工单管理</title>
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
	.dialogMask{
		z-index: 1080 !important;
	}
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
	
	  .bui-grid-row-yiTuiHui{
	    color: #68838B;
	 }
	 .x-grid-rownumber{
 		color:black;/* 序号，全为黑色 */
 	}
 	#grid .bui-grid-row{
 		height: 29px;
 	}
</style>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">工单标题:</label>
					<div class="controls">
						<input type="text" id="title" class="input-normal" style="width: 171px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">派发单位:</label>
					<div class="controls">
						<jsp:include page="/views/common_page/OrgAllInputTree.jsp" flush="true" >
							<jsp:param name="org"  value="sendOrg" />
							<jsp:param name="orgVal"  value="sendOrgVal" />
							<jsp:param name="actionURL"  value="organization/getSegmentByPid.cn" />
							<jsp:param name="width"  value="171px" />
							<jsp:param name="height"  value="18px" />
						</jsp:include>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">派发时间:</label>
					<div class="controls" >
						<input type="text" id="sendStartDate" class="calendar"  style="width:171px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">至:</label>
					<div class="controls" >
						<input type="text" id="sendEndDate" class="calendar"  style="width:171px;" />
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
				<span class="miniSquare"  style="background-color: #68838B"></span>已退回
			</div>
			<div id="grid"></div>
		</fieldset>
	</div>
	<form action="/kunmingrinms/toDoCircuitWOAction/expToDoCircuitWO.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
		<input type="hidden" value="退回工单管理" name="fileName">
	</form>
	

<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var perId = "<%=perId%>";
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	
	var store,grid;// 列表及数据源声明
	var yiTuiHuiDialog;//已退回弹出框
	var resendDialog;//重派（二级弹出框）
	
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
		$("#org").width(171);
		var windownHeight = $(window).height();
		var searchHeight = $('#searchForm').height();
		grid.set('height',windownHeight - searchHeight-45);
		store.load({param : JSON.stringify(getParam())});
	}
	
	//初始化查询栏的下拉选
	function initSelection(){
		taskManage_status.listData_toDo("#status");
	}
	initSelection();//初始化查询栏的下拉选
	
	//获取查询条件参数
	function getParam(){
		return {
			overtimeStatus : $("#overtimeStatus").val(),
			title : $("#title").val().trim(),
			orgId:$(orgValInputId).val(),//派发单位id
			sendStartDate : $("#sendStartDate").val(),
			sendEndDate : $("#sendEndDate").val()
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
	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select','mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,Select,GB){
		//日历
		var datepickerStart = new Calendar.DatePicker({
			trigger : '#sendStartDate',
// 			showTime : true,
			autoRender : true
		});
		var datepickerEnd = new Calendar.DatePicker({
			trigger : '#sendEndDate',
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
		
		//再次点击清空时间
// 		$('#sendStartDate').on('click',(function(){
// 			$('#sendStartDate').val("");
// 		}));
// 		$('#sendEndDate').on('click',(function(){
// 			$('#sendEndDate').val("");
// 		}));
		
	  	
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
				title:'派发单位',
				dataIndex:'root',
				elCls : 'center',
				width:'20%',
				renderer:function(value){
					return value.sendUser.organization.name;
				}
			},{
				title:'派发时间',
				dataIndex:'root',
				elCls : 'center',
				width:'75px',
				renderer:function(value){
					return value.sendDate;
				}
			},{
				title:'完成期限',
				dataIndex:'root',
				elCls : 'center',
				width:'75px',
				renderer:function(value){
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
				width:'10%',
				renderer:function(value){
					return taskManage_status.typeName(value);
				}
			},{
				title:'操作',
				dataIndex:'status',
				elCls : 'center',
				width:'10%',
				renderer:function(value){
					 return '<span class="grid-command handleBtn">处理</span>';
				}
			}];
		
		store = new Data.Store({
			url : contextPath+'circuitWOAction/getShowDtoOfBackCircuitWO.cn',
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
				yiTuiHui : 'yiTuiHui'
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
				 yiTuiHuiDialog=yiTuiHuiDialogCreate(record.id);
	        	 yiTuiHuiDialog.show();
	        	 yiTuiHuiDialog.get('loader').load();
			}
	    });
		
			//已退回状态弹出框
	       function yiTuiHuiDialogCreate(id){
	    	   yiTuiHuiDialog = new Overlay.Dialog({
					title : '退回工单处理',
					width : 660,
					height : 355,
					closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
		   			mask : true,//非模态弹出框
		   			bodyStyle : {padding : 0},
		   			listeners : {
		   				   closing : function(){//关闭窗口时刷新列表
		   				      	store.load();
		   				   }
		   			   },
		   			buttons : [{
		   				text : '重派',
	   					elCls : 'button btn-assign-daiJieShou',
						handler : function() {
							resendDialog=resendDialogCreate(id);
							resendDialog.show();
							resendDialog.get('loader').load();
							//添加遮罩层，z-index:1080
							$(".bui-ext-mask").addClass("dialogMask");
						}
					},{
		   				text : '删除',
	   					elCls : 'button btn-turn',
						handler : function() {
							deleteData(id);
							$(".bui-ext-mask").addClass("userMask");
							
						}
					},{
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(yiTuiHuiDialog);
					}
				}],
					loader : {
						url : contextPath + 'views/circuitWOManage/backCircuitWO/backCircuitWODetail.jsp?id='+id,
						autoLoad : false,//不在弹出框组件初始化时自动加裁
						lazyLoad : false,//不进行延迟加裁
						dataType : 'html'//加载内容类型
					}
		    	   	
				});
				return yiTuiHuiDialog;
			}
		
	     //重派工单（二级弹出框）
	       function resendDialogCreate(id){
	    	   resendDialog = new Overlay.Dialog({
					title : '工单重派',
					zIndex : '1090',
					width : 580,
					height : 96,
					closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
		   			mask : true,//非模态弹出框
		   			bodyStyle : {padding : 0},
		   			listeners : {
		   				   closing : function(){//关闭窗口时刷新列表
		   						$(".bui-ext-mask").removeClass("dialogMask");
		   				      	store.load();
		   				   }
		   			   },
		   			buttons : [{
		   				text : '派发',
	   					elCls : 'button btn-assign',
						handler : function() {
							if(!resendForm.isValid()) {	// 表单验证
								return ;
							}
							//重派接收人id
							var receiveUserId=$("#resendReceiveUser").val();
							
							$.post(contextPath + 'circuitWOAction/resendBackCircuitWO.cn',
									{
										id : id,
										receiveUserId : receiveUserId
									},function(data,status){
										if(status){
											commonSuccess("重派成功！");
											//关闭所有弹出框
											dialogClose(resendDialog);
											dialogClose(yiTuiHuiDialog);
										}else{
											commonFailure("重派失败！");
										}
									}, 'json');
						  }
						},{
							text : '取消',
							elCls : 'button btn-close',
							handler : function() {
								dialogClose(resendDialog);
							}
					}],
					loader : {
						url : contextPath + 'views/circuitWOManage/backCircuitWO/resendCircuitWO.jsp',
						autoLoad : false,//不在弹出框组件初始化时自动加裁
						lazyLoad : false,//不进行延迟加裁
						dataType : 'html'//加载内容类型
					}
		    	   	
				});
				return resendDialog;
			}
	     
	     //删除
    	function deleteData(ids) {
    		var msg = '您确定要删除该条工单吗?<br><span style="font-size:10px;">若该工单是最后一条子工单,则主工单的状态会自动变更为【草稿】或【已归档】</span>';
    		BUI.Message.Show({
				msg : msg,
				icon : 'question',
				closeable : false,
				buttons : [{
      	              text : '确定',
      	              elCls : 'button',
      	              handler : function(){
      	            	deleteByIds(id);
      	            	$(".bui-ext-mask").removeClass("userMask");
   						this.close();
   						dialogClose(yiTuiHuiDialog);
   					}
      	        },{
      	              text : '取消',
      	              elCls : 'button',
      	              handler : function(){
      	            	$(".bui-ext-mask").removeClass("userMask");
   						this.close();
   					}
      	        }]
      	    });
    	}
	     
	     function deleteByIds(id){
	    	 $.post(contextPath + 'circuitWOAction/delBackCircuitWO.cn', 
    			 {
					id: id
				},function(result,status){
	 				if(status){
							commonSuccess('删除成功！');
						}else{
							commonFailure("删除失败！");
					}
	 				store.load();
 				});
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
					+'"org":'+'"'+row.root.sendUser.organization.name+'",'
					+'"sendDate":'+'"'+Grid.Format.datetimeRenderer(row.root.sendDate)+'",'
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
        
    	
		// 提示弹出框
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