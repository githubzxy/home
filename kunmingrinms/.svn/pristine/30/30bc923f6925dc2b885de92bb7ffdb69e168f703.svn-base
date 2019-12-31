define('views/onduty/OnDutyAdd',[
			'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer',
			'common/data/PostLoad','bui/mask',
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),
		FormContainer = require('common/form/FormContainer'),Mask = require('bui/mask'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay'),PostLoad=require('common/data/PostLoad');
	var OnDutyAdd=Overlay.Dialog.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._initForm());
			_self.addChild(_self._initGrid())
		},
//	************初始化页面*********************
		_initForm:function(){
			var _self=this;
			var form = new FormContainer({
				id:'addOnDutyForm',
				colNum:2,
				formChildrens:[{
					label:'值班日期',
		    		redStarFlag : true,
		    		itemColspan : 1,
		    		item:'<input type="text" id="addDutyDate" class="calendarAdd" style="width: 99%;"  readOnly="readonly" data-rules="{required:true}"/>'
				},{
					label:'星期',
					redStarFlag : false,
		    		itemColspan : 1,
		    		item:'<input type="text"  id="addWeek" class="input-normal" style="width: 99%;" disabled="disabled"/>',
				}],
			});
				return form;
		},
		_initGrid:function(){
			var _self=this;
			var columns = [{
				title : '值班部门',
				dataIndex : 'organization',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '35%',
				renderer:function(value) {
					return value == null ? "" : value.name;
				}
			},{
				title : '值班人',
				dataIndex : 'name',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '15%'
			},{
				title : '固定电话',
				dataIndex : 'telephoneNumber',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '25%'
			},{
				title : '手机',
				dataIndex : 'phone',
				elCls : 'center',
				sortable : false,	
				width : '25%'
			}];
			var grid = new Grid.Grid({
				id:'addOndutyGrid',
				idField : 'id',
				columns : columns,
				loadMask : true,
				store : _self._storeAddOnDuty(),
				width : '588',
				height : '330',
				//列表插件加载，最上方的插件最后加载，此处加载顺序为RowNumber\CheckSelection\AutoFit
				plugins : [ 
				            Grid.Plugins.CheckSelection,//多选框插件
				            Grid.Plugins.RowNumber,//列序号插件
				            ]
			});
				return grid;
		},
		_storeAddOnDuty:function(){
			var _self=this;
			var addStore = new Data.Store({
				proxy : {
					url : contextPath + "userAction/getUsersByOrgId.cn",//TODO异步数据源请求
					method : 'post'
				},
			});
			_self.set('storeAddOnDuty',addStore);
			return addStore;
		},
//	************初始化页面结束*******************
		renderUI:function(){
			var _self=this;
			_self.get('storeAddOnDuty').load({'orgId':_self.get('orgId')});
			_self._initBtn(_self);
			var datepicker = new Calendar.DatePicker({
				trigger : '.calendarAdd',
				autoRender : true,
				dateMask : 'yyyy/mm/dd'
			});
		},
//	*************初始化页面数据**********************	
		_initBtn:function(_self){
			var buttons = [
				{
					text:'保存',
					elCls:'button  _saveData',
					handler : function(){
			            	var _self = this,
			            	success = _self.get('success');
				            if(success){
				              success.call(_self);
				            }
					}
				},
				{
					  text:'取消',
					  elCls : 'button ',
					  handler : function(dialog,btn){
					        if(this.onCancel() !== false){
					        	this.close();
					        }
					  }
				}
			];
			_self.set('buttons',buttons);
		},
		
//	*************初始化页面数据**********************
		bindUI:function(){
			var _self=this;
			_self._changeDate();
		},
//	**************绑定事件**************************
		_changeDate:function(){
			$("#addDutyDate").change(function() {
					var addDutyDate = new Date($("#addDutyDate").val());
					$("#addWeek").val(weekToChinese(addDutyDate.getDay()+""));
			});
		},
//	**************绑定事件完*************************	
//	*************数据保存***************************
		_saveDate:function(){
			var _self=this;
			var addOnDutyForm =_self.getChild('addOnDutyForm',true); 
//			表单验证
			if(!addOnDutyForm.isValid()) {
				return ;
			}
			var addOndutyGrid = _self.getChild('addOndutyGrid',true);
//			表格验证
			if(!addOndutyGrid.getSelection().length){
				var el=_self.get('el');
				_self.set('zIndex',1060);
				BUI.Mask.maskElement(el[0]);
  				BUI.Message.Alert('请选择值班人员!',function(){
        			Mask.unmaskElement(el[0]);
        		});	
  				$('.bui-message .bui-ext-close').hide();
				return;
			}
			var onduyUsers = JSON.stringify(addOndutyGrid.getSelection());
			var dateStr= $("#addDutyDate").val();
			_self._postData(onduyUsers,dateStr);
		},
		_postData:function(onduyUsers,dateStr){
			var _self=this;
			var el=_self.get('el');
			var contextPath=_self.get('contextPath');
			var postLoad =new PostLoad({
				url:contextPath +  'ondutyNewAction/addBoth.cn',
				el:'#addOnDuty',
				loadMsg:'保存中...'
			}); 			    	
			postLoad.load({onduyUsers : onduyUsers,dateStr : dateStr},function(result){
				if(result.status == 2 && result.data == false){
					_self.zIndex=2000;
					Mask.maskElement('#addOnDuty');
      				BUI.Message.Alert(result.msg,function(){
      					Mask.unmaskElement('#addOnDuty');
            		});	
      				$('.bui-message .bui-ext-close').hide(); //隐藏掉关闭叉									
					return ;
				}
				_self.fire("saveBtn",{
				    result : result
				})
			});
		},
//	*************数据保存完**************************	
	},{ATTRS:{
		elAttrs : {value: {id:"addOnDuty"}},
		title:{value:'新增值班'},
		closeAction:{value:"destroy"},
		contextPath : {},
		orgId:{},
		width:{value:620},
		height:{value:458},
		mask:{value:true},
		events:{
    		value: {'saveBtn': true}
    	},
    	success:{
    		value:function(){
    		   this._saveDate();
    		},
    	},
	}});
	return OnDutyAdd;
});