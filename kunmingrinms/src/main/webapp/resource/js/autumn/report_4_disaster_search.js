/*
 * 页面名称：灾害监测设备年度质量分析汇总表
 * 位置：生产管理-段秋鉴管理-段汇总查询
 * 功能说明：
 * 1.查询时直接展示对应【设备类型】的【设备名称】所有数据，如果该【设备名称】没有数据则显示为0即可。
 * 2.每一个【设备类型】都有一个单项小计，小计的算法是（【设备名称】/设备名称个数）
 * 3.具有导出Excel功能，导出表格内容与页面展示表格一致，宽度必须与客户的模板宽度一致，保证一页A4纸能打印出来
 * pzr
 */

//全局变量
var store;
var tree;
var picker;

BUI.use(['bui/extensions/treepicker','bui/tree','bui/data'],function(TreePicker,Tree,Data){
	store = new Data.TreeStore({
		root : {
			id : '8affa073533aa3d601533bbef63e0010',
			text : '昆明通信段'
		},
		url:'/kunmingrinms/WorkshopServlet',
		params : {         //设置请求时的参数
			method:"getT4Z4W5WorkShopForDuan",
			year:$("#year").html(),
			report:"3",
			orgId:$("#orgId").val()
		},
		dataProperty : 'data',
		proxy : {
			method : 'post',
			dataType : 'json'
		},
		map : {	// 节点映射
			'ORG_ID_' : 'id',
			'SHOW_ORG_NAME_' : 'text'	// 节点显示文本
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
		valueField  : '#selectedIds',//用于装选中的id的隐藏域，每次修改都会更新这个隐藏域的值
		trigger : '#orgName',  
		selectStatus : 'checked',//设置勾选作为状态改变的事件
		autoRender : true,
		width:300,  //指定宽度
		children : [tree] //配置picker内的列表
	});
	//加载完成后查询数据
	store.on('load',function(ev){
		searchData();
	 });
});

//页面初始化完成后调用该方法
$(document).ready(function(){
	//导出按钮添加事件
	$("#exportBtn").click(exportTable);
});

/**
 * 获取基础数据
 */
function getTable1(){
	$.ajax({
		type: "POST",
		url: "/kunmingrinms/DeviceCollectionDisaster?method=queryAllForSearch",
		dataType: "json",
		data: {
			"year":$("#year").html(),
			"ids" : getCombotreeChildren(),
			"orgId":$("#orgId").val()
		},
		success: function(response){
			if(response.result!=1){
				alertWarn(response.message);
			}else{
				var data=response.data;
				var html="";
				var thead=$("#table1 thead");
				var base=$("#base");
				$("#table1").html("");
				$("#table1").html(thead);
				$.each(data,function(i,node) {	//遍历所有类型
					html+="<tr>";
					if(node.ROW_SPAN_ != null)
						html+="   <td rowspan='"+node.ROW_SPAN_+"'>"+formatNullData(node.DEVICE_TYPE_NAME_)+"</td>";
					if(/^[0-9]*$/.test(node.SEQ_)) {
						//为数字
						html+="   <td>"+formatNullData(node.SEQ_)+"</td>";
						html+="   <td>"+formatNullData(node.DEVICE_NAME_)+"</td>";
					} else if(node.SEQ_ != null) {
						//不为数字 单项小计
						html+="   <td colspan='2'>"+formatNullData(node.SEQ_)+"</td>";
					} else {
						// 综合合格率
						html+="   <td colspan='3'>"+formatNullData(node.DEVICE_TYPE_NAME_)+"</td>";
					}
					html+="   <td>"+formatNullData(node.UNIT_)+"</td>";
					html+="   <td>"+formatNullData(node.TEST_IDENTIFY_NUM_)+"</td>";
					html+="   <td>"+formatDecimalData(node.FIT_NUM_)+"</td>";
					html+="   <td>"+formatPercentData(node.FIT_PER_)+"%</td>";
					html+="   <td>"+formatDecimalData(node.NO_FIT_NUM_)+"</td>";
					html+="   <td>"+formatPercentData(node.NO_FIT_PER_)+"%</td>";
					html+="   <td>"+formatNullData(node.REMARK_)+"</td>";
					html+="</tr>";
				});
				$("#table1").append(html);
				$("#table1").append(base);
			}
		},
		failure:function(res){
			alert(res);
		}
	});
}
//获取选中的id值
function getCombotreeChildren() {
	var workshops = "";//选中的组织机构
	var item = picker.getSelectedValue();//选中的节点
	//如果没有选中则设置为所有组织机构,否则传入选中的值
	if(item){
		workshops = picker.getSelectedValue();
	}else{
		for(var i = 0 ; i <store.getResult().length ; i ++ ){
			workshops += store.getResult()[i].id+",";
		}
		workshops =  workshops.substring(0, workshops.length-1);
	}
	return workshops;
}
//导出
function exportTable(){
	var url = "/kunmingrinms/DeviceCollectionDisaster?method=exportForSearch";
	url += "&year="+$("#year").html();
	url += "&orgId="+$("#orgId").val();
	url += "&ids="+ getCombotreeChildren();
	window.location = url;
}
//查询数据
function searchData(){
	//必须等车间加载完才能进行选择部门的操作
	getTable1();
	setOrgName();
}
//设置列表中选中组织机构名称
function setOrgName(){
	$('#orgNameShow').html(picker.getSelectedText());
}