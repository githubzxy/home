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
	.workOrderDiv {
		font-size: 12px;
/* 		border: 1px solid gray; */
		overflow-y: auto;
		overflow-x: hidden;
/* 		height : 80px; */
		position:relative;
	}
	
	.workOrderSpan {
		float: right;
	}
	
	.workOrderSpan a {
		color:#1e5494;
	}
</style>
</head>
<body>
	<div  class="workOrderDiv"></div>
</body>

<script type="text/javascript">

   var contextPath = '<%=contextPath%>' + '/';
   
   var workOrderFileId="";
   // 文件转换路径
   var fileFormatPath = "";
   
	// 初始化页面
	$(document).ready(function () {
		$(".workOrderDiv").css("width", "${param.width}");
		$(".workOrderDiv").css("height", "${param.height}");
	});
   
   function setWorkOrderFileId(workOrderIdParam,idChooser) {
	   workOrderFileId = workOrderIdParam;
	   initFileFormatPath();
	   initWorkOrderFiles(idChooser);
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
   
   function initWorkOrderFiles(idChooser){
	   
	   $.ajax({
		   url: contextPath + 'attachFile/getFilesByAttachFileId.cn',
		   type: "POST",
		   dataType: "json",
		   async: false,
		   data: {
				 "attachFileId":workOrderFileId
			},
			success: function(response){
				
				var content = "";
				
				$.each(response,function(i,item){
					var name = (item.name).replace(new RegExp("#","gm"),"%23");
					content += "<div><span>" + item.name + "</span>"
									+ "<span class='workOrderSpan'>"
									+ "	<a href='/kunmingrinms/DownloadFileServlet?fileName="+name+"&filePath="+item.path+"'>下载</a>"
									// + "	<a href='"+ fileFormatPath +"?fileName=" + item.path + "' target='_blank'>预览</a>"
									+ "</span>"
									+ "</div><p></p>";
					if(idChooser){
						$(idChooser + " .workOrderDiv").html(content);
					}else{
						$(".workOrderDiv").html(content);
					}
				});
			 }
	   });
   }
</script>

</html>