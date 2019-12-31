/**
 * 信息发布-首页模块
 */
define('views/hhkj/home/MessagePage',[
									'bui/common','bui/data','bui/list','bui/layout',
									'views/hhkj/home/MessageDetail'
									],function(r){
	var BUI = r('bui/common'), Layout = r('bui/layout'),
    	Data = r('bui/data'), List = r('bui/list'),
    	MessageDetail = r('views/hhkj/home/MessageDetail');
	
	var MessagePage = BUI.Component.Controller.extend({
		initializer : function(){
			var _self = this;
			var container = new Layout.Viewport({
				elCls : 'ext-border-layout',
				plugins : [Layout.Border],
			});
			var messageList = _self._initMessageList();
			container.addChild(messageList);
			_self.addChild(container);
		},
		renderUI : function(){
			var _self = this;
			$('.messageDiv .x-border-title-west').css('font-size', '23px');
			$('.messageDiv .x-border-title-west').css('font-weight', 'bold');
			$('.messageDiv .x-border-title-west').css('color', '#222');
			$('.messageDiv .x-border-title-west').css('height', '25px');
			$('.messageDiv .x-border-title-west').css('padding-top', '36px');
			$('.messageDiv .x-border-title-west').css('padding-bottom', '26px');
			$('.messageDiv .x-border-title-west').css('background-repeat', 'repeat-x');
			$('.messageDiv .x-border-title-west').css('text-align', 'center');
		},
		bindUI : function(){
			var _self = this,contextPath = _self.get('contextPath'),userId = _self.get('userId');
			var messageList = _self.get('messageList');
			//定义信息列表点击事件
			messageList.on("itemclick", function(ev) {				
				var messageId = ev.item.id;
				var messageDialog = new MessageDetail({
					id : messageId,
					contextPath : contextPath
				});
				messageDialog.show();
			});
			//定义信息发布更多点击事件
			$("#more").on('click',function(){
				var threePerName = "信息发布";
				var threeModulePath="../views/message/messagePage.jsp";
				var threePerId="4028811c41a001630141a13812120539";
				window.open("http://10.160.94.86/kunmingrinms/informationDeliveryEntry/infoDelivery.cn?userKey=" + userId);
			})
		},
		/**
		 * 左边信息列
		 */
		_initMessageList : function () {
			var _self = this;
			//左侧信息发布数据源
			var messageStore = new Data.Store({
				url : contextPath + 'homeAction/getHomeMessage.cn',
				autoLoad : true,
				proxy : {
					method : 'post'
				}
			});
			var messageList = new List.SimpleList({
				id : 'messageList',
				elAttrs : {id:"messageListId"},
			    layout : {
			    	title : '信息发布',
					region : 'west',
					fit : 'both',
					collapsable : true,
				},
				idField : 'id',
				itemTplRender : function(item){	
					return '<li id="{id}"><b>['+message_type.typeName(item.type)+']</b>    ' + item.theme + '    ' + item.createTime + '</li>';
				},
				store : messageStore,
				children:[{
					xclass : 'controller',
					content:'<div id="more" style="margin:10px;padding-right:200px;float:right;"><a  href="javascript:;">......更多>>></a></div>'
				}]

			});
			_self.set('messageList',messageList);
			return messageList;
		},	
	},{
		ATTRS : {
			elAttrs : {value: {id:"messagePageId"}},
			elCls : {value :'messageDiv'},
			contextPath : {},
			userId : {}
		}
	});
	return MessagePage;
});
