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
<title>应急设备标准配置</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			<div class="row">
				<div>
					<label class="control-label">设备类别：</label>
					<div class="controls">
						<select name="deviceType" id="deviceType" style="width: 181px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div>
					<label class="control-label">设备名称：</label>
					<div class="controls">
						<select name="deviceName" id="deviceName" style="width: 181px;">
							<option value="">请选择设备类别</option>
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
			<div id="grid"></div>
		</fieldset>
	</div>
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

	var addDialog;// 新增弹出框
	var editDialog;// 修改弹出框
	
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
		
	}
	
	function initDateType() {//设备类别
		var selectName= document.getElementById('deviceName');
		selectName.setAttribute("disabled", true);
        deviceConfig_type.listData("#searchForm #deviceType");
	}
	
	var selectType = document.getElementById('deviceType');
	//为option设置点击事件
	selectType.onchange = function(){
			
		if($("#deviceType").val()==""){
			
			var selectName= document.getElementById('deviceName');
			selectName.setAttribute("disabled", true);
			selectName.options[0] = new Option("请选择设备类别","");
			selectName.options[0].selected = true;
			return;
			
		}else if($("#deviceType").val()!=""){
			
			var selectName = document.getElementById('deviceName');
			selectName.removeAttribute("disabled");
			//将select中的option全部清除
			$("#deviceName option").remove();
			var typeId = $("#deviceType").val();
			//通过设备类别查询设备
			$.post(contextPath + 'deviceNormConfigAction/getDeivceConfigByTypeId.cn',
					{
						typeId : typeId
					},
					function(data,status){
						if(status){
							
							var selectName = document.getElementById('deviceName');
							
							selectName.options[0] = new Option("请选择","");
							
							for(var i = 0 ; i < data.length ; i++){
							
								var s = data[i].name;
								
								var id = data[i].id;
								
								selectName.options[i+1] = new Option(s,id);
								
							}
							
						}else{
// 							console.log("error");
						}
					},'json');
			
		}
		
	};
	
	
	function searchData() {//初始化页面方法
		pageNum = store.get("start");
		if(store){
			store.load({
				start : 0 //从第一页开始
			});
		}
	}
	
	function searchBtnClick() {//查询方法，重新加载列表数据源
		if(store){
			store.load({
				name : $('#searchForm #deviceName').val(),
				type : $('#searchForm #deviceType').val(),
				start : pageNum //从第一页开始
			});
		}
	}
	
	$("#btnSearch").click(function(){//点击查询按钮
		searchBtnClick();
		return false;
	});
		
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,GB){
		
		var alert = BUI.Message.Alert;//使用bui的消息提示框
		
		/*表格内容*/
		var Store = Data.Store;
		/*表格列设置*/
		var columns = [
			{
				title:'设备类别',
				dataIndex:'deviceName',
				width:'25%',
				renderer: function(value) {
					return deviceConfig_type.typeName(value.deviceCategory);
				}
			},
			{
				title:'设备名称',
				dataIndex:'deviceName',
				width:'25%',
				renderer: function(value) {
					return value.name;
				}
			},
			{
				title:'指标值',
				dataIndex:'normValue',
				width:'10%'
			},
			{
				title:'备注',
				dataIndex:'remark',
				width:'40%',
				renderer: function(value) {
					return value==null ? "": value;
				}
			}
		];
			
		//数据库取出路局管理数据	
		store = new Store({
			url : contextPath + "deviceNormConfigAction/getDeviceNormConfig.cn",
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
			idField : 'id',
			tbar : {
				items : [{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-plus"></i>新增',
	                  listeners : {
	                    'click' : function(){
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
	                  listeners : {
	                    'click' : function(){
	                    	var selection = grid.getSelection();
							if(selection.length==1){
								var editDialog = editDialogCreate(selection[0].id);
								editDialog.show();
								editDialog.get("loader").load();
							}else if(selection.length>1){
								commonFailure("只能选择一条需修改的数据！");
								return ;
							}else{
								commonFailure("请选择一条需修改的数据！");
								return ;
							}
	                    }
	                  }
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-remove"></i>批量删除',
	                  listeners : {
	                    'click' : function(){
	                    	var selections = grid.getSelection();
							if(selections.length!=0){
								deleteData(selections);
							}else{
								commonFailure("请选择要删除的数据！");
								return ;
							}
	                    }
	                  }
	                },{
						xclass : 'bar-item-text',
						text : errorMsgHtml + sucMsgHtml
				}]
			},
			bbar : {pagingBar : true},
			plugins :  [
// 			            	Grid.Plugins.AutoFit,//自适应宽度插件
				           Grid.Plugins.CheckSelection, //多选框插件
				           Grid.Plugins.RowNumber //列序号插件
				           ],
			store : store
		});
		grid.render();
		
		readyInit();
		
		//新增应急备品指标
       function addDialogCreate(){
    	   addDialog = new Overlay.Dialog({
    		   title : '新增备品指标',
   			   width : 600,
   			   height : 184,
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
   				   elCls : 'button btn-save',
   				   handler :function(){
   					   if(!addForm.isValid()) {
   						   return ;
   					   }
						//执行提交到数据库的方法
						$.ajax({
							url : contextPath + "deviceNormConfigAction/addDeviceNormConfig.cn",
							type : "post",
							data:{
								"name" : $("#addForm #name").val(),
								"type" : $("#addForm #type").val(),
								"normValue" : $("#addForm #normValue").val(),
								"remark" : $("#addForm #remark").val()
							},
							success : function(data,status){
								if(status){
									commonSuccess("新增成功！");
									store.load({
										start : 0 ,//从第一页开始
										limit : 10
									});
								}else{
									commonFailure("新增失败！");
								}
							}
						});
						dialogClose(addDialog);
					}
				}, {
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(addDialog);
					}
				}],
				loader : {
					url : contextPath + 'views/deviceNormConfig/deviceNormConfigAdd.jsp',//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
    	   });
    	   return addDialog;
		}
		
		//修改应急备品指标
       function editDialogCreate(id){
			editDialog = new Overlay.Dialog({
				title : "修改备品指标",
				width : 600,
				height : 183,
				closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
	   			mask : true,//非模态弹出框
	   			bodyStyle : {padding : 0},
	   			listeners : {
	   				closing : function(){//关闭窗口时刷新列表
	   				   store.load();
	   				}
	   			},
   				buttons : [ {
					text : '修改',
					elCls : 'button btn-save',
					handler :function(){
						if(!updateForm.isValid()) {
							return ;
						}
						//执行提交到数据库的方法
						$.ajax({
							url : contextPath + "deviceNormConfigAction/updateDeviceNormConfig.cn",
							type : "post",
							data:{
								"id" : id,
								"normValue" : $("#updateForm #normValue").val(),
								"remark" : $("#updateForm #remark").val()
							},
							success : function(data,status){
								if(status){
									commonSuccess("修改成功！");
									store.load();
								}else{
									commonFailure("修改失败！");
								}
							}
						});
						dialogClose(editDialog);
						}
					}, {
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(editDialog);
					}
				}],
				loader : {
					url : contextPath + 'views/deviceNormConfig/deviceNormConfigUpdate.jsp?id=' + id,//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
			});
			return editDialog;
		}
			
        //删除
    	function deleteData(selections) {
    		var msg = '您确定要删除吗?<br/>';
    		BUI.Message.Confirm(msg,function(){
    			var ids = "";
    			for(var i = 0;i < selections.length;i++){
    				ids = ids + "," + selections[i].id;
    			}
    			//删除操作
    			$.ajax({
					url : contextPath + "deviceNormConfigAction/deleteDeviceNormConfigs.cn",
					type : "post",
					data:{
						jsonIds : ids.substring(1, ids.length)
					},
					success : function(data,status){
						if(status){
							commonSuccess("删除成功！");
			    			store.load();
						}else{
							commonFailure("删除失败！");
						}
					}
    			});
    		},
    		'question');
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
});
</script>
</body>
</html>