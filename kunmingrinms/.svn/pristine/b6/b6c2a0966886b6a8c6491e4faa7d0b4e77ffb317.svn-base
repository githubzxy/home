<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>批复附件上传</title>
</head>
<body>
	<div id="checkUploadDiv" style="overflow-y: auto;overflow-x: hidden;"></div>
</body>
<script type="text/javascript">
	/*
	* 注：引用附件上传公共组件的页面必须包含BUI的js和css
	*/
	var contextPath = '<%=contextPath%>' + '/';
	
	var checkUploadFileId="";
	var checkUploader;
	
	// 初始化页面
	$(document).ready(function () {
		$("#checkUploadDiv").css("width", "${param.width}");
		$("#checkUploadDiv").css("height", "${param.height}");
	});
	
	function setCheckUploadAttachFileId(attachFileIdParam) {
		checkUploadFileId = attachFileIdParam;
		initCheckUploadFiles();
	}
	
	function initCheckUploadFiles(){
		
	   $.ajax({
		   url: contextPath + 'attachFile/getFilesByAttachFileId.cn',
		   type: "POST",
		   dataType: "json",
		   async: false,
		   data: {
				 "attachFileId":checkUploadFileId
			},
			success: function(data){
				$("#checkUploadDiv").find("ul").append(checkUploadResult(data));
			}
	   });
	}
   
  	/**附件上传成功后的html模块，用于点击记录后回显附件
  	 * @param files 附件组
  	 * @returns {String}
  	 */
	function checkUploadResult(files){
  		var fileList = "";
  		for(var i in files){
  			fileList += 	'<li class="bui-queue-item bui-queue-item-success">'+
  			'<div class="success"><label class="checkFileLabel" id="'+files[i].path+'" title="'+files[i].name+'">'+files[i].name+'</label></div>'+ 
  			'<span class="action">'+
  			'<span class="bui-queue-item-del">删除</span>'+
  			'</span>'+
  			'</li>';
  		}
  		return fileList;
	}
  	 
  	BUI.use(['bui/uploader'], function(Uploader){
		Uploader.Theme.addTheme('uploadView', {//自定义附件组件的显示主题
			elCls: 'defaultTheme',
			queue:{
				//结果的模板，可以根据不同状态进进行设置
				resultTpl: {
					'default': '<div class="default">{name}</div>',
					'success': '<div class="success"><label class="checkFileLabel" href="#" title={name}>{name}</label></div>',
					'error': '<div class="error"><span title="{name}">上传失败,请确保文件是非空文件后，点击删除，再重新上传!</span><span class="uploader-error">{msg}</span></div>',
					'progress': '<div class="progress"><div class="bar" style="width:{loadedPercent}%"></div></div>'
				}
			}
		});
		//上传文件
	   checkUploader = new Uploader.Uploader({
	        render: '#checkUploadDiv',
	        theme : 'uploadView', //使用自定义主题
	        url: contextPath + 'attachFile/upload.cn',
	        isSuccess: function(result){
				return true;
	        }
	    }).render();
	});
</script>

</html>