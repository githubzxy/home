<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>附件下载_预览</title>
<style type="text/css">
	.checkAttachFileDiv {
		font-size: 12px;
/* 		border: 1px solid gray; */
		overflow-y: auto;
		overflow-x: hidden;
/* 		height : 80px; */
		position:relative;
	}
	
	.checkAttachFileSpan {
		float: right;
	}
	
	.checkAttachFileSpan a {
		color:#1e5494;
	}
</style>
</head>
<body>
	<div  class="checkAttachFileDiv"></div>
</body>

<script type="text/javascript">

   var contextPath = '<%=contextPath%>' + '/';
   
   var checkDownLoadFileId="";
   // 文件转换路径
   var checkFileFormatPath = "";
   
	// 初始化页面
	$(document).ready(function () {
		$(".checkAttachFileDiv").css("width", "${param.width}");
		$(".checkAttachFileDiv").css("height", "${param.height}");
	});
   
   function setCheckAttachFileId(attachFileIdParam) {
	   checkDownLoadFileId = attachFileIdParam;
	   initCheckFileFormatPath();
	   initCheckDownLoadFiles();
	}
   
   function initCheckFileFormatPath() {
	   $.ajax({
	        url: contextPath + "configFile/url.xml",
	        type: 'GET',
	        dataType: 'xml',
	        async: false,
	        success: function(xml) {
	        	checkFileFormatPath = $(xml).find("content").last().text();
	        }
	    });
   }
   
   function initCheckDownLoadFiles(){
	   
	   $.ajax({
		   url: contextPath + 'attachFile/getFilesByAttachFileId.cn',
		   type: "POST",
		   dataType: "json",
		   async: false,
		   data: {
				 "attachFileId":checkDownLoadFileId
			},
			success: function(response){
				
				var content = "";
				
				$.each(response,function(i,item){
					var name = (item.name).replace(new RegExp("#","gm"),"%23");
					content += "<div><span>" + name + "</span>"
									+ "<span class='checkAttachFileSpan'>"
									+ "	<a href='/kunmingrinms/DownloadFileServlet?fileName="+name+"&filePath="+item.path+"'>下载</a>"
									// + "	<a href='"+ checkFileFormatPath +"?fileName=" + item.path + "' target='_blank'>预览</a>"
									+ "</span>"
									+ "</div><p></p>";
					$(".checkAttachFileDiv").html(content);
				});
			 }
	   });
   }
</script>

</html>