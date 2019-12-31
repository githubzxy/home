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
<title>GSMR基础信息</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style>
.mask {
	z-index: 1100 !important;
}
#grid .bui-grid-row{
 	height: 29px;
}
</style>
</head>
<body style="overflow: hidden;">
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
	var pageSize = 15;//每页显示条数
	
	var store,grid;// 列表及数据源声明

	var uploadDialog;// 导入弹出框
	var showDialog;// 详细信息弹出框
	
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
	}
	
	function searchData() {//初始化页面方法
		pageNum = store.get("start");
		if(store){
			store.load({
				start : 0 //从第一页开始
			});
		}
	}
		
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,GB){
		var alert = BUI.Message.Alert;//使用bui的消息提示框
		
		/*表格内容*/
		var Store = Data.Store;
		/*表格列设置*/
		var columns = [
			{
				title:'导入年月',
				dataIndex:'yearMonth',
				width:'25%',
				renderer: function(value) {
					return value.substring(0,7);
				}
			},
			{
				title:'铁路线',
				dataIndex:'railLine',
				width:'25%',
				renderer: function(value) {
					var name;
						$.ajax({
						url : contextPath + "GSMRAction/getRailLineName.cn",
						type : "post",
						async : false,
						data:{
							"id" : value
						},
						success : function(data,status){
							if(data.length>0){
								name = data
							}else{
								name = "";
							}
						}
					});
					return name;
				}
			},
			{
				title:'创建人',
				dataIndex:'createUser',
				width:'25%',
				renderer: function(value) {
					if(value!=null){
						return value.name;
					}else{
						return "";
					}
				}
			},
			{
				title:'创建时间',
				dataIndex:'createDate',
				width:'25%',
				renderer: Grid.Format.datetimeRenderer
			}
		];
			
		//数据库取出路局管理数据	
		store = new Store({
			url : contextPath + "GSMRAction/getGSMRBasicData.cn",
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
	                  text : '<i class="icon-upload"></i>导入',
	                  listeners : {
	                    'click' : function(){
	                    	uploadDialog = uploadDialogCreate();
	                    	uploadDialog.show();
	                    	uploadDialog.get('loader').load();
	                    }
	                  }
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-list-alt"></i>详情',
	                  listeners : {
	                    'click' : function(){
	                    	var selection = grid.getSelection();
							if(selection.length==1){
								var showDialog = showDialogCreate(selection[0].id);
								showDialog.show();
								showDialog.get("loader").load();
								return false;
							}else if(selection.length>1){
								commonFailure("只能选择一条数据查看！");
								return ;
							}else{
								commonFailure("请选择一条数据查看！");
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
			plugins : [
// 			           Grid.Plugins.AutoFit,//自适应宽度插件
		            	Grid.Plugins.RowNumber//列序号插件
			           ],
			store : store
		});
		grid.render();
		
		readyInit();
		
		//声明对象
		function UploadFileDto(name,path){
			this.name = name;
			this.path = path;
		}
		
		//导入GSM-R
       function uploadDialogCreate(){
    	   uploadDialog = new Overlay.Dialog({
    		   title : '导入GSM-R',
   			   width : 590,
   			   height : 230,
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
   				   text : '导入',
   				   elCls : 'button btn-save',
   				   handler :function(){
						if(!uploadForm.isValid()) {
						 	return ;
						}
						var arr = new Array(); //声明数组,存储数据发往后台
						//获取上传文件的对列
						var fileArray = uploader.get("queue").getItems();
						var uploadPath;
						for(var i in fileArray){
						   	var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
							arr[i] = dto; // 向集合添加对象
							uploadPath = fileArray[i].path;
						};
						//上传文件为空时，出现提示信息
						if(arr.length == 0){
							tooltip("请上传一个GSM-R模板！");
							$(".bui-ext-mask").addClass("mask");
							return ;
						}
						//上传文件个数大于1时，出现提示信息
						if(arr.length > 1){
							tooltip("只能上传一个GSM-R模板！");
							$(".bui-ext-mask").addClass("mask");
							return ;
						}
   						//执行提交到数据库的方法
						$.ajax({
							url : contextPath + "GSMRAction/addGSMRBasicData.cn",
							type : "post",
							data:{
								"railLineName" : $("#uploadForm #railLineName").val(),
								"year" : $("#uploadForm #year").val(),
								"month" : $("#uploadForm #month").val(),
								"url" : uploadPath
							},
							success : function(data,status){
								if(status){
									commonSuccess("导入成功！");
									store.load({
										start : 0 ,//从第一页开始
										limit : 15
									});
								}else{
									commonFailure("导入失败！");
								}
							}
						});
						dialogClose(uploadDialog);
					}
				},{
					text : '取消',
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(uploadDialog);
					}
				}],
				loader : {
					url : contextPath + 'views/GSMR/GSMRBasicDataAdd.jsp',//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
    	   });
    	   return uploadDialog;
		}
		
		//详细信息记录
		function showDialogCreate(id){
		  	   showDialog = new Overlay.Dialog({
				title : "查看详细信息",
				width : 700,
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
					url : contextPath + 'views/GSMR/GSMRBasicDataShow.jsp?id=' + id,//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
		   	   	
			});
			return showDialog;
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
			
        //删除
//     	function deleteData(selections) {
//     		var msg = '您确定要删除吗?<br/>';
//     		BUI.Message.Confirm(msg,function(){
//     			var ids = "";
//     			for(var i = 0;i < selections.length;i++){
//     				ids = ids + "," + selections[i].id;
//     			}
//     			//删除操作
//     			$.ajax({
// 					url : contextPath + ".cn",
// 					type : "post",
// 					data:{
// 						jsonIds : ids.substring(1, ids.length)
// 					},
// 					success : function(data,status){
// 						if(status){
// 							commonSuccess("删除成功！");
// 			    			store.load();
// 						}else{
// 							commonFailure("删除失败！");
// 						}
// 					}
//     			});
//     		},
//     		'question');
//     	}
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