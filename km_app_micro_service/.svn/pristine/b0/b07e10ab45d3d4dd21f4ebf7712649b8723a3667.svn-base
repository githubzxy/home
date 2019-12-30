/**
 * 主界面右下业务显示模块,以导航tab页形式加载各业务页面在主界面上显示
 */
define('/frame/RightNav',['bui/tab'],function(require){
	var Tab = require('bui/tab');
	var RightNav= Tab.NavTab.extend({
		addOrActiveTab:function(data){
			var _self=this,href = data.href?data.href + "?threePerId=" + data.id:'#';
			var hasTab = _self.getItemById(data.id);
			if(hasTab){
				_self.setActived(data.id);
			}else if(href!='#'){
				_self.addTab({title:data.text,id:data.id,actived:true,href:href});
			}
		}
	},{
		ATTRS : {
		}
	});
	return RightNav;
});