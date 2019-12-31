<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GSM-R报表</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style>
#grid .bui-grid-row{
 	height: 29px;
}
</style>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">年份：</label>
						<div class="controls">
		            		<select name="year" id="year" style="width:181px;" data-rules="{select:0}">
		            			<option value="2012">2012年</option>
		            			<option value="2013">2013年</option>
		            			<option value="2014">2014年</option>
		            			<option value="2015">2015年</option>
		            			<option value="2016">2016年</option>
		            			<option value="2017">2017年</option>
		            			<option value="2018">2018年</option>
		            			<option value="2019">2019年</option>
		            			<option value="2020">2020年</option>
		            			<option value="2021">2021年</option>
		            			<option value="2022">2022年</option>
		            			<option value="2019">2023年</option>
		            			<option value="2020">2024年</option>
		            			<option value="2021">2025年</option>
		            			<option value="2022">2026年</option>
		            		</select>
		            	</div>
					</div>
					<div class="control-group span8">
						<div class="controls">
		            		<select name="month" id="month" style="width:181px;"data-rules="{select:0}">
			            			<option value="1">1月</option>
			            			<option value="2">2月</option>
			            			<option value="3">3月</option>
			            			<option value="4">4月</option>
			            			<option value="5">5月</option>
			            			<option value="6">6月</option>
			            			<option value="7">7月</option>
			            			<option value="8">8月</option>
			            			<option value="9">9月</option>
			            			<option value="10">10月</option>
			            			<option value="11">11月</option>
			            			<option value="12">12月</option>
		            		</select>
		            	</div>
					</div>
					<div style="float:right;margin-right: 100px">
						<button type="button" id="btnSearch" class="button button-primary">查询</button>
					</div>
			</div>
		</fieldset>
	</form>
	<div style="overflow-x: auto;overflow-y: hidden;">
		<fieldset>
			<legend>列表</legend>
				<a id="expExcel" style="display: none;"></a>
				<div id="grid" ></div>
			<input type="hidden" id="SysYear" value="${pageScope.now.year+1900}" />
			<input type="hidden" id="SysMonth" value="${pageScope.now.month+1}" />
		</fieldset>
	</div>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/emergency/tableExportToExcel.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var perId = "<%=perId%>";
	
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	
	var store,grid;// 列表及数据源声明
	
	var year;
	var month;
	var areaArr;//根据时间查询的所有线路
	var railLineId;//线路id
	var railLineName;//线路名称
	
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
		setGridHeight();
	}
	
	function setGridHeight(){
		var windownHeight = $(window).height();
		var searchHeight = $('#searchForm').height();
		grid.set('height',windownHeight - searchHeight-74);
	}
	
	//根据时间查询的所有线路，存在全局变量areaArr中
	function getRailLineByYearAndMonth(){
		$.ajax({//发送请求，保存数据
			url:contextPath + 'GSMRAction/getRailLineByYearAndMonth.cn',
			async: false,//同步
			type:'post',
			data:{year : year , month : month},
			dataType:'json',
			success:function(result,status){
// 				console.log(result);
				areaArr=result;
			},
			error:function(){alert('加载异常！');}
		});
	}
	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,GB){
		
		var alert = BUI.Message.Alert;//使用bui的消息提示框
		
// 		Form.Rules.add({
// 		    name : 'select',  //规则名称
// 		    msg : '请选择',//默认显示的错误信息
// 		    validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
// 		      if(value==baseValue){
// 		        return formatMsg;
// 		      }
// 		    }
// 		});
		
// 		$("#year").val("");
// 		$("#month").val("");
		$("#year").val($('#SysYear').val());
		$("#month").val($('#SysMonth').val());
		
		/*表格列设置*/
		var columns = [
			{
				title:'',
				dataIndex:'num',
				elCls : 'center',
				width:'41'
			},
			{
				title:'项目',
				dataIndex:'norm',
				elCls : 'center',
				width:'300'
			},
			{
				title:'标准',
				dataIndex:'normValue',
				elCls : 'center',
				width:'200'
			}
		];
		/**点击查询按钮*/
		$("#btnSearch").click(function(){
			 loadData();
		});
		
		function loadData(){
			if(grid){
				grid.remove(true);//删除原表格
			}
			year = $("#year").val();
			month = $("#month").val();
			
			getRailLineByYearAndMonth();
			
			//根据返回的线路动态增删列(改变全局变量columns)
			changeColumns();
			//创建列分组插件
			var col = areaArr.length;
			if(areaArr.length==0){
				col = 3;
			}else{
				col = 3+areaArr.length-1;
			}
			var colGroup = new Grid.Plugins.ColumnGroup({
		           groups : [{
		             title : '昆明铁路局',
		             from : 3,
		             to : col
		           }]
		    });
			/*表格内容*/
			var Store = Data.Store;
		
			//数据库取出数据
			store = new Store({
				url : contextPath + "GSMRAction/getAllGSMRStatistics.cn" ,
				pageSize : 100,
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
				listeners : {
					afterRenderUI : function(ev) {
						if(areaArr != null && areaArr.length >3) {
							$(".bui-grid-table .bui-grid-column-group .bui-grid-db-hd .bui-grid-hd-inner").css("height", "50px");
							$(".bui-grid-table tr:last-of-type .bui-grid-hd-inner").css("height", "25px");
						}
					}
				},
				tbar : {
					items : [{
		                  btnCls : 'button button-small',
		                  text : '<i class="icon-download"></i>导出EXCEL',
		                  listeners : {
		                    'click' : function(){
		                    	exportXls();
		                    }
		                  }
		                },{
								xclass : 'bar-item-text',
								text : errorMsgHtml + sucMsgHtml
						}]
					},
					plugins : [colGroup,
					           ],
					store : store
			});
	
			grid.render();
			setGridHeight();
			store.load({year:year,month:month});
			
			readyInit();
		}
		
		loadData();
		
		//改变原表格列设置，根据返回的线路动态增删列,并进行列分组
		function changeColumns(){
			//删除第4列（下标为3）及以后的所有列
			for(var i=columns.length-1;i>=3;i--){
				columns.pop();
			}
			if(areaArr.length==0){
				columns.push({
					   title : '',
					   dataIndex :'',
					   elCls : 'center'
				});
			}else{
				for(var i in areaArr){//根据返回值数量循环添加列
						var title=areaArr[i].name;
				   		var dataIndex=areaArr[i].id;
				   		columns.push({
						   title : title,
						   dataIndex :dataIndex,
						   width:150,
						   elCls : 'left'
						});
				}
			}
		}
		
		//导出本页数据
    	function exportXls(){
    		//表头
    		var thead=$('#grid .bui-grid-group-header .bui-grid-table').html();
    		thead = thead.replace(new RegExp('<span class="bui-grid-sort-icon">&nbsp;</span>','g'),"");
    		thead = thead.replace(new RegExp('<th class="bui-grid-hd-empty bui-grid-hd bui-grid-db-hd" aria-disabled="false" rowspan="2" style="width: auto;"><div class="bui-grid-hd-inner" style="height: 25px;"></div></th>','g'),"");
    		//表体内容
    		var tbody=$('#grid .bui-grid-body .bui-grid-table').html();
    		tbody = tbody.replace(new RegExp('<td class="bui-grid-cell bui-grid-cell-empty">&nbsp;</td>','g'),"");
    		
    		var tableContent='<table border="1" cellspacing="0" cellpadding="0"> '
    								+thead
    								+tbody
    								+'</table>';
    								
    		var fileName="GSMR统计数据";//文件名
    		var sheetName="GSMR"; 
    		tableExportToExcel("expExcel",fileName, sheetName,tableContent);
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