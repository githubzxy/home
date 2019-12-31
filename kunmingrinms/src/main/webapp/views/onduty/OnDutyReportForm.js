/**
 * 情况汇报模块
 * @param require
 * @returns
 */
define('views/onduty/OnDutyReportForm',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer',
		'common/data/PostLoad',],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),
		FormContainer = require('common/form/FormContainer'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay'),PostLoad=require('common/data/PostLoad'); 
	var OnDutyReportForm=Overlay.Dialog.extend({
		initializer:function(){
			var _self=this;	
			_self.addChild(_self._initForm());
		},
		_initForm:function(){
			var _self=this;
			var form =new FormContainer({
				id:'reportOnDutyForm',
				colNum:2,
				formChildrens:[
					{
						label:'所属部门',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text"  id="reportOnDutyOrg" style="width: 99.1%;" class="input-normal" disabled="disabled" />',
					},{
						label:'值班人',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text"  id="reportUser" style="width: 99.1%;" class="input-normal" disabled="disabled" />',
					},{
						label:'值班日期',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text" id="reportDutyDate"  style="width: 99.1%;"  disabled="disabled"/>',
					},{
						label:'星期',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text"  id="reportWeek" style="width: 99.1%;" class="input-normal" disabled="disabled"/>',
					},{
						label:'汇报内容',
			    		redStarFlag : true,
			    		itemColspan : 2,
			    		item:'<textarea id="reportContentTxt"  class="input-large" data-rules="{maxlength:500,required:true}"  style="width:99.4%; ;height:100px;"></textarea>',
					},
				],
			});
			return form;
		},
		renderUI:function(){
			var _self=this;	
			_self._initBtn(_self);
			_self._initPageData(_self);
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
		_initPageData:function(_self){
			var contextPath=_self.get('contextPath');
			var userId=_self.get('userId'),curDate=_self.get('curDate');
			var postLoad =new PostLoad({
				url:contextPath +  'ondutyNewAction/getTodayUserDuty.cn',
				el:'#reportOnDuty',
				loadMsg:'保存中...'
			}); 			    	
			postLoad.load({userId : userId},function(data){
				var todayUserDuty=data;
				_self.set('todayUserDuty',data);
				$("#reportOnDutyOrg").val(todayUserDuty.user.organization.name);
				$("#reportUser").val(todayUserDuty.user.name);
				$("#reportDutyDate").val(curDate);
				// 根据日期填充星期
				var reportDutyDate = new Date($("#reportDutyDate").val());
				$("#reportWeek").val(weekToChinese(reportDutyDate.getDay()+""));
			});
		},
		_saveDate:function(){
			var _self=this;
			var reportForm=_self.getChild('reportOnDutyForm',true);
			if(!reportForm.isValid()) {
				return ;
			}
			var todayUserDuty=_self.get('todayUserDuty');
			delete(todayUserDuty.target);//删除对象属性
			todayUserDuty.situation=$("#reportContentTxt").val();
			var todayUserDutyArr = JSON.stringify(todayUserDuty);
			_self._report(_self,todayUserDutyArr);
		},
		_report:function(_self,todayUserDutyArr){
			var contextPath=_self.get('contextPath');
			var postLoad =new PostLoad({
				url:contextPath +  'ondutyNewAction/report.cn',
				el:'#reportOnDuty',
				loadMsg:'保存中...'
			}); 			    	
			postLoad.load({ondutyStr : todayUserDutyArr},function(result){
				if(result.status == 2 && result.data == false){
					_self.zIndex=2000;
					Mask.maskElement('#reportOnDuty');
      				BUI.Message.Alert(result.msg,function(){
      					Mask.unmaskElement('#reportOnDuty');
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
		elAttrs : {value: {id:"reportOnDuty"}},
		title:{value:'情况汇报'},
		closeAction:{value:"destroy"},
		contextPath : {},
		width:{value:620},
		height:{value:270},
		mask:{value:true},
		curDate:{},
		userId:{},
		events:{value:{'saveBtn':true}},
		success:{value:function(){ this._saveDate();}},
	}});
	return OnDutyReportForm;
});