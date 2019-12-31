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

var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
function searchData(){//查询方法，重新加载列表数据源TODO自己定义查询参数
	pageNum = store.get("start");
	if(store){
		store.load({
			start : pageNum ,//从第一页开始
			title : $("#title").val().trim(),
			reportTimeStart : $("#reportTimeStart").val(),
			reportTimeEnd:$("#reportTimeEnd").val(),
			status:$("#requestStatus").val()
		});
	}
}
function searchBtnClick(){//查询方法，重新加载列表数据源TODO自己定义查询参数
	if(store){
		store.load({
			start : 0 ,//从第一页开始
			title : $("#title").val().trim(),
			reportTimeStart : $("#reportTimeStart").val(),
			reportTimeEnd:$("#reportTimeEnd").val(),
			status:$("#requestStatus").val()
		});
	}
}
BUI.use([ 'bui/grid', 'bui/data', 'bui/overlay','mod/GridBtn', 'bui/mask' ],
		function(Grid, Data, Overlay,GB) {
	//创建详情框
	function infoDialogCreate(selectedId){
		var infoDialog = new Overlay.Dialog({
			title : '请示详情',
			width : 685,
			height : 550,
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
	var columns = [ 
	               {
	            	   title : '请示状态',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer : function(value){
	            		   return getNameByStatus(value.status);
	            	   }
	               }, {
	            	   title : '上报日期',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer:function(value) {
	            		   return value.workShopReportDate == null ? "" : value.workShopReportDate;
	            	   }
	               },{
	            	   title : '上报部门',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer:function(value) {
	            		   return value.workShopReportUser == null ? "" : value.workShopReportUser.organization.name;
	            	   }
	               }, {
						title : '上报人',
						dataIndex : 'innerRequestBase',
						elCls : 'center',
						width : '10%',
						renderer:function(value) {
							if(value != null && value.workShopReportUser != null) {
								return value.workShopReportUser.name;
							}
							return "";
						}
	               },{
		           		title : '请示标题',
		        		dataIndex : 'innerRequestBase',
		        		elCls : 'center',//居中显示
		        		sortable : false,	// 表头不排序
		        		width : '15%',
		        		renderer:function(value) {
		        			return value == null ? "" : value.title;
		        		}
	               },{
	            	   title : '主管领导',
	            	   dataIndex : 'showLeader',
	            	   elCls : 'center',
	            	   sortable : false,	// 表头不排序
	            	   width : '10%',
	            	   renderer:function(value) {
		        			return value == null ? "" : formateTextArea(value);
		        		}
	               },{
	            	   title : '责任部门',
	            	   dataIndex : 'showSegments',
	            	   elCls : 'left',
	            	   width : '10%',
	            	   renderer:function(value) {
		        			return value == null ? "" : formateTextArea(value);
		        		}
	               },{
	            	   title : '答复期限',
	            	   dataIndex : 'innerRequestBase',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer:function(value) {
	            		   return value == null ? "" : value.segmentReplyTerm;
	            	   }
	               },{
	            	   title : '答复内容',
	            	   dataIndex : 'showSegmentReply',
	            	   elCls : 'left',
	            	   width : '20%',
	            	   renderer:function(value) {
	            		   return value == null ? "" : formateTextArea(value);
	            	   }
	               },{
	            	   title : '答复日期',
	            	   dataIndex : 'showSegmentReplyDate',
	            	   elCls : 'left',
	            	   width : '10%',
	            	   renderer:function(value) {
	            		   return value == null ? "" : formateTextArea(value);
	            	   }
	               },{
	            	   title : '责任人',
	            	   dataIndex : 'showSegmentDutyPerson',
	            	   elCls : 'left',
	            	   width : '10%',
	            	   renderer:function(value) {
	            		   return value == null ? "" : formateTextArea(value);
	            	   }
	               },{
	            	   title : '超时说明',
	            	   dataIndex : 'overTimeExplain',
	            	   elCls : 'center',
	            	   width : '10%',
	            	   renderer:function(value) {
	            		   return value == null ? "" : value;
	            	   }
	               },{
	            	   title : '车间确认',
	            	   dataIndex : 'confirmStr',
	            	   elCls : 'center',
	            	   width : '10%'
	               }];

	/*
	 * 列表数据源声明
	 */
	store = new Data.Store({
		pageSize : 10,//每页数量
		url : contextPath + "statisticalReportAction/getInnerRequestBaseReport.cn",//TODO异步数据源请求
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
				perId : perId,
				contextPath:contextPath,
				store : store,
//				height : '100%',
				width : '100%',
				itemStatusFields : { // 设置数据跟状态的对应关系
					read : 'isOverTime' //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
				},
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [ 
				           	Grid.Plugins.CheckSelection,//多选框插件
				            Grid.Plugins.RowNumber//列序号插件
				            ],
				            tbar : {//顶部工具栏
				            	items:[{
					                  btnCls : 'button button-small',
					                  text : '<i class="icon-remove"></i>强制删除',
					                  listeners : {
					                    'click' : function(){
					                    	var selections = grid.getSelection();
											if(selections.length != 0){
												deleteData();
											}else{
												BUI.Message.Alert(
			            	    						   '请选择要删除的数据',
			            	    				   'error');
												return ;
											}
					                    }
					                  }
					                },{
										xclass : 'bar-item-separator' // 竖线分隔符
									},
				            	       {
				            	    	   btnCls : 'button button-small',
				            	    	   text : '<i class="icon-list-alt"></i>详情',
				            	    	   listeners : {
				            	    		   click : function() {
				            	    			   var selected = grid.getSelection();
				            	    			   if(selected.length == 0){
				            	    				   BUI.Message.Alert(
				            	    						   '请选择一条记录查看',
				            	    				   'error');
				            	    				   return;
				            	    			   }
				            	    			   if(selected.length >1){
				            	    				   BUI.Message.Alert(
				            	    						   '只能选择一条记录查看',
				            	    				   'error');
				            	    				   return;
				            	    			   }
				            	    			   var infoDialog = infoDialogCreate(selected[0].innerRequestBase.id);
				            	    			   infoDialog.show();
				            	    			   infoDialog.get('loader').load();
				            	    		   }
				            	    	   }
				            	       },
				            	       {
				            	    	   xclass : 'bar-item-separator'
				            	       },
				            	       {
				            	    	   btnCls : 'button button-small',
				            	    	   text : '<i class="icon-download"></i>导出EXCEL',
				            	    	   listeners : {
				            	    		   click:function(){
				            	    			   window.location.href = contextPath+ 'statisticalReportAction/exportInnerRequestBaseReport.cn?title'+$("#title").val()
				            	    			   +'&reportTimeStart='+$("#reportTimeStart").val()
				            	    			   +'&reportTimeEnd='+$("#reportTimeEnd").val()
				            	    			   +'&status='+$("#requestStatus").val();
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
	//删除
	function deleteData() {
		var selections = grid.getSelection();
		BUI.Message.Confirm('确定要删除选中记录吗？<br/>',function(){
			var ids = "";
			//拼装选中的数据的主单id,验证是否都可以删除
			for(var i = 0;i < selections.length;i++){
				ids = ids + "," + selections[i].innerRequestBase.id;
			}
//			//验证
			$.post(contextPath + 'workShopRequestAction/del.cn',
					{
						delIds : ids.substring(1, ids.length)
					},function(data,status){
						if(status){//显示成功信息，并在5秒后消失
							commonSuccess('删除成功！');
						}else{
							commonFailure();
						}
						searchData();
					});	
		},"question");
	}
	
});