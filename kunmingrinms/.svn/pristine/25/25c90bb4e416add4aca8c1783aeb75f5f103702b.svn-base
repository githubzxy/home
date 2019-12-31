/**
 * 全部值班信息修改模块
 */
define('views/onduty/OnDutyAllUpdate',[
										'bui/overlay',
										'bui/form',
										'bui/select',
										'bui/mask',
										'bui/calendar',
										'common/uploader/UpdateUploader',
										'common/data/PostLoad',
										'common/form/FormContainer'
										],function(require){
	var Overlay = require('bui/overlay'),
	Form = require('bui/form'),
	Select = require('bui/select'),
	Mask = require('bui/mask'),
	Calendar = require('bui/calendar'),	
	UpdateUploader = require('common/uploader/UpdateUploader'),
	PostLoad = require('common/data/PostLoad'),
	FormContainer = require('common/form/FormContainer');
	var OnDutyAllUpdate = Overlay.Dialog.extend({
		//初始化弹框控件
		initializer : function(){
			var _self = this;
			var updateForm = _self._getForm();
			_self.addChild(updateForm);
		},
        //绑定事件
		bindUI : function(){
			var _self = this;
			// 根据日期填充星期
			$("#updateDutyDate").change(function() {
				var updateDutyDate = new Date($("#updateDutyDate").val());
				$("#updateWeek").val(weekToChinese(updateDutyDate.getDay()+""));
			});
		},
		renderUI : function(){
			var _self = this;			
			//回显数据
			_self._initData();
			//初始化日期组件
			var datepicker = new Calendar.DatePicker({
				trigger : '.calendarUpdate',
				autoRender : true,
				dateMask : 'yyyy/mm/dd'
			});
			var buttons = [
				{
					text:'保存',
					elCls:'button',
					handler : function(){
			            	var success = _self.get('success');
				            if(success){
				              success.call(_self);
				            }
					}
				},
				{
					  text:'取消',
					  elCls : 'button',
					  handler : function(dialog,btn){
					        if(this.onCancel() !== false){
					        	this.close();
					        }
					  }
				}
			];
			_self.set('buttons',buttons);
		},
		
		/**
		 * 回显数据赋值
		 */
		_initResult:function(result){
			var _self = this;
			_self._initQueryUser(result.user.organization.id, result.user.id);
			$("#updateFixedNum").val(result.fixedNum);
			$("#updateCellPhoneNum").val(result.cellPhoneNum);
			$("#updateDutyDate").val(_self._ConverToDates(result.dutyDate));
			$("#updateWeek").val(weekToChinese(result.week));
			$("#updateSituation").val(result.situation);
			if(result.user != null && result.user.organization != null) {
				$("#updateOnDutyOrg").val(result.user.organization.name);
				$("#updateFixedNum").val(result.user.telephoneNumber);
				$("#updateCellPhoneNum").val(result.user.phone);
			}
		},
		/**
		 * 时间格式转换一
		 */
		_ConverToDates: function(DateStr) {
            var myDate = new Date(DateStr);
            var strDate = myDate.getFullYear() + "/" + (myDate.getMonth() + 1) + "/" + myDate.getDate();
            return strDate;
        },
        /**
		 * 时间格式转换二
		 */
        _ConverToDate: function(DateStr) {
            var myDate = new Date(DateStr);
            var strDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate();
            return strDate;
        },
        
		/**
		 * 初始化下拉选
		 */
		_initQueryUser : function(orgId, userId){
			var postLoad =new PostLoad({
				url:contextPath +  'userAction/getUsersByOrgId.cn',
				el:'#onDutyUpdate',
				loadMsg:'查询中...'
			}); 			    	
			postLoad.load({orgId : orgId},function(data){	
				for(var i in data){
					if(userId != data[i].id){
						if(data[i].id){
							$("#updateUser").append("<option value='" + JSON.stringify(data[i]) + "' >" + data[i].name+ "</option>");
						}else{
							continue;
						}
					}else{
						$("#updateUser").append("<option selected='selected' value='" + JSON.stringify(data[i]) + "' >" + data[i].name+ "</option>");
					}
				}
			});
		},			
		/**
		 * 初始化修改数据
		 */
		_initData : function(){
			var _self = this,contextPath = _self.get('contextPath');
			var ondutyId = _self.get('id');			
			var postLoad =new PostLoad({
				url:contextPath +  'ondutyAction/getById.cn',
				el:'#onDutyUpdate',
				loadMsg:'查询中...'
			}); 			    	
			postLoad.load({ondutyId : ondutyId},function(result){
				_self._initResult(result);
				_self.set("result",result);
			});
		},
		/**
		 * 获取表单数据
		 */
		_getForm : function(){
			var form = new FormContainer({
				id : 'updateForm',
				colNum : 2,
				formChildrens : [  //表单元素
					{
						label : '值班部门',						
						item : '<input type="text"  id="updateOnDutyOrg" class="input-normal" disabled="disabled"/>'
					},
					{
						label : '值班人',
						item : '<select  name="updateUser" id="updateUser"   style="width:99%;height:27px" ></select>'
					},
					{
						label : '固定电话',
						item : '<input type="text" id="updateFixedNum" class="input-normal"   style="width:99%;" disabled="disabled" readOnly="readonly"/>'
					},
					{
						label : '手机',												
						item : '<input type="text" id="updateCellPhoneNum" class="input-normal"  style="width:99%;" disabled="disabled" readOnly="readonly" />'
					},
					{
						label : '值班日期',
						redStarFlag : true,
						item : '<input type="text" id="updateDutyDate" class="calendarUpdate" style="width: 99%;" data-rules="{required:true}" readOnly="readonly"/>'
					},
					{
						label : '星期',
						item : '<input type="text"  id="updateWeek" style="width:99%;" class="input-normal"  disabled="disabled"/> '
					},
					{
						label : '情况汇报',
						itemColspan : 2,
						item : '<textarea id="updateSituation" class="input-large" data-rules="{maxlength:500}"  style="width:99%; ;height:150px;"></textarea>'
					}
				]
			});
			return form;
		},
		_tooltip:function(msg,el){
			BUI.Message.Show({
				msg : msg,
				zIndex:1070,
				closeable : false,
				buttons : [{
					text : '确定',
					elCls : 'button',
					handler : function(){
						BUI.Mask.unmaskElement(el[0]);
						this.close();
					}
				}]
			});
		},

	},{
		ATTRS : {//定义弹框属性
			title : {value : '修改值班'},
			elAttrs : {value: {id:"onDutyUpdate"}},
			width : {value : 620},
			height : {value : 350},
			mask : {value : true},//非模态弹出框
			contextPath : {},
			closeAction : {
				value : 'destroy'
			},
			success : {
				value : function(){
					var _self = this,contextPath = _self.get('contextPath');
					var form = _self.getChild('updateForm');
					// 验证不通过
			    	if(!form.isValid()) {
			    		return ;
			    	}
			    	var onDutyData = _self.get('result');
			    	delete(onDutyData.target); //删除对象属性
			    	onDutyData.fixedNum = $("#updateFixedNum").val();
					onDutyData.cellPhoneNum = $("#updateCellPhoneNum").val();
					onDutyData.dutyDate = _self._ConverToDate($("#updateDutyDate").val());				
					var date = new Date(_self._ConverToDate($("#updateDutyDate").val()));
					onDutyData.week = date.getDay();
					onDutyData.situation = $("#updateSituation").val();
					onDutyData.user = JSON.parse($("#updateUser").val());
					var onDutyStr = JSON.stringify(onDutyData);
					var postLoad =new PostLoad({
						url:contextPath +  'ondutyAction/update.cn',
						el:_self.get('el'),
						loadMsg:'保存中...'
					}); 			    	
					postLoad.load({onDutyStr : onDutyStr},function(result){
						$(".bui-message").css("z-index",2000);
						if(result.status == 2 && result.data == false){
//							_self.zIndex=2000;
							Mask.maskElement('#onDutyUpdate');
	          				BUI.Message.Alert(result.msg,function(){
	          					Mask.unmaskElement('#onDutyUpdate');
	                		});	
	          				$('.bui-message .bui-ext-close').hide(); //隐藏掉关闭叉									
							return ;
						}
						_self.fire("completeSave",{
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
					'completeSave' : true
				}
			}
		}
	});
	return OnDutyAllUpdate;
});
