/**
 * 初始化界面
 */
$(document).ready(function() {
	var windownHeight = $(window).height();
	var searchHeight = $('#searchForm').height();
	grid.set('height',windownHeight - searchHeight - 45);
	initEmergencyLVCbo('add_emergencyLV','edit');
	initProblemNatureCbo('add_problemNature','edit');
});


// 车间新增表单
var validateFrom;

BUI.use(['bui/calendar', 'bui/form', 'bui/tooltip','bui/uploader'],function (Calendar, Form, Tooltip,Uploader) {
	
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
	workShopAddFrom = new Form.Form({
		srcNode : '#workShopAddFrom',
		errorTpl:'<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>',
	}).render();
	
	
});