/**
 * 用于业务详情中已上传附件的展示和下载。
 */
define('common/uploader/ViewUploader', ['bui/uploader'], function(r) {
	var Uploader = r('bui/uploader');
	var ViewUploader = Uploader.Queue.extend({
		renderUI:function () {
			var _self = this,items = _self.get('alreadyItems');
			if(items && Array.isArray(items)){
				items.map(function(item){
					var name = item.name.replace("#","%23");
					//item.name = name;
//					item.previewUrl =_self.get('previewUrl');
					item.previewUrl = _self._initFileFormatPath();
					item.filePath=item.path;
					item.path = contextPath +_self.get('servlet')+'?fileName=' +encodeURI(encodeURI(name)) + '&filePath=' + item.path;
				});
				_self.addItems(items);
			}
			
		},
		bindUI:function(){
			var _self = this,items = _self.getItems(),previewUrl = _self.get('previewUrl');
			if(items){
				items.forEach(function(item){
					_self.updateFileStatus(item,'successPreview');
					if(!previewUrl){
						_self.updateFileStatus(item,'success');
					}
				});
			}
		},
		_initFileFormatPath:function() {
			var u = "";
			   $.ajax({
			        url: contextPath + "/configFile/url.xml",
			        type: 'GET',
			        dataType: 'xml',
			        async: false,
			        success: function(xml) {
			        	u = $(xml).find("content").last().text();
			        }
			    });
			   return u;
		   },
	}, {
		ATTRS : {
			alreadyItems : {value : []},
			itemTpl: {
		        value: '<li>{resultTpl} </li>'
			},
			servlet:{value:''},//传入下载路径的servlet
			resultTpl: {
				value: {
					'success': '<div class="success"><label id="{id}" class="fileLabel" title={title}>{name}</label><span style="float: right;"><a href="{path}">下载</a></span></div>',
					'successPreview': '<div class="success"><label id="{id}" class="fileLabel" title={title}>{name}</label><span style="float: right;"><a href="{path}">下载</a>&nbsp;'
//						'<a href="{previewUrl}?filePath={filePath}" target="_blank">预览</a></span></div>'	
// 					'<a href="{previewUrl}?fileName={filePath}" target="_blank">预览</a></span></div>'
				}
			},
			previewUrl : {value : ''}
		}
	});
	return ViewUploader;
});