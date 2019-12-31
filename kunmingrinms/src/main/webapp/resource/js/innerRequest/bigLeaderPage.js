
var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页

/**
 * 初始化界面
 */
function readyInit(){
	//进行高度计算
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	grid.set('height',windownHeight - searchHeight - 45);
	// 设置操作状态的值
	getInnerRequestStatusOptions('requestStatus',
			[
			 WORKSHOP_REPORT,
			 WORKSHOP_APPLY_RETURN,
			 WORKSHOP_UNCONFIRM,
			 WORKSHOP_CONFIRM,
			 WORKSHOP_FINISH,
			 MANAGER_RETURN,
			 MANAGER_FORWARD,
			 BIG_LEADER_NO_APPROVAL,
			 BIG_LEADER_RETURN,
			 BIG_LEADER_AGREE
			 ]);
	initEmergencyLVCbo('emergencyLV','search');
	initProblemNatureCbo('problemNature','search');
	searchData();
};
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

var store;//数据源声明
var grid;//列表声明
/**
 * 关闭弹出框并解除引用
 * param:d 待关闭的弹出框
 */
function dialogClose(d){
	d.close();
	d = null;
}

function searchData(){//查询方法，重新加载列表数据源TODO自己定义查询参数
	pageNum = store.get("start");
	if(store){
		store.load({
			start : pageNum ,//从第一页开始
			title : $("#title").val(),
			emergencyLV : $("#emergencyLV").val(),
			problemNature:$("#problemNature").val(),
			status:$("#requestStatus").val()
		});
	}
}

function searchBtnClick(){//查询方法，重新加载列表数据源TODO自己定义查询参数
	if(store){
		store.load({
			start : 0 ,//从第一页开始
			title : $("#title").val(),
			emergencyLV : $("#emergencyLV").val(),
			problemNature:$("#problemNature").val(),
			status:$("#requestStatus").val()
		});
	}
}

var forwardDialog;//转派弹出框
var handleDialog;//处理弹出框
var infoDialog;//详情弹出框

