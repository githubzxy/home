/**
 * 左边页面上的查询表单
 */
define('common/chooseExecuteUser/LeftForm',['bui/common','bui/layout','bui/form'],function(r){
	var BUI = r('bui/common'),Component = BUI.Component,Layout = r('bui/layout'),Form = r('bui/form');
	var SearchForm = Form.HForm.extend({
		initializer:function(){
			var _self = this;
			var selectHtml;
			//如果登录用户是车间，则只能显示它下面的工区数据
			if(_self.get('orgType')==ORG_TYPE_CJ){
				selectHtml = '<select id="orgType" name="orgType" class="input-normal">'+
					        	  '<option value="'+ORG_TYPE_GQ+'" selected="selected">工区</option>'+
					    	  '</select>';
			}else{
				selectHtml = '<select id="orgType" name="orgType" class="input-normal">'+
						      	  '<option value="'+ORG_TYPE_KS+'">科室</option>'+
						    	  '<option value="'+ORG_TYPE_CJ+'" selected="selected">车间</option>'
							  '</select>';
			}
			//如果人员选择类型是抄送人员
			if(_self.get('selectType')=="2"){
				selectHtml = '<select id="orgType" name="orgType" class="input-normal" disabled="disabled">'+
				        	  '<option value="'+ORG_TYPE_KS+'" selected="selected">科室</option>'+
					    	  '</select>';
			}
			var items = [{
			                label : '用户名',
			                item : '<input type="text" name="name" class="input-normal" style="width:130px"/>'
			              },{
			                label : '机构类型',
			                item :selectHtml
			              }];
			
			var layout = new Layout.Flow();
			var form = new Component.Controller({plugins : [layout]});
			BUI.Array.each(items,function(i){
				form.addChild(_self._geItem(i.label,i.item));
			});
			_self.addChild(form);
			_self.addChild(_self._geButton());
		},
		bindUI : function(){
			var _self = this;
			_self.get('el').delegate('.selectBtn','click',function(ev){
				ev.preventDefault();//?
				//触发事件
				_self.fire('formSearch',{
					param : _self.serializeToObject(),//序列化表单成对象，所有的键值都是字符串
					domTarget: ev.domTarget,//?
			        domEvent: ev//?
				});
			});
		},
		_geItem:function(label,item){
			var _self = this;
			var i = new Component.Controller({
				elCls : 'control-group',	
				tpl:'<label class="control-label" style = "width:80px">'+label+'：</label>'+
					'<div class="controls">'+
					item +
					'</div>'
			});
			return i;
		},
		_geButton:function(){
			var b = new Component.Controller({
				elCls : 'span2',	
				tpl:'<button class="selectBtn" style = "width:40px;">查询</button>'
			});
			return b;
		}
	},{
		ATTRS:{
			orgType:{},
			selectType:{},
			events: {value: {'formSearch': true}}
		}
	});
	return SearchForm;
});