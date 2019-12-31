<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String perId = request.getParameter("threePerId");
	String orgName = request.getSession().getAttribute("userId").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>应急通信设备及器材</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
<style type="text/css">
 .userMask {
		z-index: 1100 !important;
	}
 .mask {
		z-index: 1110 !important;
	}
 .bui-message .bui-ext-close{
  	   display:none; 
  } 
  
.bui-calendar-panel td a{
	padding:0px;
}

</style>
</head>
<body style="overflow: hidden;">
	<form action="#" class="form-horizontal" id="searchForm">
		<fieldset>
			<legend onclick="hiddenSearch()">查询</legend>
			  <div class="row">
				<div class="control-group span8">
					<label class="control-label">设备类别:</label>
					<div class="controls">
						<select name="speciality" id="speciality" style="width: 181px;">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">设备名称:</label>
					<div class="controls">
<!-- 						<select name="sparePartName" id="sparePartName" style="width: 181px;" disabled="disabled"> -->
<!-- 							<option value="">请选择</option> -->
<!-- 						</select> -->
						<input name="sparePartName" type="text" id="sparePartName" class="input-normal" style="width: 171px;" />
					</div>
				</div>
<!-- 				<div class="control-group span8"> -->
<!-- 					<label class="control-label">规格型号:</label> -->
<!-- 					<div class="controls"> -->
<!-- 						<input type="text" id="sparePartModel" class="input-normal" style="width: 171px;" /> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="control-group span8">
					<label class="control-label">所属车间:</label>
					<div class="controls">
						<input type="text" id="workShops" class="input-normal" style="width: 171px;" />
						<input type="hidden" id="workShop" name="workShop">
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">所属工区:</label>
					<div class="controls" >
						<select name="workArea" id="workArea" style="width: 181px;" disabled="disabled">
							<option value="">请选择</option>
						</select>
					</div>
				</div>
<!-- 				<div class="control-group span8"> -->
<!-- 					<label class="control-label">入库时间:</label> -->
<!-- 					<div class="controls"> -->
<!-- 						<input type="text" id="putInStartTime" name="putInStartTime" class="calendar calendar-time" style="width: 171px;" /> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="control-group span8"> -->
<!-- 				<label class="control-label">至:</label> -->
<!-- 					<div class="controls"> -->
<!-- 						<input type="text" id="putInEndTime" name="putInEndTime" class="calendar calendar-time" style="width: 171px;" /> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">规格型号:</label>
					<div class="controls">
						<input type="text" id="sparePartModel" class="input-normal" style="width: 171px;" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">入库时间:</label>
					<div class="controls">
						<input type="text" id="putInStartTime" name="putInStartTime" class="calendar calendar-time" style="width: 171px;" />
					</div>
				</div>
				<div class="control-group span8">
				<label class="control-label">至:</label>
					<div class="controls">
						<input type="text" id="putInEndTime" name="putInEndTime" class="calendar calendar-time" style="width: 171px;" />
					</div>
				</div>
