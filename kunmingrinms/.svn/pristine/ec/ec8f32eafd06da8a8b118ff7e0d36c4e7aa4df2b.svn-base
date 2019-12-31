define('views/onduty/OnDutyImportForm',[
		'bui/common','bui/data','bui/grid','bui/calendar','bui/overlay','common/form/FormContainer',		
		],function(require){
	var BUI =require('bui/common'),Data = require('bui/data'),Grid = require('bui/grid'),
		FormContainer = require('common/form/FormContainer'),
		Calendar=require('bui/calendar'),Overlay=require('bui/overlay');
	var OnDutyImportForm=Overlay.Dialog.extend({
		initializer:function(){
			var _self=this;
			_self.addChild(_self._initForm());
		},
		_initForm:function(){
			var _self=this;
			var form=new FormContainer({
				id:'importOndutyForm',
				colNum:2,
				formChildrens:[
					{
						label:'标准模板',
			    		redStarFlag : false,
			    		itemColspan : 2,
			    		item:'<input id="downLoad" type = "button"  value="值班信息模板下载" style="width:50%;height:30px"><span id="infor" style="color:red;width:50%;height:30px;text-align: center;" readonly>注：请按值班信息模板导入</span>',
					},{
						label:'附件',
			    		redStarFlag : true,
			    		itemColspan : 2,
			    		item:'<div style="line-height:60px;height:60px;"><input type="file" id="ondutyDeptFile" data-rules="{required:true}" name="ondutyDeptFile" accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" style="width:99.4%;"/></div><input type="hidden" id="importFormPerId" name="perId">',
					},
				],
			});
			return form;
		},
		renderUI:function(){
			var _self=this;
			_self._initBtn(_self);
			_self._setAttrs4Form(_self);
		},
		_setAttrs4Form:function(_self){
			$('#formContainer').attr('action', contextPath + 'onDutyDeptAction/importData.cn');
			// 设置method,提交方式
			$('#formContainer').attr('method', 'post');
			// 设置enctype,编码方式
			$('#formContainer').attr('enctype', 'multipart/form-data');
		},
		_initBtn:function(_self){
			var buttons = [
				{
					text:'导入',
					elCls:'button  _importData',
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
			var contextPath=_self.get('contextPath');
			$("#downLoad").on('click',function(){
				window.location.href = contextPath+'Template/onDutyDeptNew.xls';
			});
		},
		_importFile:function(){
			var _self=this;
			var importForm=_self.getChild('importOndutyForm',true);
			if(!importForm.isValid()){
				return;
			}
			var flag=_self._checkFileType(_self);
			if(flag){
				$('#importFormPerId').val(_self.get('perId'));
				$('#formContainer').submit();
				_self.fire('importBtn',function(e){
					
				})
			}
		},
		_checkFileType:function(_self){
			var file=$('#ondutyDeptFile').val();
			var pattern1=/.xls/;
			var pattern2=/.xlsx/;
			var reg1 =new RegExp(pattern1);
			var reg2 =new RegExp(pattern2);
			var suffix=file.substring(file.lastIndexOf('.')).toLocaleLowerCase();
			if(!(reg1.test(suffix)+reg2.test(suffix))){
				var el=_self.get('el');
				_self.set('zIndex',1060);
				BUI.Mask.maskElement(el[0]);
				tooltip("请选择*.xls;*.xlsx文件,进行导入！",el);
				return ;
			}
			return true;
		},
	},{ATTRS:{
		id:{value:'importOnDuty'},
		title:{value:'导入值班信息'},
		closeAction:{value:"destroy"},
		contextPath : {},
		width:{value:590},
		height:{value:195},
		mask:{value:true},
		events:{value:{'importBtn':true}},
		success:{value:function(){this._importFile();}},
		perId:{},
	}});
	return OnDutyImportForm;
});