<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>回复附件下载_预览</title>
<style type="text/css">
	.replyAttachFileDiv {
		font-size: 12px;
/* 		border: 1px solid gray; */
		overflow-y: auto;
		overflow-x: hidden;
/* 		height : 80px; */
		position:relative;
	}
	
	.replyAttachFileSpan {
		position: absolute;
		right: 10px;
	}
	
	.replyAttachFileSpan a {
		color:#1e5494;
	}
</style>
</head>
<body>
	<div  class="replyAttachFileDiv"></div>
</body>

<script type="text/javascript">

   var contextPath = '<%=contextPath%>' + '/';
   
   var replyDownLoadFileId="";
   // 文件转换路径
   var replyFileFormatPath = "";
   
	// 初始化页面
	$(document).ready(function () {
		$(".replyAttachFileDiv").css("width", "${param.width}");
		$(".replyAttachFileDiv").css("height", "${param.height}");
	});
   
   function setReplyAttachFileId(attachFileIdParam) {
	   replyDownLoadFileId = attachFileIdParam;
	   initReplyFileFormatPath();
	   initReplyDownLoadFiles();
	}
   
   function initReplyFileFormatPath() {
	   $.ajax({
	        url: contextPath + "/configFile/url.xml",
	        type: 'GET',
	        dataType: 'xml',
	        async: false,
	        success: function(xml) {
	        	replyFileFormatPath = $(xml).find("content").last().text();
	        }
	    });
   }
   
   function initReplyDownLoadFiles(){
	   
	   $.ajax({
		   url: contextPath + 'attachFile/getFilesByAttachFileId.cn',
		   type: "POST",
		   dataType: "json",
		   async: false,
		   data: {
				 "attachFileId":replyDownLoadFileId
			},
			success: function(response){
				
				var content = "";
				
				$.each(response,function(i,item){
					
					content += "<span>" + item.name
									+ "	<span class='replyAttachFileSpan'>"
									+ "		<a href='/kunmingrinms/DownloadFileServlet?fileName="+item.name+"&filePath="+item.path+"'>下载</a>"
// 									+ "		<a href='"+ replyFileFormatPath +"?fileName=" + item.path + "' target='_blank'>预览</a>"
									+ "	</span>"
									+ "</span>"
									+ "<p></p>";
					$(".replyAttachFileDiv").html(content);
				});
			 }
	   });
   }
</script>

</html>