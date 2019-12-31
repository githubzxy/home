/**
 * 创建左中右构造器
 * @author qyy
 */
define('common/chooseUser/ChooseUser',['bui/common','bui/form','bui/data','bui/grid','common/chooseUser/LeftForm'],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,Form = require('bui/form');
	var Data = require('bui/data');
	var Grid = require('bui/grid');
	var LeftForm = require('common/chooseUser/LeftForm');
//	var searchForm;
	var ChooseUser = Component.Controller.extend({
		initializer:function(){
			var _self = this,ls = _self.get('leftSize'),rs = _self.get('rightSize'),ms = _self.get('middleSize');
			var left = {xclass:'controller',elCls : 'span' + ls,children : _self._initLeftController(),height : '100%'};
			var right = {xclass:'controller',elCls : 'span' + rs,children : [_self._initRigthGrid()] ,height : '100%'};
			var middle = {xclass:'controller',elCls : 'span' + ms,children :[_self._initMiddleButton()] ,height : '100%'};
			
			_self.addChild(left);
			_self.addChild(middle);
			_self.addChild(right);
		},
		bindUI : function(){
			var _self = this,store = _self.get('store'),searchForm = _self.get('searchForm');
			var rightGrid = _self.get('rightGrid');
			var leftGrid = _self.get('leftGrid');
			if(_self.get('selectType')=="2"){
				store.load({name: "", orgType: ORG_TYPE_KS});
			}else{
				store.load({name: "", orgType: ORG_TYPE_CJ});
			}
			// 点击上方查询按钮刷新列表
			searchForm.on('formSearch',function(e){
				var param = e.param;
				store.load(param);
			});
			// 双击移入
			leftGrid.on('dblclick',function(e){
				var element = $(e.domTarget).closest('tr');
				var item = leftGrid.getItemByElement(element);
				var items = new Array(item);
				_self._distinctAddItems(items);
		    });
			// 双击移出
			rightGrid.on('dblclick',function(e){
				var element = $(e.domTarget).closest('tr');
				var item = rightGrid.getItemByElement(element);
				rightGrid.removeItem(item);
			});
			// 移入
			$("#inBtn").click(function(e){
				var items = leftGrid.getSelection();
				_self._distinctAddItems(items);
			});
			// 移出
			$("#outBtn").click(function(e){
				var items = rightGrid.getSelection();
				rightGrid.removeItems(items);
			});
			// 全部移入
			$("#inBtnAll").click(function(e){
				var items = leftGrid.getItems();
				_self._distinctAddItems(items);
			});
			// 全部移出
			$("#outBtnAll").click(function(e){
				var items = rightGrid.clearItems();
				rightGrid.removeItems(items);
			});
		},
	_initLeftController:function(){
		var _self = this, leftController = [];
		var searchForm = new LeftForm({
			orgType:_self.get('orgType'),
			selectType:_self.get('selectType')
		});
		_self.set('searchForm',searchForm);
		leftController.push(searchForm);
		leftController.push(_self._initLeftGrid());
		return leftController;
	},
	_initRigthGrid:function(){
		var _self = this;
		var rightGrid;
		var contextPath = _self.get('contextPath'),
        columns = [{
		        	title : '用户名',
		        	dataIndex :'name',
		        	sortable : false,
		        	width:'40%'
        		},{
        			title : '组织机构',
        			dataIndex :'organization',
        			sortable : false,
        			width:'60%',
        			renderer: function(value) {
        				return value == null ? "" : value.name;
        			}
        		}];
        var rightStore = new Data.Store({
			url : contextPath + "userAction/getGridUsersByIds.cn",
			proxy : {
				method : 'post',
				dataType : 'json'
			},
			params : {ids: _self.get('userIds')},
			autoLoad:true
        });
		rightGrid = new Grid.Grid({
			width : '100%',
			height : 410,
			columns : columns,
			store : rightStore,
			plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber]	// 插件形式引入多选表格
		});
		_self.set('rightGrid',rightGrid);
		return rightGrid;
	},
	_initMiddleButton:function(){
		return {xclass:'controller',
			    content:'<div style="margin:12px;"><button id="inBtn" class="button" style="margin-top: 100px;width: 100px;">移入</button></div>'+
			    		'<div style="margin:12px;"><button id="outBtn" class="button" style="width: 100px;">移出</button></div>'+
			    		'<div style="margin:12px;"><button id="inBtnAll" class="button" style="width: 100px;">全部移入</button></div>'+
			    		'<div style="margin:12px;"><button id="outBtnAll" class="button" style="width: 100px;">全部移出</button></div>'
		};
	},
	getSelectUserData:function(){
		var _self = this;
		return  _self.get('rightGrid').getItems();
	},
	_initLeftGrid:function(){
		var _self = this;
		var leftGrid;
		var contextPath = _self.get('contextPath'),
        columns = [{
        			title : '用户名',
        			dataIndex :'name',
        			sortable : false,
        			width:'40%'
        		},{
        			title : '组织机构',
        			dataIndex :'organization',
        			sortable : false,
        			width:'60%',
        			renderer: function(value) {
        				return value == null ? "" : value.name;
        			}
        		}];
		var store = new Data.Store({
			url : contextPath + "userAction/getUsersByNameOrOrgType.cn",
			proxy : {
				method : 'post',
				dataType : 'json'
			}
		}),
		leftGrid = new Grid.Grid({
			width : '100%',
			height : 410,
			columns : columns,
			store : store,
			plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.RowNumber]	// 插件形式引入多选表格
			//multiSelect: true  // 控制表格是否可以多选，但是这种方式没有前面的复选框 默认为false
		});
		_self.set('store',store);
		_self.set('leftGrid',leftGrid);
		return leftGrid;
	},
	// 已选列表中 去除重复用户
	_distinctAddItems : function(items){
		var _self = this;
		var rightGrid = _self.get('rightGrid');
		var leftGrid = _self.get('leftGrid');
		var rightGridUserIds = [];
		for(var i = 0; i < rightGrid.getItems().length; i++) {
			rightGridUserIds.push(rightGrid.getItems()[i].id);
		}
    	for(var i = 0; i < items.length; i++) {
    		var item = items[i];
    		if(item == null || item == "null" || item == undefined) {
    			continue;
    		}
    		// 不存在，添加
    		if(($.inArray(item.id, rightGridUserIds)) == -1){
    			rightGrid.addItem(item);
    		}
    	}
    	// 清除  待选列表  List中CheckBox“√“
    	leftGrid.clearSelection();
	}
	},{
		ATTRS:{
			elCls : {value : 'row-fluid'},
			leftSize : {value : 10},
			rightSize:{value : 10},
			middleSize:{value:4},
			userIds:{},
			orgType:{},
			selectType:{value:'1'},
			contextPath : {}
		}
	}
   );
	return ChooseUser;
});