BUI.use([ 'bui/grid', 'bui/data', 'bui/overlay','mod/GridBtn', 'bui/mask' ],
		function(Grid, Data, Overlay,GB) {
	//创建处理弹出框
	function handleDialogCreate(selectedId){
			handleDialog = new Overlay.Dialog({
			title : '段长（书记）处理',
			width : 685,
			height : 550,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭窗口时刷新列表
					store.load();
				}
			},
			buttons : [ {
				text : '同意',
				elCls : 'button',
				handler : function(){
					// 表单验证
					if(!bigLeaderAuditFrom.isValid()) {
						// 将滚动条置底
						$('#bigLeaderAuditDiv').scrollTop( $('#bigLeaderAuditDiv')[0].scrollHeight );
						return ;
					}
					var innerRequestId = bigLeaderMain.id;
					var bigLeaderReplyOpinion = $("#bigLeader_bigLeaderReplyOpinion").val();
					$.post(contextPath + 'bigLeaderDealAction/bigLeaderAgree.cn', //发起POST AJAX请求到后台
							{//请求参数列表
								innerRequestId:innerRequestId,
								bigLeaderReplyOpinion:bigLeaderReplyOpinion
							},function(data,status){
								if(status){//显示成功信息，并在5秒后消失
									commonSuccess('段长（书记）同意！');
								}else{
									commonFailure();
								}
					});
					dialogClose(handleDialog);
					searchData();
				}
			}, {
				text : '不同意',
				elCls : 'button',
				handler : function() {
					var id = bigLeaderMain.id;
					dialogClose(handleDialog);
					bigLeaderReturn(id);
				}
			}
			],
			loader : {
				url : contextPath + 'views/innerRequest/bigLeaderAudit.jsp?selectedId='+selectedId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加载
				lazyLoad : false,//不进行延迟加载
				dataType : 'html'//加载内容类型
			}
		});
		return handleDialog;
	}
	/**
	 * 弹出处理框
	 */
	function addHandleDialog(selectedId){
		var handleDialog = handleDialogCreate(selectedId);
		handleDialog.show();
		handleDialog.get('loader').load();
	}
	//创建详情框
	function infoDialogCreate(selectedId){
			infoDialog = new Overlay.Dialog({
			title : '请示详情',
			width : 685,
			height : 500,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
			mask : true,//模态弹出框
			bodyStyle : {padding : 0},
			listeners : {
				closing : function(){//关闭审批窗口时刷新列表
					searchData();
				}
			},
			buttons : [ {
				text : '导出word',
				elCls : 'button',
				handler :function(){
					exportWord(selectedId);
				}
				}, {
					text : '关闭',
					elCls : 'button',
					handler : function() {
						dialogClose(infoDialog);
				}
				}],
			loader : {
				url : contextPath + 'views/innerRequest/innerRequestShow.jsp?selectedId='+selectedId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加载
				lazyLoad : false,//不进行延迟加载
				dataType : 'html'//加载内容类型
			}
		});
		return infoDialog;
	}
	
	//段长回退
	function bigLeaderReturn(id) {
		var msg = '<p>不同意原因：</p><textarea  id="bigLeaderReturnReason" style = "width:400px;height:200px"></textarea>';
		BUI.Message.Confirm(msg,
		function(){
			var bigLeaderReturnReason = $('#bigLeaderReturnReason').val();
			if(bigLeaderReturnReason.length>250){
				alert("不同意原因过长，请重新输入！");
				return;
			}
			$.post(
					contextPath + "bigLeaderDealAction/bigLeaderDisagree.cn",	
					{
						innerRequestId:id,
						bigLeaderReturnReason:bigLeaderReturnReason
					},
					function(data,status){
						if(status){//显示成功信息，并在5秒后消失
							commonSuccess('不同意回退成功！');
						}else{
							commonFailure();
						}
						store.load();
					}
			);
		},
		'question');
		$('#bigLeaderReturnReason').val("");
	}
	
	var columns = [ 
	               {
	            	   title : '标题',
	            	   dataIndex : 'title',
	            	   elCls : 'center',
	            	   width : '40%'
	               }, {
	            	   title : '车间上报时间',
	            	   dataIndex : 'workShopReportDate',
	            	   elCls : 'center',
	            	   width : '20%',
	            	   renderer : Grid.Format.dateRenderer
	               },{
	            	   title : '紧急程度',
	            	   dataIndex : 'emergencyLV',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer : function(value) {
	            		   return getNameByEmergencyLV(value);
	            	   }
	               }, {
	            	   title : '问题性质',
	            	   dataIndex : 'problemNature',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer : function(value) {
	            		   return getNameByProblemNature(value);
	            	   }
	               },{
	            	   title : '状态',
	            	   dataIndex : 'status',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer : function(value){
	            		   return getNameByStatus(value);
	            	   }
	               },{
	            	   title : '操作',
	            	   dataIndex : 'status',
	            	   elCls : 'center',
	            	   sortable : false,	// 表头不排序
	            	   width : '10%',
	            	   renderer:function(value) {
	            		   switch(value) {
	            		   case BIG_LEADER_NO_APPROVAL:
	            			   return '<span class="grid-command handleBtn">处理</span><span class="grid-command info">详情</span>';
	            		   default:
	            			   return '<span class="grid-command info">详情</span>';
	            		   }
	            	   }
	               }];

	/*
	 * 列表数据源声明
	 */
	store = new Data.Store({
		pageSize : 10,//每页数量
		url : contextPath + "bigLeaderDealAction/getBigLeaderData.cn",//TODO异步数据源请求
		proxy : {
			method : 'post'
		}
	});
	/*
	 * 列表声明
	 */
	grid = new GB(
			{
				render : '#grid',//实现在jsp中id为grid的div上
				idField : 'id',//对应数据模型中的id字段
				columns : columns,
				perId : perId,
				contextPath:contextPath,
				loadMask : true, // 加载数据时显示屏蔽层
				store : store,
				itemStatusFields : { // 设置数据跟状态的对应关系
					read : 'isOverTime' //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
				},
				width : '100%',
				height : '100%',
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [
				       //     Grid.Plugins.CheckSelection,//多选框插件
				            Grid.Plugins.RowNumber//列序号插件
				            ],
				            tbar : {//顶部工具栏
				            	items:[
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
		if(target.hasClass('handleBtn')) {
			// 处理（审批通过或审批部通过）
			addHandleDialog(record.id);
		}else if(target.hasClass('info')){
			 var infoDialog = infoDialogCreate(record.id);
			   infoDialog.show();
			   infoDialog.get('loader').load();
		}
	});
});