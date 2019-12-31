/**
 * 弹出警告
 * 
 * @param message
 * @return
 */
function alertWarn(message){
	jQuery.messager.alert('提示:',message,'warning');
}
/**
 * 顶部弹出消息
 */
function alertMessage1(message){
    $.messager.show({
//        title:'提醒',
        msg:message,
        showType:'slide',
        style:{
        	position:'absolute',
            right:'',
            top:document.body.scrollTop+document.documentElement.scrollTop,
            bottom:''
        }
    });
}
/**
* 弹出消息
*/
function alertMessage(message){
	if($(".top_message").length==0){
		$("body").prepend("<div class='top_message' ></div>");
		$(".top_message").text(message);
		$(".top_message").smartFloat();  
		$(".top_message").animate({ height: 'hide'}, 2000);
	}else{
		$(".top_message").remove();
		$("body").prepend("<div class='top_message' ></div>");
		$(".top_message").smartFloat();  
		$(".top_message").text(message);
		$(".top_message").animate({ height: 'hide'}, 2000);
	}
}
$.fn.smartFloat = function() {  
    var position = function(element) {  
        var top = element.position().top, pos = element.css("position");  
        var scrolls = $(this).scrollTop();  
        element.css({top: scrolls});  
        $(window).scroll(function() {  
        	var scrolls = $(this).scrollTop();  
            if (scrolls > top) {  
                if (window.XMLHttpRequest) {  
                    element.css({  
                        position: "fixed",  
                        top: 0  
                    });  
                } else {  
                    element.css({  
                        top: scrolls  
                    });  
                }  
            } else {  
                element.css({  
                    position: "", //absolute  
                    top: top  
                });  
            }  
        });  
    };  
    return $(this).each(function() {  
        position($(this));  
    });  
};
///**
// * 弹出消息
// */
//function alertMessage(message){
//	jQuery.messager.alert('提示:',message);
//}

/**
 * 时间转换成字符串
 */
function comm_timestmp(cellvalue){
	var year = cellvalue.year;
	var month = cellvalue.month+1;
	if(month<10){
		month = "0"+month;
	}
	var day = cellvalue.dayOfMonth;
	if(day<10){
		day = "0"+day;
	}
	var hourOfDay = cellvalue.hourOfDay;
	if(hourOfDay<10){
		hourOfDay = "0"+hourOfDay;
	}
	var minute = cellvalue.minute;
	if(minute<10){
		minute = "0"+minute;
	}
	var second = cellvalue.second;
	if(second<10){
		second = "0"+second;
	}
	return year+"-"+month+"-"+day+" "+hourOfDay+":"+minute+":"+second;
}

/**
 * 状态转换
 */
function comm_status(cellvalue){
	if(cellvalue=="0"){
		return "<font color='#7BB570'><b>启用</b></font>";
	}else if(cellvalue=="1"){
		return "<font color='#FF0042'><b>停用</b></font>";
	}else if(cellvalue=="9"){
		return "<font color='#FF0042'><b>失效</b></font>";
	}else if(cellvalue=="99"){
		return "<font color='#FF0042'><b>注销</b></font>";
	}
}
/**
 * 合格不合格转换
 */
function fit_status(cellvalue){
	if(cellvalue=="1"){
		return "<font color='#000000'><b>合格</b></font>";
	}else if(cellvalue=="0"){
		return "<font color='#FF0000'><b>不合格</b></font>";
	}else if(cellvalue==""||cellvalue==null){
		return "-";
	}
}

/**
 * 以iframe body为父级，按比例返回像素
 */
function getWidth(percent){  
    return parseInt($("body").css("width")) * percent ; 
}


function getHeight(){
	return $(window).height(); 
}

/**
 * 上传部分JS
 */
function fileSelected() {
        var filePath = $('#fileToUpload').val();
        var file_typename = filePath.substring(filePath.lastIndexOf('.'), filePath.length);
    
//        if (file_typename == '.doc'||file_typename == '.pdf') {// 这里限定上传文件文件类型
            if (filePath) {
				$("#fileTips").hide();
	            $("#uploadFile").show();
            }
//        } else {
//            $("#uploadFile").hide();
//            $('#fileTips').html("<span style='color:Red'>错误提示:上传文件应该是.doc.pdf后缀而不应该是" + file_typename + ",请重新选择文件</span>");
//			$("#fileTips").show();
//        }
}

