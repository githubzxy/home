/**
 * 用于控制按钮权限的公用列表组件，使用方法和BUI的Grid一样，需要新增两个配置项：perId和contextPath。
 * perId是三级菜单的权限ID
 * 本组件仅用于昆铁安调系统
 */
define('mod/GridBtn', ['bui/common','bui/grid'], function(r) {
	var BUI = r('bui/common'),Grid = r('bui/grid');
	var GridBtn = Grid.Grid.extend({//获取到按钮权限数据后再渲染表格
		initializer:function(){
			var _self = this,perId = _self.get('perId'),contextPath = _self.get('contextPath');
			var btnArr = [];
			$.ajax({
				url : contextPath + 'permission/getBtnPers.cn',
				async: false,
				type : 'post',
				data : {'perId' : perId},
				success : function(data){
					JSON.parse(data).forEach(function(e){
						btnArr.push(e.permissionDesc);
					});
				}
			});
			_self.set('allowBtn',btnArr);
		},
		renderUI : function(){//在表格渲染完后，根据按钮权限的permissionDesc中文匹配相应的表格上方按钮，没有配置权限的按钮隐藏
			var _self = this,allowBtn = _self.get('allowBtn');
			$('.bui-grid-tbar button').each(function(){
				var btnText =  $(this).text();
				if(!BUI.Array.contains(btnText,allowBtn)){
					$(this).hide();
				}
			});
			
		},
		bindUI : function(){//在表格数据加载完成后，根据按钮权限的permissionDesc中文匹配表格最后一列按钮，没有配置权限的按钮隐藏
			var _self = this,store = _self.get('store'),allowBtn = _self.get('allowBtn');
			store.on('load',function(){
				$('.grid-command').each(function(){
					var btnText =  $(this).text();
					if(!BUI.Array.contains(btnText,allowBtn)){
						$(this).hide();
					}
				})
			});
		}
	}, {
		ATTRS : {
			perId : {},
			contextPath : {}
		}
	});
	return GridBtn;
});