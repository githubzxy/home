
	var baseForm;
	var tips;

	BUI.use(['bui/form', 'bui/tooltip'],
			function(Form, Tooltip){
		if(tips == undefined) {
			tips = new Tooltip.Tips({
		        tip : {
		          trigger : '.x-icon-error', //出现此样式的元素显示tip
		          alignType : 'right', //默认方向
		          elCls : 'tips tips-warning tips-no-icon tip1',
		          zIndex : '2000',
		          offset : 10 //距离左边的距离
		        }
		      }).render();
		}
     	
		// 渲染BUIForm，用于表单元素验证
		baseForm = new Form.Form({
			srcNode : '#baseForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
	});

	
	$(document).ready(function() {
		initBasePage();
	});
	
	//初始化表的基础信息	
	function initBasePage(){
		$.ajax({
			type : "POST",
			url : "/kunmingrinms/qualityImproveSummaryForDuanAction/getBaseInfo.cn",
			dataType : "json",
			data : {
				"orgId" :  orgId,
				"year" :  year
			},
			success : function(response) {
				if (response.result != 1) {
					alertWarn(response.message);
				} else {
					var data = response.data;
					$("#base_year").html(year);
					$("#base_duty_user").val(data.ORG_DUTY_USER_);
				}
			},
			failure : function(res) {
				alert(res);
			}
		});
	}