define('views/warnNotice/entering/WarnNoticeDetail',[
		'bui/overlay','common/uploader/ViewUploader',
		'common/form/FormContainer'],function(r){
	var Overlay = r('bui/overlay'),
	ViewUploader = r('common/uploader/ViewUploader'),
	FormContainer = r('common/form/FormContainer');
	var WarnNoticeDetail = Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		renderUI : function(){
			var _self = this;
			_self._initShowData();
			var buttons = [];
			_self.set('buttons',buttons);
		},
		/**
		 * 初始化显示数据
		 */
		_initShowData:function(){
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
					$('#numberShow').val(data.number);
					$('#networkTypeShow').val(warnNotice_networkType.typeName(data.networkType));
					$('#reportTimeShow').val(getLocalTime(data.reportTime));
					$('#happenTimeShow').val(getLocalTime(data.happenTime));
					if(!isEmptyAndNull(data.recoverTime)){
						$('#recoverTimeShow').val(getLocalTime(data.recoverTime));
					}else{
						$('#recoverTimeShow').val("");
					}
					$('#warnTypeShow').val(warnNotice_warnType.typeName(data.warnType));
					var affectBusiness = data.isAffectBusiness?"是":"否";
					$('#isAffectBusinessShow').val(affectBusiness);
					$('#systemNameShow').val(data.systemName);
					$('#warnZoneShow').val(data.warnZone);
					$('#acceptOrgNameShow').val(data.acceptOrgName);
					$('#reportOrgNameShow').val(data.reportOrgName);
					$('#reportUserNameShow').val(data.reportUserName);
					$('#warnDescriptionShow').val(data.warnDescription);
					$('#dealProcessShow').val(data.dealProcess);
					$('#dealResultShow').val(data.dealResult);
					var finish = data.isFinished==null?"":(data.isFinished?"是":"否");
					$('#isFinishedShow').val(finish);
					$('#replyUserNameShow').val(data.replyUserName);
					$('#remarkShow').val(data.remark=="1"?"高速铁路":(data.remark=="2"?"普速铁路":""));
				}
			});
			
			function getLocalTime(time) {
				var date = new Date(time);
				return returnFormatDate(date,"yyyy-MM-dd hh:mm:ss");
			} 
		},
		
		_initFormContainer:function(){
			var form = new FormContainer({
				id: 'fileShowForm',
				colNum: 2,
				formChildrens:[
					{
						label: '告警编号：',
						itemColspan: 2,
						item: '<input type="text" id="numberShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '网络类别：',
						itemColspan: 1,
						item: '<input type="text" id="networkTypeShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '填报时间：',
						itemColspan: 1,
						item: '<input type="text" id="reportTimeShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '发生时间：',
						itemColspan: 1,
						item: '<input type="text"  id="happenTimeShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '恢复时间：',
						itemColspan: 1,
						item: '<input type="text"  id="recoverTimeShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '告警类型：',
						itemColspan: 1,
						item: '<input type="text"  id="warnTypeShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '是否影响业务：',
						itemColspan: 1,
						item: '<input type="text"  id="isAffectBusinessShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '系统名称：',
						itemColspan : 1,
						item : '<input type="text" id="systemNameShow"  readOnly="readonly" style="width:99.5%;"/>'
					},{
						label: '告警区段：',
						itemColspan : 1,
						item : '<input type="text" id="warnZoneShow" readOnly="readonly" style="width:99.5%;"/>'
					},{
						label: '接收单位：',
						itemColspan : 1,
						item : '<input type="text" id="acceptOrgNameShow" readOnly="readonly" style="width:99.5%;"/>'
					},{
						label: '填报单位：',
						itemColspan : 1,
						item : '<input type="text" id="reportOrgNameShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '填报人：',
						itemColspan : 2,
						item : '<input type="text" id="reportUserNameShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '告警现象描述：',
						itemColspan : 2,
						item : '<textarea type="text" id="warnDescriptionShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '处理过程：',
						itemColspan : 2,
						item : '<textarea type="text" id="dealProcessShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '处理结果：',
						itemColspan : 2,
						item : '<textarea type="text" id="dealResultShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '是否处理完毕：',
						itemColspan : 1,
						item : '<input type="text" id="isFinishedShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '回单人：',
						itemColspan : 1,
						item : '<input type="text" id="replyUserNameShow" readOnly="readOnly" style="width:99.5%;"/>'
					},{
						label: '备注：',
						itemColspan : 2,
						item : '<input type="text" id="remarkShow" readOnly="readOnly" style="width:99.5%;"/>'
					}
				]
			});
			return form;
		}	
	},{
		ATTRS : {
			title : {value : '详情'},
			width : {value : 635},
			height : {value : 565},
			mask : {value : true},
			contextPath : {},
			warnId : {},
			closeAction : {
				value : 'destroy'
			},
			cancel : {
				value : function(){
					var _self = this;
					_self.fire("close");
				}
			},
			events : {
				value : {
					'close' : false
				}
			}
		}
	});
	return WarnNoticeDetail;
});