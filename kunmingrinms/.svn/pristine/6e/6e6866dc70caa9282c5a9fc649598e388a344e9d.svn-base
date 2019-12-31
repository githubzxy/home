define('views/onduty/OnDutyUpdate',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer',
		'common/data/PostLoad','bui/mask',
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),
		FormContainer = require('common/form/FormContainer'),Mask = require('bui/mask'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay'),PostLoad=require('common/data/PostLoad');
	var OnDutyUpdate=Overlay.Dialog.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._initForm());
		},
		_initForm:function(){
			var _self=this;
			var form = new FormContainer({
				id:'updateOnDutyForm',
				colNum:4,
				formChildrens:[{
					label:'值班部门',
		    		redStarFlag : false,
		    		itemColspan : 2,
		    		item:'<input type="text"  id="updateOnDutyOrg" class="input-normal" style="width: 99%;" disabled="disabled"/>',
		    		     
				},{
					label:'值班人',
		    		redStarFlag : false,
		    		itemColspan : 2,
		    		item:'<select id="updateUser" style="width: 99%;"></select> '
				},{
					label:'固定电话',
		    		redStarFlag : false,
		    		itemColspan : 2,
		    		item:'<input type="text" id="updateFixedNum" style="width: 99%;" class="input-normal"  disabled="disabled" readOnly="readonly"  />',
				},{
					label:'手机',
		    		redStarFlag : false,
		    		itemColspan : 2,
		    		item:'<input type="text" id="updateCellPhoneNum" style="width: 99%;" class="input-normal"  disabled="disabled" readOnly="readonly"/>',
				},{
					label:'值班日期',
		    		redStarFlag : true,
		    		itemColspan : 2,
		    		item:'<input type="text" id="updateDutyDate" class="calendarUpdate" style="width: 99%;" data-rules="{required:true}"/>',
				},{
					label:'星期',
					redStarFlag : false,
		    		itemColspan : 2,
		    		item:'<input type="text"  id="updateWeek" class="input-normal" style="width: 99%;" disabled="disabled"/> ',
				}],
			});
			return form;
		},
		renderUI:function(){
			var _self=this;
			_self._initBtn(_self);
			_self._initData(_self);
			//初始化日期组件
			var datepicker = new Calendar.DatePicker({
				trigger : '.calendarUpdate',
				autoRender : true,
				dateMask : 'yyyy/mm/dd'
			});
		},
		_initData:function(_self){
			var postLoad =new PostLoad({
				url:contextPath +  'ondutyNewAction/getById.cn',
				el:'#updateOnDuty',
				loadMsg:'查询中...'
			}); 			    	
			postLoad.load({ondutyId : _self.get('ondutyId')},function(data){
				$("#updateFixedNum").val(data.user.telephoneNumber);
				$("#updateCellPhoneNum").val(data.user.phone);
				$("#updateDutyDate").val(_self._ConverToDates(data.dutyDate));
				$("#updateWeek").val(weekToChinese(data.week));
				if(data.user != null && data.user.organization != null) {
					$("#updateOnDutyOrg").val(data.user.organization.name);
					_self._queryUser(data.user.organization.id, data.user.id,_self);
				}
				_self.set("onDutyData",data);
			});
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
		_queryUser:function(organizationId,userId,_self){
			var postLoad =new PostLoad({
				url:contextPath +  'userAction/getUsersByOrgId.cn',
				el:'#updateOnDuty',
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
		bindUI:function(){
			var _self=this;
			_self._dataChange(_self);
		},
		_dataChange:function(_self){
			$("#updateUser").change(function() {
				var userObj = JSON.parse($("#updateUser").val());
				_self._setPhone(userObj);
			});
			$("#updateDutyDate").change(function() {
				var updateDutyDate = new Date($("#updateDutyDate").val());
				$("#updateWeek").val(weekToChinese(updateDutyDate.getDay()+""));
			});
		},
		_setPhone:function(userObj){
			if(userObj) {
				$("#updateFixedNum").val(userObj.telephoneNumber);
				$("#updateCellPhoneNum").val(userObj.phone);
			}
		},
		_getDataAndSave:function(){
			var _self=this;
			var updateOnDutyForm = _self.getChild('updateOnDutyForm',true);
			if(!updateOnDutyForm.isValid()){
				return;
			}
			var onDutyData=_self.get('onDutyData');
			delete(onDutyData.target);
			onDutyData.fixedNum = $("#updateFixedNum").val();
			onDutyData.cellPhoneNum = $("#updateCellPhoneNum").val();
			onDutyData.dutyDate = _self._ConverToDate($("#updateDutyDate").val());
			
			var date = new Date(_self._ConverToDate($("#updateDutyDate").val()));
			onDutyData.week = date.getDay();
			onDutyData.user = JSON.parse($("#updateUser").val());
			var onDutyStr = JSON.stringify(onDutyData);
			_self._updateOnDutyUser(onDutyStr);
			
		},
		_updateOnDutyUser:function(onDutyStr){
			var _self=this;
			var contextPath = _self.get('contextPath');
			var postLoad =new PostLoad({
				url:contextPath +  'ondutyNewAction/update.cn',
				el:'#updateOnDuty',
				loadMsg:'保存中...'
			}); 			    	
			postLoad.load({ondutyStr : onDutyStr},function(result){
				$(".bui-message").css("z-index",2000);
				if(result.status == 2 && result.data == false){
//					_self.zIndex=2000;
					Mask.maskElement('#updateOnDuty');
      				BUI.Message.Alert(result.msg,function(){
      					Mask.unmaskElement('#updateOnDuty');
            		});	
      				$('.bui-message .bui-ext-close').hide(); //隐藏掉关闭叉									
					return ;
				}
				_self.fire("saveBtn",{
				    result : result
				})
			});
		},
	},{ATTRS:{
		elAttrs : {value: {id:"updateOnDuty"}},
		title:{value:'修改值班'},
		closeAction:{value:"destroy"},
		contextPath : {},
		orgId:{},
		width:{value:620},
		height:{value:210},
		mask:{value:true},
		ondutyId:{},
		success:{
			value:function(){
				var _self=this;
				_self._getDataAndSave();
			}
		},
		events:{
			value: {'saveBtn': true}
		}
	}});
	return OnDutyUpdate
});