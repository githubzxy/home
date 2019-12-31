<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>文件上传公共组件</title>
</head>
<body>
    <div id="J_Uploader"> </div>
</body>
<script type="text/javascript">
/*
 * 页面参数说明：
 * ${param.fileType}：”必填“		文的类型 例：.png,.jpg
 * ${param.maxNum}：”必填“			上传的最大个数 例：5
 * ${param.minSize}：”必填“		文件大小的最小值,这个单位是kb 例：10
 * ${param.maxSize}：”必填“		文件大小的最大值,单位也是kb 例：1024
 */
	var contextPath = '<%=contextPath%>';

	BUI.use('bui/uploader',function (Uploader) {
	  
	/**
	* 返回数据的格式
	*
	*  默认是 {url : 'url'},否则认为上传失败
	*  可以通过isSuccess 更改判定成功失败的结构
	*/
	var uploader = new Uploader.Uploader({
	//指定使用主题
	width: '100%', 
	render: '#J_Uploader',
	url: contextPath+ 'attachFile/upload.cn',
	queue: {
	  resultTpl:{
		  'default': '<div class="default">{name}</div>',
			'success': '<div class="success" id="{fileId}"><label class="fileLabel" href="#" title={name}>{name}</label></div>',
			'error': '<div class="error"><span title="{name}">上传失败,请确定文件无误后，点击删除，再重新上传!</span><span class="uploader-error">{msg}</span></div>',
			'progress': '<div class="progress"><div class="bar" style="width:{loadedPercent}%"></div></div>'
	  }
	},
	rules: {
	  //文的类型
	  ext: ['.doc','文件类型只能为{0}'],
	  //上传的最大个数
	  max: [10, '文件的最大个数不能超过{0}个'],
	  //文件大小的最小值,这个单位是kb
	  minSize: [10, '文件的大小不能小于{0}KB'],
	  //文件大小的最大值,单位也是kb
	  maxSize: [10000, '文件大小不能大于{0}KB']
	}
	}).render();
	
	//获取上传文件的对列
	var queue = uploader.get('queue');
	
	
	});
</script>
</html>