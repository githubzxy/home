/**
 * 备品审核弹出框
 */
define('views/dailySpare/SpareUserSituation',[
								'bui/overlay',
								'common/data/PostLoad',
								'bui/grid','bui/data', 'bui/form','bui/toolbar'
								],function(require){
	var Overlay = require('bui/overlay'),
	PostLoad = require('common/data/PostLoad'),
	Grid = require('bui/grid'),
	Data = require('bui/data'), 
	Form = require('bui/form'),
	Toolbar = require('bui/toolbar');
	var SpareUserSituation = Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			_self.set('buttons',[]);
			var topChild = {id : 'topChild',xclass:'controller',content:'<div id="topBar" style=" float:left;"></div>'};
			var bottomChild = {id : 'bottomChild',xclass:'controller',content:'<div id="gridDetailIn"></div><div id="gridDetailOut" style="display:none;"></div>'};
			_self.addChild(topChild);
			_self.addChild(bottomChild);
		},
        //绑定事件
		bindUI : function(){
			var _self = this;
			var barDetail = _self.get('barDetail');
			barDetail.on('itemclick',function(ev){
	       	btnId=ev.item.get('id');
	       	
	        if(btnId=='in'){
	        	 $("#gridDetailOut").hide();
	        	 $("#gridDetailIn").show();
	        	 _self.get('storeDetailIn').load();
//	        	 _self.get('gridDetailIn').set('height',_self.get('height')-_self.get('barDetail').get('height')-64);
	         }else{
	        	 $("#gridDetailIn").hide();
	        	 $("#gridDetailOut").show();
	        	 _self.get('storeDetailOut').load();
//	        	 _self.get('gridDetailOut').set('height',_self.get('height')-_self.get('barDetail').get('height')-64);
	         }
	       });
		},
		renderUI : function(){
			var _self = this;
			_self._initBar();
			_self._initGridDetail();
		},
		_initBar : function(){
			var _self = this;
			var barDetail = new Toolbar.Bar({
		         elCls : 'button-group',
		         itemStatusCls  : {
		             selected : 'active' //选中时应用的样式
		         },
		         defaultChildCfg : {
		           elCls : 'button button-small',
		           selectable : true //允许选中
		         },
		         children : [
		           {content : '入库记录',id:'in', selected : true},
		           {content : '出库记录',id:'out'}
		         ],
		         render : '#topBar'
		      });
			barDetail.render();
			_self.set('barDetail',barDetail);
			
		},
		_initGridDetail: function(){
			var _self = this;
			/*入库记录开始*/    
			 var columnsDetailIn = [{
				title:'入库时间',
				dataIndex:'date',
				elCls : 'center',
				width:'20%'
			},{
				title:'入库人',
				dataIndex:'user',
				elCls : 'center',
				width:'20%'
			},{
				title:'入库数量',
				dataIndex:'amount',
				elCls : 'center',
				width:'20%'
			},{
				title:'使用详情',
				dataIndex:'reason',
				elCls : 'center',
				width:'40%'
			}];
			
			storeDetailIn = new Data.Store({
				url : contextPath+'dailySpare/spareUseStockAction/getSpareUseStock.cn',
				params : {         //设置请求时的参数
					sparePartId:_self.get('sparePartId'),
					state:'1'//入库状态
					},
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				autoLoad : true,
				pageSize : 10
			});
			
			//表格设置
			gridDetailIn = new Grid.Grid({
				render : '#gridDetailIn',
				width : '100%',//如果表格使用百分比，这个属性一定要设置
				height : 345,
				columns : columnsDetailIn,
				bbar : {pagingBar : true},
				plugins : [Grid.Plugins.RowNumber],
				store : storeDetailIn
			});
			gridDetailIn.render();
			/*入库记录结束*/
			
			/*出库记录开始*/
			var columnsDetailOut = [{
				title:'出库时间',
				dataIndex:'date',
				elCls : 'center',
				width:'20%'
			},{
				title:'出库人',
				dataIndex:'user',
				elCls : 'center',
				width:'20%'
			},{
				title:'出库数量',
				dataIndex:'amount',
				elCls : 'center',
				width:'20%'
			},{
				title:'使用详情',
				dataIndex:'reason',
				elCls : 'center',
				width:'40%'
			}];
			
			storeDetailOut = new Data.Store({
				url : contextPath+'dailySpare/spareUseStockAction/getSpareUseStock.cn',
				params : {         //设置请求时的参数
					sparePartId:_self.get('sparePartId'),
					state:'2'//出库状态
				    },
//		 		autoLoad : true,
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				pageSize : 10
			});
			
			//表格设置
			gridDetailOut = new Grid.Grid({
				render : '#gridDetailOut',
				width : '100%',//如果表格使用百分比，这个属性一定要设置
				height : 270,
				columns : columnsDetailOut,
				bbar : {pagingBar : true},
				plugins : [Grid.Plugins.RowNumber],
				store : storeDetailOut
			});
			gridDetailOut.render();
			/*出库记录结束*/
			_self.set('storeDetailIn',storeDetailIn);
			_self.set('storeDetailOut',storeDetailOut);
			_self.set('gridDetailIn',gridDetailIn);
			_self.set('gridDetailOut',gridDetailOut);
			
		}
	},{
		ATTRS : {//定义弹框属性
			
			title : {value : '备品备件使用情况'},
			width : {value : 750},
			height : {value : 400},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			sparePartId : {},
			closeAction : {value : 'destroy'},
			cancel : {
				value : function(){
					var _self = this;
					_self.fire("close");
				}
			}
			
		}
	});
	return SpareUserSituation;
});