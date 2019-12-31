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
<title>停机计划</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
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
		margin-left:10px;
		margin-right:3px;
		width:10px;
		height:10px;
		background-color:#000;
	}
	.bui-grid-row-daiShenHe{
	    color: #458B74;
	}
	.bui-grid-row-daiHuiFu{
 	    color:#00C5CD;
	}
	.bui-grid-row-wanCheng{
	    color: #1E90FF;
	}
	.bui-grid-row-weiWanCheng{
	    color:#5CACEE;
	}
	.bui-grid-row-yiQuXiao{
		color:#828282;
	}
	.bui-select-list{
	    overflow-y: auto;
	    height : 150px;
	}
	.x-grid-rownumber{
		color:black;/* 序号，全为黑色 */
	}
	.bui-message .bui-ext-close{
		display:none;
	} 
</style>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<input type="hidden" id="perId" value="${requestScope.threePerId}"/>
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			  <div class="row">
				<div class="control-group span8">
					<label class="control-label">线路:</label>
					<div class="controls">
						<select name="rainLine" id="rainLine" style="width: 181px;">
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">申请单位:</label>
					<div class="controls">
						<jsp:include page="../../common_page/OrgInputTree.jsp" flush="true" >
							<jsp:param name="org"  value="org" />
							<jsp:param name="orgVal"  value="orgVal" />
							<jsp:param name="actionURL"  value="organization/getOrgChildrenById.cn" />
							<jsp:param name="width"  value="170px" />
							<jsp:param name="height"  value="18px" />
						</jsp:include>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">所属专业:</label>
					<div class="controls">
						<select name="major" id="major" style="width: 181px;">
						</select>
					</div>
				</div>
				</div>
			 <div class="row">
				<div class="control-group span8">
					<label class="control-label">施工类别:</label>
					<div class="controls">
						<select name="constructionType" id="constructionType" style="width: 181px;">
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">施工属性:</label>
					<div class="controls" >
						<select name="constructionProperty" id="constructionProperty" style="width: 181px;">
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">工作内容:</label>
					<div class="controls">
						<select name="workContent" id="workContent" style="width: 181px;">
						</select>
					</div>
				</div>
			</div>
			 <div class="row">
				<div class="control-group span8">
					<label class="control-label">涉及骨干网:</label>
					<div class="controls" >
						<input type="text" id="BackboneNetwork" class="input-normal" style="width: 171px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">状态:</label>
					<div class="controls" >
						<select name="state" id="state" style="width: 181px;">
						</select>
					</div>
				</div>
				 <div class="control-group span8">
					 <label class="control-label">是否天窗:</label>
					 <div class="controls" >
						 <select name="skyLight" id="skyLight" style="width: 181px;">
							 <option value=" ">全部</option>
							 <option value="false">否</option>
							 <option value="true">是</option>
						 </select>
					 </div>
				 </div>
				<div style="float:right;margin-right: 100px">
					<button type="button" id="btnSearch" class="button button-primary">查询</button>
				</div>
			</div>
		</fieldset>
	</form>
	<div class="search-grid-container" style="overflow-x:auto; overflow-y:hidden; ">
		<fieldset>
			<legend>列表</legend>
			<div id="miniSquareSpace">
				<span class="miniSquare"  style="background-color:#458B74"></span>待审核
				<span class="miniSquare"  style="background-color:#00C5CD"></span>待回复
				<span class="miniSquare"  style="background-color:#1E90FF"></span>完成
				<span class="miniSquare"  style="background-color:#5CACEE"></span>未完成
				<span class="miniSquare"  style="background-color:#828282"></span>已取消
			</div>
			<div id="grid"></div>
		</fieldset>
	</div>
	<form action="/kunmingrinms/commNetStopAction/expCommNetStop.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var perId = "<%=perId%>";

	var pageNum = 0;// 查询开始数，保证翻页后，store再次load的时候还停留在当前页
	
	var store,grid;// 列表及数据源声明

	var addDialog;// 新增弹出框
	var editDialog;// 修改弹出框
	var replyDialog;//回复弹出框
	var detailDialog;// 详细信息弹出框
	var recordSelected;//选中的一条记录
	var importDialog;// 导入弹出框
	
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
		
		initSelection();//初始化查询栏的下拉选
		
		grid.set('height',windownHeight - searchHeight-70);
		store.load({
			railLineName : $("#rainLine").find("option:selected").val(),
			// 获取申请单位名称
			org:$(orgValInputId).val(),
			workContent : $("#workContent").find("option:selected").val(),
			belongCraft : $("#major").find("option:selected").val(),
			executionType : $("#constructionType").find("option:selected").val(),
			executionAttr : $("#constructionProperty").find("option:selected").val(),
			mainNetName : $("#BackboneNetwork").val(),
			state : $("#state").find("option:selected").val(),
			skyLight: $("#skyLight").find("option:selected").val()
            }
		);
	}
	
	if(perId == 'null'){
		perId = $('#searchForm #perId').val();// 重新赋值
	}

	//初始化查询栏的下拉选
	function initSelection(){
		commNetworkStop_rainLine.listData("#rainLine");
		commNetworkStop_workContent.listData("#workContent");
		commNetworkStop_major.listData("#major");
		commNetworkStop_constructionType.listData("#constructionType");
		commNetworkStop_constructionAttr.listData("#constructionProperty");
		commNetworkStop_old_status.listData("#state");
	}
	
	//获取查询条件参数
	function getParam(){
		return {
			railLineName : $("#rainLine").find("option:selected").val(),
			// 获取申请单位名称
			org:$(orgValInputId).val(),
			workContent : $("#workContent").find("option:selected").val(),
			belongCraft : $("#major").find("option:selected").val(),
			executionType : $("#constructionType").find("option:selected").val(),
			executionAttr : $("#constructionProperty").find("option:selected").val(),
			mainNetName : $("#BackboneNetwork").val(),
			state : $("#state").find("option:selected").val(),
            skyLight: $("#skyLight").find("option:selected").val()
		};
	}
	
	$("#btnSearch").click(function(){
		if(store){
			store.load({
				railLineName : $("#rainLine").find("option:selected").val(),
				// 获取申请单位名称
				org:$(orgValInputId).val(),
				workContent : $("#workContent").find("option:selected").val(),
				belongCraft : $("#major").find("option:selected").val(),
				executionType : $("#constructionType").find("option:selected").val(),
				executionAttr : $("#constructionProperty").find("option:selected").val(),
				mainNetName : $("#BackboneNetwork").val(),
				state : $("#state").find("option:selected").val(),
                skyLight: $("#skyLight").find("option:selected").val(),
				start : pageNum, //从第一页开始
				pageSize : 10
			});
		}
	});
	
	var suggest;	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select','mod/GridBtn'],function(Grid,Data,Calendar, Form,Overlay,Select,GB){
