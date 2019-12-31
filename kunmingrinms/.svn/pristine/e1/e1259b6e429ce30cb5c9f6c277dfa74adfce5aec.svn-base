//源对象
var updateSource;

BUI.use(['bui/uploader', 'bui/form', 'bui/tooltip'],function (Uploader , Form , Tooltip) {
	var uploader = new Uploader.Uploader({
		render: '#update_Uploader',//一个div
		theme : 'fileView', //使用自定义主题
		url: contextPath+ 'attachFile/upload.cn',
		//根据业务需求来判断上传是否成功，这里返回一个boolean
		isSuccess: function(result){
			if(result && result.success){
				return true;
			}
			return false;
		}
	}).render();
	//验证
	var tips = new Tooltip.Tips({
        tip : {
          trigger : '.x-icon-error', //出现此样式的元素显示tip
          alignType : 'right', //默认方向
          elCls : 'tips tips-warning tips-no-icon tip1',
          zIndex : '2000',
          offset : 10 //距离左边的距离
        }
      }).render();
 	
	// 渲染BUI Form，用于表单元素验证
	workShopUpdateFrom = new Form.Form({
		srcNode : '#workShopUpdateFrom',
		errorTpl:'<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>',
	}).render();
	
	initPage();
});

function initPage() {
	$.post(contextPath + 'workShopRequestAction/getById.cn',
			{
				selectedId : selectedId
			},function(data,status){
				updateSource = data;//json转对象
				initEmergencyLVCbo('update_emergencyLV','edit');
				initProblemNatureCbo('update_problemNature','edit');
				$("#update_title").val(updateSource.title);
				$("#update_contnet").val(updateSource.content);
				$("#update_emergencyLV").val(updateSource.emergencyLV);
				$("#update_problemNature").val(updateSource.problemNature);
				if(updateSource.attachFile != null){
					setUploadAttachFileId(updateSource.attachFile.id);
				}
			},
			'json');
}