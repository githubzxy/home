/**
 * 值班信息详情页面
 * @param require
 * @returns
 */
define('views/onduty/OnDutyDetail',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay',
		'common/form/FormContainer','common/data/PostLoad',
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),
		FormContainer = require('common/form/FormContainer'),PostLoad = require('common/data/PostLoad'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay');
	var OnDutyDetail=Overlay.Dialog.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._initForm());
		},
		_initForm:function(){
			var _self=this;
			var form = new FormContainer({
				id:'OnDutyFormDetail',
				colNum:2,
				formChildrens:[
					{
						label:'值班部门',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text"  id="showOnDutyOrg" class="input-normal" style="width:99%;" readonly="readonly" />',
					},{
						label:'值班人',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text"  id="showUser" class="input-normal" style="width:99%;" readonly="readonly" /> ',
					},{
						label:'固定电话',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text" id="showFixedNum" class="input-normal" style="width:99%;" readonly="readonly" />',
					},{
						label:'手机',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text" id="showCellPhoneNum" class="input-normal" style="width:99%;" readonly="readonly" />',
					},{
						label:'值班日期',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text" id="showDutyDate" class="input-normal" style="width:99%;" readonly="readonly" />',
					},{
						label:'星期',
			    		redStarFlag : false,
			    		itemColspan : 1,
			    		item:'<input type="text"  id="showWeek" class="input-normal" style="width:99%;" readonly="readonly" />',
					},{
						label:'情况汇报',
			    		redStarFlag : false,
			    		itemColspan : 2,
			    		item:'<textarea id="showSituation" class="input-large"  style="width:99.4%; ;height:150px;" readonly="readonly" ></textarea>',
					},{
						label:'修改记录',
			    		redStarFlag : false,
			    		itemColspan : 2,
			    		item:'<textarea id="showRemarks" class="input-large"  style="width:99.4%; ;height:100px;" readonly="readonly" ></textarea>',
					},
				],
			});
			return form;
		},
		renderUI:function(){
			var _self=this;
			var buttons=[];
			_self.set('buttons',buttons);
			_self._initPageData(_self);
		},
		_initPageData:function(_self){
			var contextPath=_self.get('contextPath');
			var ondutyId=_self.get('ondutyId');
			var postLoad =new PostLoad({
				url:contextPath +  'ondutyAction/getById.cn',
				el:'#detailOnDuty',
				loadMsg:'查询中...'
			}); 			    	
			postLoad.load({ondutyId : ondutyId},function(data){	
				data.fixedNum!=null? $("#showFixedNum").val(data.fixedNum): $("#showFixedNum").val(data.user.telephoneNumber) ;
				data.cellPhoneNum!=null? $("#showCellPhoneNum").val(data.cellPhoneNum): $("#showCellPhoneNum").val(data.user.phone) ;
				$("#showDutyDate").val(_self._ConverToDates(data.dutyDate));
				$("#showWeek").val(weekToChinese(data.week));
				$("#showSituation").val(data.situation);
				
				if(data.user != null && data.user.organization != null) {
					$("#showUser").val(data.user.name);
					$("#showOnDutyOrg").val(data.user.organization.name);
//					$("#showFixedNum").val(data.user.telephoneNumber);
//					$("#showCellPhoneNum").val(data.user.phone);
				}
				$("#showRemarks").val(data.remarks);
			});
		},
		/**
		 * 时间格式转换
		 */
		_ConverToDates: function(DateStr) {
            var myDate = new Date(DateStr);
            var strDate = myDate.getFullYear() + "/" + (myDate.getMonth() + 1) + "/" + myDate.getDate();
            return strDate;
        },
	},{ATTRS:{
		elAttrs : {value: {id:"detailOnDuty"}},
		title:{value:'详细信息'},
		closeAction:{value:"destroy"},
		contextPath : {},
		width:{value:620},
		height:{value:450},
		mask:{value:true},
		ondutyId:{},
	}});
	return OnDutyDetail;
});