<!-- 				<div class="control-group span8"> -->
<!-- 					<label class="control-label">所属工区:</label> -->
<!-- 					<div class="controls" > -->
<!-- 						<select name="workArea" id="workArea" style="width: 181px;" disabled="disabled"> -->
<!-- 							<option value="">请选择</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="control-group span8"> -->
<!-- 					<label class="control-label">设备属性:</label> -->
<!-- 					<div class="controls"> -->
<!-- 	     		       	<select name="deviceProperties" id="deviceProperties" style="width:181px;" > -->
<!-- 	     		       	<option value="">请选择</option> -->
<!-- 	            		</select> -->
<!-- 			        </div> -->
<!-- 				</div> -->
<!-- 				<div class="control-group span8"> -->
<!-- 					<label class="control-label">审核状态:</label> -->
<!-- 					<div class="controls"> -->
<!-- 	     		       	<select name="checkStatus" id="checkStatus" style="width: 181px;"> -->
<!-- 	  						<option value="">请选择</option> -->
<!-- 	  						<option value="1">待审核</option> -->
<!-- 	  						<option value="2">审核通过</option> -->
<!-- 	  						<option value="3">审核不通过</option> -->
<!-- 	  					</select> -->
<!-- 			        </div> -->
<!-- 				</div> -->
				<div style="float:right;margin-right: 100px">
					<button type="button" id="btnSearch" class="button button-primary">查询</button>
				</div>
			</div>
		</fieldset>
	</form>
	<div class="search-grid-container"  style="overflow-x:auto; overflow-y:hidden; ">
		<fieldset>
			<legend>列表</legend>
			<div id="grid"></div>
		</fieldset>
	</div>
	
	<form action="/kunmingrinms/sparePartAction/expSparePart.cn" id="exportForm" method="post">
		<input type="hidden" id="exportXlsJson" name="exportXlsJson">
	</form>
	
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/unit.js"></script>
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	
	var perId = "<%=perId%>";
	var orgName = "<%=orgName%>";
	var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
	
	var store,grid;// 列表及数据源声明
	var units;//单位集合
	var addDialog;// 新增备品弹出框
	var inDialog;//备品入库弹出框
	var editDialog;// 修改弹出框
	var outDialog;//出库弹出框
	var moveDialog;//移库弹出框
	var returnFactoryDialog;//返厂弹出框
	var scrapDialog;//报废
	var useSituationDialog;//使用情况弹出框
	
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
// 		store.load({param : JSON.stringify(getParam())});
// 	});
	
	function readyInit(){
		var windownHeight = $(window).height();
		var searchHeight = $('#searchForm').height();
		grid.set('height',windownHeight - searchHeight - 70);
		units = getUnitData();
		store.load({
			speciality : $("#speciality").val(),
// 			deviceNameId : $("#sparePartName").val(),
			platesName : $("#sparePartName").val(),
			sparePartModel : $("#sparePartModel").val(),
			workShopId : $("#workShop").val(),
			workAreaId : $("#workArea").val(),
// 			deviceProperties : $("#deviceProperties").val(),
// 			checkStatus : $("#checkStatus").val(),
			putInEndTime: $("#putInEndTime").val(),
			putInStartTime: $("#putInStartTime").val()
		});
	}
	
	/***初始化设备属性下拉框****/
// 	emergency_attribute.listData("#deviceProperties");
	
	
	/**初始化下拉选开始*/	
// 	emergency_speciality.listData("#speciality");//初始化设备类别下拉选
	emergency_speciality_type.listData("#speciality");//初始化设备类别下拉选
	//设备类别值改变，触发加载设备名称下拉列表
// 	$("#speciality").on("change",function(){
// 		if($('#speciality').val()){
// 			$('#sparePartName').attr("disabled",false);
// 		}else{
// 			$('#sparePartName').attr("disabled",true);
// 		}
// 		$("#sparePartName").find("option[value!='']").remove(); //设备类别值变化，就清除设备名称select的所有option（第一个保留）
// 		var speciality=$("#speciality").find("option:selected").val();
// 		if(speciality!=""){
// 			getsparePartNameBySpeciality(speciality);
// 		}
// 	});

	//根据设备类别查询设备名称
// 	function getsparePartNameBySpeciality(speciality){
// 	 	$.post(contextPath + 'deviceNameAction/getDeviceNamesByDeviceCategory.cn', 
// 			{deviceCategory : speciality},
// 			function(result,status){
// 				if(status){//成功
// // 					console.log(result);
// 					for(var i in result){
// 						$("#sparePartName").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化设备名称下拉选
// 					}
// 				}
// 			},'json');
// 	}
	
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
		BUI.use(['bui/extensions/treepicker','bui/tree','bui/data','bui/calendar'],function(TreePicker,Tree,Data,Calendar){
			
			/**
			 *渲染日历
			 */
		    var calendar = new Calendar.DatePicker({
		         trigger:'.calendar-time',
		         showTime : true,
				 autoRender : true
		    });
			
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
				listeners : {
			       selectedchange : function(ev){
						var w = $('#workShop').val().split(",");
						var value = $('#workShop').val();
						if(w.length==1 && value != ""){
							getWorkAreasByParentId(w[0]);
						}else{
							$("#workArea").find("option[value!='']").remove();
							$('#workArea').attr("disabled",true);
						}
			       }
			    },
				width:300,  //指定宽度
				children : [tree] //配置picker内的列表
			});
			
			
		});

	}
	
	
	//所属车间值改变，触发加载工区下拉列表
	$("#workShop").on("change",function(){
		if($('#workShop').val()){
			$('#workArea').attr("disabled",false);
		}else{
			$('#workArea').attr("disabled",true);
		}
		$("#workArea").find("option[value!='']").remove(); //车间值变化，就清除工区select的所有option（第一个保留）
		var id=$("#workShop").find("option:selected").val();
		if(id!=""){
			getWorkAreasByParentId(id);
		}
		
	});
	
	//查询工区名称并初始化下拉列表
	function getWorkAreasByParentId(id){
// 		console.log(id);
		$.ajax({
			url:contextPath + 'organization/getOrgChildrenById.cn',
			async:false, 
			type:'POST',
			dataType: "json",
			data:{id: id},
			success:function(result,status){
// 				console.log(status);
				if(status=='success'){ //成功
					for(var i in result){
//							console.log(result[i]);
						$('#workArea').attr("disabled",false);
						$("#workArea").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化车间下拉选
					}
				}
			}
		});
		
// 		$.post(contextPath + 'organization/getOrgChildrenById.cn', //根据车间查询工区
// 				{id: id},
// 				function(result,status){
//     				if(status){//成功
// 						for(var i in result){
// // 							console.log(result[i]);
// 							$("#workArea").append("<option value='" + result[i].id + "' >" + result[i].name+ "</option>");//初始化车间下拉选
// 						}
// 					}
// 				},'json');
	}
