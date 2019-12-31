
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

var store,grid;//列表及数据源声明
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

function searchBtnClick(){//查询按钮执行的方法，从第0条数据开始
	if(store){
		store.load({
			start : 0 ,//从第一页开始
			title : $("#title").val().trim(),
			emergencyLV : $("#emergencyLV").val(),
			problemNature:$("#problemNature").val(),
			status:$("#requestStatus").val()
		});
	}
}

var forwardDialog;//转派弹出框
var infoDialog;//详情弹出框
var managerReplyDialog;//回复弹出框

BUI.use([ 'bui/grid', 'bui/data', 'bui/overlay', 'mod/GridBtn','bui/mask'],
		function(Grid, Data, Overlay,GB) {
	/**
	 * 创建转发弹出框
	 */
	function forwardDialogCreate(selectedId){
			forwardDialog = new Overlay.Dialog({
			title : '转发责任部门',
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
				text : '转发',
				elCls : 'button',
				handler : function(){
					// 表单验证
					if(!replyForm.isValid()) {
						return ;
					}
					// 数据组装
					var showSegmentIds = $("#managerForward_dutyOrgVal").val();
					innerData.segmentReplyTerm = $("#managerForward_segmentReplyTerm").text();
					
					$.post(contextPath + 'managerDealAction/forwardSegment.cn', //发起POST AJAX请求到后台
							{//请求参数列表
								showSegmentIds : showSegmentIds,
								innerData : JSON.stringify(innerData)
							},function(data,status){
								if(status){//显示成功信息，并在5秒后消失
									commonSuccess('转发成功！');
								}else{
									commonFailure();
								}
								dialogClose(forwardDialog);
								searchData();
							});

				}
			}, {
				text : '关闭',
				elCls : 'button',
				handler : function() {
					dialogClose(forwardDialog);
				}
			}
			],
			loader : {
				url : contextPath + 'views/innerRequest/managerForward.jsp?selectedId='+selectedId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加载
				lazyLoad : false,//不进行延迟加载
				dataType : 'html'//加载内容类型
			}
		});
		return forwardDialog;
	}
	
	/**
	 * 创建回复弹出框
	 */
	function managerReplyDialogCreate(selectedId){
		managerReplyDialog = new Overlay.Dialog({
			title : '回复车间',
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
				text : '回复',
				elCls : 'button',
				handler : function(){
					// 数据组装
					var orgIds = $("#managerReply_confirmOrgVal").val();
					var mainId = managerReplyMain.id;
					$.post(contextPath + 'managerDealAction/managerReply.cn', //发起POST AJAX请求到后台
							{//请求参数列表
								orgIds:orgIds,
								mainId:mainId
							},function(data,status){
								if(status){//显示成功信息，并在5秒后消失
									commonSuccess('回复成功！');
								}else{
									commonFailure();
								}
							});
					dialogClose(managerReplyDialog);
					searchData();
				}
			}, {
				text : '关闭',
				elCls : 'button',
				handler : function() {
					dialogClose(managerReplyDialog);
				}
			}
			],
			loader : {
				url : contextPath + 'views/innerRequest/managerReply.jsp?selectedId='+selectedId,//弹出框加载的JSP页面
				autoLoad : false,//不在弹出框组件初始化时自动加载
				lazyLoad : false,//不进行延迟加载
				dataType : 'html'//加载内容类型
			}
		});
		return managerReplyDialog;
	}
	/**
	 * 弹出转发框
	 * @param selectedId
	 */
	function addForwardDialog(selectedId){
		var forwardDialog = forwardDialogCreate(selectedId);
		forwardDialog.show();
		forwardDialog.get('loader').load();
	}
	/**
	 * 弹出回复框
	 * @param selectedId
	 */
	function addManagerReplyDialog(selectedId){
		var managerReplyDialog = managerReplyDialogCreate(selectedId);
		managerReplyDialog.show();
		managerReplyDialog.get('loader').load();
	}
	//创建详情框
	function infoDialogCreate(selectedId){
			infoDialog = new Overlay.Dialog({
			title : '请示详情',
			width : 685,
			height : 539,
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
	/**
	 * 弹出回退确认提示框
	 * @param ids
	 */
	function addBackTipFrame(ids){
		BUI.Message.Confirm('确认要回退选择项目么？',function(){
			$.post(contextPath + 'managerDealAction/rollbackworkshop.cn',
					{
				ids :ids
					},function(data,status){
						if(status){//显示成功信息，并在5秒后消失
							commonSuccess('回退成功！');
						}else{
							commonFailure();
						}
						store.load();
					});												          
		},'question');
	}
	var columns = [ 
	               {
	            	   title : '标题',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '20%',
	            	   renderer : function(value) {
	            		   return value.title;
	            	   }
	               }, {
	            	   title : '车间上报时间',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '20%',
	            	   renderer : Grid.Format.dateRenderer,
	            	   renderer : function(value) {
	            		   return value.workShopReportDate;
	            	   }
	               },{
	            	   title : '紧急程度',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '8%',
	            	   renderer : function(value) {
	            		   return getNameByEmergencyLV(value.emergencyLV);
	            	   }
	               }, {
	            	   title : '问题性质',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '8%',
	            	   renderer : function(value) {
	            		   return getNameByProblemNature(value.problemNature);
	            	   }
	               },{
	            	   title : '状态',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer : function(value){
	            		   return getNameByStatus(value.status);
	            	   }
	               },{
	            	   title : '超时说明',
	            	   dataIndex : 'overTimeExplain',
	            	   elCls : 'left',
	            	   width : '13%'
	               },{
	             	   title : '回退原因',
	            	   dataIndex : 'showSegmentReturnReason',
	            	   elCls : 'left',
	            	   width : '13%'
	               },{
	            	   title : '操作',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   sortable : false,	// 表头不排序
	            	   width : '8%',
	            	   renderer:function(value) {
	            		   var status = value.status;
	            		   switch(status) {
	            		   case WORKSHOP_REPORT:
	            			   return '<span class="grid-command forwardBtn">转发</span><span class="grid-command info">详情</span>';
	            		   case BIG_LEADER_RETURN:
	            			   return '<span class="grid-command forwardBtn">转发</span><span class="grid-command info">详情</span>';
	            		   case BIG_LEADER_AGREE:
	            			   return '<span class="grid-command managerReplyBtn">回复</span><span class="grid-command info">详情</span>';
	            		   case MANAGER_FORWARD:
	            			   return '<span class="grid-command forwardBtn">再转发</span><span class="grid-command info">详情</span>';
	            		   case WORKSHOP_APPLY_RETURN:
	            			   return '<span class="grid-command returnBtn">回退</span><span class="grid-command info">详情</span>';
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
		params :{//请求参数
			status:$("#requestStatus").val()
		},
		url : contextPath + "managerDealAction/getInnerRequestBaseByManager.cn",//TODO异步数据源请求
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
				loadMask : true, // 加载数据时显示屏蔽层
				store : store,
				perId : perId,
				contextPath:contextPath,
				itemStatusFields : { // 设置数据跟状态的对应关系
					read : 'isOverTime'//如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
				},
				width : '100%',
				height : '100%',
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [
				            Grid.Plugins.CheckSelection,//多选框插件
				            Grid.Plugins.RowNumber//列序号插件
				            ],
				            tbar : {//顶部工具栏
				            	items:[
				            	       {
				            	    	   btnCls : 'button button-small',
				            	    	   text : '<i class="icon-arrow-left"></i>批量回退',
				            	    	   listeners : {
				            	    		   click : function(){
				            	    			   var selectedAll = grid.getSelection();
				            	    			   if(selectedAll.length == 0){
				            	    				   commonFailure("请至少选择一条记录进行回退");
				            	    				   return;
				            	    			   }
				            	    			   for(var i=0;i<selectedAll.length;i++){
				            	    				   if(selectedAll[i].innerRequestBase.status != WORKSHOP_APPLY_RETURN){
				            	    					   commonFailure("只能对【车间申请回退】的记录进行回退");
				            	    					   return ;
				            	    				   }
				            	    			   }
				            	    			   //将选中的id以英文逗号分隔拼接成字符串
				            	    			   var ids = "";
				            	    			   for(var c = 0; c < selectedAll.length;c++) {
				            	    				   var selectedObj = selectedAll[c];
				            	    				   var record = selectedObj.innerRequestBase;
				            	    				   ids += record.id + ",";
				            	    			   }
				            	    			   //弹出提示框确认回退，如果点击确认，则执行回调函数
				            	    			   addBackTipFrame(ids);
				            	    		   }
				            	    	   }
				            	       },
				            	       {
				            	    	   xclass : 'bar-item-separator'
				            	       },
				            	       {
				            	    	   btnCls : 'button button-small',
				            	    	   text : '<i class="icon-remove"></i>批量作废',
				            	    	   listeners : {
				            	    		   click : function() {
				            	    			   var selectedAll = grid.getSelection();
				            	    			   if(selectedAll.length == 0){
				            	    				   commonFailure("请选择要作废的记录");
				            	    				   return;
				            	    			   }
				            	    			   //将选中的id以英文逗号分隔拼接成字符串
				            	    			   var ids = "";
				            	    			   for(var c = 0; c < selectedAll.length;c++) {
				            	    				   var selectedObj = selectedAll[c];
				            	    				   var record = selectedObj.innerRequestBase;
				            	    				   //状态为完成的不科删除
				            	    					var status = record.status;
				            	    					if(status == WORKSHOP_FINISH){
				            	    						commonFailure('包含状态为【'+getNameByStatus(WORKSHOP_FINISH)+'】的请示！不可以作废！');
					            	    					return;
				            	    					}
				            	    				   ids += record.id + ',';
				            	    			   }
				            	    			   //弹出提示框确认作废，如果点击确认，则执行回调函数
				            	    			   BUI.Message.Confirm('确认要作废选择项目么？',function(){
				            	    				   $.post(contextPath + 'managerDealAction/deleteByIds.cn',
				            	    						   {
				            	    					   selectedIds :ids
				            	    						   },function(data,status){
				            	    							   if(status){//显示成功信息，并在5秒后消失
				            	    								   commonSuccess('作废成功！');
				            	    							   }else{
				            	    								   commonFailure();
				            	    							   }
				            	    							   store.load();
				            	    						   });							          
				            	    			   },'question');
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
	readyInit();
	// 添加单元格点击事件
	grid.on('cellclick',function(ev) {
		target = $(ev.domTarget);		//点击的元素
	   var selectedObj = ev.record;
	   var record = selectedObj.innerRequestBase;
		if(target.hasClass('returnBtn')) {
			addBackTipFrame(record.id+",");
		} else if(target.hasClass('forwardBtn')) {
			addForwardDialog(record.id);// 转发领导
		}else if(target.hasClass("managerReplyBtn")){
			addManagerReplyDialog(record.id);
		}else if(target.hasClass("info")){
		   var innerRequestBaseId = record.id;
		   var infoDialog = infoDialogCreate(innerRequestBaseId);
		   infoDialog.show();
		   infoDialog.get('loader').load();
		}
	});
});