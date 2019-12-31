<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
	String contextPath = request.getContextPath();
	String dateNow = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>备品统计</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
.bui-grid-row{
	height: 29px;
}
</style>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			<div class="row">
				<div class="control-group span24">
					<label class="control-label">所属车间:</label>
					<div class="controls">
						<input type="text" id="workShops" class="input-normal" style="width: 171px;" readonly/>
						<button class="button button-small" type="button" id="clearWorkShop">清除选项</button>
						<input type="hidden" id="workShop" name="workShop">
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
			<a id="expExcel" style="display: none;"></a>
			<div id="grid"></div>
		</fieldset>
	</div>
	
	<form action="/kunmingrinms/sparePartAction/expSpareStatistics.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/emergency/tableExportToExcel.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/unit.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var dateNow='<%=dateNow%>';
	var perId = "<%=perId%>";
	
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	var grid;//列表
	var store;
	var columns;//表格列声明
	var units;//单位集合
	var areaArr;//根据车间id查询的所有工区
	var workShopId;//车间id
	var workShopName;//车间名称
	var dialog;//弹出框（查看所有车间）
	var tree=null;//各个车间选择树


	$('#clearWorkShop').on('click',function (e) {
		$('#workShop').val('');
		$('#workShops').val('');
    })
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
	
