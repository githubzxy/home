/**
 * 使用场景：页面存在树形结构，并对树进行操作(add,uodate,del,sort)
 * 使用方法：
 * var treeBtn = new treeBtn({
		btnItems : [
			{
				id : 'addTreeBtn',
				elCls : 'button button-small',
				content : '<i class="icon-plus "></i>新增',
				elStyle : {'margin-left' : '5px'}
			},
			{
				id : 'updateTreeBtn',
				elCls : 'button button-small',
				content : '<i class="icon-edit"></i>修改',
				elStyle : {'margin-left' : '5px'}
			},
			{
				id : 'delTreeBtn',
				elCls : 'button button-small',
				content : '<i class="icon-remove"></i>删除',
				elStyle : {'margin-left' : '5px'}
			},
			{
				id : 'sortTreeBtn',
				elCls : 'button button-small',
				content : '<i class="icon-retweet"></i>排序',
				elStyle : {'margin-left' : '5px'}
			}
		],
		treeBtnPermission : _self._initTreeBtnPermission()// 按钮权限
	})
 */
define('common/tree/TreeBtn',[
							'bui/common', 'bui/toolbar'
							],function(r){
	var BUI = r('bui/common'), Component = BUI.Component, 
		Toolbar = r('bui/toolbar'),
		TREE_BTN_ID = 'treeBtnId';
	
	var TreeBtn = Component.Controller.extend({
		initializer : function(){
			var _self = this;
			var buttons = _self._initButtons();
			_self.addChild(buttons);
			_self._initButtonsPermission();
		},
		renderUI:function(){
			var _self = this;
		},
		bindUI : function(){
			var _self = this;
		},
		_filterTbarButton : function(allowBtn){
			var _self = this,tbarContainer = _self.get('el').find('.button-group');
			var notBtn = true;
			tbarContainer.find('.button').each(function(){
				var btnText =  $(this).text();
				if(!BUI.Array.contains(btnText,allowBtn)){
					$(this).hide();
				}
				if($.inArray(btnText, allowBtn) != -1){
					notBtn = false;
				}
			});
			if(notBtn){
				$('#treeBtnId').css('height','0px');
			}
		},
		_initButtonsPermission : function(){
			var _self = this;
			var treeBtnPermission = _self.get('treeBtnPermission');
			if(treeBtnPermission){
				treeBtnPermission.load(treeBtnPermission.get('params'),function(e){
					var records = treeBtnPermission.getResult(),
					btnArr = BUI.Array.map(records,function(record){
						return record.permissionDesc;
					});
					_self._filterTbarButton(btnArr);
				});
			}
		},
		_initButtons : function(){
			var _self = this;
			var buttonGroup = new Toolbar.Bar({
				id : 'buttons',
				elCls : 'button-group',
				elStyle : {
					'margin-top' : '2px',
					'margin-bottom' : '2px',
				},
			    children : _self.get('btnItems'),
			});
			return buttonGroup;
		},
	},{
		ATTRS : {
			id : {value : TREE_BTN_ID},
			elAttrs :{value : {id: TREE_BTN_ID}},
			btnItems : {},
			treeBtnPermission : {}
		},
		TREE_BTN_ID : TREE_BTN_ID
	});
	return TreeBtn;
});
