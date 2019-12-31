<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>按车间统计设备详情</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
</head>
<body style="overflow: hidden;">
	<div >
		<a id="expExcelOfShop" style="display: none;"></a>
		<div id="gridShop" style="overflow-x: auto;overflow-y: hidden;"></div>
	</div>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	
	//var gridShop;//列表
	//var columnShop;//表格列声明
	var shopArr;//所有车间
	var units = getUnitData();
	
	//查询所有车间，存储在全局变量shopArr中
	$.ajax({//发送请求，保存数据(必须是同步请求)
		url:contextPath + 'organization/getAllWorkshop.cn', 
		type:'post',
		dataType:'json',
		async: false,//同步
		success:function(result,status){
			if(status){
				shopArr=result;
			}
		},
		error:function(){alert('加载车间数据异常！');}
	});
	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select'],function(Grid,Data,Calendar, Form,Overlay,Select){
	var gridShop;
	//进行高度计算
	function setGridHeight(){
		var dialogHeight = dialog.get("height");
		$("#gridShop").height(dialogHeight -56);
		gridShop.set('height',dialogHeight -70);
	}
	/*定义表格列*/
	var columnShop = [{
			title:'设备类别',
			dataIndex:'speciality',
			width:200,
			elCls : 'center',
			elStyle : {'line-height':'3.5'},
			renderer:function(value){
				return emergency_speciality.typeName(value);
			}
		},{
			title:'设备名称',
			dataIndex:'sparePartName',
			width:200,
			elCls : 'center',
			elStyle : {'line-height':'3.5'},
		},{
			title:'设备属性',
			dataIndex:'deviceProperties',
			width:200,
			elCls : 'center',
			elStyle : {'line-height':'3.5'},
		},{
			title:'厂家',
			dataIndex:'factory',
			width:200,
			elCls : 'center',
			elStyle : {'line-height':'3.5'},
		},{
			title:'存放地点',
			dataIndex:'depositLocation',
			width:200,
			elCls : 'center',
			elStyle : {'line-height':'3.5'},
		},{
			title:'规格型号',
			dataIndex:'sparePartModel',
			width:200,
			elCls : 'center',
			elStyle : {'line-height':'3.5'},
		},{
			title:'单位',
			dataIndex:'unit',
			width:75,
			elCls : 'center',
			elStyle : {'line-height':'3.5'},
			renderer:function(value){
// 				return emergency_unit.typeName(value);
				return unit_.unitName(units,value);
			}
		}];
		
		function loadData(){
			if(gridShop){
				gridShop.remove(true);//删除原表格
			}
			//根据车间数量动态增删列(改变全局变量columns)
			changeColumnShop();
			//创建列分组插件
			var colGroup = new Grid.Plugins.ColumnGroup({
		           groups : [{
		             title : '地点及数量',
		             from : 8,
		             to : 8+shopArr.length-1
		           }]
		        });
			
			//定义store
			var storeShop = new Data.Store({
				url : contextPath+'sparePartAction/getShopSpareStatistics.cn',
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				pageSize : 15
			});
			
			//新建表格
			 gridShop=new Grid.Grid({
				render : '#gridShop',
				columns : columnShop.slice(0),
				store : storeShop,
				width:3100,
				forceFit : true,
				idField : 'id',
				listeners : {
					afterRenderUI : function(ev) {//渲染完成后，改变表头样式（增加标题行高度）
						$("#gridShop .bui-grid-table .bui-grid-column-group .bui-grid-db-hd .bui-grid-hd-inner").css("height", "47px");
						$("#gridShop .bui-grid-table tr:last-of-type .bui-grid-hd-inner").css("height", "45px");
					}
				},
				bbar : {pagingBar : true},
				plugins : [colGroup,Grid.Plugins.RowNumber] // 插件形式引入列分组
	          });
			gridShop.render();
			setGridHeight();
			
			//加载数据
			storeShop.load();
			
		}
		
		//改变原表格列设置，根据车间数动态增删列,并进行列分组
		function changeColumnShop(){
				//删除第五列及以后的所有列
				for(var i=columnShop.length-1;i>=7;i--){
					columnShop.pop();
				}
				//根据返回值数量循环添加列
				for(var i in shopArr){
					var title=shopArr[i].name;
			   		var dataIndex=shopArr[i].id;
			   		columnShop.push({
					   title : title,
					   dataIndex :dataIndex,
					   width : 100,
					   elCls : 'center'
					});
				}
				columnShop.push({//最后再添加一列
					   title : '小计',
					   dataIndex :'sum',
					   width : 130,
					   elCls : 'center',
					   elStyle : {'line-height':'3.5'},
				});
		}
		
		loadData();
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