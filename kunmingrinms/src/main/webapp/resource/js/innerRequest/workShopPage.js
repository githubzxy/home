var store; //列表数据源
var grid;//列表组件
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
				WORKSHOP_DRAFT,
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

//声明对象
function UploadFileDto(name,path){
	this.name = name;
	this.path = path;
}

/**
 * BUI初始化
 */
BUI.use(
				[ 'bui/grid', 'bui/data', 'bui/overlay','mod/GridBtn' ,'common/bodyLoadMask/MyLoadMask'],
				function(Grid, Data, Overlay,GB,MyLoadMask) {
					
					//创建新增弹出框
					function addDialogCreate(){
						var addDialog = new Overlay.Dialog({
							title : '新增车间请示',
							width : 685,
							height : 544,
							closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
							mask : true,//模态弹出框
							bodyStyle : {padding : 0},
							listeners : {
								closing : function(){//关闭审批窗口时刷新列表
					   				//取消正在上传的文件
			  						var uploaders = uploader.get("queue").getItems();
			  						for(var i in uploaders){
			  							uploader.cancel(uploaders[i]);
			  						}
									searchData();
								}
							},
							buttons : [ {
								text : '保存',
								elCls : 'button',
								handler :function(){
									// 表单验证
									if(!workShopAddFrom.isValid()) {
										return ;
									}
									var arr = new Array(); //声明数组,存储数据发往后台
									//获取上传文件的对列
									var fileArray = uploader.get("queue").getItems();
								 	for(var i in fileArray){
								    	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
										arr[i] = dto; // 向集合添加对象
									};
									
									var emergencyLV = $("#add_emergencyLV").val();
									var problemNature = $("#add_problemNature").val();
									var title = $("#add_title").val();
									var content = $("#add_contnet").val();
									$.post(contextPath + 'workShopRequestAction/workShopAdd.cn', //发起POST AJAX请求到后台
											{//请求参数列表
										emergencyLV :emergencyLV,
										problemNature : problemNature,
										title : title,
										content : content,
										uploadFileArr : JSON.stringify(arr)
									},function(data,status){
										if(status){//显示成功信息，并在5秒后消失
											commonSuccess('添加成功！');
										}else{
											commonFailure();
										}
										dialogClose(addDialog);
										searchData();
									});
								}
								}, {
									text : '关闭',
									elCls : 'button',
									handler : function() {
										dialogClose(addDialog);
								}
							}
							],
							loader : {
								url : contextPath + 'views/innerRequest/workShopAdd.jsp',//弹出框加载的JSP页面
								autoLoad : false,//不在弹出框组件初始化时自动加载
								lazyLoad : false,//不进行延迟加载
								dataType : 'html'//加载内容类型
							}
						});
						return addDialog;
					}
					
					//创建修改弹出框
					function updateDialogCreate(selectedId){
						var updateDialog = new Overlay.Dialog({
							title : '修改车间请示',
							width : 685,
							height : 544,
							closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
							mask : true,//模态弹出框
							bodyStyle : {padding : 0},
							listeners : {
								closing : function(){//关闭审批窗口时刷新列表
					   				//取消正在上传的文件
			  						var uploaders = uploader.get("queue").getItems();
			  						for(var i in uploaders){
			  							uploader.cancel(uploaders[i]);
			  						}
									searchData();
								}
							},
							buttons : [ {
								text : '保存',
								elCls : 'button',
								handler :function(){
									// 表单验证
									if(!workShopUpdateFrom.isValid()) {
										return ;
									}
									
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
									var emergencyLV = $("#update_emergencyLV").val();
									var problemNature = $("#update_problemNature").val();
									var title = $("#update_title").val();
									var content = $("#update_contnet").val();
									$.post(contextPath + 'workShopRequestAction/update.cn', //发起POST AJAX请求到后台
									{//请求参数列表
										baseId : selectedId,
										emergencyLV : emergencyLV,
										problemNature : problemNature,
										title : title,
										content : content,
										uploadFileArr : JSON.stringify(arr)
									},function(data,status){
										if(status){//显示成功信息，并在5秒后消失
											commonSuccess('修改成功！');
										}else{
											commonFailure();
										}
										dialogClose(updateDialog);
										searchData();
									});
								}
								}, {
									text : '关闭',
									elCls : 'button',
									handler : function() {
										dialogClose(updateDialog);
								}
							}
							],
							loader : {
								url : contextPath + 'views/innerRequest/workShopUpdate.jsp?selectedId='+selectedId,//弹出框加载的JSP页面
								autoLoad : false,//不在弹出框组件初始化时自动加载
								lazyLoad : false,//不进行延迟加载
								dataType : 'html'//加载内容类型
							}
						});
						return updateDialog;
					}
					//创建详情框
					function infoDialogCreate(selectedId){
						var infoDialog = new Overlay.Dialog({
						title : '车间请示详情',
						width : 685,
						height : 550,
						closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
						mask : true,//模态弹出框
						bodyStyle : {padding : 0},
						listeners : {
							closing : function(){//关闭审批窗口时刷新列表
								searchData();
							}
						},buttons : [ {
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
					
					//创建车间执行情况
					function workShopExcutionDialogCreate(selectedId){
						var confirmateDialog = new Overlay.Dialog({
						title : '车间确认请示',
						width : 685,
						height : 255,
						closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
						mask : true,//模态弹出框
						bodyStyle : {padding : 0},
						listeners : {
							closing : function(){//关闭审批窗口时刷新列表
								searchData();
							}
						},
						buttons : [ {
							text : '保存',
							elCls : 'button',
							handler :function(){
								// 表单验证
								if(!workShopExcutionFrom.isValid()) {
									return ;
								}
								var workShopExcution = $("#workShopExcution").val();
								$.post(contextPath + 'workShopRequestAction/fillWorkShopExcution.cn', //发起POST AJAX请求到后台
								{//请求参数列表
									selectedId : selectedId,
									workShopExcution : workShopExcution
								},function(data,status){
									if(status){//显示成功信息，并在5秒后消失
										commonSuccess('确认成功！');
									}else{
										commonFailure();
									}
									dialogClose(confirmateDialog);
									searchData();
								});
							}
							}, {
								text : '关闭',
								elCls : 'button',
								handler : function() {
									dialogClose(confirmateDialog);
							}
						}
						],
						loader : {
							url : contextPath + 'views/innerRequest/workShopExcution.jsp?selectedId='+selectedId,//弹出框加载的JSP页面
							autoLoad : false,//不在弹出框组件初始化时自动加载
							lazyLoad : false,//不进行延迟加载
							dataType : 'html'//加载内容类型
						}
					});
					return confirmateDialog;
				}
					
					// 设置Store（数据源）类型为Data.Store
					var Store = Data.Store;
					var columns = [ 
					                {
					                	title : '标题',
					                	dataIndex : 'title',
					                	elCls : 'center',
					                	width : '20%'
					                }, {
					                	title : '创建人',
					                	dataIndex : 'createUser',
					                	elCls : 'center',
					                	width : '10%',
					                	renderer : function(value) {
					                		return value == null ? "" : value.name;
					                	}
					                } ,{
					                	title : '创建时间',
					                	dataIndex : 'createDate',
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
					                }, {
					                	title : '状态',
					                	dataIndex : 'status',
					                	elCls : 'center',
					                	width : '15%',
					                	renderer : function(value){
					                		return getNameByStatus(value);
					                	}
					                },{
					            		title : '操作',
					            		dataIndex : 'status',
					            		elCls : 'center',
					            		sortable : false,	// 表头不排序
					            		width : '10%',
					            		renderer:function(value){
					                		return handleBtn(value);
					                	}
					            	}];
					// 将全局变量的store（数据源）设置为新定义的数据类型
					store = new Store({
						// 调用serverlet方法
						url : contextPath+ "workShopRequestAction/getInnerRequestBaseByWorkShop.cn",
						pageSize : 10,//每页展示行数
						// 调用方法
						proxy : {
							method : 'post'
						}
					});
					// 给全局变量grid定义为BUI的列表组件
					grid = new GB(
							{
								render : '#grid',
								idField : 'id',
								columns : columns,
								width : '100%',
								perId : perId,
								contextPath:contextPath,
								loadMask : true, // 加载数据时显示屏蔽层
								store : store,
								//插件
								plugins : [
										Grid.Plugins.CheckSelection,
										Grid.Plugins.RowNumber//列序号插件
										],
								tbar : {
									items : [
											{
												btnCls : 'button button-small',
												text : '<i class="icon-plus"></i>新增',
												listeners : {
													click : function(){
														var addDialog = addDialogCreate();
														addDialog.show();
														addDialog.get('loader').load();
													}
												}
											},
											{
												xclass : 'bar-item-separator' // 竖线分隔符
											},
											{
												btnCls : 'button button-small',
												text : '<i class="icon-edit"></i>修改',
												listeners : {
													click : function(){
														//验证
														//只能选一条进行修改
														var selection = grid.getSelection();
														if(selection.length != 1){												
															commonFailure(
																'请选择一条数据进行修改！');
															return;
														}
														//只有草稿状态能进行修改
														var selected = grid.getSelected();
														var status = selected.status;
														if(status != WORKSHOP_DRAFT && status != MANAGER_RETURN){
															commonFailure(
																'只能是状态为【'+getNameByStatus(WORKSHOP_DRAFT)+'】【'+getNameByStatus(MANAGER_RETURN)+'】的请示可以修改！'
																);
															return;
														}
														var updateDialog = updateDialogCreate(selected.id);
														updateDialog.show();
														updateDialog.get('loader').load();
													}
												}
											},
											{
												xclass : 'bar-item-separator' // 竖线分隔符
											},
											{
												btnCls : 'button button-small',
												text : '<i class="icon-remove"></i>批量删除',
												listeners : {
													click : del
												}
											},
											{
												xclass : 'bar-item-separator' // 竖线分隔符
											},
											{
												btnCls : 'button button-small',
												text : '<i class="icon-download"></i>导出EXCEL',
												listeners : {
													click : exportXls
												}
											},
											
											//提示信息类型
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
					grid.render();
					readyInit();
					// 添加单元格点击事件
					grid.on('cellclick',function(ev) {
						target = $(ev.domTarget);	
						var record = ev.record;
				    	if(target.hasClass('report')) {
				    		report(record.id);
				    	} else if(target.hasClass('applyReturn')) {
				    		applyReturn(record.id);
						} else if(target.hasClass('workShopConfirm')) {
							workShopConfirm(record.id);
						} else if(target.hasClass('workShopExcution')) {
							workShopExcution(record.id);
						} else if(target.hasClass('info')){
							var infoDialog = infoDialogCreate(record.id);
							infoDialog.show();
							infoDialog.get('loader').load();
						}
					});

					/**
					 * 上报
					 */
					function report(selectedId){
						// 首先生成遮罩层,防止多次点击
						var MLM = new MyLoadMask({
							contextPath : contextPath,
							el : 'body'
						});
						MLM.show();
						
						$.post(contextPath + 'workShopRequestAction/report.cn', //发起POST AJAX请求到后台
						{//请求参数列表
							selectedId : selectedId
						},function(data,status){
							if(status){//显示成功信息，并在5秒后消失
								MLM.hide();
								commonSuccess('上报成功！');
							}else{
								commonFailure('上报失败！');
							}
							searchData();
						});
					}

					/**
					 * 申请回退
					 */
					function applyReturn(selectedId){
						//验证
						BUI.Message.Confirm('确定要【申请回退】选中记录吗？<br/>',function(){
							$.post(contextPath + 'workShopRequestAction/applyReturn.cn',
									{
										selectedId : selectedId
									},function(data,status){
										if(status){//显示成功信息，并在5秒后消失
											commonSuccess('申请成功！');
										}else{
											commonFailure();
										}
										searchData();
									});	
						},"question");
					}

					/**
					 * 车间确认
					 */
					function workShopConfirm(selectedId) { 
						
						var msg = "确认内部请示吗？";
						BUI.Message.Confirm(msg,
								function(){
									$.post(
											contextPath + "workShopRequestAction/workShopConfirm.cn",
											{
												selectedId : selectedId
											},
											function(data,status){
												if(status){
													commonSuccess('确认成功！');
												}else{
													commonFailure();
												}
												searchData();
											}
									);
								},
								'question');
					}
					
					/**
					 * 填写执行情况
					 */
					function workShopExcution(selectedId){
						var workShopExcutionDialog = workShopExcutionDialogCreate(selectedId);
						workShopExcutionDialog.show();
						workShopExcutionDialog.get('loader').load();
					}
					
					
					
				});
/**
 * 隐藏查询栏
 */
function hiddenSearch() {
	$('#searchForm .row').toggle('slow',function(){
		var searchHeight = $('#searchForm').height();
		if(searchHeight < 50){
			grid.set('height',grid.get('height') + 44);
		}else{
			grid.set('height',grid.get('height') - 44);
		}
	});
}
/**
 * 查询方法，重新加载列表数据源
 */
function searchData(){
	pageNum = store.get("start");
	if(store){
		store.load({
			start : pageNum ,//从第一页开始
			title : $("#title").val(),
			emergencyLV : $("#emergencyLV").val(),
			problemNature:$("#problemNature").val(),
			status:$("#requestStatus").val(),
			createOrgId : curOrgId
		});
	}
}
/**
 * 查询按钮除法事件
 */
function searchBtnClick(){
	if(store){
		store.load({
			start : 0 ,//从第一页开始
			title : $("#title").val().trim(),
			emergencyLV : $("#emergencyLV").val(),
			problemNature:$("#problemNature").val(),
			status:$("#requestStatus").val(),
			createOrgId : curOrgId
		});
	}
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
 * 批量删除
 */
function del(){
	var selectedObjs = grid.getSelection();
	var delIds = "";
	if(selectedObjs.length < 1){
		commonFailure('请至少选择一条数据进行删除！');
		return;
	}
	//拼装选中的数据的主单id,验证是否都可以删除
	for(var c = 0; c < selectedObjs.length;c++) {
		var record = selectedObjs[c];
		var status = record.status;
		//只有草稿和管理员退回可以删除
		if(status != WORKSHOP_DRAFT && status != MANAGER_RETURN) {
			commonFailure(
					'只能是状态为【'+getNameByStatus(WORKSHOP_DRAFT)+'】【'+getNameByStatus(MANAGER_RETURN)+'】的请示可以删除！');
			return;
		}
		if(c == selectedObjs.length - 1){
			delIds += record.id;
		}else{
			delIds += record.id + ",";
		}
	 }
	//验证
	BUI.Message.Confirm('确定要删除选中记录吗？<br/>',function(){
		$.post(contextPath + 'workShopRequestAction/del.cn',
				{
					delIds : delIds
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

/**
 * 导出excel
 */
function exportXls() {
	window.location.href = contextPath+ 'workShopRequestAction/exportXls.cn?title'
		+ $("#title").val()
		+ '&emergencyLV='+$("#emergencyLV").val()
		+ '&problemNature='+$("#problemNature").val()
		+ '&status='+$("#requestStatus").val();
}

/**
 * 根据状态设置可操作按钮
 * 
 * @param value
 * @returns {String}
 */
function handleBtn(value){
		switch(value) {
			case WORKSHOP_DRAFT:
				return '<span class="grid-command report">上报</span><span class="grid-command info">详情</span>';
			case WORKSHOP_REPORT:
				return '<span class="grid-command applyReturn">申请回退</span><span class="grid-command info">详情</span>';
			case MANAGER_RETURN:
				return '<span class="grid-command report">上报</span><span class="grid-command info">详情</span>';
			case WORKSHOP_UNCONFIRM:
				return '<span class="grid-command workShopConfirm">确认</span><span class="grid-command info">详情</span>';
			case WORKSHOP_CONFIRM:
				return '<span class="grid-command workShopExcution">填写执行情况</span><span class="grid-command info">详情</span>';
			default:
				return '<span class="grid-command info">详情</span>';
		}
}