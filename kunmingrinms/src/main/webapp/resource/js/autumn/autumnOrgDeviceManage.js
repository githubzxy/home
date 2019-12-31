
var store; //列表数据源
var grid;//列表组件

var beStore;//被选中数据数据源对象
var beGrid;//被选中数据表格组件

$(document).ready(function() {
	initDeviceType();
	// 注册设备类型改变事件
	$("#deviceType").change(searchDevicesByType);
	$("#addBtn").click(add);
	$("#delBtn").click(del);
	$("#searchBtn").click(searchBeSelected);
	searchBeSelected();
	searchData();
});

/**
 * 初始化设备类型
 */
function initDeviceType() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/AutumnInit?method=initSingle",
		dataType : "json",
		data : {
			"orgType" : $("#orgType").val()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				if (data == null) {
					return;
				}
				var htmlDeviceType = "<option value=''>全部</option>";
				$("#deviceType").html("");
				$("#beSelectedDvType").html("");
				var deviceTypeData = data.deviceTypeMap;
				$.each(deviceTypeData, function(key, value) {
					htmlDeviceType += "<option value='" + key + "'>" + value
							+ "</option>";
				});
				$("#deviceType").html(htmlDeviceType);
				$("#beSelectedDvType").html(htmlDeviceType);
				// 初始化完成后查询数据
				searchBeSelected();
				// 如果没有选择类型则查询所有
				searchDevicesByType();
			}
		},
		failure : function(res) {
			alert(res);
		}
	});
}
/**
 * 通过选中类型，设置待选列表的数据
 * 
 * @param event
 */
function searchDevicesByType(event) {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/AutumnInit?method=searchDevicesByType",
		dataType : "json",
		data : {
			"deviceTypeId" : $("#deviceType").val()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				var data = response.data;
				if (data == null) {
					return;
				}
				searchData();
			}
		},
	});
}

/**
 * 新增,移入
 */
function add() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/OrgDeviceManage",
		dataType : "json",
		data : {
			"method" : "add",
			"deviceIds" : getDeviceIds(),
			"orgId" : $("#orgId").val()
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				searchBeSelected();
			}
		},
	});
}
/**
 * 获取选中的设备id并拼装成一个字符串传入后端
 */
function getDeviceIds() {
	var deviceIds = "";
	var selectedDevices = grid.getSelection();
	$.each(selectedDevices, function(i, node) {
		deviceIds += node.ID_ + ",";
	});
	return deviceIds.substring(0, deviceIds.length - 1);
}

/**
 * 移出
 */
function del() {
	$.ajax({
		type : "POST",
		url : "/kunmingrinms/OrgDeviceManage",
		dataType : "json",
		data : {
			"method" : "del",
			"deviceIds" : getDelDeviceIds(),
		},
		success : function(response) {
			if (response.result != 1) {
				alertWarn(response.message);
			} else {
				searchBeSelected();
			}
		},
	});
}

/**
 * 获取选中的设备id并拼装成一个字符串传入后端
 */
function getDelDeviceIds() {
	var delDeviceIds = "";
	var delDevices = beGrid.getSelection();
	$.each(delDevices, function(i, node) {
		delDeviceIds += node.ID_ + ",";
	});
	return delDeviceIds.substring(0, delDeviceIds.length - 1);
}
// //////////////////引入bui后的修改内容///////////////////////////////////////////
BUI.use([ 'bui/grid', 'bui/data' ], function(Grid, Data) {
	var Grid = Grid, Store = Data.Store, columns = [ {
		title : '编号',
		dataIndex : 'SEQ_',
		width : 50
	}, {
		title : '设备名',
		dataIndex : 'DEVICE_NAME_',
		width : 250
	}];
	store = new Store({
		root : 'data',  
		// 调用serverlet方法
		url : "/kunmingrinms/AutumnInit",
	    autoLoad : true,    //创建Store时自动加载数据
	    params : {         //设置请求时的参数
			method : 'searchDevicesByType',
			deviceTypeId : $("#deviceType").val(),
	    },
		// 调用方法
		proxy : {
			method : 'post'
		},
	});
	grid = new Grid.Grid({
		render : '#waitSelectDG',
		columns : columns,
		itemStatusFields : { // 设置数据跟状态的对应关系
			selected : 'selected',
			disabled : 'disabled'
		},
		forceFit : true,//窗口自适应
//		width:'100%',//表格百分比
		height: $(window).height() - 120,	// 默认为自适应高度
		store : store,
		plugins : [ Grid.Plugins.CheckSelection ]
	// 插件形式引入多选表格
	// multiSelect: true // 控制表格是否可以多选，但是这种方式没有前面的复选框 默认为false
	});
	grid.render();
});

/**
 * 通过设备类型获取设备，若类型为空则查询全部
 */
function searchData(){
	if(store){
		store.load({
			method : 'searchDevicesByType',
			deviceTypeId : $("#deviceType").val(),
		});
	}
}
//已选设备
BUI.use([ 'bui/grid', 'bui/data' ], function(Grid, Data) {
	var Grid = Grid, Store = Data.Store, columns = [ {
		title : '设备类型',
		dataIndex : 'TYPE_NAME_',
		width : 150
	},{
		title : '编号',
		dataIndex : 'SEQ_',
		width : 50
	}, {
		title : '设备名',
		dataIndex : 'DEVICE_NAME_',
		width : 250
	}];
	beStore = new Store({
		root : 'data',  
		// 调用serverlet方法
		url : "/kunmingrinms/OrgDeviceManage",
		// 调用方法
		proxy : {
			method : 'post'
		},
	});
	beGrid = new Grid.Grid({
		render : '#beSelectedDG',
		columns : columns,
		forceFit : true,//窗口自适应
//		width:'100%',//表格百分比
		height: $(window).height() - 120,	// 默认为自适应高度
		store : beStore,
		plugins : [ Grid.Plugins.CheckSelection ]
	});
	beGrid.render();
});

/**
 * 查询被选中你的数据
 */
function searchBeSelected(){
	if(beStore){
		beStore.load({
			method : 'getBeSelectedDvByDto',
			orgId : $("#orgId").val(),
			deviceName : $("#deviceName").val(),
			typeId : $("#beSelectedDvType").val()
		});
	}
}