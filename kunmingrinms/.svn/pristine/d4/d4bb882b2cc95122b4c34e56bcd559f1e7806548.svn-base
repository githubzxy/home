<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>附件下载_预览公共组件</title>
<style type="text/css">
	.attachFileDiv {
		font-size: 12px;
/* 		border: 1px solid gray; */
		overflow-y: auto;
		overflow-x: hidden;
/* 		height : 80px; */
		position:relative;
	}
	
	.attachFileSpan {
		float: right;
	}
	
	.attachFileSpan a {
		color:#1e5494;
	}
	
</style>
</head>
<body>
	<div  class="attachFileDiv"></div>
</body>

<script type="text/javascript">

   var contextPath = '<%=contextPath%>' + '/';
   
   var downLoadFileId="";
   // 文件转换路径
   var fileFormatPath = "";
   
	// 初始化页面
	$(document).ready(function () {
		$(".attachFileDiv").css("width", "${param.width}");
		$(".attachFileDiv").css("height", "${param.height}");
	});
   
   function setAttachFileId(attachFileIdParam,idChooser) {
	   downLoadFileId = attachFileIdParam;
	   initFileFormatPath();
	   initDownLoadFiles(idChooser);
	}
   
   function initFileFormatPath() {
	   $.ajax({
	        url: contextPath + "/configFile/url.xml",
	        type: 'GET',
	        dataType: 'xml',
	        async: false,
	        success: function(xml) {
	        	fileFormatPath = $(xml).find("content").last().text();
	        }
	    });
   }
   
   function initDownLoadFiles(idChooser){
	   var ids = downLoadFileId.split(',');
	   var url;
	   if(ids.length > 1){
		   url = contextPath + 'attachFile/getFilesByAttachFileIds.cn';
	   }else{
		   url = contextPath + 'attachFile/getFilesByAttachFileId.cn';
	   }
	   $.ajax({
		   url: url,
		   type: "POST",
		   dataType: "json",
		   async: false,
		   data: {
				 "attachFileId":downLoadFileId
			},
			success: function(response){
				var content = "";
				$.each(response,function(i,item){
					content += "<div><span>" + item.name + "</span>"
									+ "<span class='attachFileSpan'>";
									
					if(item.path.indexOf('1501217398126') != -1 
							|| item.path.indexOf('1501220842455') != -1
							|| item.path.indexOf('1501223958022') != -1
							|| item.path.indexOf('1501227005153') != -1
							|| item.path.indexOf('1501247125857') != -1
							|| item.path.indexOf('1501248032560') != -1
							|| item.path.indexOf('1501249761350') != -1){
					    content += "	<a href='/kunmingrinms/files/"+item.path+"' download='video'>下载</a>";
					}else{
						var name = (item.name).replace(new RegExp("#","gm"),"%23");
					    content += "	<a href='/kunmingrinms/DownloadFileServlet?fileName="+name+"&filePath="+item.path+"'>下载</a>";
					}
					// content += "	<a href='"+ fileFormatPath +"?fileName=" + item.path + "' target='_blank'>预览</a>"
                    content += "</span></div>";
					if(idChooser){
						$(idChooser + " .attachFileDiv").html(content);
					}else{
						$(".attachFileDiv").html(content);
					}
				});
			 }
	   });
   }
   
</script>

</html>