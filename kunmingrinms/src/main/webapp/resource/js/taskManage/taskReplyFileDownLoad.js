
function taskReplyFileDownload(id, timeNow){
	// 获取回复附件打包
	$.ajax({
		url : contextPath + "taskRootZipFileAction/taskReplyFilesToZip.cn",
		type : "post",
		data:{
			parentId : id
		},
		success : function(data){
			var url=data;
			if(data == "0"){
				tooltip("无附件下载！");
			}else{
				// 回复附件打包下载
				window.location.href = '/kunmingrinms/DownloadFileServlet?fileName=任务回复附件_'+timeNow+'.zip&filePath='+url;
				$(".bui-ext-mask").removeClass("userMask");
			}
		},
		dataType:"text"
	});
}

//弹出框提示
function tooltip(msg){
	BUI.Message.Show({
		msg : msg,
		closeable : false,
		buttons : [
	            {
	              text : '确定',
	              elCls : 'button',
	              handler : function(){
	            	$(".bui-ext-mask").removeClass("userMask");
					this.close();
				}
	        }]
	    });
	}

