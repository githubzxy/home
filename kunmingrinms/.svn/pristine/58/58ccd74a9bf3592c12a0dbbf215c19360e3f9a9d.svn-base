/**
 * 创建左中右构造器
 * @author qyy
 */
define('common/chooseExecuteUser/ChooseUser',['bui/common','bui/form','bui/data','bui/grid','common/chooseExecuteUser/LeftForm'],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,Form = require('bui/form');
	var Data = require('bui/data');
	var Grid = require('bui/grid');
	var LeftForm = require('common/chooseExecuteUser/LeftForm');
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
			leftGrid.on('itemdblclick',function(e){
				var element = $(e.domTarget).closest('tr');
				var item = leftGrid.getItemByElement(element);
				var items = new Array(item);
				_self._distinctAddItems(items);
				return false;
		    });
			// 双击移出
			rightGrid.on('itemdblclick',function(e){
				var element = $(e.domTarget).closest('tr');
				var item = rightGrid.getItemByElement(element);
				rightGrid.removeItem(item);
				rightGrid.setItems(rightGrid.getItems());//重新设置记录
				return false;
			});
			/**
			 * 以下代码目的是修复在快速单击时，双击事件不能正常运行
			 * by bili
			 */
//			var timeId;//定时器ID，在单击事件超过设置时间250ms后，会重置点击次数
//			var isClick = 0;//点击次数，单位时间内超过两次点击时，执行和双击事件一样的删除item方法
//			var nowItemId = null;//当前点击的itemId，只在当前item快速单击时，执行删除item方法
//			rightGrid.on('itemclick',function(e){
//				if(nowItemId == e.item.id){
//					isClick++;
//				}
//				if(isClick>=2){
//					rightGrid.removeItem(e.item);
//					isClick=0;
//				}
//				clearTimeout(timeId);
//				timeId = setTimeout(function(){
//					isClick=0;
//					nowItemId = null;
//				},150);
//				nowItemId = e.item.id;
//			});
			
			// 移入
			$("#inBtn").click(function(e){
				var items = leftGrid.getSelection();
				_self._distinctAddItems(items);
			});
			// 移出
			$("#outBtn").click(function(e){
				var items = rightGrid.getSelection();
				rightGrid.removeItems(items);
				rightGrid.setItems(rightGrid.getItems());//重新设置记录
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
			url : contextPath + _self.get('rightStoreUrl'),
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
			plugins : [Grid.Plugins.RowNumber],
			multipleSelect : true,
			elStyle:{
		      userSelect:"none"
			}
			
		});
		_self.set('rightGrid',rightGrid);
		return rightGrid;
	},
	_initMiddleButton:function(){
		return {xclass:'controller',
			    content:'<div><button id="inBtn" class="small button" style="margin-top: 130px;width: 48px;height:30px;padding:0;">></button></div>'+
			    		'<div ><button id="outBtn"  class="small button" style="margin-top: 15px;width: 48px;height:30px;padding:0;"><</button></div>'+
			    		'<div ><button id="inBtnAll"  class="small button" style="margin-top: 15px;width: 48px;height:30px;padding:0;">>></button></div>'+
			    		'<div ><button id="outBtnAll" class="small button"  style="margin-top: 15px;width: 48px;height:30px;padding:0;"><<</button></div>'
		};
	},
	getSelectUserData:function(){
		var _self = this;
		return  _self.get('rightGrid').getItems();
	},
	
	getSelectUserStore:function(){
		var _self = this;
		return _self.get('store');
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
		var store;
		if(_self.get('selectedWorkAreaUser')!="false"&&_self.get('orgType')==ORG_TYPE_CJ){
			store = new Data.Store({
				data:_self.get('selectedWorkAreaUser')
			})
		}else{
			store = new Data.Store({
				url : contextPath + _self.get('leftStoreUrl'),
				proxy : {
					method : 'post',
					dataType : 'json'
				}
			})
		}
		
		leftGrid = new Grid.Grid({
			width : '100%',
			height : 410,
			columns : columns,
			store : store,
			plugins : [Grid.Plugins.RowNumber],	// 插件形式引入多选表格
		    multipleSelect : true// 控制表格是否可以多选，但是这种方式没有前面的复选框 默认为false
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
			leftSize : {value : 11},
			rightSize:{value : 11},
			middleSize:{value:2},
			userIds:{},
			orgType:{},
			selectType:{value:'1'},
			contextPath : {},
			rightStoreUrl:{},
			leftStoreUrl:{},
			selectedWorkAreaUser:{}
		}
	}
   );
	return ChooseUser;
});