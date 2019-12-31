/**
 * 告警通知单回复模块
 */
define('views/warnNotice/reply/ReplyWarnNotice',[
	'bui/common',
	'common/form/FormContainer',
	'common/data/PostLoad',
	'bui/calendar'
	],
	function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		PostLoad = r('common/data/PostLoad'),
		Calendar = r('bui/calendar');
	var ReplyWarnNotice = BUI.Overlay.Dialog.extend({
		initializer: function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var buttons = [
				{
					text: '回复',
					elCls: 'button',
					handler: function(){
						var reply = _self.get('reply');
						if(reply){
							reply.call(_self);
						}
					}
				},{
					text: '取消',
					elCls: 'button',
					handler: function(){
						if(this.onCancel() != false){
							this.close();
						}
					}
				}
			];
			_self.set('buttons',buttons);
			_self._initShowData();
			warnNotice_warnType.listData("#warnTypeReply");
			warnNotice_networkType.listData("#networkTypeReply");
		},
		/**
		 * 初始化显示的数据
		 */
		_initShowData : function(){
			var _self = this,contextPath = _self.get('contextPath');
			$.ajax({
				url : contextPath + 'warnNoticeAction/getWarnNoticeById.cn',
				data : {
					id : _self.get("id"),
				},
				type : 'POST',
				dataType : 'JSON',
				success : function(result){
					var data = result.data;
					if(isEmptyAndNull(data))return;
					$("#reportOrgNameReply").val(data.reportOrgName);
					$('#numberReply').val(data.number);
					$('#reportTimeReply').val(getLocalTime(data.reportTime));
					$('#happenTimeReply').val(getLocalTime(data.happenTime));
					$('#reportUserNamev').val(data.reportUserName);
					$('#warnDescriptionReply').val(data.warnDescription);
					$('#reportUserNameReply').val(data.reportUserName);
				}
			});
			function getLocalTime(time) {
				var date = new Date(time);
				return returnFormatDate(date,"yyyy-MM-dd hh:mm:ss");
			} 
			
		},
		
		/**
		 * 初始化表单
		 */
		_initFormContainer: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var colNum = 2;
			var childs = [{
				label: '告警编号：',
				itemColspan: 1,
				item: '<input type="text" name="number" id="numberReply" readOnly="readonly" disabled="disabled" style="width:99.5%;"/>'+
					  '<input type="hidden" name="id" id="idReply"/>'
			},{
				label: '填报时间：',
				itemColspan: 1,
				item: '<input type="text" name="reportTime" id="reportTimeReply" readOnly="readonly" disabled="disabled" style="width:99.5%;"/>'
			},{
				label: '发生时间：',
				itemColspan: 1,
				item: '<input type="text" name="happenTime" id="happenTimeReply" readOnly="readonly" disabled="disabled" style="width:99.5%;"/>'
			},{
				label: '填报单位：',
				itemColspan : 1,
				item : '<input type="text" name="reportOrgName" id="reportOrgNameReply" disabled="disabled" readOnly="readOnly" style="width:99.5%;"/>'
			},{
				label: '填报人：',
				itemColspan : 1,
				item : '<input type="text" name="reportUserName" id="reportUserNameReply" disabled="disabled" readOnly="readOnly" style="width:99.5%;"/>'
			},{
				label: '是否处理完毕：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="isFinished" id="isFinishedReply" data-rules="{required:true}" style="width:99.5%;">'+
						'<option value="1">是</option>'+
						'<option value="0">否</option>'+
					  '</select>'
			},{
				label: '回单人：',
				itemColspan : 1,
				redStarFlag: true,
				item : '<input type="text" id="replyUserNameReply" name="replyUserName" data-rules="{required:true}" style="width:99.5%;"/>'
				
			},{
				label: '备注：',
				redStarFlag: true,
				itemColspan : 1,
				item :'<select name="remark"   data-rules="{required:true}" id="remarkReply">'+
						'<option value="1">高速铁路</option>'+
						'<option value="2">普速铁路</option>'+
					 '</select>'
			},{
				label: '处理结果：',
				itemColspan : 2,
				redStarFlag: true,
				item : '<input type="text" id="dealResultReply" name="dealResult" data-rules="{required:true,maxlength:40}" placeholder="最多输入40字" style="width:99.5%;"/>'
			},{
				label: '处理过程：',
				itemColspan : 2,
				item : 
				'<textarea name="dealProcess" id="dealProcessReply" style="width:99.5%;height:95px;overflow-y :auto"  placeholder="最多输入500字" data-rules="{maxlength:500}" style="width:99.5%;"/>'
			}];
			var form = new FormContainer({
				id: 'dataFormReply',
				colNum: colNum,
				formChildrens: childs
			});
			_self.set('formContainer',form);
			return form;
		},
		/**
		 * 保存数据
		 */
		_saveData:function(url){
			var _self = this,contextPath = _self.get('contextPath');
    		var form = _self.getChild('dataFormReply',true);
    		if(!form.isValid()){
    			return;
    		}
    		$("#idReply").val(_self.get('id'));
	    	var data = form.serializeToObject();
    		var postLoad = new PostLoad({
				url : url,
				el : _self.get('el'),
				loadMsg : '保存中...'
			}); 
    		
			postLoad.load(data, function(result){
				if(result != null){
					_self.fire("saveBtn",{
						result : result
					});
				}
			});
		},
	},{
		ATTRS: {
			id: {value : 'replyNoticeDialog'},
			title: {value:'回复告警通知单'},
			width: {value:635},
	        height: {value:356},
	        contextPath: {},
	        id:{},
	        closeAction: {value: 'destroy'},
	        mask: {value: true},
	        reply: {
	        	value: function(){
	        		var _self = this,contextPath = _self.get('contextPath');
	        		_self._saveData(contextPath + '/warnNoticeAction/replyWarnNotice.cn');
	        	}
	        },
	        cancel: {
	        	value: function(){
	        		var _self = this;
	        		_self.fire('close');
	        	}
	        },
	        events: {
	        	value: {
	        		'saveBtn' : true,
	        		'close' : false
	        	}
	        }
		}
	});
	return ReplyWarnNotice;
});
