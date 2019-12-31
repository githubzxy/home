/**
 * 机构排序模块
 */
define('views/emergencyOrg/LeftOrgTreeSort',[
	'common/container/LeftRightContainer',
	'bui/list',
	'bui/toolbar',
	'bui/data'
],function(r){
	var Overlay=r('bui/overlay'),
	LeftRightContainer = r('common/container/LeftRightContainer'),
	List = r('bui/list'),
	Toolbar = r('bui/toolbar'),
	Data = r('bui/data');
	var LeftOrgTreeSort = Overlay.Dialog.extend({
		initializer : function(){
			var _self=this;	
			_self.addChild(_self._initLRContainer());
		},
		renderUI:function(){
			var _self=this;
			var buttons = [
				 {
	                  text:'保存',
	                  elCls : 'button',
	                  handler : function(){
	                	  var success = _self.get('success');
				            if(success){
				              success.call(_self);
				            }
	                  }
	                },{
	                  text:'关闭',
	                  elCls : 'button',
	                  handler : function(){
	                	  if(this.onCancel() !== false){
					        	this.close();
					        }
	                  }
	                }
			];
			_self.set('buttons',buttons);
		},
		_initLRContainer: function(){
			var _self=this;
	    	var lrContainer = new LeftRightContainer({
	    		id:'sortContainer',
	    		leftChildren:[_self._initList()],
	    		rightChildren:[_self._initBtns()],
	    		leftSize:18
	    	});
	    	return lrContainer;
		},
		/**
		 * 左部列表
		 */
		_initList:function(){
			var _self=this;
	    	var list = new List.SimpleList({
	    		id : "sortList",
	    		store : _self._storeSort(),
				height : 300,
	    		elCls : ' bui-select-list',
	    		elStyle : {'overflow-y':'auto','overflow-x':'auto'}
	    	});
	    	_self.set('list',list);
	    	return list;
		},
		/**
		 * 列表数据
		 */
		_storeSort: function(){
			var _self=this,contextPath=_self.get('contextPath'),orgId = _self.get('orgId');
			var storeSort = new Data.Store({
				autoLoad : true
			});
			storeSort.load();
			$.post(
					contextPath + 'emergencyOrgAction/getChildrenByParentId.cn',
					{
						parentId : orgId
					},
					function(data,status){
						storeSort.setResult(data);
					}, 
			'json');
	     _self.set("storeSort",storeSort);
	     console.log(storeSort);
	     return storeSort;
		},
		/**
		 * 右部按键区
		 */
		_initBtns:function(){
			var _self=this;
	    	var buttonGroup = new Toolbar.Bar({
	    		  id:'sortBtn',
	    		  elStyle : {'margin-top':'75px','margin-left':'4px'},
	    	      elCls : 'sortButtons',
	    	      defaultChildCfg : {
	    	        elCls : ' button button-small ',
	    	      },
	    	      children : [{content : '<i class=" icon-chevron-up sortTreeBtn"></i>'+'置顶',width:'50px', elStyle :{margin:'10px'}, id:'topSortBtn',handler : function(){_self._toTop()}},
	    	    	  		  {content : '<i class="icon-arrow-up sortTreeBtn"></i>'+'上移',width:'50px', elStyle :{margin:'10px'}, id:'upSortBtn',handler : function(){_self._itemUpDown(true)}},
	    	    	  		  {content : '<i class="icon-arrow-down sortTreeBtn"></i>'+'下移',width:'50px', elStyle :{margin:'10px'}, id:'downSortBtn',handler : function(){_self._itemUpDown(false)}},
	    	    	  		  {content : '<i class=" icon-chevron-down sortTreeBtn"></i>'+'置底',width:'50px', elStyle :{margin:'10px'}, id:'bottomSortBtn',handler : function(){_self._toBottom()}} 
	    	    	  		  ] 
	    	});
	    	return  buttonGroup;
		},
		/**
		 * 将选中的工作项目向上/下移动
		 * isUp : true 向上移动
		 *        false向下移动
		 */
		_itemUpDown: function(isUp){
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
		_toTop: function(){
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
		_toBottom: function(){
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
		/**
	     * 保存事件
	     */
		_sortSave: function(){
			var _self = this,storeSort = _self.get('storeSort');
	    	var records = storeSort.getResult();
	    	var listAllValue = "";
	    	for(var i = 0; i < records.length;i++){
	    		var record  = records[i];
	    		listAllValue += record.value + ",";
	    	}
	    	listAllValue = listAllValue.substring(0, listAllValue.length - 1);
	    	$.post(
				contextPath + 'emergencyOrgAction/sortOrg.cn',
				{
					"sortId" : listAllValue
				},
				function(data,status){
					console.log(status);
					_self.fire("sortSaveBtn",{
						status : status})
				}, 
			'json');
		}
	},{
		ATTRS : {
			id:{value: 'treeSortDialog'},
			title: {value:'顺序调整'},
			width : 300,
			height : 400,
			closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
   			mask : true,
   			typeId:{},
			contextPath:{},
			events:{
				values:{'sortSaveBtn':true}
			},
			success:{
				value:function(){
					var _self=this;
					_self._sortSave();
				}
			}
		}
	});
	return LeftOrgTreeSort;
});