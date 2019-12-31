var store; //列表数据源
var grid;//列表组件
var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页

var addDialog;// 新增弹出框
var updateDialog;// 修改弹出框
var showDialog;// 详细信息弹出框
var uploadDialog;//上传

var reportDialog;//情况汇报弹出框
var todayUserDuty;//当前用户当天的值班信息 domain/OnDuty.java类型


/**
 * 初始化界面
 */
function readyInit(){
	//进行高度计算
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	grid.set('height',windownHeight - searchHeight - 45);
	initPage();
	searchData();

}

function initPage() {
	
	initWeek("weekCbo");
	initStatus("status");
}
/**
 * BUI初始化
 */
BUI.use([ 'bui/grid', 'bui/data', 'bui/overlay', 'bui/mask','mod/GridBtn' ],
		function(Grid, Data, Overlay,Mask,GB) {
					
		// 设置Store（数据源）类型为Data.Store
		var Store = Data.Store;
		
		/*
		 * 列表表头声明
		 */
		var columns = [{//TODO自己声明列表表头
			title : '值班日期',
			dataIndex : 'dutyDate',
			elCls : 'center',//居中显示
			sortable : false,	// 表头不排序
			width : '140px',
			renderer:Grid.Format.dateRenderer
		}, {
			title : '星期',
			dataIndex : 'week',
			elCls : 'center',
			sortable : false,	// 表头不排序
			width : '50px',
			renderer: function(value) {
				return weekToChinese(value);
			}
		},{
			title : '值班部门',
			dataIndex : 'user',
			elCls : 'center',
			sortable : false,	// 表头不排序
			width : '10%',
			renderer:function(value) {
				if(value != null && value.organization != null) {
					return value.organization.name;
				}
				return "";
			}
		},{
			title : '值班人',
			dataIndex : 'user',
			elCls : 'center',
			sortable : false,	// 表头不排序
			width : '8%',
			renderer:function(value) {
				return value == null ? "" : value.name;
			}
		},{
			title : '固定电话',
			dataIndex : 'fixedNum',
			elCls : 'center',
			sortable : false,	// 表头不排序
			width : '10%',
			renderer:function(value) {
				return value == null ? "" : value;
			}
		},{
			title : '手机',
			dataIndex : 'cellPhoneNum',
			elCls : 'center',
			sortable : false,	
			width : '10%',
			renderer:function(value) {
				return value == null ? "" : value;
			}
		},{
			title : '是否汇报',
			dataIndex : 'status',
			elCls : 'center',
			sortable : false,	// 表头不排序
			width : '60px',
			renderer: function(value) {
				return statusToChinese(value);
			}
		}, {
			title : '情况汇报',
			dataIndex : 'situation',
			elCls : 'center',
			sortable : false,	// 表头不排序
			width : '45%'
		}];
		// 将全局变量的store（数据源）设置为新定义的数据类型
		store = new Data.Store({
			pageSize : 10,//每页数量
			proxy : {
				url : contextPath + "ondutyAction/getOnDutyByDto.cn",//TODO异步数据源请求
				method : 'post'
			}
		});
		// 给全局变量grid定义为BUI的列表组件
		grid = new GB(
				{
					render : '#grid',
					perId : perId,
					contextPath : contextPath,
					idField : 'id',
					columns : columns,
					loadMask : true,
					store : store,
					itemStatusFields : {
						read : 'isOverTime' //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
					},
					width : '100%',
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
											if(selectedAll.length == 0){
												commonFailure("请选择一条记录进行修改！");
												return;
											}
											if (selectedAll.length > 1) {
												commonFailure("只能选择一条记录进行修改！");
												return;
											}
											
											var record = selectedAll[0];
											var ondutyId = record.id;
											var updateDialog = updateDialogCreate(ondutyId);
											updateDialog.show();
											updateDialog.get('loader').load();
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
												commonFailure("请选择一条记录进行删除！");
												return;
											}
											var ids = "";
											for(var i = 0; i < selectedAll.length; i ++) {
												ids += "," + selectedAll[i].id ;
											}
											ids = ids.substring(1);
											
											delOnDuty(ids);
										}
									}
								},
								{
									xclass : 'bar-item-separator'
								}, {
									btnCls : 'button button-small',
									text : '<i class="icon-list-alt"></i>详情',
									listeners : {
										click : function() {
											var selectedAll = grid.getSelection();
											if(selectedAll.length == 0){
												commonFailure("请选择一条记录进行查看！");
												return;
											}
											if (selectedAll.length > 1) {
												commonFailure("只能选择一条记录进行查看！");
												return;
											}
											
											var record = selectedAll[0];
											var ondutyId = record.id;
											var showDialog = showDialogCreate(ondutyId);
											showDialog.show();
											showDialog.get('loader').load();
										}
									}
								},
								{
									xclass : 'bar-item-separator'
								}, {
									btnCls : 'button button-small',
									text : '<i class="icon-asterisk"></i>情况汇报',
									listeners : {
										click : function() {
											getTodayUserDuty();
										}
									}
								},{
									xclass : 'bar-item-separator'
								},{
					                  btnCls : 'button button-small',
					                  text : '<i class="icon-upload"></i>导入数据',
					                  listeners : {
					                    'click' : function(){
					                    	var uploadDialog = uploadDialogCreate();
					                    	uploadDialog.show();
					                    	uploadDialog.get('loader').load();
					                    }
					                  }
					            },
								{
									xclass : 'bar-item-text',
									text : errorMsgHtml+sucMsgHtml
								}
							]
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
	    		leadHandle(record.id);
	    	}
		});


		/**
		 * 新增弹出框
		 */
		function addDialogCreate(){
			addDialog = new Overlay.Dialog({
				title : '新增值班',
				width : 620,
				height : 458,
				closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
				mask : true,//非模态弹出框
				bodyStyle : {padding : 0},
				listeners : {
					closing : function(){//关闭窗口时刷新列表
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
							var addSelectedAll = addGrid.getSelection();
							if(addSelectedAll.length == 0){
								$(".bui-ext-mask").addClass("mask");
								tooltip("请选择值班人员！");
								return;
							}
							
							var onduyUsers = JSON.stringify(addSelectedAll);
							var dateStr = $("#addDutyDate").val();
							
							addOnDutyUser(onduyUsers, dateStr);
//							dialogClose(addDialog);
						}
					}, {
						text : '关闭',
						elCls : 'button',
						handler : function() {
							dialogClose(addDialog);
						}
					}],
				loader : {
					url : contextPath + 'views/onduty/onDutyAdd.jsp',//弹出框加载的JSP页面
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
		function updateDialogCreate(ondutyId){
			updateDialog = new Overlay.Dialog({
				title : '修改值班',
				width : 620,
				height : 210,
				closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
				mask : true,//非模态弹出框
				bodyStyle : {padding : 0},
				listeners : {
					closing : function(){//关闭窗口时刷新列表
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
							
							onDutyData.fixedNum = $("#updateFixedNum").val();
							onDutyData.cellPhoneNum = $("#updateCellPhoneNum").val();
							onDutyData.dutyDate = $("#updateDutyDate").val();
							
							var date = new Date($("#updateDutyDate").val());
							onDutyData.week = date.getDay();
							onDutyData.user = JSON.parse($("#updateUser").val());
							
							var onDutyStr = JSON.stringify(onDutyData);
							updateOnDutyUser(onDutyStr);
//							dialogClose(updateDialog);
							}
					}, {
						text : '关闭',
						elCls : 'button',
						handler : function() {
							dialogClose(updateDialog);
						}
					}],
				loader : {
					url : contextPath + 'views/onduty/onDutyUpdate.jsp?ondutyId=' + ondutyId,//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
			});
			return updateDialog;
		}

		/**
		 * 创建详细信息弹出框
		 */
		function showDialogCreate(ondutyId){
			showDialog = new Overlay.Dialog({
				title : '详细信息',
				width : 620,
				height : 500,
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
					url : contextPath + 'views/onduty/onDutyAllShow.jsp?ondutyId=' + ondutyId,//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
			});
			return showDialog;
		}

		/**
		 * 创建情况汇报弹出框
		 */
		function reportDialogCreate(ondutyId){
			reportDialog = new Overlay.Dialog({
				title : '情况汇报',
				width : 620,
				height : 300,
				closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
				mask : true,//非模态弹出框
				bodyStyle : {padding : 0},
				listeners : {},
				buttons : [ {
					text : '保存',
					elCls : 'button',
					handler :function(){
							// 表单验证
							if(!reportForm.isValid()) {
								return ;
							}
							todayUserDuty.situation=$("#reportContentTxt").val();
							var todayUserDutyArr = JSON.stringify(todayUserDuty);
							report(todayUserDutyArr);
//							dialogClose(reportDialog);
						}
					}, {
						text : '关闭',
						elCls : 'button',
						handler : function() {
							dialogClose(reportDialog);
						}
					}],
				loader : {
					url : contextPath + 'views/onduty/onDutyReportForm.jsp',//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
			});
			return reportDialog;
		}

		/**
		 * 关闭弹出框并解除引用
		 * param:d 待关闭的弹出框
		 */
		function dialogClose(d){
			d.close();
			d = null;
		}
		
		/**
		 * 查询当前人当天值班的信息 
		 * 
		 */
		function getTodayUserDuty(){
			$.ajax({
				type : 'post',
				url : contextPath + "ondutyAction/getTodayUserDuty.cn",
				data :{
					userId : curUserId
				},
				dataType :"json" ,
				success : function(data, textStatus, jqXHR){
					getTodayUserDutySuccess(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown){
					alert(textStatus);
				}
				
			});
		}
		/**
		 * 获取当前人当天值班信息成功 
		 * 
		 */
		function getTodayUserDutySuccess(data){
			todayUserDuty=data;
			if(jQuery.isEmptyObject(todayUserDuty)){
//				BUI.Message.Alert('当前登录人当天没有值班信息，不必填写情况汇报！','error');
				commonFailure("当前登录人当天没有值班信息，不必填写情况汇报!");
				return;
			}
			else{
				//已汇报不能再汇报
				if(todayUserDuty.status==2){
//					BUI.Message.Alert('该用户当天值班信息已经汇报，不可进行汇报！','error');
					commonFailure("该用户当天值班信息已经汇报，不可进行汇报!");
					return;
				}
				//不是本人。不可汇报
				if(todayUserDuty.user.id != curUserId){
//					BUI.Message.Alert('该记录值班人不是当前系统登录人员，不可进行汇报！','error');
					commonFailure("该记录值班人不是当前系统登录人员，不可进行汇报!");
					return;
				}
				//段用户不用汇报	
				if(curOrgName.length == 0){
//					BUI.Message.Alert('该人员没有部门，请设置部门后在进行情况汇报！','error');
					commonFailure("该人员没有部门，请设置部门后在进行情况汇报!");
					return;
				}
				var checkArr = curOrgName.split("车间");
				if(checkArr.length <= 1){
//					BUI.Message.Alert('非车间用户不必填写汇报！','error');
					commonFailure("非车间用户不必填写汇报!");
					return;
				}
				//按服务器时间进行时间判断
				if(curHour<17 || curHour>=20){
//					BUI.Message.Alert('应在17:00-20:00填写!','error');
					commonFailure("应在17:00-20:00填写!");
					return;
				}
			}
			var reportDialog = reportDialogCreate();
			reportDialog.show();
			reportDialog.get('loader').load();
			
		}
		/**
		 * 新增值班人员
		 */
		function addOnDutyUser(onduyUsers, dateStr) {
			
			$.post(contextPath + 'ondutyAction/addBoth.cn',
					{
						onduyUsers : onduyUsers,
						dateStr : dateStr
					},function(data,status){
						
						if(data == "false") {
							$(".bui-ext-mask").addClass("mask");
							tooltip("值班日期中已存在该值班人，请重新选择！");
							return ;
						}
						if(status){
							commonSuccess("值班人员新增成功！");
						}else{
							commonFailure("值班人员新增失败！");
						}
						dialogClose(addDialog);
						store.load();
					});
		}
		
		/**
		 * 修改值班人员
		 */
		function updateOnDutyUser(ondutyStr) {
			
			$.post(contextPath + 'ondutyAction/update.cn',
					{
						ondutyStr : ondutyStr
					},function(data,status){
						
						if(data == "false") {
							$(".bui-ext-mask").addClass("mask");
							tooltip("值班日期中已存在该值班人，请重新选择！");
							return ;
						}
						if(status){
							commonSuccess("值班人员修改成功！");
						}else{
							commonFailure("值班人员修改失败！");
						}
						dialogClose(updateDialog);
						store.load();
					});
		}
		
		/**
		 * 填写情况汇报
		 */
		function report(ondutyStr) {
			
			$.post(contextPath + 'ondutyAction/report.cn',
					{
						ondutyStr : ondutyStr
					},function(data,status){
						
						if(data == "false") {
							$(".bui-ext-mask").addClass("mask");
							tooltip("值班日期中已存在该值班人，请重新选择！");
							return ;
						}
						if(status){
							commonSuccess("情况汇报成功！");
						}else{
							commonFailure("情况汇报失败！");
						}
						dialogClose(reportDialog);
						store.load();
					});
		}
		
		/**
		 * 删除
		 * @param ids 
		 */
		function delOnDuty(ids) {
			
			var msg = '确定要删除选中记录吗？<br/>';
			BUI.Message.Confirm(msg,
			function(){
				$.post(
						contextPath + "ondutyAction/delete.cn",	
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
		
		//导入
	    function uploadDialogCreate(){
	 	   uploadDialog = new Overlay.Dialog({
	 		   title : '导入值班信息',
				   width : 590,
				   height : 195,
				   closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
				   mask : true,//非模态弹出框
				   bodyStyle : {padding : 0},
				   listeners : {
					   closing : function(){//关闭窗口时刷新列表
							store.load();
					   }
				   },
				   buttons : [ {
					   text : '导入',
					   elCls : 'button btn-save',
					   handler :function(){
						   if(fileValidate($("#ondutyDeptFile"))){
							   $("#uploadForm #perId").val(perId);
							   $("#uploadForm").submit();
								dialogClose(uploadDialog);
							}
						}
					},{
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(uploadDialog);
						}
					}],
					loader : {
						url : contextPath + 'views/onduty/onDutyImport.jsp',//弹出框加载的JSP页面
						autoLoad : false,//不在弹出框组件初始化时自动加裁
						lazyLoad : false,//不进行延迟加裁
						dataType : 'html'//加载内容类型
					}
	 	   });
	 	   return uploadDialog;
		}
		
	    function fileValidate(fileObj){ 
	    	var flag = true;
	    	// 上传文件不能为空，格式必须为xsl和xlsx
	    	var filepath=fileObj.val(); 
	    	//验证时否为空
	    	if( filepath == undefined || $.trim(filepath)== "" ){
	    		$(".bui-ext-mask").addClass("mask");
	    		tooltip("请选择上传文件！"); 
	    		flag=false; 
	    	}else{ 
	    		//验证最后一个后缀是否是Excel文件
	    		var fileArr=filepath.split("\\"); 
	    		var fileTArr=fileArr[fileArr.length-1].toLowerCase().split("."); 
	    		var filetype=fileTArr[fileTArr.length-1]; 
	    		if(filetype!="xls"&&filetype!="xlsx"){ 
	    			$(".bui-ext-mask").addClass("mask");
	    			tooltip("上传文件必须为Excel文件！"); 
	    			flag=false; 
	    		}
	    	}
	    	//返回验证标记
	    	return flag;
	    }
	    
		// 弹出框提示
		function tooltip(msg){
			var msg = msg;
			BUI.Message.Show({
				msg : msg,
				closeable : false,
				buttons : [{
					text : '确定',
					elCls : 'button',
					handler : function(){
						$(".bui-ext-mask").removeClass("mask");
						this.close();
					}
				}]
			});
		}
		
	});

/**
 * 查询方法，重新加载列表数据源
 */
function getParams(){
	return {
		name : $("#dutyName").val(),
		orgId : curOrgId,
		week : $("#weekCbo").val(),
		startDate:$("#startDate").val(),
		endDate:$("#endDate").val(),
		status:$("#status").val()
	};
}
function searchData(){
	pageNum = store.get("start");
	if(store){
		store.load({
			params:JSON.stringify(getParams()),
			start : pageNum
		});
	}
}

function searchBtnClick(){//查询方法，重新加载列表数据源TODO自己定义查询参数
	if(store){
		store.load({
			params:JSON.stringify(getParams()),
			start : 0
		});
	}
}
