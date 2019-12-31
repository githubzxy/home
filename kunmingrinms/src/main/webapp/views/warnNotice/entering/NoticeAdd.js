/**
 * 告警通知单新增模块
 */
define('views/warnNotice/entering/NoticeAdd',[
	'bui/common',
	'common/form/FormContainer','bui/uploader',
	'common/data/PostLoad',
	'bui/select',
	'bui/calendar',
	'common/org/OrganizationPicker'],
	function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		Uploader = r('bui/uploader'),
		PostLoad = r('common/data/PostLoad'),
		Select = r('bui/select'),
		Calendar = r('bui/calendar'),
		OrganizationPicker = r('common/org/OrganizationPicker');
	var NoticeAdd = BUI.Overlay.Dialog.extend({
		initializer: function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var buttons = [
				{
					text: '保存',
					elCls: 'button',
					handler: function(){
						var success = _self.get('success');
						if(success){
							success.call(_self);
						}
					}
				},{
					text: '派发',
					elCls: 'button',
					handler: function(){
						var send = _self.get('send');
						if(send){
							send.call(_self);
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
			_self._initDapartTree();
			_self._initDate();
			_self._initNumber();
			warnNotice_warnType.listData("#warnTypeAdd");
			warnNotice_networkType.listData("#networkTypeAdd");
			$("#reportOrgNameAdd").val(_self.get('orgName'));
			$("#reportOrgIdAdd").val(_self.get('orgId'));
			//默认昆明通信段
			$('#orgValAdd').val(gztxd_name);
			$('#orgSelectIdAdd').val(gztxd_id);
		},
		/**
		 * 绑定事件
		 */
		bindUI: function(){
			var _self = this;
			var orgPicker = _self.get('orgPickerAdd');		
			orgPicker.on('orgSelected',function(e){		
				$('#orgValAdd').val(e.org.text);
				$('#orgSelectIdAdd').val(e.org.id);
			});
		},
		/**
		 * 初始化告警编号
		 */
		_initNumber : function(){
			var _self = this,contextPath = _self.get('contextPath');
			$.post(contextPath+"/warnNoticeAction/getMaxNumber.cn",function(result){
				$.ajax({type:'HEAD'}).success(function(data, status, xhr){
					var date = xhr.getResponseHeader('Date');
	  				$("#numberAdd").val("WGZX-"+new Date(date).getFullYear()+"-"+(parseInt(result.data)+1));
	  			});
			 });
		},
		/**
		 * 初始化部门树
		 */
		_initDapartTree:function(){
			var _self = this;
  			var orgPicker = new OrganizationPicker({
  		          trigger : '#orgValAdd',
  		          rootOrgId : gztxd_id,
  		          rootOrgText : gztxd_name,
  		          delegateTrigger : true, 
  		          url : contextPath + 'organization/getOrgChildrenById.cn',
  		          autoHide : true,
  		          align : {
  		               points : ['bl','tl']
  		          },
  		          width : 195,
  		          height : 200
  		 	 });
  			orgPicker.render();			 
  			_self.set('orgPickerAdd',orgPicker);
  			$("div.bui-overlay.bui-ext-position.x-align-bl-tl").css("z-index","2000");
		},
		
  	    /**
  	     * 初始化时间
  	     */
  	    _initDate:function(){
  	    	var _self=this;
  			var datepickerCT = new Calendar.DatePicker({
  				trigger : '#happenTimeAdd',
  				showTime : true,
  				autoRender : true
  			});
  			datepickerCT.on('show',function(){
  				var c = datepickerCT.get('calendar');
  				c.set('hour',10);
  				c.set('minute',0);
  				c.set('second',0);
  			});
  			var datepickerRP = new Calendar.DatePicker({
  				trigger : '#reportTimeAdd',
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
  				$("#reportTimeAdd").val(returnFormatDate(xhr.getResponseHeader('Date'),"yyyy-MM-dd hh:mm:ss"));
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
				redStarFlag: true,
				itemColspan: 2,
				item: '<input type="text" name="number" id="numberAdd" data-rules="{required:true}" style="width:99.5%;"/>'+
				'<input type="hidden" name="numberSeq" id="numberSeqAdd"/>'
			},{
				label: '网络类别：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="networkType" id="networkTypeAdd" data-rules="{required:true}" style="width:99.5%;">'+
					  '</select>'
			},{
				label: '填报时间：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<input type="text" name="reportTime" id="reportTimeAdd" data-rules="{required:true}" style="width:99.5%;"/>'
			},{
				label: '发生时间：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<input type="text" name="happenTime" id="happenTimeAdd" data-rules="{required:true}" style="width:99.5%;"/>'
			},{
				label: '告警类型：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="warnType" id="warnTypeAdd" data-rules="{required:true}" style="width:99.5%;">'+
					  '</select>'
			},{
				label: '是否影响业务：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="isAffectBusiness" id="isAffectBusinessAdd" data-rules="{required:true}" style="width:99.5%;">'+
						'<option value="1">是</option>'+
						'<option value="0">否</option>'+
					  '</select>'
			},{
				label: '系统名称：',
				redStarFlag: true,
				itemColspan : 1,
				item : '<input type="text"  name="systemName" id="systemNameAdd" data-rules="{required:true}" style="width:99.5%;">'
			},{
				label: '告警区段：',
				redStarFlag: true,
				itemColspan : 1,
				item : '<input type="text" name="warnZone" id="warnZoneAdd" data-rules="{required:true}" style="width:99.5%;"/>'
			},{
				label: '接收单位：',
				redStarFlag: true,
				itemColspan : 1,
				item : '<input type="text" name="acceptOrgName" id="orgValAdd"  style="width:99.5%" readOnly="readonly"/>'+
					   '<input type="text" name="acceptOrgId" id="orgSelectIdAdd" style="display:none;"/>'
			},{
				label: '填报单位：',
				redStarFlag: true,
				itemColspan : 1,
				item : '<input type="text" name="reportOrgName" id="reportOrgNameAdd" readOnly="readOnly" disabled="disabled" style="width:99.5%;"/>'+
				'<input type="text" name="reportOrgId" id="reportOrgIdAdd" style="display:none;"/>'
			},{
				label: '填报人：',
				redStarFlag: true,
				itemColspan : 2,
				item : '<input type="text" name="reportUserName" data-rules="{required:true}" id="reportUserNameAdd" style="width:99.5%;"/>'
			},{
				label: '告警现象描述：',
				itemColspan : 2,
				item : 
				'<textarea name="warnDescription" id="warnDescriptionAdd" data-rules="{maxlength:500}" style="width:99.5%;height:95px;overflow-y :auto" placeholder="最多输入500字"/>'
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
    		var seq = $("#numberAdd").val().split("-")[2];
    		$("#numberSeqAdd").val(parseInt(seq));
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
			id: {value : 'dataAddDialog'},
			title: {value:'新增告警通知单'},
			width: {value:635},
	        height: {value:390},
	        contextPath: {},
	        orgName:{},
	        orgId:{},
	        closeAction: {value: 'destroy'},
	        mask: {value: true},
	        success: {
	        	value: function(){
	        		var _self = this,contextPath = _self.get('contextPath');
	        		_self._saveData(contextPath + 'warnNoticeAction/addWarnNotice.cn');
	        	}
	        },
	        send: {
	        	value: function(){
	        		var _self = this,contextPath = _self.get('contextPath');
	        		_self._saveData(contextPath + 'warnNoticeAction/distributeAndSaveNotice.cn');
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
	return NoticeAdd;
});
