/**
 * 获取所有单位
 */
function getUnitData(){
	var units = null;
	$.ajax({
		url : contextPath + "deviceUnitConfigAction/getUnits.cn",
		type : "post",
		dataType : "json",
		async : false,
		success : function(data,status){
			if(status){
				units = data;
			}
		}
	});
	return units;
};
/**
 * 获取没被删除的单位
 */
function getExistUnitData(){
	var units = null;
	$.ajax({
		url : contextPath + "deviceUnitConfigAction/getExistUnits.cn",
		type : "post",
		dataType : "json",
		async : false,
		success : function(data,status){
			if(status){
				units = data;
			}
		}
	});
	return units;
};