// 	//进行高度计算
// 	function setGridHeight(){
// 		var windownHeight = $(window).height();
// 		var searchHeight = $('#searchForm').height();
// 		grid.set('height',windownHeight - searchHeight-45);
// 	}

	function readyInit(){
		var windownHeight = $(window).height();
		var searchHeight = $('#searchForm').height();
		grid.set('height',windownHeight - searchHeight - 45);
		units = getUnitData();
	}
	
	//根据车间查询包含的所有工区，存在全局变量areaArr中
	function getWorkAreasByParentId(){
		$.ajax({//发送请求，保存数据
			url:contextPath + 'organization/getOrgChildrenById.cn',
			async: false,//同步
			type:'post',
			data:{id : workShopId},
			dataType:'json',
			success:function(result,status){
				areaArr=result;
			},
			error:function(){alert('加载工区数据异常！');}
		});
	}
	
	function initOrgTree(result){
		var store;
		var picker;
		//初始化树
		BUI.use(['bui/extensions/treepicker','bui/tree','bui/data'],function(TreePicker,Tree,Data){
			store = new Data.TreeStore({
				root : {
					id : gztxd_id,
					text : gztxd_name
				},
				url:contextPath + 'organization/getAllWorkshop.cn',
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				map : {	// 节点映射
					'id' : 'id',
					'name' : 'text'	// 节点显示文本
				},
				autoLoad : true/**/
			});
			tree = new Tree.TreeList({
				store : store,
				height : 320,
				showRoot : true,
				showLine : true //显示连接线
			});
			picker = new TreePicker({
				valueField  : '#workShop',//用于装选中的id的隐藏域，每次修改都会更新这个隐藏域的值
				trigger : '#workShops',  
				autoRender : true,
				width:300,  //指定宽度
				children : [tree] ,//配置picker内的列表,
				listeners : {
				       selectedchange : function(ev){
				    	   workShopName = ev.text;
				       }
				},
			});
		});
	}
			
	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select', 'mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,Select, GB){
		initWorkshop();
		/**初始化下拉选开始*/	
		function initWorkshop(){
			//查询所有车间并初始化
			$.post(contextPath + 'organization/getAllWorkshop.cn', 
					function(result,status){
		   				if(status){//成功
		   					initOrgTree(result);
						}
				},'json');
		}
		
		/**初始化下拉选结束*/
		
	/*定义表格列*/
	columns = [{
			title:'设备类别',
			dataIndex:'speciality',
			elCls : 'center',
			width:120,
			renderer:function(value){
				return emergency_speciality.typeName(value);
			}
		},{
			title:'设备属性',
			dataIndex:'deviceProperties',
			width:120,
			elCls : 'center'
		},{
			title:'设备名称',
			dataIndex:'sparePartName',
			width:120,
			elCls : 'center'
		},{
			title:'规格型号',
			dataIndex:'sparePartModel',
			width:120,
			elCls : 'center'
		},{
			title:'单位',
			dataIndex:'unit',
			elCls : 'center',
			width:50,
			renderer:function(value){
// 				return emergency_unit.typeName(value);
				return unit_.unitName(units,value);
			}
		},{
			title:'厂家',
			dataIndex:'factory',
			width:120,
			elCls : 'center'
		},{
			title:'存放地点',
			dataIndex:'depositLocation',
			width:120,
			elCls : 'center'
		}];
		
		/**点击查询按钮*/
		$("#btnSearch").click(function(){
			 loadData();
		});
		
		
		function loadData(){
			if(grid){
				grid.remove(true);//删除原表格
			}
			//获取参数
			workShopId=$("#workShop").val();//车间id
// 			workShopName=$("#workShop option:selected").text();//车间名称
			
			//根据车间id查询所有工区
			getWorkAreasByParentId();
// 			console.log(areaArr);
			//根据返回的工区动态增删列(改变全局变量columns)
			changeColumns();
			//创建列分组插件
			var colGroup = new Grid.Plugins.ColumnGroup({
		           groups : [{
		             title : '地点及数量',
		             from : 8,
		             to : 8+areaArr.length
		           }]
		        });
			
			store = new Data.Store({
				url : contextPath+'sparePartAction/getAreaSpareStatisticsByShop.cn',
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				pageSize : 10
			});
			
			//新建表格
			grid=new GB({
				render : '#grid',
				columns : columns.slice(0),
				store : store,
				forceFit : true,
				idField : 'id',
				perId : perId,
				contextPath : contextPath,
				listeners : {
					afterRenderUI : function(ev) {
						if(areaArr != null && areaArr.length >5) {
							$(".bui-grid-table .bui-grid-column-group .bui-grid-db-hd .bui-grid-hd-inner").css("height", "47px");
							$(".bui-grid-table tr:last-of-type .bui-grid-hd-inner").css("height", "45px");
						}
					}
				},
				tbar : {
					items : [{
		                  btnCls : 'button button-small',
		                  text : '<i class="icon-zoom-in"></i>查看所有车间',
		                  listeners : { 'click' : function(){
		                	  dialog=dialogCreateByShop();
		                	  dialog.show();
		                	  dialog.get('loader').load();
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
				plugins : [colGroup,Grid.Plugins.RowNumber] // 插件形式引入列分组
	          });
			grid.render();
// 			setGridHeight();
			readyInit();
			
			//加载数据
			store.load({workShopId : workShopId});
			
		}
		
		//改变原表格列设置，根据返回的工区动态增删列,并进行列分组
		function changeColumns(){
				//删除第五列及以后的所有列
				for(var i=columns.length-1;i>=7;i--){
					columns.pop();
				}
				columns.push({//先添加一列，车间列
					   title : workShopName,
					   dataIndex :workShopId,
					   elCls : 'center'
				});
				for(var i in areaArr){//根据返回值数量循环添加列
					var title=areaArr[i].name;
			   		var dataIndex=areaArr[i].id;
			   		columns.push({
					   title : title,
					   dataIndex :dataIndex,
					   elCls : 'center'
					});
				}
			   	columns.push({//最后再添加一列
					   title : '小计',
					   dataIndex :'sum',
					   width : 70,
					   elCls : 'center',
				});
		}
		
		 	//查看所有车间备品详情
	       function dialogCreateByShop(){
				dialog = new Overlay.Dialog({
					title : '按车间统计设备详情',
					width : $(window).width(),
					height : 500,
					closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
		   			mask : true,//非模态弹出框
		   			bodyStyle : {padding : 0},
		   			listeners : {
		   				   closing : function(){//关闭窗口时刷新列表
								initWorkshop();
								store.load();
		   				   }
		   			},
	   				buttons : [ {
						text : '导出EXCEL',
						elCls : 'button btn-save',
						handler :function(){
							window.location.href=contextPath+'sparePartAction/exportShop.cn';
							
// 							//表头
// 							var thead=$('#gridShop .bui-grid-group-header .bui-grid-table').html();
// 							thead = thead.replace(new RegExp('<span class="bui-grid-sort-icon">&nbsp;</span>','g'),"");
// 							thead = thead.replace(new RegExp('<th class="bui-grid-hd-empty bui-grid-hd bui-grid-db-hd" aria-disabled="false" rowspan="2"><div class="bui-grid-hd-inner" style="height: 45px;"></div></th>','g'),"");
// 							//表体内容
// 							var tbody=$('#gridShop .bui-grid-body .bui-grid-table').html();
// 							tbody = tbody.replace(new RegExp('<td class="bui-grid-cell bui-grid-cell-empty">&nbsp;</td>','g'),"");
							
// 							var tableContent='<table border="1" cellspacing="0" cellpadding="0"> '
// 													+thead
// 													+tbody
// 													+'</table>';
// 							var fileName="备品统计(所有车间)"+dateNow;//文件名
// 							var sheetName="应急备品";
// 							tableExportToExcel("expExcelOfShop",fileName, sheetName,tableContent);
							}
						}, {
							text : '关闭',
							elCls : 'button btn-close',
							handler : function() {
								dialogClose(dialog);
						}
					}],
					loader : {
						url : contextPath +  'views/emergency/spareStatisticsOfAllShop.jsp',
						autoLoad : false,//不在弹出框组件初始化时自动加裁
						lazyLoad : false,//不进行延迟加裁
						dataType : 'html'//加载内容类型
					}
		    	   	
				});
				return dialog;
			}
		
        /**
    	 * 关闭弹出框并解除引用
    	 * param:d 待关闭的弹出框
    	 */
    	function dialogClose(d){
    		d.close();
    		d = null;
    	}
			
	//加载数据
    loadData();
    
	/*BUI结束*/	
	});
	
	//导出全部数据
	function exportXls(){
	    var workShop = $('#workShop').val();
	    if(workShop){
            window.location.href=contextPath+'sparePartAction/exportArea.cn?workShopId='+workShop;
		}else{
            window.location.href=contextPath+'sparePartAction/exportShop.cn'
		}
	}
</script>
</body>
</html>