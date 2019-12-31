/**
 * 左边页面上的查询表单
 */
define('common/chooseExecuteUser/OrganizationTree',['bui/common','bui/data','bui/tree'],function(require){
	var BUI = require('bui/common'),Component = BUI.Component,
	Data=require('bui/data'),
	Tree = require('bui/tree'),
	ORGTREE_ID = 'common-orgpicker';
	var OrganizationTree =  Component.Controller.extend(
	{
		initializer:function(){
			var _self = this,orgTree = _self._initTree();
			_self.addChild(orgTree);
		},
		//根据传入的URL路径获取数据源
		_initTree : function(){
			var _self = this;
			var disabledValue = false;//tree是否可编辑
			var colorValue = 'black';//tree字体颜色
			if(_self.get('orgType')==ORG_TYPE_CJ){
				disabledValue = true;
				colorValue = 'gray';
			}
			/*
			*渲染ORG组织机构树
			*/
			var treeStore = new Data.TreeStore({
//				root : {
//					id : _self.get('rootOrgId'),
//					text : _self.get('rootOrgText')
//				},
				url : _self.get('url'),
				proxy : {
					method : 'post'
				},
				map : {	// 节点映射
					'name' : 'text',	// 节点显示文本
					'isdept' : 'leaf'	// 是否为叶子节点
				}
			});
			// 默认加载根节点
			treeStore.load({id : _self.get('rootOrgId')});
			var tree = new Tree.TreeList({
				id : ORGTREE_ID,
				store : treeStore,
//				showRoot : _self.get('showRoot'),
				checkType : 'custom',
				showLine : true,	//显示连接线
				cascadeCheckd : false, //不级联勾选
				width : _self.get('width'), 
				height : _self.get('height'),
				disabled : disabledValue,
				elStyle : {color:colorValue}
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
			_self.getChild(ORGTREE_ID).on('itemselected',function(ev){
				_self.fire("orgSelected",{					
					org : ev.item
				});
			});
			
			
		}
	},
	{
	    /**
	     * 
	     */
	    ATTRS : {
	    	/**
	    	 * 必填项
	    	 * 根节点组织机构ID
	    	 */
	    	rootOrgId:{},
	    	/**
	    	 * 必填项
	    	 * 根节点组织机构名称
	    	 */
	    	rootOrgText:{},
	    	/**
	    	 * 必填项
	    	 * 访问数据源的URL路径
	    	 */
	    	url:{},
	    	/**
	    	 * 设置宽度,默认宽度200
	    	 */
	    	width:{value:200},
	    	/**
	    	 * 设置高度，默认高度200
	    	 */
	    	height:{value:410},
	    	/**
	    	 * 是否显示根节点，默认显示
	    	 */
	    	showRoot : {value : true},
	    	/**
	    	 *  事件
	    	 */	    	
	    	events:{
	    		value: {
	    			/**
	    			 * orgSelected  选择一条数据
	    			 */
	    			'orgSelected': true	    			
	    			}
	    	},
	    	orgType:{}
	    }
	}
	);
	return OrganizationTree;	
});