function uploadFile() {
        $.ajaxFileUpload({  
            // 处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
            url:'uploadFile.htm',  
            secureuri:false,                           // 是否启用安全提交,默认为false
            fileElementId:'fileToUpload',               // 文件选择框的id属性
            dataType:'json',                           // 服务器返回的格式,可以是json或xml等
            success:function(response,status){
				if(response.result!=1){
					alertWarn(response.message);
				}else{
					var list=response.file;
					alertWarn("上传成功");
					$.each(list,function(i,file){
						//下载图标
						var a="<a href='#' id='download_file_a_"+file.id+"' onclick='download_file("+file.id+")'>"+file.name+"</a>"+
						"<a id='delete_file_a_"+file.id+"' onclick='delete_file("+file.id+")'><img src='images/delete.gif' style='padding-top:10px'/></a><br/>";
						$("#download_file_span").append(a);
						//下载数据
						if($("#download_file_ids").val()!="")
							$("#download_file_ids").val($("#download_file_ids").val()+","+file.id);
						else
							$("#download_file_ids").val(file.id);
					});
					$("#uploadFile").hide();
				}
			},  
            error:function(data, status, e){ // 服务器响应失败时的处理函数
                $('#fileTips').html("<span style='color:Red'>上传失败，请重试！！</span>");  
            }  
        });  
}
function download_file(id) {
	location.href = "downloadFile.htm?id="+id;
}
function delete_file(id){
	$("#download_file_a_"+id).remove();
	$("#delete_file_a_"+id).remove();
	var ids=$("#download_file_ids").val().split(",");
	var returnIds="";
	 for (i=0;i<ids.length ;i++ )    {
		 if(ids[i]!=id){
			if(returnIds!="")
				 returnIds+=","+ids[i];
			else
				 returnIds=ids[i];
		 }
	 }
	 $("#download_file_ids").val(returnIds);
}

/**
 *  只判空
 */ 
function formatNullData(s) {
	if(s==undefined || s=="undefined"){
		return "-";
	}
	if (s == null  || s=="null"){
		return "-";
	}
	return s;
}

/**
 * 小数+判空
 */ 
function formatDecimalData(s) {
	if(s==undefined || s=="undefined"){
		return "-";
	}
	
//	if (/(-?\\d+)(\\.\\d+)?$/.test(s)){
//		return "0.00";
//	}

	if (s == null  || s=="null"){
		return "-";
	}
//	if(/^((-\d+)|(0+))$/.test(s)){//负整数时，在后面加上.00,补充位数
//		s = s+".00";
//	}
//	s = s.toString().replace(/^(\d*)$/, "$1.");
//	s = (s + "00").replace(/(\d*\.\d\d)\d*/, "$1");
//	s = s.replace(".", ",");
//	var re = /(\d)(\d{3},)/;
//	while (re.test(s))
//		s = s.replace(re, "$1,$2");
//	s = s.replace(/,(\d\d)$/, ".$1");
	return s;
}


/**
 *  小数+判空+百分号
 */ 
function formatPercentData(s) {
	if(s==undefined || s=="undefined"){
		return "-";
	}
	
//	if (/(-?\\d+)(\\.\\d+)?$/.test(s)){
//		return "0.00";
//	}

	if (s == null  || s=="null"){
		return "-";
	}
//	if(/^((-\d+)|(0+))$/.test(s)){//负整数时，在后面加上.00,补充位数
//		s = s+".00";
//	}
//	s = s.toString().replace(/^(\d*)$/, "$1.");
//	s = (s + "00").replace(/(\d*\.\d\d)\d*/, "$1");
//	s = s.replace(".", ",");
//	var re = /(\d)(\d{3},)/;
//	while (re.test(s))
//		s = s.replace(re, "$1,$2");
//	s = s.replace(/,(\d\d)$/, ".$1");
//	s = s+"%";
	return s;
}
String.prototype.replaceAll=function (AFindText,ARepText){ 
	raRegExp=new RegExp(AFindText,"g");return this.replace(raRegExp,ARepText); 
	} ;
function formatBRData(s){
	if(s==undefined || s=="undefined"){
		return "-";
	}
	if (s == null  || s=="null"){
		return "-";
	}
	var temp = s.replace(/,/g,"<br/>");
	return temp;
}
