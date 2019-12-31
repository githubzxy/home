/**
 * 可输入进行模糊查询的下拉框选择公共组件
 * example：
		var suggest = new SelectSuggest({
			render : '#emsName',//<div name="emsName" id="emsName" style="width: 191px;"></div>
			name : 'emsName'
		});
		_self.set('suggest',suggest);
		
		var postLoad = new PostLoad({
			url : '/report/ems/getDistinctEmsName',
		}); 
		postLoad.load({}, function(emsNameList){
			suggest.set('data', emsNameList);
			suggest.render();
		});
 */
define("views/fileSystem/SelectSuggest",['bui/select',
		],function(r){
	var Select = r('bui/select');
	
	var SelectSuggest = Select.Suggest.extend({
		initializer:function() {
			var _self = this;
			_self._initStyle();
		},
		renderUI:function() {
			 $(":text").attr("autocomplete","off");//将所有文本输入框的输入记录关闭
		},
		bindUI : function(){
			var _self = this;
			var downSpan = $('.suggestDiv span');
			
			downSpan.on('click', function() {
				var data = _self.get('data');
				var picker = _self.get('picker')
				_self._handleResponse(data);
				picker.show();
			});
		},
		_initStyle() {
			var _self = this;
			_self.set('elCls', 'suggestDiv');
			_self.set('width', _self.get('width'));
			_self.set('tpl', '<input type="text" style="border-radius: 0px;"  placeholder="请选择正确的专业类别" autocomplete="off"/><span class="x-icon x-icon-normal" style="border: 0;"><i class="icon icon-caret icon-caret-down"></i></span>');
			_self.get('picker').set('elStyle', {
				'height' :'300px',
				'width' : '191px',
				'overflow' : 'auto'
			});
			_self.set('elStyle', {
				'border' : '0px'
			});
		},
		/**
		 * 获取选中项的值
		 */
		getSelectedValue() {
			return $('.suggestDiv input').val();
		},
		/**
		 * 设置选中的值
		 * @param value 选中的值
		 */
		setSelectedValue(value) {
			$('.suggestDiv input').attr('value', value);
		}
	},{
		ATTRS:{
			width : {value:191},//组件的宽度默认191
		}
	});
	return SelectSuggest;
});