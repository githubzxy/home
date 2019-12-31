/**
 * 树结构排序
 */
define('common/tree/TreeSort',[
							'bui/common','bui/list',
							'bui/toolbar','bui/data',
							'common/container/LeftRightContainer',
							'common/data/PostLoad'
							],function(r){
	var BUI = r('bui/common'),Component = BUI.Component
		List = r('bui/list'),
		Data = r('bui/data'),
		Toolbar = r('bui/toolbar'),
		LeftRightContainer = r('common/container/LeftRightContainer'),
		PostLoad = r('common/data/PostLoad');
	
	var TreeSort = Component.Controller.extend({
		initializer : function(){
			var _self = this;	
			_self.addChild(_self._initLRContainer());
		},
		renderUI : function(){
		},
		
		_initLRContainer : function(){
			var _self = this;
	    	var lrContainer = new LeftRightContainer({
	    		id : 'sortContainer',
	    		leftChildren : [_self._initList()],
	    		rightChildren : [_self._initBtns()],
	    		leftSize : 18,
	    	});
	    	return lrContainer;
		},
		/**
		 * 左部列表
		 */
		_initList:function(){
	    	var _self = this;
	    	var list = new List.SimpleList({
	    		id : "sortList",
	    		store : _self._storeSort(),
	    		width : 180,
	    		height : 300,
	    		elCls : ' bui-select-list',
	    		elStyle : {'overflow-y':'auto','overflow-x':'auto'}
	    	});
	    	_self.set('list',list);
	    	return list;
	    },
	    
	    /**
	     * 右部按键区
	     */
	    _initBtns:function(){
	    	var _self = this;
	    	var buttonGroup = new Toolbar.Bar({
	    		  id:'sortBtn',
	    		  elStyle : {'margin-top':'75px','margin-left':'4px'},
	    	      elCls : 'sortButtons',
	    	      defaultChildCfg : {
	    	        elCls : ' button button-small sortBtn',
	    	      },
	    	      children : [{
	    	    	  content:'<i class=" icon-chevron-up sortTreeBtn"></i>置顶',width:'50px',id:'topSortBtn',handler:function(){_self._toTop()}
	    	      },
	    	      {
	    	    	  content:'<i class="icon-arrow-up sortTreeBtn"></i>上移',width:'50px', id:'upSortBtn',elStyle:{'margin-top':'15px'},handler:function(){_self._itemUpDown(true)}
	    	      },
	    	      {
	    	    	  content:'<i class="icon-arrow-down sortTreeBtn"></i>下移',width:'50px', id:'downSortBtn',elStyle:{'margin-top':'15px'},handler:function(){_self._itemUpDown(false)}
	    	      },
	    	      {
	    	    	  content:'<i class=" icon-chevron-down sortTreeBtn"></i>置底',width:'50px', id:'bottomSortBtn',elStyle:{'margin-top':'15px'},handler:function(){_self._toBottom()}
	    	      }]
	    	});
	    	return  buttonGroup;
	    },
	    
	    /**
	     * 获取列表数据
	     */
	    _storeSort:function(){
	    	var _self = this;
	    	var storeSort = new Data.Store({
				autoLoad : true
			});
			storeSort.load();
			var post = new PostLoad({
				  url : _self.get('leftDataUrl'),
				  el : _self.get('el'),
				  loadMsg : '查询中...'
			});
			var data = {};
			if(_self.get('treeId')){
				data = _self.get('treeId');
			}
			post.load(data,function(result){
				storeSort.setResult(result);
			});
	     _self.set("storeSort",storeSort);
	     return storeSort;
	    },
	    
	    /**
		 * 将选中的工作项目向上/下移动
		 * isUp : true 向上移动
		 *        false向下移动
		 */
		_itemUpDown:function(isUp){
			var _self = this,storeSort = _self.get('storeSort'),list = _self.get('list');
			var forMoveRecords = list.getSelection();
	    	var records = storeSort.getResult();
			var affectIdxs = new Array();//受排序影响有变动的源数组下标
			for(var i = 0;i < forMoveRecords.length;i++){//先将被选中的记录序号收入集合
				var moveRecord = forMoveRecords[i];
				var moveIdx = storeSort.findIndexBy(moveRecord);
				affectIdxs.push(moveIdx);
			};
			if(isUp){
				affectIdxs.sort(function(a,b){return a - b;});//根据序号大小升序排列
				for(var i = 0;i < affectIdxs.length;i++){//将被排序影响的记录置入数据源中
					var moveIdx = affectIdxs[i];
					if(moveIdx == 0){
						continue;
					}
					var affectIdx = moveIdx - 1;
					var affectRecord = records[affectIdx];
					records[affectIdx] = records[moveIdx];
					records[moveIdx] = affectRecord;
				}
			}else{
				affectIdxs.sort(function(a,b){return b - a;});//根据序号大小降序排列
				for(var i = 0;i < affectIdxs.length;i++){//将被排序影响的记录置入数据源中
					var moveIdx = affectIdxs[i];
					if(moveIdx == records.length - 1){
						continue;
					}
					var affectIdx = moveIdx + 1;
					var affectRecord = records[affectIdx];
					records[affectIdx] = records[moveIdx];
					records[moveIdx] = affectRecord;
				}
			}
			storeSort.setResult(records);
			list.setSelection(forMoveRecords);
			//设置滚动条跟随
			var selectIdx = 0;//选择项的下标
			for(var i=0;i<list.getItems().length;i++){
				if(list.getSelected().value == list.getItems()[i].value){
					selectIdx = i;
				}
			};
			var h = $('.bui-simple-list .bui-list-item').eq(1).outerHeight(true)*selectIdx;//列表的高度
			list.get('el').scrollTop(h);
		},
		
	    /**
	     * 判断一个数组中是否包含对应的值
	     */
	    _arrContains : function(arr,value){
	    	if(arr == null || arr.length == 0 || value == null){
	    		return false;
	    	}
	    	for(var i = 0;i < arr.length;i++){
	    		if(arr[i] == value){
	    			return true;
	    		}
	    	}
	    	return false;
	    },
	    
	    /**
	     * 置顶
	     */
	    _toTop : function(){
	    	var _self = this,storeSort = _self.get('storeSort'),list = _self.get('list');
	    	var forMoveRecords = list.getSelection();
	    	var records = storeSort.getResult();
	    	var affectIdxs = new Array();//受排序影响有变动的源数组下标
	    	for(var i = 0;i < forMoveRecords.length;i++){//先将被选中的记录序号收入集合
	    		var moveRecord = forMoveRecords[i];
	    		var moveIdx = storeSort.findIndexBy(moveRecord);
	    		affectIdxs.push(moveIdx);
	    	}
	    	affectIdxs.sort(function(a,b){return a - b;});//根据序号大小升序排列
	    	var newRecords = new Array();
	    	for(var i = 0;i < affectIdxs.length;i++){//将被排序影响的记录置入数据源中
	    		newRecords.push(records[affectIdxs[i]]);
	    	}
	    	for(var i = 0;i < records.length;i++){
	    		if(!_self._arrContains(affectIdxs,i)){
	    			newRecords.push(records[i]);
	    		}
	    	}
	    	//重新设置本地数据源
	    	storeSort.setResult(newRecords);
	    	//保持移动工作项目的被选中状态
	    	list.setSelection(forMoveRecords);
	    	//设置滚动条跟随
	    	list.get('el').scrollTop(0);
	    },
	    
	    /**
	     * 置底
	     */
	    _toBottom : function(){
	    	var _self = this,storeSort = _self.get('storeSort'),list = _self.get('list');
	    	var forMoveRecords = list.getSelection();
	    	var records = storeSort.getResult();
	    	var affectIdxs = new Array();//受排序影响有变动的源数组下标
	    	for(var i = 0;i < forMoveRecords.length;i++){//先将被选中的记录序号收入集合
	    		var moveRecord = forMoveRecords[i];
	    		var moveIdx = storeSort.findIndexBy(moveRecord);
	    		affectIdxs.push(moveIdx);
	    	}
	    	affectIdxs.sort(function(a,b){return a - b;});//根据序号大小升序排列
	    	var newRecords = new Array();
	    	for(var i = 0;i < records.length;i++){
	    		if(!_self._arrContains(affectIdxs,i)){
	    			newRecords.push(records[i]);
	    		}
	    	}
	    	for(var i = 0;i < affectIdxs.length;i++){//将被排序影响的记录置入数据源中
	    		newRecords.push(records[affectIdxs[i]]);
	    	}
	    	//重新设置本地数据源
	    	storeSort.setResult(newRecords);
	    	//保持移动工作项目的被选中状态
	    	list.setSelection(forMoveRecords);
	    	//设置滚动条跟随
	    	var index = list.getItems().length;//列表的列数
			var h = $('.bui-simple-list .bui-list-item').eq(1).outerHeight(true)*index;//列表的高度
	    	list.get('el').scrollTop(h);
	    },
	},{
		ATTRS : {
			id : {value : 'treeSort'},
			elAttrs : {value : {id : 'sortDialog'}},
			title : {value : '顺序调整'},
			closeAction : {value : "destroy"},
			height : {value : 400},
			treeId : {value : ''},
			leftDataUrl : {}
		}
	});
	return TreeSort;
});
