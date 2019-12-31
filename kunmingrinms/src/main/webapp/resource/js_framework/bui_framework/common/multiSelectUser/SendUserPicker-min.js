/**
 * 人选多选框
 */
define('common/multiSelectUser/SendUserPicker',['bui/overlay','bui/data','bui/tree','bui/common'],function(require){
	
	var BUI = require('bui/common'),
	Overlay = require('bui/overlay').Overlay,
	Data=require('bui/data'),
	Tree = require('bui/tree'),
	ORGTREE_ID = 'common-orgpicker';
	var OrganizationPicker = Overlay.extend(
	{
		initializer:function(){
			var _self = this,orgTree = _self._initTree();
			_self.addChild(orgTree);
		},
		
		_initTree : function(){
			var _self = this;
			
			var treeStore = new Data.TreeStore({
				url : _self.get('url'),
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				map : {	// 节点映射
					'id' : 'id',
					'name' : 'text',	// 节点显示文本
				}
			});
			
			treeStore.load({orgId : _self.get('orgId')});
			var tree = new Tree.TreeList({
				id : ORGTREE_ID,
				store : treeStore,
				showRoot : _self.get('showRoot'),
				checkType : 'all',
				showLine : true,	//显示连接线
				cascadeCheckd : false, //不级联勾选
				width : _self.get('width'), 
				height : _self.get('height')
			});	
			_self.set('commonTreeStore',treeStore);
			return tree;

		},
		load : function(param){
			var _self = this,store = _self.get('commonTreeStore');
			if(store)
				store.load(param);
		},
		bindUI : function(){
			var _self = this;
			var tree = _self.getChild(ORGTREE_ID);
			var parentId = '';
			if(_self.get('parentControllerId')){
				parentId = '#'+_self.get('parentControllerId');
			}
			tree.on('checkedchange',function(ev){
				var checkedNodes = tree.getCheckedNodes();
		        var str = '';
		        var sstr = '';
		        BUI.each(checkedNodes,function(node){
		          str += node.text + ',';
		          sstr += node.id + ',';
		        });
		        $(parentId +' #user').val(str);
		        $(parentId +' #userId').val(sstr);
			});
			
			
		}
	},
	{
	    /**
	     * 
	     */
	    ATTRS : {
	    	parentControllerId:{},//父容器id
	    	elStyle:{value:{zIndex:99999}},
	    	/**
	    	 * 组织机构ID 用于查询派发用户
	    	 */
	    	orgId : {},
	    	/**
	    	 * 必填项
	    	 * 根节点组织机构ID
	    	 */
	    	url:{},
	    	/**
	    	 * 设置宽度,默认宽度200
	    	 */
	    	width:{value:200},
	    	/**
	    	 * 设置高度，默认高度200
	    	 */
	    	height:{value:200},
	    	/**
	    	 * 是否显示根节点，默认显示
	    	 */
	    	showRoot : {value : false},
	    	
	    }
	}
	);
	return OrganizationPicker;	
});