define('views/warnNotice/entering/WarnNoticeConfirm',[
		'bui/overlay','common/data/PostLoad','bui/calendar','common/uploader/ViewUploader',
		'common/form/FormContainer'],function(r){
	var Overlay = r('bui/overlay'),
	ViewUploader = r('common/uploader/ViewUploader'),
	Calendar = r('bui/calendar'),
	PostLoad = r('common/data/PostLoad'),
	FormContainer = r('common/form/FormContainer');
	var WarnNoticeConfirm = Overlay.Dialog.extend({
		/**
		 * 初始化
		 */
		initializer: function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		/**
		 * 渲染
		 */
		renderUI: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var buttons = [
				{
					text: '确认',
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
			_self._initDate();
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
  	     * 初始化时间
  	     */
		_initDate:function(){
  	    	var _self=this;
  			var datepickerRP = new Calendar.DatePicker({
  				trigger : '#recoverTimeConfirm',
  				showTime : true,
  				autoRender : true
  			});
  			datepickerRP.on('show',function(){
  				var c = datepickerRP.get('calendar');
  				c.set('hour',10);
  				c.set('minute',0);
  				c.set('second',0);
  			});
  			
  			$.ajax({type:'HEAD'}).success(function(data, status, xhr){
  				$("#recoverTimeConfirm").val(returnFormatDate(xhr.getResponseHeader('Date'),"yyyy-MM-dd hh:mm:ss"));
  			});
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
				item: '<input type="text" name="reportTime" id="reportTimeReply" disabled="disabled" readOnly="readonly" style="width:99.5%;"/>'
			},{
				label: '发生时间：',
				itemColspan: 1,
				item: '<input type="text" name="happenTime" id="happenTimeReply" disabled="disabled" readOnly="readonly" style="width:99.5%;"/>'
			},{
				label: '填报单位：',
				itemColspan : 1,
				item : '<input type="text" name="reportOrgName" id="reportOrgNameReply" disabled="disabled" readOnly="readOnly" style="width:99.5%;"/>'
			},{
				label: '填报人：',
				itemColspan : 1,
				item : '<input type="text" name="reportUserName" id="reportUserNameReply" disabled="disabled" readOnly="readOnly" style="width:99.5%;"/>'
			},{
				label: '恢复时间：',
				itemColspan : 1,
				redStarFlag: true,
				item : '<input type="text" name="recoverTime" id="recoverTimeConfirm" data-rules="{required:true}" style="width:99.5%;"/>'
			}];
			var form = new FormContainer({
				id: 'dataFormAdd',
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
    		var form = _self.getChild('dataFormAdd',true);
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
			title: {value:'确认告警通知单'},
			width: {value:635},
	        height: {value:195},
	        contextPath: {},
	        id:{},
	        closeAction: {value: 'destroy'},
	        mask: {value: true},
	        reply: {
	        	value: function(){
	        		var _self = this,contextPath = _self.get('contextPath');
	        		_self._saveData(contextPath + '/warnNoticeAction/verifyWarnNotice.cn');
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
	return WarnNoticeConfirm;
});