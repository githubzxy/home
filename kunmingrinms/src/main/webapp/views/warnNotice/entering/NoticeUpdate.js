/**
 * 告警通知单修改模块
 */
define('views/warnNotice/entering/NoticeUpdate',[
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
	var NoticeUpdate = BUI.Overlay.Dialog.extend({
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
			_self._initDapartTree();//初始化部门树
			_self._initDate();//初始化日期控件
			warnNotice_warnType.listData("#warnTypeUpdate");
			warnNotice_networkType.listData("#networkTypeUpdate");
			_self._initData();
		},
		/**
		 * 绑定事件
		 */
		bindUI: function(){
			var _self = this;
			// 点击条件查询中的所属部门框,弹出组织机构树
			var orgPicker = _self.get('orgPickerUpdate');		
			orgPicker.on('orgSelected',function(e){				
				$('#orgValUpdate').val(e.org.text);
				$('#orgSelectIdUpdate').val(e.org.id);
			});
		},
		/**
		 * 回显数据
		 */
		_initData : function(){
			var _self = this,contextPath = _self.get('contextPath');
			$("#reportOrgNameUpdate").val(_self.get('orgName'));
			$("#reportOrgIdUpdate").val(_self.get('orgId'));
			var _self = this,contextPath = _self.get('contextPath'),warnId = _self.get('warnId');
			$.ajax({
				url : contextPath + 'warnNoticeAction/getWarnNoticeById.cn',
				data : {
					id : warnId
				},
				type : 'POST',
				dataType : 'JSON',
				success : function(result){
					var data = result.data;
					if(isEmptyAndNull(data))return;
					$('#numberUpdate').val(data.number);
					$('#networkTypeUpdate').val(data.networkType);
					$('#reportTimeUpdate').val(getLocalTime(data.reportTime));
					$('#happenTimeUpdate').val(getLocalTime(data.happenTime));
					$('#warnTypeUpdate').val(data.warnType);
					
					$('#isAffectBusinessUpdate').val(data.isAffectBusiness?"1":"0");
					$('#systemNameUpdate').val(data.systemName);
					$('#warnZoneUpdate').val(data.warnZone);
					$('#orgValUpdate').val(data.acceptOrgName);
					$('#orgSelectIdUpdate').val(data.acceptOrgId);
					$('#reportUserNameUpdate').val(data.reportUserName);
					$('#warnDescriptionUpdate').val(data.warnDescription);
				}
			});
			function getLocalTime(time) {
				var date = new Date(time);
				return returnFormatDate(date,"yyyy-MM-dd hh:mm:ss");
			} 
		},
		/**
		 * 初始化部门树
		 */
		_initDapartTree:function(){
			var _self = this,contextPath = _self.get('contextPath');
  			var orgPicker = new OrganizationPicker({
  		          trigger : '#orgValUpdate',
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
  			_self.set('orgPickerUpdate',orgPicker);
  			$("div.bui-overlay.bui-ext-position.x-align-bl-tl").css("z-index","2000");
		},
		
  	    /**
  	     * 初始化时间
  	     */
  	    _initDate:function(){
  	    	var _self=this;
  			var datepickerCT = new Calendar.DatePicker({
  				trigger : '#happenTimeUpdate',
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
  				trigger : '#reportTimeUpdate',
  				showTime : true,
  				autoRender : true
  			});
  			datepickerRP.on('show',function(){
  				var c = datepickerRP.get('calendar');
  				c.set('hour',10);
  				c.set('minute',0);
  				c.set('second',0);
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
				item: '<input type="text" name="number" id="numberUpdate" data-rules="{required:true}" style="width:99.5%;"/>'+
				'<input type="hidden" name="numberSeq" id="numberSeqUpdate"/>'+
				'<input type="hidden" name="id" id="idUpdate"/>'
			},{
				label: '网络类别：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="networkType" id="networkTypeUpdate" data-rules="{required:true}" style="width:99.5%;">'+
					  '</select>'
			},{
				label: '填报时间：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<input type="text" name="reportTime" id="reportTimeUpdate" data-rules="{required:true}" style="width:99.5%;"/>'
			},{
				label: '发生时间：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<input type="text" name="happenTime" id="happenTimeUpdate" data-rules="{required:true}" style="width:99.5%;"/>'
			},{
				label: '告警类型：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="warnType" id="warnTypeUpdate" data-rules="{required:true}" style="width:99.5%;">'+
					  '</select>'
			},{
				label: '是否影响业务：',
				redStarFlag: true,
				itemColspan: 1,
				item: '<select name="isAffectBusiness" id="isAffectBusinessUpdate" data-rules="{required:true}" style="width:99.5%;">'+
						'<option value="1">是</option>'+
						'<option value="0">否</option>'+
					  '</select>'
			},{
				label: '系统名称：',
				redStarFlag: true,
				itemColspan : 1,
				item : '<input type="text"  name="systemName" id="systemNameUpdate" data-rules="{required:true}" style="width:99.5%;">'
			},{
				label: '告警区段：',
				redStarFlag: true,
				itemColspan : 1,
				item : '<input type="text" name="warnZone" id="warnZoneUpdate" data-rules="{required:true}" style="width:99.5%;"/>'
			},{
				label: '接收单位：',
				redStarFlag: true,
				itemColspan : 1,
				item : '<input type="text" name="acceptOrgName" id="orgValUpdate"  style="width:99.5%" readOnly="readonly" style="width:99.5%;"/>'+
					   '<input type="text" name="acceptOrgId" id="orgSelectIdUpdate" style="display:none;"/>'
			},{
				label: '填报单位：',
				redStarFlag: true,
				itemColspan : 1,
				item : '<input type="text" name="reportOrgName" id="reportOrgNameUpdate" disabled="disabled" readOnly="readOnly" style="width:99.5%;"/>'+
				'<input type="text" name="reportOrgId" id="reportOrgIdUpdate" style="display:none;"/>'
			},{
				label: '填报人：',
				redStarFlag: true,
				itemColspan : 2,
				item : '<input type="text" name="reportUserName" data-rules="{required:true}" id="reportUserNameUpdate" style="width:99.5%;"/>'
			},{
				label: '告警现象描述：',
				itemColspan : 2,
				item : 
				'<textarea name="warnDescription" id="warnDescriptionUpdate" data-rules="{maxlength:500}" style="width:99.5%;height:95px;overflow-y:auto" placeholder="最多输入500字"/>'
			}];
			var form = new FormContainer({
				id: 'dataFormUpdate',
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
    		var form = _self.getChild('dataFormUpdate',true);
    		if(!form.isValid()){
    			return;
    		}
    		var seq = $("#numberUpdate").val().split("-")[2];
    		$("#numberSeqUpdate").val(parseInt(seq));
    		$("#idUpdate").val(_self.get('warnId'));
	    	var data = form.serializeToObject();
	    	console.log(data);
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
			id: {value : 'dataUpdateDialog'},
			title: {value:'修改告警通知单'},
			width: {value:635},
	        height: {value:390},
	        contextPath: {},
	        orgName:{},
	        orgId:{},
	        warnId:{},
	        closeAction: {value: 'destroy'},
	        mask: {value: true},
	        success: {
	        	value: function(){
	        		var _self = this,contextPath = _self.get('contextPath');
	        		_self._saveData(contextPath + 'warnNoticeAction/updateWarnNotice.cn');
	        	}
	        },
	        send: {
	        	value: function(){
	        		var _self = this,contextPath = _self.get('contextPath');
	        		_self._saveData(contextPath + 'warnNoticeAction/issueAndSaveNotice.cn');
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
	return NoticeUpdate;
});