/**初始化下拉选结束*/
	
	
	
	//获取查询条件参数
	function getParam(){
		return {
			speciality : $("#speciality").val(),
// 			deviceNameId : $("#sparePartName").val(),
			platesName : $("#sparePartName").val(),
			sparePartModel : $("#sparePartModel").val(),
			workShopId : $("#workShop").val(),
			workAreaId : $("#workArea").val(),
// 			deviceProperties : $("#deviceProperties").val(),
// 			checkStatus : $("#checkStatus").val()
		};
	}
	
	$("#btnSearch").click(function(){
		if(store){
			store.load({
				speciality : $("#speciality").val(),
// 				deviceNameId : $("#sparePartName").val(),
				platesName : $("#sparePartName").val(),
				sparePartModel : $("#sparePartModel").val(),
				workShopId : $("#workShop").val(),
				workAreaId : $("#workArea").val(),
// 				deviceProperties : $("#deviceProperties").val(),
// 				checkStatus : $("#checkStatus").val(),
				putInEndTime: $("#putInEndTime").val(),
				putInStartTime: $("#putInStartTime").val(),
				start : pageNum, //从第一页开始
				pageSize : 10
			});
		}
	});
	
	var suggest;	
	BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select', 'mod/GridBtn'],
			function(Grid,Data,Calendar, Form,Overlay,Select, GB){
	  	
		/*表格列设置*/
		var columns = [
// 		{
// 			title : '审核状态',
// 			dataIndex : 'checkStatus',
// 			elCls : 'center',
// 			width : 100,
// 			renderer : function(value){
// 				switch(value){
// 				case '1':
// 					return '待审核'
// 				case '2':
// 					return '审核通过'
// 				case '3':
// 					return '审核不通过'
// 				}
// 			}
// 		},{
// 			title : '审核人',
// 			dataIndex : 'checkUser',
// 			elCls : 'center',
// 			width : 150,
// 			renderer : function(value){
// 				return value?value.name:'';
// 			}
// 		},{
// 			title : '审核时间',
// 			dataIndex : 'checkDate',
// 			elCls : 'center',
// 			width : 75
// 		},
			{
				title:'设备类别',
				dataIndex:'speciality',
				elCls : 'center',
				width:150,
				renderer:function(value){
					return emergency_speciality_type.typeName(value);
				}
			},{
				title:'设备名称',
				dataIndex:'sparePartName',
				elCls : 'center',
				width:150,
			},{
				title:'规格型号',
				dataIndex:'sparePartModel',
				elCls : 'center',
				width:150
			},{
				title:'单位',
				dataIndex:'unit',
				elCls : 'center',
				width:100
// 				renderer:function(value){
// 					return unit_.unitName(units,value);
// 				}
			},{
				title:'数量',
				dataIndex:'amount',
				elCls : 'center',
				width:100
			},
// 			{
// 				title:'购置时间',
// 				dataIndex:'buyDate',
// 				elCls : 'center',
// 				width:75,
// 				renderer: Grid.Format.datetimeRenderer
// 			},{
// 				title:'购置原因',
// 				dataIndex:'buyReason',
// 				elCls : 'center',
// 				width:150
// 			},
			{
				title:'入库时间',
				dataIndex:'inDate',
				elCls : 'center',
				width:200,
				renderer: Grid.Format.datetimeRenderer
			},{
				title:'软件版本',
				dataIndex:'softwareEdition',
				elCls : 'center',
				width:100
			},{
				title:'所属车间',
				dataIndex:'workShop',
				elCls : 'center',
				width:150,
			},{
				title:'所属工区',
				dataIndex:'workArea',
				elCls : 'center',
				width:150,
			},{
				title:'厂家',
				dataIndex:'factory',
				elCls : 'center',
				width:150
			},
// 			{
// 				title:'设备属性',
// 				dataIndex:'deviceProperties',
// 				elCls : 'center',
// 				width:150
// 			},
			{
				title:'存放地',
				dataIndex:'depositLocation',
				elCls : 'center',
				width:150
			},{
				title:'备注',
				dataIndex:'comment',
				elCls : 'center',
				width:150
			}];
		
		store = new Data.Store({
			url : contextPath+'sparePartAction/getSparePartsByDto.cn',
			proxy : {
				method : 'post',
				dataType : 'json'
			},
			pageSize : 20
		});
			
		/*表格设置*/
		grid = new GB({
			render : '#grid',
			width : '100%',//如果表格使用百分比，这个属性一定要设置
			columns : columns,
			idField : 'id',
			perId : perId,
			contextPath : contextPath,
			tbar : {
				items : [{
	                  btnCls : 'button button-small',
	                  text : '<i class="icon-zoom-in"></i>入库',
	                  listeners : { 'click' : function(){
	                	  var selections = grid.getSelection();
	                	  var n=selections.length;//选择的记录数
	                	  if(n==0){
		                	  addDialog = addDialogCreate();
		                	  addDialog.show();
		                	  addDialog.get('loader').load();
	                	  }else if(n==1){
	                		  recordSelected=selections[0];
	                		  console.log(recordSelected);
	                		  console.log(orgName);
	                		  inDialog = inDialogCreate(recordSelected.id);
	                		  inDialog.show();
	                		  inDialog.get('loader').load();
	                	  }else{
	                		  commonFailure('请不选或选择一条数据进行操作！');
	                	  }
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
								editDialog=editDialogCreate(recordSelected.id);
								editDialog.show();
								editDialog.get('loader').load();
							}else{
								commonFailure('请选择一条数据进行操作！');
							}
	                    }
	                  }
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
		                btnCls : 'button button-small',
		                text : '<i class=" icon-zoom-out"></i>出库',
		                listeners : { 'click' : function(){
			                	var selections = grid.getSelection();
								if(selections.length==1){
									recordSelected=selections[0];
									outDialog=outDialogCreate(recordSelected.id);
									outDialog.show();
									outDialog.get('loader').load();
								}else{
									commonFailure('请选择一条数据进行操作！');
								}
	                    	}
	                  	}
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
		                btnCls : 'button button-small',
		                text : '<i class="icon-move"></i>调拨',
		                listeners : { 'click' : function(){
			                	var selections = grid.getSelection();
								if(selections.length==1){
									recordSelected=selections[0];
									moveDialog=moveDialogCreate(recordSelected.id);
									moveDialog.show();
									moveDialog.get('loader').load();
								}else{
									commonFailure('请选择一条数据进行操作！');
								}
	                    	}
	                  	}
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
		                btnCls : 'button button-small',
		                text : '<i class=" icon-chevron-up"></i>返厂',
		                listeners : { 'click' : function(){
			                	var selections = grid.getSelection();
								if(selections.length==1){
									recordSelected=selections[0];
									if(true){
										returnFactoryDialog=returnFactoryDialogCreate(recordSelected.id);
										returnFactoryDialog.show();
										returnFactoryDialog.get('loader').load();
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
		                text : '<i class=" icon-remove-sign"></i>报废',
		                listeners : { 'click' : function(){
			                	var selections = grid.getSelection();
								if(selections.length==1){
									recordSelected=selections[0];
									if(true){//待回复的数据才能回复
										scrapDialog=scrapDialogCreate(recordSelected.id);
										scrapDialog.show();
										scrapDialog.get('loader').load();
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
	                  text : '<i class="icon-list-alt"></i>使用情况',
	                  listeners : {'click' : function(){
	                	  var selections = grid.getSelection();
	                	  if(selections.length==1){//一次只能看一条记录
	                		  recordSelected=selections[0];
	                		  useSituationDialog=useSituationDialogCreate(recordSelected.id);
	                		  useSituationDialog.show();
	                		  useSituationDialog.get('loader').load();
	                	  }else{
	                		  commonFailure('请选择一条数据进行操作！');
	                	  }
	                    }
	                  }
	                },{
						xclass : 'bar-item-separator' // 竖线分隔符
					},{
		                  btnCls : 'button button-small',
		                  text : '<i class="icon-upload"></i>导入EXCEL',
		                  listeners : {'click' : function(){
		                	  	uploadDialog = uploadDialogCreate();
		                    	uploadDialog.show();
		                    	uploadDialog.get('loader').load();
		                    }
		                  }
		                },{
							xclass : 'bar-item-separator' // 竖线分隔符
						},{
		                  btnCls : 'button button-small',
		                  text : '<i class="icon-download"></i>导出EXCEL',
		                  listeners : {'click' : function(){
// 			          			var records = store.getResult();
// 			                	if(records.length>0){
// 			                		 exportXls(records);
// 			                	}else{
// 			                		 commonFailure('无数据可以导出！');
// 			                	}
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
		
		//添加备品方法
		function addSparePart(param){
			$.ajax({//发送请求，保存数据
				url:contextPath +  'sparePartAction/addSparePart.cn',
				type:'post',
				data:{
					param : JSON.stringify(param)
				},
				dataType:'json',
				success:function(result,status){
					if(status){//提示成功
 						commonSuccess('新增成功！');
					}else{
						commonFailure("新增失败！");
					}
					dialogClose(addDialog);//关闭添加弹出框
				},
				error:function(){alert('保存数据异常！');}
			});
		}
		
		//入库备品方法
		function inSparePart(id,amountIn,comment){
			$.ajax({//发送请求，保存数据
				url:contextPath +  'sparePartAction/inSparePart.cn',
				type:'post',
				data:{
					id : id,
					amountIn : amountIn,
					comment : comment
					},
				dataType:'json',
				success:function(result,status){
					if(status){//提示成功
 						commonSuccess('入库成功！');
					}else{
						commonFailure("入库失败！");
					}
					if(inDialog){
						dialogClose(inDialog);//关闭弹出框
					}
					if(addDialog){
						dialogClose(addDialog);//关闭弹出框
					}
				},
				error:function(){alert('保存出现异常！');}
			});
		}
		
		//新增备品--弹出框
       function addDialogCreate(){
    	   addDialog = new Overlay.Dialog({
    		   title : '新增备品',
   			   width : 620,
   			   height : 395,
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
						if(!addForm.isValid()) {//表单验证
							return ;
						}
						var param=getParamAdd();//获取弹出框参数
// 						console.log(param);
						//判断新增数据是否已存在（根据备品类型、名称、型号、所属车间、工区），若存在，则只进行入库操作
						$.ajax({
							url : contextPath+'sparePartAction/getSparePartsByDto.cn',
							type:'post',
							data:{
								start : 0,
								limit : 10,
							 speciality : param.speciality,
// 							 deviceNameId : param.deviceNameId,
							 platesName : param.platesName,
							 sparePartModel : param.sparePartModel,
							 workShopId : param.workShopId,
							 workAreaId : param.workAreaId
								},
							dataType:'json',
							success:function(result,status){
								if(status){//提示成功
									console.log(result.results);
			 						if(result.results==0){//无相同记录，新增操作
			 							addSparePart(param);
			 						}else if(result.results==1){//有相同记录，入库操作
			 							// 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
			 							$(".bui-ext-mask").addClass("userMask");
			 							var id=result.rows[0].id;
			 							var amountIn=param.amount;//填入的数量当做新入库数量
			 							var comment=result.rows[0].comment;//备注不变
			 							var msg='发现相同记录，是否在已有的记录上进行增加？';
			 							BUI.Message.Confirm(msg,function(){
			 								inSparePart(id,amountIn,comment);
			 				    		},'question');
			 							// 去除一级弹出框遮罩层
			 	   						$(".bui-ext-mask").removeClass("userMask");
			 						}else{//有重复记录
			 							 $(".bui-ext-mask").addClass("userMask");
										 BUI.Message.Alert('数据库中同一备品存在重复记录，请联系管理员或删除！',function(){
											 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
										 }, 'warning');
			 						}
								}
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
				url : contextPath + 'views/emergency/sparePartsAdd.jsp',
				autoLoad : false,//不在弹出框组件初始化时自动加裁
				lazyLoad : false,//不进行延迟加裁
				dataType : 'html'//加载内容类型
			}
    	   	
    	   });
    	   return addDialog;
		}
		
     //声明对象
		function UploadFileDto(name,path){
			this.name = name;
			this.path = path;
		}
		
     //导入excel
       function uploadDialogCreate(){
    	   uploadDialog = new Overlay.Dialog({
    		   title : '导入应急备品管理',
   			   width : 600,
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
					
   					//判断是否选取上传文件
   					var files = $(":file");
   					for(var i=0;i<files.length;i++){
   						var fileName = $(files[i]).val().slice(-27);
   						if(fileName==""||fileName==null){
   							$(".bui-ext-mask").addClass("userMask");
   							BUI.Message.Alert('请选择上传文件！',function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
   							return;
   						}
   						
   						var startIndex = fileName.indexOf(".");
   						var suffix = fileName.slice(startIndex);
   						if(suffix!=".xls"&& suffix!=".xlsx"){
   							$(".bui-ext-mask").addClass("userMask");
   							BUI.Message.Alert('请上传正确类型的文件！',function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
   							return;
   						}
   					}
   					$("#uploadForm").submit();
//    					dialogClose(uploadDialog);
					}
				},{
					text : '取消', 
					elCls : 'button btn-close',
					handler : function() {
						dialogClose(uploadDialog);
					}
				}],
				loader : {
					url : contextPath + 'views/emergency/sparePartsImport.jsp',//弹出框加载的JSP页面
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
    	   });
    	   return uploadDialog;
		}
    
     //备品入库
       function inDialogCreate(id){
			inDialog = new Overlay.Dialog({
				title : '备品入库',
				width : 620,
				height : 425,
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
						if(!inForm.isValid()) {//表单验证
							return ;
						}
						//获取弹出框参数
						var amountIn=$("#amountIn").val();
						var comment=$("#commentIn").val();
						inSparePart(id,amountIn,comment);
						}
					}, {
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(inDialog);
					}
				}],
				loader : {
					url : contextPath +  'views/emergency/sparePartsIn.jsp?id='+id,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return inDialog;
		}
		
     //修改备品
     function updateSparePart(param){
    	 $.ajax({//发送请求，保存数据
				url:contextPath +  'sparePartAction/updateSparePart.cn',
				type:'post',
				data:{
					param : JSON.stringify(param)
					},
				dataType:'json',
				success:function(result,status){
					if(status){//提示成功
						commonSuccess('修改成功！');
					}else{
						commonFailure("修改失败！");
					}
					dialogClose(editDialog);//关闭弹出框
				},
				error:function(){alert('修改出现异常！');}
			});
     }
     
		//修改记录
       function editDialogCreate(id){
			editDialog = new Overlay.Dialog({
				title : '修改备品',
				width : 620,
				height : 395,
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
						if(!editForm.isValid()) {//表单验证
							return ;
						}
						
						var param=getParamEdit();//获取弹出框参数
// 						console.log(param);
						//获取验证参数
						var validateParam=getValidateParam();
// 						console.log(validateParam);
						//判断修改后的数据是否已存在（此处只修改了型号），若存在，提示不能修改
						$.ajax({
							url : contextPath+'sparePartAction/getSparePartsByDto.cn',
							type:'post',
							data:{
								start : 0,
								limit : 10,
								param : JSON.stringify(validateParam)
								},
							dataType:'json',
							success:function(result,status){
								var sparePartModel_old = $("#sparePartModelEdit_hidden").val();//原始型号
								if(status){//提示成功
			 						if(result.results==0||validateParam.sparePartModel==sparePartModel_old){//无相同记录或修改自己（只修改数量即修改自己，通过），直接修改
			 							updateSparePart(param);
			 						}else{//有重复记录,提示不能修改
			 							 $(".bui-ext-mask").addClass("userMask");
										 BUI.Message.Alert('修改后的记录已存在！',function(){
											 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
										 }, 'warning');
			 						}
								 }
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
					url : contextPath +  'views/emergency/sparePartsEdit.jsp?id='+id,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return editDialog;
		}
			
     //出库
       function outDialogCreate(id){
			outDialog = new Overlay.Dialog({
				title : '备品出库',
				width : 620,
				height : 425,
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
						if(!outForm.isValid()) {//表单验证
							return ;
						}
						if($("#outForm #amountNow_out").val()-$("#outForm #amountOut").val()<0){
							 $(".bui-ext-mask").addClass("userMask");
							 BUI.Message.Alert("出库数量大于库存量！",function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
							return;
						}
						//获取参数
						var amountOut=$("#amountOut").val();//出库数量
						var rearon=$("#rearonOut").val();//使用原因
						if(rearon.length>250){
							$(".bui-ext-mask").addClass("userMask");
							BUI.Message.Alert("使用原因过长，请控制在250字以内！",function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
							return;
						}
// 						alert(amountOut+","+rearon);
						//提交后台
						$.post(contextPath + 'sparePartAction/outSparePart.cn', 
								{
									id : id,
									amountOut : parseFloat(amountOut),
									rearon : rearon
								},
								function(result,status){
				    				if(status){//成功
				    					if(status){//提示成功
					 						commonSuccess('出库成功！');
										}else{
											commonFailure("出库失败！");
										}
									}
				    				dialogClose(outDialog);//关闭弹出框
							},'json');
						}
					}, {
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(outDialog);
					}
				}],
				loader : {
					url : contextPath +  'views/emergency/sparePartsOut.jsp?id='+id,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return outDialog;
		}
		
       //移库
       function moveDialogCreate(id){
			moveDialog = new Overlay.Dialog({
				title : '备品调拨',
				width : 620,
				height : 550,
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
						if(!moveForm.isValid()) {//表单验证
							return ;
						}
						if($("#moveForm #amountMove_Now").val()-$("#moveForm #amountMove").val()<0){
							$(".bui-ext-mask").addClass("userMask"); 
							BUI.Message.Alert("请输入正确的移库数量！",function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
							return;
						}
 						//获取参数
 						var workShopIdNow= $("#workShopMove_hidden").val();//移出车间id
 						var workAreaIdNow= $("#workAreaMove_hidden").val();//移出工区id
 						
 						var workShopId= $("#workShopAccept").val();//接收车间id
 						var workAreaId= $("#workAreaAccept").val();//接收工区id
 						if(workAreaId==''){
 							workAreaId=workShopId;
 						}
						var amountMove= $("#amountMove").val();//移库数量
// 						alert(workShopId+","+workAreaId+","+amountMove);
						//移出和接收地点若相同，提示不能移入
						if(workShopIdNow==workShopId&&workAreaIdNow==workAreaId){
							 // 将遮罩层的z-index加大到1100，用以遮罩一级弹出框
 							 $(".bui-ext-mask").addClass("userMask");
							 BUI.Message.Alert('接收车间/工区不能为当前车间/工区',function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
						}else{//请求提交
							$.post(contextPath + 'sparePartAction/moveSparePart.cn', 
									{
										id : id,
										workShopId : workShopId,
										workAreaId : workAreaId,
										amountMove : amountMove
									},
									function(result,status){
				    					if(status){//提示成功
											commonSuccess('移库成功！');
										}else{
											commonFailure("移库失败！");
										}
					    				dialogClose(moveDialog);//关闭弹出框
								},'json');
							}
						}
					}, {
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(moveDialog);
					}
				}],
				loader : {
					url : contextPath +  'views/emergency/sparePartsMove.jsp?id='+id,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
	    	   	
			});
			return moveDialog;
		}
     
       //返厂
       function returnFactoryDialogCreate(id){
    	   returnFactoryDialog = new Overlay.Dialog({
				title : '备品返厂',
				width : 620,
				height : 425,
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
						if(!returnForm.isValid()) {//表单验证
							return ;
						}
						//获取参数
						var amountReturn= $("#amountReturn").val();//移库数量
// 						alert(amountReturn);
						if($("#returnForm #amountReturn_Now").val()-$("#returnForm #amountReturn").val()<0){
							$(".bui-ext-mask").addClass("userMask");
							BUI.Message.Alert("请输入正确的返厂数量！",function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
							return;
						}
						//请求提交
						$.post(contextPath + 'sparePartAction/ReturnSparePart.cn', 
								{
									id : id,
									amountReturn : amountReturn
								},
								function(result,status){
				    				if(status){//成功
				    					if(status){//提示成功
					 						commonSuccess('返厂成功！');
										}else{
											commonFailure("返厂失败！");
										}
									}
				    				dialogClose(returnFactoryDialog);//关闭弹出框
							},'json');
						
						}
					}, {
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(returnFactoryDialog);
					}
				}],
				loader : {
					url : contextPath +  'views/emergency/sparePartsReturnFactory.jsp?id='+id,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
			});
			return returnFactoryDialog;
		}
       
     //备品报废
       function scrapDialogCreate(id){
    	   scrapDialog = new Overlay.Dialog({
				title : '备品报废',
				width : 620,
				height : 425,
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
						if(!scrapForm.isValid()) {//表单验证
							return ;
						}
						if($("#scrapForm #amountScrap_Now").val()-$("#scrapForm #amountScrap").val()<0){
							$(".bui-ext-mask").addClass("userMask");
							BUI.Message.Alert("请输入正确的报废数量！",function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
							return;
						}
						//获取参数
						var amountScrap= $("#amountScrap").val();//报废数量
						var reasonScrap=$("#reasonScrap").val();//报废原因
						if(reasonScrap.length>250){
							$(".bui-ext-mask").addClass("userMask");
							BUI.Message.Alert("报废原因过长，请控制在250字以内！",function(){
								 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
							 }, 'warning');
							return;
						}
						
// 						alert(amountScrap+","+reasonScrap);
						//请求提交
						$.post(contextPath + 'sparePartAction/scrapSparePart.cn', 
								{
									id : id,
									amountScrap : amountScrap,
									reasonScrap : reasonScrap
								},
								function(result,status){
				    				if(status){//成功
				    					if(status){//提示成功
					 						commonSuccess('报废操作成功！');
										}else{
											commonFailure("报废操作失败！");
										}
									}
				    				dialogClose(scrapDialog);//关闭弹出框
							},'json');
						}
					}, {
						text : '取消',
						elCls : 'button btn-close',
						handler : function() {
							dialogClose(scrapDialog);
					}
				}],
				loader : {
					url : contextPath +  'views/emergency/sparePartsScrap.jsp?id='+id,
					autoLoad : false,//不在弹出框组件初始化时自动加裁
					lazyLoad : false,//不进行延迟加裁
					dataType : 'html'//加载内容类型
				}
			});
			return scrapDialog;
		}
       
			//备品使用详情
	       function useSituationDialogCreate(id){
	    	   useSituationDialog = new Overlay.Dialog({
					title : '备品备件使用情况',
					width : 750,
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
						url : contextPath +  'views/emergency/sparePartsUseSituation.jsp?id='+id,
						autoLoad : false,//不在弹出框组件初始化时自动加裁
						lazyLoad : false,//不进行延迟加裁
						dataType : 'html'//加载内容类型
					}
		    	   	
				});
				return useSituationDialog;
			}
			
        //删除
    	function deleteData(selections) {
    		var msg = '该备品含有使用记录，删除将连使用记录一起删除，确定删除?<br/>';
    		BUI.Message.Confirm(msg,function(){
    			var ids = "";
    			for(var i = 0;i < selections.length;i++){
    				ids += selections[i].id+',';
    			}
    			ids=ids.substring(0,ids.length-1);
//     			alert(ids);
    			$.post(contextPath + 'sparePartAction/deleteSparePart.cn', 
						{
							ids : ids
						},
						function(result,status){
		    				if(status){//成功
		    					if(status){//提示成功
		    						commonSuccess('删除成功！');
								}else{
									commonFailure("删除失败！");
								}
							}
		    				store.load();
					},'json');
    			
    		},'question');
    	}
        
    	//导出全部数据
		function exportXls(){
			$("#exportXlsJson").val("");//清空值
			$("#exportXlsJson").val(JSON.stringify(getParam()));
			$("#exportForm").submit();
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
        
        /**
    	 * 关闭弹出框并解除引用
    	 * param:d 待关闭的弹出框
    	 */
    	function dialogClose(d){
    		d.close();
    		d = null;
    	}
		
    	$(".bui-ext-close").click(function(){
		       	 console.log("--------in----------");
		       	 $(".bui-ext-mask").removeClass("userMask");//移出遮罩层
		});
	   
	/*BUI结束*/	
	//console.log(store.__attrVals.data);
	});
</script>
</body>
</html>