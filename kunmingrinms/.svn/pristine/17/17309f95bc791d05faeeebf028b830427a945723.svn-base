/**
 * 全部值班记录新增模块
 */
define('views/onduty/OnDutyAllAdd',['bui/common','bui/data','bui/grid','bui/calendar',
	'bui/mask','common/data/PostLoad','common/org/OrganizationPicker','common/form/FormContainer'],function(require){
	var BUI = require('bui/common'),
	Calendar=require('bui/calendar'),
	Grid = require('bui/grid'),
	PostLoad = require('common/data/PostLoad'),
	Mask = require('bui/mask'),
	FormContainer = require('common/form/FormContainer'),
	Data = require('bui/data'),
	OrganizationPicker = require('common/org/OrganizationPicker')
	var OnDutyAllAdd = BUI.Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			var FormContainer = _self._initFormContainer();
			var searchGrid = _self._initSearchGrid();			
			_self.addChild(FormContainer);
			_self.addChild(searchGrid);
		},		
		renderUI : function(){
			var _self = this,contextPath = _self.get('contextPath');
			//初始化日期组件
			var datepicker = new Calendar.DatePicker({
				trigger : '.calendarAdd',
				autoRender : true,
				dateMask : 'yyyy/mm/dd'
			});
			//初始化值班部门树
			var addOrgPicker = new OrganizationPicker({
		          trigger : '#addOrgVal',
		          rootOrgId : gztxd_id,//必填项
		          rootOrgText : gztxd_name,//必填项
		          delegateTrigger : true, 
		          elStyle : {zIndex : 2222},
		          url : contextPath + 'organization/getOrgChildrenById.cn',//必填项
		          autoHide : true,
		          align : {
		               points : ['bl','tl']
		          },
		          width : 195,
		          height : 200
		 	 });
			addOrgPicker.render();	
			_self.set('addOrgPicker',addOrgPicker);
			
		},
		bindUI : function(){
			var _self = this,store = _self.get('store');		
			$(document).ready(function () {	
				// 根据日期填充星期
				$("#addDutyDate").change(function() {
					var addDutyDate = new Date($("#addDutyDate").val());
					$("#addWeek").val(weekToChinese(addDutyDate.getDay()+""));
				});	
				
			});
			
			// 点击条件查询中的申请单位,弹出组织机构树
			var addOrgPicker = _self.get('addOrgPicker');			
			addOrgPicker.on('orgSelected',function(e){
				 $('#addOrgVal').val(e.org.text);
				 $('#orgAddSelectId').val(e.org.id);
				 if(store){
						store.load({
							orgId: e.org.id,
							orgName : e.org.text
						});
					}
			});	
			
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
			
			$(".bui-message").css("z-index","1200");
		},
		
		/**
		 * 表单
		 */
		_initFormContainer : function(){
			var _self = this;
			var form = new FormContainer({
				id : 'addForm',
				colNum : 2,
				formChildrens : [
					{
						label : '值班日期',
						redStarFlag : true,
						item : '<input type="text" id="addDutyDate" class="calendarAdd" style="width:99%"  data-rules="{required:true}" readOnly="readonly"/>'
					},
					{
						label : '星期',
						item : '<input type="text"  id="addWeek" class="input-normal" style="width:99%"  disabled="disabled"/>'
					},
					{
						label : '值班部门',
						itemColspan : 2,
						redStarFlag : true,
						item : '<input type="text" id="addOrgVal" readOnly="readonly"/>'
							  +'<input type="hidden" name="addOrg" id="orgAddSelectId" />'
					}					
				]
			});
			_self.set('addForm',form);
			return form;
		},
		
		/**
		 * 表格
		 */
		_initSearchGrid : function() {
			var _self = this;
			var store = _self._initStore();
			var searchGrid = new Grid.Grid({
				store : store,
				columns : _self._initColumns(),
				plugins : [
		        	Grid.Plugins.CheckSelection,//多选框插件
					Grid.Plugins.RowNumber//列序号插件
				],
			});
			_self.set('addGrid',searchGrid);
			return searchGrid;
		},
		/**
		 * 数据源
		 */
		_initStore : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var store = new Data.Store({
				url : contextPath+'ondutyAction/getUsersByOrgName.cn',
				autoLoad : false,
				proxy : {
					method : 'post',
					dataType : 'json'
				},
			});
			_self.set('store',store);			
			return store;
		},
		/**
		 * 列表表头
		 */
		_initColumns : function() {	
			var columns = [{
				title : '值班部门',
				dataIndex : 'workshop',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '170',
				renderer:function(value) {
					return value == null ? "" : value;
				}
			},{
				title : '值班人',
				dataIndex : 'staffName',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '100',
			},{
				title : '固定电话',
				dataIndex : 'telephoneNumber',
				elCls : 'center',
				sortable : false,	// 表头不排序
				width : '105'
			},{
				title : '手机',
				dataIndex : 'phone',
				elCls : 'center',
				sortable : false,	
				width : '110'
			}];
			return columns;
		},
				
	},{
		ATTRS : {
			elAttrs : {value: {id:"ondutyAdd"}},
			title:{value:'新增值班'},
            width:{value:620},
            height:{value:450},
            contextPath : {},
            orgId:{},
            closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},          
            success:{
            	value : function(){
					var _self = this,contextPath = _self.get('contextPath'),
					addForm = _self.get('addForm'),
					addGrid = _self.get('addGrid');
					if(!addForm.isValid()) {
						return ;
					}
					var addSelectedAll = addGrid.getSelection();
					//验证是否选择值班部门，是否选择值班人员
					if($('#addOrgVal').val()==""){
						Mask.maskElement('#ondutyAdd');
						BUI.Message.Alert('请选择值班部门!',function(){
                			Mask.unmaskElement('#ondutyAdd');
                		});	
						$('.bui-message .bui-ext-close').hide();
						return;
					}else if(addSelectedAll.length == 0){
						Mask.maskElement('#ondutyAdd');						
          				BUI.Message.Alert('请选择值班人员!',function(){
                			Mask.unmaskElement('#ondutyAdd');
                		});	
          				$('.bui-message .bui-ext-close').hide();
          				return;
					}
					
					var onduyUsers = JSON.stringify(addSelectedAll);
					var dateStr = $("#addDutyDate").val();
					var postLoad =new PostLoad({
						url:contextPath +  'ondutyAction/addBoth.cn',
						el:'#ondutyAdd',
						loadMsg:'保存中...'
					}); 			    	
					postLoad.load({onduyUsers : onduyUsers,dateStr : dateStr},function(result){
						if(result.status == 2 && result.data == false){
							_self.zIndex=2000;
							Mask.maskElement('#ondutyAdd');
	          				BUI.Message.Alert(result.msg,function(){
	          					Mask.unmaskElement('#ondutyAdd');
	                		});	
	          				$('.bui-message .bui-ext-close').hide(); //隐藏掉关闭叉									
							return ;
						}
						_self.fire("completeAddSave",{
						    result : result
						})
					});
			    }
            },          
			events : {
				value : {
					/**
					 * 绑定保存按钮事件
					 */
					'completeAddSave' : true,					
				}
			}
		}
	});
	return OnDutyAllAdd;
});