// 		alert = BUI.Message.Alert();//使用bui的消息提示框

		//再次点击申请单位清空表单值
// 		$(orgInputId).click(function(){
// 			$(orgInputId).val("");
// 			$(orgValInputId).val("");
// 		});
	  	
		/*表格列设置*/
		var columns = [{
				title:'状态',
				dataIndex:'state',
				elCls : 'center',
				width:'50px',
				renderer:function(value){
					return commNetworkStop_old_status.typeName(value);
				}
			},{
				title:'开始时间',
				dataIndex:'startDate',
				elCls : 'center',
				width:'120px',
				renderer: Grid.Format.datetimeRenderer
			},{
				title:'结束时间',
				dataIndex:'endDate',
				elCls : 'center',
				width:'120px',
				renderer: Grid.Format.datetimeRenderer
			},{
				title:'线路',
				dataIndex:'railLineName',
				elCls : 'center',
				width:'80px'
			},{
				title:'申请单位',
				dataIndex:'applyOrgName',
				elCls : 'center',
				width:'90px'
			},{
				title:'施工地点',
				dataIndex:'executionAddr',
				elCls : 'center',
				width:'90px'
			},{
				title:'所属专业',
				dataIndex:'belongCraft',
				elCls : 'center',
				width:'110px',
				renderer:function(value){
					return commNetworkStop_major.typeName(value);
				}
			},{
				title:'施工类别',
				dataIndex:'executionType',
				elCls : 'center',
				width:'110px',
				renderer:function(value){
					return commNetworkStop_constructionType.typeName(value);
				}
			},{
				title:'施工属性',
				dataIndex:'executionAttr',
				elCls : 'center',
				width:'110px',
				renderer:function(value){
					return commNetworkStop_constructionAttr.typeName(value);
				}
			},{
				title:'工作内容',
				dataIndex:'workContent',
				elCls : 'center',
				width:'90px',
				renderer:function(value){
					return commNetworkStop_workContent.typeName(value);
				}
			},{
				title:'涉及骨干网',
				dataIndex:'mainNetName',
				elCls : 'center',
				width:'120px'
			},{
				title:'涉及铁路局',
				dataIndex:'railwaysBureau',
				elCls : 'center',
				width:'120px'
			},{
				title:'方案审批编号',
				dataIndex:'planExaminNum',
				elCls : 'center',
				width:'90px'
			},{
				title:'月度计划审批编号',
				dataIndex:'monthPlanExamin',
				elCls : 'center',
				width:'110px'
			},{
				title:'昆铁施工台计划号',
				dataIndex:'executionPlanNum',
				elCls : 'center',
				width:'110px'
			},{
				title:'是否天窗',
				dataIndex:'skyLight',
				elCls:'center',
				width:'60px',
				renderer:function(value){
					return value?'是':'否';
				}
			}];
		
		store = new Data.Store({
			url : contextPath+'commNetStopAction/getCommNetworkStopByDto.cn',
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
			width : '1652px',//'100%',//如果表格使用百分比，这个属性一定要设置
			columns : columns,
			idField : 'id',
			itemStatusFields : {
				daiShenHe : 'wait_examine', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
				daiHuiFu : 'wait_reply',
				wanCheng : 'finish',
				weiWanCheng : 'unfinish',
				yiQuXiao : 'cancel'
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
								if(recordSelected.state==commNetworkStop_old_status.wait_examine){//待审核 的数据才能修改
									editDialog=editDialogCreate(recordSelected.id);
									editDialog.show();
									editDialog.get('loader').load();
								}else{
									commonFailure('该条数据不能进行此操作！');
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
								deleteData(selections);
							}else{
								commonFailure("请选择要删除的数据！");
							}
	                    }
	                  }
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
		                btnCls : 'button button-small',
		                text : '<i class="icon-envelope"></i>回复',
		                listeners : { 'click' : function(){
			                	var selections = grid.getSelection();
								if(selections.length==1){
									recordSelected=selections[0];
									if(recordSelected.state==commNetworkStop_old_status.wait_reply){//待回复的数据才能回复
										replyDialog=replyDialogCreate(recordSelected.id);
										replyDialog.show();
										replyDialog.get('loader').load();
									}else{
										commonFailure('该条数据不能进行此操作！');
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
	                  text : '<i class="icon-list-alt"></i>详情',
	                  listeners : {'click' : function(){
	                	  var selections = grid.getSelection();
	                	  if(selections.length==1){//一次只能看一条记录
	                		  recordSelected=selections[0];
		                	  detailDialog=showDetailDialogCreate(recordSelected.id);
		                	  detailDialog.show();
		                	  detailDialog.get('loader').load();
	                	  }else{
	                		  commonFailure('请选择一条数据进行操作！');
	                	  }
	                    }
	                  }
	                },{
	                	xclass : 'bar-item-separator' // 竖线分隔符
	                },{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-upload"></i>导入数据',
	                  listeners : {'click' : function(){
		                	  importDialog = importDialogCreate();
		                	  importDialog.show();
		                	  importDialog.get('loader').load();
	                    }
	                  }
	                },{
	                	xclass : 'bar-item-separator' // 竖线分隔符
	                },{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-download"></i>导出EXCEL',
	                  listeners : {'click' : function(){
	                	  exportXls();
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
		
		//添加记录
       function addDialogCreate(){
    	  addDialog = new Overlay.Dialog({
    		   title : '新增停机要点计划',
   			   width : 620,
   			   height : 503,
   			   closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
   			   mask : true,//非模态弹出框
   			   bodyStyle : {padding : 0},
   			   listeners : {
   				   closing : function(){//关闭窗口时刷新列表
 						var uploaders = uploader.get("queue").getItems();
 						for(var i in uploaders){//取消正在上传的文件
 							uploader.cancel(uploaders[i]);
 						}
   				      store.load();
   				   }
   			   },
   				buttons : [ {
					text : '保存',
					elCls : 'button btn-save',
					handler :function(){
						if(!addForm.isValid()) {//表单验证
							return ;
						}
						var paramAdd=getParamAdd();//获取弹出框参数
						var arr=getUploadFileData();//获取上传文件信息
						
						$.ajax({//发送请求，保存数据
							url:contextPath +  'commNetStopAction/addCommNetStop.cn',
							type:'post',
							data:{
								paramAdd : JSON.stringify(paramAdd),
								uploadArr : JSON.stringify(arr)
								},
							dataType:'json',
							success:function(result,status){
								if(result.status=='2'){
									$(".bui-ext-mask").addClass("userMask");
									BUI.Message.Alert(result.msg,function(){
				            			$(".bui-ext-mask").removeClass("userMask");
				            		});
									return;
								}
								if(status){//提示成功
			 						commonSuccess('添加成功！');
								}else{
									commonFailure("添加失败！");
								}
								dialogClose(addDialog);//关闭添加弹出框
							},
							error:function(){
								$(".bui-ext-mask").addClass("userMask");
								BUI.Message.Alert('保存数据异常！',function(){
			            			$(".bui-ext-mask").removeClass("userMask");
			            		});
							}
						});
					}
				}, {
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(addDialog);
				}
			}],
			loader : {
				url : contextPath + 'views/commNetStop/stopPlan/stopPlanAdd.jsp',
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
    	   	
    	   });
    	   return addDialog;
		}
    
		//修改记录
       function editDialogCreate(id){
			editDialog = new Overlay.Dialog({
				title : '停机要点计划修改',
				width : 620,
				height : 500,
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
					text : '保存',
					elCls : 'button btn-save',
					handler :function(){
						if(!editForm.isValid()) {//表单验证
							return ;
						}
						var paramEdit=getParamEdit();//获取弹出框参数
						var arr = getNewAndOldUploadFileData();//获取上传文件信息
						
						$.ajax({//发送请求，保存数据
							url:contextPath +  'commNetStopAction/updateCommNetStop.cn',
							type:'post',
							data:{
								paramEdit : JSON.stringify(paramEdit),
								uploadArrEidt : JSON.stringify(arr)
								},
							dataType:'json',
							success:function(result,status){
								if(result.status=='2'){
									$(".bui-ext-mask").addClass("userMask");
									BUI.Message.Alert(result.msg,function(){
				            			$(".bui-ext-mask").removeClass("userMask");
				            		});
									return;
								}
								if(status){//提示成功
			 						commonSuccess('修改成功！');
								}else{
									commonFailure("修改失败！");
								}
								dialogClose(editDialog);//关闭弹出框
							},
							error:function(){
								$(".bui-ext-mask").addClass("userMask");
								BUI.Message.Alert('修改数据异常！',function(){
			            			$(".bui-ext-mask").removeClass("userMask");
			            		});
							}
						});
						}
					}, {
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(editDialog);
					}
				}],
				loader : {
					url : contextPath +  'views/commNetStop/stopPlan/stopPlanEdit.jsp?id='+id,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return editDialog;
		}
			
		//回复按钮弹出框
		function replyDialogCreate(id){
			replyDialog = new Overlay.Dialog({
				title : '停机要点计划回复',
				width : 620,
				height : 265,
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
					text : '&nbsp;完&nbsp;成&nbsp;',
					elCls : 'button btn-save',
					handler :function(){
						if(!replyForm.isValid()) {//表单验证
							return ;
						}
						
						var arr=getUploadFileData();//获取回复附件信息
						var paramReply={//获取参数
							id:id,
							situationCaption:$("#situationCaptionReply").val(),
							state:commNetworkStop_old_status.finish//点击完成按钮，状态设置为：完成
							};
						$.post(contextPath + 'commNetStopAction/replyCommNetStop.cn',
								{ 
									paramReply: JSON.stringify(paramReply),
									replyArr:JSON.stringify(arr)
								},
								function(result,status){
				    				if(status){//显示成功信息，并在5秒后消失
										commonSuccess('操作成功！');
									}else{
										commonFailure("操作失败！");
									}
				    				dialogClose(replyDialog);//关闭弹出框
		    					});
						}
					}, {
					text : '未完成',
					elCls : 'button btn-close',
					handler : function() {
						if(!replyForm.isValid()) {//表单验证
							return ;
						}
						
						var arr=getUploadFileData();//获取回复附件信息
						var paramReply={//获取参数
							id:id,
							situationCaption:$("#situationCaptionReply").val(),
							state:commNetworkStop_old_status.unfinish//点击未完成按钮，状态设置为：未完成
							};

						$.post(contextPath + 'commNetStopAction/replyCommNetStop.cn', 
							{ 
								paramReply: JSON.stringify(paramReply),
								replyArr : JSON.stringify(arr)
							},
							function(result,status){
			    				if(status){//显示成功信息，并在5秒后消失
									commonSuccess('操作成功！');
								}else{
									commonFailure("操作失败！");
								}
			    				dialogClose(replyDialog);//关闭弹出框
	    					});
					}
				},{
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(replyDialog);
				  }
				}],
				loader : {
					url : contextPath + 'views/commNetStop/stopPlan/stopPlanReply.jsp?id='+id,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return replyDialog;
		}
		
			//详情按钮弹出框-详细信息记录
	       function showDetailDialogCreate(id){
	    	   detailDialog = new Overlay.Dialog({
					title : '停机要点计划详情',
					width : 660,
					height : 540,
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
						url : contextPath + 'views/commNetStop/stopPlan/stopPlanDetail.jsp?id='+id,
						autoLoad : false,//不在弹出框组件初始化时自动加裁
						lazyLoad : false,//不进行延迟加裁
						dataType : 'html'//加载内容类型
					}
		    	   	
				});
				return detailDialog;
			}
			
        //删除
    	function deleteData(selections) {
    		var msg = '您确定要删除选中的数据吗?<br/>';
    		BUI.Message.Confirm(msg,function(){
    			var ids = "";
    			for(var i = 0;i < selections.length;i++){
    				ids += selections[i].id+',';
    			}
    			ids=ids.substring(0,ids.length-1);
    			$.post(contextPath + 'commNetStopAction/deleteCommNetStop.cn', { ids: ids},function(result,status){
    				if(status){//显示成功信息，并在5秒后消失
						commonSuccess('删除成功！');
					}else{
						commonFailure("删除失败！");
					}
    				store.load();
    			});
    		},'question');
    	}
        
    	// 导入数据
        function importDialogCreate(){
     	   importDialog = new Overlay.Dialog({
     		   title : '导入停机计划',
    			   width : 620,
    			   height : 196,
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
 						// 验证上传文件,通过则将form提交
 						if(fileValidate($("#importForm #importFile"))){
 							$('#importForm #perId').val(perId);
 							$("#importForm").submit();
	 						dialogClose(importDialog);
 						}
 					}
 				}, {
 					text : '取消',
 					elCls : 'button btn-close',
 					handler : function() {
 						dialogClose(importDialog);
 				}
 			}],
 			loader : {
 				url : contextPath + 'views/commNetStop/stopPlan/stopPlanImport.jsp',
 				autoLoad : false,//不在弹出框组件初始化时自动加裁
 				lazyLoad : false,//不进行延迟加裁
 				dataType : 'html'//加载内容类型
 			}
     	   	
     	   });
     	   return importDialog;
 		}
    	
    	//导出本页数据
		function exportXls(){
			$("#exportXlsJson").val("");//清空值
			//导出本页数据
			var records = store.getResult();
			var json = '[';
			for(var i = 0 ; i < records.length ; i++){
				var row = records[i];
				json += '{'
					+'"state":'+'"'+commNetworkStop_old_status.typeName(row.state)+'",'
					+'"startDate":'+'"'+Grid.Format.datetimeRenderer(row.startDate)+'",'
					+'"endDate":'+'"'+Grid.Format.datetimeRenderer(row.endDate)+'",'
					+'"railLineName":'+'"'+row.railLineName+'",'
					+'"applyOrgName":'+'"'+row.applyOrgName+'",'
					+'"executionAddr":'+'"'+row.executionAddr+'",'
					+'"belongCraft":'+'"'+commNetworkStop_major.typeName(row.belongCraft)+'",'
					+'"executionType":'+'"'+commNetworkStop_constructionType.typeName(row.executionType)+'",'
					+'"executionAttr":'+'"'+commNetworkStop_constructionAttr.typeName(row.executionAttr)+'",'
					+'"workContent":'+'"'+commNetworkStop_workContent.typeName(row.workContent)+'",'
					+'"mainNetName":'+'"'+row.mainNetName+'",'
					+'"railwaysBureau":'+'"'+row.railwaysBureau+'",'
					+'"planExaminNum":'+'"'+(row.planExaminNum?row.planExaminNum:'')+'",'
					+'"monthPlanExamin":'+'"'+(row.monthPlanExamin?row.monthPlanExamin:'')+'",'
					+'"executionPlanNum":'+'"'+(row.executionPlanNum?row.executionPlanNum:'')+'",'
					+'"skyLight":'+'"'+(row.skyLight?row.skyLight:'')+'"'
					+'},';
			}
			json = json.substring(0, json.length - 1);
			json += ']';
			$("#exportXlsJson").val(json);
			$("#exportForm").submit();
		}
    	
		/**
         * 文件名验证
         */
        function fileValidate(fileObj){ 
        	var flag = true;
        	// 上传文件不能为空，格式必须为xsl和xlsx
        	var filepath = fileObj.val(); 
        	//验证时否为空
        	if( filepath == undefined || $.trim(filepath) == "" ){
        		$(".bui-ext-mask").addClass("userMask");// 添加遮罩层
        		BUI.Message.Alert('请选择文件进行上传！',function(){
        			$(".bui-ext-mask").removeClass("userMask");// 移除遮罩层
        		});
        		flag = false; 
        	}else{ 
        		//验证最后一个后缀是否是Excel文件
        		var fileArr = filepath.split("\\"); 
        		var fileTArr = fileArr[fileArr.length-1].toLowerCase().split("."); 
        		var filetype = fileTArr[fileTArr.length-1]; 
        		if(filetype != "xls" && filetype != "xlsx"){
        			$(".bui-ext-mask").addClass("userMask");// 添加遮罩层
        			BUI.Message.Alert('上传文件必须为Excel文件！',function(){
            			$(".bui-ext-mask").removeClass("userMask");// 移除遮罩层
            		});
        			flag = false; 
        		}
        	}
        	//返回验证标记
        	return flag;
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