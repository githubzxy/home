/**
 * 初始化界面
 */
$(document).ready(function() {
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	grid.set('height',windownHeight - searchHeight - 45);
	initManagerCbo();
	initPage();
});

/**
 * 初始化页面
 */
function initPage(){
	//发异步请求
	 $.post(
				contextPath + "innerRequestCommon/getInnerRequestBaseById.cn", 
				{
					selectedId: selectedId, 
				},
				function(data){
					$("#report_workShopReportDate").text(data.workShopReportDate != null ? data.workShopReportDate : "");
					$("#report_workShopReportUser").text(data.workShopReportUser != null ? data.workShopReportUser.name : "");
					$("#report_emergencyLV").text(getNameByEmergencyLV(data.emergencyLV));
					$("#report_problemNature").text(getNameByProblemNature(data.problemNature));
					$("#report_title").text(data.title);
					$("#report_content").html(formateTextArea(data.content));
					
					if(innerRequestBase.attachFile != null){
						setAttachFileId(data.attachFile.id);
					}
				},
				"json"
		);
}

/**
 * 初始化管理员下拉框
 */
function initManagerCbo(){
	//发起一个异步请求
	$.post(contextPath + 'innerRequestCommon/getManagerByRole.cn',
			{
			},function(data,status){
				if(status){
					for(var i = 0; i < data.length;i++){
						$("#report_ManagerCbo").append("<option value='"+ data[i].id +"'>"
								+ data[i].name +"</option>");
					}
				}else{
					commonFailure();
				}
			},"json");	
}

