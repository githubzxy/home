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
<title>普铁有线统计</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
  .bui-select-list{
    overflow: auto;
    overflow-x: hidden;
    max-height: 150px;
    _height : 50px;
  }
  #grid .bui-grid-row{
	height: 29px;
}
.x-grid-rownumber{
		color : black;
	}
</style>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			  <div class="row">
				<div class="control-group span10">
					<label class="control-label">设备名称:</label>
					<div class="controls">
						<select name="deviceName" id="deviceName" style="width: 181px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="control-group span10">
					<label class="control-label">设备属性:</label>
					<div class="controls">
						<select name="deviceProperties" id="deviceProperties" style="width: 181px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="control-group span10">
					<label class="control-label">所属车间:</label>
					<div class="controls">
						<input type="text" id="workShops" class="input-normal" style="width: 171px;" />
						<input type="hidden" id="workShop" name="workShop">
					</div>
				</div>
				<div class="control-group span10">
					<label class="control-label">所属状态:</label>
					<div class="controls" >
						<select name=status id="status" style="width: 181px;">
							<option value="">请选择</option>
							<option value="1">达标</option>
							<option value="2">未达标</option>
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
	
	<form action="/kunmingrinms/sparePartAction/expSpareAndNorm.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var perId = "<%=perId%>";
	
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	
	var store,grid;// 列表及数据源声明
	
	var recordSelected;//选中的一条记录
	
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
// 	$(document).ready(function () {
// 		var windownHeight = $(window).height();
// 		var searchHeight = $('#searchForm').height();
// 		grid.set('height',windownHeight - searchHeight-45);
// 		searchData();
// // 		store.load({param : JSON.stringify(getParam())});
// 	});
	
	function readyInit(){
		var windownHeight = $(window).height();
		var searchHeight = $('#searchForm').height();
		grid.set('height',windownHeight - searchHeight - 45);
		
		searchData();
	}
	
	function searchData() {//初始化页面方法
		pageNum = store.get("start");
		if(store){
			store.load({
				speciality : speciality,
				start : pageNum //从第一页开始
			});
		}
	}
	

	/**初始化下拉选开始*/
	emergency_attribute.listData("#deviceProperties");//初始化设备属性下拉选
	//根据设备类别查询设备名称并初始化
	var speciality=emergency_speciality.universalWireEmergency;//设备类别为”普铁有线应急设备“
 	$.post(contextPath + 'deviceNameAction/getDeviceNamesByDeviceCategory.cn', 
		{deviceCategory : speciality},
		function(result,status){
			if(status){//成功
// 				console.log(result);
				for(var i in result){
					$("#deviceName").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化设备名称下拉选
				}
			}
		},'json');
	
 	//查询所有车间并初始化
	$.post(contextPath + 'organization/getAllWorkshop.cn', 
			function(result,status){
   				if(status){//成功
   					initOrgTree(result);
				}
		},'json');
	
	function initOrgTree(result){
		var store;
		var tree;
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
				checkType : 'all',
				height : 320,
				showRoot : true,
				showLine : true //显示连接线
			});
			picker = new TreePicker({
				valueField  : '#workShop',//用于装选中的id的隐藏域，每次修改都会更新这个隐藏域的值
				trigger : '#workShops',  
				selectStatus : 'checked',//设置勾选作为状态改变的事件
				autoRender : true,
				width:300,  //指定宽度
				children : [tree] //配置picker内的列表
			});
		});

	}
	
	
/**初始化下拉选结束*/
	
	
	
	//获取查询条件参数
	function getParam(){
		return {
			speciality : speciality,
			deviceAttr :  $("#deviceAttr").val(),
			deviceNameId : $("#deviceName").val(),
			workShopId : $("#workShop").val(),
			status : $("#status").val(),
			deviceProperties:$("#deviceProperties").val()
		};
	}
	
	$("#btnSearch").click(function(){
// 		console.log(getParam());
		if(store){
			store.load({
// 				param : JSON.stringify(getParam()),
				deviceAttr :  $("#deviceAttr").val(),
				speciality : speciality,
				deviceNameId : $("#deviceName").val(),
				workShopId : $("#workShop").val(),
				deviceProperties:$("#deviceProperties").val(),
				status : $("#status").val(),
				start : pageNum, //从第一页开始
// 				pageSize : 10
			});
		}
	});
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select', 'mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,Select, GB){
	  	
		/*表格列设置*/
		var columns = [{
				title:'设备类别',
				dataIndex:'speciality',
				elCls : 'center',
				width:'20%',
				renderer:function(value){
					return emergency_speciality.typeName(value);
				}
			},{
				title:'设备属性',
				dataIndex:'deviceProperties',
				elCls : 'center',
				width:'20%'
			},{
				title:'设备名称',
				dataIndex:'deviceName',
				elCls : 'center',
				width:'20%'
			},{
				title:'所属车间',
				dataIndex:'workShop',
				elCls : 'center',
				width:'20%'
			},{
				title:'现有量',
				dataIndex:'amount',
				elCls : 'center',
				width:'20%'
			},{
				title:'标准量',
				dataIndex:'normValue',
				elCls : 'center',
				width:'20%'
			},{
				title:'厂家',
				dataIndex:'factory',
				elCls : 'center',
				width:'20%'
			},{
				title:'存放地点',
				dataIndex:'depositLocation',
				elCls : 'center',
				width:'20%'
			},{
				title:'是否达标',
				dataIndex:'status',
				elCls : 'center',
				width:'20%',
				renderer:function(value){
					return convertStatusToChinese(value);
				}
			}];
		
		store = new Data.Store({
			url : contextPath+'sparePartAction/getSpareAndNormByDto.cn',
			proxy : {
				method : 'post',
				dataType : 'json'
			},
			pageSize : 10
		});
			
		/*表格设置*/
		grid = new GB({
			render : '#grid',
			width : '100%',//如果表格使用百分比，这个属性一定要设置
			columns : columns,
			idField : 'id',
			perId : perId,
			contextPath : contextPath,
			itemStatusFields : {
				read : 'not_standard', //如果isOverTime : true,则附加 bui-grid-row-read 样式（红色字体）
			},
			tbar : {
				items : [{
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
			plugins : [Grid.Plugins.RowNumber],
			store : store
		});
		grid.render();
		readyInit();
        
		//导出全部数据
		function exportXls(){
			$("#exportXlsJson").val("");//清空值
// 			var obj = {
// 					speciality : emergency_speciality.typeName(speciality),
// 					deviceNameId : $("#deviceName").val(),
// 					workShopId : $("#workShop").val(),
// 					status : convertStatusToChinese($("#status").val())
// 			};
			
			$("#exportXlsJson").val(JSON.stringify(getParam()));
			$("#exportForm").submit();
		}
        
		//将状态（是否达标）转化为中文
		function convertStatusToChinese(value){
				var standard='1';//达标
				var not_standard='2';//未达标
				switch(value){
				case standard:
					return '达标';
				case not_standard:
					return '未达标';
				}
				return null;
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