$(document).ready(function(){
	// 打开一级菜单（第三个生产管理）
	$(".firstFuncButton :eq(2)").click();
	// 打开二级菜单（第二个日交班信息管理）
	$(".subNav :eq(1)").click();
	// 打开部门值班管理（延迟1.5秒）
	setTimeout(openIndex,1.5*1000);
});

function openIndex() {
	//因为部门值班管理菜单在该列表中排在第7位（序号是从0开始排的）
	$('.leftFuction :contains("值班管理")').click();
}