/**
 * 用于修改更新业务时的附件展示和修改。
 * 解决修改更新时，附件上传组件载入已上传附件，点击任意附件的删除按钮后，只会删除第一条附件的问题。
 * 新增业务无须使用此组件，直接使用BUI官方uploader即可。
 */
define('common/uploader/UpdateUploader', ['bui/uploader'], function(r) {
	var Uploader = r('bui/uploader'),Theme = Uploader.Theme;
	Theme.addTheme('updateTheme', {//自定义附件组件的显示主题
		elCls: 'defaultTheme',
		queue:{
			//结果的模板，可以根据不同状态进进行设置
			resultTpl: {
				'default': '<div class="default">{name}</div>',
				'success': '<div class="success"><label id="{id}" class="fileLabel" title={title}>{name}</label></div>',
				'error': '<div class="error"><span class="uploader-error">{msg}</span></div>',
				'progress': '<div class="progress"><div class="bar" style="width:{loadedPercent}%"></div></div>'
			}
		}
	});
	var UpdateUploader = Uploader.Uploader.extend({
		renderUI:function() {
			var _self = this,queue = _self.get('queue'),items = _self.get('alreadyItems');
			if(items && Array.isArray(items)){
				queue.addItems(items);
			}
		},
		bindUI:function(){
			var _self = this,queue = _self.get('queue'),items = queue.getItems();
			if(items){
				items.forEach(function(item){
					queue.updateFileStatus(item,'success');
				});
			}
		},
		/**
		 * 修改时，只保存规定类型的文件
		 */
		getSucFiles:function(){
			var _self = this,queue = _self.get('queue');
			return queue.getItemsByStatus('success');
		}
	}, {
		ATTRS : {
			alreadyItems : {value : []},
			rules: {
				value : {
		            //文的类型
		            ext: ['.doc,.docx,.xls,.xlsx,.ppt,.pptx,.vsd,.pdf,.jpg,.tif,.dwg','文件类型只能为{0}'],
		            //文件大小的最小值,这个单位是kb
		            minSize: [0, '文件的大小不能小于{0}KB'],
		            //文件大小的最大值,单位也是kb
		            maxSize: [1024 * 1024, '文件大小不能大于1G']
				}
	        },
			theme : {value : 'updateTheme'}
		}
	});
	return UpdateUploader;
});