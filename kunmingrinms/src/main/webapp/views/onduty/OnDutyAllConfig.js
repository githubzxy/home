/**
 * 配置值班部门模块
 */
define('views/onduty/OnDutyAllConfig',['bui/common','bui/data','common/data/PostLoad','bui/grid'],function(require){
	var BUI = require('bui/common'),
	Grid = require('bui/grid'),
	PostLoad = require('common/data/PostLoad'),
	Data = require('bui/data');
	var OnDutyAllConfig = BUI.Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;			
			var grid = _self._initGrid();			
			_self.addChild(grid);
		},		
		renderUI : function(){
	
		},
		bindUI : function(){
			var _self = this;
			//定义按键
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
		
		/**
		 * 表格
		 */
		_initGrid : function() {
			var _self = this,store = _self._initStore();
			var grid = new Grid.Grid({
				store : store,
				columns : _self._initColumns(),
				itemStatusFields : {
					selected : 'hasOnDuty'
				},
				plugins : [
		        	Grid.Plugins.CheckSelection,//多选框插件
					Grid.Plugins.RowNumber//列序号插件
				],
			}); 
			_self.set('grid',grid);
			return grid;
		},
		/**
		 * 数据源
		 */
		_initStore : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var store = new Data.Store({
				url : contextPath+'onDutyDeptAction/getOnDutyByDto.cn',
				autoLoad : true,
				proxy : {
					method : 'post',
					dataType : 'json'
				},
			});
			return store;
		},
		/**
		 * 列表表头
		 */
		_initColumns : function() {	
			var columns = [{
				title : '值班部门',
				dataIndex : 'orgName',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '100%'				
			}]
			return columns;
		},
				
	},{
		ATTRS : {			
			title:{value:'值班部门配置'},				
			bodyStyle : {padding : 0},
			elAttrs : {value: {id:"onDutyAllConfig"}},
            width:{value:350},
            height:{value:450},
            contextPath : {},
            closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},          
            success:{
            	value : function(){
					var _self = this,contextPath = _self.get('contextPath');
					var grid = _self.get('grid');
					var orgIds = "";
					var selectedAll = grid.getSelection();
					if(selectedAll.length==0){
						_self.fire("completeSave",{					
  							result : {status:'2',msg:'请至少选择一个部门！'}
		    			  });
						return;
					}
					for(var i in selectedAll) {
						orgIds += "," + selectedAll[i].orgId ;
					}
					orgIds = orgIds.substring(1);
					var postLoad =new PostLoad({
						url:contextPath +  'onDutyDeptAction/saveOnDutyOrg.cn',
						el:'#onDutyAllConfig',
						loadMsg:'保存中...'
					}); 			    	
					postLoad.load({orgIds : orgIds},function(result){
						_self.fire("completeSave",{					
  							result : result
		    			  });
					});
			    }
            },
        	events : {
				value : {
					/**
					 * 绑定保存按钮事件
					 */
					'completeSave' : true
				}
			}
		}
	});
	return OnDutyAllConfig;
});

